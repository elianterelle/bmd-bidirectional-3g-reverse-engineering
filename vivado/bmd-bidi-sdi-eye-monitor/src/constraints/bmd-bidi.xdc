
# Clocks
set_property LOC IBUFDS_GTE2_X0Y1 [get_cells IBUFDS_GTE2_inst]
set_property PACKAGE_PIN B6 [get_ports refclk_p]
create_clock -period 6.734 [get_ports refclk_p]

create_generated_clock -source [get_pins BUFGCE_div2_inst/I] -divide_by 2 [get_pins BUFGCE_div2_inst/O]
create_generated_clock -source [get_pins BUFGCE_div4_inst/I] -divide_by 4 [get_pins BUFGCE_div4_inst/O]

# LEDs
set_property PACKAGE_PIN N18 [get_ports led_hdmi_lock]
set_property IOSTANDARD LVCMOS33 [get_ports led_hdmi_lock]
set_property PACKAGE_PIN U9 [get_ports led_sdi_lock]
set_property IOSTANDARD LVCMOS33 [get_ports led_sdi_lock]
set_false_path -to [get_ports led_hdmi_lock]
set_false_path -to [get_ports led_sdi_lock]

# SDI TX
set_property PACKAGE_PIN H1 [get_ports gtp_tx_n]
set_property PACKAGE_PIN H2 [get_ports gtp_tx_p]

set_property PACKAGE_PIN R15 [get_ports sdi_driver_rsti]
set_property PACKAGE_PIN R17 [get_ports sdi_driver_enable]
set_property IOSTANDARD LVCMOS33 [get_ports sdi_driver_enable]
set_property IOSTANDARD LVCMOS33 [get_ports sdi_driver_rsti]

set_property LOC GTPE2_CHANNEL_X0Y0 [get_cells gtpe2_i]
set_property LOC GTPE2_CHANNEL_X0Y3 [get_cells rx_inst/gtpe2_rx_i]

