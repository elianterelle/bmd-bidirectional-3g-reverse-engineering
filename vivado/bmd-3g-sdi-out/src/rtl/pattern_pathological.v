`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2026 12:07:40 AM
// Design Name: 
// Module Name: pathological
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


module pattern_pathological(
        input wire clk,
        input wire reset,
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

    reg [9:0] Y0_next;
    reg [9:0] Cb_next;
    reg [9:0] Y1_next;
    reg [9:0] Cr_next;

    wire [11:0] active_x = x - ACTIVE_START_X;
    wire [10:0] active_y = y - ACTIVE_START_Y;

    always @(posedge clk) begin
        if (reset) begin
            Y0 <= 0;
            Cb <= 0;
            Y1 <= 0;
            Cr <= 0;
        end else begin
            Y0 <= Y0_next;
            Cb <= Cb_next;
            Y1 <= Y1_next;
            Cr <= Cr_next;
        end
    end

    always @(*) begin
        Y0_next = 10'h040;
        Cb_next = 10'h200;
        Y1_next = 10'h040;
        Cr_next = 10'h200;

        if (x >= ACTIVE_START_X && x <= ACTIVE_END_X && y >= ACTIVE_START_Y && y <= ACTIVE_END_Y) begin
            if (active_y < 540) begin // upper half
                Y0_next = 10'h198;
                Y1_next = 10'h198;
                Cr_next = 10'h300; 
                Cb_next = 10'h300;
            end else begin // lower half
                Y0_next = 10'h110;
                Y1_next = 10'h110;
                Cr_next = 10'h200;
                Cb_next = 10'h200;
            end
        end
    end
endmodule
