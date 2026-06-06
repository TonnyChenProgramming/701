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
vcom -2008 gp2_asp_noc_real_pipeline_tb.vhd

vsim -wlf gp2_member_c_real_pipeline.wlf work.gp2_asp_noc_real_pipeline_tb

add wave -divider "Mock NoC"
add wave -radix hexadecimal sim:/gp2_asp_noc_real_pipeline_tb/mock_send
add wave -radix hexadecimal sim:/gp2_asp_noc_real_pipeline_tb/debug_route
add wave -radix hexadecimal sim:/gp2_asp_noc_real_pipeline_tb/mock_recv

add wave -divider "ASP Sends"
add wave -radix hexadecimal sim:/gp2_asp_noc_real_pipeline_tb/debug_adc_send
add wave -radix hexadecimal sim:/gp2_asp_noc_real_pipeline_tb/debug_avg_send
add wave -radix hexadecimal sim:/gp2_asp_noc_real_pipeline_tb/debug_cor_send
add wave -radix hexadecimal sim:/gp2_asp_noc_real_pipeline_tb/debug_pk_send

add wave -divider "ADC/AVG Internals"
add wave -radix decimal sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_adc/u_core/phase
add wave -radix decimal sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_adc/u_core/sample_reg
add wave sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_adc/u_core/out_valid_reg
add wave sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_avg/u_core/in_valid
add wave sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_avg/u_core/in_ready_i
add wave -radix decimal sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_avg/u_core/valid_count
add wave -radix decimal sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_avg/u_core/running_sum
add wave -radix decimal sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_avg/u_core/avg_reg
add wave sim:/gp2_asp_noc_real_pipeline_tb/u_dut/u_avg/u_core/out_valid_reg

run 20 us

echo "Wave hint: first ADC packet 0x20200000 is at 1850 ns; first AVG packet 0x203001F7 is at 2270 ns."
echo "If the wave value column shows {07} {00000000}, the cursor is on an idle cycle. Zoom near 1800-2320 ns."
WaveRestoreZoom {1800 ns} {2320 ns}
