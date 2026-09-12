
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

# STM32 SPI (STM32 is the master, FPGA the slave)
# Bank 14 is 3.3V. cs_n gets a pull up so the register file stays deselected
# while the STM32 is in reset and its pins are still floating.
set_property PACKAGE_PIN L14 [get_ports spi_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs_n]
set_property PULLUP true [get_ports spi_cs_n]
set_property PACKAGE_PIN V13 [get_ports spi_sck]
set_property IOSTANDARD LVCMOS33 [get_ports spi_sck]
set_property PACKAGE_PIN U17 [get_ports spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports spi_mosi]
set_property PACKAGE_PIN U14 [get_ports spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports spi_miso]

# The inputs are oversampled in the clk domain behind ASYNC_REG synchronisers,
# and miso is turned around off the same oversampled sck, so none of these are
# timed against a clock. Keep sck at or below roughly clk/10.
set_false_path -from [get_ports spi_cs_n]
set_false_path -from [get_ports spi_sck]
set_false_path -from [get_ports spi_mosi]
set_false_path -to [get_ports spi_miso]

# SDI TX
set_property PACKAGE_PIN H1 [get_ports gtp_tx_n]
set_property PACKAGE_PIN H2 [get_ports gtp_tx_p]

set_property PACKAGE_PIN R15 [get_ports sdi_driver_rsti]
set_property PACKAGE_PIN R17 [get_ports sdi_driver_enable]
set_property IOSTANDARD LVCMOS33 [get_ports sdi_driver_enable]
set_property IOSTANDARD LVCMOS33 [get_ports sdi_driver_rsti]

