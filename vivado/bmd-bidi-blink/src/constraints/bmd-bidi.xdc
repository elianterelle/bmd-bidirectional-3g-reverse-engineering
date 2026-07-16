
# Clocks
set_property LOC IBUFDS_GTE2_X0Y1 [get_cells IBUFDS_GTE2_inst]
set_property PACKAGE_PIN B6 [get_ports refclk_p]
create_clock -period 6.734 [get_ports refclk_p]

# LEDs
set_property PACKAGE_PIN N18 [get_ports led_hdmi_lock]
set_property IOSTANDARD LVCMOS33 [get_ports led_hdmi_lock]
set_property PACKAGE_PIN U9 [get_ports led_sdi_lock]
set_property IOSTANDARD LVCMOS33 [get_ports led_sdi_lock]
set_false_path -to [get_ports led_hdmi_lock]
set_false_path -to [get_ports led_sdi_lock]
