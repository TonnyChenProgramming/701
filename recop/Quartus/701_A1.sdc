# 701_A1.sdc
# 50 MHz clock constraint

create_clock -name clk -period 20.000 [get_ports CLOCK_50]

derive_clock_uncertainty