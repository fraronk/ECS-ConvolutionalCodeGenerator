create_clock -period 3.000 -name clk_constr -waveform {0.000 1.500} [get_ports clk]






set_property IOSTANDARD LVCMOS33 [get_ports a_in]
set_property IOSTANDARD LVCMOS33 [get_ports a_out]
set_property IOSTANDARD LVCMOS33 [get_ports c]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN L16 [get_ports clk]
set_property PACKAGE_PIN R18 [get_ports rst]
set_property PACKAGE_PIN F20 [get_ports a_out]
set_property PACKAGE_PIN H20 [get_ports c]
set_property PACKAGE_PIN G15 [get_ports a_in]
