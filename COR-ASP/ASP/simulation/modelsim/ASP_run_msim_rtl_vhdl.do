transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/TdmaMinTypes.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/asp_packet_pkg.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/asp_types.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/AverageFilteredData.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/CorAspDecoder.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/asp_constants.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/CorAspEncoder.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/multicycle_moore_machine.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/mac.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/address_generator.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/Correlation_Calculator.vhd}
vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/Correlation_ASP.vhd}

vcom -93 -work work {C:/intelFPGA_lite/18.1/701/701/TonnyASP/ASP/ASPVHDL/Correlation_ASP_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Correlation_ASP_tb

add wave *
view structure
view signals
run -all
