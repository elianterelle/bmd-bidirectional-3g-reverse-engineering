# (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
#
# This file contains confidential and proprietary information
# of AMD and is protected under U.S. and international copyright
# and other intellectual property laws.
#
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# AMD, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) AMD shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or AMD had been advised of the
# possibility of the same.
#
# CRITICAL APPLICATIONS
# AMD products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of AMD products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.
############################################################
set GT_CHANNELs [get_cells -hier -filter LIB_CELL=~GT*CHANNEL]
set GT_clockRegions [get_clock_regions -of $GT_CHANNELs]

foreach clockRegion $GT_clockRegions {
    create_pblock pblock_clockregion_$clockRegion
    resize_pblock pblock_clockregion_$clockRegion -add CLOCKREGION_$clockRegion:CLOCKREGION_$clockRegion
}

set i 0; 
foreach channel $GT_CHANNELs {
    set fanin [get_cells -of [get_pins -leaf -of [get_nets -segments -of  [get_pins -of [get_cells $channel] -filter DIRECTION==IN]] -filter DIRECTION==OUT] -filter REF_NAME!~*BUF*&&REF_NAME!~GT*COMMON]
    set fanout [get_cells -of [get_pins -leaf -of [get_nets -segments -of  [get_pins -of [get_cells $channel] -filter DIRECTION==OUT]] -filter DIRECTION==IN&&!IS_CLOCK] -filter REF_NAME!~*BUF*]
    set clockRegion [get_clock_regions -of $channel]
    add_cells_to_pblock pblock_clockregion_$clockRegion $fanin  -clear_locs 
    add_cells_to_pblock pblock_clockregion_$clockRegion $fanout  -clear_locs 
}
