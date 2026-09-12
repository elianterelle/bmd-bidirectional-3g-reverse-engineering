`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Module Name: rx
//
// 3G-SDI receive channel (GTPE2_CHANNEL, RX only) with a self-contained
// hardware eye-scan sequencer.
//
// Intended placement is GTPE2_CHANNEL_X0Y3 (MGTPRXP3/N3, fed by the LMH0324).
// The TX side of this channel is powered down; SDI transmit lives on the
// separate channel-0 instance in top.v. Both share the single GTPE2_COMMON in
// the quad, so this module takes PLL0/PLL1 clocks in rather than owning a PLL.
//
// Eye scan is self-referencing: the offset sampler is compared against the
// recovered data from the centre sampler, so no PRBS or known pattern is
// required and the scan runs on live scrambled/NRZI SDI.
//
// Results leave the module one point at a time on the es_point_* bus with a
// one-cycle es_point_valid strobe. Attach an ILA in top.v with capture control
// enabled and the capture condition set to es_point_valid, so each stored ILA
// sample is exactly one eye point and the buffer holds the whole raster.
//
// All DRP addresses, bit positions and encodings below are taken from
// UG482 (v1.9) Table D-2 (GTPE2_CHANNEL DRP map), Table 4-21 (eye scan
// read-only registers) and Table 4-20 (RX margin analysis attributes).
// Note the read-only status addresses are GTP specific and differ from the
// equivalent GTX registers.
//////////////////////////////////////////////////////////////////////////////////

module rx #(
    // ---- Eye scan DRP address map, UG482 Table D-2 and Table 4-21 ----------
    parameter [8:0]  ADDR_ES_QUAL_MASK_0  = 9'h031, // 0x031..0x035, 80 bits
    parameter [8:0]  ADDR_ES_SDATA_MASK_0 = 9'h036, // 0x036..0x03A, 80 bits
    parameter [8:0]  ADDR_ES_PRESCALE     = 9'h03B, // [15:11] prescale, [8:0] vert offset
    parameter [8:0]  ADDR_ES_HORZ_OFFSET  = 9'h03C, // [11:0]  horz offset
    parameter [8:0]  ADDR_ES_CONTROL      = 9'h03D, // [5:0] control, [8] scan_en, [9] errdet_en
    parameter [8:0]  ADDR_ES_ERROR_COUNT  = 9'h151, // R, es_error_count[15:0]
    parameter [8:0]  ADDR_ES_SAMPLE_COUNT = 9'h152, // R, es_sample_count[15:0]
    parameter [8:0]  ADDR_ES_CTRL_STATUS  = 9'h153, // R, [0] done, [3:1] state

    // ---- Sweep definition --------------------------------------------------
    // ES_HORZ_OFFSET[10:0] is a two's complement phase offset with the eye
    // centre at 0 for all data rates. UG482 Table 4-20 gives +/-32 = +/-0.5 UI
    // at full rate and +/-64 at half rate.
    //
    // +/-32 is the usable limit here, established empirically: two runs at
    // +/-64 (one after a fresh reprogram with the cable untouched) returned a
    // saturated ~50% error rate at EVERY point including code 000, with zero
    // error-free cells in 1419. Two runs at +/-32 gave a clean scan with 545
    // error-free cells and a symmetric vertical profile. Writing out-of-range
    // phase codes appears to disturb the receiver globally, not just at the
    // offending points, and it does not recover within the sweep.
    // Do not raise this without re-testing that (0,0) still reads err==0.
    parameter integer HORZ_SPAN    = 32,
    parameter integer HORZ_STEP    = 2,   // -> 33 columns, -32 .. +32
    // ES_VERT_OFFSET is sign-magnitude: [6:0] magnitude, [7] sign (1 = neg),
    // so the magnitude maxes out at 127. A +/-96 sweep clipped both edges of
    // the eye; +/-126 is the largest span that stays symmetric on a step of 6.
    parameter integer VERT_SPAN    = 126, // max 127
    parameter integer VERT_STEP    = 6,   // -> 43 rows, -126 .. +126
    // Raster is 33 x 43 = 1419 points, inside the 2048-deep ila_eye buffer.

    // Accumulation depth per point. Bits per point is roughly
    //   ES_SAMPLE_COUNT_target * 2^(1+PRESCALE) * RX_DATA_WIDTH
    // Larger prescale = lower BER floor but proportionally longer scans.
    parameter [4:0]  ES_PRESCALE_VAL = 5'd4,

    // 80-bit ES_SDATA_MASK. A 1 masks the bit OUT of the comparison. For the
    // statistical eye view at 20-bit width UG482 Table 4-20 gives
    //   ES_SDATA_MASK = (40'b1, 20'b0, 20'b1)
    // i.e. the current-cycle data sits in [39:20], not [19:0]. Bits [79:40]
    // are the previous cycle and are masked off for a statistical eye.
    parameter [79:0] ES_SDATA_MASK_VAL = 80'hFFFFFFFFFF00000FFFFF,
    // 80-bit ES_QUAL_MASK. All ones masks every bit out of the qualifier, so
    // no pattern qualification is applied and every sample counts. This is
    // what lets the scan run on arbitrary scrambled SDI rather than a PRBS.
    parameter [79:0] ES_QUAL_MASK_VAL  = 80'hFFFFFFFFFFFFFFFFFFFF,

    // Set to 0 only if you deliberately want to drop the mandatory production
    // silicon GTRXRESET workaround. When 1, gtwizard_0_gtrxreset_seq.v must be
    // added to the project from the Transceiver Wizard example design.
    parameter         USE_RXRESET_SEQ = 1,

    // Instantiate the ila_eye results buffer. Set to 0 to build without it
    // (for simulation, or to drive es_point_* somewhere else).
    parameter         USE_ILA = 1,

    parameter         GT_SIM_GTRESET_SPEEDUP = "FALSE"
)(
    // Free-running fabric clock. Also drives DRPCLK and the eye scan engine,
    // so the ILA that captures the results must run on this clock.
    input  wire         drpclk,
    input  wire         reset,          // active high, synchronous to drpclk

    // From the GTPE2_COMMON instance in top.v
    input  wire         pll0clk,
    input  wire         pll0refclk,
    input  wire         pll1clk,
    input  wire         pll1refclk,
    input  wire         pll_lock,       // PLL0LOCK

    // Serial input, MGTPRXP3/N3
    input  wire         gtprxp,
    input  wire         gtprxn,

    // Recovered data, on rxusrclk2
    output wire         rxusrclk2,
    output wire [19:0]  rxdata,

    // RX bring-up status. There is deliberately no CDR lock output: UG482
    // lists RXCDRLOCK as Reserved on GTP, so rx_reset_done is the meaningful
    // indicator that the receiver is up.
    output wire         rx_reset_done,

    // Eye scan control
    input  wire         scan_start,     // pulse to (re)start a sweep
    output wire         scan_busy,
    output reg          scan_done,

    // Eye scan results, one point per es_point_valid pulse
    output reg          es_point_valid,
    output reg  [15:0]  es_point_index,
    output reg  [15:0]  es_error_count,
    output reg  [15:0]  es_sample_count,
    output reg  [11:0]  es_horz_offset,
    output reg  [8:0]   es_vert_offset
);

    //=========================================================================
    // Clocking
    //=========================================================================
    // RXOUT_DIV=2 with a 20-bit datapath puts RXOUTCLK at 148.5 MHz for a
    // 2.97 Gb/s line rate. RXUSRCLK2 == RXUSRCLK in 20-bit mode.
    wire rxoutclk;
    wire rxusrclk;

    BUFG bufg_rxoutclk (
        .I (rxoutclk),
        .O (rxusrclk)
    );

    assign rxusrclk2 = rxusrclk;

    //=========================================================================
    // RX reset sequencer
    //=========================================================================
    // UG482 RX initialisation: hold GTRXRESET until the PLL is locked, release
    // it, wait for RXPMARESETDONE so RXOUTCLK is running, let the BUFG output
    // settle, then assert RXUSERRDY and wait for RXRESETDONE.
    localparam RS_WAIT_PLL   = 3'd0;
    localparam RS_ASSERT     = 3'd1;
    localparam RS_WAIT_PMA   = 3'd2;
    localparam RS_WAIT_CLK   = 3'd3;
    localparam RS_WAIT_DONE  = 3'd4;
    localparam RS_DONE       = 3'd5;

    reg  [2:0]  rst_state     = RS_WAIT_PLL;
    reg  [9:0]  rst_counter   = 10'd0;
    reg         gtrxreset_r   = 1'b1;
    reg         rxuserrdy_r   = 1'b0;

    wire        rxpmaresetdone;
    wire        rxresetdone;
    wire        drp_busy;

    always @(posedge drpclk) begin
        if (reset) begin
            rst_state   <= RS_WAIT_PLL;
            rst_counter <= 10'd0;
            gtrxreset_r <= 1'b1;
            rxuserrdy_r <= 1'b0;
        end else begin
            case (rst_state)
                RS_WAIT_PLL: begin
                    gtrxreset_r <= 1'b1;
                    rxuserrdy_r <= 1'b0;
                    rst_counter <= 10'd0;
                    if (pll_lock) rst_state <= RS_ASSERT;
                end
                // Hold GTRXRESET a while so the soft-fix sequencer sees it.
                RS_ASSERT: begin
                    rst_counter <= rst_counter + 1'b1;
                    if (rst_counter == 10'd511) begin
                        gtrxreset_r <= 1'b0;
                        rst_counter <= 10'd0;
                        rst_state   <= RS_WAIT_PMA;
                    end
                end
                RS_WAIT_PMA: begin
                    if (rxpmaresetdone && !drp_busy) begin
                        rst_counter <= 10'd0;
                        rst_state   <= RS_WAIT_CLK;
                    end
                end
                // Let RXOUTCLK / the BUFG settle before declaring user ready.
                RS_WAIT_CLK: begin
                    rst_counter <= rst_counter + 1'b1;
                    if (rst_counter == 10'd511) begin
                        rxuserrdy_r <= 1'b1;
                        rst_state   <= RS_WAIT_DONE;
                    end
                end
                RS_WAIT_DONE: begin
                    if (rxresetdone) rst_state <= RS_DONE;
                end
                RS_DONE: begin
                    if (!pll_lock) rst_state <= RS_WAIT_PLL;
                end
                default: rst_state <= RS_WAIT_PLL;
            endcase
        end
    end

    assign rx_reset_done = (rst_state == RS_DONE);

    //=========================================================================
    // DRP arbitration
    //=========================================================================
    // The production silicon GTRXRESET workaround owns the DRP until it
    // reports done; the eye scan engine takes it afterwards.
    wire        drp_op_done;
    wire        gtrxreset_gt;

    wire        drpen_seq;
    wire [8:0]  drpaddr_seq;
    wire        drpwe_seq;
    wire [15:0] drpdi_seq;

    reg         drpen_es   = 1'b0;
    reg  [8:0]  drpaddr_es = 9'd0;
    reg         drpwe_es   = 1'b0;
    reg  [15:0] drpdi_es   = 16'd0;

    wire [15:0] drpdo_gt;
    wire        drprdy_gt;

    wire        drpen_gt   = !drp_op_done ? drpen_seq   : drpen_es;
    wire [8:0]  drpaddr_gt = !drp_op_done ? drpaddr_seq : drpaddr_es;
    wire        drpwe_gt   = !drp_op_done ? drpwe_seq   : drpwe_es;
    wire [15:0] drpdi_gt   = !drp_op_done ? drpdi_seq   : drpdi_es;

    // Only visible to the eye scan engine once the sequencer has released.
    wire        drprdy_es  = drp_op_done ? drprdy_gt : 1'b0;

    reg drp_busy_r = 1'b0;
    always @(posedge drpclk) drp_busy_r <= !drp_op_done;
    assign drp_busy = drp_busy_r;

    generate
    if (USE_RXRESET_SEQ != 0) begin : g_rxreset_seq
        // Copy gtwizard_0_gtrxreset_seq.v in from the Transceiver Wizard
        // example design. This is a mandatory silicon workaround, not
        // boilerplate - do not reimplement it by hand.
        gtwizard_0_gtrxreset_seq gtrxreset_seq_i (
            .RST            (reset),
            .GTRXRESET_IN   (gtrxreset_r),
            .RXPMARESETDONE (rxpmaresetdone),
            .GTRXRESET_OUT  (gtrxreset_gt),
            .DRP_OP_DONE    (drp_op_done),
            .DRPCLK         (drpclk),
            .DRPEN          (drpen_seq),
            .DRPADDR        (drpaddr_seq),
            .DRPWE          (drpwe_seq),
            .DRPDO          (drpdo_gt),
            .DRPDI          (drpdi_seq),
            .DRPRDY         (drprdy_gt)
        );
    end else begin : g_no_rxreset_seq
        assign gtrxreset_gt = gtrxreset_r;
        assign drp_op_done  = 1'b1;
        assign drpen_seq    = 1'b0;
        assign drpaddr_seq  = 9'd0;
        assign drpwe_seq    = 1'b0;
        assign drpdi_seq    = 16'd0;
    end
    endgenerate

    //=========================================================================
    // DRP micro-engine: single read, or read-modify-write
    //=========================================================================
    // Everything the scan touches shares a register with other attributes, so
    // writes are always read-modify-write against a field mask. That keeps the
    // engine from clobbering neighbouring attributes.
    localparam DE_IDLE     = 3'd0;
    localparam DE_RD       = 3'd1;
    localparam DE_RD_WAIT  = 3'd2;
    localparam DE_MERGE    = 3'd3;
    localparam DE_WR_WAIT  = 3'd4;
    localparam DE_ACK      = 3'd5;

    reg  [2:0]  de_state    = DE_IDLE;
    reg  [8:0]  de_addr     = 9'd0;
    reg  [15:0] de_wdata    = 16'd0;
    reg  [15:0] de_mask     = 16'd0;
    reg         de_is_write = 1'b0;
    reg         de_start    = 1'b0;
    reg  [15:0] de_rdata    = 16'd0;
    reg         de_done     = 1'b0;

    wire        de_ready = (de_state == DE_IDLE) && !de_start;

    always @(posedge drpclk) begin
        if (reset) begin
            de_state <= DE_IDLE;
            drpen_es <= 1'b0;
            drpwe_es <= 1'b0;
            de_done  <= 1'b0;
        end else begin
            de_done <= 1'b0;
            case (de_state)
                DE_IDLE: begin
                    drpen_es <= 1'b0;
                    drpwe_es <= 1'b0;
                    if (de_start) de_state <= DE_RD;
                end
                // Read phase. Also the whole operation for a pure read.
                DE_RD: begin
                    drpaddr_es <= de_addr;
                    drpen_es   <= 1'b1;
                    drpwe_es   <= 1'b0;
                    de_state   <= DE_RD_WAIT;
                end
                DE_RD_WAIT: begin
                    drpen_es <= 1'b0;
                    if (drprdy_es) begin
                        de_rdata <= drpdo_gt;
                        if (de_is_write) begin
                            de_state <= DE_MERGE;
                        end else begin
                            de_done  <= 1'b1;
                            de_state <= DE_ACK;
                        end
                    end
                end
                // Merge the field in and launch the write in the same beat.
                DE_MERGE: begin
                    drpdi_es <= (de_rdata & ~de_mask) | (de_wdata & de_mask);
                    drpen_es <= 1'b1;
                    drpwe_es <= 1'b1;
                    de_state <= DE_WR_WAIT;
                end
                DE_WR_WAIT: begin
                    drpen_es <= 1'b0;
                    drpwe_es <= 1'b0;
                    if (drprdy_es) begin
                        de_done  <= 1'b1;
                        de_state <= DE_ACK;
                    end
                end
                DE_ACK: de_state <= DE_IDLE;
                default: de_state <= DE_IDLE;
            endcase
        end
    end

    //=========================================================================
    // Eye scan sequencer
    //=========================================================================
    localparam SS_IDLE      = 4'd0;
    localparam SS_INIT      = 4'd1;
    localparam SS_ESRESET   = 4'd2;
    localparam SS_SET_VERT  = 4'd3;
    localparam SS_SET_HORZ  = 4'd4;
    localparam SS_ARM       = 4'd5;
    localparam SS_POLL      = 4'd6;
    localparam SS_RD_ERR    = 4'd7;
    localparam SS_RD_SMP    = 4'd8;
    localparam SS_EMIT      = 4'd9;
    localparam SS_DISARM    = 4'd10;
    localparam SS_ADVANCE   = 4'd11;
    localparam SS_DONE      = 4'd12;

    reg  [3:0]  ss_state  = SS_IDLE;
    reg  [3:0]  init_step = 4'd0;
    reg         ss_issued = 1'b0;   // a DRP op is in flight for this state

    // The sweep is driven by unsigned point counters, not by signed offset
    // accumulators. An earlier version compared a signed accumulator against
    // the integer span parameters directly and the comparison went unsigned,
    // so -32 read as 4064, the very first SS_ADVANCE fell straight through to
    // SS_DONE, and the scan re-ran point 1 forever. Keeping the loop control
    // unsigned and deriving the offsets removes that failure mode entirely.
    localparam integer HORZ_PTS = (2*HORZ_SPAN)/HORZ_STEP + 1;
    localparam integer VERT_PTS = (2*VERT_SPAN)/VERT_STEP + 1;

    reg  [7:0]  hi = 8'd0;   // column index, 0 .. HORZ_PTS-1
    reg  [7:0]  vi = 8'd0;   // row index,    0 .. VERT_PTS-1

    wire signed [11:0] horz_off = -HORZ_SPAN + hi*HORZ_STEP;
    wire signed [8:0]  vert_off = -VERT_SPAN + vi*VERT_STEP;

    reg         eyescanreset_r = 1'b0;
    reg  [7:0]  esreset_cnt    = 8'd0;

    // ES_VERT_OFFSET: [6:0] magnitude, [7] sign (1 = negative). UG482 does not
    // define bit [8] for GTP, so it is held at 0.
    wire [6:0]  vert_mag  = vert_off[8] ? (~vert_off[6:0] + 7'd1)
                                        : vert_off[6:0];
    wire [8:0]  vert_code = {1'b0, vert_off[8], vert_mag};

    // ES_HORZ_OFFSET: [10:0] two's complement phase offset, eye centre at 0.
    // [11] is phase unification - 0 for positive counts including zero, 1 for
    // negative counts - which is exactly the sign of the two's complement
    // value, so it is just the sign bit of horz_off.
    wire [11:0] horz_code = {horz_off[11], horz_off[10:0]};

    assign scan_busy = (ss_state != SS_IDLE) && (ss_state != SS_DONE);

    // Pick the 16-bit slice of the 80-bit masks for the current init step.
    // Steps 0-4 walk ES_QUAL_MASK, steps 5-9 walk ES_SDATA_MASK, so the word
    // index has to rebase at step 5.
    wire [2:0] word_idx = (init_step < 4'd5) ? init_step[2:0]
                                             : (init_step[2:0] - 3'd5);

    reg [15:0] mask_word;
    always @(*) begin
        case (word_idx)
            3'd0: mask_word = ES_QUAL_MASK_VAL[15:0];
            3'd1: mask_word = ES_QUAL_MASK_VAL[31:16];
            3'd2: mask_word = ES_QUAL_MASK_VAL[47:32];
            3'd3: mask_word = ES_QUAL_MASK_VAL[63:48];
            default: mask_word = ES_QUAL_MASK_VAL[79:64];
        endcase
    end

    reg [15:0] sdata_word;
    always @(*) begin
        case (word_idx)
            3'd0: sdata_word = ES_SDATA_MASK_VAL[15:0];
            3'd1: sdata_word = ES_SDATA_MASK_VAL[31:16];
            3'd2: sdata_word = ES_SDATA_MASK_VAL[47:32];
            3'd3: sdata_word = ES_SDATA_MASK_VAL[63:48];
            default: sdata_word = ES_SDATA_MASK_VAL[79:64];
        endcase
    end

    always @(posedge drpclk) begin
        if (reset) begin
            ss_state       <= SS_IDLE;
            init_step      <= 4'd0;
            ss_issued      <= 1'b0;
            de_start       <= 1'b0;
            es_point_valid <= 1'b0;
            es_point_index <= 16'd0;
            scan_done      <= 1'b0;
            eyescanreset_r <= 1'b0;
            hi             <= 8'd0;
            vi             <= 8'd0;
        end else begin
            de_start       <= 1'b0;
            es_point_valid <= 1'b0;

            case (ss_state)
                SS_IDLE: begin
                    if (rx_reset_done && scan_start) begin
                        hi             <= 8'd0;
                        vi             <= 8'd0;
                        es_point_index <= 16'd0;
                        init_step      <= 4'd0;
                        ss_issued      <= 1'b0;
                        scan_done      <= 1'b0;
                        ss_state       <= SS_INIT;
                    end
                end

                // Static configuration: qualifier masks, sdata mask, prescale,
                // and the eye scan / error detect enables.
                SS_INIT: begin
                    if (!ss_issued && de_ready) begin
                        de_is_write <= 1'b1;
                        de_mask     <= 16'hFFFF;
                        if (init_step < 4'd5) begin
                            de_addr  <= ADDR_ES_QUAL_MASK_0 + init_step;
                            de_wdata <= mask_word;
                        end else if (init_step < 4'd10) begin
                            de_addr  <= ADDR_ES_SDATA_MASK_0 + (init_step - 4'd5);
                            de_wdata <= sdata_word;
                        end else if (init_step == 4'd10) begin
                            // [15:11] prescale only, leave vert offset alone.
                            de_addr  <= ADDR_ES_PRESCALE;
                            de_mask  <= 16'hF800;
                            de_wdata <= {ES_PRESCALE_VAL, 11'd0};
                        end else begin
                            // [9] errdet en, [8] eye scan en, [5:0] control = 0
                            de_addr  <= ADDR_ES_CONTROL;
                            de_mask  <= 16'h033F;
                            de_wdata <= 16'h0300;
                        end
                        de_start  <= 1'b1;
                        ss_issued <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        ss_issued <= 1'b0;
                        if (init_step == 4'd11) begin
                            esreset_cnt    <= 8'd0;
                            eyescanreset_r <= 1'b1;
                            ss_state       <= SS_ESRESET;
                        end else begin
                            init_step <= init_step + 1'b1;
                        end
                    end
                end

                SS_ESRESET: begin
                    esreset_cnt <= esreset_cnt + 1'b1;
                    if (esreset_cnt == 8'd31) eyescanreset_r <= 1'b0;
                    if (esreset_cnt == 8'd255) ss_state <= SS_SET_VERT;
                end

                SS_SET_VERT: begin
                    if (!ss_issued && de_ready) begin
                        de_addr     <= ADDR_ES_PRESCALE;
                        de_mask     <= 16'h01FF;   // [8:0] vert offset
                        de_wdata    <= {7'd0, vert_code};
                        de_is_write <= 1'b1;
                        de_start    <= 1'b1;
                        ss_issued   <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        ss_issued <= 1'b0;
                        ss_state  <= SS_SET_HORZ;
                    end
                end

                SS_SET_HORZ: begin
                    if (!ss_issued && de_ready) begin
                        de_addr     <= ADDR_ES_HORZ_OFFSET;
                        de_mask     <= 16'h0FFF;   // [11:0] horz offset
                        de_wdata    <= {4'd0, horz_code};
                        de_is_write <= 1'b1;
                        de_start    <= 1'b1;
                        ss_issued   <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        ss_issued <= 1'b0;
                        ss_state  <= SS_ARM;
                    end
                end

                // ES_CONTROL[0] = RUN. Starts accumulation for this point.
                SS_ARM: begin
                    if (!ss_issued && de_ready) begin
                        de_addr     <= ADDR_ES_CONTROL;
                        de_mask     <= 16'h0001;
                        de_wdata    <= 16'h0001;
                        de_is_write <= 1'b1;
                        de_start    <= 1'b1;
                        ss_issued   <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        ss_issued <= 1'b0;
                        ss_state  <= SS_POLL;
                    end
                end

                // Poll es_control_status until the counters saturate. Bit [0]
                // (done) is NOT usable on its own here: UG482 has it asserted
                // in WAIT as well as END and READ, so it still reads high for
                // the first few polls after arming, before the state machine
                // has left WAIT. Match the END state in [3:1] instead.
                SS_POLL: begin
                    if (!ss_issued && de_ready) begin
                        de_addr     <= ADDR_ES_CTRL_STATUS;
                        de_is_write <= 1'b0;
                        de_start    <= 1'b1;
                        ss_issued   <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        ss_issued <= 1'b0;
                        if (de_rdata[3:1] == 3'b010) ss_state <= SS_RD_ERR;
                    end
                end

                SS_RD_ERR: begin
                    if (!ss_issued && de_ready) begin
                        de_addr     <= ADDR_ES_ERROR_COUNT;
                        de_is_write <= 1'b0;
                        de_start    <= 1'b1;
                        ss_issued   <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        es_error_count <= de_rdata;
                        ss_issued      <= 1'b0;
                        ss_state       <= SS_RD_SMP;
                    end
                end

                SS_RD_SMP: begin
                    if (!ss_issued && de_ready) begin
                        de_addr     <= ADDR_ES_SAMPLE_COUNT;
                        de_is_write <= 1'b0;
                        de_start    <= 1'b1;
                        ss_issued   <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        es_sample_count <= de_rdata;
                        ss_issued       <= 1'b0;
                        ss_state        <= SS_EMIT;
                    end
                end

                // One ILA sample per point.
                SS_EMIT: begin
                    es_horz_offset <= horz_code;
                    es_vert_offset <= vert_code;
                    es_point_valid <= 1'b1;
                    es_point_index <= es_point_index + 1'b1;
                    ss_state       <= SS_DISARM;
                end

                SS_DISARM: begin
                    if (!ss_issued && de_ready) begin
                        de_addr     <= ADDR_ES_CONTROL;
                        de_mask     <= 16'h0001;
                        de_wdata    <= 16'h0000;
                        de_is_write <= 1'b1;
                        de_start    <= 1'b1;
                        ss_issued   <= 1'b1;
                    end else if (ss_issued && de_done) begin
                        ss_issued <= 1'b0;
                        ss_state  <= SS_ADVANCE;
                    end
                end

                // Raster order: horizontal fast, vertical slow.
                SS_ADVANCE: begin
                    if (hi == HORZ_PTS-1) begin
                        hi <= 8'd0;
                        if (vi == VERT_PTS-1) begin
                            ss_state <= SS_DONE;
                        end else begin
                            vi       <= vi + 1'b1;
                            ss_state <= SS_SET_VERT;
                        end
                    end else begin
                        hi       <= hi + 1'b1;
                        ss_state <= SS_SET_HORZ;  // vert unchanged, skip rewrite
                    end
                end

                SS_DONE: begin
                    scan_done <= 1'b1;
                    ss_state  <= SS_IDLE;   // scan_done holds until next start
                end

                default: ss_state <= SS_IDLE;
            endcase
        end
    end

    //=========================================================================
    // Eye scan result capture
    //=========================================================================
    // The ILA is used as a results buffer rather than as a scope. Eye points
    // arrive milliseconds apart, so with capture control qualified on
    // es_point_valid each stored sample is exactly one eye point and a
    // 2048-deep buffer holds the whole raster regardless of scan duration.
    //
    // Trigger on es_point_valid with trigger position 0, run the scan, then
    // read the buffer out of the Hardware Manager:
    //   set ila [get_hw_ilas hw_ila_1]
    //   run_hw_ila $ila
    //   wait_on_hw_ila $ila
    //   write_hw_ila_data -csv_file eye.csv [upload_hw_ila_data $ila]
    //
    // Generate the core once with:
//   create_ip -name ila -vendor xilinx.com -library ip -version 6.2 \
//             -module_name ila_eye
//   set_property -dict [list \
//       CONFIG.C_NUM_OF_PROBES {6} \
//       CONFIG.C_PROBE0_WIDTH {16} CONFIG.C_PROBE1_WIDTH {16} \
//       CONFIG.C_PROBE2_WIDTH {16} CONFIG.C_PROBE3_WIDTH {12} \
//       CONFIG.C_PROBE4_WIDTH {9}  CONFIG.C_PROBE5_WIDTH {1} \
//       CONFIG.C_DATA_DEPTH {2048} \
//       CONFIG.C_EN_STRG_QUAL {1} \
//       CONFIG.C_ADV_TRIGGER {false} \
//       CONFIG.C_INPUT_PIPE_STAGES {0}] [get_ips ila_eye]
    //
    // C_EN_STRG_QUAL is the capture control option. Without it the ILA stores
    // every drpclk cycle and the buffer fills with idle samples long before
    // the second eye point arrives.
    generate
    if (USE_ILA != 0) begin : g_ila
        ila_eye ila_eye_i (
            .clk    (drpclk),
            .probe0 (es_point_index),
            .probe1 (es_error_count),
            .probe2 (es_sample_count),
            .probe3 (es_horz_offset),
            .probe4 (es_vert_offset),
            .probe5 (es_point_valid)   // trigger source and capture qualifier
        );
    end
    endgenerate

    //=========================================================================
    // GTPE2_CHANNEL
    //=========================================================================
    // Attributes taken from the 3G-SDI RX Transceiver Wizard output
    // (src/reference/gtwizard_0_gt.v). Deltas from that reference:
    //   ES_EYE_SCAN_EN / ES_ERRDET_EN  -> TRUE  (build-time enable for eye scan)
    //   ES_PRESCALE                    -> from parameter
    //   ES_QUAL_MASK / ES_SDATA_MASK   -> from parameters
    // Everything else is verbatim, including RXCDR_CFG which is rate specific.

    wire [31:0] rxdata_i;
    wire [3:0]  rxcharisk_i;
    wire [3:0]  rxdisperr_i;

    // The GT deserialises the rightmost parallel bit (LSb) first.
    assign rxdata = {rxdisperr_i[1], rxcharisk_i[1], rxdata_i[15:8],
                     rxdisperr_i[0], rxcharisk_i[0], rxdata_i[7:0]};

    GTPE2_CHANNEL #
    (
        //_______________________ Simulation-Only Attributes __________________
        .SIM_RECEIVER_DETECT_PASS   ("TRUE"),
        .SIM_TX_EIDLE_DRIVE_LEVEL   ("X"),
        .SIM_RESET_SPEEDUP          (GT_SIM_GTRESET_SPEEDUP),
        .SIM_VERSION                ("2.0"),

       //----------------RX Byte and Word Alignment Attributes---------------
        .ALIGN_COMMA_DOUBLE                     ("FALSE"),
        .ALIGN_COMMA_ENABLE                     (10'b1111111111),
        .ALIGN_COMMA_WORD                       (1),
        .ALIGN_MCOMMA_DET                       ("TRUE"),
        .ALIGN_MCOMMA_VALUE                     (10'b1010000011),
        .ALIGN_PCOMMA_DET                       ("TRUE"),
        .ALIGN_PCOMMA_VALUE                     (10'b0101111100),
        .SHOW_REALIGN_COMMA                     ("TRUE"),
        .RXSLIDE_AUTO_WAIT                      (7),
        .RXSLIDE_MODE                           ("OFF"),
        .RX_SIG_VALID_DLY                       (10),

       //----------------RX 8B/10B Decoder Attributes---------------
        .RX_DISPERR_SEQ_MATCH                   ("FALSE"),
        .DEC_MCOMMA_DETECT                      ("FALSE"),
        .DEC_PCOMMA_DETECT                      ("FALSE"),
        .DEC_VALID_COMMA_ONLY                   ("FALSE"),

       //----------------------RX Clock Correction Attributes----------------------
        .CBCC_DATA_SOURCE_SEL                   ("ENCODED"),
        .CLK_COR_SEQ_2_USE                      ("FALSE"),
        .CLK_COR_KEEP_IDLE                      ("FALSE"),
        .CLK_COR_MAX_LAT                        (9),
        .CLK_COR_MIN_LAT                        (7),
        .CLK_COR_PRECEDENCE                     ("TRUE"),
        .CLK_COR_REPEAT_WAIT                    (0),
        .CLK_COR_SEQ_LEN                        (1),
        .CLK_COR_SEQ_1_ENABLE                   (4'b1111),
        .CLK_COR_SEQ_1_1                        (10'b0100000000),
        .CLK_COR_SEQ_1_2                        (10'b0000000000),
        .CLK_COR_SEQ_1_3                        (10'b0000000000),
        .CLK_COR_SEQ_1_4                        (10'b0000000000),
        .CLK_CORRECT_USE                        ("FALSE"),
        .CLK_COR_SEQ_2_ENABLE                   (4'b1111),
        .CLK_COR_SEQ_2_1                        (10'b0100000000),
        .CLK_COR_SEQ_2_2                        (10'b0000000000),
        .CLK_COR_SEQ_2_3                        (10'b0000000000),
        .CLK_COR_SEQ_2_4                        (10'b0000000000),

       //----------------------RX Channel Bonding Attributes----------------------
        .CHAN_BOND_KEEP_ALIGN                   ("FALSE"),
        .CHAN_BOND_MAX_SKEW                     (1),
        .CHAN_BOND_SEQ_LEN                      (1),
        .CHAN_BOND_SEQ_1_1                      (10'b0000000000),
        .CHAN_BOND_SEQ_1_2                      (10'b0000000000),
        .CHAN_BOND_SEQ_1_3                      (10'b0000000000),
        .CHAN_BOND_SEQ_1_4                      (10'b0000000000),
        .CHAN_BOND_SEQ_1_ENABLE                 (4'b1111),
        .CHAN_BOND_SEQ_2_1                      (10'b0000000000),
        .CHAN_BOND_SEQ_2_2                      (10'b0000000000),
        .CHAN_BOND_SEQ_2_3                      (10'b0000000000),
        .CHAN_BOND_SEQ_2_4                      (10'b0000000000),
        .CHAN_BOND_SEQ_2_ENABLE                 (4'b1111),
        .CHAN_BOND_SEQ_2_USE                    ("FALSE"),
        .FTS_DESKEW_SEQ_ENABLE                  (4'b1111),
        .FTS_LANE_DESKEW_CFG                    (4'b1111),
        .FTS_LANE_DESKEW_EN                     ("FALSE"),

       //-------------------------RX Margin Analysis Attributes----------------------------
        .ES_CONTROL                             (6'b000000),
        .ES_ERRDET_EN                           ("TRUE"),
        .ES_EYE_SCAN_EN                         ("TRUE"),
        .ES_HORZ_OFFSET                         (12'h010),
        .ES_PMA_CFG                             (10'b0000000000),
        .ES_PRESCALE                            (ES_PRESCALE_VAL),
        .ES_QUALIFIER                           (80'h00000000000000000000),
        .ES_QUAL_MASK                           (ES_QUAL_MASK_VAL),
        .ES_SDATA_MASK                          (ES_SDATA_MASK_VAL),
        .ES_VERT_OFFSET                         (9'b000000000),

       //-----------------------FPGA RX Interface Attributes-------------------------
        .RX_DATA_WIDTH                          (20),

       //-------------------------PMA Attributes----------------------------
        .OUTREFCLK_SEL_INV                      (2'b11),
        .PMA_RSV                                (32'h00000333),
        .PMA_RSV2                               (32'h00002040),
        .PMA_RSV3                               (2'b00),
        .PMA_RSV4                               (4'b0000),
        .RX_BIAS_CFG                            (16'b0000111100110011),
        .DMONITOR_CFG                           (24'h000A00),
        .RX_CM_SEL                              (2'b00),
        .RX_CM_TRIM                             (4'b0000),
        .RX_DEBUG_CFG                           (14'b00000000000000),
        .RX_OS_CFG                              (13'b0000010000000),
        .TERM_RCAL_CFG                          (15'b100001000010000),
        .TERM_RCAL_OVRD                         (3'b000),
        .TST_RSV                                (32'h00000000),
        .RX_CLK25_DIV                           (6),
        .TX_CLK25_DIV                           (6),
        .UCODEER_CLR                            (1'b0),

       //-------------------------PCI Express Attributes----------------------------
        .PCS_PCIE_EN                            ("FALSE"),

       //-------------------------PCS Attributes----------------------------
        .PCS_RSVD_ATTR                          (48'h000000000000),

       //-----------RX Buffer Attributes------------
        .RXBUF_ADDR_MODE                        ("FAST"),
        .RXBUF_EIDLE_HI_CNT                     (4'b1000),
        .RXBUF_EIDLE_LO_CNT                     (4'b0000),
        .RXBUF_EN                               ("TRUE"),
        .RX_BUFFER_CFG                          (6'b000000),
        .RXBUF_RESET_ON_CB_CHANGE               ("TRUE"),
        .RXBUF_RESET_ON_COMMAALIGN              ("FALSE"),
        .RXBUF_RESET_ON_EIDLE                   ("FALSE"),
        .RXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
        .RXBUFRESET_TIME                        (5'b00001),
        .RXBUF_THRESH_OVFLW                     (61),
        .RXBUF_THRESH_OVRD                      ("FALSE"),
        .RXBUF_THRESH_UNDFLW                    (4),
        .RXDLY_CFG                              (16'h001F),
        .RXDLY_LCFG                             (9'h030),
        .RXDLY_TAP_CFG                          (16'h0000),
        .RXPH_CFG                               (24'hC00002),
        .RXPHDLY_CFG                            (24'h084020),
        .RXPH_MONITOR_SEL                       (5'b00000),
        .RX_XCLK_SEL                            ("RXREC"),
        .RX_DDI_SEL                             (6'b000000),
        .RX_DEFER_RESET_BUF_EN                  ("TRUE"),

       //---------------------CDR Attributes-------------------------
       // Rate specific. This value is the wizard output for 2.97 Gb/s.
        .RXCDR_CFG                              (83'h0001107FE206021081010),
        .RXCDR_FR_RESET_ON_EIDLE                (1'b0),
        .RXCDR_HOLD_DURING_EIDLE                (1'b0),
        .RXCDR_PH_RESET_ON_EIDLE                (1'b0),
        .RXCDR_LOCK_CFG                         (6'b001001),

       //-----------------RX Initialization and Reset Attributes-------------------
        .RXCDRFREQRESET_TIME                    (5'b00001),
        .RXCDRPHRESET_TIME                      (5'b00001),
        .RXISCANRESET_TIME                      (5'b00001),
        .RXPCSRESET_TIME                        (5'b00001),
        .RXPMARESET_TIME                        (5'b00011),

       //-----------------RX OOB Signaling Attributes-------------------
        .RXOOB_CFG                              (7'b0000110),

       //-----------------------RX Gearbox Attributes---------------------------
        .RXGEARBOX_EN                           ("FALSE"),
        .GEARBOX_MODE                           (3'b000),

       //-----------------------PRBS Detection Attribute-----------------------
        .RXPRBS_ERR_LOOPBACK                    (1'b0),

       //-----------Power-Down Attributes----------
        .PD_TRANS_TIME_FROM_P2                  (12'h03c),
        .PD_TRANS_TIME_NONE_P2                  (8'h19),
        .PD_TRANS_TIME_TO_P2                    (8'h64),

       //-----------RX OOB Signaling Attributes----------
        .SAS_MAX_COM                            (64),
        .SAS_MIN_COM                            (36),
        .SATA_BURST_SEQ_LEN                     (4'b0101),
        .SATA_BURST_VAL                         (3'b100),
        .SATA_EIDLE_VAL                         (3'b100),
        .SATA_MAX_BURST                         (8),
        .SATA_MAX_INIT                          (21),
        .SATA_MAX_WAKE                          (7),
        .SATA_MIN_BURST                         (4),
        .SATA_MIN_INIT                          (12),
        .SATA_MIN_WAKE                          (4),

       //-----------RX Fabric Clock Output Control Attributes----------
        .TRANS_TIME_RATE                        (8'h0E),

       //------------TX Buffer Attributes----------------
        .TXBUF_EN                               ("TRUE"),
        .TXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
        .TXDLY_CFG                              (16'h001F),
        .TXDLY_LCFG                             (9'h030),
        .TXDLY_TAP_CFG                          (16'h0000),
        .TXPH_CFG                               (16'h0780),
        .TXPHDLY_CFG                            (24'h084020),
        .TXPH_MONITOR_SEL                       (5'b00000),
        .TX_XCLK_SEL                            ("TXOUT"),

       //-----------------------FPGA TX Interface Attributes-------------------------
        .TX_DATA_WIDTH                          (20),

       //-----------------------TX Configurable Driver Attributes-------------------------
        .TX_DEEMPH0                             (6'b000000),
        .TX_DEEMPH1                             (6'b000000),
        .TX_EIDLE_ASSERT_DELAY                  (3'b110),
        .TX_EIDLE_DEASSERT_DELAY                (3'b100),
        .TX_LOOPBACK_DRIVE_HIZ                  ("FALSE"),
        .TX_MAINCURSOR_SEL                      (1'b0),
        .TX_DRIVE_MODE                          ("DIRECT"),
        .TX_MARGIN_FULL_0                       (7'b1001110),
        .TX_MARGIN_FULL_1                       (7'b1001001),
        .TX_MARGIN_FULL_2                       (7'b1000101),
        .TX_MARGIN_FULL_3                       (7'b1000010),
        .TX_MARGIN_FULL_4                       (7'b1000000),
        .TX_MARGIN_LOW_0                        (7'b1000110),
        .TX_MARGIN_LOW_1                        (7'b1000100),
        .TX_MARGIN_LOW_2                        (7'b1000010),
        .TX_MARGIN_LOW_3                        (7'b1000000),
        .TX_MARGIN_LOW_4                        (7'b1000000),

       //-----------------------TX Gearbox Attributes--------------------------
        .TXGEARBOX_EN                           ("FALSE"),

       //-----------------------TX Initialization and Reset Attributes--------------------------
        .TXPCSRESET_TIME                        (5'b00001),
        .TXPMARESET_TIME                        (5'b00001),

       //-----------------------TX Receiver Detection Attributes--------------------------
        .TX_RXDETECT_CFG                        (14'h1832),
        .TX_RXDETECT_REF                        (3'b100),

       //---------------- JTAG Attributes ---------------
        .ACJTAG_DEBUG_MODE                      (1'b0),
        .ACJTAG_MODE                            (1'b0),
        .ACJTAG_RESET                           (1'b0),

       //---------------- CDR Attributes ---------------
        .CFOK_CFG                               (43'h49000040E80),
        .CFOK_CFG2                              (7'b0100000),
        .CFOK_CFG3                              (7'b0100000),
        .CFOK_CFG4                              (1'b0),
        .CFOK_CFG5                              (2'h0),
        .CFOK_CFG6                              (4'b0000),
        .RXOSCALRESET_TIME                      (5'b00011),
        .RXOSCALRESET_TIMEOUT                   (5'b00000),

       //---------------- PMA Attributes ---------------
        .CLK_COMMON_SWING                       (1'b0),
        .RX_CLKMUX_EN                           (1'b1),
        .TX_CLKMUX_EN                           (1'b1),
        .ES_CLK_PHASE_SEL                       (1'b0),
        .USE_PCS_CLK_PHASE_SEL                  (1'b0),
        .PMA_RSV6                               (1'b0),
        .PMA_RSV7                               (1'b0),

       //---------------- TX Configuration Driver Attributes ---------------
        .TX_PREDRIVER_MODE                      (1'b0),
        .PMA_RSV5                               (1'b0),
        .SATA_PLL_CFG                           ("VCO_3000MHZ"),

       //---------------- RX Fabric Clock Output Control Attributes ---------------
        .RXOUT_DIV                              (2),

       //---------------- TX Fabric Clock Output Control Attributes ---------------
        .TXOUT_DIV                              (2),

       //---------------- RX Phase Interpolator Attributes---------------
        .RXPI_CFG0                              (3'b000),
        .RXPI_CFG1                              (1'b1),
        .RXPI_CFG2                              (1'b1),

       //------------RX Equalizer Attributes-------------
        .ADAPT_CFG0                             (20'h00000),
        .RXLPMRESET_TIME                        (7'b0001111),
        .RXLPM_BIAS_STARTUP_DISABLE             (1'b1),
        .RXLPM_CFG                              (4'b0110),
        .RXLPM_CFG1                             (1'b0),
        .RXLPM_CM_CFG                           (1'b0),
        .RXLPM_GC_CFG                           (9'b111100010),
        .RXLPM_GC_CFG2                          (3'b001),
        .RXLPM_HF_CFG                           (14'b00001111110000),
        .RXLPM_HF_CFG2                          (5'b01010),
        .RXLPM_HF_CFG3                          (4'b0000),
        .RXLPM_HOLD_DURING_EIDLE                (1'b0),
        .RXLPM_INCM_CFG                         (1'b1),
        .RXLPM_IPCM_CFG                         (1'b0),
        .RXLPM_LF_CFG                           (18'b000000001111110000),
        .RXLPM_LF_CFG2                          (5'b01010),
        .RXLPM_OSINT_CFG                        (3'b100),

       //---------------- TX Phase Interpolator PPM Controller Attributes---------------
        .TXPI_CFG0                              (2'b00),
        .TXPI_CFG1                              (2'b00),
        .TXPI_CFG2                              (2'b00),
        .TXPI_CFG3                              (1'b0),
        .TXPI_CFG4                              (1'b0),
        .TXPI_CFG5                              (3'b000),
        .TXPI_GREY_SEL                          (1'b0),
        .TXPI_INVSTROBE_SEL                     (1'b0),
        .TXPI_PPMCLK_SEL                        ("TXUSRCLK2"),
        .TXPI_PPM_CFG                           (8'h00),
        .TXPI_SYNFREQ_PPM                       (3'b001),

       //---------------- LOOPBACK Attributes---------------
        .LOOPBACK_CFG                           (1'b0),
        .PMA_LOOPBACK_CFG                       (1'b0),

       //----------------RX OOB Signalling Attributes---------------
        .RXOOB_CLK_CFG                          ("PMA"),

       //----------------TX OOB Signalling Attributes---------------
        .TXOOB_CFG                              (1'b0),

       //----------------RX Buffer Attributes---------------
        .RXSYNC_MULTILANE                       (1'b0),
        .RXSYNC_OVRD                            (1'b0),
        .RXSYNC_SKIP_DA                         (1'b0),

       //----------------TX Buffer Attributes---------------
        .TXSYNC_MULTILANE                       (1'b0),
        .TXSYNC_OVRD                            (1'b0),
        .TXSYNC_SKIP_DA                         (1'b0)
    )
    gtpe2_rx_i
    (
        //------------------------------- CPLL Ports -------------------------------
        .GTRSVD                         (16'b0000000000000000),
        .PCSRSVDIN                      (16'b0000000000000000),
        .TSTIN                          (20'b11111111111111111111),
        //-------------------------- Channel - DRP Ports  --------------------------
        .DRPADDR                        (drpaddr_gt),
        .DRPCLK                         (drpclk),
        .DRPDI                          (drpdi_gt),
        .DRPDO                          (drpdo_gt),
        .DRPEN                          (drpen_gt),
        .DRPRDY                         (drprdy_gt),
        .DRPWE                          (drpwe_gt),
        //----------------------------- Clocking Ports -----------------------------
        .RXSYSCLKSEL                    (2'b00),   // PLL0
        .TXSYSCLKSEL                    (2'b11),
        //--------------- FPGA TX Interface Datapath Configuration  ----------------
        .TX8B10BEN                      (1'b0),
        //---------------------- GTPE2_CHANNEL Clocking Ports ----------------------
        .PLL0CLK                        (pll0clk),
        .PLL0REFCLK                     (pll0refclk),
        .PLL1CLK                        (pll1clk),
        .PLL1REFCLK                     (pll1refclk),
        //----------------------------- Loopback Ports -----------------------------
        .LOOPBACK                       (3'b000),
        //--------------------------- PCI Express Ports ----------------------------
        .PHYSTATUS                      (),
        .RXRATE                         (3'b000),
        .RXVALID                        (),
        //--------------------------- PMA Reserved Ports ---------------------------
        .PMARSVDIN3                     (1'b0),
        .PMARSVDIN4                     (1'b0),
        //---------------------------- Power-Down Ports ----------------------------
        .RXPD                           (2'b00),   // RX active
        .TXPD                           (2'b11),   // TX powered down, ch0 transmits
        //------------------------ RX 8B/10B Decoder Ports -------------------------
        .SETERRSTATUS                   (1'b0),
        //------------------- RX Initialization and Reset Ports --------------------
        .EYESCANRESET                   (eyescanreset_r),
        .RXUSERRDY                      (rxuserrdy_r),
        //------------------------ RX Margin Analysis Ports ------------------------
        .EYESCANDATAERROR               (),
        .EYESCANMODE                    (1'b0),
        .EYESCANTRIGGER                 (1'b0),
        //----------------------------- Receive Ports ------------------------------
        .CLKRSVD0                       (1'b0),
        .CLKRSVD1                       (1'b0),
        .DMONFIFORESET                  (1'b0),
        .DMONITORCLK                    (1'b0),
        .RXPMARESETDONE                 (rxpmaresetdone),
        .SIGVALIDCLK                    (1'b0),
        //----------------------- Receive Ports - CDR Ports ------------------------
        .RXCDRFREQRESET                 (1'b0),
        .RXCDRHOLD                      (1'b0),
        .RXCDRLOCK                      (),   // Reserved on GTP per UG482
        .RXCDROVRDEN                    (1'b0),
        .RXCDRRESET                     (1'b0),
        .RXCDRRESETRSV                  (1'b0),
        .RXOSCALRESET                   (1'b0),
        .RXOSINTCFG                     (4'b0010),
        .RXOSINTDONE                    (),
        .RXOSINTHOLD                    (1'b0),
        .RXOSINTOVRDEN                  (1'b0),
        .RXOSINTPD                      (1'b0),
        .RXOSINTSTARTED                 (),
        .RXOSINTSTROBE                  (1'b0),
        .RXOSINTSTROBESTARTED           (),
        .RXOSINTTESTOVRDEN              (1'b0),
        //----------------- Receive Ports - Clock Correction Ports -----------------
        .RXCLKCORCNT                    (),
        //-------- Receive Ports - FPGA RX Interface Datapath Configuration --------
        .RX8B10BEN                      (1'b0),
        //---------------- Receive Ports - FPGA RX Interface Ports -----------------
        .RXDATA                         (rxdata_i),
        .RXUSRCLK                       (rxusrclk),
        .RXUSRCLK2                      (rxusrclk),
        //----------------- Receive Ports - Pattern Checker Ports ------------------
        .RXPRBSERR                      (),
        .RXPRBSSEL                      (3'b000),
        //----------------- Receive Ports - Pattern Checker ports ------------------
        .RXPRBSCNTRESET                 (1'b0),
        //---------------- Receive Ports - RX 8B/10B Decoder Ports -----------------
        .RXCHARISCOMMA                  (),
        .RXCHARISK                      (rxcharisk_i),
        .RXDISPERR                      (rxdisperr_i),
        .RXNOTINTABLE                   (),
        //---------------------- Receive Ports - RX AFE Ports ----------------------
        .GTPRXN                         (gtprxn),
        .GTPRXP                         (gtprxp),
        .PMARSVDIN2                     (1'b0),
        .PMARSVDOUT0                    (),
        .PMARSVDOUT1                    (),
        //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
        .RXBUFRESET                     (1'b0),
        .RXBUFSTATUS                    (),
        .RXDDIEN                        (1'b0),
        .RXDLYBYPASS                    (1'b1),
        .RXDLYEN                        (1'b0),
        .RXDLYOVRDEN                    (1'b0),
        .RXDLYSRESET                    (1'b0),
        .RXDLYSRESETDONE                (),
        .RXPHALIGN                      (1'b0),
        .RXPHALIGNDONE                  (),
        .RXPHALIGNEN                    (1'b0),
        .RXPHDLYPD                      (1'b0),
        .RXPHDLYRESET                   (1'b0),
        .RXPHMONITOR                    (),
        .RXPHOVRDEN                     (1'b0),
        .RXPHSLIPMONITOR                (),
        .RXSTATUS                       (),
        .RXSYNCALLIN                    (1'b0),
        .RXSYNCDONE                     (),
        .RXSYNCIN                       (1'b0),
        .RXSYNCMODE                     (1'b0),
        .RXSYNCOUT                      (),
        //------------ Receive Ports - RX Byte and Word Alignment Ports ------------
        .RXBYTEISALIGNED                (),
        .RXBYTEREALIGN                  (),
        .RXCOMMADET                     (),
        .RXCOMMADETEN                   (1'b0),
        .RXMCOMMAALIGNEN                (1'b0),
        .RXPCOMMAALIGNEN                (1'b0),
        .RXSLIDE                        (1'b0),
        //---------------- Receive Ports - RX Channel Bonding Ports ----------------
        .RXCHANBONDSEQ                  (),
        .RXCHBONDEN                     (1'b0),
        .RXCHBONDI                      (4'b0000),
        .RXCHBONDLEVEL                  (3'b000),
        .RXCHBONDMASTER                 (1'b0),
        .RXCHBONDO                      (),
        .RXCHBONDSLAVE                  (1'b0),
        //--------------- Receive Ports - RX Channel Bonding Ports  ----------------
        .RXCHANISALIGNED                (),
        .RXCHANREALIGN                  (),
        //---------- Receive Ports - RX Decision Feedback Equalizer(DFE) -----------
        .DMONITOROUT                    (),
        .RXADAPTSELTEST                 (14'b0),
        .RXDFEXYDEN                     (1'b0),
        .RXOSINTEN                      (1'b1),
        .RXOSINTID0                     (4'b0),
        .RXOSINTNTRLEN                  (1'b0),
        .RXOSINTSTROBEDONE              (),
        //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        .RXLPMLFOVRDEN                  (1'b0),
        .RXLPMOSINTNTRLEN               (1'b0),
        //------------------ Receive Ports - RX Equailizer Ports -------------------
        .RXLPMHFHOLD                    (1'b0),
        .RXLPMHFOVRDEN                  (1'b0),
        .RXLPMLFHOLD                    (1'b0),
        //------------------- Receive Ports - RX Equalizer Ports -------------------
        .RXOSHOLD                       (1'b0),
        .RXOSOVRDEN                     (1'b0),
        //---------- Receive Ports - RX Fabric ClocK Output Control Ports ----------
        .RXRATEDONE                     (),
        //--------- Receive Ports - RX Fabric Clock Output Control Ports  ----------
        .RXRATEMODE                     (1'b0),
        //------------- Receive Ports - RX Fabric Output Control Ports -------------
        .RXOUTCLK                       (rxoutclk),
        .RXOUTCLKFABRIC                 (),
        .RXOUTCLKPCS                    (),
        .RXOUTCLKSEL                    (3'b010),
        //-------------------- Receive Ports - RX Gearbox Ports --------------------
        .RXDATAVALID                    (),
        .RXHEADER                       (),
        .RXHEADERVALID                  (),
        .RXSTARTOFSEQ                   (),
        //------------------- Receive Ports - RX Gearbox Ports  --------------------
        .RXGEARBOXSLIP                  (1'b0),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------
        .GTRXRESET                      (gtrxreset_gt),
        .RXLPMRESET                     (1'b0),
        .RXOOBRESET                     (1'b0),
        .RXPCSRESET                     (1'b0),
        .RXPMARESET                     (1'b0),
        //----------------- Receive Ports - RX OOB Signaling ports -----------------
        .RXCOMSASDET                    (),
        .RXCOMWAKEDET                   (),
        //---------------- Receive Ports - RX OOB Signaling ports  -----------------
        .RXCOMINITDET                   (),
        //---------------- Receive Ports - RX OOB signalling Ports -----------------
        .RXELECIDLE                     (),
        .RXELECIDLEMODE                 (2'b11),
        //--------------- Receive Ports - RX Polarity Control Ports ----------------
        .RXPOLARITY                     (1'b0),
        //------------ Receive Ports -RX Initialization and Reset Ports ------------
        .RXRESETDONE                    (rxresetdone),
        //------------------------- TX Buffer Bypass Ports -------------------------
        .TXPHDLYTSTCLK                  (1'b0),
        //---------------------- TX Configurable Driver Ports ----------------------
        .TXPOSTCURSOR                   (5'b00000),
        .TXPOSTCURSORINV                (1'b0),
        .TXPRECURSOR                    (5'b0),
        .TXPRECURSORINV                 (1'b0),
        //------------------ TX Fabric Clock Output Control Ports ------------------
        .TXRATEMODE                     (1'b0),
        //------------------- TX Initialization and Reset Ports --------------------
        .CFGRESET                       (1'b0),
        .GTTXRESET                      (1'b0),
        .PCSRSVDOUT                     (),
        .TXUSERRDY                      (1'b0),
        //--------------- TX Phase Interpolator PPM Controller Ports ---------------
        .TXPIPPMEN                      (1'b0),
        .TXPIPPMOVRDEN                  (1'b0),
        .TXPIPPMPD                      (1'b1),
        .TXPIPPMSEL                     (1'b0),
        .TXPIPPMSTEPSIZE                (5'b0),
        //-------------------- Transceiver Reset Mode Operation --------------------
        .GTRESETSEL                     (1'b0),
        .RESETOVRD                      (1'b0),
        //----------------------------- Transmit Ports -----------------------------
        .TXPMARESETDONE                 (),
        //--------------- Transmit Ports - Configurable Driver Ports ---------------
        .PMARSVDIN0                     (1'b0),
        .PMARSVDIN1                     (1'b0),
        //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
        .TXDATA                         (32'b0),
        .TXUSRCLK                       (1'b0),
        .TXUSRCLK2                      (1'b0),
        //------------------- Transmit Ports - PCI Express Ports -------------------
        .TXELECIDLE                     (1'b1),
        .TXMARGIN                       (3'b0),
        .TXRATE                         (3'b0),
        .TXSWING                        (1'b0),
        //---------------- Transmit Ports - Pattern Generator Ports ----------------
        .TXPRBSFORCEERR                 (1'b0),
        //---------------- Transmit Ports - TX 8B/10B Encoder Ports ----------------
        .TX8B10BBYPASS                  (4'b0),
        .TXCHARDISPMODE                 (4'b0),
        .TXCHARDISPVAL                  (4'b0),
        .TXCHARISK                      (4'b0),
        //---------------- Transmit Ports - TX Buffer Bypass Ports -----------------
        .TXDLYBYPASS                    (1'b1),
        .TXDLYEN                        (1'b0),
        .TXDLYHOLD                      (1'b0),
        .TXDLYOVRDEN                    (1'b0),
        .TXDLYSRESET                    (1'b0),
        .TXDLYSRESETDONE                (),
        .TXDLYUPDOWN                    (1'b0),
        .TXPHALIGN                      (1'b0),
        .TXPHALIGNDONE                  (),
        .TXPHALIGNEN                    (1'b0),
        .TXPHDLYPD                      (1'b1),
        .TXPHDLYRESET                   (1'b0),
        .TXPHINIT                       (1'b0),
        .TXPHINITDONE                   (),
        .TXPHOVRDEN                     (1'b0),
        //-------------------- Transmit Ports - TX Buffer Ports --------------------
        .TXBUFSTATUS                    (),
        //---------- Transmit Ports - TX Buffer and Phase Alignment Ports ----------
        .TXSYNCALLIN                    (1'b0),
        .TXSYNCDONE                     (),
        .TXSYNCIN                       (1'b0),
        .TXSYNCMODE                     (1'b0),
        .TXSYNCOUT                      (),
        //------------- Transmit Ports - TX Configurable Driver Ports --------------
        .GTPTXN                         (),
        .GTPTXP                         (),
        .TXBUFDIFFCTRL                  (3'b100),
        .TXDEEMPH                       (1'b0),
        .TXDIFFCTRL                     (4'b1000),
        .TXDIFFPD                       (1'b1),
        .TXINHIBIT                      (1'b0),
        .TXMAINCURSOR                   (7'b0000000),
        .TXPISOPD                       (1'b1),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        .TXOUTCLK                       (),
        .TXOUTCLKFABRIC                 (),
        .TXOUTCLKPCS                    (),
        .TXOUTCLKSEL                    (3'b010),
        .TXRATEDONE                     (),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
        .TXGEARBOXREADY                 (),
        .TXHEADER                       (3'b0),
        .TXSEQUENCE                     (7'b0),
        .TXSTARTSEQ                     (1'b0),
        //----------- Transmit Ports - TX Initialization and Reset Ports -----------
        .TXPCSRESET                     (1'b0),
        .TXPMARESET                     (1'b0),
        .TXRESETDONE                    (),
        //---------------- Transmit Ports - TX OOB signalling Ports ----------------
        .TXCOMFINISH                    (),
        .TXCOMINIT                      (1'b0),
        .TXCOMSAS                       (1'b0),
        .TXCOMWAKE                      (1'b0),
        .TXPDELECIDLEMODE               (1'b1),
        //--------------- Transmit Ports - TX Polarity Control Ports ---------------
        .TXPOLARITY                     (1'b0),
        //------------- Transmit Ports - TX Receiver Detection Ports  --------------
        .TXDETECTRX                     (1'b0),
        //---------------- Transmit Ports - pattern Generator Ports ----------------
        .TXPRBSSEL                      (3'b0)
    );

endmodule

`default_nettype wire
