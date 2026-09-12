`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2026 04:59:51 PM
// Design Name: 
// Module Name: sdi_scrambler
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


module sdi_scrambler(
        input wire [19:0] data_in,
        input wire clk,
        input wire reset,
        output wire [19:0] data_out
    );
    
    reg [9:0] scram_reg;
    wire [9:0] scram_mid;
    wire [9:0] scram_next;
    assign data_out = {scram_next, scram_mid};
    
    assign scram_mid = data_in[9:0] ^ {scram_mid[4:0], scram_reg[9:5]} ^ {scram_mid[0], scram_reg[9:1]}; // first 10 bit word of 20 bit
    assign scram_next = data_in[19:10] ^ {scram_next[4:0], scram_mid[9:5]} ^ {scram_next[0], scram_mid[9:1]}; // second 10 bit word of 20 bit
    
    always @(posedge clk) begin
        if (reset) begin
            scram_reg <= 10'b0;
        end else begin
            scram_reg <= scram_next;
        end
    end
endmodule
