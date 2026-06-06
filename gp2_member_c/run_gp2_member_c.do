transcript on

if {[file exists work]} {
    vdel -lib work -all
}

vlib work
vmap work work

vcom -2008 ../common/asp_packet_pkg.vhd
vcom -2008 ../common/TdmaMinTypes.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/asp_types.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/asp_constants.vhd

vcom -2008 ../adc_asp/adc_asp_core.vhd
vcom -2008 ../adc_asp/adc_asp.vhd
vcom -2008 ../avg_asp/avg_asp_core.vhd
vcom -2008 ../avg_asp/avg_asp.vhd

vcom -2008 AverageFilteredData_sim.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/address_generator.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/mac.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/multicycle_moore_machine.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/Correlation_Calculator.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/CorAspDecoder.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/CorAspEncoder.vhd
vcom -2008 ../COR-ASP/ASP/ASPVHDL/Correlation_ASP.vhd

vcom -2008 ../PD-ASP/pd_core.vhd
vcom -2008 ../PD-ASP/pd_asp.vhd
vcom -2008 ../PD-ASP/PeakDetector_ASP.vhd

vcom -2008 gp2_asp_noc_top.vhd
vcom -2008 gp2_asp_noc_tb.vhd

vsim -wlf gp2_member_c_smoke.wlf work.gp2_asp_noc_tb

add wave -divider "Mock NoC"
add wave -radix hexadecimal sim:/gp2_asp_noc_tb/mock_send
add wave -radix hexadecimal sim:/gp2_asp_noc_tb/debug_route
add wave -radix hexadecimal sim:/gp2_asp_noc_tb/mock_recv

add wave -divider "ASP Sends"
add wave -radix hexadecimal sim:/gp2_asp_noc_tb/debug_adc_send
add wave -radix hexadecimal sim:/gp2_asp_noc_tb/debug_avg_send
add wave -radix hexadecimal sim:/gp2_asp_noc_tb/debug_cor_send
add wave -radix hexadecimal sim:/gp2_asp_noc_tb/debug_pk_send

run 5 us
