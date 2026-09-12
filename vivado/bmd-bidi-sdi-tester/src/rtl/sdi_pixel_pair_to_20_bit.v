`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2026 11:30:42 PM
// Design Name: 
// Module Name: sdi_pixel_pair_to_20_bit
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


module sdi_pixel_pair_to_20_bit(
        input wire clk,
        input wire reset,

        input wire [9:0] source_Y0,
        input wire [9:0] source_Cb,
        input wire [9:0] source_Y1,
        input wire [9:0] source_Cr,

        output wire [19:0] data_out
    );


    wire [9:0] Y;
    wire [9:0] CbCr;

    reg index = 0;

    assign Y = index ? source_Y0 : source_Y1;
    assign CbCr = index ? source_Cb : source_Cr;

    // reset is released so that the first clk edge after it is also a
    // pixel_pair_clk edge, which puts index in the right phase for both
    // HD-SDI and 3G-SDI.
    always @(posedge clk) begin
        if (reset) begin
            index <= 0;
        end else begin
            index <= ~index;
        end
    end

    assign data_out = {Y, CbCr};

endmodule
