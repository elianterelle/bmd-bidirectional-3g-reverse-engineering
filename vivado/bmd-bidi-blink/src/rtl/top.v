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
        output wire led_hdmi_lock
    );
        
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

    reg [31:0] counter = 0;

    assign led_hdmi_lock = counter[27];
    assign led_sdi_lock = counter[26];

    always @(posedge clk) begin
        counter <= counter + 1;
    end

endmodule
