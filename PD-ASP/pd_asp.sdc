# SDC constraints for pd_asp
#
# Target: 100 MHz system clock. PD-ASP sits inside the FPGA as part of
# the HMPSoC, so source/destination registers driving its IOs are also
# inside the FPGA — IO delays are tight (~0.5 ns), not the conservative
# 2 ns I had before.

create_clock -name clk -period 10.0 [get_ports {clk}]

set_input_delay  -clock clk -max 0.5 [all_inputs]
set_input_delay  -clock clk -min 0.1 [all_inputs]
set_output_delay -clock clk -max 0.5 [all_outputs]
set_output_delay -clock clk -min 0.1 [all_outputs]

# The reset is asynchronous — not in clocked timing analysis
set_false_path -from [get_ports reset]
