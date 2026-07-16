`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2026 12:40:50 AM
// Design Name: 
// Module Name: pattern_smpte_bars
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


module pattern_smpte_bars(
        input wire [11:0] x,
        input wire [10:0] y,
        input wire [15:0] frame,
        output reg [9:0] Y0,
        output reg [9:0] Cb,
        output reg [9:0] Y1,
        output reg [9:0] Cr
    );

    localparam ACTIVE_START_X = 280;
    localparam ACTIVE_END_X = 2199;
    localparam ACTIVE_START_Y = 42;
    localparam ACTIVE_END_Y = 1121;

    wire [11:0] active_x = x - ACTIVE_START_X;
    wire [10:0] active_y = y - ACTIVE_START_Y;

    // See Page 15 of SMPTE RP219

    // Colors

    // Pattern 1
    localparam COLOR_P1_75WHITE_Y  = 721;
    localparam COLOR_P1_75WHITE_Cb = 512;
    localparam COLOR_P1_75WHITE_Cr = 512;

    localparam COLOR_P1_75YELLOW_Y  = 674;
    localparam COLOR_P1_75YELLOW_Cb = 176;
    localparam COLOR_P1_75YELLOW_Cr = 543;

    localparam COLOR_P1_75CYAN_Y  = 581;
    localparam COLOR_P1_75CYAN_Cb = 589;
    localparam COLOR_P1_75CYAN_Cr = 176;

    localparam COLOR_P1_75GREEN_Y  = 534;
    localparam COLOR_P1_75GREEN_Cb = 253;
    localparam COLOR_P1_75GREEN_Cr = 207;

    localparam COLOR_P1_75MAGENTA_Y  = 251;
    localparam COLOR_P1_75MAGENTA_Cb = 771;
    localparam COLOR_P1_75MAGENTA_Cr = 817;

    localparam COLOR_P1_75RED_Y  = 204;
    localparam COLOR_P1_75RED_Cb = 435;
    localparam COLOR_P1_75RED_Cr = 848;

    localparam COLOR_P1_75BLUE_Y  = 111;
    localparam COLOR_P1_75BLUE_Cb = 848;
    localparam COLOR_P1_75BLUE_Cr = 481;

    localparam COLOR_P1_40GRAY_Y  = 414;
    localparam COLOR_P1_40GRAY_Cb = 512;
    localparam COLOR_P1_40GRAY_Cr = 512;

    // Pattern 2 - Table B.2 (75% White selected)
    localparam COLOR_P2_100CYAN_Y  = 754;
    localparam COLOR_P2_100CYAN_Cb = 615;
    localparam COLOR_P2_100CYAN_Cr = 64;

    localparam COLOR_P2_75WHITE_Y  = 721;
    localparam COLOR_P2_75WHITE_Cb = 512;
    localparam COLOR_P2_75WHITE_Cr = 512;

    localparam COLOR_P2_100BLUE_Y  = 127;
    localparam COLOR_P2_100BLUE_Cb = 960;
    localparam COLOR_P2_100BLUE_Cr = 471;

    // Pattern 2 - Table B.3 (100% White selected)
    localparam COLOR_P2_100WHITE_Y  = 940;
    localparam COLOR_P2_100WHITE_Cb = 512;
    localparam COLOR_P2_100WHITE_Cr = 512;

    // Pattern 2 - Table B.4 (+I selected)
    localparam COLOR_P2_PLUSI_Y  = 245;
    localparam COLOR_P2_PLUSI_Cb = 412;
    localparam COLOR_P2_PLUSI_Cr = 629;

    // Pattern 2 - Table B.5 (-I selected)
    localparam COLOR_P2_MINUSI_Y  = 244;
    localparam COLOR_P2_MINUSI_Cb = 612;
    localparam COLOR_P2_MINUSI_Cr = 395;

    // Pattern 3 - Table B.6 (Black selected)
    localparam COLOR_P3_100YELLOW_Y  = 877;
    localparam COLOR_P3_100YELLOW_Cb = 64;
    localparam COLOR_P3_100YELLOW_Cr = 553;

    localparam COLOR_P3_0BLACK_Y  = 64;
    localparam COLOR_P3_0BLACK_Cb = 512;
    localparam COLOR_P3_0BLACK_Cr = 512;

    // Y-Ramp: Y ramp from 64 to 940, Cb/Cr constant 512
    localparam COLOR_P3_RAMP_Y_MIN = 64;
    localparam COLOR_P3_RAMP_Y_MAX = 940;
    localparam COLOR_P3_RAMP_Cb    = 512;
    localparam COLOR_P3_RAMP_Cr    = 512;

    localparam COLOR_P3_100WHITE_Y  = 940;
    localparam COLOR_P3_100WHITE_Cb = 512;
    localparam COLOR_P3_100WHITE_Cr = 512;

    localparam COLOR_P3_100RED_Y  = 250;
    localparam COLOR_P3_100RED_Cb = 409;
    localparam COLOR_P3_100RED_Cr = 960;

    // Pattern 3 - Table B.7 (+Q selected)
    localparam COLOR_P3_PLUSQ_Y  = 141;
    localparam COLOR_P3_PLUSQ_Cb = 697;
    localparam COLOR_P3_PLUSQ_Cr = 606;

    // Pattern 4 - Table B.8
    localparam COLOR_P4_15GRAY_Y  = 195;
    localparam COLOR_P4_15GRAY_Cb = 512;
    localparam COLOR_P4_15GRAY_Cr = 512;

    localparam COLOR_P4_0BLACK_Y  = 64;
    localparam COLOR_P4_0BLACK_Cb = 512;
    localparam COLOR_P4_0BLACK_Cr = 512;

    localparam COLOR_P4_SUBBLACK_Y  = 4;
    localparam COLOR_P4_SUBBLACK_Cb = 512;
    localparam COLOR_P4_SUBBLACK_Cr = 512;

    localparam COLOR_P4_100WHITE_Y  = 940;
    localparam COLOR_P4_100WHITE_Cb = 512;
    localparam COLOR_P4_100WHITE_Cr = 512;

    localparam COLOR_P4_SUPERWHITE_Y  = 1019;
    localparam COLOR_P4_SUPERWHITE_Cb = 512;
    localparam COLOR_P4_SUPERWHITE_Cr = 512;

    localparam COLOR_P4_MINUS2BLACK_Y  = 46;
    localparam COLOR_P4_MINUS2BLACK_Cb = 512;
    localparam COLOR_P4_MINUS2BLACK_Cr = 512;

    localparam COLOR_P4_PLUS2BLACK_Y  = 82;
    localparam COLOR_P4_PLUS2BLACK_Cb = 512;
    localparam COLOR_P4_PLUS2BLACK_Cr = 512;

    localparam COLOR_P4_PLUS4BLACK_Y  = 99;
    localparam COLOR_P4_PLUS4BLACK_Cb = 512;
    localparam COLOR_P4_PLUS4BLACK_Cr = 512;


    // See Page 19 of SMPTE RP219

    // Table C.1 Pattern 1 Widths
    localparam W_D = 240;
    localparam W_F = 206;
    localparam W_C = 206;
    localparam W_E = 204;

    // Table C.2 Pattern 4 Widths
    localparam W_K = 308;
    localparam W_G = 412;
    localparam W_H = 170;
    localparam W_I0 = 68;
    localparam W_I1 = 70;
    localparam W_I2 = 68;
    localparam W_J0 = 70;
    localparam W_J1 = 68;
    localparam W_M = 206;

    // Table C.5 Heights
    localparam H_B1 = 630;
    localparam H_B2 = 90;
    localparam H_B3 = 90;
    localparam H_B4 = 270;
    localparam H_B5 = 90;
    localparam H_B6 = 90;

    // Absolute Active Video Coordinates
    // Start Coordinates of Patterns

    localparam X_P1_2 = W_D;
    localparam X_P1_3 = X_P1_2 + W_F;
    localparam X_P1_4 = X_P1_3 + W_C;
    localparam X_P1_5 = X_P1_4 + W_C;
    localparam X_P1_6 = X_P1_5 + W_E;
    localparam X_P1_7 = X_P1_6 + W_C;
    localparam X_P1_8 = X_P1_7 + W_C;
    localparam X_P1_9 = X_P1_8 + W_F;

    localparam X_P2_2 = W_D;
    localparam X_P2_3 = X_P2_2 + W_F;
    localparam X_P2_4 = X_P2_3 + 5*W_C + W_E;
    localparam X_P2_5 = X_P2_4 + W_F;

    localparam X_P3_2 = W_D;
    localparam X_P3_3 = X_P3_2 + W_F;
    localparam X_P3_4 = X_P3_3 + 4*W_C + W_E;
    localparam X_P3_5 = X_P3_4 + W_C;
    localparam X_P3_6 = X_P3_5 + W_F;

    localparam X_P4_2 = W_D;
    localparam X_P4_3 = X_P4_2 + W_K;
    localparam X_P4_4 = X_P4_3 + W_G;
    localparam X_P4_5 = X_P4_4 + W_H;
    localparam X_P4_6 = X_P4_5 + W_I0;
    localparam X_P4_7 = X_P4_6 + W_I1;
    localparam X_P4_8 = X_P4_7 + W_I2;
    localparam X_P4_9 = X_P4_8 + W_J0;
    localparam X_P4_10 = X_P4_9 + W_J1;
    localparam X_P4_11 = X_P4_10 + W_M;

    localparam Y_P2 = H_B1;
    localparam Y_P3 = Y_P2 + H_B2;
    localparam Y_P4 = Y_P3 + H_B3;
    localparam Y_P5 = Y_P4 + H_B5;
    localparam Y_P6 = Y_P5 + H_B6;

    always @(*) begin
        Y0 = 10'h040;
        Cb = 10'h200;
        Y1 = 10'h040;
        Cr = 10'h200;

        if (x >= ACTIVE_START_X && x <= ACTIVE_END_X && y >= ACTIVE_START_Y && y <= ACTIVE_END_Y) begin
            if (active_y < Y_P2) begin // Pattern 1
                if (active_x < X_P1_2) begin // 40% Gray
                    Y0 = COLOR_P1_40GRAY_Y;
                    Y1 = COLOR_P1_40GRAY_Y;
                    Cb = COLOR_P1_40GRAY_Cb;
                    Cr = COLOR_P1_40GRAY_Cr;
                end else if (active_x < X_P1_3) begin // 75% White
                    Y0 = COLOR_P1_75WHITE_Y;
                    Y1 = COLOR_P1_75WHITE_Y;
                    Cb = COLOR_P1_75WHITE_Cb;
                    Cr = COLOR_P1_75WHITE_Cr;
                end else if (active_x < X_P1_4) begin // 75% Yellow
                    Y0 = COLOR_P1_75YELLOW_Y;
                    Y1 = COLOR_P1_75YELLOW_Y;
                    Cb = COLOR_P1_75YELLOW_Cb;
                    Cr = COLOR_P1_75YELLOW_Cr;
                end else if (active_x < X_P1_5) begin // 75% Cyan
                    Y0 = COLOR_P1_75CYAN_Y;
                    Y1 = COLOR_P1_75CYAN_Y;
                    Cb = COLOR_P1_75CYAN_Cb;
                    Cr = COLOR_P1_75CYAN_Cr;
                end else if (active_x < X_P1_6) begin // 75% Green
                    Y0 = COLOR_P1_75GREEN_Y;
                    Y1 = COLOR_P1_75GREEN_Y;
                    Cb = COLOR_P1_75GREEN_Cb;
                    Cr = COLOR_P1_75GREEN_Cr;
                end else if (active_x < X_P1_7) begin // 75% Magenta
                    Y0 = COLOR_P1_75MAGENTA_Y;
                    Y1 = COLOR_P1_75MAGENTA_Y;
                    Cb = COLOR_P1_75MAGENTA_Cb;
                    Cr = COLOR_P1_75MAGENTA_Cr;
                end else if (active_x < X_P1_8) begin // 75% Red
                    Y0 = COLOR_P1_75RED_Y;
                    Y1 = COLOR_P1_75RED_Y;
                    Cb = COLOR_P1_75RED_Cb;
                    Cr = COLOR_P1_75RED_Cr;
                end else if (active_x < X_P1_9) begin // 75% Blue
                    Y0 = COLOR_P1_75BLUE_Y;
                    Y1 = COLOR_P1_75BLUE_Y;
                    Cb = COLOR_P1_75BLUE_Cb;
                    Cr = COLOR_P1_75BLUE_Cr;
                end else begin // 40% Gray
                    Y0 = COLOR_P1_40GRAY_Y;
                    Y1 = COLOR_P1_40GRAY_Y;
                    Cb = COLOR_P1_40GRAY_Cb;
                    Cr = COLOR_P1_40GRAY_Cr;
                end
            end else if (active_y < Y_P3) begin // Pattern 2
                if (active_x < X_P2_2) begin // 100% Cyan
                    Y0 = COLOR_P2_100CYAN_Y;
                    Y1 = COLOR_P2_100CYAN_Y;
                    Cb = COLOR_P2_100CYAN_Cb;
                    Cr = COLOR_P2_100CYAN_Cr;
                end else if (active_x < X_P2_3) begin // *2 75% White (Selectable)
                    Y0 = COLOR_P2_75WHITE_Y;
                    Y1 = COLOR_P2_75WHITE_Y;
                    Cb = COLOR_P2_75WHITE_Cb;
                    Cr = COLOR_P2_75WHITE_Cr;
                end else if (active_x < X_P2_4) begin // 75% White
                    Y0 = COLOR_P2_75WHITE_Y;
                    Y1 = COLOR_P2_75WHITE_Y;
                    Cb = COLOR_P2_75WHITE_Cb;
                    Cr = COLOR_P2_75WHITE_Cr;
                end else begin // 100% Blue
                    Y0 = COLOR_P2_100BLUE_Y;
                    Y1 = COLOR_P2_100BLUE_Y;
                    Cb = COLOR_P2_100BLUE_Cb;
                    Cr = COLOR_P2_100BLUE_Cr;
                end
            end else if (active_y < Y_P4) begin // Pattern 3
                if (active_x < X_P3_2) begin // 100% Yellow
                    Y0 = COLOR_P3_100YELLOW_Y;
                    Y1 = COLOR_P3_100YELLOW_Y;
                    Cb = COLOR_P3_100YELLOW_Cb;
                    Cr = COLOR_P3_100YELLOW_Cr;
                end else if (active_x < X_P3_3) begin // *3 0% Black (Selectable)
                    Y0 = COLOR_P3_0BLACK_Y;
                    Y1 = COLOR_P3_0BLACK_Y;
                    Cb = COLOR_P3_0BLACK_Cb;
                    Cr = COLOR_P3_0BLACK_Cr;
                end else if (active_x < X_P3_4) begin // Y-RAMP
                    Y0 = COLOR_P3_RAMP_Y_MIN + (((COLOR_P3_RAMP_Y_MAX - COLOR_P3_RAMP_Y_MIN) * (active_x - X_P3_3)) / (X_P3_4 - X_P3_3));
                    Y1 = COLOR_P3_RAMP_Y_MIN + (((COLOR_P3_RAMP_Y_MAX - COLOR_P3_RAMP_Y_MIN) * (active_x - X_P3_3)) / (X_P3_4 - X_P3_3));
                    Cb = COLOR_P3_RAMP_Cb;
                    Cr = COLOR_P3_RAMP_Cr;
                end else if (active_x < X_P3_5) begin // 100% White
                    Y0 = COLOR_P3_100WHITE_Y;
                    Y1 = COLOR_P3_100WHITE_Y;
                    Cb = COLOR_P3_100WHITE_Cb;
                    Cr = COLOR_P3_100WHITE_Cr;
                end else begin // 100% Red
                    Y0 = COLOR_P3_100RED_Y;
                    Y1 = COLOR_P3_100RED_Y;
                    Cb = COLOR_P3_100RED_Cb;
                    Cr = COLOR_P3_100RED_Cr;
                end
            end else begin // Pattern 4
                if (active_x < X_P4_2) begin // 15% Gray
                    Y0 = COLOR_P4_15GRAY_Y;
                    Y1 = COLOR_P4_15GRAY_Y;
                    Cb = COLOR_P4_15GRAY_Cb;
                    Cr = COLOR_P4_15GRAY_Cr;
                end else if (active_x < X_P4_3) begin
                    if (active_y < Y_P5) begin // 0% Black
                        Y0 = COLOR_P4_0BLACK_Y;
                        Y1 = COLOR_P4_0BLACK_Y;
                        Cb = COLOR_P4_0BLACK_Cb;
                        Cr = COLOR_P4_0BLACK_Cr;
                    end else if (active_y < Y_P6) begin // *5 0% Black
                        Y0 = COLOR_P4_0BLACK_Y;
                        Y1 = COLOR_P4_0BLACK_Y;
                        Cb = COLOR_P4_0BLACK_Cb;
                        Cr = COLOR_P4_0BLACK_Cr;
                    end else begin // 0% Black
                        Y0 = COLOR_P4_0BLACK_Y;
                        Y1 = COLOR_P4_0BLACK_Y;
                        Cb = COLOR_P4_0BLACK_Cb;
                        Cr = COLOR_P4_0BLACK_Cr;
                    end
                end else if (active_x < X_P4_4) begin
                    if (active_y < Y_P5) begin // 100% White
                        Y0 = COLOR_P4_100WHITE_Y;
                        Y1 = COLOR_P4_100WHITE_Y;
                        Cb = COLOR_P4_100WHITE_Cb;
                        Cr = COLOR_P4_100WHITE_Cr;
                    end else if (active_y < Y_P6) begin // *6 100% White
                        Y0 = COLOR_P4_100WHITE_Y;
                        Y1 = COLOR_P4_100WHITE_Y;
                        Cb = COLOR_P4_100WHITE_Cb;
                        Cr = COLOR_P4_100WHITE_Cr;
                    end else begin // 100% White
                        Y0 = COLOR_P4_100WHITE_Y;
                        Y1 = COLOR_P4_100WHITE_Y;
                        Cb = COLOR_P4_100WHITE_Cb;
                        Cr = COLOR_P4_100WHITE_Cr;
                    end
                end else if (active_x < X_P4_5) begin // 0% Black
                    Y0 = COLOR_P4_0BLACK_Y;
                    Y1 = COLOR_P4_0BLACK_Y;
                    Cb = COLOR_P4_0BLACK_Cb;
                    Cr = COLOR_P4_0BLACK_Cr;
                end else if (active_x < X_P4_6) begin // -2% Black
                    Y0 = COLOR_P4_MINUS2BLACK_Y;
                    Y1 = COLOR_P4_MINUS2BLACK_Y;
                    Cb = COLOR_P4_MINUS2BLACK_Cb;
                    Cr = COLOR_P4_MINUS2BLACK_Cr;
                end else if (active_x < X_P4_7) begin // 0% Black
                    Y0 = COLOR_P4_0BLACK_Y;
                    Y1 = COLOR_P4_0BLACK_Y;
                    Cb = COLOR_P4_0BLACK_Cb;
                    Cr = COLOR_P4_0BLACK_Cr;
                end else if (active_x < X_P4_8) begin // +2% Black
                    Y0 = COLOR_P4_PLUS2BLACK_Y;
                    Y1 = COLOR_P4_PLUS2BLACK_Y;
                    Cb = COLOR_P4_PLUS2BLACK_Cb;
                    Cr = COLOR_P4_PLUS2BLACK_Cr;
                end else if (active_x < X_P4_9) begin // 0% Black
                    Y0 = COLOR_P4_0BLACK_Y;
                    Y1 = COLOR_P4_0BLACK_Y;
                    Cb = COLOR_P4_0BLACK_Cb;
                    Cr = COLOR_P4_0BLACK_Cr;
                end else if (active_x < X_P4_10) begin // +4% Black
                    Y0 = COLOR_P4_PLUS4BLACK_Y;
                    Y1 = COLOR_P4_PLUS4BLACK_Y;
                    Cb = COLOR_P4_PLUS4BLACK_Cb;
                    Cr = COLOR_P4_PLUS4BLACK_Cr;
                end else if (active_x < X_P4_11) begin // 0% Black
                    Y0 = COLOR_P4_0BLACK_Y;
                    Y1 = COLOR_P4_0BLACK_Y;
                    Cb = COLOR_P4_0BLACK_Cb;
                    Cr = COLOR_P4_0BLACK_Cr;
                end else begin // 15% Gray
                    Y0 = COLOR_P4_15GRAY_Y;
                    Y1 = COLOR_P4_15GRAY_Y;
                    Cb = COLOR_P4_15GRAY_Cb;
                    Cr = COLOR_P4_15GRAY_Cr;
                end
            end
        end
    end
endmodule

