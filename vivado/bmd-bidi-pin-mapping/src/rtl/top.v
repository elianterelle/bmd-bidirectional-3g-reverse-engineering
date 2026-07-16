`timescale 1ns / 1ps
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
        input wire [47:0] pins14,
        input wire [49:0] pins15,
        input wire [49:0] pins34
    );
    
wire ibufds_clk;
wire ibufds_clk_div2;

(* MARK_DEBUG = "TRUE" *) reg [47:0] r14;
(* MARK_DEBUG = "TRUE" *) reg [49:0] r15;
(* MARK_DEBUG = "TRUE" *) reg [49:0] r34;
    
IBUFDS_GTE2 #(
   .CLKCM_CFG("TRUE"),   // Enables 50 Ohm termination voltage. Must be true according to UG476
   .CLKRCV_TRST("TRUE"), // Enables 50 Ohm termination resistors. Must be true according to UG476
   .CLKSWING_CFG(2'b11)  // Controls Swing, must be set to 2'b11 according to UG476
)
IBUFDS_GTE2_inst (
   .O(ibufds_clk),         // Output
   .ODIV2(ibufds_clk_div2), // Divide by 2 Output
   .CEB(1'b0),     // 0: Active, 1: Power Down
   .I(refclk_p),         // P
   .IB(refclk_n)        // N
);

wire clk;

BUFG BUFG_inst (
   .O(clk), // 1-bit output: Clock output
   .I(ibufds_clk)  // 1-bit input: Clock input
);

(* MARK_DEBUG = "TRUE" *) reg [15:0] counter = 0;

(* MARK_DEBUG = "TRUE" *) reg change14 = 0;
localparam R14_MASK = 48'b111011101111111111111111111111111111111111111111;

(* MARK_DEBUG = "TRUE" *) reg change15 = 0;
localparam R15_MASK = 50'b11111111111111111111111111111111111111111111111111;

(* MARK_DEBUG = "TRUE" *) reg change34 = 0;
localparam R34_MASK = 50'b11111111111111111111111111111111111111111111111111;

always @(posedge clk) begin
    counter <= counter + 1;
    
    if ((r14 & R14_MASK) != (pins14 & R14_MASK)) begin
        change14 <= 1;
    end else begin
        change14 <= 0;
    end
    
    if ((r15 & R15_MASK) != (pins15 & R15_MASK)) begin
        change15 <= 1;
    end else begin
        change15 <= 0;
    end
    
    if ((r34 & R34_MASK) != (pins34 & R34_MASK)) begin
        change34 <= 1;
    end else begin
        change34 <= 0;
    end
    
    r14 <= pins14;
    r15 <= pins15;
    r34 <= pins34;
end

endmodule
