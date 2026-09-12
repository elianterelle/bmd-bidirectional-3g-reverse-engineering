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
foreach channel [get_cells -hier -filter LIB_CELL=~GT*CHANNEL] {
	create_pblock [get_property NAME $channel]
    set col [get_property COLUMN [get_tiles -of [get_sites -of $channel]]]
    set row [get_property ROW [get_tiles -of [get_sites -of $channel]]]
    set height 4
    set width 6
    if {$col == 84} {set coor_x [expr "33 - $width + 1"]};#xc7a25t, xc7a12
    if {$col == 97} {set coor_x [expr "57 - $width + 1"]}; #xc7a35, xc7a50 right GTP column
    if {$col == 130} {set coor_x [expr "81 - $width + 1"]}; #xc7a75, xc7a100 right GTP column
    if {$col == 155} {set coor_x [expr "97 - $width + 1"]}; #xc7z015, xc7z012 right GTP column
    if {$col == 103} {set coor_x [expr "51 - $width + 1"]}; #xca7a200 left GTP column 
    if {$col == 167} {set coor_x 114}; #xca7a200 right GTP column
    if {[regexp {xc7z015.*} [get_property PART [current_design]]] || [regexp {xc7z012.*} [get_property PART [current_design]]]} {
		set coor_y [expr {159 - $row}]
	} elseif {[regexp {xc7a35.*} [get_property PART [current_design]]] || [regexp {xa7a35.*} [get_property PART [current_design]]] || [regexp {xq7a35.*} [get_property PART [current_design]]]} {
		set coor_y [expr {155 - $row}]
	} elseif {[regexp {xc7a50.*} [get_property PART [current_design]]] || [regexp {xa7a50.*} [get_property PART [current_design]]] || [regexp {xq7a50.*} [get_property PART [current_design]]] || [regexp {xc7a15.*} [get_property PART [current_design]]] || [regexp {xa7a15.*} [get_property PART [current_design]]]} {
		set coor_y [expr {155 - $row}]
	} elseif {[regexp {xc7a75.*} [get_property PART [current_design]]] || [regexp {xq7a75.*} [get_property PART [current_design]]] || [regexp {xa7a75.*} [get_property PART [current_design]]]} {
		# two quads per column
		if {$row < 47} {set coor_y [expr {205 - $row}]} else {set coor_y [expr {211 - $row}]}
	} elseif {[regexp {xc7a100.*} [get_property PART [current_design]]] || [regexp {xa7a100.*} [get_property PART [current_design]]] || [regexp {xq7a100.*} [get_property PART [current_design]]]} {
		# two quads per column
		if {$row < 47} {set coor_y [expr {205 - $row}]} else {set coor_y [expr {211 - $row}]}
	} elseif {[regexp {xc7a200.*} [get_property PART [current_design]]] || [regexp {xq7a200.*} [get_property PART [current_design]]] || [regexp {xa7a200.*} [get_property PART [current_design]]]} {
		# two quads per column
		if {$row < 47} {set coor_y [expr {255 - $row}]} else {set coor_y [expr {263 - $row}]}
    } elseif {[regexp {xc7a25.*} [get_property PART [current_design]]] || [regexp {xc7a12.*} [get_property PART [current_design]]] || [regexp {xa7a25.*} [get_property PART [current_design]]] || [regexp {xa7a12.*} [get_property PART [current_design]]]} {
		# two quads per column
		if {$row < 47} {set coor_y [expr {104 - $row}]} else {set coor_y [expr {110 - $row}]}
    } else {
		puts "Wrong part targeted"
	}
	resize_pblock [get_property NAME $channel] -add SLICE_X${coor_x}Y[expr "${coor_y} - $height + 1"]:SLICE_X[expr "${coor_x} + $width - 1"]Y${coor_y}
    add_cells_to_pblock [get_property NAME $channel] [all_fanin -only_cells -levels 8 -flat [get_pins  [file dir $channel]/U_PATTERN_HANDLER/gen*.patchk*/genzero*.all_one_or_zero_reg/D ]] -clear_locs
}
