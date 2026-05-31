package require qsys

set_module_property NAME avalon_noc_adapter_pd
set_module_property VERSION 1.0
set_module_property GROUP "COMPSYS 701"
set_module_property DISPLAY_NAME "Avalon NoC Adapter"
set_module_property DESCRIPTION "Nios II Avalon-MM bridge to the TDMA-MIN NoC"
set_module_property AUTHOR "COMPSYS 701 team"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL false
set_module_property REPORT_TO_TALKBACK false

add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_noc_adapter_pd
add_fileset_file asp_packet_pkg.vhd VHDL PATH ../../common/asp_packet_pkg.vhd
add_fileset_file TdmaMinTypes.vhd VHDL PATH ../../common/TdmaMinTypes.vhd
add_fileset_file avalon_noc_adapter.vhd VHDL PATH avalon_noc_adapter.vhd
add_fileset_file avalon_noc_adapter_pd.vhd VHDL PATH avalon_noc_adapter_pd.vhd

add_fileset SIM_VHDL SIM_VHDL "" ""
set_fileset_property SIM_VHDL TOP_LEVEL avalon_noc_adapter_pd
add_fileset_file asp_packet_pkg.vhd VHDL PATH ../../common/asp_packet_pkg.vhd
add_fileset_file TdmaMinTypes.vhd VHDL PATH ../../common/TdmaMinTypes.vhd
add_fileset_file avalon_noc_adapter.vhd VHDL PATH avalon_noc_adapter.vhd
add_fileset_file avalon_noc_adapter_pd.vhd VHDL PATH avalon_noc_adapter_pd.vhd

add_interface clock clock end
set_interface_property clock clockRate 0
add_interface_port clock clk clk Input 1

add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges BOTH
add_interface_port reset reset reset Input 1

add_interface avs avalon end
set_interface_property avs addressUnits WORDS
set_interface_property avs associatedClock clock
set_interface_property avs associatedReset reset
set_interface_property avs bitsPerSymbol 8
set_interface_property avs burstOnBurstBoundariesOnly false
set_interface_property avs explicitAddressSpan 0
set_interface_property avs holdTime 0
set_interface_property avs linewrapBursts false
set_interface_property avs maximumPendingReadTransactions 0
set_interface_property avs readLatency 0
set_interface_property avs readWaitTime 0
set_interface_property avs setupTime 0
set_interface_property avs timingUnits Cycles
set_interface_property avs writeWaitTime 0
add_interface_port avs avs_address address Input 3
add_interface_port avs avs_read read Input 1
add_interface_port avs avs_write write Input 1
add_interface_port avs avs_writedata writedata Input 32
add_interface_port avs avs_readdata readdata Output 32

add_interface irq interrupt end
set_interface_property irq associatedAddressablePoint avs
set_interface_property irq associatedClock clock
set_interface_property irq associatedReset reset
add_interface_port irq irq irq Output 1

add_interface noc_send conduit end
add_interface_port noc_send noc_send_addr export Output 8
add_interface_port noc_send noc_send_data export Output 32

add_interface noc_recv conduit end
add_interface_port noc_recv noc_recv_addr export Input 8
add_interface_port noc_recv noc_recv_data export Input 32
