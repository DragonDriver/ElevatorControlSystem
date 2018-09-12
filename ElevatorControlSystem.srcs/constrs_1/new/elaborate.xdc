############################
# input switch #
############################
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN P4 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN P3 [get_ports closeSignal]
set_property IOSTANDARD LVCMOS33 [get_ports closeSignal]
set_property PACKAGE_PIN R3 [get_ports openSignal]
set_property IOSTANDARD LVCMOS33 [get_ports openSignal]

set_property PACKAGE_PIN T1 [get_ports inButton1]
set_property IOSTANDARD LVCMOS33 [get_ports inButton1]
set_property PACKAGE_PIN T3 [get_ports inButton4]
set_property IOSTANDARD LVCMOS33 [get_ports inButton4]
set_property PACKAGE_PIN U2 [get_ports inButton6]
set_property IOSTANDARD LVCMOS33 [get_ports inButton6]
set_property PACKAGE_PIN V2 [get_ports inButton8]
set_property IOSTANDARD LVCMOS33 [get_ports inButton8]

set_property PACKAGE_PIN U4 [get_ports outUp1]
set_property IOSTANDARD LVCMOS33 [get_ports outUp1]

set_property PACKAGE_PIN V5 [get_ports outUp4]
set_property IOSTANDARD LVCMOS33 [get_ports outUp4]

set_property PACKAGE_PIN V6 [get_ports outDown4]
set_property IOSTANDARD LVCMOS33 [get_ports outDown4]

set_property PACKAGE_PIN V7 [get_ports outUp6]
set_property IOSTANDARD LVCMOS33 [get_ports outUp6]

set_property PACKAGE_PIN R5 [get_ports outDown6]
set_property IOSTANDARD LVCMOS33 [get_ports outDown6]

set_property PACKAGE_PIN R6 [get_ports outDown8]
set_property IOSTANDARD LVCMOS33 [get_ports outDown8]

############################
# output led #
############################

##7 segment display
set_property PACKAGE_PIN L3 [get_ports {seg[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN N1 [get_ports {seg[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN L5 [get_ports {seg[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN L4 [get_ports {seg[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN K3 [get_ports {seg[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN M2 [get_ports {seg[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN L6 [get_ports {seg[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN M4 [get_ports {seg[7]}]							
set_property IOSTANDARD LVCMOS33 [get_ports {seg[7]}]

set_property PACKAGE_PIN N6 [get_ports {an[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN M6 [get_ports {an[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN M3 [get_ports {an[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN N5 [get_ports {an[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
set_property PACKAGE_PIN N2 [get_ports {an[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[4]}]
set_property PACKAGE_PIN N4 [get_ports {an[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[5]}]
set_property PACKAGE_PIN L1 [get_ports {an[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[6]}]
set_property PACKAGE_PIN M1 [get_ports {an[7]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {an[7]}]


set_property PACKAGE_PIN R2 [get_ports powerLight]
set_property IOSTANDARD LVCMOS33 [get_ports powerLight]
set_property PACKAGE_PIN U1 [get_ports upLight]
set_property IOSTANDARD LVCMOS33 [get_ports upLight]
set_property PACKAGE_PIN P5 [get_ports downLight]
set_property IOSTANDARD LVCMOS33 [get_ports downLight]
set_property PACKAGE_PIN R1 [get_ports openLight]
set_property IOSTANDARD LVCMOS33 [get_ports openLight]
set_property PACKAGE_PIN V1 [get_ports closeLight]
set_property IOSTANDARD LVCMOS33 [get_ports closeLight]


############################
# request state #
############################
set_property PACKAGE_PIN V4 [get_ports request1]
set_property IOSTANDARD LVCMOS33 [get_ports request1]
set_property PACKAGE_PIN U6 [get_ports request4]
set_property IOSTANDARD LVCMOS33 [get_ports request4]
set_property PACKAGE_PIN U7 [get_ports request6]
set_property IOSTANDARD LVCMOS33 [get_ports request6]
set_property PACKAGE_PIN T4 [get_ports request8]
set_property IOSTANDARD LVCMOS33 [get_ports request8]
set_property PACKAGE_PIN T6 [get_ports request4up]
set_property IOSTANDARD LVCMOS33 [get_ports request4up]
set_property PACKAGE_PIN R8 [get_ports request4down]
set_property IOSTANDARD LVCMOS33 [get_ports request4down]
set_property PACKAGE_PIN V9 [get_ports request6up]
set_property IOSTANDARD LVCMOS33 [get_ports request6up]
set_property PACKAGE_PIN T8 [get_ports request6down]
set_property IOSTANDARD LVCMOS33 [get_ports request6down]