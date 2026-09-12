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
        input wire refclk0_p,
        input wire refclk0_n,
        input wire refclk1_p,
        input wire refclk1_n,
        output wire led_sdi_lock,
        output wire led_hdmi_lock,
        output wire [3:0] gtp_rx_n,
        output wire gtp_rx_p,
        output wire gtp_tx_n,
        output wire gtp_tx_p,
        output wire sdi_driver_rsti,
        output wire sdi_driver_enable
    );
    
assign sdi_driver_rsti = 1'b1;
assign sdi_driver_enable = 1'b1;
    
wire refclk0;
    
IBUFDS_GTE2 #(
   .CLKCM_CFG("TRUE"),   // Enables 50 Ohm termination voltage. Must be true according to UG476
   .CLKRCV_TRST("TRUE"), // Enables 50 Ohm termination resistors. Must be true according to UG476
   .CLKSWING_CFG(2'b11)  // Controls Swing, must be set to 2'b11 according to UG476
)
IBUFDS_GTE2_inst (
   .O(refclk0),         // Output
   .ODIV2(), // Divide by 2 Output
   .CEB(1'b0),     // 0: Active, 1: Power Down
   .I(refclk0_p),         // P
   .IB(refclk0_n)        // N
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
   .I(refclk1_p),         // P
   .IB(refclk1_n)        // N
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


ibert_7series_gtp_0_sv ibert_inst (
  .TXN_O(TXN_O), // output wire [3:0] TXN_O
  .TXP_O(TXP_O), // output wire [3:0] TXP_O
  .RXOUTCLK_O(RXOUTCLK_O), // output wire RXOUTCLK_O
  .RXN_I(RXN_I), // input wire [3:0] RXN_I
  .RXP_I(RXP_I), // input wire [3:0] RXP_I
  .GTREFCLK0_I(GTREFCLK0_I), // input wire [0:0] GTREFCLK0_I
  .GTREFCLK1_I(GTREFCLK1_I), // input wire [0:0] GTREFCLK1_I
  .SYSCLK_I(SYSCLK_I) // input wire SYSCLK_I
);

endmodule
