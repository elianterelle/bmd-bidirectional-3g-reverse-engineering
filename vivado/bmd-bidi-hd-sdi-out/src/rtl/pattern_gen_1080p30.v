`timescale 1ns / 1ps

module pattern_gen_1080p30(
        input wire pixel_pair_clk,
        input wire reset,

        output wire [11:0] pattern_x,
        output wire [10:0] pattern_y,
        output wire [15:0] pattern_frame,
        input wire [9:0] pattern_Y0,
        input wire [9:0] pattern_Cb,
        input wire [9:0] pattern_Y1,
        input wire [9:0] pattern_Cr,
        
        output reg [9:0] Y0,
        output reg [9:0] Cb,
        output reg [9:0] Y1,
        output reg [9:0] Cr
    );
    
    // 1080p30
    localparam TOTAL_WIDTH_PX = 2200;
    localparam TOTAL_HEIGHT_PX = 1125;
    localparam ACTIVE_WIDTH_PX = 1920;
    localparam ACTIVE_HEIGHT_PX = 1080;
    
    localparam BLANK_Y = 10'h040;
    localparam BLANK_CbCr = 10'h200;
    
    reg [15:0] frame_counter;
    integer x_counter = 0;
    reg [10:0] y_counter = 1;

    assign pattern_x = x_counter;
    assign pattern_y = y_counter;
    assign pattern_frame = frame_counter;
    
    
    wire v_blank;
    assign v_blank = y_counter < 42 || y_counter > 1121;
    
    always @(posedge pixel_pair_clk) begin
        if (reset) begin
            x_counter <= 0;
            y_counter <= 1;
            Y0 <= 0;
            Y1 <= 0;
            Cb <= 0;
            Cr <= 0;
        end else begin
        
            case (x_counter)
                // EAV
                0: begin // 0, 1
                    Y0 <= 10'h3FF;
                    Cb <= 10'h3FF;
                    Y1 <= 10'h000;
                    Cr <= 10'h000;
                end
                2: begin // 2, 3
                    Y0 <= 10'h000;
                    Cb <= 10'h000;

                    // XYZ
                    if (v_blank) begin
                        Y1 <= 10'b1011011000;
                        Cr <= 10'b1011011000;
                    end else begin
                        Y1 <= 10'b1001110100;
                        Cr <= 10'b1001110100;
                    end
                end
                
                // LN
                4: begin // 4, 5
                    // LN0
                    Y0 <= {~y_counter[6], y_counter[6], y_counter[5], y_counter[4], y_counter[3], y_counter[2], y_counter[1], y_counter[0], 1'b0, 1'b0};
                    Cb <= {~y_counter[6], y_counter[6], y_counter[5], y_counter[4], y_counter[3], y_counter[2], y_counter[1], y_counter[0], 1'b0, 1'b0};
                
                    // LN1             
                    Y1 <= {~1'b0, 1'b0, 1'b0, 1'b0, y_counter[10], y_counter[9], y_counter[8], y_counter[7], 1'b0, 1'b0};
                    Cr <= {~1'b0, 1'b0, 1'b0, 1'b0, y_counter[10], y_counter[9], y_counter[8], y_counter[7], 1'b0, 1'b0};
                end
                
                // TODO: Implement CRC
                6: begin // 6, 7
                    // CRC0
                    Y0 <= 10'h80;
                    Cb <= 10'h200;

                    // CRC1
                    Y1 <= 10'h80;
                    Cr <= 10'h200;
                end
            endcase
            
            // h_blanking
            if (x_counter > 7 && x_counter < 276) begin
                Y0 <= BLANK_Y;
                Cb <= BLANK_CbCr;
                Y1 <= BLANK_Y;
                Cr <= BLANK_CbCr;
            end
            
            case (x_counter)
                // SAV
                276: begin // 276, 277
                    Y0 <= 10'h3FF;
                    Cb <= 10'h3FF;
                    Y1 <= 10'h000;
                    Cr <= 10'h000;
                end
                278: begin // 278, 279
                    Y0 <= 10'h000;
                    Cb <= 10'h000;

                    // XYZ
                    if (v_blank) begin
                        Y1 <= 10'b1010101100;
                        Cr <= 10'b1010101100;
                    end else begin
                        Y1 <= 10'b1000000000;
                        Cr <= 10'b1000000000;
                    end
                end
            endcase
            
            // active video
            if (x_counter > 279 && x_counter < 2200) begin
                if (v_blank) begin // vertical blank
                    Y0 <= BLANK_Y;
                    Cb <= BLANK_CbCr;
                    Y1 <= BLANK_Y;
                    Cr <= BLANK_CbCr;
                end else begin // active
                    Y0 <= pattern_Y0;
                    Cb <= pattern_Cb;
                    Y1 <= pattern_Y1;
                    Cr <= pattern_Cr; 
                end
            end
            
            if (x_counter >= TOTAL_WIDTH_PX - 2) begin
                x_counter <= 0;
                
                if (y_counter >= TOTAL_HEIGHT_PX) begin
                    y_counter <= 1;
                    frame_counter <= frame_counter + 1;
                end else begin
                    y_counter <= y_counter + 1;
                end
            end else begin
                x_counter <= x_counter + 2;
            end
        end
    end
endmodule
