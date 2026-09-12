`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 11:27:25 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
        input wire refclk_p,
        input wire refclk_n,
        output wire led_sdi_lock,
        output wire led_hdmi_lock,
        output wire gtp_tx_n,
        output wire gtp_tx_p,
        input wire gtp_rx_n,
        input wire gtp_rx_p,
        output wire sdi_driver_rsti,
        output wire sdi_driver_enable
    );
    
assign sdi_driver_rsti = 1'b1;
assign sdi_driver_enable = 1'b1;
    
wire refclk1;
    
IBUFDS_GTE2 #(
   .CLKCM_CFG("TRUE"),   // Enables 50 Ohm termination voltage. Must be true according to UG476
   .CLKRCV_TRST("TRUE"), // Enables 50 Ohm termination resistors. Must be true according to UG476
   .CLKSWING_CFG(2'b11)  // Controls Swing, must be set to 2'b11 according to UG476
)
IBUFDS_GTE2_inst (
   .O(refclk1),         // Output
   .ODIV2(), // Divide by 2 Output
   .CEB(1'b0),     // 0: Active, 1: Power Down
   .I(refclk_p),         // P
   .IB(refclk_n)        // N
);

wire clk;

BUFG BUFG_inst (
   .O(clk), // 1-bit output: Clock output
   .I(refclk1)  // 1-bit input: Clock input
);

(* MARK_DEBUG = "TRUE" *) reg [1:0] clkdiv_counter = 0;

wire clkdiv2;
BUFGCE BUFGCE_div2_inst (
   .O(clkdiv2), // 1-bit output: Clock output
   .CE(clkdiv_counter[0] == 1'b0), // 1-bit input: Clock enable input for I0
   .I(refclk1)  // 1-bit input: Clock input
);

wire clkdiv4;
BUFGCE BUFGCE_div4_inst (
   .O(clkdiv4), // 1-bit output: Clock output
   .CE(clkdiv_counter == 2'b00), // 1-bit input: Clock enable input for I0
   .I(refclk1)  // 1-bit input: Clock input
);

always @(posedge clk) begin
    clkdiv_counter <= clkdiv_counter + 1;
end

(* MARK_DEBUG = "TRUE" *) reg [31:0] counter = 0;

assign led_hdmi_lock = counter[27];
assign led_sdi_lock = counter[26];

always @(posedge clk) begin
    counter <= counter + 1;
end

(* MARK_DEBUG = "TRUE" *) reg reset = 1;
reg [16:0] reset_counter = 1;

// count up until rollover, then pull reset low.
always @(posedge clk) begin
    if (reset_counter != 0) begin
        reset_counter <= reset_counter + 1;
    end else begin
        reset <= 0;
    end
end

(* MARK_DEBUG = "TRUE" *) wire [9:0] source_Y0;
(* MARK_DEBUG = "TRUE" *) wire [9:0] source_Cb;
(* MARK_DEBUG = "TRUE" *) wire [9:0] source_Y1;
(* MARK_DEBUG = "TRUE" *) wire [9:0] source_Cr;

(* MARK_DEBUG = "TRUE" *) wire [19:0] sdi_scrambler_data;
(* MARK_DEBUG = "TRUE" *) wire [19:0] sdi_nrzi_data;

(* MARK_DEBUG = "TRUE" *) wire [19:0] sdi_20bit_data;

wire [11:0] pattern_x;
wire [10:0] pattern_y;
wire [15:0] pattern_frame;
wire [9:0] pattern_Y0;
wire [9:0] pattern_Cb;
wire [9:0] pattern_Y1;
wire [9:0] pattern_Cr;

pattern_gen_1080p60 source_inst (
    .pixel_pair_clk    (clkdiv2),
    .reset             (reset),
    .pattern_x         (pattern_x),
    .pattern_y         (pattern_y),
    .pattern_frame     (pattern_frame),
    .pattern_Y0        (pattern_Y0),
    .pattern_Cb        (pattern_Cb),
    .pattern_Y1        (pattern_Y1),
    .pattern_Cr        (pattern_Cr),
    .Y0                (source_Y0),
    .Cb                (source_Cb),
    .Y1                (source_Y1),
    .Cr                (source_Cr)
);

// pattern_smpte_bars pattern_inst (
//     .clk(clkdiv2),
//     .reset(reset),
//     .x        (pattern_x),
//     .y        (pattern_y),
//     .frame    (pattern_frame),
//     .Y0       (pattern_Y0),
//     .Cb       (pattern_Cb),
//     .Y1       (pattern_Y1),
//     .Cr       (pattern_Cr)
// );

pattern_pathological pattern_inst (
    .clk(clkdiv2),
    .reset(reset),
    .x        (pattern_x),
    .y        (pattern_y),
    .frame    (pattern_frame),
    .Y0       (pattern_Y0),
    .Cb       (pattern_Cb),
    .Y1       (pattern_Y1),
    .Cr       (pattern_Cr)
);

sdi_pixel_pair_to_20_bit u_sdi_pixel_pair_to_20_bit (
    .clk(clk),
    .source_Y0(source_Y0),
    .source_Cb(source_Cb),
    .source_Y1(source_Y1),
    .source_Cr(source_Cr),
    .data_out(sdi_20bit_data)
);

sdi_scrambler sdi_scrambler_inst(
    .reset(reset),
    .clk(clk),
    .data_in(sdi_20bit_data),
    .data_out(sdi_scrambler_data)
);

sdi_nrzi sdi_nrzi_inst(
    .reset(reset),
    .clk(clk),
    .data_in(sdi_scrambler_data),
    .data_out(sdi_nrzi_data)
);

wire pll0clk;
wire pll0refclk;
(* MARK_DEBUG = "TRUE" *) wire pll0lock;
(* MARK_DEBUG = "TRUE" *) wire pll0pd;
wire pll1clk;
wire pll1refclk;
wire pll1lock;
wire pll0locken;

(* MARK_DEBUG = "TRUE" *) wire txreset;
(* MARK_DEBUG = "TRUE" *) wire txpmareset;
(* MARK_DEBUG = "TRUE" *) wire txpcsreset;
(* MARK_DEBUG = "TRUE" *) wire txuserrdy;
(* MARK_DEBUG = "TRUE" *) wire resetsel;
(* MARK_DEBUG = "TRUE" *) wire txresetdone;

gtx_tx_reset_controller gtx_tx_reset_controller_inst(
    .clk(clk),
    .ref_clk(clk),
    .powerup_channel(~reset),
    .tx_running(),
    .pllpd(pll0pd),
    .plllocken(pll0locken),
    .plllock(pll0lock),

    .txreset(txreset),
    .txpmareset(txpmareset),
    .txpcsreset(txpcsreset),
    .txuserrdy(txuserrdy),
    .resetsel(resetsel),
    .txresetdone(txresetdone)
);

(* MARK_DEBUG = "TRUE" *) wire [3:0] txchardispmode = {2'b0, sdi_nrzi_data[19], sdi_nrzi_data[9]};
(* MARK_DEBUG = "TRUE" *) wire [3:0] txchardispval = {2'b0, sdi_nrzi_data[18], sdi_nrzi_data[8]};
(* MARK_DEBUG = "TRUE" *) wire [15:0] txdata = {sdi_nrzi_data[17:10], sdi_nrzi_data[7:0]};

(* MARK_DEBUG = "TRUE" *) wire txbufstatus_out;

parameter PLL0_FBDIV_IN      = 4;
parameter PLL1_FBDIV_IN      = 1;
parameter PLL0_FBDIV_45_IN   = 5;
parameter PLL1_FBDIV_45_IN   = 4;
parameter PLL0_REFCLK_DIV_IN = 1;
parameter PLL1_REFCLK_DIV_IN = 1;

GTPE2_COMMON #
(
    // Simulation attributes
    .SIM_RESET_SPEEDUP   ("TRUE"),
    .SIM_PLL0REFCLK_SEL  (3'b001),
    .SIM_PLL1REFCLK_SEL  (3'b001),
    .SIM_VERSION         ( "2.0"),

    .PLL0_FBDIV          (PLL0_FBDIV_IN     ),	
    .PLL0_FBDIV_45       (PLL0_FBDIV_45_IN  ),	
    .PLL0_REFCLK_DIV     (PLL0_REFCLK_DIV_IN),	
    .PLL1_FBDIV          (PLL1_FBDIV_IN     ),	
    .PLL1_FBDIV_45       (PLL1_FBDIV_45_IN  ),	
    .PLL1_REFCLK_DIV     (PLL1_REFCLK_DIV_IN),	        

   //----------------COMMON BLOCK Attributes---------------
    .BIAS_CFG                               (64'h0000000000050001),
    .COMMON_CFG                             (32'h00000000),

   //--------------------------PLL Attributes----------------------------
    .PLL0_CFG                               (27'h01F03DC),
    .PLL0_DMON_CFG                          (1'b0),
    .PLL0_INIT_CFG                          (24'h00001E),
    .PLL0_LOCK_CFG                          (9'h1E8),
    .PLL1_CFG                               (27'h01F03DC),
    .PLL1_DMON_CFG                          (1'b0),
    .PLL1_INIT_CFG                          (24'h00001E),
    .PLL1_LOCK_CFG                          (9'h1E8),
    .PLL_CLKOUT_CFG                         (8'h00),

   //--------------------------Reserved Attributes----------------------------
    .RSVD_ATTR0                             (16'h0000),
    .RSVD_ATTR1                             (16'h0000)
)
gtpe2_common_i
(
     .DMONITOROUT                    (),	
    //----------- Common Block  - Dynamic Reconfiguration Port (DRP) -----------
    .DRPADDR                        (8'b0),
    .DRPCLK                         (1'b0),
    .DRPDI                          (16'b0),
    .DRPDO                          (),
    .DRPEN                          (1'b0),
    .DRPRDY                         (),
    .DRPWE                          (1'b0),
    //--------------- Common Block - GTPE2_COMMON Clocking Ports ---------------
    .GTEASTREFCLK0                  (0),
    .GTEASTREFCLK1                  (0),
    .GTGREFCLK1                     (0),
    .GTREFCLK0                      (0),
    .GTREFCLK1                      (refclk1),
    .GTWESTREFCLK0                  (0),
    .GTWESTREFCLK1                  (0),
    .PLL0OUTCLK                     (pll0clk),
    .PLL0OUTREFCLK                  (pll0refclk),
    .PLL1OUTCLK                     (pll1clk),
    .PLL1OUTREFCLK                  (pll1refclk),
    //------------------------ Common Block - PLL Ports ------------------------
    .PLL0FBCLKLOST                  (),
    .PLL0LOCK                       (pll0lock),
    .PLL0LOCKDETCLK                 (0),
    .PLL0LOCKEN                     (pll0locken),
    .PLL0PD                         (pll0pd),
    .PLL0REFCLKLOST                 (),
    .PLL0REFCLKSEL                  (3'b001), // GTREFCLK1
    .PLL0RESET                      (reset),
    .PLL1FBCLKLOST                  (),
    .PLL1LOCK                       (pll1lock),
    .PLL1LOCKDETCLK                 (0),
    .PLL1LOCKEN                     (0),
    .PLL1PD                         (1'b1),
    .PLL1REFCLKLOST                 (),
    .PLL1REFCLKSEL                  (3'b001),
    .PLL1RESET                      (0),
    //-------------------------- Common Block - Ports --------------------------
    .BGRCALOVRDENB                  (5'b11111),
    .GTGREFCLK0                     (0),
    //.PLLRSVD1                       (16'b0000000000000000),
    //.PLLRSVD2                       (5'b00000),
    //.REFCLKOUTMONITOR0              (),
    //.REFCLKOUTMONITOR1              (),
    //---------------------- Common Block - RX AFE Ports -----------------------
    //.PMARSVDOUT                     (),
    //------------------------------- QPLL Ports -------------------------------
    .BGBYPASSB                      (1'b1),
    .BGMONITORENB                   (1'b1),
    .BGPDB                          (1'b1),
    .BGRCALOVRD                     (5'b11111),
    .PMARSVD                        (8'b00000000),
    .RCALENB                        (1'b1)

);

GTPE2_CHANNEL #
    (
    //_______________________ Simulation-Only Attributes __________________

    .SIM_RECEIVER_DETECT_PASS   ("TRUE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL   ("X"),
    .SIM_RESET_SPEEDUP          ("FALSE"),
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
    .DEC_MCOMMA_DETECT                      ("TRUE"),
    .DEC_PCOMMA_DETECT                      ("TRUE"),
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
    .ES_ERRDET_EN                           ("FALSE"),
    .ES_EYE_SCAN_EN                         ("FALSE"),
    .ES_HORZ_OFFSET                         (12'h010),
    .ES_PMA_CFG                             (10'b0000000000),
    .ES_PRESCALE                            (5'b00000),
    .ES_QUALIFIER                           (80'h00000000000000000000),
    .ES_QUAL_MASK                           (80'h00000000000000000000),
    .ES_SDATA_MASK                          (80'h00000000000000000000),
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
    .RX_CM_SEL                              (2'b01),
    .RX_CM_TRIM                             (4'b1010),
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

   //For Display Port, HBR/RBR- set RXCDR_CFG=72'h0380008bff40200008

   //For Display Port, HBR2 -   set RXCDR_CFG=72'h038c008bff20200010

   //For SATA Gen1 GTX- set RXCDR_CFG=72'h03_8000_8BFF_4010_0008

   //For SATA Gen2 GTX- set RXCDR_CFG=72'h03_8800_8BFF_4020_0008

   //For SATA Gen3 GTX- set RXCDR_CFG=72'h03_8000_8BFF_1020_0010

   //For SATA Gen3 GTP- set RXCDR_CFG=83'h0_0000_87FE_2060_2444_1010

   //For SATA Gen2 GTP- set RXCDR_CFG=83'h0_0000_47FE_2060_2448_1010

   //For SATA Gen1 GTP- set RXCDR_CFG=83'h0_0000_47FE_1060_2448_1010
    .RXCDR_CFG                              (83'h0001107FE086021101010),
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
    .RXLPM_INCM_CFG                         (1'b0),
    .RXLPM_IPCM_CFG                         (1'b1),
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
    .TXSYNC_OVRD                            (1'b1),
    .TXSYNC_SKIP_DA                         (1'b0)

    
) 
gtpe2_i 
(
    
    //------------------------------- CPLL Ports -------------------------------
    .GTRSVD                         (16'b0000000000000000),
    .PCSRSVDIN                      (16'b0000000000000000),
    .TSTIN                          (20'b11111111111111111111),
    //-------------------------- Channel - DRP Ports  --------------------------
    .DRPADDR                        (0),
    .DRPCLK                         (0),
    .DRPDI                          (0),
    .DRPDO                          (),
    .DRPEN                          (0),
    .DRPRDY                         (),
    .DRPWE                          (0),
    //----------------------------- Clocking Ports -----------------------------
    .RXSYSCLKSEL                    (2'b11),
    .TXSYSCLKSEL                    (2'b00),
    //--------------- FPGA TX Interface Datapath Configuration  ----------------
    .TX8B10BEN                      (0),
    //---------------------- GTPE2_CHANNEL Clocking Ports ----------------------
    .PLL0CLK                        (pll0clk),
    .PLL0REFCLK                     (pll0refclk),
    .PLL1CLK                        (pll1clk),
    .PLL1REFCLK                     (pll1refclk),
    //----------------------------- Loopback Ports -----------------------------
    .LOOPBACK                       (0),
    //--------------------------- PCI Express Ports ----------------------------
    .PHYSTATUS                      (),
    .RXRATE                         (3'b0),
    .RXVALID                        (),
    //--------------------------- PMA Reserved Ports ---------------------------
    .PMARSVDIN3                     (1'b0),
    .PMARSVDIN4                     (1'b0),
    //---------------------------- Power-Down Ports ----------------------------
    .RXPD                           (2'b11),
    .TXPD                           (2'b00),
    //------------------------ RX 8B/10B Decoder Ports -------------------------
    .SETERRSTATUS                   (1'b0),
    //------------------- RX Initialization and Reset Ports --------------------
    .EYESCANRESET                   (1'b0),
    .RXUSERRDY                      (1'b0),
    //------------------------ RX Margin Analysis Ports ------------------------
    .EYESCANDATAERROR               (),
    .EYESCANMODE                    (1'b0),
    .EYESCANTRIGGER                 (1'b0),
    //----------------------------- Receive Ports ------------------------------
    .CLKRSVD0                       (1'b0),
    .CLKRSVD1                       (1'b0),
    .DMONFIFORESET                  (1'b0),
    .DMONITORCLK                    (1'b0),
    .RXPMARESETDONE                 (),
    .SIGVALIDCLK                    (1'b0),
    //----------------------- Receive Ports - CDR Ports ------------------------
    .RXCDRFREQRESET                 (1'b0),
    .RXCDRHOLD                      (1'b0),
    .RXCDRLOCK                      (),
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
    .RXDATA                         (),
    .RXUSRCLK                       (1'b0),
    .RXUSRCLK2                      (1'b0),
    //----------------- Receive Ports - Pattern Checker Ports ------------------
    .RXPRBSERR                      (),
    .RXPRBSSEL                      (3'b0),
    //----------------- Receive Ports - Pattern Checker ports ------------------
    .RXPRBSCNTRESET                 (1'b0),
    //---------------- Receive Ports - RX 8B/10B Decoder Ports -----------------
    .RXCHARISCOMMA                  (),
    .RXCHARISK                      (),
    .RXDISPERR                      (),
    .RXNOTINTABLE                   (),
    //---------------------- Receive Ports - RX AFE Ports ----------------------
    .GTPRXN                         (1'b0),
    .GTPRXP                         (1'b0),
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
    .RXPHDLYPD                      (1'b1),
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
    .RXCOMMADETEN                   (1'b1),
    .RXMCOMMAALIGNEN                (1'b1),
    .RXPCOMMAALIGNEN                (1'b1),
    .RXSLIDE                        (1'b0),
    //---------------- Receive Ports - RX Channel Bonding Ports ----------------
    .RXCHANBONDSEQ                  (),
    .RXCHBONDEN                     (1'b0),
    .RXCHBONDI                      (4'b0000),
    .RXCHBONDLEVEL                  (3'b0),
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
    .RXOUTCLK                       (),
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
    .GTRXRESET                      (1'b0),
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
    .RXRESETDONE                    (),
    //------------------------- TX Buffer Bypass Ports -------------------------
    .TXPHDLYTSTCLK                  (1'b0),
    //---------------------- TX Configurable Driver Ports ----------------------
    .TXPOSTCURSOR                   (5'b0),
    .TXPOSTCURSORINV                (1'b0),
    .TXPRECURSOR                    (5'b0),
    .TXPRECURSORINV                 (1'b0),
    //------------------ TX Fabric Clock Output Control Ports ------------------
    .TXRATEMODE                     (1'b0),
    //------------------- TX Initialization and Reset Ports --------------------
    .CFGRESET                       (1'b0),
    .GTTXRESET                      (txreset),
    .PCSRSVDOUT                     (),
    .TXUSERRDY                      (txuserrdy),
    //--------------- TX Phase Interpolator PPM Controller Ports ---------------
    .TXPIPPMEN                      (1'b0),
    .TXPIPPMOVRDEN                  (1'b0),
    .TXPIPPMPD                      (1'b0),
    .TXPIPPMSEL                     (1'b1),
    .TXPIPPMSTEPSIZE                (5'b0),
    //-------------------- Transceiver Reset Mode Operation --------------------
    .GTRESETSEL                     (resetsel),
    .RESETOVRD                      (1'b0),
    //----------------------------- Transmit Ports -----------------------------
    .TXPMARESETDONE                 (),
    //--------------- Transmit Ports - Configurable Driver Ports ---------------
    .PMARSVDIN0                     (1'b0),
    .PMARSVDIN1                     (1'b0),
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
    .TXDATA                         (txdata),
    .TXUSRCLK                       (clk),
    .TXUSRCLK2                      (clk),
    //------------------- Transmit Ports - PCI Express Ports -------------------
    .TXELECIDLE                     (1'b0),
    .TXMARGIN                       (3'b0),
    .TXRATE                         (3'b0),
    .TXSWING                        (1'b0),
    //---------------- Transmit Ports - Pattern Generator Ports ----------------
    .TXPRBSFORCEERR                 (1'b0),
    //---------------- Transmit Ports - TX 8B/10B Encoder Ports ----------------
    .TX8B10BBYPASS                  (4'b0),
    .TXCHARDISPMODE                 (txchardispmode),
    .TXCHARDISPVAL                  (txchardispval),
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
    .TXPHDLYPD                      (1'b0),
    .TXPHDLYRESET                   (1'b0),
    .TXPHINIT                       (1'b0),
    .TXPHINITDONE                   (),
    .TXPHOVRDEN                     (1'b0),
    //-------------------- Transmit Ports - TX Buffer Ports --------------------
    .TXBUFSTATUS                    (txbufstatus_out),
    //---------- Transmit Ports - TX Buffer and Phase Alignment Ports ----------
    .TXSYNCALLIN                    (1'b0),
    .TXSYNCDONE                     (),
    .TXSYNCIN                       (1'b0),
    .TXSYNCMODE                     (1'b0),
    .TXSYNCOUT                      (),
    //------------- Transmit Ports - TX Configurable Driver Ports --------------
    .GTPTXN                         (gtp_tx_n),
    .GTPTXP                         (gtp_tx_p),
    .TXBUFDIFFCTRL                  (3'b100),
    .TXDEEMPH                       (1'b0),
    .TXDIFFCTRL                     (4'b1000), // 800mV Swing
    .TXDIFFPD                       (1'b0),
    .TXINHIBIT                      (1'b0),
    .TXMAINCURSOR                   (7'b0000000),
    .TXPISOPD                       (1'b0),
    //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    .TXOUTCLK                       (),
    .TXOUTCLKFABRIC                 (),
    .TXOUTCLKPCS                    (),
    .TXOUTCLKSEL                    (3'b010), // TODO: ggf. 010 laut example design
    .TXRATEDONE                     (),
    //------------------- Transmit Ports - TX Gearbox Ports --------------------
    .TXGEARBOXREADY                 (),
    .TXHEADER                       (3'b0),
    .TXSEQUENCE                     (7'b0),
    .TXSTARTSEQ                     (1'b0),
    //----------- Transmit Ports - TX Initialization and Reset Ports -----------
    .TXPCSRESET                     (txpcsreset),
    .TXPMARESET                     (txpmareset),
    .TXRESETDONE                    (txresetdone),
    //---------------- Transmit Ports - TX OOB signalling Ports ----------------
    .TXCOMFINISH                    (),
    .TXCOMINIT                      (1'b0),
    .TXCOMSAS                       (1'b0),
    .TXCOMWAKE                      (1'b0),
    .TXPDELECIDLEMODE               (1'b0),
    //--------------- Transmit Ports - TX Polarity Control Ports ---------------
    .TXPOLARITY                     (1'b0),
    //------------- Transmit Ports - TX Receiver Detection Ports  --------------
    .TXDETECTRX                     (1'b0),
    //---------------- Transmit Ports - pattern Generator Ports ----------------
    .TXPRBSSEL                      (3'b0)

);

//=============================================================================
// SDI RX + eye monitor
//=============================================================================
// Second channel of the same quad (MGTPRXP3/N3, via the LMH0324), sharing the
// GTPE2_COMMON above. Needs a LOC constraint to GTPE2_CHANNEL_X0Y3 - the TX
// instance above must be pinned to X0Y0 at the same time, since with two
// channels instantiated the placer can no longer infer either from the pins
// alone.

(* MARK_DEBUG = "TRUE" *) wire rx_reset_done;
(* MARK_DEBUG = "TRUE" *) wire rx_scan_busy;
(* MARK_DEBUG = "TRUE" *) wire rx_scan_done;
reg  rx_scan_start = 1'b0;

// Re-arm the sweep whenever the previous one finishes, so the ILA can be armed
// from the Hardware Manager at any time and will catch the next full raster
// rather than having to be waiting before the one-and-only scan starts.
always @(posedge clk) begin
    rx_scan_start <= rx_reset_done && !rx_scan_busy && !rx_scan_start;
end

// clk is the 148.5 MHz BUFG output on the GT reference clock. It is a valid
// DRPCLK (well under the 7-series DRP clock maximum) and is free-running
// independently of RX bring-up, which is what the reset sequencer needs.
rx rx_inst (
    .drpclk          (clk),
    .reset           (reset),

    .pll0clk         (pll0clk),
    .pll0refclk      (pll0refclk),
    .pll1clk         (pll1clk),
    .pll1refclk      (pll1refclk),
    .pll_lock        (pll0lock),

    .gtprxp          (gtp_rx_p),
    .gtprxn          (gtp_rx_n),

    .rxusrclk2       (),
    .rxdata          (),

    .rx_reset_done   (rx_reset_done),

    .scan_start      (rx_scan_start),
    .scan_busy       (rx_scan_busy),
    .scan_done       (rx_scan_done),

    // Captured by the ila_eye instance inside rx.v
    .es_point_valid  (),
    .es_point_index  (),
    .es_error_count  (),
    .es_sample_count (),
    .es_horz_offset  (),
    .es_vert_offset  ()
);

endmodule
