// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: xilinx.com:ip:ibert_7series_gtp:3.0

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module ibert_7series_gtp_0_sv (
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] TXN_O,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] TXP_O,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire RXOUTCLK_O,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] RXN_I,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] RXP_I,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] GTREFCLK0_I,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] GTREFCLK1_I,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire SYSCLK_I
);

  ibert_7series_gtp_0 inst (
    .TXN_O(TXN_O),
    .TXP_O(TXP_O),
    .RXOUTCLK_O(RXOUTCLK_O),
    .RXN_I(RXN_I),
    .RXP_I(RXP_I),
    .GTREFCLK0_I(GTREFCLK0_I),
    .GTREFCLK1_I(GTREFCLK1_I),
    .SYSCLK_I(SYSCLK_I)
  );

endmodule
