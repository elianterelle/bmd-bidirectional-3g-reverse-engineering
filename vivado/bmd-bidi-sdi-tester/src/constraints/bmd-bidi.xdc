
# Clocks
set_property LOC IBUFDS_GTE2_X0Y1 [get_cells IBUFDS_GTE2_inst]
set_property PACKAGE_PIN B6 [get_ports refclk_p]
create_clock -period 6.734 [get_ports refclk_p]

# Both BUFGCEs switch their divider at runtime (HD-SDI: /2 and /4,
# 3G-SDI: /1 and /2). They are constrained for the faster 3G-SDI case, which
# also covers HD-SDI.
create_generated_clock -source [get_pins BUFGCE_sdi_clk_inst/I] -divide_by 1 [get_pins BUFGCE_sdi_clk_inst/O]
create_generated_clock -source [get_pins BUFGCE_pixel_pair_clk_inst/I] -divide_by 2 [get_pins BUFGCE_pixel_pair_clk_inst/O]

# LEDs
set_property PACKAGE_PIN N18 [get_ports led_hdmi_lock]
set_property IOSTANDARD LVCMOS33 [get_ports led_hdmi_lock]
set_property PACKAGE_PIN U9 [get_ports led_sdi_lock]
set_property IOSTANDARD LVCMOS33 [get_ports led_sdi_lock]
set_false_path -to [get_ports led_hdmi_lock]
set_false_path -to [get_ports led_sdi_lock]

# Mode switches
# TODO: adjust to wherever the switches are actually wired up. TP3 and TP4 are
# in bank 34 (1.2V), the internal pull up lets a switch to GND drive them.
set_property PACKAGE_PIN R1 [get_ports sw_rate_3g]
set_property IOSTANDARD LVCMOS12 [get_ports sw_rate_3g]
set_property PULLUP true [get_ports sw_rate_3g]
set_property PACKAGE_PIN U1 [get_ports sw_pattern_pathological]
set_property IOSTANDARD LVCMOS12 [get_ports sw_pattern_pathological]
set_property PULLUP true [get_ports sw_pattern_pathological]
set_false_path -from [get_ports sw_rate_3g]
set_false_path -from [get_ports sw_pattern_pathological]

# SDI TX
set_property PACKAGE_PIN H1 [get_ports gtp_tx_n]
set_property PACKAGE_PIN H2 [get_ports gtp_tx_p]

set_property PACKAGE_PIN R15 [get_ports sdi_driver_rsti]
set_property PACKAGE_PIN R17 [get_ports sdi_driver_enable]
set_property IOSTANDARD LVCMOS33 [get_ports sdi_driver_enable]
set_property IOSTANDARD LVCMOS33 [get_ports sdi_driver_rsti]

