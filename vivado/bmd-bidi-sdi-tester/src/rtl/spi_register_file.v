`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Module Name: spi_register_file
//
// Description: SPI slave holding a small file of 8 bit registers. The register
//              contents are exposed as plain outputs and nothing else, so the
//              rest of the design never has to know that SPI is what writes
//              them. Swapping SPI for another transport means replacing this
//              module and nothing else.
//
//              SPI mode 0 (CPOL = 0, CPHA = 0), MSB first.
//
//              A frame is: cs_n low, one address byte, then one or more data
//              bytes, cs_n high. The address increments after every data byte,
//              so one frame can cover a single register or a whole block.
//
//              The address byte is {rw, addr[6:0]}:
//                rw = 0  write. The data bytes on mosi are written to the
//                        registers. Addresses >= NUM_REGS are discarded.
//                rw = 1  read. Nothing is written, mosi is ignored during the
//                        data bytes.
//
//              miso shifts out the addressed register during every data byte,
//              on writes as well, where it returns the value from before the
//              write. Addresses >= NUM_REGS read back as 0x00. What miso does
//              during the address byte itself is undefined.
//
//              cs_n, sck and mosi are oversampled in the clk domain instead of
//              sck being used as a clock. That keeps the whole module in one
//              clock domain, so the outputs need no further synchronisation,
//              and it keeps sck off the clock resources.
//
//              The oversampling costs latency, which is what limits sck. miso
//              is the tighter side: it is turned around from the falling edge
//              of sck, which is detected about four clk cycles late, and has to
//              be stable by the following rising edge. With clk at 148.5 MHz
//              simulation passes up to 20 MHz sck and breaks at 25 MHz, so keep
//              sck at or below clk/10 (about 15 MHz) for margin.
//
//////////////////////////////////////////////////////////////////////////////////


module spi_register_file #(
        parameter integer NUM_REGS = 2,

        // Value every register takes at configuration; register n is
        // REGS_INIT[8*n +: 8].
        //
        // There is deliberately no reset input. These registers have to
        // survive the video reset, which is pulsed every time one of them
        // changes - resetting them from it would immediately undo the write
        // that caused the reset.
        parameter [8*NUM_REGS-1:0] REGS_INIT = {(8*NUM_REGS){1'b0}}
    )(
        input wire clk,

        input  wire spi_cs_n,
        input  wire spi_sck,
        input  wire spi_mosi,
        output wire spi_miso,

        output wire [8*NUM_REGS-1:0] regs
    );

    // The SPI pins are free running and completely asynchronous to clk. sck
    // gets a third stage so the pair [2:1] can be used for edge detection.
    (* ASYNC_REG = "TRUE" *) reg [2:0] sck_meta  = 3'b000;
    (* ASYNC_REG = "TRUE" *) reg [1:0] cs_n_meta = 2'b11;
    (* ASYNC_REG = "TRUE" *) reg [1:0] mosi_meta = 2'b00;

    always @(posedge clk) begin
        sck_meta  <= {sck_meta[1:0], spi_sck};
        cs_n_meta <= {cs_n_meta[0], spi_cs_n};
        mosi_meta <= {mosi_meta[0], spi_mosi};
    end

    wire sck_rising  = (sck_meta[2:1] == 2'b01);
    wire sck_falling = (sck_meta[2:1] == 2'b10);
    wire selected    = ~cs_n_meta[1];

    // Mode 0 samples mosi on the rising edge of sck, MSB first.
    reg [7:0] shift     = 8'h00;
    reg [2:0] bit_count = 3'd0;
    reg       have_addr = 1'b0;
    reg       read_mode = 1'b0;
    reg [7:0] addr      = 8'h00;

    // The byte currently being completed: the seven bits already shifted in
    // plus the one arriving on this edge.
    wire [7:0] rx_byte   = {shift[6:0], mosi_meta[1]};
    wire       byte_done = selected && sck_rising && (bit_count == 3'd7);

    always @(posedge clk) begin
        if (!selected) begin
            // Idle between frames, so the next one starts from a known state
            // even if the previous one was cut short.
            bit_count <= 3'd0;
            have_addr <= 1'b0;
        end else if (sck_rising) begin
            shift     <= rx_byte;
            bit_count <= bit_count + 3'd1;

            if (bit_count == 3'd7) begin
                if (have_addr) begin
                    addr <= addr + 8'd1;
                end else begin
                    // {rw, addr[6:0]}
                    addr      <= {1'b0, rx_byte[6:0]};
                    read_mode <= rx_byte[7];
                    have_addr <= 1'b1;
                end
            end
        end
    end

    reg [7:0] reg_file [0:NUM_REGS-1];

    always @(posedge clk) begin
        if (byte_done && have_addr && !read_mode && addr < NUM_REGS) begin
            reg_file[addr] <= rx_byte;
        end
    end

    // Readback. In mode 0 the master samples miso on the rising edge of sck,
    // so the slave turns it around on the falling edge. bit_count is back at 0
    // on the falling edge that follows the last rising edge of a byte, which
    // is exactly where the next byte has to be loaded - for the first data
    // byte that is the falling edge right after the address byte completed, by
    // which point addr is already valid.
    wire [7:0] rd_data = (addr < NUM_REGS) ? reg_file[addr] : 8'h00;

    reg [6:0] tx_shift = 7'h00;
    reg       miso_r   = 1'b0;

    assign spi_miso = miso_r;

    always @(posedge clk) begin
        if (!selected) begin
            tx_shift <= 7'h00;
            miso_r   <= 1'b0;
        end else if (sck_falling) begin
            if (bit_count == 3'd0) begin
                {miso_r, tx_shift} <= rd_data;
            end else begin
                {miso_r, tx_shift} <= {tx_shift, 1'b0};
            end
        end
    end

    genvar g;
    generate
        for (g = 0; g < NUM_REGS; g = g + 1) begin : g_reg
            initial reg_file[g] = REGS_INIT[8*g +: 8];
            assign regs[8*g +: 8] = reg_file[g];
        end
    endgenerate

endmodule

`default_nettype wire
