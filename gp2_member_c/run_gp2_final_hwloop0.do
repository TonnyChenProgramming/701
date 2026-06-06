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

vcom -2008 ../recop/RecopVHDL/Main/recop_types.vhd
vcom -2008 ../recop/RecopVHDL/Main/various_constants.vhd
vcom -2008 ../recop/RecopVHDL/Main/sip_to_noc_command_encoder.vhd
vcom -2008 ../recop/RecopVHDL/Main/noc_status_to_sop_decoder.vhd

vcom -2008 ../nios_support/adapter/avalon_noc_adapter.vhd

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

vcom -2008 gp2_recop_control_io.vhd
vcom -2008 gp2_final_noc_asp_top.vhd
vcom -2008 gp2_final_hwloop0_tb.vhd

vsim -wlf gp2_final_hwloop0.wlf work.gp2_final_hwloop0_tb

add wave -divider "Nios Avalon"
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/avs_address
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/avs_writedata
add wave sim:/gp2_final_hwloop0_tb/avs_write
add wave sim:/gp2_final_hwloop0_tb/avs_read
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/avs_readdata

add wave -divider "NoC Clients"
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/nios_send
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/recop_send
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/debug_route
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/recop_recv
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/nios_recv
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/recop_ledr

add wave -divider "ASP Sends"
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/debug_adc_send
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/debug_avg_send
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/debug_cor_send
add wave -radix hexadecimal sim:/gp2_final_hwloop0_tb/debug_pk_send

run 200 us
