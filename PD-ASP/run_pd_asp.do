###############################################################################
# run_pd_asp.do
#
# ModelSim simulation script for the Peak-Detection ASP.
#
# Usage (from the ModelSim transcript, in your project folder):
#   do run_pd_asp.do
#
# This script:
#   1. Recompiles every source file from scratch (vdel + vlib)
#   2. Compiles in dependency order (package before users)
#   3. Starts the simulation with optimization disabled so every internal
#      signal is observable in the wave window
#   4. Builds a publication-quality wave window with grouped signals,
#      dividers, radix hints, and useful colour-coding
#   5. Runs the testbench to completion and zooms to fit
#
# Author: Eric Chen
# Course: COMPSYS 701, 2026, Individual Project
###############################################################################

#-----------------------------------------------------------------------------
# 1. Clean rebuild
#-----------------------------------------------------------------------------
if {[file exists work]} {
    vdel -all
}
vlib work

echo "------------------------------------------------------------------"
echo " Compiling PD-ASP sources..."
echo "------------------------------------------------------------------"

vcom -2008 -quiet asp_packet_pkg.vhd
vcom -2008 -quiet pd_core.vhd
vcom -2008 -quiet pd_asp.vhd
vcom -2008 -quiet pd_asp_tb.vhd

echo "------------------------------------------------------------------"
echo " Starting simulation (vsim -voptargs=+acc, all signals accessible)"
echo "------------------------------------------------------------------"

vsim -t ps -voptargs="+acc" work.pd_asp_tb

#-----------------------------------------------------------------------------
# 2. Wave window setup
#-----------------------------------------------------------------------------
# Clear any leftover wave configuration from a previous run
delete wave *

# ===== Group 1: Clock / reset =====
add wave -divider "Clock and reset"
add wave -color "Yellow" -label "clk"        sim:/pd_asp_tb/clk
add wave -color "Red"    -label "reset"      sim:/pd_asp_tb/reset

# ===== Group 2: NoC input handshake (from ReCOP / COR-ASP) =====
add wave -divider "NoC input from ReCOP and COR-ASP"
add wave -color "Cyan"   -label "in_valid"   sim:/pd_asp_tb/in_valid
add wave -color "Cyan"   -label "in_ready"   sim:/pd_asp_tb/in_ready
add wave -radix hexadecimal -label "in_word" sim:/pd_asp_tb/in_word

# Break the input word into fields so the wave shows what the packet means
add wave -radix hexadecimal -label "  kind"    sim:/pd_asp_tb/in_word(31:28)
add wave -radix hexadecimal -label "  code"    sim:/pd_asp_tb/in_word(27:24)
add wave -radix hexadecimal -label "  dest"    sim:/pd_asp_tb/in_word(23:20)
add wave -radix unsigned    -label "  payload" sim:/pd_asp_tb/in_word(19:0)

# ===== Group 3: Configuration registers (set by CONFIG packets) =====
add wave -divider "Configuration (from CONFIG packets)"
add wave -color "White"  -label "enabled"        sim:/pd_asp_tb/dut/enabled_r
add wave -radix hexadecimal -label "output_dest" sim:/pd_asp_tb/dut/cfg_output_dest
add wave -radix unsigned -label "min_spacing"    sim:/pd_asp_tb/dut/cfg_min_spacing
add wave -radix unsigned -label "threshold_msb"  sim:/pd_asp_tb/dut/cfg_threshold

# ===== Group 4: Core FSM (the algorithm) =====
add wave -divider "Algorithm core - FSM and datapath"
add wave -color "Magenta" -label "state (0=POS, 1=NEG)" sim:/pd_asp_tb/dut/u_core/state_r
add wave -radix unsigned  -label "last_corr_r"          sim:/pd_asp_tb/dut/u_core/last_corr_r
add wave -radix unsigned  -label "corr_in (live)"       sim:/pd_asp_tb/dut/u_core/corr_in
add wave -radix unsigned  -label "counter_r"            sim:/pd_asp_tb/dut/u_core/counter_r
add wave -radix unsigned  -label "peak_count_r"         sim:/pd_asp_tb/dut/u_core/peak_count_r
add wave -color "Green"   -label "peak_valid_r"         sim:/pd_asp_tb/dut/u_core/peak_valid_r
add wave -label "first_peak_r"                          sim:/pd_asp_tb/dut/u_core/first_peak_r

# ===== Group 5: Status counters (exposed via STATUS_REQ packets) =====
add wave -divider "Status counters"
add wave -radix unsigned -label "total_peaks"  sim:/pd_asp_tb/dut/u_core/total_peaks_r
add wave -radix unsigned -label "missed_peaks" sim:/pd_asp_tb/dut/u_core/missed_peaks_r

# ===== Group 6: NoC output (to Nios and ReCOP) =====
add wave -divider "NoC output to Nios and ReCOP"
add wave -color "Cyan"  -label "out_valid"     sim:/pd_asp_tb/out_valid
add wave -color "Cyan"  -label "out_ready"     sim:/pd_asp_tb/out_ready
add wave -radix hexadecimal -label "out_word"  sim:/pd_asp_tb/out_word

# Break the output word into fields
add wave -radix hexadecimal -label "  kind"    sim:/pd_asp_tb/out_word(31:28)
add wave -radix hexadecimal -label "  code"    sim:/pd_asp_tb/out_word(27:24)
add wave -radix hexadecimal -label "  dest"    sim:/pd_asp_tb/out_word(23:20)
add wave -radix unsigned    -label "  payload" sim:/pd_asp_tb/out_word(19:0)

# ===== Group 7: Testbench observation counters =====
add wave -divider "Testbench monitor"
add wave -radix decimal -label "observed_peaks"  sim:/pd_asp_tb/observed_peaks
add wave -radix decimal -label "last_peak_count" sim:/pd_asp_tb/last_peak_count

#-----------------------------------------------------------------------------
# 3. Wave window cosmetics
#-----------------------------------------------------------------------------
configure wave -namecolwidth 220
configure wave -valuecolwidth 110
configure wave -timelineunits us
configure wave -signalnamewidth 1

#-----------------------------------------------------------------------------
# 4. Run the simulation
#-----------------------------------------------------------------------------
echo "------------------------------------------------------------------"
echo " Running simulation for 25 us..."
echo "------------------------------------------------------------------"

run 25 us

#-----------------------------------------------------------------------------
# 5. Final formatting and screenshot prep
#-----------------------------------------------------------------------------
wave zoom full

echo ""
echo "=================================================================="
echo " Simulation complete."
echo ""
echo " To capture wave for report:"
echo "   File > Export > Image, save as .png at 300 dpi"
echo ""
echo " To zoom to one peak event for detail screenshot:"
echo "   1. Find a 'peak_valid_r = 1' pulse in the wave window"
echo "   2. Right-click that time, choose 'Zoom Range'"
echo "   3. Or type:  wave zoom range 3000ns 4000ns"
echo "=================================================================="
