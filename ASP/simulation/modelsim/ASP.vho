-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "05/19/2026 22:29:25"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Correlation_ASP IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	init : IN std_logic;
	\send.data\ : BUFFER std_logic_vector(31 DOWNTO 0);
	\send.addr\ : BUFFER std_logic_vector(7 DOWNTO 0);
	\recv.data\ : IN std_logic_vector(31 DOWNTO 0);
	\recv.addr\ : IN std_logic_vector(7 DOWNTO 0)
	);
END Correlation_ASP;

-- Design Ports Information
-- reset	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[0]	=>  Location: PIN_AJ16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[1]	=>  Location: PIN_AJ21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[2]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[3]	=>  Location: PIN_AJ19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[4]	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[5]	=>  Location: PIN_AJ14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[6]	=>  Location: PIN_AH15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[7]	=>  Location: PIN_AK13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[8]	=>  Location: PIN_AK12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[9]	=>  Location: PIN_AJ12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[10]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[11]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[12]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[13]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[14]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[15]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[16]	=>  Location: PIN_AH20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[17]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[18]	=>  Location: PIN_AK19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[19]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[20]	=>  Location: PIN_AK11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[21]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[22]	=>  Location: PIN_AJ11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[23]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[24]	=>  Location: PIN_AH24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[25]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[26]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[27]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[28]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[29]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[30]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[31]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[0]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[1]	=>  Location: PIN_AJ10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[2]	=>  Location: PIN_AK14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[3]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[4]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[5]	=>  Location: PIN_AJ2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[6]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[7]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[20]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[21]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[22]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[23]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[0]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[1]	=>  Location: PIN_AK3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[2]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[3]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[4]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[5]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[6]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[7]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[24]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[25]	=>  Location: PIN_AK18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[26]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[27]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[28]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[29]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[30]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[31]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- init	=>  Location: PIN_AK16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[0]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[1]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[2]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[3]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[5]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[6]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[7]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[8]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[9]	=>  Location: PIN_AK22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[10]	=>  Location: PIN_AJ17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[11]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[12]	=>  Location: PIN_AK21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[13]	=>  Location: PIN_AG20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[14]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[15]	=>  Location: PIN_AJ20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[17]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[18]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[19]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[16]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Correlation_ASP IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_init : std_logic;
SIGNAL \ww_send.data\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ww_send.addr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_recv.data\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ww_recv.addr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|Mult0~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|Mult0~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|Mult0~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|Mult0~8_AX_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|Mult0~8_AY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|Mult0~42\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~43\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~44\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~45\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~46\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~47\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~48\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~49\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~50\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~51\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~52\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~53\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~54\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~55\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~56\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~57\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~58\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~59\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~60\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~61\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~62\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~63\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~64\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~65\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~66\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~67\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~68\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~69\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~70\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~71\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \recv.data[20]~input_o\ : std_logic;
SIGNAL \recv.data[21]~input_o\ : std_logic;
SIGNAL \recv.data[22]~input_o\ : std_logic;
SIGNAL \recv.data[23]~input_o\ : std_logic;
SIGNAL \recv.addr[0]~input_o\ : std_logic;
SIGNAL \recv.addr[1]~input_o\ : std_logic;
SIGNAL \recv.addr[2]~input_o\ : std_logic;
SIGNAL \recv.addr[3]~input_o\ : std_logic;
SIGNAL \recv.addr[4]~input_o\ : std_logic;
SIGNAL \recv.addr[5]~input_o\ : std_logic;
SIGNAL \recv.addr[6]~input_o\ : std_logic;
SIGNAL \recv.addr[7]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~25_sumout\ : std_logic;
SIGNAL \recv.data[26]~input_o\ : std_logic;
SIGNAL \recv.data[24]~input_o\ : std_logic;
SIGNAL \recv.data[31]~input_o\ : std_logic;
SIGNAL \recv.data[28]~input_o\ : std_logic;
SIGNAL \recv.data[27]~input_o\ : std_logic;
SIGNAL \recv.data[25]~input_o\ : std_logic;
SIGNAL \recv.data[30]~input_o\ : std_logic;
SIGNAL \recv.data[29]~input_o\ : std_logic;
SIGNAL \u_decoder|Mux92~0_combout\ : std_logic;
SIGNAL \recv.data[18]~input_o\ : std_logic;
SIGNAL \recv.data[19]~input_o\ : std_logic;
SIGNAL \recv.data[17]~input_o\ : std_logic;
SIGNAL \u_decoder|Mux92~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CONFIG~0_combout\ : std_logic;
SIGNAL \init~input_o\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|reset_done~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\ : std_logic;
SIGNAL \u_decoder|Mux119~0_combout\ : std_logic;
SIGNAL \u_decoder|reset_request_reg~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|reset_done~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\ : std_logic;
SIGNAL \u_decoder|Mux36~0_combout\ : std_logic;
SIGNAL \u_decoder|config_pending_reg~q\ : std_logic;
SIGNAL \u_decoder|Mux26~1_combout\ : std_logic;
SIGNAL \u_decoder|mode_reg~0_combout\ : std_logic;
SIGNAL \u_decoder|mode_reg~q\ : std_logic;
SIGNAL \u_decoder|Mux109~0_combout\ : std_logic;
SIGNAL \u_decoder|calculate_pending_reg~q\ : std_logic;
SIGNAL \u_decoder|calculate~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|Selector0~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CAPTURE_NEW_ADDR~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~6\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~1_sumout\ : std_logic;
SIGNAL \recv.data[5]~input_o\ : std_logic;
SIGNAL \recv.data[16]~input_o\ : std_logic;
SIGNAL \u_decoder|Mux82~0_combout\ : std_logic;
SIGNAL \recv.data[7]~input_o\ : std_logic;
SIGNAL \recv.data[6]~input_o\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan2~0_combout\ : std_logic;
SIGNAL \recv.data[4]~input_o\ : std_logic;
SIGNAL \recv.data[0]~input_o\ : std_logic;
SIGNAL \recv.data[1]~input_o\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan2~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ : std_logic;
SIGNAL \recv.data[3]~input_o\ : std_logic;
SIGNAL \recv.data[2]~input_o\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan2~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan2~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan2~4_combout\ : std_logic;
SIGNAL \recv.data[8]~input_o\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_MULTIPLY~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|Selector1~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD3~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~22\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~34\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~30\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add0~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan2~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan2~6_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_OUTPUT~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ : std_logic;
SIGNAL \u_encoder|double_packet_flag~0_combout\ : std_logic;
SIGNAL \u_encoder|double_packet_flag~q\ : std_logic;
SIGNAL \u_encoder|send~22_combout\ : std_logic;
SIGNAL \u_encoder|status_transmit_done~q\ : std_logic;
SIGNAL \u_decoder|Mux26~0_combout\ : std_logic;
SIGNAL \u_decoder|Mux26~2_combout\ : std_logic;
SIGNAL \u_decoder|status_pending_reg~q\ : std_logic;
SIGNAL \u_encoder|send~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\ : std_logic;
SIGNAL \u_decoder|dm_data_in[2]~0_combout\ : std_logic;
SIGNAL \u_decoder|dm_data_in[2]~1_combout\ : std_logic;
SIGNAL \u_decoder|Add0~1_sumout\ : std_logic;
SIGNAL \u_decoder|Mux118~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[0]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~2\ : std_logic;
SIGNAL \u_decoder|Add0~5_sumout\ : std_logic;
SIGNAL \u_decoder|Mux117~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[1]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~6\ : std_logic;
SIGNAL \u_decoder|Add0~9_sumout\ : std_logic;
SIGNAL \u_decoder|Mux116~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[2]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~10\ : std_logic;
SIGNAL \u_decoder|Add0~13_sumout\ : std_logic;
SIGNAL \u_decoder|Mux115~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[3]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~14\ : std_logic;
SIGNAL \u_decoder|Add0~17_sumout\ : std_logic;
SIGNAL \u_decoder|Mux114~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[4]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~18\ : std_logic;
SIGNAL \u_decoder|Add0~21_sumout\ : std_logic;
SIGNAL \u_decoder|Mux113~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[5]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~22\ : std_logic;
SIGNAL \u_decoder|Add0~25_sumout\ : std_logic;
SIGNAL \u_decoder|Mux112~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[6]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~26\ : std_logic;
SIGNAL \u_decoder|Add0~29_sumout\ : std_logic;
SIGNAL \u_decoder|Mux111~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[7]~_wirecell_combout\ : std_logic;
SIGNAL \u_decoder|Add0~30\ : std_logic;
SIGNAL \u_decoder|Add0~33_sumout\ : std_logic;
SIGNAL \u_decoder|Mux110~0_combout\ : std_logic;
SIGNAL \u_decoder|next_write_addr_reg[8]~_wirecell_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[8]~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[7]~7_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[6]~8_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[5]~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[4]~6_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[3]~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[2]~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[1]~4_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[0]~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~2\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~34\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~30\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~22\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan0~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan0~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan0~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan0~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan0~4_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan0~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan0~6_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~4_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add1~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~6_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~7_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|LessThan1~8_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux3~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux8~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~2\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~2\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux7~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~6\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~6\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux6~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux5~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux4~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux3~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~22\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~22\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux2~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux1~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~30\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add3~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~30\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Add5~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|Mux0~0_combout\ : std_logic;
SIGNAL \u_decoder|dm_data_in[2]~feeder_combout\ : std_logic;
SIGNAL \u_decoder|dm_data_in[5]~feeder_combout\ : std_logic;
SIGNAL \recv.data[9]~input_o\ : std_logic;
SIGNAL \recv.data[10]~input_o\ : std_logic;
SIGNAL \recv.data[11]~input_o\ : std_logic;
SIGNAL \u_decoder|dm_data_in[11]~feeder_combout\ : std_logic;
SIGNAL \recv.data[12]~input_o\ : std_logic;
SIGNAL \recv.data[13]~input_o\ : std_logic;
SIGNAL \u_decoder|dm_data_in[13]~feeder_combout\ : std_logic;
SIGNAL \recv.data[14]~input_o\ : std_logic;
SIGNAL \u_decoder|dm_data_in[14]~feeder_combout\ : std_logic;
SIGNAL \recv.data[15]~input_o\ : std_logic;
SIGNAL \u_decoder|Mux92~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[0]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[0]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~2\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[1]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[1]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_decoder|offset_reg[2]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~6\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[2]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[2]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[3]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[3]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_decoder|offset_reg[4]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[4]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[4]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_decoder|offset_reg[5]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[5]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[5]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_decoder|offset_reg[6]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~22\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[6]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[6]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[7]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[7]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~30\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[8]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[8]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~34\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~37_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[9]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[9]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~38\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~41_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[10]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[10]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_decoder|offset_reg[11]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~42\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~45_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[11]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[11]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~46\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~49_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[12]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[12]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_decoder|offset_reg[13]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~50\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~53_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[13]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[13]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_decoder|offset_reg[14]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~54\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~57_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[14]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[14]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~58\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~61_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[15]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~62\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add0~65_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[16]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|current_ave_data_ff[16]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|multiplicand_temp_ff[16]~SCLR_LUT_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~8_resulta\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[0]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE_q\ : std_logic;
SIGNAL \u_decoder|reset_done_status_reg~0_combout\ : std_logic;
SIGNAL \u_decoder|reset_done_status_reg~q\ : std_logic;
SIGNAL \u_encoder|send~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~28\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~27\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[19]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[18]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~25\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[17]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~24\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[16]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~23\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[15]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~22\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~21\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[13]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~20\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[12]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~19\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[11]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[10]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~17\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~16\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[8]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~15\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[7]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[6]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~13\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[5]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~12\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[4]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~11\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[3]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[2]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~9\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~2\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~6\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~22\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~30\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~34\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~37_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~38\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~41_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~42\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~45_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~46\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~49_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~50\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~53_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~54\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~57_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~58\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~61_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~62\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~65_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~66\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~69_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~70\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~73_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[18]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~74\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~77_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~78\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~81_sumout\ : std_logic;
SIGNAL \u_encoder|send.data[19]~2_combout\ : std_logic;
SIGNAL \u_encoder|send~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~29\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~82\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~85_sumout\ : std_logic;
SIGNAL \u_decoder|config_done_status_reg~0_combout\ : std_logic;
SIGNAL \u_decoder|config_done_status_reg~q\ : std_logic;
SIGNAL \u_encoder|send~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~30\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~86\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~89_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~31\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~90\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~93_sumout\ : std_logic;
SIGNAL \u_encoder|send~4_combout\ : std_logic;
SIGNAL \u_encoder|send.data[12]~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[24]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~32\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~94\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~97_sumout\ : std_logic;
SIGNAL \u_encoder|send~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~33\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~98\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~101_sumout\ : std_logic;
SIGNAL \u_encoder|send~6_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~34\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~102\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~105_sumout\ : std_logic;
SIGNAL \u_encoder|send~7_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~35\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~106\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~109_sumout\ : std_logic;
SIGNAL \u_encoder|send~8_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~36\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~110\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~113_sumout\ : std_logic;
SIGNAL \u_encoder|correlation_reg[28]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send~9_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~37\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~114\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~117_sumout\ : std_logic;
SIGNAL \u_encoder|send~10_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~38\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~118\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~121_sumout\ : std_logic;
SIGNAL \u_encoder|correlation_reg[30]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send~11_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~39\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~122\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~125_sumout\ : std_logic;
SIGNAL \u_encoder|correlation_reg[31]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send~12_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~40\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~126\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~129_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE_q\ : std_logic;
SIGNAL \u_encoder|send~13_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Mult0~41\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~130\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~133_sumout\ : std_logic;
SIGNAL \u_encoder|correlation_reg[33]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send~14_combout\ : std_logic;
SIGNAL \u_encoder|send.data[13]~feeder_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~134\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~137_sumout\ : std_logic;
SIGNAL \u_encoder|correlation_reg[34]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send~15_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~138\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|Add1~141_sumout\ : std_logic;
SIGNAL \u_encoder|correlation_reg[35]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send~16_combout\ : std_logic;
SIGNAL \u_encoder|send~17_combout\ : std_logic;
SIGNAL \u_encoder|send~18_combout\ : std_logic;
SIGNAL \u_encoder|send~19_combout\ : std_logic;
SIGNAL \u_encoder|send~20_combout\ : std_logic;
SIGNAL \u_encoder|send~21_combout\ : std_logic;
SIGNAL \u_encoder|send.data[20]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send.data[22]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send.data[1]~1_combout\ : std_logic;
SIGNAL \u_encoder|send.data[28]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send.addr[0]~feeder_combout\ : std_logic;
SIGNAL \u_encoder|send.addr[1]~0_combout\ : std_logic;
SIGNAL \u_encoder|send.addr[2]~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|correlation_window_n_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_encoder|send.data\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|cor_pair_product_ff\ : std_logic_vector(33 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|correlation_temp_ff_i\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_address_generator|counter_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_decoder|dm_data_in\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_memory|altsyncram_component|auto_generated|q_b\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_address_generator|current_corr_origin_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_encoder|send.addr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_encoder|correlation_reg\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \u_decoder|window_reg\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|offset_h_ff\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_decoder|offset_reg\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_decoder|next_write_addr_reg\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[2]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[4]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[0]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[24]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[7]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[18]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[12]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[6]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[5]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[3]~DUPLICATE_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_recv.data[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_init~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[24]~input_o\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~8_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~7_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~6_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~4_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_next_write_addr_reg\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD_ORIGIN~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD4~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Mux92~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD1~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Mux92~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD3~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_MULTIPLY~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_config_pending_reg~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_calculate~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_dm_data_in[2]~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_reset_request_reg~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~6_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~5_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~4_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~3_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~2_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~1_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CONFIG~q\ : std_logic;
SIGNAL \u_encoder|ALT_INV_status_transmit_done~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Mux26~1_combout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Mux26~0_combout\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CAPTURE_NEW_ADDR~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_ACCUMULATE~q\ : std_logic;
SIGNAL \u_encoder|ALT_INV_send~22_combout\ : std_logic;
SIGNAL \u_encoder|ALT_INV_send~21_combout\ : std_logic;
SIGNAL \u_encoder|ALT_INV_correlation_reg\ : std_logic_vector(35 DOWNTO 23);
SIGNAL \u_encoder|ALT_INV_send~14_combout\ : std_logic;
SIGNAL \u_encoder|ALT_INV_send.data[12]~0_combout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_config_done_status_reg~q\ : std_logic;
SIGNAL \u_encoder|ALT_INV_send~0_combout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_mode_reg~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_reset_done_status_reg~q\ : std_logic;
SIGNAL \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_status_pending_reg~q\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \u_decoder|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add3~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_Add5~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[16]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\ : std_logic_vector(33 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~27\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~26\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~25\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~24\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~23\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~21\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~20\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~19\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~18\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~16\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~15\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~14\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~13\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~12\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~11\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~10\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~9\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_Mult0~8_resulta\ : std_logic;
SIGNAL \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \u_decoder|ALT_INV_dm_data_in\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_encoder|ALT_INV_double_packet_flag~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_init <= init;
\send.data\ <= \ww_send.data\;
\send.addr\ <= \ww_send.addr\;
\ww_recv.data\ <= \recv.data\;
\ww_recv.addr\ <= \recv.addr\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u_correlation_calculator|u_operation|Mult0~8_ACLR_bus\ <= (gnd & gnd);

\u_correlation_calculator|u_operation|Mult0~8_CLK_bus\ <= (gnd & \clock~inputCLKENA0_outclk\ & \clock~inputCLKENA0_outclk\);

\u_correlation_calculator|u_operation|Mult0~8_ENA_bus\ <= (vcc & \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~0_combout\);

\u_correlation_calculator|u_operation|Mult0~8_AX_bus\ <= (\u_correlation_calculator|u_operation|multiplicand_temp_ff[16]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|multiplicand_temp_ff[14]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[13]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[12]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|multiplicand_temp_ff[11]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[10]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[9]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|multiplicand_temp_ff[8]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[7]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[6]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|multiplicand_temp_ff[5]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[4]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[3]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|multiplicand_temp_ff[2]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[1]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|multiplicand_temp_ff[0]~SCLR_LUT_combout\);

\u_correlation_calculator|u_operation|Mult0~8_AY_bus\ <= (\u_correlation_calculator|u_operation|current_ave_data_ff[16]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[15]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|current_ave_data_ff[14]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[13]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[12]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|current_ave_data_ff[11]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[10]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[9]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|current_ave_data_ff[8]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[7]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[6]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|current_ave_data_ff[5]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[4]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[3]~SCLR_LUT_combout\ & 
\u_correlation_calculator|u_operation|current_ave_data_ff[2]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[1]~SCLR_LUT_combout\ & \u_correlation_calculator|u_operation|current_ave_data_ff[0]~SCLR_LUT_combout\);

\u_correlation_calculator|u_operation|Mult0~8_resulta\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(0);
\u_correlation_calculator|u_operation|Mult0~9\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(1);
\u_correlation_calculator|u_operation|Mult0~10\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(2);
\u_correlation_calculator|u_operation|Mult0~11\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(3);
\u_correlation_calculator|u_operation|Mult0~12\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(4);
\u_correlation_calculator|u_operation|Mult0~13\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(5);
\u_correlation_calculator|u_operation|Mult0~14\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(6);
\u_correlation_calculator|u_operation|Mult0~15\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(7);
\u_correlation_calculator|u_operation|Mult0~16\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(8);
\u_correlation_calculator|u_operation|Mult0~17\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(9);
\u_correlation_calculator|u_operation|Mult0~18\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(10);
\u_correlation_calculator|u_operation|Mult0~19\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(11);
\u_correlation_calculator|u_operation|Mult0~20\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(12);
\u_correlation_calculator|u_operation|Mult0~21\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(13);
\u_correlation_calculator|u_operation|Mult0~22\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(14);
\u_correlation_calculator|u_operation|Mult0~23\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(15);
\u_correlation_calculator|u_operation|Mult0~24\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(16);
\u_correlation_calculator|u_operation|Mult0~25\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(17);
\u_correlation_calculator|u_operation|Mult0~26\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(18);
\u_correlation_calculator|u_operation|Mult0~27\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(19);
\u_correlation_calculator|u_operation|Mult0~28\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(20);
\u_correlation_calculator|u_operation|Mult0~29\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(21);
\u_correlation_calculator|u_operation|Mult0~30\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(22);
\u_correlation_calculator|u_operation|Mult0~31\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(23);
\u_correlation_calculator|u_operation|Mult0~32\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(24);
\u_correlation_calculator|u_operation|Mult0~33\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(25);
\u_correlation_calculator|u_operation|Mult0~34\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(26);
\u_correlation_calculator|u_operation|Mult0~35\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(27);
\u_correlation_calculator|u_operation|Mult0~36\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(28);
\u_correlation_calculator|u_operation|Mult0~37\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(29);
\u_correlation_calculator|u_operation|Mult0~38\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(30);
\u_correlation_calculator|u_operation|Mult0~39\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(31);
\u_correlation_calculator|u_operation|Mult0~40\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(32);
\u_correlation_calculator|u_operation|Mult0~41\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(33);
\u_correlation_calculator|u_operation|Mult0~42\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(34);
\u_correlation_calculator|u_operation|Mult0~43\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(35);
\u_correlation_calculator|u_operation|Mult0~44\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(36);
\u_correlation_calculator|u_operation|Mult0~45\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(37);
\u_correlation_calculator|u_operation|Mult0~46\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(38);
\u_correlation_calculator|u_operation|Mult0~47\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(39);
\u_correlation_calculator|u_operation|Mult0~48\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(40);
\u_correlation_calculator|u_operation|Mult0~49\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(41);
\u_correlation_calculator|u_operation|Mult0~50\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(42);
\u_correlation_calculator|u_operation|Mult0~51\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(43);
\u_correlation_calculator|u_operation|Mult0~52\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(44);
\u_correlation_calculator|u_operation|Mult0~53\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(45);
\u_correlation_calculator|u_operation|Mult0~54\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(46);
\u_correlation_calculator|u_operation|Mult0~55\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(47);
\u_correlation_calculator|u_operation|Mult0~56\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(48);
\u_correlation_calculator|u_operation|Mult0~57\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(49);
\u_correlation_calculator|u_operation|Mult0~58\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(50);
\u_correlation_calculator|u_operation|Mult0~59\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(51);
\u_correlation_calculator|u_operation|Mult0~60\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(52);
\u_correlation_calculator|u_operation|Mult0~61\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(53);
\u_correlation_calculator|u_operation|Mult0~62\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(54);
\u_correlation_calculator|u_operation|Mult0~63\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(55);
\u_correlation_calculator|u_operation|Mult0~64\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(56);
\u_correlation_calculator|u_operation|Mult0~65\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(57);
\u_correlation_calculator|u_operation|Mult0~66\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(58);
\u_correlation_calculator|u_operation|Mult0~67\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(59);
\u_correlation_calculator|u_operation|Mult0~68\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(60);
\u_correlation_calculator|u_operation|Mult0~69\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(61);
\u_correlation_calculator|u_operation|Mult0~70\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(62);
\u_correlation_calculator|u_operation|Mult0~71\ <= \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\(63);

\u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & \u_decoder|dm_data_in\(15) & \u_decoder|dm_data_in\(14) & \u_decoder|dm_data_in\(13) & \u_decoder|dm_data_in\(12) & \u_decoder|dm_data_in\(11) & 
\u_decoder|dm_data_in\(10) & \u_decoder|dm_data_in\(9) & \u_decoder|dm_data_in\(8) & \u_decoder|dm_data_in\(7) & \u_decoder|dm_data_in\(6) & \u_decoder|dm_data_in\(5) & \u_decoder|dm_data_in\(4) & \u_decoder|dm_data_in\(3) & 
\u_decoder|dm_data_in\(2) & \u_decoder|dm_data_in\(1) & \u_decoder|dm_data_in\(0));

\u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\u_decoder|next_write_addr_reg[8]~_wirecell_combout\ & \u_decoder|next_write_addr_reg[7]~_wirecell_combout\ & \u_decoder|next_write_addr_reg[6]~_wirecell_combout\ & 
\u_decoder|next_write_addr_reg[5]~_wirecell_combout\ & \u_decoder|next_write_addr_reg[4]~_wirecell_combout\ & \u_decoder|next_write_addr_reg[3]~_wirecell_combout\ & \u_decoder|next_write_addr_reg[2]~_wirecell_combout\ & 
\u_decoder|next_write_addr_reg[1]~_wirecell_combout\ & \u_decoder|next_write_addr_reg[0]~_wirecell_combout\);

\u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\u_correlation_calculator|u_address_generator|Mux0~0_combout\ & \u_correlation_calculator|u_address_generator|Mux1~0_combout\ & 
\u_correlation_calculator|u_address_generator|Mux2~0_combout\ & \u_correlation_calculator|u_address_generator|Mux3~1_combout\ & \u_correlation_calculator|u_address_generator|Mux4~0_combout\ & \u_correlation_calculator|u_address_generator|Mux5~0_combout\
& \u_correlation_calculator|u_address_generator|Mux6~0_combout\ & \u_correlation_calculator|u_address_generator|Mux7~0_combout\ & \u_correlation_calculator|u_address_generator|Mux8~0_combout\);

\u_memory|altsyncram_component|auto_generated|q_b\(0) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\u_memory|altsyncram_component|auto_generated|q_b\(1) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\u_memory|altsyncram_component|auto_generated|q_b\(2) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\u_memory|altsyncram_component|auto_generated|q_b\(3) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\u_memory|altsyncram_component|auto_generated|q_b\(4) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\u_memory|altsyncram_component|auto_generated|q_b\(5) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\u_memory|altsyncram_component|auto_generated|q_b\(6) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\u_memory|altsyncram_component|auto_generated|q_b\(7) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\u_memory|altsyncram_component|auto_generated|q_b\(8) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\u_memory|altsyncram_component|auto_generated|q_b\(9) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\u_memory|altsyncram_component|auto_generated|q_b\(10) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(10);
\u_memory|altsyncram_component|auto_generated|q_b\(11) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);
\u_memory|altsyncram_component|auto_generated|q_b\(12) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(12);
\u_memory|altsyncram_component|auto_generated|q_b\(13) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(13);
\u_memory|altsyncram_component|auto_generated|q_b\(14) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(14);
\u_memory|altsyncram_component|auto_generated|q_b\(15) <= \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(15);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[2]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\;
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[3]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\;
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[4]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\;
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[5]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\;
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[0]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\;
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[24]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i[24]~DUPLICATE_q\;
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[3]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\;
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[6]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\;
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[7]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\;
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[18]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i[18]~DUPLICATE_q\;
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[12]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE_q\;
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[6]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i[6]~DUPLICATE_q\;
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[5]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i[5]~DUPLICATE_q\;
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[3]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i[3]~DUPLICATE_q\;
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[0]~DUPLICATE_q\ <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE_q\;
\ALT_INV_recv.data[16]~input_o\ <= NOT \recv.data[16]~input_o\;
\ALT_INV_recv.data[19]~input_o\ <= NOT \recv.data[19]~input_o\;
\ALT_INV_recv.data[18]~input_o\ <= NOT \recv.data[18]~input_o\;
\ALT_INV_recv.data[17]~input_o\ <= NOT \recv.data[17]~input_o\;
\ALT_INV_recv.data[14]~input_o\ <= NOT \recv.data[14]~input_o\;
\ALT_INV_recv.data[13]~input_o\ <= NOT \recv.data[13]~input_o\;
\ALT_INV_recv.data[11]~input_o\ <= NOT \recv.data[11]~input_o\;
\ALT_INV_recv.data[6]~input_o\ <= NOT \recv.data[6]~input_o\;
\ALT_INV_recv.data[5]~input_o\ <= NOT \recv.data[5]~input_o\;
\ALT_INV_recv.data[4]~input_o\ <= NOT \recv.data[4]~input_o\;
\ALT_INV_recv.data[2]~input_o\ <= NOT \recv.data[2]~input_o\;
\ALT_INV_init~input_o\ <= NOT \init~input_o\;
\ALT_INV_recv.data[31]~input_o\ <= NOT \recv.data[31]~input_o\;
\ALT_INV_recv.data[30]~input_o\ <= NOT \recv.data[30]~input_o\;
\ALT_INV_recv.data[29]~input_o\ <= NOT \recv.data[29]~input_o\;
\ALT_INV_recv.data[28]~input_o\ <= NOT \recv.data[28]~input_o\;
\ALT_INV_recv.data[27]~input_o\ <= NOT \recv.data[27]~input_o\;
\ALT_INV_recv.data[26]~input_o\ <= NOT \recv.data[26]~input_o\;
\ALT_INV_recv.data[25]~input_o\ <= NOT \recv.data[25]~input_o\;
\ALT_INV_recv.data[24]~input_o\ <= NOT \recv.data[24]~input_o\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~5_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan0~5_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~4_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan0~4_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(6) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6);
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(7) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7);
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~3_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan0~3_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~2_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan0~2_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~1_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan0~1_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(4) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4);
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(5) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5);
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~0_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan0~0_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(1) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(1);
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(0) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(0);
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(2) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2);
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(3) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(3);
\u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(8) <= NOT \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8);
\u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\ <= NOT \u_correlation_calculator|u_address_generator|Mux3~0_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~8_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~8_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~7_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~7_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~6_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~6_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~5_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~5_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~4_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~4_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~3_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~3_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~2_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~2_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~1_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~1_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~0_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan1~0_combout\;
\u_decoder|ALT_INV_next_write_addr_reg\(8) <= NOT \u_decoder|next_write_addr_reg\(8);
\u_decoder|ALT_INV_next_write_addr_reg\(7) <= NOT \u_decoder|next_write_addr_reg\(7);
\u_decoder|ALT_INV_next_write_addr_reg\(6) <= NOT \u_decoder|next_write_addr_reg\(6);
\u_decoder|ALT_INV_next_write_addr_reg\(5) <= NOT \u_decoder|next_write_addr_reg\(5);
\u_decoder|ALT_INV_next_write_addr_reg\(4) <= NOT \u_decoder|next_write_addr_reg\(4);
\u_decoder|ALT_INV_next_write_addr_reg\(3) <= NOT \u_decoder|next_write_addr_reg\(3);
\u_decoder|ALT_INV_next_write_addr_reg\(2) <= NOT \u_decoder|next_write_addr_reg\(2);
\u_decoder|ALT_INV_next_write_addr_reg\(1) <= NOT \u_decoder|next_write_addr_reg\(1);
\u_decoder|ALT_INV_next_write_addr_reg\(0) <= NOT \u_decoder|next_write_addr_reg\(0);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(15) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(15);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(14) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(14);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(13) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(13);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(12) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(12);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(11) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(11);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(10) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(10);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(9) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(9);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(8) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(8);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(7) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(7);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(6) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(6);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(5) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(5);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(4) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(4);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(3) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(3);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(2) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(2);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(1) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(1);
\u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(0) <= NOT \u_correlation_calculator|u_operation|offset_h_ff\(0);
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD_ORIGIN~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD4~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\;
\u_decoder|ALT_INV_Mux92~1_combout\ <= NOT \u_decoder|Mux92~1_combout\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD1~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\;
\u_decoder|ALT_INV_Mux92~0_combout\ <= NOT \u_decoder|Mux92~0_combout\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD3~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD3~q\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_MULTIPLY~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_MULTIPLY~q\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\;
\u_decoder|ALT_INV_config_pending_reg~q\ <= NOT \u_decoder|config_pending_reg~q\;
\u_decoder|ALT_INV_calculate~q\ <= NOT \u_decoder|calculate~q\;
\u_decoder|ALT_INV_dm_data_in[2]~0_combout\ <= NOT \u_decoder|dm_data_in[2]~0_combout\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|reset_done~0_combout\;
\u_decoder|ALT_INV_reset_request_reg~q\ <= NOT \u_decoder|reset_request_reg~q\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~6_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan2~6_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~5_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan2~5_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~4_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan2~4_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~3_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan2~3_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~2_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan2~2_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(2) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2);
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(3) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3);
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~1_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan2~1_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(0) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0);
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(1) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1);
\u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~0_combout\ <= NOT \u_correlation_calculator|u_address_generator|LessThan2~0_combout\;
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(5) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5);
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(6) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6);
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(7) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7);
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(4) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4);
\u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(8) <= NOT \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8);
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CONFIG~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\;
\u_encoder|ALT_INV_status_transmit_done~q\ <= NOT \u_encoder|status_transmit_done~q\;
\u_decoder|ALT_INV_Mux26~1_combout\ <= NOT \u_decoder|Mux26~1_combout\;
\u_decoder|ALT_INV_Mux26~0_combout\ <= NOT \u_decoder|Mux26~0_combout\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CAPTURE_NEW_ADDR~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_ACCUMULATE~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\;
\u_encoder|ALT_INV_send~22_combout\ <= NOT \u_encoder|send~22_combout\;
\u_encoder|ALT_INV_send~21_combout\ <= NOT \u_encoder|send~21_combout\;
\u_encoder|ALT_INV_correlation_reg\(35) <= NOT \u_encoder|correlation_reg\(35);
\u_encoder|ALT_INV_correlation_reg\(34) <= NOT \u_encoder|correlation_reg\(34);
\u_encoder|ALT_INV_send~14_combout\ <= NOT \u_encoder|send~14_combout\;
\u_encoder|ALT_INV_correlation_reg\(33) <= NOT \u_encoder|correlation_reg\(33);
\u_encoder|ALT_INV_correlation_reg\(32) <= NOT \u_encoder|correlation_reg\(32);
\u_encoder|ALT_INV_correlation_reg\(31) <= NOT \u_encoder|correlation_reg\(31);
\u_encoder|ALT_INV_correlation_reg\(30) <= NOT \u_encoder|correlation_reg\(30);
\u_encoder|ALT_INV_correlation_reg\(29) <= NOT \u_encoder|correlation_reg\(29);
\u_encoder|ALT_INV_correlation_reg\(28) <= NOT \u_encoder|correlation_reg\(28);
\u_encoder|ALT_INV_correlation_reg\(27) <= NOT \u_encoder|correlation_reg\(27);
\u_encoder|ALT_INV_correlation_reg\(26) <= NOT \u_encoder|correlation_reg\(26);
\u_encoder|ALT_INV_correlation_reg\(25) <= NOT \u_encoder|correlation_reg\(25);
\u_encoder|ALT_INV_correlation_reg\(24) <= NOT \u_encoder|correlation_reg\(24);
\u_encoder|ALT_INV_send.data[12]~0_combout\ <= NOT \u_encoder|send.data[12]~0_combout\;
\u_encoder|ALT_INV_correlation_reg\(23) <= NOT \u_encoder|correlation_reg\(23);
\u_decoder|ALT_INV_config_done_status_reg~q\ <= NOT \u_decoder|config_done_status_reg~q\;
\u_encoder|ALT_INV_send~0_combout\ <= NOT \u_encoder|send~0_combout\;
\u_decoder|ALT_INV_mode_reg~q\ <= NOT \u_decoder|mode_reg~q\;
\u_decoder|ALT_INV_reset_done_status_reg~q\ <= NOT \u_decoder|reset_done_status_reg~q\;
\u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\ <= NOT \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\;
\u_decoder|ALT_INV_status_pending_reg~q\ <= NOT \u_decoder|status_pending_reg~q\;
\u_decoder|ALT_INV_Add0~33_sumout\ <= NOT \u_decoder|Add0~33_sumout\;
\u_decoder|ALT_INV_Add0~29_sumout\ <= NOT \u_decoder|Add0~29_sumout\;
\u_decoder|ALT_INV_Add0~25_sumout\ <= NOT \u_decoder|Add0~25_sumout\;
\u_decoder|ALT_INV_Add0~21_sumout\ <= NOT \u_decoder|Add0~21_sumout\;
\u_decoder|ALT_INV_Add0~17_sumout\ <= NOT \u_decoder|Add0~17_sumout\;
\u_decoder|ALT_INV_Add0~13_sumout\ <= NOT \u_decoder|Add0~13_sumout\;
\u_decoder|ALT_INV_Add0~9_sumout\ <= NOT \u_decoder|Add0~9_sumout\;
\u_decoder|ALT_INV_Add0~5_sumout\ <= NOT \u_decoder|Add0~5_sumout\;
\u_decoder|ALT_INV_Add0~1_sumout\ <= NOT \u_decoder|Add0~1_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~33_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~33_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~33_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~33_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~29_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~29_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~29_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~29_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~25_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~25_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~25_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~25_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~21_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~21_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~21_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~21_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~17_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~17_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~17_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~17_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~13_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~13_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~13_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~13_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~9_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~9_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~9_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~9_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~5_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~5_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~5_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~5_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add3~1_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add3~1_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_Add5~1_sumout\ <= NOT \u_correlation_calculator|u_address_generator|Add5~1_sumout\;
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(2) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(2);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(3) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(3);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(1) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(4) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(4);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(5) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(5);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(6) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(7) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(8) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8);
\u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(0) <= NOT \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(0);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(1) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(1);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(2) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(2);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(3) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(3);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(4) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(4);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(5) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(5);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(6) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(6);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(7) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(7);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(8) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(8);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(9) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(9);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(10) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(10);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(11) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(11);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(12) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(12);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(13) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(13);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(14) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(14);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(15) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(15);
\u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(0) <= NOT \u_memory|altsyncram_component|auto_generated|q_b\(0);
\u_correlation_calculator|u_operation|ALT_INV_Add0~65_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~65_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~61_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~61_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~57_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~57_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~53_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~53_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~49_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~49_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~45_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~45_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~41_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~41_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~37_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~37_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~33_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~33_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~29_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~29_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~25_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~25_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~21_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~21_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~17_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~17_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~13_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~13_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~9_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~9_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~5_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~5_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_Add0~1_sumout\ <= NOT \u_correlation_calculator|u_operation|Add0~1_sumout\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[16]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[16]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[15]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[15]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[14]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[14]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[13]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[13]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[12]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[12]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[11]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[11]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[10]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[10]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[9]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[9]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[8]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[8]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[7]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[7]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[6]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[6]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[5]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[5]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[4]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[4]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[3]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[3]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[2]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[2]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[1]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[1]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[0]~_Duplicate_1_q\ <= NOT \u_correlation_calculator|u_operation|current_ave_data_ff[0]~_Duplicate_1_q\;
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(33) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(33);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(32) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(32);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(31) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(31);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(30) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(30);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(29) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(29);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(28) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(28);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(27) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(27);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(26) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(26);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(25) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(25);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(24) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(24);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(23) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(23);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(22) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(22);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(21) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(21);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(20) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(20);
\u_correlation_calculator|u_operation|ALT_INV_Mult0~27\ <= NOT \u_correlation_calculator|u_operation|Mult0~27\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~26\ <= NOT \u_correlation_calculator|u_operation|Mult0~26\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~25\ <= NOT \u_correlation_calculator|u_operation|Mult0~25\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~24\ <= NOT \u_correlation_calculator|u_operation|Mult0~24\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~23\ <= NOT \u_correlation_calculator|u_operation|Mult0~23\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~21\ <= NOT \u_correlation_calculator|u_operation|Mult0~21\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~20\ <= NOT \u_correlation_calculator|u_operation|Mult0~20\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~19\ <= NOT \u_correlation_calculator|u_operation|Mult0~19\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~18\ <= NOT \u_correlation_calculator|u_operation|Mult0~18\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~16\ <= NOT \u_correlation_calculator|u_operation|Mult0~16\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~15\ <= NOT \u_correlation_calculator|u_operation|Mult0~15\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~14\ <= NOT \u_correlation_calculator|u_operation|Mult0~14\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~13\ <= NOT \u_correlation_calculator|u_operation|Mult0~13\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~12\ <= NOT \u_correlation_calculator|u_operation|Mult0~12\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~11\ <= NOT \u_correlation_calculator|u_operation|Mult0~11\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~10\ <= NOT \u_correlation_calculator|u_operation|Mult0~10\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~9\ <= NOT \u_correlation_calculator|u_operation|Mult0~9\;
\u_correlation_calculator|u_operation|ALT_INV_Mult0~8_resulta\ <= NOT \u_correlation_calculator|u_operation|Mult0~8_resulta\;
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(19) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(19);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(18) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(18);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(17) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(17);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(16) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(16);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(15) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(15);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(14) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(14);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(13) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(13);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(12) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(12);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(11) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(11);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(10) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(10);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(9) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(9);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(8) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(8);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(7) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(7);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(6) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(6);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(5) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(5);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(4) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(4);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(3) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(3);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(2) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(2);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(1) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(1);
\u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(0) <= NOT \u_correlation_calculator|u_operation|cor_pair_product_ff\(0);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(35) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(35);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(34) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(34);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(33) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(33);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(32) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(32);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(31) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(31);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(30) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(30);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(29) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(29);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(28) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(28);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(27) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(27);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(26) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(26);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(25) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(25);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(23) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(23);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(22) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(22);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(21) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(21);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(20) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(20);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(2);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(3) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(3);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(0) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(0);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(1) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(1);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(5);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(6) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(6);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(7) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(7);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(4);
\u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(8) <= NOT \u_correlation_calculator|u_address_generator|counter_ff\(8);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(19) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(19);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(18) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(18);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(17) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(17);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(16) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(16);
\u_decoder|ALT_INV_dm_data_in\(15) <= NOT \u_decoder|dm_data_in\(15);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(15) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(15);
\u_decoder|ALT_INV_dm_data_in\(14) <= NOT \u_decoder|dm_data_in\(14);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(14) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(14);
\u_decoder|ALT_INV_dm_data_in\(13) <= NOT \u_decoder|dm_data_in\(13);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(13) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(13);
\u_decoder|ALT_INV_dm_data_in\(12) <= NOT \u_decoder|dm_data_in\(12);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(12) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(12);
\u_decoder|ALT_INV_dm_data_in\(11) <= NOT \u_decoder|dm_data_in\(11);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(11) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(11);
\u_decoder|ALT_INV_dm_data_in\(10) <= NOT \u_decoder|dm_data_in\(10);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(10) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(10);
\u_decoder|ALT_INV_dm_data_in\(9) <= NOT \u_decoder|dm_data_in\(9);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(9) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(9);
\u_decoder|ALT_INV_dm_data_in\(8) <= NOT \u_decoder|dm_data_in\(8);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(8) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(8);
\u_decoder|ALT_INV_dm_data_in\(7) <= NOT \u_decoder|dm_data_in\(7);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(7) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(7);
\u_decoder|ALT_INV_dm_data_in\(6) <= NOT \u_decoder|dm_data_in\(6);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(6) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(6);
\u_decoder|ALT_INV_dm_data_in\(5) <= NOT \u_decoder|dm_data_in\(5);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(5) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(5);
\u_decoder|ALT_INV_dm_data_in\(4) <= NOT \u_decoder|dm_data_in\(4);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(4) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(4);
\u_decoder|ALT_INV_dm_data_in\(3) <= NOT \u_decoder|dm_data_in\(3);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(3) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(3);
\u_decoder|ALT_INV_dm_data_in\(2) <= NOT \u_decoder|dm_data_in\(2);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(2) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(2);
\u_decoder|ALT_INV_dm_data_in\(1) <= NOT \u_decoder|dm_data_in\(1);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(1) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(1);
\u_encoder|ALT_INV_double_packet_flag~q\ <= NOT \u_encoder|double_packet_flag~q\;
\u_decoder|ALT_INV_dm_data_in\(0) <= NOT \u_decoder|dm_data_in\(0);
\u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(0) <= NOT \u_correlation_calculator|u_operation|correlation_temp_ff_i\(0);

-- Location: IOOBUF_X54_Y0_N36
\send.data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(0),
	devoe => ww_devoe,
	o => \ww_send.data\(0));

-- Location: IOOBUF_X62_Y0_N53
\send.data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(1),
	devoe => ww_devoe,
	o => \ww_send.data\(1));

-- Location: IOOBUF_X62_Y0_N2
\send.data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(2),
	devoe => ww_devoe,
	o => \ww_send.data\(2));

-- Location: IOOBUF_X60_Y0_N36
\send.data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(3),
	devoe => ww_devoe,
	o => \ww_send.data\(3));

-- Location: IOOBUF_X38_Y0_N2
\send.data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(4),
	devoe => ww_devoe,
	o => \ww_send.data\(4));

-- Location: IOOBUF_X40_Y0_N36
\send.data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(5),
	devoe => ww_devoe,
	o => \ww_send.data\(5));

-- Location: IOOBUF_X38_Y0_N19
\send.data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(6),
	devoe => ww_devoe,
	o => \ww_send.data\(6));

-- Location: IOOBUF_X36_Y0_N53
\send.data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(7),
	devoe => ww_devoe,
	o => \ww_send.data\(7));

-- Location: IOOBUF_X36_Y0_N36
\send.data[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(8),
	devoe => ww_devoe,
	o => \ww_send.data\(8));

-- Location: IOOBUF_X38_Y0_N53
\send.data[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(9),
	devoe => ww_devoe,
	o => \ww_send.data\(9));

-- Location: IOOBUF_X50_Y0_N42
\send.data[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(10),
	devoe => ww_devoe,
	o => \ww_send.data\(10));

-- Location: IOOBUF_X40_Y0_N2
\send.data[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(11),
	devoe => ww_devoe,
	o => \ww_send.data\(11));

-- Location: IOOBUF_X52_Y0_N2
\send.data[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(12),
	devoe => ww_devoe,
	o => \ww_send.data\(12));

-- Location: IOOBUF_X40_Y0_N19
\send.data[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(13),
	devoe => ww_devoe,
	o => \ww_send.data\(13));

-- Location: IOOBUF_X36_Y0_N2
\send.data[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(14),
	devoe => ww_devoe,
	o => \ww_send.data\(14));

-- Location: IOOBUF_X38_Y0_N36
\send.data[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(15),
	devoe => ww_devoe,
	o => \ww_send.data\(15));

-- Location: IOOBUF_X54_Y0_N19
\send.data[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(16),
	devoe => ww_devoe,
	o => \ww_send.data\(16));

-- Location: IOOBUF_X58_Y0_N93
\send.data[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(17),
	devoe => ww_devoe,
	o => \ww_send.data\(17));

-- Location: IOOBUF_X60_Y0_N53
\send.data[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(18),
	devoe => ww_devoe,
	o => \ww_send.data\(18));

-- Location: IOOBUF_X64_Y0_N36
\send.data[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(19),
	devoe => ww_devoe,
	o => \ww_send.data\(19));

-- Location: IOOBUF_X34_Y0_N59
\send.data[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(20),
	devoe => ww_devoe,
	o => \ww_send.data\(20));

-- Location: IOOBUF_X88_Y0_N3
\send.data[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.data\(21));

-- Location: IOOBUF_X34_Y0_N42
\send.data[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(22),
	devoe => ww_devoe,
	o => \ww_send.data\(22));

-- Location: IOOBUF_X80_Y0_N2
\send.data[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.data\(23));

-- Location: IOOBUF_X64_Y0_N53
\send.data[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(24),
	devoe => ww_devoe,
	o => \ww_send.data\(24));

-- Location: IOOBUF_X56_Y0_N36
\send.data[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(25),
	devoe => ww_devoe,
	o => \ww_send.data\(25));

-- Location: IOOBUF_X89_Y16_N22
\send.data[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.data\(26));

-- Location: IOOBUF_X10_Y81_N76
\send.data[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.data\(27));

-- Location: IOOBUF_X36_Y0_N19
\send.data[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(28),
	devoe => ww_devoe,
	o => \ww_send.data\(28));

-- Location: IOOBUF_X56_Y0_N19
\send.data[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.data\(29),
	devoe => ww_devoe,
	o => \ww_send.data\(29));

-- Location: IOOBUF_X34_Y81_N76
\send.data[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.data\(30));

-- Location: IOOBUF_X89_Y15_N5
\send.data[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.data\(31));

-- Location: IOOBUF_X34_Y0_N76
\send.addr[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.addr\(0),
	devoe => ww_devoe,
	o => \ww_send.addr\(0));

-- Location: IOOBUF_X34_Y0_N93
\send.addr[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.addr\(1),
	devoe => ww_devoe,
	o => \ww_send.addr\(1));

-- Location: IOOBUF_X40_Y0_N53
\send.addr[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_encoder|send.addr\(2),
	devoe => ww_devoe,
	o => \ww_send.addr\(2));

-- Location: IOOBUF_X70_Y0_N36
\send.addr[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.addr\(3));

-- Location: IOOBUF_X18_Y0_N42
\send.addr[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.addr\(4));

-- Location: IOOBUF_X14_Y0_N19
\send.addr[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.addr\(5));

-- Location: IOOBUF_X76_Y0_N19
\send.addr[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.addr\(6));

-- Location: IOOBUF_X20_Y81_N19
\send.addr[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.addr\(7));

-- Location: IOIBUF_X89_Y25_N21
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G10
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: LABCELL_X48_Y2_N30
\u_correlation_calculator|u_address_generator|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~25_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(0) ) + ( VCC ) + ( !VCC ))
-- \u_correlation_calculator|u_address_generator|Add0~26\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(0),
	cin => GND,
	sumout => \u_correlation_calculator|u_address_generator|Add0~25_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~26\);

-- Location: IOIBUF_X32_Y0_N52
\recv.data[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(26),
	o => \recv.data[26]~input_o\);

-- Location: IOIBUF_X50_Y0_N92
\recv.data[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(24),
	o => \recv.data[24]~input_o\);

-- Location: IOIBUF_X32_Y0_N35
\recv.data[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(31),
	o => \recv.data[31]~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\recv.data[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(28),
	o => \recv.data[28]~input_o\);

-- Location: IOIBUF_X58_Y0_N75
\recv.data[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(27),
	o => \recv.data[27]~input_o\);

-- Location: IOIBUF_X58_Y0_N58
\recv.data[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(25),
	o => \recv.data[25]~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\recv.data[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(30),
	o => \recv.data[30]~input_o\);

-- Location: IOIBUF_X52_Y0_N52
\recv.data[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(29),
	o => \recv.data[29]~input_o\);

-- Location: LABCELL_X50_Y3_N45
\u_decoder|Mux92~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux92~0_combout\ = ( !\recv.data[30]~input_o\ & ( !\recv.data[29]~input_o\ & ( (!\recv.data[31]~input_o\ & (\recv.data[28]~input_o\ & (!\recv.data[27]~input_o\ & !\recv.data[25]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[31]~input_o\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \ALT_INV_recv.data[27]~input_o\,
	datad => \ALT_INV_recv.data[25]~input_o\,
	datae => \ALT_INV_recv.data[30]~input_o\,
	dataf => \ALT_INV_recv.data[29]~input_o\,
	combout => \u_decoder|Mux92~0_combout\);

-- Location: IOIBUF_X32_Y0_N1
\recv.data[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(18),
	o => \recv.data[18]~input_o\);

-- Location: IOIBUF_X30_Y0_N18
\recv.data[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(19),
	o => \recv.data[19]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\recv.data[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(17),
	o => \recv.data[17]~input_o\);

-- Location: LABCELL_X33_Y2_N12
\u_decoder|Mux92~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux92~1_combout\ = ( !\recv.data[26]~input_o\ & ( (!\recv.data[18]~input_o\ & (!\recv.data[19]~input_o\ & !\recv.data[17]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[18]~input_o\,
	datab => \ALT_INV_recv.data[19]~input_o\,
	datac => \ALT_INV_recv.data[17]~input_o\,
	dataf => \ALT_INV_recv.data[26]~input_o\,
	combout => \u_decoder|Mux92~1_combout\);

-- Location: LABCELL_X48_Y3_N36
\u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CONFIG~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CONFIG~0_combout\ = ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( \u_decoder|config_pending_reg~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_decoder|ALT_INV_config_pending_reg~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CONFIG~0_combout\);

-- Location: IOIBUF_X54_Y0_N52
\init~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_init,
	o => \init~input_o\);

-- Location: LABCELL_X48_Y3_N54
\u_correlation_calculator|u_multicycle_moore_machine|reset_done~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|reset_done~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \u_correlation_calculator|u_multicycle_moore_machine|reset_done~feeder_combout\);

-- Location: FF_X48_Y3_N55
\u_correlation_calculator|u_multicycle_moore_machine|reset_done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_multicycle_moore_machine|reset_done~feeder_combout\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\);

-- Location: LABCELL_X48_Y3_N6
\u_decoder|Mux119~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux119~0_combout\ = ( \u_decoder|reset_request_reg~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\ ) ) # ( !\u_decoder|reset_request_reg~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\ & ( 
-- (\u_decoder|Mux92~0_combout\ & (!\recv.data[24]~input_o\ & \recv.data[26]~input_o\)) ) ) ) # ( \u_decoder|reset_request_reg~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\ & ( (\u_decoder|Mux92~0_combout\ & 
-- (!\recv.data[24]~input_o\ & \recv.data[26]~input_o\)) ) ) ) # ( !\u_decoder|reset_request_reg~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\ & ( (\u_decoder|Mux92~0_combout\ & (!\recv.data[24]~input_o\ & 
-- \recv.data[26]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000100000001000000010000000100000001001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_Mux92~0_combout\,
	datab => \ALT_INV_recv.data[24]~input_o\,
	datac => \ALT_INV_recv.data[26]~input_o\,
	datae => \u_decoder|ALT_INV_reset_request_reg~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~q\,
	combout => \u_decoder|Mux119~0_combout\);

-- Location: FF_X48_Y3_N8
\u_decoder|reset_request_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux119~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|reset_request_reg~q\);

-- Location: LABCELL_X48_Y3_N15
\u_correlation_calculator|u_multicycle_moore_machine|reset_done~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|reset_done~0_combout\ = ( \u_decoder|reset_request_reg~q\ ) # ( !\u_decoder|reset_request_reg~q\ & ( \init~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_init~input_o\,
	dataf => \u_decoder|ALT_INV_reset_request_reg~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|reset_done~0_combout\);

-- Location: FF_X48_Y3_N38
\u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CONFIG~0_combout\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\);

-- Location: LABCELL_X48_Y3_N0
\u_decoder|Mux36~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux36~0_combout\ = ( \u_decoder|config_pending_reg~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\ & ( (\u_decoder|Mux92~0_combout\ & (\u_decoder|Mux92~1_combout\ & (!\recv.data[26]~input_o\ $ 
-- (!\recv.data[24]~input_o\)))) ) ) ) # ( !\u_decoder|config_pending_reg~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\ & ( (\u_decoder|Mux92~0_combout\ & (\u_decoder|Mux92~1_combout\ & (!\recv.data[26]~input_o\ $ 
-- (!\recv.data[24]~input_o\)))) ) ) ) # ( \u_decoder|config_pending_reg~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\ & ( (!\recv.data[26]~input_o\) # (((!\u_decoder|Mux92~0_combout\) # (\u_decoder|Mux92~1_combout\)) # 
-- (\recv.data[24]~input_o\)) ) ) ) # ( !\u_decoder|config_pending_reg~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\ & ( (\u_decoder|Mux92~0_combout\ & (\u_decoder|Mux92~1_combout\ & (!\recv.data[26]~input_o\ $ 
-- (!\recv.data[24]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000110111110111111111100000000000001100000000000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[26]~input_o\,
	datab => \ALT_INV_recv.data[24]~input_o\,
	datac => \u_decoder|ALT_INV_Mux92~0_combout\,
	datad => \u_decoder|ALT_INV_Mux92~1_combout\,
	datae => \u_decoder|ALT_INV_config_pending_reg~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CONFIG~q\,
	combout => \u_decoder|Mux36~0_combout\);

-- Location: FF_X48_Y3_N2
\u_decoder|config_pending_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux36~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|config_pending_reg~q\);

-- Location: LABCELL_X50_Y3_N30
\u_decoder|Mux26~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux26~1_combout\ = ( !\recv.data[29]~input_o\ & ( (\recv.data[28]~input_o\ & (!\recv.data[30]~input_o\ & !\recv.data[31]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000000001100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \ALT_INV_recv.data[30]~input_o\,
	datad => \ALT_INV_recv.data[31]~input_o\,
	dataf => \ALT_INV_recv.data[29]~input_o\,
	combout => \u_decoder|Mux26~1_combout\);

-- Location: LABCELL_X50_Y3_N15
\u_decoder|mode_reg~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|mode_reg~0_combout\ = ( \u_decoder|mode_reg~q\ & ( \recv.data[25]~input_o\ & ( ((!\u_decoder|Mux26~1_combout\) # ((!\recv.data[24]~input_o\) # (\recv.data[27]~input_o\))) # (\recv.data[26]~input_o\) ) ) ) # ( !\u_decoder|mode_reg~q\ & ( 
-- \recv.data[25]~input_o\ & ( (!\recv.data[26]~input_o\ & (\u_decoder|Mux26~1_combout\ & (!\recv.data[27]~input_o\ & !\recv.data[24]~input_o\))) ) ) ) # ( \u_decoder|mode_reg~q\ & ( !\recv.data[25]~input_o\ & ( (!\recv.data[26]~input_o\) # 
-- ((!\u_decoder|Mux26~1_combout\) # ((\recv.data[24]~input_o\) # (\recv.data[27]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011111111111100100000000000001111111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[26]~input_o\,
	datab => \u_decoder|ALT_INV_Mux26~1_combout\,
	datac => \ALT_INV_recv.data[27]~input_o\,
	datad => \ALT_INV_recv.data[24]~input_o\,
	datae => \u_decoder|ALT_INV_mode_reg~q\,
	dataf => \ALT_INV_recv.data[25]~input_o\,
	combout => \u_decoder|mode_reg~0_combout\);

-- Location: FF_X47_Y3_N2
\u_decoder|mode_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|mode_reg~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|mode_reg~q\);

-- Location: LABCELL_X50_Y3_N36
\u_decoder|Mux109~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux109~0_combout\ = ( !\recv.data[30]~input_o\ & ( \recv.data[29]~input_o\ & ( (!\recv.data[31]~input_o\ & (!\recv.data[28]~input_o\ & \u_decoder|mode_reg~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[31]~input_o\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \u_decoder|ALT_INV_mode_reg~q\,
	datae => \ALT_INV_recv.data[30]~input_o\,
	dataf => \ALT_INV_recv.data[29]~input_o\,
	combout => \u_decoder|Mux109~0_combout\);

-- Location: FF_X50_Y3_N38
\u_decoder|calculate_pending_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux109~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|calculate_pending_reg~q\);

-- Location: FF_X50_Y3_N40
\u_decoder|calculate\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|calculate_pending_reg~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|calculate~q\);

-- Location: LABCELL_X48_Y3_N39
\u_correlation_calculator|u_multicycle_moore_machine|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|Selector0~0_combout\ = ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- (((\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\) # (\u_decoder|calculate~q\)) # (\u_decoder|config_pending_reg~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000011110000011100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_config_pending_reg~q\,
	datab => \u_decoder|ALT_INV_calculate~q\,
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CONFIG~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|Selector0~0_combout\);

-- Location: FF_X48_Y3_N40
\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_multicycle_moore_machine|Selector0~0_combout\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\);

-- Location: LABCELL_X48_Y3_N42
\u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CAPTURE_NEW_ADDR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CAPTURE_NEW_ADDR~0_combout\ = ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( (!\u_decoder|config_pending_reg~q\ & \u_decoder|calculate~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_config_pending_reg~q\,
	datac => \u_decoder|ALT_INV_calculate~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CAPTURE_NEW_ADDR~0_combout\);

-- Location: FF_X48_Y3_N44
\u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_CAPTURE_NEW_ADDR~0_combout\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\);

-- Location: LABCELL_X51_Y2_N30
\u_correlation_calculator|u_multicycle_moore_machine|counter_clr\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\ ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\ & ( 
-- !\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CAPTURE_NEW_ADDR~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\);

-- Location: FF_X48_Y3_N35
\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\);

-- Location: LABCELL_X48_Y2_N42
\u_correlation_calculator|u_address_generator|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~5_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(4) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~30\ ))
-- \u_correlation_calculator|u_address_generator|Add0~6\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(4) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4),
	cin => \u_correlation_calculator|u_address_generator|Add0~30\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~5_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~6\);

-- Location: LABCELL_X48_Y2_N45
\u_correlation_calculator|u_address_generator|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~17_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(5) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~6\ ))
-- \u_correlation_calculator|u_address_generator|Add0~18\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(5) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5),
	cin => \u_correlation_calculator|u_address_generator|Add0~6\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~17_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~18\);

-- Location: FF_X48_Y2_N46
\u_correlation_calculator|u_address_generator|counter_ff[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add0~17_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(5));

-- Location: LABCELL_X48_Y2_N48
\u_correlation_calculator|u_address_generator|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~13_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~18\ ))
-- \u_correlation_calculator|u_address_generator|Add0~14\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[6]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_address_generator|Add0~18\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~13_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~14\);

-- Location: FF_X47_Y2_N58
\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_address_generator|Add0~13_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\);

-- Location: LABCELL_X48_Y2_N51
\u_correlation_calculator|u_address_generator|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~9_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~14\ ))
-- \u_correlation_calculator|u_address_generator|Add0~10\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[7]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_address_generator|Add0~14\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~9_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~10\);

-- Location: FF_X47_Y2_N49
\u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_address_generator|Add0~9_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\);

-- Location: LABCELL_X48_Y2_N54
\u_correlation_calculator|u_address_generator|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~1_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(8) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(8),
	cin => \u_correlation_calculator|u_address_generator|Add0~10\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~1_sumout\);

-- Location: FF_X48_Y2_N55
\u_correlation_calculator|u_address_generator|counter_ff[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add0~1_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(8));

-- Location: IOIBUF_X54_Y0_N1
\recv.data[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(5),
	o => \recv.data[5]~input_o\);

-- Location: IOIBUF_X66_Y0_N75
\recv.data[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(16),
	o => \recv.data[16]~input_o\);

-- Location: LABCELL_X48_Y3_N24
\u_decoder|Mux82~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux82~0_combout\ = ( !\recv.data[16]~input_o\ & ( (\u_decoder|Mux92~0_combout\ & (\recv.data[24]~input_o\ & \u_decoder|Mux92~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_Mux92~0_combout\,
	datab => \ALT_INV_recv.data[24]~input_o\,
	datac => \u_decoder|ALT_INV_Mux92~1_combout\,
	dataf => \ALT_INV_recv.data[16]~input_o\,
	combout => \u_decoder|Mux82~0_combout\);

-- Location: FF_X46_Y2_N5
\u_decoder|window_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[5]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(5));

-- Location: FF_X46_Y2_N14
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(5),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5));

-- Location: IOIBUF_X50_Y0_N75
\recv.data[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(7),
	o => \recv.data[7]~input_o\);

-- Location: FF_X45_Y2_N47
\u_decoder|window_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[7]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(7));

-- Location: FF_X45_Y2_N56
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(7),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7));

-- Location: IOIBUF_X50_Y0_N58
\recv.data[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(6),
	o => \recv.data[6]~input_o\);

-- Location: FF_X45_Y2_N29
\u_decoder|window_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[6]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(6));

-- Location: FF_X45_Y2_N38
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(6),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6));

-- Location: LABCELL_X45_Y2_N36
\u_correlation_calculator|u_address_generator|LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan2~0_combout\ = ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( \u_correlation_calculator|u_address_generator|counter_ff\(5) & ( 
-- (\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ & (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) $ 
-- (\u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\)))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( \u_correlation_calculator|u_address_generator|counter_ff\(5) & ( 
-- (!\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ & (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) $ 
-- (\u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\)))) ) ) ) # ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( !\u_correlation_calculator|u_address_generator|counter_ff\(5) & ( 
-- (\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) $ 
-- (\u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\)))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( !\u_correlation_calculator|u_address_generator|counter_ff\(5) & ( 
-- (!\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) $ 
-- (\u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[6]~DUPLICATE_q\,
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(5),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(7),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[7]~DUPLICATE_q\,
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(6),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5),
	combout => \u_correlation_calculator|u_address_generator|LessThan2~0_combout\);

-- Location: IOIBUF_X66_Y0_N58
\recv.data[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(4),
	o => \recv.data[4]~input_o\);

-- Location: FF_X48_Y2_N16
\u_decoder|window_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[4]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(4));

-- Location: FF_X46_Y2_N23
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(4),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4));

-- Location: IOIBUF_X64_Y0_N1
\recv.data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(0),
	o => \recv.data[0]~input_o\);

-- Location: FF_X47_Y2_N34
\u_decoder|window_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[0]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(0));

-- Location: FF_X46_Y2_N17
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(0),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0));

-- Location: IOIBUF_X32_Y0_N18
\recv.data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(1),
	o => \recv.data[1]~input_o\);

-- Location: FF_X45_Y2_N7
\u_decoder|window_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[1]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(1));

-- Location: FF_X45_Y2_N41
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(1),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1));

-- Location: LABCELL_X45_Y2_N33
\u_correlation_calculator|u_address_generator|LessThan2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan2~1_combout\ = ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1) & ( (!\u_correlation_calculator|u_address_generator|counter_ff\(1)) # 
-- ((\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0) & !\u_correlation_calculator|u_address_generator|counter_ff\(0))) ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1) & ( 
-- (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0) & (!\u_correlation_calculator|u_address_generator|counter_ff\(1) & !\u_correlation_calculator|u_address_generator|counter_ff\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000011110101111100001111010111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(0),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(1),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(0),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(1),
	combout => \u_correlation_calculator|u_address_generator|LessThan2~1_combout\);

-- Location: FF_X48_Y2_N40
\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add0~29_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\);

-- Location: IOIBUF_X52_Y0_N18
\recv.data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(3),
	o => \recv.data[3]~input_o\);

-- Location: FF_X45_Y2_N43
\u_decoder|window_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[3]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(3));

-- Location: FF_X45_Y2_N53
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(3),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3));

-- Location: IOIBUF_X64_Y0_N18
\recv.data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(2),
	o => \recv.data[2]~input_o\);

-- Location: FF_X45_Y2_N14
\u_decoder|window_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[2]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(2));

-- Location: FF_X45_Y2_N59
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(2),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2));

-- Location: LABCELL_X45_Y2_N30
\u_correlation_calculator|u_address_generator|LessThan2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan2~3_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(2) & ( (!\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ & 
-- \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3)) ) ) # ( !\u_correlation_calculator|u_address_generator|counter_ff\(2) & ( (!\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ & 
-- ((\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2)) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3)))) # (\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ & 
-- (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3) & \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011001111000011001100111100001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[3]~DUPLICATE_q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(3),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(2),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2),
	combout => \u_correlation_calculator|u_address_generator|LessThan2~3_combout\);

-- Location: LABCELL_X45_Y2_N51
\u_correlation_calculator|u_address_generator|LessThan2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan2~2_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(2) & ( (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) & 
-- (!\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ $ (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3)))) ) ) # ( !\u_correlation_calculator|u_address_generator|counter_ff\(2) & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) & (!\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ $ (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000001100110000000000110000110000000000110011000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(2),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[3]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(3),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2),
	combout => \u_correlation_calculator|u_address_generator|LessThan2~2_combout\);

-- Location: LABCELL_X45_Y2_N42
\u_correlation_calculator|u_address_generator|LessThan2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan2~4_combout\ = ( \u_correlation_calculator|u_address_generator|LessThan2~2_combout\ & ( \u_correlation_calculator|u_address_generator|counter_ff\(4) & ( 
-- (\u_correlation_calculator|u_address_generator|LessThan2~0_combout\ & (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) & ((\u_correlation_calculator|u_address_generator|LessThan2~3_combout\) # 
-- (\u_correlation_calculator|u_address_generator|LessThan2~1_combout\)))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|LessThan2~2_combout\ & ( \u_correlation_calculator|u_address_generator|counter_ff\(4) & ( 
-- (\u_correlation_calculator|u_address_generator|LessThan2~0_combout\ & (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) & \u_correlation_calculator|u_address_generator|LessThan2~3_combout\)) ) ) ) # ( 
-- \u_correlation_calculator|u_address_generator|LessThan2~2_combout\ & ( !\u_correlation_calculator|u_address_generator|counter_ff\(4) & ( (\u_correlation_calculator|u_address_generator|LessThan2~0_combout\ & 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) & ((\u_correlation_calculator|u_address_generator|LessThan2~3_combout\) # (\u_correlation_calculator|u_address_generator|LessThan2~1_combout\)))) ) ) ) # ( 
-- !\u_correlation_calculator|u_address_generator|LessThan2~2_combout\ & ( !\u_correlation_calculator|u_address_generator|counter_ff\(4) & ( (\u_correlation_calculator|u_address_generator|LessThan2~0_combout\ & 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) & \u_correlation_calculator|u_address_generator|LessThan2~3_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000100000001000100010000000000000100010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~0_combout\,
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(4),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~1_combout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~3_combout\,
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~2_combout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4),
	combout => \u_correlation_calculator|u_address_generator|LessThan2~4_combout\);

-- Location: IOIBUF_X52_Y0_N35
\recv.data[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(8),
	o => \recv.data[8]~input_o\);

-- Location: FF_X46_Y2_N10
\u_decoder|window_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[8]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux82~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|window_reg\(8));

-- Location: FF_X46_Y2_N26
\u_correlation_calculator|u_address_generator|correlation_window_n_ff[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|window_reg\(8),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8));

-- Location: FF_X48_Y3_N53
\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD3~q\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\);

-- Location: FF_X48_Y3_N50
\u_correlation_calculator|u_multicycle_moore_machine|state.S_MULTIPLY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_MULTIPLY~q\);

-- Location: FF_X48_Y3_N59
\u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_multicycle_moore_machine|state.S_MULTIPLY~q\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\);

-- Location: LABCELL_X48_Y3_N30
\u_correlation_calculator|u_multicycle_moore_machine|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|Selector1~0_combout\ = ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ & ( 
-- ((!\u_correlation_calculator|u_address_generator|counter_ff\(8)) # ((!\u_correlation_calculator|u_address_generator|LessThan2~6_combout\) # (\u_correlation_calculator|u_address_generator|LessThan2~4_combout\))) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\) ) ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ & ( 
-- ((!\u_correlation_calculator|u_address_generator|counter_ff\(8) & ((!\u_correlation_calculator|u_address_generator|LessThan2~6_combout\) # (\u_correlation_calculator|u_address_generator|LessThan2~4_combout\)))) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\) ) ) ) # ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ & ( 
-- \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\ ) ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ & ( 
-- \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111010101110111011111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD_ORIGIN~q\,
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(8),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~6_combout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~4_combout\,
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(8),
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_ACCUMULATE~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|Selector1~0_combout\);

-- Location: FF_X48_Y3_N31
\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_multicycle_moore_machine|Selector1~0_combout\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\);

-- Location: FF_X48_Y3_N47
\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\);

-- Location: FF_X48_Y3_N17
\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD3~q\);

-- Location: LABCELL_X48_Y3_N12
\u_correlation_calculator|u_address_generator|counter_ff[8]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD3~q\) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\) ) ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CAPTURE_NEW_ADDR~q\,
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD3~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\);

-- Location: FF_X47_Y2_N53
\u_correlation_calculator|u_address_generator|counter_ff[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_address_generator|Add0~25_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(0));

-- Location: LABCELL_X48_Y2_N33
\u_correlation_calculator|u_address_generator|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~21_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(1) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~26\ ))
-- \u_correlation_calculator|u_address_generator|Add0~22\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(1) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(1),
	cin => \u_correlation_calculator|u_address_generator|Add0~26\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~21_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~22\);

-- Location: FF_X48_Y2_N34
\u_correlation_calculator|u_address_generator|counter_ff[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add0~21_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(1));

-- Location: LABCELL_X48_Y2_N36
\u_correlation_calculator|u_address_generator|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~33_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(2) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~22\ ))
-- \u_correlation_calculator|u_address_generator|Add0~34\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(2) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2),
	cin => \u_correlation_calculator|u_address_generator|Add0~22\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~33_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~34\);

-- Location: FF_X48_Y2_N38
\u_correlation_calculator|u_address_generator|counter_ff[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add0~33_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(2));

-- Location: LABCELL_X48_Y2_N39
\u_correlation_calculator|u_address_generator|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add0~29_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(3) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~34\ ))
-- \u_correlation_calculator|u_address_generator|Add0~30\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(3) ) + ( GND ) + ( \u_correlation_calculator|u_address_generator|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(3),
	cin => \u_correlation_calculator|u_address_generator|Add0~34\,
	sumout => \u_correlation_calculator|u_address_generator|Add0~29_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add0~30\);

-- Location: FF_X48_Y2_N41
\u_correlation_calculator|u_address_generator|counter_ff[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add0~29_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(3));

-- Location: FF_X47_Y2_N56
\u_correlation_calculator|u_address_generator|counter_ff[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_address_generator|Add0~5_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(4));

-- Location: LABCELL_X45_Y2_N57
\u_correlation_calculator|u_address_generator|LessThan2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan2~5_combout\ = ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) & ( \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & (!\u_correlation_calculator|u_address_generator|counter_ff\(5) & (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & 
-- !\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ((!\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\) # 
-- ((!\u_correlation_calculator|u_address_generator|counter_ff\(5) & \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5))))) ) ) ) # ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) & ( 
-- !\u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) & ( !\u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & (!\u_correlation_calculator|u_address_generator|counter_ff\(5) & (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & 
-- !\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ((!\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\) # 
-- ((!\u_correlation_calculator|u_address_generator|counter_ff\(5) & \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010111100000010111111111111111100000000000000000010111100000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5),
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(5),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(6),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[6]~DUPLICATE_q\,
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(7),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[7]~DUPLICATE_q\,
	combout => \u_correlation_calculator|u_address_generator|LessThan2~5_combout\);

-- Location: LABCELL_X45_Y2_N48
\u_correlation_calculator|u_address_generator|LessThan2~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan2~6_combout\ = ( !\u_correlation_calculator|u_address_generator|LessThan2~5_combout\ & ( ((!\u_correlation_calculator|u_address_generator|LessThan2~0_combout\) # 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4))) # (\u_correlation_calculator|u_address_generator|counter_ff\(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111110101111111111111010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~0_combout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(4),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~5_combout\,
	combout => \u_correlation_calculator|u_address_generator|LessThan2~6_combout\);

-- Location: LABCELL_X48_Y3_N18
\u_correlation_calculator|u_multicycle_moore_machine|next_state.S_OUTPUT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_OUTPUT~0_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ & ( (!\u_correlation_calculator|u_address_generator|counter_ff\(8) & 
-- (\u_correlation_calculator|u_address_generator|LessThan2~6_combout\ & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & !\u_correlation_calculator|u_address_generator|LessThan2~4_combout\))) # 
-- (\u_correlation_calculator|u_address_generator|counter_ff\(8) & ((!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8)) # ((\u_correlation_calculator|u_address_generator|LessThan2~6_combout\ & 
-- !\u_correlation_calculator|u_address_generator|LessThan2~4_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110001001100000111000100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~6_combout\,
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(8),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(8),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan2~4_combout\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_ACCUMULATE~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_OUTPUT~0_combout\);

-- Location: FF_X48_Y3_N19
\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_multicycle_moore_machine|next_state.S_OUTPUT~0_combout\,
	clrn => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\);

-- Location: LABCELL_X50_Y1_N30
\u_encoder|double_packet_flag~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|double_packet_flag~0_combout\ = ( \u_encoder|double_packet_flag~q\ & ( \u_decoder|status_pending_reg~q\ ) ) # ( \u_encoder|double_packet_flag~q\ & ( !\u_decoder|status_pending_reg~q\ & ( (!\u_decoder|mode_reg~q\) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) ) ) ) # ( !\u_encoder|double_packet_flag~q\ & ( !\u_decoder|status_pending_reg~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111110011111100111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_decoder|ALT_INV_mode_reg~q\,
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datae => \u_encoder|ALT_INV_double_packet_flag~q\,
	dataf => \u_decoder|ALT_INV_status_pending_reg~q\,
	combout => \u_encoder|double_packet_flag~0_combout\);

-- Location: FF_X50_Y1_N32
\u_encoder|double_packet_flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|double_packet_flag~0_combout\,
	sclr => \u_encoder|double_packet_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|double_packet_flag~q\);

-- Location: LABCELL_X50_Y1_N24
\u_encoder|send~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~22_combout\ = ( !\u_encoder|double_packet_flag~q\ & ( \u_decoder|status_pending_reg~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_decoder|ALT_INV_status_pending_reg~q\,
	dataf => \u_encoder|ALT_INV_double_packet_flag~q\,
	combout => \u_encoder|send~22_combout\);

-- Location: FF_X50_Y1_N10
\u_encoder|status_transmit_done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_encoder|send~22_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|status_transmit_done~q\);

-- Location: LABCELL_X50_Y1_N54
\u_decoder|Mux26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux26~0_combout\ = ( !\recv.data[26]~input_o\ & ( (!\recv.data[27]~input_o\ & ((!\recv.data[24]~input_o\) # (\recv.data[25]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000001010000111100000101000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[25]~input_o\,
	datac => \ALT_INV_recv.data[27]~input_o\,
	datad => \ALT_INV_recv.data[24]~input_o\,
	dataf => \ALT_INV_recv.data[26]~input_o\,
	combout => \u_decoder|Mux26~0_combout\);

-- Location: LABCELL_X50_Y1_N42
\u_decoder|Mux26~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux26~2_combout\ = ( \u_decoder|status_pending_reg~q\ & ( \u_decoder|Mux26~1_combout\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\) # ((!\u_encoder|status_transmit_done~q\) # (\u_decoder|Mux26~0_combout\)) ) ) ) # ( 
-- !\u_decoder|status_pending_reg~q\ & ( \u_decoder|Mux26~1_combout\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\) # (((!\u_encoder|status_transmit_done~q\ & \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\)) 
-- # (\u_decoder|Mux26~0_combout\)) ) ) ) # ( \u_decoder|status_pending_reg~q\ & ( !\u_decoder|Mux26~1_combout\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\) # (!\u_encoder|status_transmit_done~q\) ) ) ) # ( 
-- !\u_decoder|status_pending_reg~q\ & ( !\u_decoder|Mux26~1_combout\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\) # ((!\u_encoder|status_transmit_done~q\ & \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\)) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011101110111011101110111010101111111011111110111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~q\,
	datab => \u_encoder|ALT_INV_status_transmit_done~q\,
	datac => \u_decoder|ALT_INV_Mux26~0_combout\,
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CONFIG~q\,
	datae => \u_decoder|ALT_INV_status_pending_reg~q\,
	dataf => \u_decoder|ALT_INV_Mux26~1_combout\,
	combout => \u_decoder|Mux26~2_combout\);

-- Location: FF_X50_Y1_N44
\u_decoder|status_pending_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux26~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|status_pending_reg~q\);

-- Location: LABCELL_X51_Y1_N6
\u_encoder|send~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~0_combout\ = ( !\u_decoder|status_pending_reg~q\ & ( \u_encoder|double_packet_flag~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ ) ) ) # ( !\u_decoder|status_pending_reg~q\ & ( 
-- !\u_encoder|double_packet_flag~q\ & ( (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) # (\u_decoder|mode_reg~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111000000000000000000000000111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_decoder|ALT_INV_mode_reg~q\,
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datae => \u_decoder|ALT_INV_status_pending_reg~q\,
	dataf => \u_encoder|ALT_INV_double_packet_flag~q\,
	combout => \u_encoder|send~0_combout\);

-- Location: LABCELL_X48_Y3_N21
\u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~0_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) ) # ( 
-- !\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD4~q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~0_combout\);

-- Location: LABCELL_X48_Y3_N51
\u_correlation_calculator|u_operation|current_ave_data_ff[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) ) # ( 
-- !\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD4~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ $ (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD3~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101001010101101010100101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD3~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD4~q\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\);

-- Location: LABCELL_X50_Y3_N33
\u_decoder|dm_data_in[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|dm_data_in[2]~0_combout\ = ( !\recv.data[25]~input_o\ & ( (!\recv.data[24]~input_o\ & (\recv.data[28]~input_o\ & (!\recv.data[27]~input_o\ & \recv.data[26]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[24]~input_o\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \ALT_INV_recv.data[27]~input_o\,
	datad => \ALT_INV_recv.data[26]~input_o\,
	dataf => \ALT_INV_recv.data[25]~input_o\,
	combout => \u_decoder|dm_data_in[2]~0_combout\);

-- Location: LABCELL_X50_Y3_N27
\u_decoder|dm_data_in[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|dm_data_in[2]~1_combout\ = ( !\recv.data[30]~input_o\ & ( (!\recv.data[31]~input_o\ & ((!\recv.data[29]~input_o\ & ((\u_decoder|dm_data_in[2]~0_combout\))) # (\recv.data[29]~input_o\ & (!\recv.data[28]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111000000000000000000000000001001110000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \u_decoder|ALT_INV_dm_data_in[2]~0_combout\,
	datad => \ALT_INV_recv.data[31]~input_o\,
	datae => \ALT_INV_recv.data[30]~input_o\,
	combout => \u_decoder|dm_data_in[2]~1_combout\);

-- Location: FF_X51_Y3_N38
\u_decoder|dm_data_in[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[0]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(0));

-- Location: MLABCELL_X47_Y3_N0
\u_decoder|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~1_sumout\ = SUM(( \u_decoder|mode_reg~q\ ) + ( !\u_decoder|next_write_addr_reg\(0) ) + ( !VCC ))
-- \u_decoder|Add0~2\ = CARRY(( \u_decoder|mode_reg~q\ ) + ( !\u_decoder|next_write_addr_reg\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_decoder|ALT_INV_next_write_addr_reg\(0),
	datad => \u_decoder|ALT_INV_mode_reg~q\,
	cin => GND,
	sumout => \u_decoder|Add0~1_sumout\,
	cout => \u_decoder|Add0~2\);

-- Location: MLABCELL_X47_Y3_N42
\u_decoder|Mux118~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux118~0_combout\ = (\recv.data[29]~input_o\ & !\u_decoder|Add0~1_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	datac => \u_decoder|ALT_INV_Add0~1_sumout\,
	combout => \u_decoder|Mux118~0_combout\);

-- Location: FF_X47_Y3_N44
\u_decoder|next_write_addr_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux118~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(0));

-- Location: MLABCELL_X47_Y3_N57
\u_decoder|next_write_addr_reg[0]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[0]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(0),
	combout => \u_decoder|next_write_addr_reg[0]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N3
\u_decoder|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~5_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(1) ) + ( GND ) + ( \u_decoder|Add0~2\ ))
-- \u_decoder|Add0~6\ = CARRY(( !\u_decoder|next_write_addr_reg\(1) ) + ( GND ) + ( \u_decoder|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_decoder|ALT_INV_next_write_addr_reg\(1),
	cin => \u_decoder|Add0~2\,
	sumout => \u_decoder|Add0~5_sumout\,
	cout => \u_decoder|Add0~6\);

-- Location: MLABCELL_X47_Y3_N36
\u_decoder|Mux117~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux117~0_combout\ = (\recv.data[29]~input_o\ & !\u_decoder|Add0~5_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	datac => \u_decoder|ALT_INV_Add0~5_sumout\,
	combout => \u_decoder|Mux117~0_combout\);

-- Location: FF_X47_Y3_N38
\u_decoder|next_write_addr_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux117~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(1));

-- Location: LABCELL_X46_Y1_N36
\u_decoder|next_write_addr_reg[1]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[1]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(1),
	combout => \u_decoder|next_write_addr_reg[1]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N6
\u_decoder|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~9_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(2) ) + ( GND ) + ( \u_decoder|Add0~6\ ))
-- \u_decoder|Add0~10\ = CARRY(( !\u_decoder|next_write_addr_reg\(2) ) + ( GND ) + ( \u_decoder|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_decoder|ALT_INV_next_write_addr_reg\(2),
	cin => \u_decoder|Add0~6\,
	sumout => \u_decoder|Add0~9_sumout\,
	cout => \u_decoder|Add0~10\);

-- Location: MLABCELL_X47_Y3_N39
\u_decoder|Mux116~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux116~0_combout\ = ( !\u_decoder|Add0~9_sumout\ & ( \recv.data[29]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	dataf => \u_decoder|ALT_INV_Add0~9_sumout\,
	combout => \u_decoder|Mux116~0_combout\);

-- Location: FF_X47_Y3_N41
\u_decoder|next_write_addr_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux116~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(2));

-- Location: LABCELL_X46_Y3_N15
\u_decoder|next_write_addr_reg[2]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[2]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(2),
	combout => \u_decoder|next_write_addr_reg[2]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N9
\u_decoder|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~13_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(3) ) + ( GND ) + ( \u_decoder|Add0~10\ ))
-- \u_decoder|Add0~14\ = CARRY(( !\u_decoder|next_write_addr_reg\(3) ) + ( GND ) + ( \u_decoder|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_decoder|ALT_INV_next_write_addr_reg\(3),
	cin => \u_decoder|Add0~10\,
	sumout => \u_decoder|Add0~13_sumout\,
	cout => \u_decoder|Add0~14\);

-- Location: MLABCELL_X47_Y3_N54
\u_decoder|Mux115~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux115~0_combout\ = ( !\u_decoder|Add0~13_sumout\ & ( \recv.data[29]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_recv.data[29]~input_o\,
	dataf => \u_decoder|ALT_INV_Add0~13_sumout\,
	combout => \u_decoder|Mux115~0_combout\);

-- Location: FF_X47_Y3_N56
\u_decoder|next_write_addr_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux115~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(3));

-- Location: MLABCELL_X47_Y1_N21
\u_decoder|next_write_addr_reg[3]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[3]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(3),
	combout => \u_decoder|next_write_addr_reg[3]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N12
\u_decoder|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~17_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(4) ) + ( GND ) + ( \u_decoder|Add0~14\ ))
-- \u_decoder|Add0~18\ = CARRY(( !\u_decoder|next_write_addr_reg\(4) ) + ( GND ) + ( \u_decoder|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_decoder|ALT_INV_next_write_addr_reg\(4),
	cin => \u_decoder|Add0~14\,
	sumout => \u_decoder|Add0~17_sumout\,
	cout => \u_decoder|Add0~18\);

-- Location: MLABCELL_X47_Y3_N51
\u_decoder|Mux114~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux114~0_combout\ = ( !\u_decoder|Add0~17_sumout\ & ( \recv.data[29]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	dataf => \u_decoder|ALT_INV_Add0~17_sumout\,
	combout => \u_decoder|Mux114~0_combout\);

-- Location: FF_X47_Y3_N53
\u_decoder|next_write_addr_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux114~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(4));

-- Location: LABCELL_X46_Y3_N33
\u_decoder|next_write_addr_reg[4]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[4]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(4),
	combout => \u_decoder|next_write_addr_reg[4]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N15
\u_decoder|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~21_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(5) ) + ( GND ) + ( \u_decoder|Add0~18\ ))
-- \u_decoder|Add0~22\ = CARRY(( !\u_decoder|next_write_addr_reg\(5) ) + ( GND ) + ( \u_decoder|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_next_write_addr_reg\(5),
	cin => \u_decoder|Add0~18\,
	sumout => \u_decoder|Add0~21_sumout\,
	cout => \u_decoder|Add0~22\);

-- Location: MLABCELL_X47_Y3_N48
\u_decoder|Mux113~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux113~0_combout\ = ( !\u_decoder|Add0~21_sumout\ & ( \recv.data[29]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	dataf => \u_decoder|ALT_INV_Add0~21_sumout\,
	combout => \u_decoder|Mux113~0_combout\);

-- Location: FF_X47_Y3_N50
\u_decoder|next_write_addr_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux113~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(5));

-- Location: LABCELL_X46_Y3_N36
\u_decoder|next_write_addr_reg[5]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[5]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(5),
	combout => \u_decoder|next_write_addr_reg[5]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N18
\u_decoder|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~25_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(6) ) + ( GND ) + ( \u_decoder|Add0~22\ ))
-- \u_decoder|Add0~26\ = CARRY(( !\u_decoder|next_write_addr_reg\(6) ) + ( GND ) + ( \u_decoder|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_decoder|ALT_INV_next_write_addr_reg\(6),
	cin => \u_decoder|Add0~22\,
	sumout => \u_decoder|Add0~25_sumout\,
	cout => \u_decoder|Add0~26\);

-- Location: MLABCELL_X47_Y3_N33
\u_decoder|Mux112~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux112~0_combout\ = ( !\u_decoder|Add0~25_sumout\ & ( \recv.data[29]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	dataf => \u_decoder|ALT_INV_Add0~25_sumout\,
	combout => \u_decoder|Mux112~0_combout\);

-- Location: FF_X47_Y3_N35
\u_decoder|next_write_addr_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux112~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(6));

-- Location: LABCELL_X46_Y3_N3
\u_decoder|next_write_addr_reg[6]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[6]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(6),
	combout => \u_decoder|next_write_addr_reg[6]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N21
\u_decoder|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~29_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(7) ) + ( GND ) + ( \u_decoder|Add0~26\ ))
-- \u_decoder|Add0~30\ = CARRY(( !\u_decoder|next_write_addr_reg\(7) ) + ( GND ) + ( \u_decoder|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_decoder|ALT_INV_next_write_addr_reg\(7),
	cin => \u_decoder|Add0~26\,
	sumout => \u_decoder|Add0~29_sumout\,
	cout => \u_decoder|Add0~30\);

-- Location: MLABCELL_X47_Y3_N30
\u_decoder|Mux111~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux111~0_combout\ = (\recv.data[29]~input_o\ & !\u_decoder|Add0~29_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	datac => \u_decoder|ALT_INV_Add0~29_sumout\,
	combout => \u_decoder|Mux111~0_combout\);

-- Location: FF_X47_Y3_N32
\u_decoder|next_write_addr_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux111~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(7));

-- Location: LABCELL_X46_Y3_N12
\u_decoder|next_write_addr_reg[7]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[7]~_wirecell_combout\ = !\u_decoder|next_write_addr_reg\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_decoder|ALT_INV_next_write_addr_reg\(7),
	combout => \u_decoder|next_write_addr_reg[7]~_wirecell_combout\);

-- Location: MLABCELL_X47_Y3_N24
\u_decoder|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Add0~33_sumout\ = SUM(( !\u_decoder|next_write_addr_reg\(8) ) + ( GND ) + ( \u_decoder|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_decoder|ALT_INV_next_write_addr_reg\(8),
	cin => \u_decoder|Add0~30\,
	sumout => \u_decoder|Add0~33_sumout\);

-- Location: MLABCELL_X47_Y3_N45
\u_decoder|Mux110~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux110~0_combout\ = ( !\u_decoder|Add0~33_sumout\ & ( \recv.data[29]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	dataf => \u_decoder|ALT_INV_Add0~33_sumout\,
	combout => \u_decoder|Mux110~0_combout\);

-- Location: FF_X47_Y3_N47
\u_decoder|next_write_addr_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|Mux110~0_combout\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|next_write_addr_reg\(8));

-- Location: LABCELL_X46_Y3_N42
\u_decoder|next_write_addr_reg[8]~_wirecell\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|next_write_addr_reg[8]~_wirecell_combout\ = ( !\u_decoder|next_write_addr_reg\(8) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(8),
	combout => \u_decoder|next_write_addr_reg[8]~_wirecell_combout\);

-- Location: LABCELL_X46_Y3_N24
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[8]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[8]~0_combout\ = ( !\u_decoder|next_write_addr_reg\(8) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(8),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[8]~0_combout\);

-- Location: FF_X46_Y3_N25
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[8]~0_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8));

-- Location: LABCELL_X46_Y3_N18
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[7]~7_combout\ = !\u_decoder|next_write_addr_reg\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_decoder|ALT_INV_next_write_addr_reg\(7),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[7]~7_combout\);

-- Location: FF_X46_Y3_N20
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[7]~7_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7));

-- Location: LABCELL_X46_Y3_N21
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[6]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[6]~8_combout\ = ( !\u_decoder|next_write_addr_reg\(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(6),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[6]~8_combout\);

-- Location: FF_X46_Y3_N22
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[6]~8_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6));

-- Location: LABCELL_X46_Y3_N54
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[5]~5_combout\ = ( !\u_decoder|next_write_addr_reg\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(5),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[5]~5_combout\);

-- Location: FF_X46_Y3_N55
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[5]~5_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5));

-- Location: LABCELL_X46_Y3_N51
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[4]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[4]~6_combout\ = ( !\u_decoder|next_write_addr_reg\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(4),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[4]~6_combout\);

-- Location: FF_X46_Y3_N52
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[4]~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4));

-- Location: MLABCELL_X47_Y1_N0
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[3]~1_combout\ = ( !\u_decoder|next_write_addr_reg\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(3),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[3]~1_combout\);

-- Location: FF_X47_Y1_N1
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[3]~1_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(3));

-- Location: LABCELL_X46_Y3_N6
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[2]~2_combout\ = ( !\u_decoder|next_write_addr_reg\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(2),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[2]~2_combout\);

-- Location: FF_X46_Y3_N7
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[2]~2_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2));

-- Location: LABCELL_X46_Y1_N57
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[1]~4_combout\ = ( !\u_decoder|next_write_addr_reg\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(1),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[1]~4_combout\);

-- Location: FF_X46_Y1_N58
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[1]~4_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(1));

-- Location: LABCELL_X46_Y3_N39
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[0]~3_combout\ = ( !\u_decoder|next_write_addr_reg\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_decoder|ALT_INV_next_write_addr_reg\(0),
	combout => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[0]~3_combout\);

-- Location: FF_X46_Y3_N40
\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff[0]~3_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(0));

-- Location: LABCELL_X46_Y2_N30
\u_correlation_calculator|u_address_generator|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~1_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(0) ) + ( !VCC ))
-- \u_correlation_calculator|u_address_generator|Add1~2\ = CARRY(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(0),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(0),
	cin => GND,
	sumout => \u_correlation_calculator|u_address_generator|Add1~1_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~2\);

-- Location: LABCELL_X46_Y2_N33
\u_correlation_calculator|u_address_generator|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~25_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(1) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~2\ ))
-- \u_correlation_calculator|u_address_generator|Add1~26\ = CARRY(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(1) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(1),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(1),
	cin => \u_correlation_calculator|u_address_generator|Add1~2\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~25_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~26\);

-- Location: LABCELL_X46_Y2_N36
\u_correlation_calculator|u_address_generator|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~33_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~26\ ))
-- \u_correlation_calculator|u_address_generator|Add1~34\ = CARRY(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(2),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(2),
	cin => \u_correlation_calculator|u_address_generator|Add1~26\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~33_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~34\);

-- Location: LABCELL_X46_Y2_N39
\u_correlation_calculator|u_address_generator|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~29_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(3) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~34\ ))
-- \u_correlation_calculator|u_address_generator|Add1~30\ = CARRY(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(3) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(3),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(3),
	cin => \u_correlation_calculator|u_address_generator|Add1~34\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~29_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~30\);

-- Location: LABCELL_X46_Y2_N42
\u_correlation_calculator|u_address_generator|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~21_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~30\ ))
-- \u_correlation_calculator|u_address_generator|Add1~22\ = CARRY(( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) ) + ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(4),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(4),
	cin => \u_correlation_calculator|u_address_generator|Add1~30\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~21_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~22\);

-- Location: LABCELL_X46_Y2_N45
\u_correlation_calculator|u_address_generator|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~17_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~22\ ))
-- \u_correlation_calculator|u_address_generator|Add1~18\ = CARRY(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(5),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(5),
	cin => \u_correlation_calculator|u_address_generator|Add1~22\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~17_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~18\);

-- Location: LABCELL_X46_Y2_N48
\u_correlation_calculator|u_address_generator|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~13_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~18\ ))
-- \u_correlation_calculator|u_address_generator|Add1~14\ = CARRY(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(6),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(6),
	cin => \u_correlation_calculator|u_address_generator|Add1~18\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~13_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~14\);

-- Location: LABCELL_X46_Y2_N51
\u_correlation_calculator|u_address_generator|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~9_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~14\ ))
-- \u_correlation_calculator|u_address_generator|Add1~10\ = CARRY(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(7),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(7),
	cin => \u_correlation_calculator|u_address_generator|Add1~14\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~9_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add1~10\);

-- Location: LABCELL_X46_Y2_N54
\u_correlation_calculator|u_address_generator|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add1~5_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8) ) + ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(8),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(8),
	cin => \u_correlation_calculator|u_address_generator|Add1~10\,
	sumout => \u_correlation_calculator|u_address_generator|Add1~5_sumout\);

-- Location: LABCELL_X46_Y2_N15
\u_correlation_calculator|u_address_generator|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan0~0_combout\ = ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(0) & ( (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1) & 
-- ((!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0)) # (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(1)))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1) & 
-- (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(1) & !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(0))) ) ) # ( !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(0) & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(1) & \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110011001111000011001100111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(1),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(1),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(0),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(0),
	combout => \u_correlation_calculator|u_address_generator|LessThan0~0_combout\);

-- Location: LABCELL_X46_Y2_N12
\u_correlation_calculator|u_address_generator|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan0~1_combout\ = ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5) & ( (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) $ (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4)))) ) ) # ( !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5) & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4) $ (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010100000000101001010000000000000000101001010000000010100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(4),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(4),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(5),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(5),
	combout => \u_correlation_calculator|u_address_generator|LessThan0~1_combout\);

-- Location: LABCELL_X46_Y2_N27
\u_correlation_calculator|u_address_generator|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan0~2_combout\ = ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(3) & ( \u_correlation_calculator|u_address_generator|LessThan0~1_combout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3)) # ((!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) & ((\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2)) # 
-- (\u_correlation_calculator|u_address_generator|LessThan0~0_combout\))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) & (\u_correlation_calculator|u_address_generator|LessThan0~0_combout\ & 
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2)))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(3) & ( \u_correlation_calculator|u_address_generator|LessThan0~1_combout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(3) & ((!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) & ((\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2)) # 
-- (\u_correlation_calculator|u_address_generator|LessThan0~0_combout\))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(2) & (\u_correlation_calculator|u_address_generator|LessThan0~0_combout\ & 
-- \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000100010101010111011101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(3),
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(2),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~0_combout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(2),
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(3),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~1_combout\,
	combout => \u_correlation_calculator|u_address_generator|LessThan0~2_combout\);

-- Location: LABCELL_X46_Y3_N45
\u_correlation_calculator|u_address_generator|LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan0~5_combout\ = ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7) & 
-- !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7)) ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( (!\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7) & 
-- (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6) & !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7))) # (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7) & 
-- ((!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7)) # (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111100000101010111110000010101010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(7),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(6),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(7),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(6),
	combout => \u_correlation_calculator|u_address_generator|LessThan0~5_combout\);

-- Location: LABCELL_X46_Y3_N0
\u_correlation_calculator|u_address_generator|LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan0~4_combout\ = ( \u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6) & 
-- (!\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7) $ (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7)))) ) ) # ( !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(6) & ( 
-- (!\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(6) & (!\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(7) $ (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000001100110000000000110000110000000000110011000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(6),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(7),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(7),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(6),
	combout => \u_correlation_calculator|u_address_generator|LessThan0~4_combout\);

-- Location: LABCELL_X46_Y2_N21
\u_correlation_calculator|u_address_generator|LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan0~3_combout\ = ( \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4) & ( (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & 
-- ((!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4)) # (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5)))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & 
-- (\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5) & !\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(4))) ) ) # ( !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(4) & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(5) & \u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(5)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110011001111000011001100111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(5),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(5),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(4),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(4),
	combout => \u_correlation_calculator|u_address_generator|LessThan0~3_combout\);

-- Location: LABCELL_X46_Y2_N6
\u_correlation_calculator|u_address_generator|LessThan0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan0~6_combout\ = ( \u_correlation_calculator|u_address_generator|LessThan0~4_combout\ & ( \u_correlation_calculator|u_address_generator|LessThan0~3_combout\ & ( 
-- (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8)) ) ) ) # ( !\u_correlation_calculator|u_address_generator|LessThan0~4_combout\ & ( 
-- \u_correlation_calculator|u_address_generator|LessThan0~3_combout\ & ( (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & (!\u_correlation_calculator|u_address_generator|LessThan0~5_combout\ & 
-- !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & ((!\u_correlation_calculator|u_address_generator|LessThan0~5_combout\) # 
-- (!\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8)))) ) ) ) # ( \u_correlation_calculator|u_address_generator|LessThan0~4_combout\ & ( !\u_correlation_calculator|u_address_generator|LessThan0~3_combout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & (!\u_correlation_calculator|u_address_generator|LessThan0~2_combout\ & (!\u_correlation_calculator|u_address_generator|LessThan0~5_combout\ & 
-- !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8)))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & ((!\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8)) # 
-- ((!\u_correlation_calculator|u_address_generator|LessThan0~2_combout\ & !\u_correlation_calculator|u_address_generator|LessThan0~5_combout\)))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|LessThan0~4_combout\ & ( 
-- !\u_correlation_calculator|u_address_generator|LessThan0~3_combout\ & ( (!\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & (!\u_correlation_calculator|u_address_generator|LessThan0~5_combout\ & 
-- !\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8))) # (\u_correlation_calculator|u_address_generator|correlation_window_n_ff\(8) & ((!\u_correlation_calculator|u_address_generator|LessThan0~5_combout\) # 
-- (!\u_correlation_calculator|u_address_generator|new_ave_data_addr_ff\(8)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010101010000110101010100000011110101010100000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_correlation_window_n_ff\(8),
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~2_combout\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~5_combout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_new_ave_data_addr_ff\(8),
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~4_combout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan0~3_combout\,
	combout => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\);

-- Location: FF_X46_Y2_N55
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~5_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8));

-- Location: FF_X47_Y2_N59
\u_correlation_calculator|u_address_generator|counter_ff[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_address_generator|Add0~13_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(6));

-- Location: FF_X46_Y2_N52
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~9_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7));

-- Location: FF_X46_Y2_N49
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~13_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6));

-- Location: FF_X47_Y2_N50
\u_correlation_calculator|u_address_generator|counter_ff[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_address_generator|Add0~9_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|counter_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_address_generator|counter_ff[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|counter_ff\(7));

-- Location: MLABCELL_X47_Y2_N36
\u_correlation_calculator|u_address_generator|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~0_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(7) & ( (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) & 
-- (!\u_correlation_calculator|u_address_generator|counter_ff\(6) $ (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6)))) ) ) # ( !\u_correlation_calculator|u_address_generator|counter_ff\(7) & ( 
-- (!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) & (!\u_correlation_calculator|u_address_generator|counter_ff\(6) $ (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000110000110000000011000000001100000000110000110000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(6),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(7),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(6),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(7),
	combout => \u_correlation_calculator|u_address_generator|LessThan1~0_combout\);

-- Location: FF_X46_Y2_N41
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~29_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(3));

-- Location: FF_X46_Y2_N38
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~33_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(2));

-- Location: LABCELL_X46_Y2_N0
\u_correlation_calculator|u_address_generator|LessThan1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~4_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(2) & ( (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(2) & 
-- (!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(3) $ (\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\))) ) ) # ( !\u_correlation_calculator|u_address_generator|counter_ff\(2) & ( 
-- (!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(2) & (!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(3) $ (\u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000110000110000000011000000001100000000110000110000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(3),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(2),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[3]~DUPLICATE_q\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2),
	combout => \u_correlation_calculator|u_address_generator|LessThan1~4_combout\);

-- Location: FF_X46_Y2_N43
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~21_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\);

-- Location: LABCELL_X46_Y2_N18
\u_correlation_calculator|u_address_generator|LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~2_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(4) & ( !\u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\ ) ) # ( 
-- !\u_correlation_calculator|u_address_generator|counter_ff\(4) & ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[4]~DUPLICATE_q\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4),
	combout => \u_correlation_calculator|u_address_generator|LessThan1~2_combout\);

-- Location: FF_X46_Y2_N34
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~25_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1));

-- Location: FF_X46_Y2_N31
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~1_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\);

-- Location: MLABCELL_X47_Y2_N42
\u_correlation_calculator|u_address_generator|LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~3_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(0) & ( (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1) & 
-- !\u_correlation_calculator|u_address_generator|counter_ff\(1)) ) ) # ( !\u_correlation_calculator|u_address_generator|counter_ff\(0) & ( (!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1) & 
-- (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\ & !\u_correlation_calculator|u_address_generator|counter_ff\(1))) # (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1) & 
-- ((!\u_correlation_calculator|u_address_generator|counter_ff\(1)) # (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100000011001111110000001100110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(1),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[0]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(1),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(0),
	combout => \u_correlation_calculator|u_address_generator|LessThan1~3_combout\);

-- Location: FF_X46_Y2_N37
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~33_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\);

-- Location: FF_X46_Y2_N40
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~29_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\);

-- Location: MLABCELL_X47_Y2_N45
\u_correlation_calculator|u_address_generator|LessThan1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~5_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(3) & ( (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\ & 
-- (!\u_correlation_calculator|u_address_generator|counter_ff\(2) & \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\)) ) ) # ( !\u_correlation_calculator|u_address_generator|counter_ff\(3) & ( 
-- ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\ & !\u_correlation_calculator|u_address_generator|counter_ff\(2))) # (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011111111010100001111111100000000010100000000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[2]~DUPLICATE_q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[3]~DUPLICATE_q\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(3),
	combout => \u_correlation_calculator|u_address_generator|LessThan1~5_combout\);

-- Location: FF_X46_Y2_N47
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~17_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(5));

-- Location: LABCELL_X46_Y2_N3
\u_correlation_calculator|u_address_generator|LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~1_combout\ = ( \u_correlation_calculator|u_address_generator|counter_ff\(5) & ( !\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(5) ) ) # ( 
-- !\u_correlation_calculator|u_address_generator|counter_ff\(5) & ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(5),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5),
	combout => \u_correlation_calculator|u_address_generator|LessThan1~1_combout\);

-- Location: MLABCELL_X47_Y2_N54
\u_correlation_calculator|u_address_generator|LessThan1~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~6_combout\ = ( \u_correlation_calculator|u_address_generator|LessThan1~5_combout\ & ( !\u_correlation_calculator|u_address_generator|LessThan1~1_combout\ & ( 
-- (\u_correlation_calculator|u_address_generator|LessThan1~0_combout\ & !\u_correlation_calculator|u_address_generator|LessThan1~2_combout\) ) ) ) # ( !\u_correlation_calculator|u_address_generator|LessThan1~5_combout\ & ( 
-- !\u_correlation_calculator|u_address_generator|LessThan1~1_combout\ & ( (\u_correlation_calculator|u_address_generator|LessThan1~0_combout\ & (\u_correlation_calculator|u_address_generator|LessThan1~4_combout\ & 
-- (!\u_correlation_calculator|u_address_generator|LessThan1~2_combout\ & \u_correlation_calculator|u_address_generator|LessThan1~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000010100000101000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~0_combout\,
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~4_combout\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~2_combout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~3_combout\,
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~5_combout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~1_combout\,
	combout => \u_correlation_calculator|u_address_generator|LessThan1~6_combout\);

-- Location: FF_X46_Y2_N46
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~17_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\);

-- Location: MLABCELL_X47_Y2_N39
\u_correlation_calculator|u_address_generator|LessThan1~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~7_combout\ = ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) & ( (!\u_correlation_calculator|u_address_generator|counter_ff\(7)) # 
-- ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6) & !\u_correlation_calculator|u_address_generator|counter_ff\(6))) ) ) # ( !\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) & ( 
-- (!\u_correlation_calculator|u_address_generator|counter_ff\(7) & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6) & !\u_correlation_calculator|u_address_generator|counter_ff\(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000010101111101010101010111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(7),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(6),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(6),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(7),
	combout => \u_correlation_calculator|u_address_generator|LessThan1~7_combout\);

-- Location: MLABCELL_X47_Y2_N51
\u_correlation_calculator|u_address_generator|LessThan1~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|LessThan1~8_combout\ = ( \u_correlation_calculator|u_address_generator|LessThan1~0_combout\ & ( !\u_correlation_calculator|u_address_generator|LessThan1~7_combout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|counter_ff\(5) & (!\u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\ & ((!\u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\) # 
-- (\u_correlation_calculator|u_address_generator|counter_ff\(4))))) # (\u_correlation_calculator|u_address_generator|counter_ff\(5) & ((!\u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\) # 
-- ((!\u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\) # (\u_correlation_calculator|u_address_generator|counter_ff\(4))))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|LessThan1~0_combout\ & ( 
-- !\u_correlation_calculator|u_address_generator|LessThan1~7_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111110111110100010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5),
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[4]~DUPLICATE_q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[5]~DUPLICATE_q\,
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~0_combout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~7_combout\,
	combout => \u_correlation_calculator|u_address_generator|LessThan1~8_combout\);

-- Location: MLABCELL_X47_Y2_N30
\u_correlation_calculator|u_address_generator|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux3~0_combout\ = ( \u_correlation_calculator|u_address_generator|LessThan1~6_combout\ & ( \u_correlation_calculator|u_address_generator|LessThan1~8_combout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # ((!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8) & 
-- \u_correlation_calculator|u_address_generator|counter_ff\(8))))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|LessThan1~6_combout\ & ( \u_correlation_calculator|u_address_generator|LessThan1~8_combout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ & ((!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8)) # ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # 
-- (\u_correlation_calculator|u_address_generator|counter_ff\(8))))) ) ) ) # ( \u_correlation_calculator|u_address_generator|LessThan1~6_combout\ & ( !\u_correlation_calculator|u_address_generator|LessThan1~8_combout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # ((!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8) & 
-- \u_correlation_calculator|u_address_generator|counter_ff\(8))))) ) ) ) # ( !\u_correlation_calculator|u_address_generator|LessThan1~6_combout\ & ( !\u_correlation_calculator|u_address_generator|LessThan1~8_combout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # ((!\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8) & 
-- \u_correlation_calculator|u_address_generator|counter_ff\(8))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111000000000110011100000000011101111000000001100111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(8),
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(8),
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD1~q\,
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~6_combout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_LessThan1~8_combout\,
	combout => \u_correlation_calculator|u_address_generator|Mux3~0_combout\);

-- Location: FF_X46_Y2_N32
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~1_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(0));

-- Location: LABCELL_X45_Y2_N0
\u_correlation_calculator|u_address_generator|Add5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~1_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(0) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(0) ) + ( !VCC ))
-- \u_correlation_calculator|u_address_generator|Add5~2\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(0) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(0),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(0),
	cin => GND,
	sumout => \u_correlation_calculator|u_address_generator|Add5~1_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~2\);

-- Location: MLABCELL_X47_Y2_N0
\u_correlation_calculator|u_address_generator|Add3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~1_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|counter_ff\(0) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\ ) + ( !VCC ))
-- \u_correlation_calculator|u_address_generator|Add3~2\ = CARRY(( !\u_correlation_calculator|u_address_generator|counter_ff\(0) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[0]~DUPLICATE_q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(0),
	cin => GND,
	sumout => \u_correlation_calculator|u_address_generator|Add3~1_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~2\);

-- Location: LABCELL_X48_Y2_N18
\u_correlation_calculator|u_address_generator|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux8~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add3~1_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (((\u_correlation_calculator|u_address_generator|Add5~1_sumout\)) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\)))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add3~1_sumout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_address_generator|Add5~1_sumout\)) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff[0]~DUPLICATE_q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100001001100000010000100110000101010011011100010101001101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~1_sumout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[0]~DUPLICATE_q\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~1_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux8~0_combout\);

-- Location: MLABCELL_X47_Y2_N3
\u_correlation_calculator|u_address_generator|Add3~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~5_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|counter_ff\(1) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~2\ ))
-- \u_correlation_calculator|u_address_generator|Add3~6\ = CARRY(( !\u_correlation_calculator|u_address_generator|counter_ff\(1) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(1),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(1),
	cin => \u_correlation_calculator|u_address_generator|Add3~2\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~5_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~6\);

-- Location: LABCELL_X45_Y2_N3
\u_correlation_calculator|u_address_generator|Add5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~5_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(1) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~2\ ))
-- \u_correlation_calculator|u_address_generator|Add5~6\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(1) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(1),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(1),
	cin => \u_correlation_calculator|u_address_generator|Add5~2\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~5_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~6\);

-- Location: LABCELL_X48_Y2_N12
\u_correlation_calculator|u_address_generator|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux7~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add5~5_sumout\ & ( \u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1)) ) ) ) # ( !\u_correlation_calculator|u_address_generator|Add5~5_sumout\ & ( 
-- \u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(1)) ) ) ) # ( 
-- \u_correlation_calculator|u_address_generator|Add5~5_sumout\ & ( !\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # 
-- (\u_correlation_calculator|u_address_generator|Add3~5_sumout\) ) ) ) # ( !\u_correlation_calculator|u_address_generator|Add5~5_sumout\ & ( !\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ( 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & \u_correlation_calculator|u_address_generator|Add3~5_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101101011111010111100000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~5_sumout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(1),
	datae => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~5_sumout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	combout => \u_correlation_calculator|u_address_generator|Mux7~0_combout\);

-- Location: LABCELL_X45_Y2_N6
\u_correlation_calculator|u_address_generator|Add5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~9_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|counter_ff\(2) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~6\ ))
-- \u_correlation_calculator|u_address_generator|Add5~10\ = CARRY(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|counter_ff\(2) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[2]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_address_generator|Add5~6\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~9_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~10\);

-- Location: MLABCELL_X47_Y2_N6
\u_correlation_calculator|u_address_generator|Add3~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~9_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|counter_ff\(2) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~6\ ))
-- \u_correlation_calculator|u_address_generator|Add3~10\ = CARRY(( !\u_correlation_calculator|u_address_generator|counter_ff\(2) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[2]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(2),
	cin => \u_correlation_calculator|u_address_generator|Add3~6\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~9_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~10\);

-- Location: LABCELL_X48_Y2_N0
\u_correlation_calculator|u_address_generator|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux6~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add3~9_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (((\u_correlation_calculator|u_address_generator|Add5~9_sumout\)) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add3~9_sumout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ((\u_correlation_calculator|u_address_generator|Add5~9_sumout\))) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[2]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000001001000110000100110101011100010011010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[2]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~9_sumout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~9_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux6~0_combout\);

-- Location: LABCELL_X45_Y2_N9
\u_correlation_calculator|u_address_generator|Add5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~13_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~10\ ))
-- \u_correlation_calculator|u_address_generator|Add5~14\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff[3]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[3]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[3]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_address_generator|Add5~10\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~13_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~14\);

-- Location: MLABCELL_X47_Y2_N9
\u_correlation_calculator|u_address_generator|Add3~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~13_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\ ) + ( !\u_correlation_calculator|u_address_generator|counter_ff\(3) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~10\ ))
-- \u_correlation_calculator|u_address_generator|Add3~14\ = CARRY(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[3]~DUPLICATE_q\ ) + ( !\u_correlation_calculator|u_address_generator|counter_ff\(3) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[3]~DUPLICATE_q\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(3),
	cin => \u_correlation_calculator|u_address_generator|Add3~10\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~13_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~14\);

-- Location: LABCELL_X48_Y2_N6
\u_correlation_calculator|u_address_generator|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux5~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add3~13_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (((\u_correlation_calculator|u_address_generator|Add5~13_sumout\)) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(3)))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add3~13_sumout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ((\u_correlation_calculator|u_address_generator|Add5~13_sumout\))) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000001001000110000100110101011100010011010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(3),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~13_sumout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~13_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux5~0_combout\);

-- Location: MLABCELL_X47_Y2_N12
\u_correlation_calculator|u_address_generator|Add3~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~17_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\ ) + ( !\u_correlation_calculator|u_address_generator|counter_ff\(4) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~14\ ))
-- \u_correlation_calculator|u_address_generator|Add3~18\ = CARRY(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\ ) + ( !\u_correlation_calculator|u_address_generator|counter_ff\(4) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[4]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_address_generator|Add3~14\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~17_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~18\);

-- Location: FF_X46_Y2_N44
\u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_address_generator|Add1~21_sumout\,
	sclr => \u_correlation_calculator|u_address_generator|LessThan0~6_combout\,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD_ORIGIN~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(4));

-- Location: LABCELL_X45_Y2_N12
\u_correlation_calculator|u_address_generator|Add5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~17_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(4) ) + ( \u_correlation_calculator|u_address_generator|counter_ff\(4) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~14\ ))
-- \u_correlation_calculator|u_address_generator|Add5~18\ = CARRY(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(4) ) + ( \u_correlation_calculator|u_address_generator|counter_ff\(4) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(4),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(4),
	cin => \u_correlation_calculator|u_address_generator|Add5~14\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~17_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~18\);

-- Location: LABCELL_X48_Y2_N24
\u_correlation_calculator|u_address_generator|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux4~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add5~17_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # ((\u_correlation_calculator|u_address_generator|Add3~17_sumout\)))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add5~17_sumout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((\u_correlation_calculator|u_address_generator|Add3~17_sumout\)))) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[4]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110000001000010011010001100101011101000110010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[4]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~17_sumout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~17_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux4~0_combout\);

-- Location: LABCELL_X45_Y2_N15
\u_correlation_calculator|u_address_generator|Add5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~21_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff\(5) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~18\ ))
-- \u_correlation_calculator|u_address_generator|Add5~22\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff\(5) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[5]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5),
	cin => \u_correlation_calculator|u_address_generator|Add5~18\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~21_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~22\);

-- Location: MLABCELL_X47_Y2_N15
\u_correlation_calculator|u_address_generator|Add3~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~21_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|counter_ff\(5) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~18\ ))
-- \u_correlation_calculator|u_address_generator|Add3~22\ = CARRY(( !\u_correlation_calculator|u_address_generator|counter_ff\(5) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[5]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(5),
	cin => \u_correlation_calculator|u_address_generator|Add3~18\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~21_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~22\);

-- Location: LABCELL_X48_Y2_N27
\u_correlation_calculator|u_address_generator|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux3~1_combout\ = ( \u_correlation_calculator|u_address_generator|Add3~21_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (((\u_correlation_calculator|u_address_generator|Add5~21_sumout\)) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add3~21_sumout\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & ((\u_correlation_calculator|u_address_generator|Add5~21_sumout\))) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff[5]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000001001000110000100110101011100010011010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff[5]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~21_sumout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~21_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux3~1_combout\);

-- Location: MLABCELL_X47_Y2_N18
\u_correlation_calculator|u_address_generator|Add3~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~25_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6) ) + ( !\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~22\ ))
-- \u_correlation_calculator|u_address_generator|Add3~26\ = CARRY(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6) ) + ( !\u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[6]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(6),
	cin => \u_correlation_calculator|u_address_generator|Add3~22\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~25_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~26\);

-- Location: LABCELL_X45_Y2_N18
\u_correlation_calculator|u_address_generator|Add5~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~25_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~22\ ))
-- \u_correlation_calculator|u_address_generator|Add5~26\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff[6]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(6),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[6]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_address_generator|Add5~22\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~25_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~26\);

-- Location: LABCELL_X48_Y2_N21
\u_correlation_calculator|u_address_generator|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux2~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add5~25_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # ((\u_correlation_calculator|u_address_generator|Add3~25_sumout\)))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6))))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add5~25_sumout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|Add3~25_sumout\))) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(6))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001001000110000000100100011010001010110011101000101011001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~25_sumout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(6),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~25_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux2~0_combout\);

-- Location: MLABCELL_X47_Y2_N21
\u_correlation_calculator|u_address_generator|Add3~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~29_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|counter_ff\(7) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~26\ ))
-- \u_correlation_calculator|u_address_generator|Add3~30\ = CARRY(( !\u_correlation_calculator|u_address_generator|counter_ff\(7) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(7),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(7),
	cin => \u_correlation_calculator|u_address_generator|Add3~26\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~29_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add3~30\);

-- Location: LABCELL_X45_Y2_N21
\u_correlation_calculator|u_address_generator|Add5~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~29_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~26\ ))
-- \u_correlation_calculator|u_address_generator|Add5~30\ = CARRY(( \u_correlation_calculator|u_address_generator|counter_ff[7]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(7),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff[7]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_address_generator|Add5~26\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~29_sumout\,
	cout => \u_correlation_calculator|u_address_generator|Add5~30\);

-- Location: LABCELL_X48_Y2_N9
\u_correlation_calculator|u_address_generator|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux1~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add5~29_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # ((\u_correlation_calculator|u_address_generator|Add3~29_sumout\)))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7)))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add5~29_sumout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((\u_correlation_calculator|u_address_generator|Add3~29_sumout\)))) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110000001000010011010001100101011101000110010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(7),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~29_sumout\,
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~29_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux1~0_combout\);

-- Location: MLABCELL_X47_Y2_N24
\u_correlation_calculator|u_address_generator|Add3~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add3~33_sumout\ = SUM(( !\u_correlation_calculator|u_address_generator|counter_ff\(8) ) + ( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add3~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(8),
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(8),
	cin => \u_correlation_calculator|u_address_generator|Add3~30\,
	sumout => \u_correlation_calculator|u_address_generator|Add3~33_sumout\);

-- Location: LABCELL_X45_Y2_N24
\u_correlation_calculator|u_address_generator|Add5~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Add5~33_sumout\ = SUM(( \u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8) ) + ( \u_correlation_calculator|u_address_generator|counter_ff\(8) ) + ( 
-- \u_correlation_calculator|u_address_generator|Add5~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_counter_ff\(8),
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(8),
	cin => \u_correlation_calculator|u_address_generator|Add5~30\,
	sumout => \u_correlation_calculator|u_address_generator|Add5~33_sumout\);

-- Location: LABCELL_X48_Y2_N3
\u_correlation_calculator|u_address_generator|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_address_generator|Mux0~0_combout\ = ( \u_correlation_calculator|u_address_generator|Add5~33_sumout\ & ( (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\) # ((\u_correlation_calculator|u_address_generator|Add3~33_sumout\)))) # (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8))))) ) ) # ( !\u_correlation_calculator|u_address_generator|Add5~33_sumout\ & ( 
-- (!\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & (\u_correlation_calculator|u_address_generator|Add3~33_sumout\))) # 
-- (\u_correlation_calculator|u_address_generator|Mux3~0_combout\ & (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD2~q\ & ((\u_correlation_calculator|u_address_generator|current_corr_origin_ff\(8))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001001000110000000100100011010001010110011101000101011001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_address_generator|ALT_INV_Mux3~0_combout\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD2~q\,
	datac => \u_correlation_calculator|u_address_generator|ALT_INV_Add3~33_sumout\,
	datad => \u_correlation_calculator|u_address_generator|ALT_INV_current_corr_origin_ff\(8),
	dataf => \u_correlation_calculator|u_address_generator|ALT_INV_Add5~33_sumout\,
	combout => \u_correlation_calculator|u_address_generator|Mux0~0_combout\);

-- Location: FF_X50_Y3_N14
\u_decoder|dm_data_in[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[1]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(1));

-- Location: LABCELL_X51_Y3_N42
\u_decoder|dm_data_in[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|dm_data_in[2]~feeder_combout\ = ( \recv.data[2]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[2]~input_o\,
	combout => \u_decoder|dm_data_in[2]~feeder_combout\);

-- Location: FF_X51_Y3_N44
\u_decoder|dm_data_in[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|dm_data_in[2]~feeder_combout\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(2));

-- Location: FF_X51_Y3_N29
\u_decoder|dm_data_in[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[3]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(3));

-- Location: FF_X50_Y3_N8
\u_decoder|dm_data_in[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[4]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(4));

-- Location: LABCELL_X51_Y3_N57
\u_decoder|dm_data_in[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|dm_data_in[5]~feeder_combout\ = ( \recv.data[5]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[5]~input_o\,
	combout => \u_decoder|dm_data_in[5]~feeder_combout\);

-- Location: FF_X51_Y3_N59
\u_decoder|dm_data_in[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|dm_data_in[5]~feeder_combout\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(5));

-- Location: FF_X50_Y3_N53
\u_decoder|dm_data_in[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[6]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(6));

-- Location: FF_X50_Y3_N56
\u_decoder|dm_data_in[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[7]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(7));

-- Location: FF_X50_Y3_N50
\u_decoder|dm_data_in[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[8]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(8));

-- Location: IOIBUF_X68_Y0_N52
\recv.data[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(9),
	o => \recv.data[9]~input_o\);

-- Location: FF_X51_Y3_N53
\u_decoder|dm_data_in[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[9]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(9));

-- Location: IOIBUF_X58_Y0_N41
\recv.data[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(10),
	o => \recv.data[10]~input_o\);

-- Location: FF_X51_Y3_N50
\u_decoder|dm_data_in[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[10]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(10));

-- Location: IOIBUF_X60_Y0_N18
\recv.data[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(11),
	o => \recv.data[11]~input_o\);

-- Location: LABCELL_X50_Y3_N9
\u_decoder|dm_data_in[11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|dm_data_in[11]~feeder_combout\ = ( \recv.data[11]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[11]~input_o\,
	combout => \u_decoder|dm_data_in[11]~feeder_combout\);

-- Location: FF_X50_Y3_N11
\u_decoder|dm_data_in[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|dm_data_in[11]~feeder_combout\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(11));

-- Location: IOIBUF_X68_Y0_N35
\recv.data[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(12),
	o => \recv.data[12]~input_o\);

-- Location: FF_X51_Y3_N8
\u_decoder|dm_data_in[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[12]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(12));

-- Location: IOIBUF_X62_Y0_N18
\recv.data[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(13),
	o => \recv.data[13]~input_o\);

-- Location: LABCELL_X51_Y3_N9
\u_decoder|dm_data_in[13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|dm_data_in[13]~feeder_combout\ = ( \recv.data[13]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[13]~input_o\,
	combout => \u_decoder|dm_data_in[13]~feeder_combout\);

-- Location: FF_X51_Y3_N11
\u_decoder|dm_data_in[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|dm_data_in[13]~feeder_combout\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(13));

-- Location: IOIBUF_X56_Y0_N1
\recv.data[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(14),
	o => \recv.data[14]~input_o\);

-- Location: LABCELL_X50_Y3_N57
\u_decoder|dm_data_in[14]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|dm_data_in[14]~feeder_combout\ = ( \recv.data[14]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[14]~input_o\,
	combout => \u_decoder|dm_data_in[14]~feeder_combout\);

-- Location: FF_X50_Y3_N59
\u_decoder|dm_data_in[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|dm_data_in[14]~feeder_combout\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(14));

-- Location: IOIBUF_X62_Y0_N35
\recv.data[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(15),
	o => \recv.data[15]~input_o\);

-- Location: FF_X50_Y3_N26
\u_decoder|dm_data_in[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[15]~input_o\,
	sclr => \ALT_INV_recv.data[29]~input_o\,
	sload => VCC,
	ena => \u_decoder|dm_data_in[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|dm_data_in\(15));

-- Location: M10K_X49_Y2_N0
\u_memory|altsyncram_component|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "AverageFilteredData:u_memory|altsyncram:altsyncram_component|altsyncram_p5u3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 9,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 20,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 511,
	port_a_logical_ram_depth => 512,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 9,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock1",
	port_b_data_width => 20,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 511,
	port_b_logical_ram_depth => 512,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \u_decoder|calculate_pending_reg~q\,
	portbre => VCC,
	clk0 => \clock~inputCLKENA0_outclk\,
	clk1 => \clock~inputCLKENA0_outclk\,
	ena0 => \u_decoder|calculate_pending_reg~q\,
	portadatain => \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \u_memory|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LABCELL_X48_Y3_N27
\u_decoder|Mux92~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|Mux92~2_combout\ = ( \recv.data[16]~input_o\ & ( (\u_decoder|Mux92~0_combout\ & (\recv.data[24]~input_o\ & \u_decoder|Mux92~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000100010000000000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_Mux92~0_combout\,
	datab => \ALT_INV_recv.data[24]~input_o\,
	datad => \u_decoder|ALT_INV_Mux92~1_combout\,
	dataf => \ALT_INV_recv.data[16]~input_o\,
	combout => \u_decoder|Mux92~2_combout\);

-- Location: FF_X51_Y3_N14
\u_decoder|offset_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[0]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(0));

-- Location: FF_X50_Y2_N2
\u_correlation_calculator|u_operation|offset_h_ff[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(0),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(0));

-- Location: LABCELL_X50_Y2_N0
\u_correlation_calculator|u_operation|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~1_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(0) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(0) ) + ( !VCC ))
-- \u_correlation_calculator|u_operation|Add0~2\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(0) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(0),
	datac => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(0),
	cin => GND,
	sumout => \u_correlation_calculator|u_operation|Add0~1_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~2\);

-- Location: LABCELL_X53_Y2_N12
\u_correlation_calculator|u_operation|current_ave_data_ff[0]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[0]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|Add0~1_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_Add0~1_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[0]~SCLR_LUT_combout\);

-- Location: FF_X53_Y2_N17
\u_correlation_calculator|u_operation|current_ave_data_ff[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|current_ave_data_ff[0]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[0]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N15
\u_correlation_calculator|u_operation|multiplicand_temp_ff[0]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[0]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[0]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datad => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[0]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[0]~SCLR_LUT_combout\);

-- Location: FF_X50_Y3_N4
\u_decoder|offset_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[1]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(1));

-- Location: FF_X50_Y2_N5
\u_correlation_calculator|u_operation|offset_h_ff[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(1),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(1));

-- Location: LABCELL_X50_Y2_N3
\u_correlation_calculator|u_operation|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~5_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(1) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(1) ) + ( \u_correlation_calculator|u_operation|Add0~2\ ))
-- \u_correlation_calculator|u_operation|Add0~6\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(1) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(1) ) + ( \u_correlation_calculator|u_operation|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(1),
	datad => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(1),
	cin => \u_correlation_calculator|u_operation|Add0~2\,
	sumout => \u_correlation_calculator|u_operation|Add0~5_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~6\);

-- Location: LABCELL_X51_Y2_N3
\u_correlation_calculator|u_operation|current_ave_data_ff[1]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[1]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~5_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~5_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[1]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N50
\u_correlation_calculator|u_operation|current_ave_data_ff[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|current_ave_data_ff[1]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[1]~_Duplicate_1_q\);

-- Location: LABCELL_X51_Y2_N48
\u_correlation_calculator|u_operation|multiplicand_temp_ff[1]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[1]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[1]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datad => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[1]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[1]~SCLR_LUT_combout\);

-- Location: LABCELL_X51_Y3_N15
\u_decoder|offset_reg[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|offset_reg[2]~feeder_combout\ = ( \recv.data[2]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[2]~input_o\,
	combout => \u_decoder|offset_reg[2]~feeder_combout\);

-- Location: FF_X51_Y3_N16
\u_decoder|offset_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|offset_reg[2]~feeder_combout\,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(2));

-- Location: FF_X50_Y2_N7
\u_correlation_calculator|u_operation|offset_h_ff[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(2),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(2));

-- Location: LABCELL_X50_Y2_N6
\u_correlation_calculator|u_operation|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~9_sumout\ = SUM(( \u_memory|altsyncram_component|auto_generated|q_b\(2) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(2) ) + ( \u_correlation_calculator|u_operation|Add0~6\ ))
-- \u_correlation_calculator|u_operation|Add0~10\ = CARRY(( \u_memory|altsyncram_component|auto_generated|q_b\(2) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(2) ) + ( \u_correlation_calculator|u_operation|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(2),
	datad => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(2),
	cin => \u_correlation_calculator|u_operation|Add0~6\,
	sumout => \u_correlation_calculator|u_operation|Add0~9_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~10\);

-- Location: LABCELL_X53_Y2_N33
\u_correlation_calculator|u_operation|current_ave_data_ff[2]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[2]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~9_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~9_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[2]~SCLR_LUT_combout\);

-- Location: FF_X53_Y2_N35
\u_correlation_calculator|u_operation|current_ave_data_ff[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[2]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[2]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N36
\u_correlation_calculator|u_operation|multiplicand_temp_ff[2]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[2]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_operation|current_ave_data_ff[2]~_Duplicate_1_q\ & \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[2]~_Duplicate_1_q\,
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[2]~SCLR_LUT_combout\);

-- Location: FF_X51_Y3_N31
\u_decoder|offset_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[3]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(3));

-- Location: FF_X50_Y2_N11
\u_correlation_calculator|u_operation|offset_h_ff[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(3),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(3));

-- Location: LABCELL_X50_Y2_N9
\u_correlation_calculator|u_operation|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~13_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(3) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(3) ) + ( \u_correlation_calculator|u_operation|Add0~10\ ))
-- \u_correlation_calculator|u_operation|Add0~14\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(3) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(3) ) + ( \u_correlation_calculator|u_operation|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(3),
	datac => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(3),
	cin => \u_correlation_calculator|u_operation|Add0~10\,
	sumout => \u_correlation_calculator|u_operation|Add0~13_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~14\);

-- Location: LABCELL_X51_Y2_N18
\u_correlation_calculator|u_operation|current_ave_data_ff[3]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[3]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~13_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~13_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[3]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N19
\u_correlation_calculator|u_operation|current_ave_data_ff[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[3]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[3]~_Duplicate_1_q\);

-- Location: MLABCELL_X52_Y2_N3
\u_correlation_calculator|u_operation|multiplicand_temp_ff[3]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[3]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( \u_correlation_calculator|u_operation|current_ave_data_ff[3]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[3]~_Duplicate_1_q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[3]~SCLR_LUT_combout\);

-- Location: LABCELL_X50_Y3_N18
\u_decoder|offset_reg[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|offset_reg[4]~feeder_combout\ = \recv.data[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_recv.data[4]~input_o\,
	combout => \u_decoder|offset_reg[4]~feeder_combout\);

-- Location: FF_X50_Y3_N20
\u_decoder|offset_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|offset_reg[4]~feeder_combout\,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(4));

-- Location: FF_X50_Y2_N14
\u_correlation_calculator|u_operation|offset_h_ff[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(4),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(4));

-- Location: LABCELL_X50_Y2_N12
\u_correlation_calculator|u_operation|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~17_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(4) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(4) ) + ( \u_correlation_calculator|u_operation|Add0~14\ ))
-- \u_correlation_calculator|u_operation|Add0~18\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(4) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(4) ) + ( \u_correlation_calculator|u_operation|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(4),
	datac => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(4),
	cin => \u_correlation_calculator|u_operation|Add0~14\,
	sumout => \u_correlation_calculator|u_operation|Add0~17_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~18\);

-- Location: LABCELL_X51_Y2_N15
\u_correlation_calculator|u_operation|current_ave_data_ff[4]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[4]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( \u_correlation_calculator|u_operation|Add0~17_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_operation|ALT_INV_Add0~17_sumout\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[4]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N16
\u_correlation_calculator|u_operation|current_ave_data_ff[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[4]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[4]~_Duplicate_1_q\);

-- Location: MLABCELL_X52_Y2_N33
\u_correlation_calculator|u_operation|multiplicand_temp_ff[4]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[4]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( \u_correlation_calculator|u_operation|current_ave_data_ff[4]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[4]~_Duplicate_1_q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[4]~SCLR_LUT_combout\);

-- Location: LABCELL_X51_Y3_N0
\u_decoder|offset_reg[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|offset_reg[5]~feeder_combout\ = ( \recv.data[5]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[5]~input_o\,
	combout => \u_decoder|offset_reg[5]~feeder_combout\);

-- Location: FF_X51_Y3_N1
\u_decoder|offset_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|offset_reg[5]~feeder_combout\,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(5));

-- Location: FF_X50_Y2_N17
\u_correlation_calculator|u_operation|offset_h_ff[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(5),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(5));

-- Location: LABCELL_X50_Y2_N15
\u_correlation_calculator|u_operation|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~21_sumout\ = SUM(( \u_memory|altsyncram_component|auto_generated|q_b\(5) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(5) ) + ( \u_correlation_calculator|u_operation|Add0~18\ ))
-- \u_correlation_calculator|u_operation|Add0~22\ = CARRY(( \u_memory|altsyncram_component|auto_generated|q_b\(5) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(5) ) + ( \u_correlation_calculator|u_operation|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(5),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(5),
	cin => \u_correlation_calculator|u_operation|Add0~18\,
	sumout => \u_correlation_calculator|u_operation|Add0~21_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~22\);

-- Location: LABCELL_X51_Y2_N54
\u_correlation_calculator|u_operation|current_ave_data_ff[5]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[5]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~21_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~21_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[5]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N56
\u_correlation_calculator|u_operation|current_ave_data_ff[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[5]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[5]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N9
\u_correlation_calculator|u_operation|multiplicand_temp_ff[5]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[5]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|current_ave_data_ff[5]~_Duplicate_1_q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[5]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[5]~SCLR_LUT_combout\);

-- Location: LABCELL_X50_Y3_N3
\u_decoder|offset_reg[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|offset_reg[6]~feeder_combout\ = \recv.data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_recv.data[6]~input_o\,
	combout => \u_decoder|offset_reg[6]~feeder_combout\);

-- Location: FF_X50_Y3_N5
\u_decoder|offset_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|offset_reg[6]~feeder_combout\,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(6));

-- Location: FF_X50_Y2_N20
\u_correlation_calculator|u_operation|offset_h_ff[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(6),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(6));

-- Location: LABCELL_X50_Y2_N18
\u_correlation_calculator|u_operation|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~25_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(6) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(6) ) + ( \u_correlation_calculator|u_operation|Add0~22\ ))
-- \u_correlation_calculator|u_operation|Add0~26\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(6) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(6) ) + ( \u_correlation_calculator|u_operation|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(6),
	datac => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(6),
	cin => \u_correlation_calculator|u_operation|Add0~22\,
	sumout => \u_correlation_calculator|u_operation|Add0~25_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~26\);

-- Location: LABCELL_X51_Y2_N24
\u_correlation_calculator|u_operation|current_ave_data_ff[6]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[6]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~25_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~25_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[6]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N25
\u_correlation_calculator|u_operation|current_ave_data_ff[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[6]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[6]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N3
\u_correlation_calculator|u_operation|multiplicand_temp_ff[6]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[6]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_operation|current_ave_data_ff[6]~_Duplicate_1_q\ & \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[6]~_Duplicate_1_q\,
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[6]~SCLR_LUT_combout\);

-- Location: FF_X50_Y3_N22
\u_decoder|offset_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[7]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(7));

-- Location: FF_X50_Y2_N23
\u_correlation_calculator|u_operation|offset_h_ff[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(7),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(7));

-- Location: LABCELL_X50_Y2_N21
\u_correlation_calculator|u_operation|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~29_sumout\ = SUM(( \u_memory|altsyncram_component|auto_generated|q_b\(7) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(7) ) + ( \u_correlation_calculator|u_operation|Add0~26\ ))
-- \u_correlation_calculator|u_operation|Add0~30\ = CARRY(( \u_memory|altsyncram_component|auto_generated|q_b\(7) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(7) ) + ( \u_correlation_calculator|u_operation|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(7),
	datad => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(7),
	cin => \u_correlation_calculator|u_operation|Add0~26\,
	sumout => \u_correlation_calculator|u_operation|Add0~29_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~30\);

-- Location: LABCELL_X51_Y2_N27
\u_correlation_calculator|u_operation|current_ave_data_ff[7]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[7]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~29_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~29_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N29
\u_correlation_calculator|u_operation|current_ave_data_ff[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~_Duplicate_1_q\);

-- Location: LABCELL_X51_Y2_N39
\u_correlation_calculator|u_operation|multiplicand_temp_ff[7]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[7]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[7]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datad => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[7]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[7]~SCLR_LUT_combout\);

-- Location: FF_X50_Y3_N19
\u_decoder|offset_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[8]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(8));

-- Location: FF_X50_Y2_N26
\u_correlation_calculator|u_operation|offset_h_ff[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(8),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(8));

-- Location: LABCELL_X50_Y2_N24
\u_correlation_calculator|u_operation|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~33_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(8) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(8) ) + ( \u_correlation_calculator|u_operation|Add0~30\ ))
-- \u_correlation_calculator|u_operation|Add0~34\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(8) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(8) ) + ( \u_correlation_calculator|u_operation|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(8),
	datac => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(8),
	cin => \u_correlation_calculator|u_operation|Add0~30\,
	sumout => \u_correlation_calculator|u_operation|Add0~33_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~34\);

-- Location: LABCELL_X51_Y2_N45
\u_correlation_calculator|u_operation|current_ave_data_ff[8]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[8]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~33_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~33_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[8]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N46
\u_correlation_calculator|u_operation|current_ave_data_ff[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[8]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[8]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N48
\u_correlation_calculator|u_operation|multiplicand_temp_ff[8]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[8]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( \u_correlation_calculator|u_operation|current_ave_data_ff[8]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[8]~_Duplicate_1_q\,
	datae => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[8]~SCLR_LUT_combout\);

-- Location: FF_X51_Y3_N4
\u_decoder|offset_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[9]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(9));

-- Location: FF_X50_Y2_N29
\u_correlation_calculator|u_operation|offset_h_ff[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(9),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(9));

-- Location: LABCELL_X50_Y2_N27
\u_correlation_calculator|u_operation|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~37_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(9) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(9) ) + ( \u_correlation_calculator|u_operation|Add0~34\ ))
-- \u_correlation_calculator|u_operation|Add0~38\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(9) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(9) ) + ( \u_correlation_calculator|u_operation|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(9),
	datad => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(9),
	cin => \u_correlation_calculator|u_operation|Add0~34\,
	sumout => \u_correlation_calculator|u_operation|Add0~37_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~38\);

-- Location: LABCELL_X51_Y2_N57
\u_correlation_calculator|u_operation|current_ave_data_ff[9]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[9]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( \u_correlation_calculator|u_operation|Add0~37_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_operation|ALT_INV_Add0~37_sumout\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[9]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N59
\u_correlation_calculator|u_operation|current_ave_data_ff[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[9]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[9]~_Duplicate_1_q\);

-- Location: LABCELL_X51_Y2_N9
\u_correlation_calculator|u_operation|multiplicand_temp_ff[9]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[9]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[9]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[9]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[9]~SCLR_LUT_combout\);

-- Location: FF_X51_Y3_N35
\u_decoder|offset_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[10]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(10));

-- Location: FF_X50_Y2_N32
\u_correlation_calculator|u_operation|offset_h_ff[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(10),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(10));

-- Location: LABCELL_X50_Y2_N30
\u_correlation_calculator|u_operation|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~41_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(10) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(10) ) + ( \u_correlation_calculator|u_operation|Add0~38\ ))
-- \u_correlation_calculator|u_operation|Add0~42\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(10) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(10) ) + ( \u_correlation_calculator|u_operation|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(10),
	datac => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(10),
	cin => \u_correlation_calculator|u_operation|Add0~38\,
	sumout => \u_correlation_calculator|u_operation|Add0~41_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~42\);

-- Location: LABCELL_X51_Y2_N51
\u_correlation_calculator|u_operation|current_ave_data_ff[10]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[10]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~41_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~41_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[10]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N53
\u_correlation_calculator|u_operation|current_ave_data_ff[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[10]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[10]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N24
\u_correlation_calculator|u_operation|multiplicand_temp_ff[10]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[10]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[10]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[10]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[10]~SCLR_LUT_combout\);

-- Location: LABCELL_X50_Y3_N0
\u_decoder|offset_reg[11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|offset_reg[11]~feeder_combout\ = ( \recv.data[11]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[11]~input_o\,
	combout => \u_decoder|offset_reg[11]~feeder_combout\);

-- Location: FF_X50_Y3_N1
\u_decoder|offset_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|offset_reg[11]~feeder_combout\,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(11));

-- Location: FF_X50_Y2_N35
\u_correlation_calculator|u_operation|offset_h_ff[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(11),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(11));

-- Location: LABCELL_X50_Y2_N33
\u_correlation_calculator|u_operation|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~45_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(11) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(11) ) + ( \u_correlation_calculator|u_operation|Add0~42\ ))
-- \u_correlation_calculator|u_operation|Add0~46\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(11) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(11) ) + ( \u_correlation_calculator|u_operation|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(11),
	datac => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(11),
	cin => \u_correlation_calculator|u_operation|Add0~42\,
	sumout => \u_correlation_calculator|u_operation|Add0~45_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~46\);

-- Location: LABCELL_X51_Y2_N0
\u_correlation_calculator|u_operation|current_ave_data_ff[11]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[11]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|Add0~45_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datad => \u_correlation_calculator|u_operation|ALT_INV_Add0~45_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[11]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N2
\u_correlation_calculator|u_operation|current_ave_data_ff[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[11]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[11]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N30
\u_correlation_calculator|u_operation|multiplicand_temp_ff[11]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[11]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[11]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[11]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[11]~SCLR_LUT_combout\);

-- Location: FF_X51_Y3_N19
\u_decoder|offset_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[12]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(12));

-- Location: FF_X50_Y2_N38
\u_correlation_calculator|u_operation|offset_h_ff[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(12),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(12));

-- Location: LABCELL_X50_Y2_N36
\u_correlation_calculator|u_operation|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~49_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(12) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(12) ) + ( \u_correlation_calculator|u_operation|Add0~46\ ))
-- \u_correlation_calculator|u_operation|Add0~50\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(12) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(12) ) + ( \u_correlation_calculator|u_operation|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(12),
	datac => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(12),
	cin => \u_correlation_calculator|u_operation|Add0~46\,
	sumout => \u_correlation_calculator|u_operation|Add0~49_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~50\);

-- Location: LABCELL_X51_Y2_N21
\u_correlation_calculator|u_operation|current_ave_data_ff[12]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[12]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~49_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~49_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[12]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N23
\u_correlation_calculator|u_operation|current_ave_data_ff[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[12]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[12]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N27
\u_correlation_calculator|u_operation|multiplicand_temp_ff[12]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[12]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[12]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[12]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[12]~SCLR_LUT_combout\);

-- Location: LABCELL_X51_Y3_N21
\u_decoder|offset_reg[13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|offset_reg[13]~feeder_combout\ = ( \recv.data[13]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[13]~input_o\,
	combout => \u_decoder|offset_reg[13]~feeder_combout\);

-- Location: FF_X51_Y3_N23
\u_decoder|offset_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|offset_reg[13]~feeder_combout\,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(13));

-- Location: FF_X50_Y2_N41
\u_correlation_calculator|u_operation|offset_h_ff[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(13),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(13));

-- Location: LABCELL_X50_Y2_N39
\u_correlation_calculator|u_operation|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~53_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(13) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(13) ) + ( \u_correlation_calculator|u_operation|Add0~50\ ))
-- \u_correlation_calculator|u_operation|Add0~54\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(13) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(13) ) + ( \u_correlation_calculator|u_operation|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(13),
	datac => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(13),
	cin => \u_correlation_calculator|u_operation|Add0~50\,
	sumout => \u_correlation_calculator|u_operation|Add0~53_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~54\);

-- Location: LABCELL_X51_Y2_N33
\u_correlation_calculator|u_operation|current_ave_data_ff[13]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[13]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~53_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~53_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[13]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N34
\u_correlation_calculator|u_operation|current_ave_data_ff[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[13]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[13]~_Duplicate_1_q\);

-- Location: MLABCELL_X52_Y2_N15
\u_correlation_calculator|u_operation|multiplicand_temp_ff[13]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[13]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & ( \u_correlation_calculator|u_operation|current_ave_data_ff[13]~_Duplicate_1_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[13]~_Duplicate_1_q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[13]~SCLR_LUT_combout\);

-- Location: LABCELL_X50_Y3_N21
\u_decoder|offset_reg[14]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|offset_reg[14]~feeder_combout\ = ( \recv.data[14]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[14]~input_o\,
	combout => \u_decoder|offset_reg[14]~feeder_combout\);

-- Location: FF_X50_Y3_N23
\u_decoder|offset_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|offset_reg[14]~feeder_combout\,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(14));

-- Location: FF_X50_Y2_N44
\u_correlation_calculator|u_operation|offset_h_ff[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(14),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(14));

-- Location: LABCELL_X50_Y2_N42
\u_correlation_calculator|u_operation|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~57_sumout\ = SUM(( \u_memory|altsyncram_component|auto_generated|q_b\(14) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(14) ) + ( \u_correlation_calculator|u_operation|Add0~54\ ))
-- \u_correlation_calculator|u_operation|Add0~58\ = CARRY(( \u_memory|altsyncram_component|auto_generated|q_b\(14) ) + ( \u_correlation_calculator|u_operation|offset_h_ff\(14) ) + ( \u_correlation_calculator|u_operation|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(14),
	datad => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(14),
	cin => \u_correlation_calculator|u_operation|Add0~54\,
	sumout => \u_correlation_calculator|u_operation|Add0~57_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~58\);

-- Location: LABCELL_X51_Y2_N36
\u_correlation_calculator|u_operation|current_ave_data_ff[14]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[14]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~57_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~57_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[14]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N37
\u_correlation_calculator|u_operation|current_ave_data_ff[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[14]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[14]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N18
\u_correlation_calculator|u_operation|multiplicand_temp_ff[14]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[14]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|current_ave_data_ff[14]~_Duplicate_1_q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datae => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[14]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[14]~SCLR_LUT_combout\);

-- Location: FF_X50_Y3_N44
\u_decoder|offset_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \recv.data[15]~input_o\,
	sload => VCC,
	ena => \u_decoder|Mux92~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|offset_reg\(15));

-- Location: FF_X50_Y2_N47
\u_correlation_calculator|u_operation|offset_h_ff[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_decoder|offset_reg\(15),
	sload => VCC,
	ena => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|offset_h_ff\(15));

-- Location: LABCELL_X50_Y2_N45
\u_correlation_calculator|u_operation|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~61_sumout\ = SUM(( \u_correlation_calculator|u_operation|offset_h_ff\(15) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(15) ) + ( \u_correlation_calculator|u_operation|Add0~58\ ))
-- \u_correlation_calculator|u_operation|Add0~62\ = CARRY(( \u_correlation_calculator|u_operation|offset_h_ff\(15) ) + ( \u_memory|altsyncram_component|auto_generated|q_b\(15) ) + ( \u_correlation_calculator|u_operation|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_memory|altsyncram_component|auto_generated|ALT_INV_q_b\(15),
	datac => \u_correlation_calculator|u_operation|ALT_INV_offset_h_ff\(15),
	cin => \u_correlation_calculator|u_operation|Add0~58\,
	sumout => \u_correlation_calculator|u_operation|Add0~61_sumout\,
	cout => \u_correlation_calculator|u_operation|Add0~62\);

-- Location: LABCELL_X51_Y2_N6
\u_correlation_calculator|u_operation|current_ave_data_ff[15]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[15]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|Add0~61_sumout\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Add0~61_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[15]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N8
\u_correlation_calculator|u_operation|current_ave_data_ff[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[15]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[15]~_Duplicate_1_q\);

-- Location: MLABCELL_X52_Y2_N18
\u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~SCLR_LUT_combout\ = ( \u_correlation_calculator|u_operation|current_ave_data_ff[15]~_Duplicate_1_q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[15]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[15]~SCLR_LUT_combout\);

-- Location: LABCELL_X50_Y2_N48
\u_correlation_calculator|u_operation|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add0~65_sumout\ = SUM(( GND ) + ( GND ) + ( \u_correlation_calculator|u_operation|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \u_correlation_calculator|u_operation|Add0~62\,
	sumout => \u_correlation_calculator|u_operation|Add0~65_sumout\);

-- Location: LABCELL_X51_Y2_N12
\u_correlation_calculator|u_operation|current_ave_data_ff[16]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|current_ave_data_ff[16]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|Add0~65_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datad => \u_correlation_calculator|u_operation|ALT_INV_Add0~65_sumout\,
	combout => \u_correlation_calculator|u_operation|current_ave_data_ff[16]~SCLR_LUT_combout\);

-- Location: FF_X51_Y2_N14
\u_correlation_calculator|u_operation|current_ave_data_ff[16]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|current_ave_data_ff[16]~SCLR_LUT_combout\,
	ena => \u_correlation_calculator|u_operation|current_ave_data_ff[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|current_ave_data_ff[16]~_Duplicate_1_q\);

-- Location: LABCELL_X53_Y2_N54
\u_correlation_calculator|u_operation|multiplicand_temp_ff[16]~SCLR_LUT\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|multiplicand_temp_ff[16]~SCLR_LUT_combout\ = (\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ & \u_correlation_calculator|u_operation|current_ave_data_ff[16]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_current_ave_data_ff[16]~_Duplicate_1_q\,
	combout => \u_correlation_calculator|u_operation|multiplicand_temp_ff[16]~SCLR_LUT_combout\);

-- Location: DSP_X54_Y2_N0
\u_correlation_calculator|u_operation|Mult0~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 17,
	ay_scan_in_clock => "1",
	ay_scan_in_width => 17,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \u_correlation_calculator|u_operation|Mult0~8_ACLR_bus\,
	clk => \u_correlation_calculator|u_operation|Mult0~8_CLK_bus\,
	ena => \u_correlation_calculator|u_operation|Mult0~8_ENA_bus\,
	ax => \u_correlation_calculator|u_operation|Mult0~8_AX_bus\,
	ay => \u_correlation_calculator|u_operation|Mult0~8_AY_bus\,
	resulta => \u_correlation_calculator|u_operation|Mult0~8_RESULTA_bus\);

-- Location: LABCELL_X55_Y2_N3
\u_correlation_calculator|u_operation|cor_pair_product_ff[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[0]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~8_resulta\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~8_resulta\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[0]~feeder_combout\);

-- Location: LABCELL_X53_Y2_N57
\u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ & ( 
-- !\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD1~q\,
	combout => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\);

-- Location: LABCELL_X48_Y3_N48
\u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_LOAD1~q\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_INIT~q\) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_MULTIPLY~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011111111101010101111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_INIT~q\,
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_MULTIPLY~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_LOAD1~q\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\);

-- Location: FF_X55_Y2_N4
\u_correlation_calculator|u_operation|cor_pair_product_ff[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[0]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(0));

-- Location: LABCELL_X48_Y3_N57
\u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ ) ) # ( 
-- !\u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_ACCUMULATE~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_ACCUMULATE~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CAPTURE_NEW_ADDR~q\,
	combout => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\);

-- Location: FF_X56_Y2_N2
\u_correlation_calculator|u_operation|correlation_temp_ff_i[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~1_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(0));

-- Location: LABCELL_X56_Y2_N0
\u_correlation_calculator|u_operation|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~1_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(0) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(0) ) + ( !VCC ))
-- \u_correlation_calculator|u_operation|Add1~2\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(0) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(0),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(0),
	cin => GND,
	sumout => \u_correlation_calculator|u_operation|Add1~1_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~2\);

-- Location: FF_X56_Y2_N1
\u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~1_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE_q\);

-- Location: LABCELL_X50_Y1_N36
\u_decoder|reset_done_status_reg~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|reset_done_status_reg~0_combout\ = ( \u_encoder|status_transmit_done~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\ ) ) # ( !\u_encoder|status_transmit_done~q\ & ( 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|reset_done~q\) # (\u_decoder|reset_done_status_reg~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011111111111100001111111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_reset_done~q\,
	datad => \u_decoder|ALT_INV_reset_done_status_reg~q\,
	dataf => \u_encoder|ALT_INV_status_transmit_done~q\,
	combout => \u_decoder|reset_done_status_reg~0_combout\);

-- Location: FF_X50_Y1_N37
\u_decoder|reset_done_status_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|reset_done_status_reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|reset_done_status_reg~q\);

-- Location: LABCELL_X51_Y1_N0
\u_encoder|send~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~1_combout\ = ( \u_decoder|dm_data_in\(0) & ( \u_decoder|reset_done_status_reg~q\ & ( (!\u_encoder|send~0_combout\) # ((\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- (\u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE_q\ & !\u_decoder|status_pending_reg~q\))) ) ) ) # ( !\u_decoder|dm_data_in\(0) & ( \u_decoder|reset_done_status_reg~q\ & ( (!\u_decoder|status_pending_reg~q\ & 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((!\u_encoder|send~0_combout\) # (\u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE_q\)))) # (\u_decoder|status_pending_reg~q\ & 
-- (((!\u_encoder|send~0_combout\)))) ) ) ) # ( \u_decoder|dm_data_in\(0) & ( !\u_decoder|reset_done_status_reg~q\ & ( (!\u_decoder|status_pending_reg~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- (!\u_encoder|send~0_combout\)) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((\u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE_q\))))) ) ) ) # ( !\u_decoder|dm_data_in\(0) & ( 
-- !\u_decoder|reset_done_status_reg~q\ & ( (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_correlation_calculator|u_operation|correlation_temp_ff_i[0]~DUPLICATE_q\ & !\u_decoder|status_pending_reg~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000100011010000000001000101110011001100110111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datab => \u_encoder|ALT_INV_send~0_combout\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[0]~DUPLICATE_q\,
	datad => \u_decoder|ALT_INV_status_pending_reg~q\,
	datae => \u_decoder|ALT_INV_dm_data_in\(0),
	dataf => \u_decoder|ALT_INV_reset_done_status_reg~q\,
	combout => \u_encoder|send~1_combout\);

-- Location: FF_X55_Y2_N10
\u_correlation_calculator|u_operation|cor_pair_product_ff[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~28\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(20));

-- Location: LABCELL_X55_Y2_N30
\u_correlation_calculator|u_operation|cor_pair_product_ff[19]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[19]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~27\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~27\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[19]~feeder_combout\);

-- Location: FF_X55_Y2_N31
\u_correlation_calculator|u_operation|cor_pair_product_ff[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[19]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(19));

-- Location: LABCELL_X55_Y2_N21
\u_correlation_calculator|u_operation|cor_pair_product_ff[18]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[18]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~26\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~26\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[18]~feeder_combout\);

-- Location: FF_X55_Y2_N22
\u_correlation_calculator|u_operation|cor_pair_product_ff[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[18]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(18));

-- Location: LABCELL_X55_Y2_N39
\u_correlation_calculator|u_operation|cor_pair_product_ff[17]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[17]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~25\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~25\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[17]~feeder_combout\);

-- Location: FF_X55_Y2_N40
\u_correlation_calculator|u_operation|cor_pair_product_ff[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[17]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(17));

-- Location: LABCELL_X53_Y2_N42
\u_correlation_calculator|u_operation|cor_pair_product_ff[16]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[16]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~24\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~24\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[16]~feeder_combout\);

-- Location: FF_X53_Y2_N44
\u_correlation_calculator|u_operation|cor_pair_product_ff[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[16]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(16));

-- Location: LABCELL_X55_Y2_N15
\u_correlation_calculator|u_operation|cor_pair_product_ff[15]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[15]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~23\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~23\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[15]~feeder_combout\);

-- Location: FF_X55_Y2_N16
\u_correlation_calculator|u_operation|cor_pair_product_ff[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[15]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(15));

-- Location: FF_X53_Y2_N37
\u_correlation_calculator|u_operation|cor_pair_product_ff[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~22\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(14));

-- Location: LABCELL_X55_Y2_N0
\u_correlation_calculator|u_operation|cor_pair_product_ff[13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[13]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~21\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~21\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[13]~feeder_combout\);

-- Location: FF_X55_Y2_N1
\u_correlation_calculator|u_operation|cor_pair_product_ff[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[13]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(13));

-- Location: LABCELL_X55_Y2_N45
\u_correlation_calculator|u_operation|cor_pair_product_ff[12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[12]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~20\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~20\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[12]~feeder_combout\);

-- Location: FF_X55_Y2_N46
\u_correlation_calculator|u_operation|cor_pair_product_ff[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[12]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(12));

-- Location: LABCELL_X55_Y2_N48
\u_correlation_calculator|u_operation|cor_pair_product_ff[11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[11]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~19\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~19\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[11]~feeder_combout\);

-- Location: FF_X55_Y2_N49
\u_correlation_calculator|u_operation|cor_pair_product_ff[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[11]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(11));

-- Location: LABCELL_X55_Y2_N57
\u_correlation_calculator|u_operation|cor_pair_product_ff[10]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[10]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~18\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~18\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[10]~feeder_combout\);

-- Location: FF_X55_Y2_N58
\u_correlation_calculator|u_operation|cor_pair_product_ff[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[10]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(10));

-- Location: FF_X55_Y2_N55
\u_correlation_calculator|u_operation|cor_pair_product_ff[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~17\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(9));

-- Location: LABCELL_X55_Y2_N51
\u_correlation_calculator|u_operation|cor_pair_product_ff[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[8]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~16\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~16\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[8]~feeder_combout\);

-- Location: FF_X55_Y2_N52
\u_correlation_calculator|u_operation|cor_pair_product_ff[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[8]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(8));

-- Location: LABCELL_X55_Y2_N6
\u_correlation_calculator|u_operation|cor_pair_product_ff[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[7]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~15\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~15\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[7]~feeder_combout\);

-- Location: FF_X55_Y2_N7
\u_correlation_calculator|u_operation|cor_pair_product_ff[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[7]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(7));

-- Location: LABCELL_X55_Y2_N12
\u_correlation_calculator|u_operation|cor_pair_product_ff[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[6]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~14\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~14\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[6]~feeder_combout\);

-- Location: FF_X55_Y2_N13
\u_correlation_calculator|u_operation|cor_pair_product_ff[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[6]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(6));

-- Location: LABCELL_X55_Y2_N42
\u_correlation_calculator|u_operation|cor_pair_product_ff[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[5]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~13\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~13\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[5]~feeder_combout\);

-- Location: FF_X55_Y2_N43
\u_correlation_calculator|u_operation|cor_pair_product_ff[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[5]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(5));

-- Location: LABCELL_X55_Y2_N36
\u_correlation_calculator|u_operation|cor_pair_product_ff[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[4]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~12\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~12\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[4]~feeder_combout\);

-- Location: FF_X55_Y2_N37
\u_correlation_calculator|u_operation|cor_pair_product_ff[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[4]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(4));

-- Location: LABCELL_X55_Y2_N33
\u_correlation_calculator|u_operation|cor_pair_product_ff[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[3]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~11\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~11\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[3]~feeder_combout\);

-- Location: FF_X55_Y2_N34
\u_correlation_calculator|u_operation|cor_pair_product_ff[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[3]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(3));

-- Location: LABCELL_X55_Y2_N27
\u_correlation_calculator|u_operation|cor_pair_product_ff[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[2]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~10\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~10\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[2]~feeder_combout\);

-- Location: FF_X55_Y2_N28
\u_correlation_calculator|u_operation|cor_pair_product_ff[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[2]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(2));

-- Location: LABCELL_X55_Y2_N18
\u_correlation_calculator|u_operation|cor_pair_product_ff[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~feeder_combout\ = ( \u_correlation_calculator|u_operation|Mult0~9\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_Mult0~9\,
	combout => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~feeder_combout\);

-- Location: FF_X55_Y2_N19
\u_correlation_calculator|u_operation|cor_pair_product_ff[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~feeder_combout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(1));

-- Location: LABCELL_X56_Y2_N3
\u_correlation_calculator|u_operation|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~5_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(1) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(1) ) + ( \u_correlation_calculator|u_operation|Add1~2\ ))
-- \u_correlation_calculator|u_operation|Add1~6\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(1) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(1) ) + ( \u_correlation_calculator|u_operation|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(1),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(1),
	cin => \u_correlation_calculator|u_operation|Add1~2\,
	sumout => \u_correlation_calculator|u_operation|Add1~5_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~6\);

-- Location: FF_X56_Y2_N5
\u_correlation_calculator|u_operation|correlation_temp_ff_i[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~5_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(1));

-- Location: LABCELL_X56_Y2_N6
\u_correlation_calculator|u_operation|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~9_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(2) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(2) ) + ( \u_correlation_calculator|u_operation|Add1~6\ ))
-- \u_correlation_calculator|u_operation|Add1~10\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(2) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(2) ) + ( \u_correlation_calculator|u_operation|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(2),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(2),
	cin => \u_correlation_calculator|u_operation|Add1~6\,
	sumout => \u_correlation_calculator|u_operation|Add1~9_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~10\);

-- Location: FF_X56_Y2_N7
\u_correlation_calculator|u_operation|correlation_temp_ff_i[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~9_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(2));

-- Location: LABCELL_X56_Y2_N9
\u_correlation_calculator|u_operation|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~13_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(3) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(3) ) + ( \u_correlation_calculator|u_operation|Add1~10\ ))
-- \u_correlation_calculator|u_operation|Add1~14\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(3) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(3) ) + ( \u_correlation_calculator|u_operation|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(3),
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(3),
	cin => \u_correlation_calculator|u_operation|Add1~10\,
	sumout => \u_correlation_calculator|u_operation|Add1~13_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~14\);

-- Location: FF_X56_Y2_N11
\u_correlation_calculator|u_operation|correlation_temp_ff_i[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~13_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(3));

-- Location: LABCELL_X56_Y2_N12
\u_correlation_calculator|u_operation|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~17_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(4) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(4) ) + ( \u_correlation_calculator|u_operation|Add1~14\ ))
-- \u_correlation_calculator|u_operation|Add1~18\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(4) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(4) ) + ( \u_correlation_calculator|u_operation|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(4),
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(4),
	cin => \u_correlation_calculator|u_operation|Add1~14\,
	sumout => \u_correlation_calculator|u_operation|Add1~17_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~18\);

-- Location: FF_X56_Y2_N14
\u_correlation_calculator|u_operation|correlation_temp_ff_i[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~17_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(4));

-- Location: LABCELL_X56_Y2_N15
\u_correlation_calculator|u_operation|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~21_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(5) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i[5]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_operation|Add1~18\ ))
-- \u_correlation_calculator|u_operation|Add1~22\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(5) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i[5]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_operation|Add1~18\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[5]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(5),
	cin => \u_correlation_calculator|u_operation|Add1~18\,
	sumout => \u_correlation_calculator|u_operation|Add1~21_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~22\);

-- Location: FF_X56_Y2_N17
\u_correlation_calculator|u_operation|correlation_temp_ff_i[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~21_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i[5]~DUPLICATE_q\);

-- Location: LABCELL_X56_Y2_N18
\u_correlation_calculator|u_operation|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~25_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(6) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i[6]~DUPLICATE_q\ ) + ( 
-- \u_correlation_calculator|u_operation|Add1~22\ ))
-- \u_correlation_calculator|u_operation|Add1~26\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(6) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i[6]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_operation|Add1~22\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[6]~DUPLICATE_q\,
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(6),
	cin => \u_correlation_calculator|u_operation|Add1~22\,
	sumout => \u_correlation_calculator|u_operation|Add1~25_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~26\);

-- Location: FF_X56_Y2_N20
\u_correlation_calculator|u_operation|correlation_temp_ff_i[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~25_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i[6]~DUPLICATE_q\);

-- Location: LABCELL_X56_Y2_N21
\u_correlation_calculator|u_operation|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~29_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(7) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(7) ) + ( \u_correlation_calculator|u_operation|Add1~26\ ))
-- \u_correlation_calculator|u_operation|Add1~30\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(7) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(7) ) + ( \u_correlation_calculator|u_operation|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(7),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(7),
	cin => \u_correlation_calculator|u_operation|Add1~26\,
	sumout => \u_correlation_calculator|u_operation|Add1~29_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~30\);

-- Location: FF_X56_Y2_N23
\u_correlation_calculator|u_operation|correlation_temp_ff_i[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~29_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(7));

-- Location: LABCELL_X56_Y2_N24
\u_correlation_calculator|u_operation|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~33_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(8) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(8) ) + ( \u_correlation_calculator|u_operation|Add1~30\ ))
-- \u_correlation_calculator|u_operation|Add1~34\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(8) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(8) ) + ( \u_correlation_calculator|u_operation|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(8),
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(8),
	cin => \u_correlation_calculator|u_operation|Add1~30\,
	sumout => \u_correlation_calculator|u_operation|Add1~33_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~34\);

-- Location: FF_X56_Y2_N25
\u_correlation_calculator|u_operation|correlation_temp_ff_i[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~33_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(8));

-- Location: LABCELL_X56_Y2_N27
\u_correlation_calculator|u_operation|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~37_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(9) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(9) ) + ( \u_correlation_calculator|u_operation|Add1~34\ ))
-- \u_correlation_calculator|u_operation|Add1~38\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(9) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(9) ) + ( \u_correlation_calculator|u_operation|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(9),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(9),
	cin => \u_correlation_calculator|u_operation|Add1~34\,
	sumout => \u_correlation_calculator|u_operation|Add1~37_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~38\);

-- Location: FF_X56_Y2_N29
\u_correlation_calculator|u_operation|correlation_temp_ff_i[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~37_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(9));

-- Location: LABCELL_X56_Y2_N30
\u_correlation_calculator|u_operation|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~41_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(10) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(10) ) + ( \u_correlation_calculator|u_operation|Add1~38\ ))
-- \u_correlation_calculator|u_operation|Add1~42\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(10) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(10) ) + ( \u_correlation_calculator|u_operation|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(10),
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(10),
	cin => \u_correlation_calculator|u_operation|Add1~38\,
	sumout => \u_correlation_calculator|u_operation|Add1~41_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~42\);

-- Location: FF_X56_Y2_N31
\u_correlation_calculator|u_operation|correlation_temp_ff_i[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~41_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(10));

-- Location: LABCELL_X56_Y2_N33
\u_correlation_calculator|u_operation|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~45_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(11) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(11) ) + ( \u_correlation_calculator|u_operation|Add1~42\ ))
-- \u_correlation_calculator|u_operation|Add1~46\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(11) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(11) ) + ( \u_correlation_calculator|u_operation|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(11),
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(11),
	cin => \u_correlation_calculator|u_operation|Add1~42\,
	sumout => \u_correlation_calculator|u_operation|Add1~45_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~46\);

-- Location: FF_X56_Y2_N35
\u_correlation_calculator|u_operation|correlation_temp_ff_i[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~45_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(11));

-- Location: LABCELL_X56_Y2_N36
\u_correlation_calculator|u_operation|Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~49_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(12) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(12) ) + ( \u_correlation_calculator|u_operation|Add1~46\ ))
-- \u_correlation_calculator|u_operation|Add1~50\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(12) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(12) ) + ( \u_correlation_calculator|u_operation|Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(12),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(12),
	cin => \u_correlation_calculator|u_operation|Add1~46\,
	sumout => \u_correlation_calculator|u_operation|Add1~49_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~50\);

-- Location: FF_X56_Y2_N38
\u_correlation_calculator|u_operation|correlation_temp_ff_i[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~49_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(12));

-- Location: LABCELL_X56_Y2_N39
\u_correlation_calculator|u_operation|Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~53_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(13) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(13) ) + ( \u_correlation_calculator|u_operation|Add1~50\ ))
-- \u_correlation_calculator|u_operation|Add1~54\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(13) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(13) ) + ( \u_correlation_calculator|u_operation|Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(13),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(13),
	cin => \u_correlation_calculator|u_operation|Add1~50\,
	sumout => \u_correlation_calculator|u_operation|Add1~53_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~54\);

-- Location: FF_X56_Y2_N40
\u_correlation_calculator|u_operation|correlation_temp_ff_i[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~53_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(13));

-- Location: LABCELL_X56_Y2_N42
\u_correlation_calculator|u_operation|Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~57_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(14) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(14) ) + ( \u_correlation_calculator|u_operation|Add1~54\ ))
-- \u_correlation_calculator|u_operation|Add1~58\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(14) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(14) ) + ( \u_correlation_calculator|u_operation|Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(14),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(14),
	cin => \u_correlation_calculator|u_operation|Add1~54\,
	sumout => \u_correlation_calculator|u_operation|Add1~57_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~58\);

-- Location: FF_X56_Y2_N43
\u_correlation_calculator|u_operation|correlation_temp_ff_i[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~57_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(14));

-- Location: LABCELL_X56_Y2_N45
\u_correlation_calculator|u_operation|Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~61_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(15) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(15) ) + ( \u_correlation_calculator|u_operation|Add1~58\ ))
-- \u_correlation_calculator|u_operation|Add1~62\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(15) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(15) ) + ( \u_correlation_calculator|u_operation|Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(15),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(15),
	cin => \u_correlation_calculator|u_operation|Add1~58\,
	sumout => \u_correlation_calculator|u_operation|Add1~61_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~62\);

-- Location: FF_X56_Y2_N47
\u_correlation_calculator|u_operation|correlation_temp_ff_i[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~61_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(15));

-- Location: LABCELL_X56_Y2_N48
\u_correlation_calculator|u_operation|Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~65_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(16) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(16) ) + ( \u_correlation_calculator|u_operation|Add1~62\ ))
-- \u_correlation_calculator|u_operation|Add1~66\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(16) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(16) ) + ( \u_correlation_calculator|u_operation|Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(16),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(16),
	cin => \u_correlation_calculator|u_operation|Add1~62\,
	sumout => \u_correlation_calculator|u_operation|Add1~65_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~66\);

-- Location: FF_X56_Y2_N50
\u_correlation_calculator|u_operation|correlation_temp_ff_i[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~65_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(16));

-- Location: LABCELL_X56_Y2_N51
\u_correlation_calculator|u_operation|Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~69_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(17) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(17) ) + ( \u_correlation_calculator|u_operation|Add1~66\ ))
-- \u_correlation_calculator|u_operation|Add1~70\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(17) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(17) ) + ( \u_correlation_calculator|u_operation|Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(17),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(17),
	cin => \u_correlation_calculator|u_operation|Add1~66\,
	sumout => \u_correlation_calculator|u_operation|Add1~69_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~70\);

-- Location: FF_X56_Y2_N52
\u_correlation_calculator|u_operation|correlation_temp_ff_i[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~69_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(17));

-- Location: LABCELL_X56_Y2_N54
\u_correlation_calculator|u_operation|Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~73_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i[18]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(18) ) + ( 
-- \u_correlation_calculator|u_operation|Add1~70\ ))
-- \u_correlation_calculator|u_operation|Add1~74\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i[18]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(18) ) + ( \u_correlation_calculator|u_operation|Add1~70\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(18),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[18]~DUPLICATE_q\,
	cin => \u_correlation_calculator|u_operation|Add1~70\,
	sumout => \u_correlation_calculator|u_operation|Add1~73_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~74\);

-- Location: FF_X56_Y2_N56
\u_correlation_calculator|u_operation|correlation_temp_ff_i[18]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~73_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i[18]~DUPLICATE_q\);

-- Location: LABCELL_X56_Y2_N57
\u_correlation_calculator|u_operation|Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~77_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(19) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(19) ) + ( \u_correlation_calculator|u_operation|Add1~74\ ))
-- \u_correlation_calculator|u_operation|Add1~78\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(19) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(19) ) + ( \u_correlation_calculator|u_operation|Add1~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(19),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(19),
	cin => \u_correlation_calculator|u_operation|Add1~74\,
	sumout => \u_correlation_calculator|u_operation|Add1~77_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~78\);

-- Location: FF_X56_Y2_N59
\u_correlation_calculator|u_operation|correlation_temp_ff_i[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~77_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(19));

-- Location: LABCELL_X56_Y1_N0
\u_correlation_calculator|u_operation|Add1~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~81_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(20) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(20) ) + ( \u_correlation_calculator|u_operation|Add1~78\ ))
-- \u_correlation_calculator|u_operation|Add1~82\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(20) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(20) ) + ( \u_correlation_calculator|u_operation|Add1~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(20),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(20),
	cin => \u_correlation_calculator|u_operation|Add1~78\,
	sumout => \u_correlation_calculator|u_operation|Add1~81_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~82\);

-- Location: FF_X56_Y1_N2
\u_correlation_calculator|u_operation|correlation_temp_ff_i[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~81_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(20));

-- Location: LABCELL_X51_Y1_N48
\u_encoder|send.data[19]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.data[19]~2_combout\ = ( !\u_encoder|double_packet_flag~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( !\u_decoder|status_pending_reg~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_decoder|ALT_INV_status_pending_reg~q\,
	datae => \u_encoder|ALT_INV_double_packet_flag~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	combout => \u_encoder|send.data[19]~2_combout\);

-- Location: FF_X51_Y1_N53
\u_encoder|correlation_reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(20),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(20));

-- Location: FF_X51_Y1_N1
\u_encoder|send.data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~1_combout\,
	asdata => \u_encoder|correlation_reg\(20),
	sload => \u_encoder|double_packet_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(0));

-- Location: LABCELL_X51_Y1_N54
\u_encoder|send~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~2_combout\ = ( !\u_decoder|status_pending_reg~q\ & ( \u_decoder|mode_reg~q\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_encoder|double_packet_flag~q\ & ((\u_decoder|dm_data_in\(1))))) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (((\u_correlation_calculator|u_operation|correlation_temp_ff_i\(1))))) ) ) ) # ( \u_decoder|status_pending_reg~q\ & ( !\u_decoder|mode_reg~q\ ) ) # ( 
-- !\u_decoder|status_pending_reg~q\ & ( !\u_decoder|mode_reg~q\ & ( (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((\u_decoder|dm_data_in\(1)))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- (\u_correlation_calculator|u_operation|correlation_temp_ff_i\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111111111111111111100000011010001110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(1),
	datad => \u_decoder|ALT_INV_dm_data_in\(1),
	datae => \u_decoder|ALT_INV_status_pending_reg~q\,
	dataf => \u_decoder|ALT_INV_mode_reg~q\,
	combout => \u_encoder|send~2_combout\);

-- Location: FF_X55_Y2_N25
\u_correlation_calculator|u_operation|cor_pair_product_ff[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~29\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(21));

-- Location: LABCELL_X56_Y1_N3
\u_correlation_calculator|u_operation|Add1~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~85_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(21) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(21) ) + ( \u_correlation_calculator|u_operation|Add1~82\ ))
-- \u_correlation_calculator|u_operation|Add1~86\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(21) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(21) ) + ( \u_correlation_calculator|u_operation|Add1~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(21),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(21),
	cin => \u_correlation_calculator|u_operation|Add1~82\,
	sumout => \u_correlation_calculator|u_operation|Add1~85_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~86\);

-- Location: FF_X56_Y1_N5
\u_correlation_calculator|u_operation|correlation_temp_ff_i[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~85_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(21));

-- Location: FF_X51_Y1_N11
\u_encoder|correlation_reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(21),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(21));

-- Location: FF_X51_Y1_N55
\u_encoder|send.data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~2_combout\,
	asdata => \u_encoder|correlation_reg\(21),
	sload => \u_encoder|double_packet_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(1));

-- Location: LABCELL_X50_Y1_N39
\u_decoder|config_done_status_reg~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_decoder|config_done_status_reg~0_combout\ = ( !\u_encoder|status_transmit_done~q\ & ( (\u_decoder|config_done_status_reg~q\) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_CONFIG~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_CONFIG~q\,
	datad => \u_decoder|ALT_INV_config_done_status_reg~q\,
	dataf => \u_encoder|ALT_INV_status_transmit_done~q\,
	combout => \u_decoder|config_done_status_reg~0_combout\);

-- Location: FF_X50_Y1_N40
\u_decoder|config_done_status_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_decoder|config_done_status_reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_decoder|config_done_status_reg~q\);

-- Location: LABCELL_X51_Y1_N36
\u_encoder|send~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~3_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(2) & ( (!\u_decoder|status_pending_reg~q\) # ((\u_decoder|config_done_status_reg~q\ & 
-- !\u_encoder|send~0_combout\)) ) ) ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(2) & ( (!\u_encoder|send~0_combout\ & ((!\u_decoder|status_pending_reg~q\ & 
-- ((\u_decoder|dm_data_in\(2)))) # (\u_decoder|status_pending_reg~q\ & (\u_decoder|config_done_status_reg~q\)))) ) ) ) # ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( 
-- !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(2) & ( (\u_decoder|config_done_status_reg~q\ & !\u_encoder|send~0_combout\) ) ) ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( 
-- !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(2) & ( (!\u_encoder|send~0_combout\ & ((!\u_decoder|status_pending_reg~q\ & ((\u_decoder|dm_data_in\(2)))) # (\u_decoder|status_pending_reg~q\ & (\u_decoder|config_done_status_reg~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100000000010101010000000000011101000000001101110111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_config_done_status_reg~q\,
	datab => \u_decoder|ALT_INV_status_pending_reg~q\,
	datac => \u_decoder|ALT_INV_dm_data_in\(2),
	datad => \u_encoder|ALT_INV_send~0_combout\,
	datae => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(2),
	combout => \u_encoder|send~3_combout\);

-- Location: FF_X53_Y2_N52
\u_correlation_calculator|u_operation|cor_pair_product_ff[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~30\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(22));

-- Location: LABCELL_X56_Y1_N6
\u_correlation_calculator|u_operation|Add1~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~89_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(22) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(22) ) + ( \u_correlation_calculator|u_operation|Add1~86\ ))
-- \u_correlation_calculator|u_operation|Add1~90\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(22) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(22) ) + ( \u_correlation_calculator|u_operation|Add1~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(22),
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(22),
	cin => \u_correlation_calculator|u_operation|Add1~86\,
	sumout => \u_correlation_calculator|u_operation|Add1~89_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~90\);

-- Location: FF_X56_Y1_N8
\u_correlation_calculator|u_operation|correlation_temp_ff_i[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~89_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(22));

-- Location: FF_X51_Y1_N7
\u_encoder|correlation_reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(22),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(22));

-- Location: FF_X51_Y1_N37
\u_encoder|send.data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~3_combout\,
	asdata => \u_encoder|correlation_reg\(22),
	sload => \u_encoder|double_packet_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(2));

-- Location: FF_X56_Y2_N10
\u_correlation_calculator|u_operation|correlation_temp_ff_i[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~13_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i[3]~DUPLICATE_q\);

-- Location: FF_X53_Y2_N7
\u_correlation_calculator|u_operation|cor_pair_product_ff[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~31\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(23));

-- Location: LABCELL_X56_Y1_N9
\u_correlation_calculator|u_operation|Add1~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~93_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(23) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(23) ) + ( \u_correlation_calculator|u_operation|Add1~90\ ))
-- \u_correlation_calculator|u_operation|Add1~94\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(23) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(23) ) + ( \u_correlation_calculator|u_operation|Add1~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(23),
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(23),
	cin => \u_correlation_calculator|u_operation|Add1~90\,
	sumout => \u_correlation_calculator|u_operation|Add1~93_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~94\);

-- Location: FF_X56_Y1_N11
\u_correlation_calculator|u_operation|correlation_temp_ff_i[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~93_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(23));

-- Location: FF_X52_Y1_N16
\u_encoder|correlation_reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(23),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(23));

-- Location: MLABCELL_X52_Y1_N24
\u_encoder|send~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~4_combout\ = ( \u_encoder|correlation_reg\(23) & ( ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((\u_decoder|dm_data_in\(3)))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- (\u_correlation_calculator|u_operation|correlation_temp_ff_i[3]~DUPLICATE_q\))) # (\u_encoder|double_packet_flag~q\) ) ) # ( !\u_encoder|correlation_reg\(23) & ( (!\u_encoder|double_packet_flag~q\ & 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((\u_decoder|dm_data_in\(3)))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- (\u_correlation_calculator|u_operation|correlation_temp_ff_i[3]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001010001010000000101000101001010111110111110101011111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[3]~DUPLICATE_q\,
	datad => \u_decoder|ALT_INV_dm_data_in\(3),
	dataf => \u_encoder|ALT_INV_correlation_reg\(23),
	combout => \u_encoder|send~4_combout\);

-- Location: MLABCELL_X52_Y1_N15
\u_encoder|send.data[12]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.data[12]~0_combout\ = ( \u_decoder|mode_reg~q\ & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( (!\u_encoder|double_packet_flag~q\ & \u_decoder|status_pending_reg~q\) ) ) ) # ( !\u_decoder|mode_reg~q\ & ( 
-- \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( (!\u_encoder|double_packet_flag~q\ & \u_decoder|status_pending_reg~q\) ) ) ) # ( \u_decoder|mode_reg~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ 
-- & ( !\u_encoder|double_packet_flag~q\ ) ) ) # ( !\u_decoder|mode_reg~q\ & ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( (!\u_encoder|double_packet_flag~q\ & \u_decoder|status_pending_reg~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101010101010101000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_decoder|ALT_INV_status_pending_reg~q\,
	datae => \u_decoder|ALT_INV_mode_reg~q\,
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	combout => \u_encoder|send.data[12]~0_combout\);

-- Location: FF_X52_Y1_N25
\u_encoder|send.data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~4_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(3));

-- Location: FF_X56_Y1_N14
\u_correlation_calculator|u_operation|correlation_temp_ff_i[24]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~97_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i[24]~DUPLICATE_q\);

-- Location: FF_X53_Y2_N28
\u_correlation_calculator|u_operation|cor_pair_product_ff[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~32\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(24));

-- Location: LABCELL_X56_Y1_N12
\u_correlation_calculator|u_operation|Add1~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~97_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i[24]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(24) ) + ( 
-- \u_correlation_calculator|u_operation|Add1~94\ ))
-- \u_correlation_calculator|u_operation|Add1~98\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i[24]~DUPLICATE_q\ ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(24) ) + ( \u_correlation_calculator|u_operation|Add1~94\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[24]~DUPLICATE_q\,
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(24),
	cin => \u_correlation_calculator|u_operation|Add1~94\,
	sumout => \u_correlation_calculator|u_operation|Add1~97_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~98\);

-- Location: FF_X56_Y1_N13
\u_correlation_calculator|u_operation|correlation_temp_ff_i[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~97_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(24));

-- Location: FF_X51_Y1_N22
\u_encoder|correlation_reg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(24),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(24));

-- Location: LABCELL_X48_Y1_N24
\u_encoder|send~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~5_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(4) & ( (!\u_encoder|double_packet_flag~q\) # (\u_encoder|correlation_reg\(24)) ) ) ) # ( 
-- !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(4) & ( (!\u_encoder|double_packet_flag~q\ & ((\u_decoder|dm_data_in\(4)))) # (\u_encoder|double_packet_flag~q\ & 
-- (\u_encoder|correlation_reg\(24))) ) ) ) # ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(4) & ( (\u_encoder|correlation_reg\(24) & 
-- \u_encoder|double_packet_flag~q\) ) ) ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(4) & ( (!\u_encoder|double_packet_flag~q\ & 
-- ((\u_decoder|dm_data_in\(4)))) # (\u_encoder|double_packet_flag~q\ & (\u_encoder|correlation_reg\(24))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000100010001000100011101000111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_correlation_reg\(24),
	datab => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_decoder|ALT_INV_dm_data_in\(4),
	datae => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(4),
	combout => \u_encoder|send~5_combout\);

-- Location: FF_X48_Y1_N25
\u_encoder|send.data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~5_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(4));

-- Location: FF_X53_Y2_N55
\u_correlation_calculator|u_operation|cor_pair_product_ff[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~33\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(25));

-- Location: LABCELL_X56_Y1_N15
\u_correlation_calculator|u_operation|Add1~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~101_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(25) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(25) ) + ( \u_correlation_calculator|u_operation|Add1~98\ ))
-- \u_correlation_calculator|u_operation|Add1~102\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(25) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(25) ) + ( \u_correlation_calculator|u_operation|Add1~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(25),
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(25),
	cin => \u_correlation_calculator|u_operation|Add1~98\,
	sumout => \u_correlation_calculator|u_operation|Add1~101_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~102\);

-- Location: FF_X56_Y1_N17
\u_correlation_calculator|u_operation|correlation_temp_ff_i[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~101_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(25));

-- Location: FF_X56_Y1_N52
\u_encoder|correlation_reg[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(25),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(25));

-- Location: FF_X56_Y2_N16
\u_correlation_calculator|u_operation|correlation_temp_ff_i[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~21_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(5));

-- Location: LABCELL_X48_Y1_N42
\u_encoder|send~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~6_combout\ = ( \u_decoder|dm_data_in\(5) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(5) & ( (!\u_encoder|double_packet_flag~q\) # (\u_encoder|correlation_reg\(25)) ) ) ) # ( !\u_decoder|dm_data_in\(5) & ( 
-- \u_correlation_calculator|u_operation|correlation_temp_ff_i\(5) & ( (!\u_encoder|double_packet_flag~q\ & ((\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) # (\u_encoder|double_packet_flag~q\ & (\u_encoder|correlation_reg\(25))) ) 
-- ) ) # ( \u_decoder|dm_data_in\(5) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(5) & ( (!\u_encoder|double_packet_flag~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) # 
-- (\u_encoder|double_packet_flag~q\ & (\u_encoder|correlation_reg\(25))) ) ) ) # ( !\u_decoder|dm_data_in\(5) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(5) & ( (\u_encoder|correlation_reg\(25) & \u_encoder|double_packet_flag~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001110100011101000100011101000111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_correlation_reg\(25),
	datab => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datae => \u_decoder|ALT_INV_dm_data_in\(5),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(5),
	combout => \u_encoder|send~6_combout\);

-- Location: FF_X48_Y1_N43
\u_encoder|send.data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~6_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(5));

-- Location: FF_X53_Y2_N1
\u_correlation_calculator|u_operation|cor_pair_product_ff[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~34\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(26));

-- Location: LABCELL_X56_Y1_N18
\u_correlation_calculator|u_operation|Add1~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~105_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(26) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(26) ) + ( \u_correlation_calculator|u_operation|Add1~102\ ))
-- \u_correlation_calculator|u_operation|Add1~106\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(26) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(26) ) + ( \u_correlation_calculator|u_operation|Add1~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(26),
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(26),
	cin => \u_correlation_calculator|u_operation|Add1~102\,
	sumout => \u_correlation_calculator|u_operation|Add1~105_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~106\);

-- Location: FF_X56_Y1_N20
\u_correlation_calculator|u_operation|correlation_temp_ff_i[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~105_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(26));

-- Location: FF_X56_Y1_N49
\u_encoder|correlation_reg[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(26),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(26));

-- Location: FF_X56_Y2_N19
\u_correlation_calculator|u_operation|correlation_temp_ff_i[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~25_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(6));

-- Location: LABCELL_X48_Y1_N48
\u_encoder|send~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~7_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(6) & ( (!\u_encoder|double_packet_flag~q\ & (((\u_decoder|dm_data_in\(6))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) # 
-- (\u_encoder|double_packet_flag~q\ & (((\u_encoder|correlation_reg\(26))))) ) ) # ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(6) & ( (!\u_encoder|double_packet_flag~q\ & 
-- (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((\u_decoder|dm_data_in\(6))))) # (\u_encoder|double_packet_flag~q\ & (((\u_encoder|correlation_reg\(26))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001110001011000000111000101101000111110011110100011111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datab => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_encoder|ALT_INV_correlation_reg\(26),
	datad => \u_decoder|ALT_INV_dm_data_in\(6),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(6),
	combout => \u_encoder|send~7_combout\);

-- Location: FF_X48_Y1_N50
\u_encoder|send.data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~7_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(6));

-- Location: FF_X53_Y2_N22
\u_correlation_calculator|u_operation|cor_pair_product_ff[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~35\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(27));

-- Location: LABCELL_X56_Y1_N21
\u_correlation_calculator|u_operation|Add1~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~109_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(27) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(27) ) + ( \u_correlation_calculator|u_operation|Add1~106\ ))
-- \u_correlation_calculator|u_operation|Add1~110\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(27) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(27) ) + ( \u_correlation_calculator|u_operation|Add1~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(27),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(27),
	cin => \u_correlation_calculator|u_operation|Add1~106\,
	sumout => \u_correlation_calculator|u_operation|Add1~109_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~110\);

-- Location: FF_X56_Y1_N23
\u_correlation_calculator|u_operation|correlation_temp_ff_i[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~109_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(27));

-- Location: FF_X56_Y1_N58
\u_encoder|correlation_reg[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(27),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(27));

-- Location: LABCELL_X48_Y1_N51
\u_encoder|send~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~8_combout\ = ( \u_encoder|correlation_reg\(27) & ( ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_decoder|dm_data_in\(7))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- ((\u_correlation_calculator|u_operation|correlation_temp_ff_i\(7))))) # (\u_encoder|double_packet_flag~q\) ) ) # ( !\u_encoder|correlation_reg\(27) & ( (!\u_encoder|double_packet_flag~q\ & 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_decoder|dm_data_in\(7))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((\u_correlation_calculator|u_operation|correlation_temp_ff_i\(7)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100001001100000010000100110000111011011111110011101101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datab => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_decoder|ALT_INV_dm_data_in\(7),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(7),
	dataf => \u_encoder|ALT_INV_correlation_reg\(27),
	combout => \u_encoder|send~8_combout\);

-- Location: FF_X48_Y1_N53
\u_encoder|send.data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~8_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(7));

-- Location: FF_X53_Y2_N40
\u_correlation_calculator|u_operation|cor_pair_product_ff[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~36\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(28));

-- Location: LABCELL_X56_Y1_N24
\u_correlation_calculator|u_operation|Add1~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~113_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(28) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(28) ) + ( \u_correlation_calculator|u_operation|Add1~110\ ))
-- \u_correlation_calculator|u_operation|Add1~114\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(28) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(28) ) + ( \u_correlation_calculator|u_operation|Add1~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(28),
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(28),
	cin => \u_correlation_calculator|u_operation|Add1~110\,
	sumout => \u_correlation_calculator|u_operation|Add1~113_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~114\);

-- Location: FF_X56_Y1_N26
\u_correlation_calculator|u_operation|correlation_temp_ff_i[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~113_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(28));

-- Location: LABCELL_X56_Y1_N54
\u_encoder|correlation_reg[28]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|correlation_reg[28]~feeder_combout\ = \u_correlation_calculator|u_operation|correlation_temp_ff_i\(28)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(28),
	combout => \u_encoder|correlation_reg[28]~feeder_combout\);

-- Location: FF_X56_Y1_N55
\u_encoder|correlation_reg[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|correlation_reg[28]~feeder_combout\,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(28));

-- Location: LABCELL_X48_Y1_N33
\u_encoder|send~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~9_combout\ = ( \u_decoder|dm_data_in\(8) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(8) & ( (!\u_encoder|double_packet_flag~q\) # (\u_encoder|correlation_reg\(28)) ) ) ) # ( !\u_decoder|dm_data_in\(8) & ( 
-- \u_correlation_calculator|u_operation|correlation_temp_ff_i\(8) & ( (!\u_encoder|double_packet_flag~q\ & ((\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) # (\u_encoder|double_packet_flag~q\ & (\u_encoder|correlation_reg\(28))) ) 
-- ) ) # ( \u_decoder|dm_data_in\(8) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(8) & ( (!\u_encoder|double_packet_flag~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) # 
-- (\u_encoder|double_packet_flag~q\ & (\u_encoder|correlation_reg\(28))) ) ) ) # ( !\u_decoder|dm_data_in\(8) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(8) & ( (\u_encoder|double_packet_flag~q\ & \u_encoder|correlation_reg\(28)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001101110110001000100010001101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datab => \u_encoder|ALT_INV_correlation_reg\(28),
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datae => \u_decoder|ALT_INV_dm_data_in\(8),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(8),
	combout => \u_encoder|send~9_combout\);

-- Location: FF_X48_Y1_N34
\u_encoder|send.data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~9_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(8));

-- Location: FF_X53_Y2_N46
\u_correlation_calculator|u_operation|cor_pair_product_ff[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~37\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(29));

-- Location: LABCELL_X56_Y1_N27
\u_correlation_calculator|u_operation|Add1~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~117_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(29) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(29) ) + ( \u_correlation_calculator|u_operation|Add1~114\ ))
-- \u_correlation_calculator|u_operation|Add1~118\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(29) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(29) ) + ( \u_correlation_calculator|u_operation|Add1~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(29),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(29),
	cin => \u_correlation_calculator|u_operation|Add1~114\,
	sumout => \u_correlation_calculator|u_operation|Add1~117_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~118\);

-- Location: FF_X56_Y1_N29
\u_correlation_calculator|u_operation|correlation_temp_ff_i[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~117_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(29));

-- Location: FF_X51_Y1_N13
\u_encoder|correlation_reg[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(29),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(29));

-- Location: LABCELL_X48_Y1_N39
\u_encoder|send~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~10_combout\ = ( \u_encoder|correlation_reg\(29) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(9) & ( ((\u_encoder|double_packet_flag~q\) # (\u_decoder|dm_data_in\(9))) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) ) ) ) # ( !\u_encoder|correlation_reg\(29) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(9) & ( (!\u_encoder|double_packet_flag~q\ & ((\u_decoder|dm_data_in\(9)) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) ) ) ) # ( \u_encoder|correlation_reg\(29) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(9) & ( 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & \u_decoder|dm_data_in\(9))) # (\u_encoder|double_packet_flag~q\) ) ) ) # ( !\u_encoder|correlation_reg\(29) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(9) & 
-- ( (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_decoder|dm_data_in\(9) & !\u_encoder|double_packet_flag~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000101111111101110111000000000111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datab => \u_decoder|ALT_INV_dm_data_in\(9),
	datad => \u_encoder|ALT_INV_double_packet_flag~q\,
	datae => \u_encoder|ALT_INV_correlation_reg\(29),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(9),
	combout => \u_encoder|send~10_combout\);

-- Location: FF_X48_Y1_N40
\u_encoder|send.data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~10_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(9));

-- Location: FF_X53_Y2_N19
\u_correlation_calculator|u_operation|cor_pair_product_ff[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~38\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(30));

-- Location: LABCELL_X56_Y1_N30
\u_correlation_calculator|u_operation|Add1~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~121_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(30) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(30) ) + ( \u_correlation_calculator|u_operation|Add1~118\ ))
-- \u_correlation_calculator|u_operation|Add1~122\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(30) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(30) ) + ( \u_correlation_calculator|u_operation|Add1~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(30),
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(30),
	cin => \u_correlation_calculator|u_operation|Add1~118\,
	sumout => \u_correlation_calculator|u_operation|Add1~121_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~122\);

-- Location: FF_X56_Y1_N31
\u_correlation_calculator|u_operation|correlation_temp_ff_i[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~121_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(30));

-- Location: LABCELL_X51_Y1_N18
\u_encoder|correlation_reg[30]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|correlation_reg[30]~feeder_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(30) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(30),
	combout => \u_encoder|correlation_reg[30]~feeder_combout\);

-- Location: FF_X51_Y1_N19
\u_encoder|correlation_reg[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|correlation_reg[30]~feeder_combout\,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(30));

-- Location: LABCELL_X48_Y1_N6
\u_encoder|send~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~11_combout\ = ( \u_decoder|dm_data_in\(10) & ( \u_encoder|correlation_reg\(30) & ( ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) # (\u_correlation_calculator|u_operation|correlation_temp_ff_i\(10))) # 
-- (\u_encoder|double_packet_flag~q\) ) ) ) # ( !\u_decoder|dm_data_in\(10) & ( \u_encoder|correlation_reg\(30) & ( ((\u_correlation_calculator|u_operation|correlation_temp_ff_i\(10) & \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\)) 
-- # (\u_encoder|double_packet_flag~q\) ) ) ) # ( \u_decoder|dm_data_in\(10) & ( !\u_encoder|correlation_reg\(30) & ( (!\u_encoder|double_packet_flag~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) # 
-- (\u_correlation_calculator|u_operation|correlation_temp_ff_i\(10)))) ) ) ) # ( !\u_decoder|dm_data_in\(10) & ( !\u_encoder|correlation_reg\(30) & ( (!\u_encoder|double_packet_flag~q\ & (\u_correlation_calculator|u_operation|correlation_temp_ff_i\(10) & 
-- \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010101000101010001001010111010101111111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datab => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(10),
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datae => \u_decoder|ALT_INV_dm_data_in\(10),
	dataf => \u_encoder|ALT_INV_correlation_reg\(30),
	combout => \u_encoder|send~11_combout\);

-- Location: FF_X48_Y1_N7
\u_encoder|send.data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~11_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(10));

-- Location: FF_X53_Y2_N10
\u_correlation_calculator|u_operation|cor_pair_product_ff[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~39\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(31));

-- Location: LABCELL_X56_Y1_N33
\u_correlation_calculator|u_operation|Add1~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~125_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(31) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(31) ) + ( \u_correlation_calculator|u_operation|Add1~122\ ))
-- \u_correlation_calculator|u_operation|Add1~126\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(31) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(31) ) + ( \u_correlation_calculator|u_operation|Add1~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(31),
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(31),
	cin => \u_correlation_calculator|u_operation|Add1~122\,
	sumout => \u_correlation_calculator|u_operation|Add1~125_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~126\);

-- Location: FF_X56_Y1_N35
\u_correlation_calculator|u_operation|correlation_temp_ff_i[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~125_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(31));

-- Location: MLABCELL_X52_Y1_N21
\u_encoder|correlation_reg[31]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|correlation_reg[31]~feeder_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(31) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(31),
	combout => \u_encoder|correlation_reg[31]~feeder_combout\);

-- Location: FF_X52_Y1_N22
\u_encoder|correlation_reg[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|correlation_reg[31]~feeder_combout\,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(31));

-- Location: MLABCELL_X52_Y1_N27
\u_encoder|send~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~12_combout\ = ( \u_encoder|correlation_reg\(31) & ( ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_decoder|dm_data_in\(11))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- ((\u_correlation_calculator|u_operation|correlation_temp_ff_i\(11))))) # (\u_encoder|double_packet_flag~q\) ) ) # ( !\u_encoder|correlation_reg\(31) & ( (!\u_encoder|double_packet_flag~q\ & 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_decoder|dm_data_in\(11))) # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ((\u_correlation_calculator|u_operation|correlation_temp_ff_i\(11)))))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101001011101011111110101110101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datac => \u_decoder|ALT_INV_dm_data_in\(11),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(11),
	dataf => \u_encoder|ALT_INV_correlation_reg\(31),
	combout => \u_encoder|send~12_combout\);

-- Location: FF_X52_Y1_N28
\u_encoder|send.data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~12_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(11));

-- Location: FF_X53_Y2_N59
\u_correlation_calculator|u_operation|cor_pair_product_ff[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~40\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(32));

-- Location: LABCELL_X56_Y1_N36
\u_correlation_calculator|u_operation|Add1~129\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~129_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(32) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(32) ) + ( \u_correlation_calculator|u_operation|Add1~126\ ))
-- \u_correlation_calculator|u_operation|Add1~130\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(32) ) + ( \u_correlation_calculator|u_operation|cor_pair_product_ff\(32) ) + ( \u_correlation_calculator|u_operation|Add1~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(32),
	datad => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(32),
	cin => \u_correlation_calculator|u_operation|Add1~126\,
	sumout => \u_correlation_calculator|u_operation|Add1~129_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~130\);

-- Location: FF_X56_Y1_N38
\u_correlation_calculator|u_operation|correlation_temp_ff_i[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~129_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(32));

-- Location: FF_X51_Y1_N43
\u_encoder|correlation_reg[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(32),
	sload => VCC,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(32));

-- Location: FF_X56_Y2_N37
\u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~49_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE_q\);

-- Location: MLABCELL_X52_Y1_N42
\u_encoder|send~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~13_combout\ = ( \u_encoder|correlation_reg\(32) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE_q\ & ( ((\u_encoder|double_packet_flag~q\) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\)) # (\u_decoder|dm_data_in\(12)) ) ) ) # ( !\u_encoder|correlation_reg\(32) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE_q\ & ( 
-- (!\u_encoder|double_packet_flag~q\ & ((\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) # (\u_decoder|dm_data_in\(12)))) ) ) ) # ( \u_encoder|correlation_reg\(32) & ( 
-- !\u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE_q\ & ( ((\u_decoder|dm_data_in\(12) & !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\)) # (\u_encoder|double_packet_flag~q\) ) ) ) # ( 
-- !\u_encoder|correlation_reg\(32) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i[12]~DUPLICATE_q\ & ( (\u_decoder|dm_data_in\(12) & (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & 
-- !\u_encoder|double_packet_flag~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000010011110100111101110000011100000111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_decoder|ALT_INV_dm_data_in\(12),
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datac => \u_encoder|ALT_INV_double_packet_flag~q\,
	datae => \u_encoder|ALT_INV_correlation_reg\(32),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i[12]~DUPLICATE_q\,
	combout => \u_encoder|send~13_combout\);

-- Location: FF_X52_Y1_N43
\u_encoder|send.data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~13_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(12));

-- Location: FF_X53_Y2_N4
\u_correlation_calculator|u_operation|cor_pair_product_ff[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_correlation_calculator|u_operation|Mult0~41\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|cor_pair_product_clr~combout\,
	sload => VCC,
	ena => \u_correlation_calculator|u_operation|cor_pair_product_ff[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|cor_pair_product_ff\(33));

-- Location: LABCELL_X56_Y1_N39
\u_correlation_calculator|u_operation|Add1~133\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~133_sumout\ = SUM(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(33) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(33) ) + ( \u_correlation_calculator|u_operation|Add1~130\ ))
-- \u_correlation_calculator|u_operation|Add1~134\ = CARRY(( \u_correlation_calculator|u_operation|cor_pair_product_ff\(33) ) + ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(33) ) + ( \u_correlation_calculator|u_operation|Add1~130\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(33),
	datad => \u_correlation_calculator|u_operation|ALT_INV_cor_pair_product_ff\(33),
	cin => \u_correlation_calculator|u_operation|Add1~130\,
	sumout => \u_correlation_calculator|u_operation|Add1~133_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~134\);

-- Location: FF_X56_Y1_N41
\u_correlation_calculator|u_operation|correlation_temp_ff_i[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~133_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(33));

-- Location: LABCELL_X51_Y1_N27
\u_encoder|correlation_reg[33]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|correlation_reg[33]~feeder_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(33) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(33),
	combout => \u_encoder|correlation_reg[33]~feeder_combout\);

-- Location: FF_X51_Y1_N28
\u_encoder|correlation_reg[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|correlation_reg[33]~feeder_combout\,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(33));

-- Location: LABCELL_X51_Y1_N45
\u_encoder|send~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~14_combout\ = ( \u_decoder|dm_data_in\(13) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(13) & ( (!\u_encoder|double_packet_flag~q\) # (\u_encoder|correlation_reg\(33)) ) ) ) # ( !\u_decoder|dm_data_in\(13) & ( 
-- \u_correlation_calculator|u_operation|correlation_temp_ff_i\(13) & ( (!\u_encoder|double_packet_flag~q\ & ((\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) # (\u_encoder|double_packet_flag~q\ & (\u_encoder|correlation_reg\(33))) 
-- ) ) ) # ( \u_decoder|dm_data_in\(13) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(13) & ( (!\u_encoder|double_packet_flag~q\ & ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) # 
-- (\u_encoder|double_packet_flag~q\ & (\u_encoder|correlation_reg\(33))) ) ) ) # ( !\u_decoder|dm_data_in\(13) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(13) & ( (\u_encoder|double_packet_flag~q\ & \u_encoder|correlation_reg\(33)) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001101100011011000100011011000110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datab => \u_encoder|ALT_INV_correlation_reg\(33),
	datac => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datae => \u_decoder|ALT_INV_dm_data_in\(13),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(13),
	combout => \u_encoder|send~14_combout\);

-- Location: LABCELL_X46_Y1_N24
\u_encoder|send.data[13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.data[13]~feeder_combout\ = ( \u_encoder|send~14_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_encoder|ALT_INV_send~14_combout\,
	combout => \u_encoder|send.data[13]~feeder_combout\);

-- Location: FF_X46_Y1_N25
\u_encoder|send.data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.data[13]~feeder_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(13));

-- Location: LABCELL_X56_Y1_N42
\u_correlation_calculator|u_operation|Add1~137\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~137_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(34) ) + ( GND ) + ( \u_correlation_calculator|u_operation|Add1~134\ ))
-- \u_correlation_calculator|u_operation|Add1~138\ = CARRY(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(34) ) + ( GND ) + ( \u_correlation_calculator|u_operation|Add1~134\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(34),
	cin => \u_correlation_calculator|u_operation|Add1~134\,
	sumout => \u_correlation_calculator|u_operation|Add1~137_sumout\,
	cout => \u_correlation_calculator|u_operation|Add1~138\);

-- Location: FF_X56_Y1_N44
\u_correlation_calculator|u_operation|correlation_temp_ff_i[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~137_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(34));

-- Location: LABCELL_X51_Y1_N15
\u_encoder|correlation_reg[34]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|correlation_reg[34]~feeder_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(34) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(34),
	combout => \u_encoder|correlation_reg[34]~feeder_combout\);

-- Location: FF_X51_Y1_N16
\u_encoder|correlation_reg[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|correlation_reg[34]~feeder_combout\,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(34));

-- Location: LABCELL_X48_Y1_N15
\u_encoder|send~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~15_combout\ = ( \u_encoder|correlation_reg\(34) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(14) & ( ((\u_encoder|double_packet_flag~q\) # (\u_decoder|dm_data_in\(14))) # 
-- (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) ) ) ) # ( !\u_encoder|correlation_reg\(34) & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(14) & ( (!\u_encoder|double_packet_flag~q\ & ((\u_decoder|dm_data_in\(14)) 
-- # (\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\))) ) ) ) # ( \u_encoder|correlation_reg\(34) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(14) & ( 
-- ((!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & \u_decoder|dm_data_in\(14))) # (\u_encoder|double_packet_flag~q\) ) ) ) # ( !\u_encoder|correlation_reg\(34) & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(14) 
-- & ( (!\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & (\u_decoder|dm_data_in\(14) & !\u_encoder|double_packet_flag~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010101111111101011111000000000101111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datac => \u_decoder|ALT_INV_dm_data_in\(14),
	datad => \u_encoder|ALT_INV_double_packet_flag~q\,
	datae => \u_encoder|ALT_INV_correlation_reg\(34),
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(14),
	combout => \u_encoder|send~15_combout\);

-- Location: FF_X48_Y1_N17
\u_encoder|send.data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~15_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(14));

-- Location: LABCELL_X56_Y1_N45
\u_correlation_calculator|u_operation|Add1~141\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_correlation_calculator|u_operation|Add1~141_sumout\ = SUM(( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(35) ) + ( GND ) + ( \u_correlation_calculator|u_operation|Add1~138\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(35),
	cin => \u_correlation_calculator|u_operation|Add1~138\,
	sumout => \u_correlation_calculator|u_operation|Add1~141_sumout\);

-- Location: FF_X56_Y1_N47
\u_correlation_calculator|u_operation|correlation_temp_ff_i[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~141_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(35));

-- Location: LABCELL_X51_Y1_N33
\u_encoder|correlation_reg[35]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|correlation_reg[35]~feeder_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(35) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(35),
	combout => \u_encoder|correlation_reg[35]~feeder_combout\);

-- Location: FF_X51_Y1_N34
\u_encoder|correlation_reg[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|correlation_reg[35]~feeder_combout\,
	ena => \u_encoder|send.data[19]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|correlation_reg\(35));

-- Location: LABCELL_X48_Y1_N54
\u_encoder|send~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~16_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(15) & ( (!\u_encoder|double_packet_flag~q\) # (\u_encoder|correlation_reg\(35)) ) ) ) # 
-- ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(15) & ( (!\u_encoder|double_packet_flag~q\ & (\u_decoder|dm_data_in\(15))) # (\u_encoder|double_packet_flag~q\ & 
-- ((\u_encoder|correlation_reg\(35)))) ) ) ) # ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(15) & ( (\u_encoder|double_packet_flag~q\ & 
-- \u_encoder|correlation_reg\(35)) ) ) ) # ( !\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( !\u_correlation_calculator|u_operation|correlation_temp_ff_i\(15) & ( (!\u_encoder|double_packet_flag~q\ & (\u_decoder|dm_data_in\(15))) 
-- # (\u_encoder|double_packet_flag~q\ & ((\u_encoder|correlation_reg\(35)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011100100111000001010000010100100111001001111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datab => \u_decoder|ALT_INV_dm_data_in\(15),
	datac => \u_encoder|ALT_INV_correlation_reg\(35),
	datae => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	dataf => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(15),
	combout => \u_encoder|send~16_combout\);

-- Location: FF_X48_Y1_N55
\u_encoder|send.data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~16_combout\,
	sclr => \u_encoder|send.data[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(15));

-- Location: MLABCELL_X52_Y1_N51
\u_encoder|send~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~17_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(16) & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( (!\u_encoder|double_packet_flag~q\ & !\u_decoder|status_pending_reg~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_decoder|ALT_INV_status_pending_reg~q\,
	datae => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(16),
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	combout => \u_encoder|send~17_combout\);

-- Location: FF_X52_Y1_N52
\u_encoder|send.data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(16));

-- Location: MLABCELL_X52_Y1_N9
\u_encoder|send~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~18_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(17) & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( (!\u_encoder|double_packet_flag~q\ & !\u_decoder|status_pending_reg~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_decoder|ALT_INV_status_pending_reg~q\,
	datae => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(17),
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	combout => \u_encoder|send~18_combout\);

-- Location: FF_X52_Y1_N10
\u_encoder|send.data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(17));

-- Location: FF_X56_Y2_N55
\u_correlation_calculator|u_operation|correlation_temp_ff_i[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_correlation_calculator|u_operation|Add1~73_sumout\,
	sclr => \u_correlation_calculator|u_multicycle_moore_machine|state.S_CAPTURE_NEW_ADDR~q\,
	ena => \u_correlation_calculator|u_operation|correlation_temp_ff_i[28]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_correlation_calculator|u_operation|correlation_temp_ff_i\(18));

-- Location: MLABCELL_X52_Y1_N36
\u_encoder|send~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~19_combout\ = ( !\u_decoder|status_pending_reg~q\ & ( !\u_encoder|double_packet_flag~q\ & ( (\u_correlation_calculator|u_operation|correlation_temp_ff_i\(18) & \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(18),
	datab => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	datae => \u_decoder|ALT_INV_status_pending_reg~q\,
	dataf => \u_encoder|ALT_INV_double_packet_flag~q\,
	combout => \u_encoder|send~19_combout\);

-- Location: FF_X52_Y1_N37
\u_encoder|send.data[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(18));

-- Location: MLABCELL_X52_Y1_N33
\u_encoder|send~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~20_combout\ = ( \u_correlation_calculator|u_operation|correlation_temp_ff_i\(19) & ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( (!\u_encoder|double_packet_flag~q\ & !\u_decoder|status_pending_reg~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_encoder|ALT_INV_double_packet_flag~q\,
	datac => \u_decoder|ALT_INV_status_pending_reg~q\,
	datae => \u_correlation_calculator|u_operation|ALT_INV_correlation_temp_ff_i\(19),
	dataf => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	combout => \u_encoder|send~20_combout\);

-- Location: FF_X52_Y1_N34
\u_encoder|send.data[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(19));

-- Location: LABCELL_X50_Y1_N57
\u_encoder|send~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send~21_combout\ = ( \u_decoder|mode_reg~q\ & ( ((\u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\) # (\u_encoder|double_packet_flag~q\)) # (\u_decoder|status_pending_reg~q\) ) ) # ( !\u_decoder|mode_reg~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100111111111111110011111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_decoder|ALT_INV_status_pending_reg~q\,
	datac => \u_encoder|ALT_INV_double_packet_flag~q\,
	datad => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	dataf => \u_decoder|ALT_INV_mode_reg~q\,
	combout => \u_encoder|send~21_combout\);

-- Location: LABCELL_X40_Y1_N24
\u_encoder|send.data[20]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.data[20]~feeder_combout\ = ( \u_encoder|send~21_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_encoder|ALT_INV_send~21_combout\,
	combout => \u_encoder|send.data[20]~feeder_combout\);

-- Location: FF_X40_Y1_N25
\u_encoder|send.data[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.data[20]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(20));

-- Location: LABCELL_X40_Y1_N33
\u_encoder|send.data[22]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.data[22]~feeder_combout\ = ( \u_encoder|send~21_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_encoder|ALT_INV_send~21_combout\,
	combout => \u_encoder|send.data[22]~feeder_combout\);

-- Location: FF_X40_Y1_N34
\u_encoder|send.data[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.data[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(22));

-- Location: LABCELL_X50_Y1_N48
\u_encoder|send.data[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.data[1]~1_combout\ = ( \u_correlation_calculator|u_multicycle_moore_machine|state.S_OUTPUT~q\ & ( !\u_decoder|status_pending_reg~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_correlation_calculator|u_multicycle_moore_machine|ALT_INV_state.S_OUTPUT~q\,
	dataf => \u_decoder|ALT_INV_status_pending_reg~q\,
	combout => \u_encoder|send.data[1]~1_combout\);

-- Location: FF_X50_Y1_N49
\u_encoder|send.data[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.data[1]~1_combout\,
	sclr => \u_encoder|double_packet_flag~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(24));

-- Location: FF_X52_Y1_N40
\u_encoder|send.data[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_encoder|double_packet_flag~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(25));

-- Location: LABCELL_X40_Y1_N12
\u_encoder|send.data[28]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.data[28]~feeder_combout\ = ( \u_encoder|send~22_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_encoder|ALT_INV_send~22_combout\,
	combout => \u_encoder|send.data[28]~feeder_combout\);

-- Location: FF_X40_Y1_N14
\u_encoder|send.data[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.data[28]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(28));

-- Location: FF_X50_Y1_N16
\u_encoder|send.data[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_encoder|send~21_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.data\(29));

-- Location: LABCELL_X40_Y1_N9
\u_encoder|send.addr[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.addr[0]~feeder_combout\ = ( \u_encoder|send~22_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_encoder|ALT_INV_send~22_combout\,
	combout => \u_encoder|send.addr[0]~feeder_combout\);

-- Location: FF_X40_Y1_N10
\u_encoder|send.addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.addr[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.addr\(0));

-- Location: LABCELL_X46_Y1_N6
\u_encoder|send.addr[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.addr[1]~0_combout\ = ( !\u_encoder|send.data[12]~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_encoder|ALT_INV_send.data[12]~0_combout\,
	combout => \u_encoder|send.addr[1]~0_combout\);

-- Location: FF_X46_Y1_N7
\u_encoder|send.addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.addr[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.addr\(1));

-- Location: LABCELL_X46_Y1_N3
\u_encoder|send.addr[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_encoder|send.addr[2]~1_combout\ = ( !\u_encoder|send.data[12]~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_encoder|ALT_INV_send.data[12]~0_combout\,
	combout => \u_encoder|send.addr[2]~1_combout\);

-- Location: FF_X46_Y1_N4
\u_encoder|send.addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_encoder|send.addr[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_encoder|send.addr\(2));

-- Location: IOIBUF_X89_Y11_N61
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\recv.data[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(20),
	o => \recv.data[20]~input_o\);

-- Location: IOIBUF_X74_Y0_N58
\recv.data[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(21),
	o => \recv.data[21]~input_o\);

-- Location: IOIBUF_X89_Y13_N38
\recv.data[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(22),
	o => \recv.data[22]~input_o\);

-- Location: IOIBUF_X89_Y9_N55
\recv.data[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(23),
	o => \recv.data[23]~input_o\);

-- Location: IOIBUF_X22_Y81_N35
\recv.addr[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(0),
	o => \recv.addr[0]~input_o\);

-- Location: IOIBUF_X20_Y0_N52
\recv.addr[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(1),
	o => \recv.addr[1]~input_o\);

-- Location: IOIBUF_X6_Y0_N1
\recv.addr[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(2),
	o => \recv.addr[2]~input_o\);

-- Location: IOIBUF_X88_Y0_N36
\recv.addr[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(3),
	o => \recv.addr[3]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\recv.addr[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(4),
	o => \recv.addr[4]~input_o\);

-- Location: IOIBUF_X26_Y81_N92
\recv.addr[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(5),
	o => \recv.addr[5]~input_o\);

-- Location: IOIBUF_X28_Y81_N18
\recv.addr[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(6),
	o => \recv.addr[6]~input_o\);

-- Location: IOIBUF_X89_Y11_N95
\recv.addr[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(7),
	o => \recv.addr[7]~input_o\);

-- Location: LABCELL_X18_Y44_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


