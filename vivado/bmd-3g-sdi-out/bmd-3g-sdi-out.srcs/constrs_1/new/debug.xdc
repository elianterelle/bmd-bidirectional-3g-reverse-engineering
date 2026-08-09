create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 20 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {sdi_scrambler_data[0]} {sdi_scrambler_data[1]} {sdi_scrambler_data[2]} {sdi_scrambler_data[3]} {sdi_scrambler_data[4]} {sdi_scrambler_data[5]} {sdi_scrambler_data[6]} {sdi_scrambler_data[7]} {sdi_scrambler_data[8]} {sdi_scrambler_data[9]} {sdi_scrambler_data[10]} {sdi_scrambler_data[11]} {sdi_scrambler_data[12]} {sdi_scrambler_data[13]} {sdi_scrambler_data[14]} {sdi_scrambler_data[15]} {sdi_scrambler_data[16]} {sdi_scrambler_data[17]} {sdi_scrambler_data[18]} {sdi_scrambler_data[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {txchardispmode[0]} {txchardispmode[1]} {txchardispmode[2]} {txchardispmode[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {txchardispval[0]} {txchardispval[1]} {txchardispval[2]} {txchardispval[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {clkdiv_counter[0]} {clkdiv_counter[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 10 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {source_Y1[0]} {source_Y1[1]} {source_Y1[2]} {source_Y1[3]} {source_Y1[4]} {source_Y1[5]} {source_Y1[6]} {source_Y1[7]} {source_Y1[8]} {source_Y1[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 10 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {source_Y0[0]} {source_Y0[1]} {source_Y0[2]} {source_Y0[3]} {source_Y0[4]} {source_Y0[5]} {source_Y0[6]} {source_Y0[7]} {source_Y0[8]} {source_Y0[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 10 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {source_Cr[0]} {source_Cr[1]} {source_Cr[2]} {source_Cr[3]} {source_Cr[4]} {source_Cr[5]} {source_Cr[6]} {source_Cr[7]} {source_Cr[8]} {source_Cr[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {counter[0]} {counter[1]} {counter[2]} {counter[3]} {counter[4]} {counter[5]} {counter[6]} {counter[7]} {counter[8]} {counter[9]} {counter[10]} {counter[11]} {counter[12]} {counter[13]} {counter[14]} {counter[15]} {counter[16]} {counter[17]} {counter[18]} {counter[19]} {counter[20]} {counter[21]} {counter[22]} {counter[23]} {counter[24]} {counter[25]} {counter[26]} {counter[27]} {counter[28]} {counter[29]} {counter[30]} {counter[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 20 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {sdi_nrzi_data[0]} {sdi_nrzi_data[1]} {sdi_nrzi_data[2]} {sdi_nrzi_data[3]} {sdi_nrzi_data[4]} {sdi_nrzi_data[5]} {sdi_nrzi_data[6]} {sdi_nrzi_data[7]} {sdi_nrzi_data[8]} {sdi_nrzi_data[9]} {sdi_nrzi_data[10]} {sdi_nrzi_data[11]} {sdi_nrzi_data[12]} {sdi_nrzi_data[13]} {sdi_nrzi_data[14]} {sdi_nrzi_data[15]} {sdi_nrzi_data[16]} {sdi_nrzi_data[17]} {sdi_nrzi_data[18]} {sdi_nrzi_data[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {txdata[0]} {txdata[1]} {txdata[2]} {txdata[3]} {txdata[4]} {txdata[5]} {txdata[6]} {txdata[7]} {txdata[8]} {txdata[9]} {txdata[10]} {txdata[11]} {txdata[12]} {txdata[13]} {txdata[14]} {txdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 20 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {sdi_20bit_data[0]} {sdi_20bit_data[1]} {sdi_20bit_data[2]} {sdi_20bit_data[3]} {sdi_20bit_data[4]} {sdi_20bit_data[5]} {sdi_20bit_data[6]} {sdi_20bit_data[7]} {sdi_20bit_data[8]} {sdi_20bit_data[9]} {sdi_20bit_data[10]} {sdi_20bit_data[11]} {sdi_20bit_data[12]} {sdi_20bit_data[13]} {sdi_20bit_data[14]} {sdi_20bit_data[15]} {sdi_20bit_data[16]} {sdi_20bit_data[17]} {sdi_20bit_data[18]} {sdi_20bit_data[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 10 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {source_Cb[0]} {source_Cb[1]} {source_Cb[2]} {source_Cb[3]} {source_Cb[4]} {source_Cb[5]} {source_Cb[6]} {source_Cb[7]} {source_Cb[8]} {source_Cb[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list pll0lock]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list pll0pd]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list resetsel]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list txbufstatus_out]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list txpcsreset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list txpmareset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list txreset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list txresetdone]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list txuserrdy]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
