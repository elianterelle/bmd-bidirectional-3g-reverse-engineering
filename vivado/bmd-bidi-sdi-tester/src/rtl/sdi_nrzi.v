`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2026 02:47:00 PM
// Design Name: 
// Module Name: sdi_nrzi
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


module sdi_nrzi(
        input wire [19:0] data_in,
        input wire clk,
        input wire reset,
        output wire [19:0] data_out
    );
    
    reg [19:0] nrzi_reg;
    wire [19:0] nrzi_next;
    assign data_out = nrzi_reg;
    
    assign nrzi_next = data_in ^ {nrzi_next[18:0], nrzi_reg[19]};
    
    always @(posedge clk) begin
        if (reset) begin
            nrzi_reg <= 20'b0;
        end else begin
            nrzi_reg <= nrzi_next;
        end
    end
endmodule
