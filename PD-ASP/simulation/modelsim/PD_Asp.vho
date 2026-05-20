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

-- DATE "05/21/2026 11:47:52"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
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

ENTITY 	PeakDetector_ASP IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	init : IN std_logic;
	\send.data\ : BUFFER std_logic_vector(31 DOWNTO 0);
	\send.addr\ : BUFFER std_logic_vector(7 DOWNTO 0);
	\recv.data\ : IN std_logic_vector(31 DOWNTO 0);
	\recv.addr\ : IN std_logic_vector(7 DOWNTO 0)
	);
END PeakDetector_ASP;

-- Design Ports Information
-- send.data[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[1]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[2]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[3]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[4]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[5]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[6]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[7]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[8]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[9]	=>  Location: PIN_P7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[10]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[11]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[12]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[13]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[14]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[15]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[16]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[17]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[18]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[19]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[20]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[21]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[22]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[23]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[24]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[25]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[26]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[27]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[28]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[29]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[30]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.data[31]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[0]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[1]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[2]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[4]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[5]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[6]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- send.addr[7]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[20]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[21]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[22]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[23]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- init	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[29]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[24]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[25]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[26]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[27]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[28]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[30]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[31]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[0]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[3]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[4]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[5]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[6]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.addr[7]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[9]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[5]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[8]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[4]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[7]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[3]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[6]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[2]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[1]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[0]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[19]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[15]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[18]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[14]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[17]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[13]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[16]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[12]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[11]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- recv.data[10]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PeakDetector_ASP IS
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
SIGNAL \recv.data[20]~input_o\ : std_logic;
SIGNAL \recv.data[21]~input_o\ : std_logic;
SIGNAL \recv.data[22]~input_o\ : std_logic;
SIGNAL \recv.data[23]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \init~input_o\ : std_logic;
SIGNAL \pd_reset~combout\ : std_logic;
SIGNAL \recv.data[31]~input_o\ : std_logic;
SIGNAL \recv.addr[0]~input_o\ : std_logic;
SIGNAL \recv.data[30]~input_o\ : std_logic;
SIGNAL \recv.addr[3]~input_o\ : std_logic;
SIGNAL \recv.addr[1]~input_o\ : std_logic;
SIGNAL \recv.addr[2]~input_o\ : std_logic;
SIGNAL \pd_in_word~0_combout\ : std_logic;
SIGNAL \recv.data[28]~input_o\ : std_logic;
SIGNAL \recv.data[29]~input_o\ : std_logic;
SIGNAL \recv.addr[7]~input_o\ : std_logic;
SIGNAL \recv.addr[6]~input_o\ : std_logic;
SIGNAL \recv.addr[5]~input_o\ : std_logic;
SIGNAL \recv.addr[4]~input_o\ : std_logic;
SIGNAL \pd_in_word~1_combout\ : std_logic;
SIGNAL \recv.data[24]~input_o\ : std_logic;
SIGNAL \recv.data[25]~input_o\ : std_logic;
SIGNAL \recv.data[27]~input_o\ : std_logic;
SIGNAL \recv.data[26]~input_o\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \pd_in_valid~0_combout\ : std_logic;
SIGNAL \pd_in_valid~q\ : std_logic;
SIGNAL \u_pd_asp|in_valid_r~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|in_valid_r~q\ : std_logic;
SIGNAL \pd_in_word~7_combout\ : std_logic;
SIGNAL \pd_in_word~8_combout\ : std_logic;
SIGNAL \pd_in_word~4_combout\ : std_logic;
SIGNAL \u_pd_asp|in_word_r[25]~feeder_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \pd_in_word~2_combout\ : std_logic;
SIGNAL \pd_in_word~3_combout\ : std_logic;
SIGNAL \pd_in_word~5_combout\ : std_logic;
SIGNAL \pd_in_word~6_combout\ : std_logic;
SIGNAL \u_pd_asp|enabled_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|enabled_r~1_combout\ : std_logic;
SIGNAL \u_pd_asp|enabled_r~q\ : std_logic;
SIGNAL \u_pd_asp|u_core|sample_accepted~0_combout\ : std_logic;
SIGNAL \u_pd_asp|core_clear~1_combout\ : std_logic;
SIGNAL \u_pd_asp|core_clear~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|first_seen_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|first_seen_r~q\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~1_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|process_0~0_combout\ : std_logic;
SIGNAL \recv.data[13]~input_o\ : std_logic;
SIGNAL \recv.data[17]~input_o\ : std_logic;
SIGNAL \cor_low_seen_r~0_combout\ : std_logic;
SIGNAL \cor_low_seen_r~1_combout\ : std_logic;
SIGNAL \cor_low_seen_r~2_combout\ : std_logic;
SIGNAL \cor_low_seen_r~q\ : std_logic;
SIGNAL \pd_in_word[18]~13_combout\ : std_logic;
SIGNAL \pd_in_word[18]~11_combout\ : std_logic;
SIGNAL \pd_in_word[18]~12_combout\ : std_logic;
SIGNAL \pd_in_word~16_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|counter_r[17]~1_combout\ : std_logic;
SIGNAL \recv.data[16]~input_o\ : std_logic;
SIGNAL \recv.data[12]~input_o\ : std_logic;
SIGNAL \pd_in_word~17_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~13_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~1_combout\ : std_logic;
SIGNAL \recv.data[19]~input_o\ : std_logic;
SIGNAL \recv.data[15]~input_o\ : std_logic;
SIGNAL \pd_in_word~14_combout\ : std_logic;
SIGNAL \recv.data[14]~input_o\ : std_logic;
SIGNAL \recv.data[18]~input_o\ : std_logic;
SIGNAL \pd_in_word~15_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~15_combout\ : std_logic;
SIGNAL \pd_in_word[14]~feeder_combout\ : std_logic;
SIGNAL \recv.data[10]~input_o\ : std_logic;
SIGNAL \pd_in_word[14]~9_combout\ : std_logic;
SIGNAL \pd_in_word[14]~10_combout\ : std_logic;
SIGNAL \pd_in_word[15]~feeder_combout\ : std_logic;
SIGNAL \recv.data[11]~input_o\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~14_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~16_combout\ : std_logic;
SIGNAL \pd_in_word[12]~feeder_combout\ : std_logic;
SIGNAL \recv.data[8]~input_o\ : std_logic;
SIGNAL \pd_in_word[13]~feeder_combout\ : std_logic;
SIGNAL \recv.data[9]~input_o\ : std_logic;
SIGNAL \u_pd_asp|in_word_r[13]~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~3_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~2_combout\ : std_logic;
SIGNAL \pd_in_word[10]~feeder_combout\ : std_logic;
SIGNAL \recv.data[6]~input_o\ : std_logic;
SIGNAL \pd_in_word[11]~feeder_combout\ : std_logic;
SIGNAL \recv.data[7]~input_o\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~11_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~12_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~17_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~18_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~19_combout\ : std_logic;
SIGNAL \pd_in_word[6]~feeder_combout\ : std_logic;
SIGNAL \recv.data[2]~input_o\ : std_logic;
SIGNAL \pd_in_word[7]~feeder_combout\ : std_logic;
SIGNAL \recv.data[3]~input_o\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~1_combout\ : std_logic;
SIGNAL \pd_in_word[9]~feeder_combout\ : std_logic;
SIGNAL \recv.data[5]~input_o\ : std_logic;
SIGNAL \pd_in_word[8]~feeder_combout\ : std_logic;
SIGNAL \recv.data[4]~input_o\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~0_combout\ : std_logic;
SIGNAL \pd_in_word[2]~feeder_combout\ : std_logic;
SIGNAL \cor_low_payload_r~4_combout\ : std_logic;
SIGNAL \cor_low_payload_r[16]~1_combout\ : std_logic;
SIGNAL \pd_in_word[3]~feeder_combout\ : std_logic;
SIGNAL \cor_low_payload_r~3_combout\ : std_logic;
SIGNAL \u_pd_asp|in_word_r[3]~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~4_combout\ : std_logic;
SIGNAL \recv.data[1]~input_o\ : std_logic;
SIGNAL \pd_in_word[1]~feeder_combout\ : std_logic;
SIGNAL \cor_low_payload_r~0_combout\ : std_logic;
SIGNAL \recv.data[0]~input_o\ : std_logic;
SIGNAL \pd_in_word[0]~feeder_combout\ : std_logic;
SIGNAL \cor_low_payload_r~2_combout\ : std_logic;
SIGNAL \u_pd_asp|in_word_r[0]~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~2_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~3_combout\ : std_logic;
SIGNAL \pd_in_word[5]~feeder_combout\ : std_logic;
SIGNAL \pd_in_word[4]~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~5_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~6_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~8_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~9_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~7_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~10_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~4_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~11_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~13_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~12_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~14_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~21_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~5_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~6_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~15_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~16_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~17_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~8_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~7_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~9_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~10_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~18_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~19_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|state_r~q\ : std_logic;
SIGNAL \u_pd_asp|core_clear~combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan0~20_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|counter_r[17]~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~2\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~5_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~6\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~9_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~10\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~13_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~14\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~17_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~18\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~21_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~22\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~25_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~26\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~29_sumout\ : std_logic;
SIGNAL \u_pd_asp|cfg_min_spacing~2_combout\ : std_logic;
SIGNAL \u_pd_asp|cfg_output_dest[1]~0_combout\ : std_logic;
SIGNAL \u_pd_asp|cfg_min_spacing~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~7_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|qualifies_threshold~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|qualifies_threshold~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|qualifies_threshold~2_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~2_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~3_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~4_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~30\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~33_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~34\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~37_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~38\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~41_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~42\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~45_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~46\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~49_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~50\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~53_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~54\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~57_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~58\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~61_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~62\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~65_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~8_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~66\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~69_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~70\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~73_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~74\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~93_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~94\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~89_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~90\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~85_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~86\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~81_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~82\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add0~77_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~10_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~9_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~11_combout\ : std_logic;
SIGNAL \u_pd_asp|cfg_min_spacing~0_combout\ : std_logic;
SIGNAL \u_pd_asp|cfg_min_spacing[3]~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~5_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|LessThan1~6_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|missed_peaks_r[0]~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|first_peak_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|first_peak_r~q\ : std_logic;
SIGNAL \u_pd_asp|u_core|peak_valid_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|peak_valid_r~q\ : std_logic;
SIGNAL \u_pd_asp|out_pending_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|out_pending_r~q\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~1_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|peak_count_r[16]~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~1_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r[14]~0_combout\ : std_logic;
SIGNAL \u_pd_asp|cmd_status_error~0_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~1_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r[14]~2_combout\ : std_logic;
SIGNAL \data~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~2\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~5_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~2\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~5_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~3_combout\ : std_logic;
SIGNAL \data~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~6\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~9_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~6\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~9_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~4_combout\ : std_logic;
SIGNAL \data~2_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~10\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~13_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~10\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~13_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~5_combout\ : std_logic;
SIGNAL \data~3_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~14\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~17_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~14\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~17_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|peak_count_r[4]~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~6_combout\ : std_logic;
SIGNAL \data~4_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~18\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~21_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~18\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~21_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~7_combout\ : std_logic;
SIGNAL \data~5_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~22\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~25_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~22\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~25_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~8_combout\ : std_logic;
SIGNAL \data~6_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~26\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~29_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~26\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~29_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~9_combout\ : std_logic;
SIGNAL \data~7_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~30\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~33_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~30\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~33_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~10_combout\ : std_logic;
SIGNAL \data~8_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~34\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~37_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~34\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~37_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~11_combout\ : std_logic;
SIGNAL \data~9_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~38\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~41_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~38\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~41_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~12_combout\ : std_logic;
SIGNAL \data~10_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~42\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~45_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~42\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~45_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~13_combout\ : std_logic;
SIGNAL \data~11_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~46\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~49_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|peak_count_r[12]~feeder_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~46\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~49_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~14_combout\ : std_logic;
SIGNAL \data~12_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~50\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~53_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~50\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~53_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~15_combout\ : std_logic;
SIGNAL \data~13_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~54\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~57_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~54\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~57_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~16_combout\ : std_logic;
SIGNAL \data~14_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~58\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~61_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~58\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~61_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~17_combout\ : std_logic;
SIGNAL \data~15_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~62\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~65_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~62\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~65_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~18_combout\ : std_logic;
SIGNAL \data~16_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~66\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~69_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~66\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~69_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~19_combout\ : std_logic;
SIGNAL \data~17_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~70\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~73_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~70\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~73_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~20_combout\ : std_logic;
SIGNAL \data~18_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~74\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add1~77_sumout\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~74\ : std_logic;
SIGNAL \u_pd_asp|u_core|Add2~77_sumout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~21_combout\ : std_logic;
SIGNAL \data~19_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~22_combout\ : std_logic;
SIGNAL \data~20_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~23_combout\ : std_logic;
SIGNAL \data~21_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~24_combout\ : std_logic;
SIGNAL \data~22_combout\ : std_logic;
SIGNAL \data~23_combout\ : std_logic;
SIGNAL \data~24_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r[14]~25_combout\ : std_logic;
SIGNAL \data~25_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~26_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~27_combout\ : std_logic;
SIGNAL \addr~0_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~28_combout\ : std_logic;
SIGNAL \addr~1_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r~29_combout\ : std_logic;
SIGNAL \addr~2_combout\ : std_logic;
SIGNAL \u_pd_asp|out_word_r\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|total_peaks_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|in_word_r\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|peak_count_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|cfg_output_dest\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|missed_peaks_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|counter_r\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \u_pd_asp|cfg_min_spacing\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|last_corr_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|cfg_threshold\ : std_logic_vector(3 DOWNTO 0);
SIGNAL pd_in_word : std_logic_vector(31 DOWNTO 0);
SIGNAL cor_low_payload_r : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|ALT_INV_out_word_r\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \ALT_INV_recv.data[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.addr[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_recv.data[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_init~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_cor_low_seen_r~1_combout\ : std_logic;
SIGNAL \ALT_INV_pd_in_word[18]~13_combout\ : std_logic;
SIGNAL \ALT_INV_pd_in_word[18]~12_combout\ : std_logic;
SIGNAL \ALT_INV_pd_in_word[18]~11_combout\ : std_logic;
SIGNAL \ALT_INV_cor_low_seen_r~0_combout\ : std_logic;
SIGNAL \ALT_INV_cor_low_seen_r~q\ : std_logic;
SIGNAL \ALT_INV_Mux33~0_combout\ : std_logic;
SIGNAL \ALT_INV_pd_in_word~2_combout\ : std_logic;
SIGNAL \ALT_INV_pd_in_word~1_combout\ : std_logic;
SIGNAL \ALT_INV_pd_in_word~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux12~0_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_cfg_min_spacing~0_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_enabled_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~18_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~17_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~16_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~15_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~14_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~13_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~12_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~11_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~10_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~9_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~8_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~7_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~6_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~5_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~21_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~20_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_core_clear~combout\ : std_logic;
SIGNAL \ALT_INV_pd_in_valid~q\ : std_logic;
SIGNAL ALT_INV_pd_in_word : std_logic_vector(25 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|ALT_INV_missed_peaks_r[0]~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_qualifies_threshold~2_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_qualifies_threshold~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_qualifies_threshold~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~11_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~10_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~9_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~8_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~7_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~6_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~5_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~4_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_cfg_min_spacing\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~4_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~19_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~18_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~17_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~16_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~15_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~14_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~13_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~12_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~11_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~3_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~2_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~10_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~9_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~8_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~7_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~6_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~5_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_first_seen_r~q\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_first_peak_r~q\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_core_clear~1_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_enabled_r~q\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_state_r~q\ : std_logic;
SIGNAL \ALT_INV_pd_reset~combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_cmd_status_error~0_combout\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_core_clear~0_combout\ : std_logic;
SIGNAL \u_pd_asp|u_core|ALT_INV_peak_valid_r~q\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_out_pending_r~q\ : std_logic;
SIGNAL \u_pd_asp|ALT_INV_cfg_threshold\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|ALT_INV_counter_r\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|ALT_INV_last_corr_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|ALT_INV_in_word_r\ : std_logic_vector(29 DOWNTO 0);
SIGNAL \u_pd_asp|ALT_INV_cfg_output_dest\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|ALT_INV_total_peaks_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|ALT_INV_missed_peaks_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|u_core|ALT_INV_peak_count_r\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \u_pd_asp|ALT_INV_in_valid_r~q\ : std_logic;

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
\u_pd_asp|ALT_INV_out_word_r\(3) <= NOT \u_pd_asp|out_word_r\(3);
\u_pd_asp|ALT_INV_out_word_r\(2) <= NOT \u_pd_asp|out_word_r\(2);
\u_pd_asp|ALT_INV_out_word_r\(1) <= NOT \u_pd_asp|out_word_r\(1);
\u_pd_asp|ALT_INV_out_word_r\(0) <= NOT \u_pd_asp|out_word_r\(0);
\ALT_INV_recv.data[10]~input_o\ <= NOT \recv.data[10]~input_o\;
\ALT_INV_recv.data[11]~input_o\ <= NOT \recv.data[11]~input_o\;
\ALT_INV_recv.data[12]~input_o\ <= NOT \recv.data[12]~input_o\;
\ALT_INV_recv.data[16]~input_o\ <= NOT \recv.data[16]~input_o\;
\ALT_INV_recv.data[13]~input_o\ <= NOT \recv.data[13]~input_o\;
\ALT_INV_recv.data[17]~input_o\ <= NOT \recv.data[17]~input_o\;
\ALT_INV_recv.data[14]~input_o\ <= NOT \recv.data[14]~input_o\;
\ALT_INV_recv.data[18]~input_o\ <= NOT \recv.data[18]~input_o\;
\ALT_INV_recv.data[15]~input_o\ <= NOT \recv.data[15]~input_o\;
\ALT_INV_recv.data[19]~input_o\ <= NOT \recv.data[19]~input_o\;
\ALT_INV_recv.data[0]~input_o\ <= NOT \recv.data[0]~input_o\;
\ALT_INV_recv.data[1]~input_o\ <= NOT \recv.data[1]~input_o\;
\ALT_INV_recv.data[2]~input_o\ <= NOT \recv.data[2]~input_o\;
\ALT_INV_recv.data[6]~input_o\ <= NOT \recv.data[6]~input_o\;
\ALT_INV_recv.data[3]~input_o\ <= NOT \recv.data[3]~input_o\;
\ALT_INV_recv.data[7]~input_o\ <= NOT \recv.data[7]~input_o\;
\ALT_INV_recv.data[4]~input_o\ <= NOT \recv.data[4]~input_o\;
\ALT_INV_recv.data[8]~input_o\ <= NOT \recv.data[8]~input_o\;
\ALT_INV_recv.data[5]~input_o\ <= NOT \recv.data[5]~input_o\;
\ALT_INV_recv.data[9]~input_o\ <= NOT \recv.data[9]~input_o\;
\ALT_INV_recv.addr[7]~input_o\ <= NOT \recv.addr[7]~input_o\;
\ALT_INV_recv.addr[6]~input_o\ <= NOT \recv.addr[6]~input_o\;
\ALT_INV_recv.addr[5]~input_o\ <= NOT \recv.addr[5]~input_o\;
\ALT_INV_recv.addr[4]~input_o\ <= NOT \recv.addr[4]~input_o\;
\ALT_INV_recv.addr[3]~input_o\ <= NOT \recv.addr[3]~input_o\;
\ALT_INV_recv.addr[2]~input_o\ <= NOT \recv.addr[2]~input_o\;
\ALT_INV_recv.addr[1]~input_o\ <= NOT \recv.addr[1]~input_o\;
\ALT_INV_recv.addr[0]~input_o\ <= NOT \recv.addr[0]~input_o\;
\ALT_INV_recv.data[31]~input_o\ <= NOT \recv.data[31]~input_o\;
\ALT_INV_recv.data[30]~input_o\ <= NOT \recv.data[30]~input_o\;
\ALT_INV_recv.data[28]~input_o\ <= NOT \recv.data[28]~input_o\;
\ALT_INV_recv.data[27]~input_o\ <= NOT \recv.data[27]~input_o\;
\ALT_INV_recv.data[26]~input_o\ <= NOT \recv.data[26]~input_o\;
\ALT_INV_recv.data[25]~input_o\ <= NOT \recv.data[25]~input_o\;
\ALT_INV_recv.data[24]~input_o\ <= NOT \recv.data[24]~input_o\;
\ALT_INV_recv.data[29]~input_o\ <= NOT \recv.data[29]~input_o\;
\ALT_INV_init~input_o\ <= NOT \init~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_cor_low_seen_r~1_combout\ <= NOT \cor_low_seen_r~1_combout\;
\ALT_INV_pd_in_word[18]~13_combout\ <= NOT \pd_in_word[18]~13_combout\;
\ALT_INV_pd_in_word[18]~12_combout\ <= NOT \pd_in_word[18]~12_combout\;
\ALT_INV_pd_in_word[18]~11_combout\ <= NOT \pd_in_word[18]~11_combout\;
\ALT_INV_cor_low_seen_r~0_combout\ <= NOT \cor_low_seen_r~0_combout\;
\ALT_INV_cor_low_seen_r~q\ <= NOT \cor_low_seen_r~q\;
\ALT_INV_Mux33~0_combout\ <= NOT \Mux33~0_combout\;
\ALT_INV_pd_in_word~2_combout\ <= NOT \pd_in_word~2_combout\;
\ALT_INV_pd_in_word~1_combout\ <= NOT \pd_in_word~1_combout\;
\ALT_INV_pd_in_word~0_combout\ <= NOT \pd_in_word~0_combout\;
\ALT_INV_Mux12~0_combout\ <= NOT \Mux12~0_combout\;
\u_pd_asp|ALT_INV_cfg_min_spacing~0_combout\ <= NOT \u_pd_asp|cfg_min_spacing~0_combout\;
\u_pd_asp|ALT_INV_enabled_r~0_combout\ <= NOT \u_pd_asp|enabled_r~0_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~18_combout\ <= NOT \u_pd_asp|u_core|state_r~18_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~17_combout\ <= NOT \u_pd_asp|u_core|state_r~17_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~16_combout\ <= NOT \u_pd_asp|u_core|state_r~16_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~15_combout\ <= NOT \u_pd_asp|u_core|state_r~15_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~14_combout\ <= NOT \u_pd_asp|u_core|state_r~14_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~13_combout\ <= NOT \u_pd_asp|u_core|state_r~13_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~12_combout\ <= NOT \u_pd_asp|u_core|state_r~12_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~11_combout\ <= NOT \u_pd_asp|u_core|state_r~11_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~10_combout\ <= NOT \u_pd_asp|u_core|state_r~10_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~9_combout\ <= NOT \u_pd_asp|u_core|state_r~9_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~8_combout\ <= NOT \u_pd_asp|u_core|state_r~8_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~7_combout\ <= NOT \u_pd_asp|u_core|state_r~7_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~6_combout\ <= NOT \u_pd_asp|u_core|state_r~6_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~5_combout\ <= NOT \u_pd_asp|u_core|state_r~5_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~21_combout\ <= NOT \u_pd_asp|u_core|LessThan0~21_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~20_combout\ <= NOT \u_pd_asp|u_core|LessThan0~20_combout\;
\u_pd_asp|ALT_INV_core_clear~combout\ <= NOT \u_pd_asp|core_clear~combout\;
\ALT_INV_pd_in_valid~q\ <= NOT \pd_in_valid~q\;
ALT_INV_pd_in_word(25) <= NOT pd_in_word(25);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r[0]~0_combout\ <= NOT \u_pd_asp|u_core|missed_peaks_r[0]~0_combout\;
\u_pd_asp|u_core|ALT_INV_qualifies_threshold~2_combout\ <= NOT \u_pd_asp|u_core|qualifies_threshold~2_combout\;
\u_pd_asp|u_core|ALT_INV_qualifies_threshold~1_combout\ <= NOT \u_pd_asp|u_core|qualifies_threshold~1_combout\;
\u_pd_asp|u_core|ALT_INV_qualifies_threshold~0_combout\ <= NOT \u_pd_asp|u_core|qualifies_threshold~0_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~11_combout\ <= NOT \u_pd_asp|u_core|LessThan1~11_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~10_combout\ <= NOT \u_pd_asp|u_core|LessThan1~10_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~9_combout\ <= NOT \u_pd_asp|u_core|LessThan1~9_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~8_combout\ <= NOT \u_pd_asp|u_core|LessThan1~8_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~7_combout\ <= NOT \u_pd_asp|u_core|LessThan1~7_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~6_combout\ <= NOT \u_pd_asp|u_core|LessThan1~6_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~5_combout\ <= NOT \u_pd_asp|u_core|LessThan1~5_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~4_combout\ <= NOT \u_pd_asp|u_core|LessThan1~4_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~3_combout\ <= NOT \u_pd_asp|u_core|LessThan1~3_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~2_combout\ <= NOT \u_pd_asp|u_core|LessThan1~2_combout\;
\u_pd_asp|ALT_INV_cfg_min_spacing\(6) <= NOT \u_pd_asp|cfg_min_spacing\(6);
\u_pd_asp|ALT_INV_cfg_min_spacing\(7) <= NOT \u_pd_asp|cfg_min_spacing\(7);
\u_pd_asp|u_core|ALT_INV_LessThan1~1_combout\ <= NOT \u_pd_asp|u_core|LessThan1~1_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan1~0_combout\ <= NOT \u_pd_asp|u_core|LessThan1~0_combout\;
\u_pd_asp|ALT_INV_cfg_min_spacing\(3) <= NOT \u_pd_asp|cfg_min_spacing\(3);
\u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\ <= NOT \u_pd_asp|u_core|sample_accepted~0_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~4_combout\ <= NOT \u_pd_asp|u_core|state_r~4_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~19_combout\ <= NOT \u_pd_asp|u_core|LessThan0~19_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~18_combout\ <= NOT \u_pd_asp|u_core|LessThan0~18_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~17_combout\ <= NOT \u_pd_asp|u_core|LessThan0~17_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~16_combout\ <= NOT \u_pd_asp|u_core|LessThan0~16_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~15_combout\ <= NOT \u_pd_asp|u_core|LessThan0~15_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~14_combout\ <= NOT \u_pd_asp|u_core|LessThan0~14_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~13_combout\ <= NOT \u_pd_asp|u_core|LessThan0~13_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~12_combout\ <= NOT \u_pd_asp|u_core|LessThan0~12_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~11_combout\ <= NOT \u_pd_asp|u_core|LessThan0~11_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~3_combout\ <= NOT \u_pd_asp|u_core|state_r~3_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~2_combout\ <= NOT \u_pd_asp|u_core|state_r~2_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~1_combout\ <= NOT \u_pd_asp|u_core|state_r~1_combout\;
\u_pd_asp|u_core|ALT_INV_state_r~0_combout\ <= NOT \u_pd_asp|u_core|state_r~0_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~10_combout\ <= NOT \u_pd_asp|u_core|LessThan0~10_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~9_combout\ <= NOT \u_pd_asp|u_core|LessThan0~9_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~8_combout\ <= NOT \u_pd_asp|u_core|LessThan0~8_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~7_combout\ <= NOT \u_pd_asp|u_core|LessThan0~7_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~6_combout\ <= NOT \u_pd_asp|u_core|LessThan0~6_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~5_combout\ <= NOT \u_pd_asp|u_core|LessThan0~5_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~4_combout\ <= NOT \u_pd_asp|u_core|LessThan0~4_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~3_combout\ <= NOT \u_pd_asp|u_core|LessThan0~3_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~2_combout\ <= NOT \u_pd_asp|u_core|LessThan0~2_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~1_combout\ <= NOT \u_pd_asp|u_core|LessThan0~1_combout\;
\u_pd_asp|u_core|ALT_INV_LessThan0~0_combout\ <= NOT \u_pd_asp|u_core|LessThan0~0_combout\;
\u_pd_asp|u_core|ALT_INV_first_seen_r~q\ <= NOT \u_pd_asp|u_core|first_seen_r~q\;
\u_pd_asp|u_core|ALT_INV_first_peak_r~q\ <= NOT \u_pd_asp|u_core|first_peak_r~q\;
\u_pd_asp|u_core|ALT_INV_process_0~0_combout\ <= NOT \u_pd_asp|u_core|process_0~0_combout\;
\u_pd_asp|ALT_INV_core_clear~1_combout\ <= NOT \u_pd_asp|core_clear~1_combout\;
\u_pd_asp|ALT_INV_enabled_r~q\ <= NOT \u_pd_asp|enabled_r~q\;
\u_pd_asp|u_core|ALT_INV_state_r~q\ <= NOT \u_pd_asp|u_core|state_r~q\;
\ALT_INV_pd_reset~combout\ <= NOT \pd_reset~combout\;
\u_pd_asp|ALT_INV_out_word_r[14]~0_combout\ <= NOT \u_pd_asp|out_word_r[14]~0_combout\;
\u_pd_asp|ALT_INV_cmd_status_error~0_combout\ <= NOT \u_pd_asp|cmd_status_error~0_combout\;
\u_pd_asp|ALT_INV_core_clear~0_combout\ <= NOT \u_pd_asp|core_clear~0_combout\;
\u_pd_asp|u_core|ALT_INV_peak_valid_r~q\ <= NOT \u_pd_asp|u_core|peak_valid_r~q\;
\u_pd_asp|ALT_INV_out_word_r\(22) <= NOT \u_pd_asp|out_word_r\(22);
\u_pd_asp|ALT_INV_out_word_r\(21) <= NOT \u_pd_asp|out_word_r\(21);
\u_pd_asp|ALT_INV_out_word_r\(23) <= NOT \u_pd_asp|out_word_r\(23);
\u_pd_asp|ALT_INV_out_word_r\(20) <= NOT \u_pd_asp|out_word_r\(20);
\u_pd_asp|ALT_INV_out_word_r\(30) <= NOT \u_pd_asp|out_word_r\(30);
\u_pd_asp|ALT_INV_out_word_r\(29) <= NOT \u_pd_asp|out_word_r\(29);
\u_pd_asp|ALT_INV_out_word_r\(28) <= NOT \u_pd_asp|out_word_r\(28);
\u_pd_asp|ALT_INV_out_word_r\(26) <= NOT \u_pd_asp|out_word_r\(26);
\u_pd_asp|ALT_INV_out_word_r\(25) <= NOT \u_pd_asp|out_word_r\(25);
\u_pd_asp|ALT_INV_out_word_r\(24) <= NOT \u_pd_asp|out_word_r\(24);
\u_pd_asp|ALT_INV_out_pending_r~q\ <= NOT \u_pd_asp|out_pending_r~q\;
ALT_INV_pd_in_word(13) <= NOT pd_in_word(13);
ALT_INV_pd_in_word(3) <= NOT pd_in_word(3);
ALT_INV_pd_in_word(0) <= NOT pd_in_word(0);
\u_pd_asp|ALT_INV_cfg_threshold\(0) <= NOT \u_pd_asp|cfg_threshold\(0);
\u_pd_asp|ALT_INV_cfg_threshold\(1) <= NOT \u_pd_asp|cfg_threshold\(1);
\u_pd_asp|ALT_INV_cfg_threshold\(3) <= NOT \u_pd_asp|cfg_threshold\(3);
\u_pd_asp|ALT_INV_cfg_threshold\(2) <= NOT \u_pd_asp|cfg_threshold\(2);
\u_pd_asp|u_core|ALT_INV_counter_r\(19) <= NOT \u_pd_asp|u_core|counter_r\(19);
\u_pd_asp|u_core|ALT_INV_counter_r\(20) <= NOT \u_pd_asp|u_core|counter_r\(20);
\u_pd_asp|u_core|ALT_INV_counter_r\(21) <= NOT \u_pd_asp|u_core|counter_r\(21);
\u_pd_asp|u_core|ALT_INV_counter_r\(22) <= NOT \u_pd_asp|u_core|counter_r\(22);
\u_pd_asp|u_core|ALT_INV_counter_r\(23) <= NOT \u_pd_asp|u_core|counter_r\(23);
\u_pd_asp|u_core|ALT_INV_counter_r\(18) <= NOT \u_pd_asp|u_core|counter_r\(18);
\u_pd_asp|ALT_INV_cfg_min_spacing\(4) <= NOT \u_pd_asp|cfg_min_spacing\(4);
\u_pd_asp|ALT_INV_cfg_min_spacing\(5) <= NOT \u_pd_asp|cfg_min_spacing\(5);
\u_pd_asp|ALT_INV_cfg_min_spacing\(0) <= NOT \u_pd_asp|cfg_min_spacing\(0);
\u_pd_asp|ALT_INV_cfg_min_spacing\(1) <= NOT \u_pd_asp|cfg_min_spacing\(1);
\u_pd_asp|ALT_INV_cfg_min_spacing\(2) <= NOT \u_pd_asp|cfg_min_spacing\(2);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(10) <= NOT \u_pd_asp|u_core|last_corr_r\(10);
\u_pd_asp|ALT_INV_in_word_r\(10) <= NOT \u_pd_asp|in_word_r\(10);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(11) <= NOT \u_pd_asp|u_core|last_corr_r\(11);
\u_pd_asp|ALT_INV_in_word_r\(11) <= NOT \u_pd_asp|in_word_r\(11);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(12) <= NOT \u_pd_asp|u_core|last_corr_r\(12);
\u_pd_asp|ALT_INV_in_word_r\(12) <= NOT \u_pd_asp|in_word_r\(12);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(13) <= NOT \u_pd_asp|u_core|last_corr_r\(13);
\u_pd_asp|ALT_INV_in_word_r\(13) <= NOT \u_pd_asp|in_word_r\(13);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(14) <= NOT \u_pd_asp|u_core|last_corr_r\(14);
\u_pd_asp|ALT_INV_in_word_r\(14) <= NOT \u_pd_asp|in_word_r\(14);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(15) <= NOT \u_pd_asp|u_core|last_corr_r\(15);
\u_pd_asp|ALT_INV_in_word_r\(15) <= NOT \u_pd_asp|in_word_r\(15);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(16) <= NOT \u_pd_asp|u_core|last_corr_r\(16);
\u_pd_asp|ALT_INV_in_word_r\(16) <= NOT \u_pd_asp|in_word_r\(16);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(17) <= NOT \u_pd_asp|u_core|last_corr_r\(17);
\u_pd_asp|ALT_INV_in_word_r\(17) <= NOT \u_pd_asp|in_word_r\(17);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(18) <= NOT \u_pd_asp|u_core|last_corr_r\(18);
\u_pd_asp|ALT_INV_in_word_r\(18) <= NOT \u_pd_asp|in_word_r\(18);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(19) <= NOT \u_pd_asp|u_core|last_corr_r\(19);
\u_pd_asp|ALT_INV_in_word_r\(19) <= NOT \u_pd_asp|in_word_r\(19);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(4) <= NOT \u_pd_asp|u_core|last_corr_r\(4);
\u_pd_asp|ALT_INV_in_word_r\(4) <= NOT \u_pd_asp|in_word_r\(4);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(5) <= NOT \u_pd_asp|u_core|last_corr_r\(5);
\u_pd_asp|ALT_INV_in_word_r\(5) <= NOT \u_pd_asp|in_word_r\(5);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(2) <= NOT \u_pd_asp|u_core|last_corr_r\(2);
\u_pd_asp|ALT_INV_in_word_r\(2) <= NOT \u_pd_asp|in_word_r\(2);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(3) <= NOT \u_pd_asp|u_core|last_corr_r\(3);
\u_pd_asp|ALT_INV_in_word_r\(3) <= NOT \u_pd_asp|in_word_r\(3);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(0) <= NOT \u_pd_asp|u_core|last_corr_r\(0);
\u_pd_asp|ALT_INV_in_word_r\(0) <= NOT \u_pd_asp|in_word_r\(0);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(1) <= NOT \u_pd_asp|u_core|last_corr_r\(1);
\u_pd_asp|ALT_INV_in_word_r\(1) <= NOT \u_pd_asp|in_word_r\(1);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(6) <= NOT \u_pd_asp|u_core|last_corr_r\(6);
\u_pd_asp|ALT_INV_in_word_r\(6) <= NOT \u_pd_asp|in_word_r\(6);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(7) <= NOT \u_pd_asp|u_core|last_corr_r\(7);
\u_pd_asp|ALT_INV_in_word_r\(7) <= NOT \u_pd_asp|in_word_r\(7);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(8) <= NOT \u_pd_asp|u_core|last_corr_r\(8);
\u_pd_asp|ALT_INV_in_word_r\(8) <= NOT \u_pd_asp|in_word_r\(8);
\u_pd_asp|u_core|ALT_INV_last_corr_r\(9) <= NOT \u_pd_asp|u_core|last_corr_r\(9);
\u_pd_asp|ALT_INV_in_word_r\(9) <= NOT \u_pd_asp|in_word_r\(9);
\u_pd_asp|ALT_INV_cfg_output_dest\(2) <= NOT \u_pd_asp|cfg_output_dest\(2);
\u_pd_asp|ALT_INV_cfg_output_dest\(1) <= NOT \u_pd_asp|cfg_output_dest\(1);
\u_pd_asp|ALT_INV_cfg_output_dest\(3) <= NOT \u_pd_asp|cfg_output_dest\(3);
\u_pd_asp|ALT_INV_cfg_output_dest\(0) <= NOT \u_pd_asp|cfg_output_dest\(0);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(19) <= NOT \u_pd_asp|u_core|total_peaks_r\(19);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(19) <= NOT \u_pd_asp|u_core|missed_peaks_r\(19);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(19) <= NOT \u_pd_asp|u_core|peak_count_r\(19);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(18) <= NOT \u_pd_asp|u_core|total_peaks_r\(18);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(18) <= NOT \u_pd_asp|u_core|missed_peaks_r\(18);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(18) <= NOT \u_pd_asp|u_core|peak_count_r\(18);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(17) <= NOT \u_pd_asp|u_core|total_peaks_r\(17);
\u_pd_asp|u_core|ALT_INV_counter_r\(17) <= NOT \u_pd_asp|u_core|counter_r\(17);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(17) <= NOT \u_pd_asp|u_core|missed_peaks_r\(17);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(17) <= NOT \u_pd_asp|u_core|peak_count_r\(17);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(16) <= NOT \u_pd_asp|u_core|total_peaks_r\(16);
\u_pd_asp|u_core|ALT_INV_counter_r\(16) <= NOT \u_pd_asp|u_core|counter_r\(16);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(16) <= NOT \u_pd_asp|u_core|missed_peaks_r\(16);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(16) <= NOT \u_pd_asp|u_core|peak_count_r\(16);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(15) <= NOT \u_pd_asp|u_core|total_peaks_r\(15);
\u_pd_asp|u_core|ALT_INV_counter_r\(15) <= NOT \u_pd_asp|u_core|counter_r\(15);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(15) <= NOT \u_pd_asp|u_core|missed_peaks_r\(15);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(15) <= NOT \u_pd_asp|u_core|peak_count_r\(15);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(14) <= NOT \u_pd_asp|u_core|total_peaks_r\(14);
\u_pd_asp|u_core|ALT_INV_counter_r\(14) <= NOT \u_pd_asp|u_core|counter_r\(14);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(14) <= NOT \u_pd_asp|u_core|missed_peaks_r\(14);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(14) <= NOT \u_pd_asp|u_core|peak_count_r\(14);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(13) <= NOT \u_pd_asp|u_core|total_peaks_r\(13);
\u_pd_asp|u_core|ALT_INV_counter_r\(13) <= NOT \u_pd_asp|u_core|counter_r\(13);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(13) <= NOT \u_pd_asp|u_core|missed_peaks_r\(13);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(13) <= NOT \u_pd_asp|u_core|peak_count_r\(13);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(12) <= NOT \u_pd_asp|u_core|total_peaks_r\(12);
\u_pd_asp|u_core|ALT_INV_counter_r\(12) <= NOT \u_pd_asp|u_core|counter_r\(12);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(12) <= NOT \u_pd_asp|u_core|missed_peaks_r\(12);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(12) <= NOT \u_pd_asp|u_core|peak_count_r\(12);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(11) <= NOT \u_pd_asp|u_core|total_peaks_r\(11);
\u_pd_asp|u_core|ALT_INV_counter_r\(11) <= NOT \u_pd_asp|u_core|counter_r\(11);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(11) <= NOT \u_pd_asp|u_core|missed_peaks_r\(11);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(11) <= NOT \u_pd_asp|u_core|peak_count_r\(11);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(10) <= NOT \u_pd_asp|u_core|total_peaks_r\(10);
\u_pd_asp|u_core|ALT_INV_counter_r\(10) <= NOT \u_pd_asp|u_core|counter_r\(10);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(10) <= NOT \u_pd_asp|u_core|missed_peaks_r\(10);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(10) <= NOT \u_pd_asp|u_core|peak_count_r\(10);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(9) <= NOT \u_pd_asp|u_core|total_peaks_r\(9);
\u_pd_asp|u_core|ALT_INV_counter_r\(9) <= NOT \u_pd_asp|u_core|counter_r\(9);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(9) <= NOT \u_pd_asp|u_core|missed_peaks_r\(9);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(9) <= NOT \u_pd_asp|u_core|peak_count_r\(9);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(8) <= NOT \u_pd_asp|u_core|total_peaks_r\(8);
\u_pd_asp|u_core|ALT_INV_counter_r\(8) <= NOT \u_pd_asp|u_core|counter_r\(8);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(8) <= NOT \u_pd_asp|u_core|missed_peaks_r\(8);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(8) <= NOT \u_pd_asp|u_core|peak_count_r\(8);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(7) <= NOT \u_pd_asp|u_core|total_peaks_r\(7);
\u_pd_asp|u_core|ALT_INV_counter_r\(7) <= NOT \u_pd_asp|u_core|counter_r\(7);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(7) <= NOT \u_pd_asp|u_core|missed_peaks_r\(7);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(7) <= NOT \u_pd_asp|u_core|peak_count_r\(7);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(6) <= NOT \u_pd_asp|u_core|total_peaks_r\(6);
\u_pd_asp|u_core|ALT_INV_counter_r\(6) <= NOT \u_pd_asp|u_core|counter_r\(6);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(6) <= NOT \u_pd_asp|u_core|missed_peaks_r\(6);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(6) <= NOT \u_pd_asp|u_core|peak_count_r\(6);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(5) <= NOT \u_pd_asp|u_core|total_peaks_r\(5);
\u_pd_asp|u_core|ALT_INV_counter_r\(5) <= NOT \u_pd_asp|u_core|counter_r\(5);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(5) <= NOT \u_pd_asp|u_core|missed_peaks_r\(5);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(5) <= NOT \u_pd_asp|u_core|peak_count_r\(5);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(4) <= NOT \u_pd_asp|u_core|total_peaks_r\(4);
\u_pd_asp|u_core|ALT_INV_counter_r\(4) <= NOT \u_pd_asp|u_core|counter_r\(4);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(4) <= NOT \u_pd_asp|u_core|missed_peaks_r\(4);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(4) <= NOT \u_pd_asp|u_core|peak_count_r\(4);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(3) <= NOT \u_pd_asp|u_core|total_peaks_r\(3);
\u_pd_asp|u_core|ALT_INV_counter_r\(3) <= NOT \u_pd_asp|u_core|counter_r\(3);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(3) <= NOT \u_pd_asp|u_core|missed_peaks_r\(3);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(3) <= NOT \u_pd_asp|u_core|peak_count_r\(3);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(2) <= NOT \u_pd_asp|u_core|total_peaks_r\(2);
\u_pd_asp|u_core|ALT_INV_counter_r\(2) <= NOT \u_pd_asp|u_core|counter_r\(2);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(2) <= NOT \u_pd_asp|u_core|missed_peaks_r\(2);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(2) <= NOT \u_pd_asp|u_core|peak_count_r\(2);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(1) <= NOT \u_pd_asp|u_core|total_peaks_r\(1);
\u_pd_asp|u_core|ALT_INV_counter_r\(1) <= NOT \u_pd_asp|u_core|counter_r\(1);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(1) <= NOT \u_pd_asp|u_core|missed_peaks_r\(1);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(1) <= NOT \u_pd_asp|u_core|peak_count_r\(1);
\u_pd_asp|u_core|ALT_INV_total_peaks_r\(0) <= NOT \u_pd_asp|u_core|total_peaks_r\(0);
\u_pd_asp|u_core|ALT_INV_counter_r\(0) <= NOT \u_pd_asp|u_core|counter_r\(0);
\u_pd_asp|u_core|ALT_INV_missed_peaks_r\(0) <= NOT \u_pd_asp|u_core|missed_peaks_r\(0);
\u_pd_asp|u_core|ALT_INV_peak_count_r\(0) <= NOT \u_pd_asp|u_core|peak_count_r\(0);
\u_pd_asp|ALT_INV_in_word_r\(22) <= NOT \u_pd_asp|in_word_r\(22);
\u_pd_asp|ALT_INV_in_valid_r~q\ <= NOT \u_pd_asp|in_valid_r~q\;
\u_pd_asp|ALT_INV_in_word_r\(29) <= NOT \u_pd_asp|in_word_r\(29);
\u_pd_asp|ALT_INV_in_word_r\(28) <= NOT \u_pd_asp|in_word_r\(28);
\u_pd_asp|ALT_INV_in_word_r\(27) <= NOT \u_pd_asp|in_word_r\(27);
\u_pd_asp|ALT_INV_in_word_r\(26) <= NOT \u_pd_asp|in_word_r\(26);
\u_pd_asp|ALT_INV_in_word_r\(25) <= NOT \u_pd_asp|in_word_r\(25);
\u_pd_asp|ALT_INV_in_word_r\(24) <= NOT \u_pd_asp|in_word_r\(24);
\u_pd_asp|ALT_INV_out_word_r\(19) <= NOT \u_pd_asp|out_word_r\(19);
\u_pd_asp|ALT_INV_out_word_r\(18) <= NOT \u_pd_asp|out_word_r\(18);
\u_pd_asp|ALT_INV_out_word_r\(17) <= NOT \u_pd_asp|out_word_r\(17);
\u_pd_asp|ALT_INV_out_word_r\(16) <= NOT \u_pd_asp|out_word_r\(16);
\u_pd_asp|ALT_INV_out_word_r\(15) <= NOT \u_pd_asp|out_word_r\(15);
\u_pd_asp|ALT_INV_out_word_r\(14) <= NOT \u_pd_asp|out_word_r\(14);
\u_pd_asp|ALT_INV_out_word_r\(13) <= NOT \u_pd_asp|out_word_r\(13);
\u_pd_asp|ALT_INV_out_word_r\(12) <= NOT \u_pd_asp|out_word_r\(12);
\u_pd_asp|ALT_INV_out_word_r\(11) <= NOT \u_pd_asp|out_word_r\(11);
\u_pd_asp|ALT_INV_out_word_r\(10) <= NOT \u_pd_asp|out_word_r\(10);
\u_pd_asp|ALT_INV_out_word_r\(9) <= NOT \u_pd_asp|out_word_r\(9);
\u_pd_asp|ALT_INV_out_word_r\(8) <= NOT \u_pd_asp|out_word_r\(8);
\u_pd_asp|ALT_INV_out_word_r\(7) <= NOT \u_pd_asp|out_word_r\(7);
\u_pd_asp|ALT_INV_out_word_r\(6) <= NOT \u_pd_asp|out_word_r\(6);
\u_pd_asp|ALT_INV_out_word_r\(5) <= NOT \u_pd_asp|out_word_r\(5);
\u_pd_asp|ALT_INV_out_word_r\(4) <= NOT \u_pd_asp|out_word_r\(4);

-- Location: IOOBUF_X50_Y0_N76
\send.data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~0_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(0));

-- Location: IOOBUF_X6_Y0_N36
\send.data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~1_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(1));

-- Location: IOOBUF_X8_Y0_N19
\send.data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~2_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(2));

-- Location: IOOBUF_X2_Y0_N59
\send.data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~3_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(3));

-- Location: IOOBUF_X38_Y0_N19
\send.data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~4_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(4));

-- Location: IOOBUF_X26_Y81_N93
\send.data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~5_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(5));

-- Location: IOOBUF_X28_Y0_N36
\send.data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~6_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(6));

-- Location: IOOBUF_X4_Y0_N19
\send.data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~7_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(7));

-- Location: IOOBUF_X26_Y81_N76
\send.data[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~8_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(8));

-- Location: IOOBUF_X8_Y0_N36
\send.data[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~9_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(9));

-- Location: IOOBUF_X56_Y0_N2
\send.data[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~10_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(10));

-- Location: IOOBUF_X52_Y0_N36
\send.data[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~11_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(11));

-- Location: IOOBUF_X89_Y6_N5
\send.data[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~12_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(12));

-- Location: IOOBUF_X2_Y0_N93
\send.data[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~13_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(13));

-- Location: IOOBUF_X36_Y0_N19
\send.data[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~14_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(14));

-- Location: IOOBUF_X4_Y0_N53
\send.data[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~15_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(15));

-- Location: IOOBUF_X8_Y0_N53
\send.data[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~16_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(16));

-- Location: IOOBUF_X26_Y0_N59
\send.data[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~17_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(17));

-- Location: IOOBUF_X8_Y0_N2
\send.data[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~18_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(18));

-- Location: IOOBUF_X40_Y0_N19
\send.data[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~19_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(19));

-- Location: IOOBUF_X70_Y0_N19
\send.data[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_send.data\(20));

-- Location: IOOBUF_X89_Y37_N5
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

-- Location: IOOBUF_X26_Y0_N93
\send.data[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \u_pd_asp|out_pending_r~q\,
	devoe => ww_devoe,
	o => \ww_send.data\(22));

-- Location: IOOBUF_X72_Y81_N53
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

-- Location: IOOBUF_X4_Y0_N2
\send.data[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~20_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(24));

-- Location: IOOBUF_X54_Y0_N53
\send.data[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~21_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(25));

-- Location: IOOBUF_X52_Y0_N53
\send.data[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~22_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(26));

-- Location: IOOBUF_X28_Y81_N19
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

-- Location: IOOBUF_X89_Y6_N22
\send.data[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~23_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(28));

-- Location: IOOBUF_X28_Y81_N53
\send.data[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~24_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(29));

-- Location: IOOBUF_X56_Y0_N19
\send.data[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \data~25_combout\,
	devoe => ww_devoe,
	o => \ww_send.data\(30));

-- Location: IOOBUF_X82_Y81_N59
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

-- Location: IOOBUF_X6_Y0_N2
\send.addr[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addr~0_combout\,
	devoe => ww_devoe,
	o => \ww_send.addr\(0));

-- Location: IOOBUF_X26_Y81_N42
\send.addr[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addr~1_combout\,
	devoe => ww_devoe,
	o => \ww_send.addr\(1));

-- Location: IOOBUF_X6_Y0_N19
\send.addr[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addr~2_combout\,
	devoe => ww_devoe,
	o => \ww_send.addr\(2));

-- Location: IOOBUF_X52_Y81_N53
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

-- Location: IOOBUF_X62_Y81_N53
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

-- Location: IOOBUF_X58_Y81_N42
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

-- Location: IOOBUF_X82_Y81_N76
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

-- Location: IOOBUF_X89_Y8_N56
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

-- Location: IOIBUF_X89_Y35_N61
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

-- Location: IOIBUF_X26_Y0_N75
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X26_Y0_N41
\init~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_init,
	o => \init~input_o\);

-- Location: LABCELL_X19_Y5_N45
pd_reset : cyclonev_lcell_comb
-- Equation(s):
-- \pd_reset~combout\ = (\init~input_o\) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010111110101111101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_init~input_o\,
	combout => \pd_reset~combout\);

-- Location: IOIBUF_X40_Y0_N1
\recv.data[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(31),
	o => \recv.data[31]~input_o\);

-- Location: IOIBUF_X50_Y0_N92
\recv.addr[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(0),
	o => \recv.addr[0]~input_o\);

-- Location: IOIBUF_X50_Y0_N41
\recv.data[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(30),
	o => \recv.data[30]~input_o\);

-- Location: IOIBUF_X40_Y0_N35
\recv.addr[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(3),
	o => \recv.addr[3]~input_o\);

-- Location: IOIBUF_X54_Y0_N35
\recv.addr[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(1),
	o => \recv.addr[1]~input_o\);

-- Location: IOIBUF_X52_Y0_N18
\recv.addr[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(2),
	o => \recv.addr[2]~input_o\);

-- Location: LABCELL_X42_Y2_N39
\pd_in_word~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~0_combout\ = ( !\recv.addr[1]~input_o\ & ( \recv.addr[2]~input_o\ & ( (!\recv.data[31]~input_o\ & (!\recv.addr[0]~input_o\ & (!\recv.data[30]~input_o\ & !\recv.addr[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[31]~input_o\,
	datab => \ALT_INV_recv.addr[0]~input_o\,
	datac => \ALT_INV_recv.data[30]~input_o\,
	datad => \ALT_INV_recv.addr[3]~input_o\,
	datae => \ALT_INV_recv.addr[1]~input_o\,
	dataf => \ALT_INV_recv.addr[2]~input_o\,
	combout => \pd_in_word~0_combout\);

-- Location: IOIBUF_X28_Y0_N18
\recv.data[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(28),
	o => \recv.data[28]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\recv.data[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(29),
	o => \recv.data[29]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\recv.addr[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(7),
	o => \recv.addr[7]~input_o\);

-- Location: IOIBUF_X38_Y0_N52
\recv.addr[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(6),
	o => \recv.addr[6]~input_o\);

-- Location: IOIBUF_X38_Y0_N35
\recv.addr[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(5),
	o => \recv.addr[5]~input_o\);

-- Location: IOIBUF_X50_Y0_N58
\recv.addr[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.addr\(4),
	o => \recv.addr[4]~input_o\);

-- Location: LABCELL_X37_Y2_N12
\pd_in_word~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~1_combout\ = ( !\recv.addr[5]~input_o\ & ( !\recv.addr[4]~input_o\ & ( (!\recv.addr[7]~input_o\ & !\recv.addr[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.addr[7]~input_o\,
	datac => \ALT_INV_recv.addr[6]~input_o\,
	datae => \ALT_INV_recv.addr[5]~input_o\,
	dataf => \ALT_INV_recv.addr[4]~input_o\,
	combout => \pd_in_word~1_combout\);

-- Location: IOIBUF_X40_Y0_N52
\recv.data[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(24),
	o => \recv.data[24]~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\recv.data[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(25),
	o => \recv.data[25]~input_o\);

-- Location: IOIBUF_X26_Y81_N58
\recv.data[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(27),
	o => \recv.data[27]~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\recv.data[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(26),
	o => \recv.data[26]~input_o\);

-- Location: LABCELL_X23_Y5_N15
\Mux33~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = ( !\recv.data[26]~input_o\ & ( (\recv.data[24]~input_o\ & (!\recv.data[25]~input_o\ & !\recv.data[27]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000000001100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.data[24]~input_o\,
	datac => \ALT_INV_recv.data[25]~input_o\,
	datad => \ALT_INV_recv.data[27]~input_o\,
	dataf => \ALT_INV_recv.data[26]~input_o\,
	combout => \Mux33~0_combout\);

-- Location: LABCELL_X23_Y5_N39
\pd_in_valid~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_valid~0_combout\ = ( \pd_in_word~1_combout\ & ( \Mux33~0_combout\ & ( (!\pd_reset~combout\ & (\pd_in_word~0_combout\ & (\recv.data[28]~input_o\ & !\recv.data[29]~input_o\))) ) ) ) # ( \pd_in_word~1_combout\ & ( !\Mux33~0_combout\ & ( 
-- (!\pd_reset~combout\ & (\pd_in_word~0_combout\ & (!\recv.data[28]~input_o\ $ (!\recv.data[29]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100010000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_reset~combout\,
	datab => \ALT_INV_pd_in_word~0_combout\,
	datac => \ALT_INV_recv.data[28]~input_o\,
	datad => \ALT_INV_recv.data[29]~input_o\,
	datae => \ALT_INV_pd_in_word~1_combout\,
	dataf => \ALT_INV_Mux33~0_combout\,
	combout => \pd_in_valid~0_combout\);

-- Location: FF_X23_Y5_N31
pd_in_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \pd_in_valid~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pd_in_valid~q\);

-- Location: LABCELL_X18_Y5_N21
\u_pd_asp|in_valid_r~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|in_valid_r~feeder_combout\ = ( \pd_in_valid~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_pd_in_valid~q\,
	combout => \u_pd_asp|in_valid_r~feeder_combout\);

-- Location: FF_X18_Y5_N23
\u_pd_asp|in_valid_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|in_valid_r~feeder_combout\,
	sclr => \pd_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_valid_r~q\);

-- Location: FF_X23_Y5_N40
\pd_in_word[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_valid~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(22));

-- Location: FF_X18_Y5_N14
\u_pd_asp|in_word_r[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(22),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(22));

-- Location: LABCELL_X23_Y6_N27
\pd_in_word~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~7_combout\ = ( \pd_in_word~0_combout\ & ( !\pd_reset~combout\ & ( (\pd_in_word~1_combout\ & (!\recv.data[29]~input_o\ & \recv.data[28]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_in_word~1_combout\,
	datab => \ALT_INV_recv.data[29]~input_o\,
	datac => \ALT_INV_recv.data[28]~input_o\,
	datae => \ALT_INV_pd_in_word~0_combout\,
	dataf => \ALT_INV_pd_reset~combout\,
	combout => \pd_in_word~7_combout\);

-- Location: FF_X23_Y6_N28
\pd_in_word[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(28));

-- Location: FF_X18_Y5_N2
\u_pd_asp|in_word_r[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(28),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(28));

-- Location: LABCELL_X23_Y4_N39
\pd_in_word~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~8_combout\ = ( \pd_in_word~1_combout\ & ( \pd_in_word~0_combout\ & ( (!\pd_reset~combout\ & (!\Mux33~0_combout\ & (!\recv.data[28]~input_o\ & \recv.data[29]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_reset~combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_recv.data[28]~input_o\,
	datad => \ALT_INV_recv.data[29]~input_o\,
	datae => \ALT_INV_pd_in_word~1_combout\,
	dataf => \ALT_INV_pd_in_word~0_combout\,
	combout => \pd_in_word~8_combout\);

-- Location: FF_X23_Y4_N40
\pd_in_word[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(29));

-- Location: FF_X18_Y5_N5
\u_pd_asp|in_word_r[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(29),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(29));

-- Location: LABCELL_X23_Y5_N42
\pd_in_word~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~4_combout\ = ( \pd_in_word~1_combout\ & ( \recv.data[25]~input_o\ & ( (!\pd_reset~combout\ & (\pd_in_word~0_combout\ & (!\recv.data[29]~input_o\ $ (!\recv.data[28]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \ALT_INV_pd_reset~combout\,
	datad => \ALT_INV_pd_in_word~0_combout\,
	datae => \ALT_INV_pd_in_word~1_combout\,
	dataf => \ALT_INV_recv.data[25]~input_o\,
	combout => \pd_in_word~4_combout\);

-- Location: FF_X23_Y5_N43
\pd_in_word[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(25));

-- Location: LABCELL_X18_Y5_N18
\u_pd_asp|in_word_r[25]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|in_word_r[25]~feeder_combout\ = ( pd_in_word(25) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_pd_in_word(25),
	combout => \u_pd_asp|in_word_r[25]~feeder_combout\);

-- Location: FF_X18_Y5_N20
\u_pd_asp|in_word_r[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|in_word_r[25]~feeder_combout\,
	sclr => \pd_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(25));

-- Location: LABCELL_X23_Y5_N24
\Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = ( \recv.data[24]~input_o\ & ( ((\recv.data[26]~input_o\) # (\recv.data[25]~input_o\)) # (\recv.data[27]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[27]~input_o\,
	datab => \ALT_INV_recv.data[25]~input_o\,
	datac => \ALT_INV_recv.data[26]~input_o\,
	dataf => \ALT_INV_recv.data[24]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: LABCELL_X23_Y5_N57
\pd_in_word~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~2_combout\ = ( !\pd_reset~combout\ & ( (\pd_in_word~1_combout\ & \pd_in_word~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_in_word~1_combout\,
	datab => \ALT_INV_pd_in_word~0_combout\,
	dataf => \ALT_INV_pd_reset~combout\,
	combout => \pd_in_word~2_combout\);

-- Location: LABCELL_X23_Y5_N12
\pd_in_word~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~3_combout\ = ( \recv.data[28]~input_o\ & ( (\recv.data[24]~input_o\ & (!\recv.data[29]~input_o\ & \pd_in_word~2_combout\)) ) ) # ( !\recv.data[28]~input_o\ & ( (\Mux12~0_combout\ & (\recv.data[29]~input_o\ & \pd_in_word~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux12~0_combout\,
	datab => \ALT_INV_recv.data[24]~input_o\,
	datac => \ALT_INV_recv.data[29]~input_o\,
	datad => \ALT_INV_pd_in_word~2_combout\,
	dataf => \ALT_INV_recv.data[28]~input_o\,
	combout => \pd_in_word~3_combout\);

-- Location: FF_X23_Y5_N13
\pd_in_word[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(24));

-- Location: FF_X18_Y5_N17
\u_pd_asp|in_word_r[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(24),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(24));

-- Location: LABCELL_X23_Y5_N45
\pd_in_word~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~5_combout\ = ( \pd_in_word~1_combout\ & ( \recv.data[26]~input_o\ & ( (\pd_in_word~0_combout\ & (!\pd_reset~combout\ & (!\recv.data[29]~input_o\ $ (!\recv.data[28]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[29]~input_o\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \ALT_INV_pd_in_word~0_combout\,
	datad => \ALT_INV_pd_reset~combout\,
	datae => \ALT_INV_pd_in_word~1_combout\,
	dataf => \ALT_INV_recv.data[26]~input_o\,
	combout => \pd_in_word~5_combout\);

-- Location: FF_X23_Y5_N47
\pd_in_word[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(26));

-- Location: FF_X18_Y5_N29
\u_pd_asp|in_word_r[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(26),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(26));

-- Location: LABCELL_X23_Y5_N0
\pd_in_word~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~6_combout\ = ( !\pd_reset~combout\ & ( \recv.data[28]~input_o\ & ( (\recv.data[27]~input_o\ & (\pd_in_word~0_combout\ & (!\recv.data[29]~input_o\ & \pd_in_word~1_combout\))) ) ) ) # ( !\pd_reset~combout\ & ( !\recv.data[28]~input_o\ & ( 
-- (\recv.data[27]~input_o\ & (\pd_in_word~0_combout\ & (\recv.data[29]~input_o\ & \pd_in_word~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000000000000000100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[27]~input_o\,
	datab => \ALT_INV_pd_in_word~0_combout\,
	datac => \ALT_INV_recv.data[29]~input_o\,
	datad => \ALT_INV_pd_in_word~1_combout\,
	datae => \ALT_INV_pd_reset~combout\,
	dataf => \ALT_INV_recv.data[28]~input_o\,
	combout => \pd_in_word~6_combout\);

-- Location: FF_X23_Y5_N2
\pd_in_word[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(27));

-- Location: FF_X18_Y5_N32
\u_pd_asp|in_word_r[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(27),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(27));

-- Location: LABCELL_X18_Y5_N0
\u_pd_asp|enabled_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|enabled_r~0_combout\ = ( \u_pd_asp|in_word_r\(28) & ( \u_pd_asp|in_word_r\(22) & ( (!\u_pd_asp|in_word_r\(26) & (!\u_pd_asp|in_word_r\(27) & (!\u_pd_asp|in_word_r\(29) & \u_pd_asp|in_valid_r~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(26),
	datab => \u_pd_asp|ALT_INV_in_word_r\(27),
	datac => \u_pd_asp|ALT_INV_in_word_r\(29),
	datad => \u_pd_asp|ALT_INV_in_valid_r~q\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(28),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(22),
	combout => \u_pd_asp|enabled_r~0_combout\);

-- Location: MLABCELL_X21_Y5_N24
\u_pd_asp|enabled_r~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|enabled_r~1_combout\ = ( \u_pd_asp|enabled_r~q\ & ( \u_pd_asp|enabled_r~0_combout\ & ( (!\reset~input_o\ & (!\init~input_o\ & ((!\u_pd_asp|in_word_r\(25)) # (!\u_pd_asp|in_word_r\(24))))) ) ) ) # ( !\u_pd_asp|enabled_r~q\ & ( 
-- \u_pd_asp|enabled_r~0_combout\ & ( (\u_pd_asp|in_word_r\(25) & (!\reset~input_o\ & (!\u_pd_asp|in_word_r\(24) & !\init~input_o\))) ) ) ) # ( \u_pd_asp|enabled_r~q\ & ( !\u_pd_asp|enabled_r~0_combout\ & ( (!\reset~input_o\ & !\init~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011000000000001000000000000001100100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(25),
	datab => \ALT_INV_reset~input_o\,
	datac => \u_pd_asp|ALT_INV_in_word_r\(24),
	datad => \ALT_INV_init~input_o\,
	datae => \u_pd_asp|ALT_INV_enabled_r~q\,
	dataf => \u_pd_asp|ALT_INV_enabled_r~0_combout\,
	combout => \u_pd_asp|enabled_r~1_combout\);

-- Location: FF_X21_Y5_N26
\u_pd_asp|enabled_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|enabled_r~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|enabled_r~q\);

-- Location: LABCELL_X18_Y5_N24
\u_pd_asp|u_core|sample_accepted~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|sample_accepted~0_combout\ = ( \u_pd_asp|in_word_r\(29) & ( \u_pd_asp|enabled_r~q\ & ( (\u_pd_asp|in_valid_r~q\ & (\u_pd_asp|in_word_r\(22) & !\u_pd_asp|in_word_r\(28))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_valid_r~q\,
	datab => \u_pd_asp|ALT_INV_in_word_r\(22),
	datac => \u_pd_asp|ALT_INV_in_word_r\(28),
	datae => \u_pd_asp|ALT_INV_in_word_r\(29),
	dataf => \u_pd_asp|ALT_INV_enabled_r~q\,
	combout => \u_pd_asp|u_core|sample_accepted~0_combout\);

-- Location: LABCELL_X18_Y5_N54
\u_pd_asp|core_clear~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|core_clear~1_combout\ = (!\u_pd_asp|in_word_r\(25) & !\u_pd_asp|in_word_r\(24))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(25),
	datab => \u_pd_asp|ALT_INV_in_word_r\(24),
	combout => \u_pd_asp|core_clear~1_combout\);

-- Location: LABCELL_X18_Y5_N9
\u_pd_asp|core_clear~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|core_clear~0_combout\ = ( \u_pd_asp|in_word_r\(28) & ( \u_pd_asp|in_word_r\(22) & ( (\u_pd_asp|in_word_r\(26) & (!\u_pd_asp|in_word_r\(27) & (\u_pd_asp|in_valid_r~q\ & !\u_pd_asp|in_word_r\(29)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(26),
	datab => \u_pd_asp|ALT_INV_in_word_r\(27),
	datac => \u_pd_asp|ALT_INV_in_valid_r~q\,
	datad => \u_pd_asp|ALT_INV_in_word_r\(29),
	datae => \u_pd_asp|ALT_INV_in_word_r\(28),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(22),
	combout => \u_pd_asp|core_clear~0_combout\);

-- Location: LABCELL_X19_Y5_N21
\u_pd_asp|u_core|first_seen_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|first_seen_r~0_combout\ = ( \u_pd_asp|u_core|first_seen_r~q\ & ( \u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & (!\init~input_o\ & !\u_pd_asp|core_clear~1_combout\)) ) ) ) # ( !\u_pd_asp|u_core|first_seen_r~q\ & ( 
-- \u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & (\u_pd_asp|u_core|sample_accepted~0_combout\ & (!\init~input_o\ & !\u_pd_asp|core_clear~1_combout\))) ) ) ) # ( \u_pd_asp|u_core|first_seen_r~q\ & ( !\u_pd_asp|core_clear~0_combout\ & ( 
-- (!\reset~input_o\ & !\init~input_o\) ) ) ) # ( !\u_pd_asp|u_core|first_seen_r~q\ & ( !\u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & (\u_pd_asp|u_core|sample_accepted~0_combout\ & !\init~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000101000001010000000100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\,
	datac => \ALT_INV_init~input_o\,
	datad => \u_pd_asp|ALT_INV_core_clear~1_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_first_seen_r~q\,
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|u_core|first_seen_r~0_combout\);

-- Location: FF_X19_Y5_N23
\u_pd_asp|u_core|first_seen_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|first_seen_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|first_seen_r~q\);

-- Location: LABCELL_X19_Y7_N30
\u_pd_asp|u_core|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~1_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(0) ) + ( VCC ) + ( !VCC ))
-- \u_pd_asp|u_core|Add0~2\ = CARRY(( \u_pd_asp|u_core|counter_r\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(0),
	cin => GND,
	sumout => \u_pd_asp|u_core|Add0~1_sumout\,
	cout => \u_pd_asp|u_core|Add0~2\);

-- Location: LABCELL_X19_Y7_N3
\u_pd_asp|u_core|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|process_0~0_combout\ = ( \u_pd_asp|core_clear~1_combout\ & ( ((\u_pd_asp|core_clear~0_combout\) # (\init~input_o\)) # (\reset~input_o\) ) ) # ( !\u_pd_asp|core_clear~1_combout\ & ( (\init~input_o\) # (\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111100111111111111110011111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_init~input_o\,
	datad => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	dataf => \u_pd_asp|ALT_INV_core_clear~1_combout\,
	combout => \u_pd_asp|u_core|process_0~0_combout\);

-- Location: IOIBUF_X38_Y0_N1
\recv.data[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(13),
	o => \recv.data[13]~input_o\);

-- Location: IOIBUF_X30_Y0_N18
\recv.data[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(17),
	o => \recv.data[17]~input_o\);

-- Location: LABCELL_X23_Y5_N18
\cor_low_seen_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_seen_r~0_combout\ = ( !\recv.data[26]~input_o\ & ( !\recv.data[27]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_recv.data[27]~input_o\,
	dataf => \ALT_INV_recv.data[26]~input_o\,
	combout => \cor_low_seen_r~0_combout\);

-- Location: LABCELL_X23_Y5_N54
\cor_low_seen_r~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_seen_r~1_combout\ = ( !\recv.data[28]~input_o\ & ( (\pd_in_word~1_combout\ & (\pd_in_word~0_combout\ & \recv.data[29]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_in_word~1_combout\,
	datab => \ALT_INV_pd_in_word~0_combout\,
	datac => \ALT_INV_recv.data[29]~input_o\,
	dataf => \ALT_INV_recv.data[28]~input_o\,
	combout => \cor_low_seen_r~1_combout\);

-- Location: LABCELL_X23_Y5_N48
\cor_low_seen_r~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_seen_r~2_combout\ = ( \cor_low_seen_r~q\ & ( \cor_low_seen_r~0_combout\ & ( (!\pd_reset~combout\ & ((!\cor_low_seen_r~1_combout\) # ((!\recv.data[25]~input_o\) # (\recv.data[24]~input_o\)))) ) ) ) # ( !\cor_low_seen_r~q\ & ( 
-- \cor_low_seen_r~0_combout\ & ( (\cor_low_seen_r~1_combout\ & (!\recv.data[25]~input_o\ & (!\pd_reset~combout\ & \recv.data[24]~input_o\))) ) ) ) # ( \cor_low_seen_r~q\ & ( !\cor_low_seen_r~0_combout\ & ( !\pd_reset~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000010000001110000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_cor_low_seen_r~1_combout\,
	datab => \ALT_INV_recv.data[25]~input_o\,
	datac => \ALT_INV_pd_reset~combout\,
	datad => \ALT_INV_recv.data[24]~input_o\,
	datae => \ALT_INV_cor_low_seen_r~q\,
	dataf => \ALT_INV_cor_low_seen_r~0_combout\,
	combout => \cor_low_seen_r~2_combout\);

-- Location: FF_X23_Y5_N50
cor_low_seen_r : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cor_low_seen_r~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cor_low_seen_r~q\);

-- Location: LABCELL_X23_Y5_N6
\pd_in_word[18]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[18]~13_combout\ = ( \recv.data[29]~input_o\ & ( \cor_low_seen_r~q\ & ( (!\recv.data[28]~input_o\ & ((!\cor_low_seen_r~0_combout\) # ((\recv.data[25]~input_o\ & \recv.data[24]~input_o\)))) ) ) ) # ( !\recv.data[29]~input_o\ & ( 
-- \cor_low_seen_r~q\ & ( \recv.data[28]~input_o\ ) ) ) # ( \recv.data[29]~input_o\ & ( !\cor_low_seen_r~q\ & ( (!\recv.data[28]~input_o\ & ((!\cor_low_seen_r~0_combout\) # (\recv.data[25]~input_o\))) ) ) ) # ( !\recv.data[29]~input_o\ & ( 
-- !\cor_low_seen_r~q\ & ( \recv.data[28]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011100011001000110000110011001100111000100010001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_cor_low_seen_r~0_combout\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \ALT_INV_recv.data[25]~input_o\,
	datad => \ALT_INV_recv.data[24]~input_o\,
	datae => \ALT_INV_recv.data[29]~input_o\,
	dataf => \ALT_INV_cor_low_seen_r~q\,
	combout => \pd_in_word[18]~13_combout\);

-- Location: LABCELL_X23_Y5_N27
\pd_in_word[18]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[18]~11_combout\ = ( !\recv.data[26]~input_o\ & ( (!\recv.data[27]~input_o\ & !\recv.data[25]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[27]~input_o\,
	datab => \ALT_INV_recv.data[25]~input_o\,
	dataf => \ALT_INV_recv.data[26]~input_o\,
	combout => \pd_in_word[18]~11_combout\);

-- Location: LABCELL_X23_Y5_N36
\pd_in_word[18]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[18]~12_combout\ = ( \pd_in_word~1_combout\ & ( \pd_in_word[18]~11_combout\ & ( (!\pd_reset~combout\ & (\pd_in_word~0_combout\ & (!\recv.data[29]~input_o\ & \recv.data[28]~input_o\))) ) ) ) # ( \pd_in_word~1_combout\ & ( 
-- !\pd_in_word[18]~11_combout\ & ( (!\pd_reset~combout\ & (\pd_in_word~0_combout\ & (!\recv.data[29]~input_o\ $ (!\recv.data[28]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100010000000000000000000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_reset~combout\,
	datab => \ALT_INV_pd_in_word~0_combout\,
	datac => \ALT_INV_recv.data[29]~input_o\,
	datad => \ALT_INV_recv.data[28]~input_o\,
	datae => \ALT_INV_pd_in_word~1_combout\,
	dataf => \ALT_INV_pd_in_word[18]~11_combout\,
	combout => \pd_in_word[18]~12_combout\);

-- Location: LABCELL_X24_Y5_N18
\pd_in_word~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~16_combout\ = ( \pd_in_word[18]~13_combout\ & ( \pd_in_word[18]~12_combout\ & ( \recv.data[17]~input_o\ ) ) ) # ( !\pd_in_word[18]~13_combout\ & ( \pd_in_word[18]~12_combout\ & ( \recv.data[13]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[13]~input_o\,
	datac => \ALT_INV_recv.data[17]~input_o\,
	datae => \ALT_INV_pd_in_word[18]~13_combout\,
	dataf => \ALT_INV_pd_in_word[18]~12_combout\,
	combout => \pd_in_word~16_combout\);

-- Location: FF_X24_Y5_N19
\pd_in_word[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(17));

-- Location: FF_X17_Y7_N17
\u_pd_asp|in_word_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(17),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(17));

-- Location: LABCELL_X19_Y5_N6
\u_pd_asp|u_core|counter_r[17]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|counter_r[17]~1_combout\ = ( \u_pd_asp|core_clear~0_combout\ & ( (((\u_pd_asp|u_core|sample_accepted~0_combout\) # (\u_pd_asp|core_clear~1_combout\)) # (\init~input_o\)) # (\reset~input_o\) ) ) # ( !\u_pd_asp|core_clear~0_combout\ & ( 
-- ((\u_pd_asp|u_core|sample_accepted~0_combout\) # (\init~input_o\)) # (\reset~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011111111111011101111111111101111111111111110111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \ALT_INV_init~input_o\,
	datac => \u_pd_asp|ALT_INV_core_clear~1_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\,
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|u_core|counter_r[17]~1_combout\);

-- Location: FF_X18_Y7_N38
\u_pd_asp|u_core|last_corr_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(17),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(17));

-- Location: IOIBUF_X28_Y0_N52
\recv.data[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(16),
	o => \recv.data[16]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\recv.data[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(12),
	o => \recv.data[12]~input_o\);

-- Location: LABCELL_X23_Y5_N21
\pd_in_word~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~17_combout\ = ( \recv.data[12]~input_o\ & ( (\pd_in_word[18]~12_combout\ & ((!\pd_in_word[18]~13_combout\) # (\recv.data[16]~input_o\))) ) ) # ( !\recv.data[12]~input_o\ & ( (\pd_in_word[18]~12_combout\ & (\recv.data[16]~input_o\ & 
-- \pd_in_word[18]~13_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000101010001010100010101000101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_in_word[18]~12_combout\,
	datab => \ALT_INV_recv.data[16]~input_o\,
	datac => \ALT_INV_pd_in_word[18]~13_combout\,
	dataf => \ALT_INV_recv.data[12]~input_o\,
	combout => \pd_in_word~17_combout\);

-- Location: FF_X23_Y5_N22
\pd_in_word[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(16));

-- Location: FF_X17_Y7_N14
\u_pd_asp|in_word_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(16),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(16));

-- Location: FF_X18_Y7_N44
\u_pd_asp|u_core|last_corr_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(16),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(16));

-- Location: LABCELL_X17_Y7_N33
\u_pd_asp|u_core|LessThan0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~13_combout\ = ( \u_pd_asp|u_core|last_corr_r\(16) & ( \u_pd_asp|in_word_r\(16) & ( (!\u_pd_asp|in_word_r\(17) & \u_pd_asp|u_core|last_corr_r\(17)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(16) & ( \u_pd_asp|in_word_r\(16) & ( 
-- (!\u_pd_asp|in_word_r\(17) & \u_pd_asp|u_core|last_corr_r\(17)) ) ) ) # ( \u_pd_asp|u_core|last_corr_r\(16) & ( !\u_pd_asp|in_word_r\(16) & ( (!\u_pd_asp|in_word_r\(17)) # (\u_pd_asp|u_core|last_corr_r\(17)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(16) & 
-- ( !\u_pd_asp|in_word_r\(16) & ( (!\u_pd_asp|in_word_r\(17) & \u_pd_asp|u_core|last_corr_r\(17)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100110011111100111100001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_in_word_r\(17),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(17),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(16),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(16),
	combout => \u_pd_asp|u_core|LessThan0~13_combout\);

-- Location: LABCELL_X18_Y7_N45
\u_pd_asp|u_core|state_r~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~1_combout\ = ( \u_pd_asp|u_core|last_corr_r\(17) & ( \u_pd_asp|in_word_r\(17) & ( !\u_pd_asp|u_core|last_corr_r\(16) $ (\u_pd_asp|in_word_r\(16)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(17) & ( !\u_pd_asp|in_word_r\(17) & ( 
-- !\u_pd_asp|u_core|last_corr_r\(16) $ (\u_pd_asp|in_word_r\(16)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001111000011000000000000000000000000000000001100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_last_corr_r\(16),
	datac => \u_pd_asp|ALT_INV_in_word_r\(16),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(17),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(17),
	combout => \u_pd_asp|u_core|state_r~1_combout\);

-- Location: IOIBUF_X30_Y0_N35
\recv.data[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(19),
	o => \recv.data[19]~input_o\);

-- Location: IOIBUF_X34_Y0_N75
\recv.data[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(15),
	o => \recv.data[15]~input_o\);

-- Location: LABCELL_X24_Y5_N33
\pd_in_word~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~14_combout\ = ( \pd_in_word[18]~13_combout\ & ( \recv.data[15]~input_o\ & ( (\pd_in_word[18]~12_combout\ & \recv.data[19]~input_o\) ) ) ) # ( !\pd_in_word[18]~13_combout\ & ( \recv.data[15]~input_o\ & ( \pd_in_word[18]~12_combout\ ) ) ) # ( 
-- \pd_in_word[18]~13_combout\ & ( !\recv.data[15]~input_o\ & ( (\pd_in_word[18]~12_combout\ & \recv.data[19]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100010001000101010101010101010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_in_word[18]~12_combout\,
	datab => \ALT_INV_recv.data[19]~input_o\,
	datae => \ALT_INV_pd_in_word[18]~13_combout\,
	dataf => \ALT_INV_recv.data[15]~input_o\,
	combout => \pd_in_word~14_combout\);

-- Location: FF_X24_Y5_N35
\pd_in_word[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(19));

-- Location: FF_X17_Y7_N35
\u_pd_asp|in_word_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(19),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(19));

-- Location: FF_X18_Y7_N50
\u_pd_asp|u_core|last_corr_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(19),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(19));

-- Location: IOIBUF_X32_Y0_N52
\recv.data[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(14),
	o => \recv.data[14]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\recv.data[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(18),
	o => \recv.data[18]~input_o\);

-- Location: LABCELL_X24_Y5_N39
\pd_in_word~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word~15_combout\ = ( \pd_in_word[18]~13_combout\ & ( \pd_in_word[18]~12_combout\ & ( \recv.data[18]~input_o\ ) ) ) # ( !\pd_in_word[18]~13_combout\ & ( \pd_in_word[18]~12_combout\ & ( \recv.data[14]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[14]~input_o\,
	datac => \ALT_INV_recv.data[18]~input_o\,
	datae => \ALT_INV_pd_in_word[18]~13_combout\,
	dataf => \ALT_INV_pd_in_word[18]~12_combout\,
	combout => \pd_in_word~15_combout\);

-- Location: FF_X24_Y5_N40
\pd_in_word[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(18));

-- Location: FF_X17_Y7_N32
\u_pd_asp|in_word_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(18),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(18));

-- Location: FF_X18_Y7_N23
\u_pd_asp|u_core|last_corr_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(18),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(18));

-- Location: LABCELL_X18_Y7_N18
\u_pd_asp|u_core|state_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~0_combout\ = ( \u_pd_asp|in_word_r\(18) & ( (\u_pd_asp|u_core|last_corr_r\(18) & (!\u_pd_asp|u_core|last_corr_r\(19) $ (\u_pd_asp|in_word_r\(19)))) ) ) # ( !\u_pd_asp|in_word_r\(18) & ( (!\u_pd_asp|u_core|last_corr_r\(18) & 
-- (!\u_pd_asp|u_core|last_corr_r\(19) $ (\u_pd_asp|in_word_r\(19)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000001010000101000000101000000001010000001010000101000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_last_corr_r\(19),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(18),
	datad => \u_pd_asp|ALT_INV_in_word_r\(19),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(18),
	combout => \u_pd_asp|u_core|state_r~0_combout\);

-- Location: LABCELL_X17_Y7_N0
\u_pd_asp|u_core|LessThan0~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~15_combout\ = (!\u_pd_asp|in_word_r\(19) & (((\u_pd_asp|u_core|last_corr_r\(18) & !\u_pd_asp|in_word_r\(18))) # (\u_pd_asp|u_core|last_corr_r\(19)))) # (\u_pd_asp|in_word_r\(19) & (\u_pd_asp|u_core|last_corr_r\(19) & 
-- (\u_pd_asp|u_core|last_corr_r\(18) & !\u_pd_asp|in_word_r\(18))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101100100010001010110010001000101011001000100010101100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(19),
	datab => \u_pd_asp|u_core|ALT_INV_last_corr_r\(19),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(18),
	datad => \u_pd_asp|ALT_INV_in_word_r\(18),
	combout => \u_pd_asp|u_core|LessThan0~15_combout\);

-- Location: LABCELL_X23_Y4_N3
\pd_in_word[14]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[14]~feeder_combout\ = ( \recv.data[14]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[14]~input_o\,
	combout => \pd_in_word[14]~feeder_combout\);

-- Location: IOIBUF_X32_Y0_N1
\recv.data[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(10),
	o => \recv.data[10]~input_o\);

-- Location: LABCELL_X23_Y4_N57
\pd_in_word[14]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[14]~9_combout\ = ( \pd_in_word~1_combout\ & ( \pd_in_word~0_combout\ & ( ((!\recv.data[28]~input_o\ & ((!\recv.data[29]~input_o\) # (\Mux33~0_combout\))) # (\recv.data[28]~input_o\ & ((\recv.data[29]~input_o\)))) # (\pd_reset~combout\) ) ) ) # 
-- ( !\pd_in_word~1_combout\ & ( \pd_in_word~0_combout\ ) ) # ( \pd_in_word~1_combout\ & ( !\pd_in_word~0_combout\ ) ) # ( !\pd_in_word~1_combout\ & ( !\pd_in_word~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111010101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_reset~combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_recv.data[28]~input_o\,
	datad => \ALT_INV_recv.data[29]~input_o\,
	datae => \ALT_INV_pd_in_word~1_combout\,
	dataf => \ALT_INV_pd_in_word~0_combout\,
	combout => \pd_in_word[14]~9_combout\);

-- Location: LABCELL_X23_Y5_N33
\pd_in_word[14]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[14]~10_combout\ = ( \recv.data[29]~input_o\ & ( \cor_low_seen_r~q\ & ( ((\cor_low_seen_r~0_combout\ & (!\recv.data[24]~input_o\ $ (!\recv.data[25]~input_o\)))) # (\recv.data[28]~input_o\) ) ) ) # ( !\recv.data[29]~input_o\ & ( 
-- \cor_low_seen_r~q\ & ( !\recv.data[28]~input_o\ ) ) ) # ( \recv.data[29]~input_o\ & ( !\cor_low_seen_r~q\ & ( ((\cor_low_seen_r~0_combout\ & (\recv.data[24]~input_o\ & !\recv.data[25]~input_o\))) # (\recv.data[28]~input_o\) ) ) ) # ( 
-- !\recv.data[29]~input_o\ & ( !\cor_low_seen_r~q\ & ( !\recv.data[28]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100001101110011001111001100110011000011011101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_cor_low_seen_r~0_combout\,
	datab => \ALT_INV_recv.data[28]~input_o\,
	datac => \ALT_INV_recv.data[24]~input_o\,
	datad => \ALT_INV_recv.data[25]~input_o\,
	datae => \ALT_INV_recv.data[29]~input_o\,
	dataf => \ALT_INV_cor_low_seen_r~q\,
	combout => \pd_in_word[14]~10_combout\);

-- Location: FF_X23_Y4_N5
\pd_in_word[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[14]~feeder_combout\,
	asdata => \recv.data[10]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(14));

-- Location: FF_X17_Y5_N17
\u_pd_asp|in_word_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(14),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(14));

-- Location: LABCELL_X23_Y4_N45
\pd_in_word[15]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[15]~feeder_combout\ = ( \recv.data[15]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[15]~input_o\,
	combout => \pd_in_word[15]~feeder_combout\);

-- Location: IOIBUF_X32_Y0_N35
\recv.data[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(11),
	o => \recv.data[11]~input_o\);

-- Location: FF_X23_Y4_N47
\pd_in_word[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[15]~feeder_combout\,
	asdata => \recv.data[11]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(15));

-- Location: FF_X17_Y5_N35
\u_pd_asp|in_word_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(15),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(15));

-- Location: FF_X18_Y6_N2
\u_pd_asp|u_core|last_corr_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(14),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(14));

-- Location: FF_X18_Y6_N50
\u_pd_asp|u_core|last_corr_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(15),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(15));

-- Location: LABCELL_X17_Y5_N21
\u_pd_asp|u_core|LessThan0~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~14_combout\ = ( \u_pd_asp|u_core|last_corr_r\(14) & ( \u_pd_asp|u_core|last_corr_r\(15) & ( (!\u_pd_asp|in_word_r\(14)) # (!\u_pd_asp|in_word_r\(15)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(14) & ( 
-- \u_pd_asp|u_core|last_corr_r\(15) & ( !\u_pd_asp|in_word_r\(15) ) ) ) # ( \u_pd_asp|u_core|last_corr_r\(14) & ( !\u_pd_asp|u_core|last_corr_r\(15) & ( (!\u_pd_asp|in_word_r\(14) & !\u_pd_asp|in_word_r\(15)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000011111111000000001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_in_word_r\(14),
	datad => \u_pd_asp|ALT_INV_in_word_r\(15),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(14),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(15),
	combout => \u_pd_asp|u_core|LessThan0~14_combout\);

-- Location: LABCELL_X18_Y7_N39
\u_pd_asp|u_core|LessThan0~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~16_combout\ = ( !\u_pd_asp|u_core|LessThan0~15_combout\ & ( \u_pd_asp|u_core|LessThan0~14_combout\ & ( (!\u_pd_asp|u_core|state_r~0_combout\) # ((!\u_pd_asp|u_core|LessThan0~13_combout\ & !\u_pd_asp|u_core|state_r~1_combout\)) ) 
-- ) ) # ( !\u_pd_asp|u_core|LessThan0~15_combout\ & ( !\u_pd_asp|u_core|LessThan0~14_combout\ & ( (!\u_pd_asp|u_core|LessThan0~13_combout\) # (!\u_pd_asp|u_core|state_r~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111001100000000000000000011111111110000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_LessThan0~13_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_state_r~1_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_state_r~0_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_LessThan0~15_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~14_combout\,
	combout => \u_pd_asp|u_core|LessThan0~16_combout\);

-- Location: LABCELL_X23_Y4_N33
\pd_in_word[12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[12]~feeder_combout\ = \recv.data[12]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[12]~input_o\,
	combout => \pd_in_word[12]~feeder_combout\);

-- Location: IOIBUF_X6_Y0_N52
\recv.data[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(8),
	o => \recv.data[8]~input_o\);

-- Location: FF_X23_Y4_N34
\pd_in_word[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[12]~feeder_combout\,
	asdata => \recv.data[8]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(12));

-- Location: FF_X18_Y5_N59
\u_pd_asp|in_word_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(12),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(12));

-- Location: LABCELL_X23_Y4_N15
\pd_in_word[13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[13]~feeder_combout\ = \recv.data[13]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_recv.data[13]~input_o\,
	combout => \pd_in_word[13]~feeder_combout\);

-- Location: IOIBUF_X28_Y0_N1
\recv.data[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(9),
	o => \recv.data[9]~input_o\);

-- Location: FF_X23_Y4_N17
\pd_in_word[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[13]~feeder_combout\,
	asdata => \recv.data[9]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(13));

-- Location: LABCELL_X18_Y5_N48
\u_pd_asp|in_word_r[13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|in_word_r[13]~feeder_combout\ = ( pd_in_word(13) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_pd_in_word(13),
	combout => \u_pd_asp|in_word_r[13]~feeder_combout\);

-- Location: FF_X18_Y5_N49
\u_pd_asp|in_word_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|in_word_r[13]~feeder_combout\,
	sclr => \pd_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(13));

-- Location: FF_X19_Y5_N11
\u_pd_asp|u_core|last_corr_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(13),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(13));

-- Location: FF_X19_Y5_N50
\u_pd_asp|u_core|last_corr_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(12),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(12));

-- Location: LABCELL_X18_Y5_N36
\u_pd_asp|u_core|state_r~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~3_combout\ = ( \u_pd_asp|u_core|last_corr_r\(13) & ( \u_pd_asp|u_core|last_corr_r\(12) & ( (\u_pd_asp|in_word_r\(12) & \u_pd_asp|in_word_r\(13)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(13) & ( \u_pd_asp|u_core|last_corr_r\(12) & 
-- ( (\u_pd_asp|in_word_r\(12) & !\u_pd_asp|in_word_r\(13)) ) ) ) # ( \u_pd_asp|u_core|last_corr_r\(13) & ( !\u_pd_asp|u_core|last_corr_r\(12) & ( (!\u_pd_asp|in_word_r\(12) & \u_pd_asp|in_word_r\(13)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(13) & ( 
-- !\u_pd_asp|u_core|last_corr_r\(12) & ( (!\u_pd_asp|in_word_r\(12) & !\u_pd_asp|in_word_r\(13)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000000000001100110000110011000000000000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_in_word_r\(12),
	datad => \u_pd_asp|ALT_INV_in_word_r\(13),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(13),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(12),
	combout => \u_pd_asp|u_core|state_r~3_combout\);

-- Location: LABCELL_X18_Y6_N15
\u_pd_asp|u_core|state_r~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~2_combout\ = ( \u_pd_asp|in_word_r\(15) & ( \u_pd_asp|in_word_r\(14) & ( (\u_pd_asp|u_core|last_corr_r\(14) & \u_pd_asp|u_core|last_corr_r\(15)) ) ) ) # ( !\u_pd_asp|in_word_r\(15) & ( \u_pd_asp|in_word_r\(14) & ( 
-- (\u_pd_asp|u_core|last_corr_r\(14) & !\u_pd_asp|u_core|last_corr_r\(15)) ) ) ) # ( \u_pd_asp|in_word_r\(15) & ( !\u_pd_asp|in_word_r\(14) & ( (!\u_pd_asp|u_core|last_corr_r\(14) & \u_pd_asp|u_core|last_corr_r\(15)) ) ) ) # ( !\u_pd_asp|in_word_r\(15) & ( 
-- !\u_pd_asp|in_word_r\(14) & ( (!\u_pd_asp|u_core|last_corr_r\(14) & !\u_pd_asp|u_core|last_corr_r\(15)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000000000001010101001010101000000000000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_last_corr_r\(14),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(15),
	datae => \u_pd_asp|ALT_INV_in_word_r\(15),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(14),
	combout => \u_pd_asp|u_core|state_r~2_combout\);

-- Location: LABCELL_X23_Y4_N21
\pd_in_word[10]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[10]~feeder_combout\ = \recv.data[10]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_recv.data[10]~input_o\,
	combout => \pd_in_word[10]~feeder_combout\);

-- Location: IOIBUF_X34_Y0_N58
\recv.data[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(6),
	o => \recv.data[6]~input_o\);

-- Location: FF_X23_Y4_N22
\pd_in_word[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[10]~feeder_combout\,
	asdata => \recv.data[6]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(10));

-- Location: FF_X18_Y5_N53
\u_pd_asp|in_word_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(10),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(10));

-- Location: FF_X19_Y5_N56
\u_pd_asp|u_core|last_corr_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(10),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(10));

-- Location: LABCELL_X23_Y4_N42
\pd_in_word[11]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[11]~feeder_combout\ = \recv.data[11]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.data[11]~input_o\,
	combout => \pd_in_word[11]~feeder_combout\);

-- Location: IOIBUF_X30_Y0_N52
\recv.data[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(7),
	o => \recv.data[7]~input_o\);

-- Location: FF_X23_Y4_N43
\pd_in_word[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[11]~feeder_combout\,
	asdata => \recv.data[7]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(11));

-- Location: FF_X18_Y5_N41
\u_pd_asp|in_word_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(11),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(11));

-- Location: FF_X19_Y5_N59
\u_pd_asp|u_core|last_corr_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(11),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(11));

-- Location: LABCELL_X18_Y5_N33
\u_pd_asp|u_core|LessThan0~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~11_combout\ = ( \u_pd_asp|u_core|last_corr_r\(11) & ( \u_pd_asp|in_word_r\(11) & ( !\u_pd_asp|u_core|last_corr_r\(10) $ (\u_pd_asp|in_word_r\(10)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(11) & ( !\u_pd_asp|in_word_r\(11) & ( 
-- !\u_pd_asp|u_core|last_corr_r\(10) $ (\u_pd_asp|in_word_r\(10)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001111000000000000000000000000000000001111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(10),
	datad => \u_pd_asp|ALT_INV_in_word_r\(10),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(11),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(11),
	combout => \u_pd_asp|u_core|LessThan0~11_combout\);

-- Location: LABCELL_X18_Y7_N12
\u_pd_asp|u_core|LessThan0~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~12_combout\ = ( \u_pd_asp|u_core|state_r~2_combout\ & ( \u_pd_asp|u_core|LessThan0~11_combout\ & ( (\u_pd_asp|u_core|state_r~0_combout\ & (\u_pd_asp|u_core|state_r~3_combout\ & \u_pd_asp|u_core|state_r~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_state_r~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_state_r~3_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_state_r~1_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_state_r~2_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~11_combout\,
	combout => \u_pd_asp|u_core|LessThan0~12_combout\);

-- Location: LABCELL_X19_Y5_N42
\u_pd_asp|u_core|LessThan0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~17_combout\ = ( \u_pd_asp|in_word_r\(12) & ( (\u_pd_asp|u_core|last_corr_r\(13) & !\u_pd_asp|in_word_r\(13)) ) ) # ( !\u_pd_asp|in_word_r\(12) & ( (!\u_pd_asp|u_core|last_corr_r\(13) & (\u_pd_asp|u_core|last_corr_r\(12) & 
-- !\u_pd_asp|in_word_r\(13))) # (\u_pd_asp|u_core|last_corr_r\(13) & ((!\u_pd_asp|in_word_r\(13)) # (\u_pd_asp|u_core|last_corr_r\(12)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100000011001111110000001100110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_last_corr_r\(13),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(12),
	datad => \u_pd_asp|ALT_INV_in_word_r\(13),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(12),
	combout => \u_pd_asp|u_core|LessThan0~17_combout\);

-- Location: LABCELL_X19_Y5_N0
\u_pd_asp|u_core|LessThan0~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~18_combout\ = ( !\u_pd_asp|in_word_r\(10) & ( \u_pd_asp|in_word_r\(11) & ( (\u_pd_asp|u_core|last_corr_r\(10) & \u_pd_asp|u_core|last_corr_r\(11)) ) ) ) # ( \u_pd_asp|in_word_r\(10) & ( !\u_pd_asp|in_word_r\(11) & ( 
-- \u_pd_asp|u_core|last_corr_r\(11) ) ) ) # ( !\u_pd_asp|in_word_r\(10) & ( !\u_pd_asp|in_word_r\(11) & ( (\u_pd_asp|u_core|last_corr_r\(11)) # (\u_pd_asp|u_core|last_corr_r\(10)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000000001111111100000000000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(10),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(11),
	datae => \u_pd_asp|ALT_INV_in_word_r\(10),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(11),
	combout => \u_pd_asp|u_core|LessThan0~18_combout\);

-- Location: LABCELL_X18_Y6_N51
\u_pd_asp|u_core|LessThan0~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~19_combout\ = ( \u_pd_asp|u_core|state_r~3_combout\ & ( \u_pd_asp|u_core|state_r~1_combout\ & ( (\u_pd_asp|u_core|state_r~0_combout\ & (\u_pd_asp|u_core|state_r~2_combout\ & ((\u_pd_asp|u_core|LessThan0~18_combout\) # 
-- (\u_pd_asp|u_core|LessThan0~17_combout\)))) ) ) ) # ( !\u_pd_asp|u_core|state_r~3_combout\ & ( \u_pd_asp|u_core|state_r~1_combout\ & ( (\u_pd_asp|u_core|state_r~0_combout\ & (\u_pd_asp|u_core|state_r~2_combout\ & \u_pd_asp|u_core|LessThan0~17_combout\)) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_state_r~0_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_state_r~2_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan0~17_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_LessThan0~18_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_state_r~3_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~1_combout\,
	combout => \u_pd_asp|u_core|LessThan0~19_combout\);

-- Location: LABCELL_X23_Y4_N18
\pd_in_word[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[6]~feeder_combout\ = \recv.data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.data[6]~input_o\,
	combout => \pd_in_word[6]~feeder_combout\);

-- Location: IOIBUF_X4_Y0_N35
\recv.data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(2),
	o => \recv.data[2]~input_o\);

-- Location: FF_X23_Y4_N19
\pd_in_word[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[6]~feeder_combout\,
	asdata => \recv.data[2]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(6));

-- Location: FF_X17_Y7_N20
\u_pd_asp|in_word_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(6),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(6));

-- Location: FF_X18_Y6_N41
\u_pd_asp|u_core|last_corr_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(6),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(6));

-- Location: LABCELL_X23_Y4_N48
\pd_in_word[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[7]~feeder_combout\ = \recv.data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.data[7]~input_o\,
	combout => \pd_in_word[7]~feeder_combout\);

-- Location: IOIBUF_X2_Y0_N41
\recv.data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(3),
	o => \recv.data[3]~input_o\);

-- Location: FF_X23_Y4_N49
\pd_in_word[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[7]~feeder_combout\,
	asdata => \recv.data[3]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(7));

-- Location: FF_X17_Y7_N23
\u_pd_asp|in_word_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(7),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(7));

-- Location: FF_X18_Y6_N56
\u_pd_asp|u_core|last_corr_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(7),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(7));

-- Location: LABCELL_X18_Y6_N3
\u_pd_asp|u_core|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~1_combout\ = ( \u_pd_asp|in_word_r\(7) & ( \u_pd_asp|in_word_r\(6) & ( (\u_pd_asp|u_core|last_corr_r\(6) & \u_pd_asp|u_core|last_corr_r\(7)) ) ) ) # ( !\u_pd_asp|in_word_r\(7) & ( \u_pd_asp|in_word_r\(6) & ( 
-- (\u_pd_asp|u_core|last_corr_r\(6) & !\u_pd_asp|u_core|last_corr_r\(7)) ) ) ) # ( \u_pd_asp|in_word_r\(7) & ( !\u_pd_asp|in_word_r\(6) & ( (!\u_pd_asp|u_core|last_corr_r\(6) & \u_pd_asp|u_core|last_corr_r\(7)) ) ) ) # ( !\u_pd_asp|in_word_r\(7) & ( 
-- !\u_pd_asp|in_word_r\(6) & ( (!\u_pd_asp|u_core|last_corr_r\(6) & !\u_pd_asp|u_core|last_corr_r\(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000000001111000000001111000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(6),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(7),
	datae => \u_pd_asp|ALT_INV_in_word_r\(7),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(6),
	combout => \u_pd_asp|u_core|LessThan0~1_combout\);

-- Location: LABCELL_X23_Y4_N12
\pd_in_word[9]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[9]~feeder_combout\ = ( \recv.data[9]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[9]~input_o\,
	combout => \pd_in_word[9]~feeder_combout\);

-- Location: IOIBUF_X34_Y0_N41
\recv.data[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(5),
	o => \recv.data[5]~input_o\);

-- Location: FF_X23_Y4_N13
\pd_in_word[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[9]~feeder_combout\,
	asdata => \recv.data[5]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(9));

-- Location: FF_X19_Y8_N38
\u_pd_asp|in_word_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(9),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(9));

-- Location: FF_X18_Y6_N19
\u_pd_asp|u_core|last_corr_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(9),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(9));

-- Location: LABCELL_X23_Y4_N30
\pd_in_word[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[8]~feeder_combout\ = ( \recv.data[8]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[8]~input_o\,
	combout => \pd_in_word[8]~feeder_combout\);

-- Location: IOIBUF_X32_Y0_N18
\recv.data[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(4),
	o => \recv.data[4]~input_o\);

-- Location: FF_X23_Y4_N31
\pd_in_word[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[8]~feeder_combout\,
	asdata => \recv.data[4]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(8));

-- Location: FF_X19_Y8_N11
\u_pd_asp|in_word_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(8),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(8));

-- Location: FF_X18_Y6_N38
\u_pd_asp|u_core|last_corr_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(8),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(8));

-- Location: LABCELL_X18_Y6_N6
\u_pd_asp|u_core|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~0_combout\ = ( \u_pd_asp|in_word_r\(8) & ( (\u_pd_asp|u_core|last_corr_r\(8) & (!\u_pd_asp|u_core|last_corr_r\(9) $ (\u_pd_asp|in_word_r\(9)))) ) ) # ( !\u_pd_asp|in_word_r\(8) & ( (!\u_pd_asp|u_core|last_corr_r\(8) & 
-- (!\u_pd_asp|u_core|last_corr_r\(9) $ (\u_pd_asp|in_word_r\(9)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000110000110000000011000000001100000000110000110000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_last_corr_r\(9),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(8),
	datad => \u_pd_asp|ALT_INV_in_word_r\(9),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(8),
	combout => \u_pd_asp|u_core|LessThan0~0_combout\);

-- Location: LABCELL_X23_Y4_N0
\pd_in_word[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[2]~feeder_combout\ = \recv.data[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.data[2]~input_o\,
	combout => \pd_in_word[2]~feeder_combout\);

-- Location: LABCELL_X24_Y4_N21
\cor_low_payload_r~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_payload_r~4_combout\ = ( !\reset~input_o\ & ( \recv.data[18]~input_o\ & ( !\init~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_init~input_o\,
	datae => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_recv.data[18]~input_o\,
	combout => \cor_low_payload_r~4_combout\);

-- Location: LABCELL_X23_Y6_N30
\cor_low_payload_r[16]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_payload_r[16]~1_combout\ = ( \recv.data[28]~input_o\ & ( \pd_reset~combout\ ) ) # ( !\recv.data[28]~input_o\ & ( \pd_reset~combout\ ) ) # ( !\recv.data[28]~input_o\ & ( !\pd_reset~combout\ & ( (\pd_in_word~1_combout\ & (\recv.data[29]~input_o\ & 
-- (\Mux33~0_combout\ & \pd_in_word~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pd_in_word~1_combout\,
	datab => \ALT_INV_recv.data[29]~input_o\,
	datac => \ALT_INV_Mux33~0_combout\,
	datad => \ALT_INV_pd_in_word~0_combout\,
	datae => \ALT_INV_recv.data[28]~input_o\,
	dataf => \ALT_INV_pd_reset~combout\,
	combout => \cor_low_payload_r[16]~1_combout\);

-- Location: FF_X24_Y4_N23
\cor_low_payload_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cor_low_payload_r~4_combout\,
	ena => \cor_low_payload_r[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cor_low_payload_r(18));

-- Location: FF_X23_Y4_N1
\pd_in_word[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[2]~feeder_combout\,
	asdata => cor_low_payload_r(18),
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(2));

-- Location: FF_X17_Y5_N2
\u_pd_asp|in_word_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(2),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(2));

-- Location: LABCELL_X23_Y4_N51
\pd_in_word[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[3]~feeder_combout\ = ( \recv.data[3]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[3]~input_o\,
	combout => \pd_in_word[3]~feeder_combout\);

-- Location: LABCELL_X24_Y4_N0
\cor_low_payload_r~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_payload_r~3_combout\ = ( !\reset~input_o\ & ( \recv.data[19]~input_o\ & ( !\init~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_init~input_o\,
	datae => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_recv.data[19]~input_o\,
	combout => \cor_low_payload_r~3_combout\);

-- Location: FF_X24_Y4_N2
\cor_low_payload_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cor_low_payload_r~3_combout\,
	ena => \cor_low_payload_r[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cor_low_payload_r(19));

-- Location: FF_X23_Y4_N52
\pd_in_word[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[3]~feeder_combout\,
	asdata => cor_low_payload_r(19),
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(3));

-- Location: LABCELL_X17_Y5_N57
\u_pd_asp|in_word_r[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|in_word_r[3]~feeder_combout\ = ( pd_in_word(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_pd_in_word(3),
	combout => \u_pd_asp|in_word_r[3]~feeder_combout\);

-- Location: FF_X17_Y5_N59
\u_pd_asp|in_word_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|in_word_r[3]~feeder_combout\,
	sclr => \pd_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(3));

-- Location: FF_X16_Y5_N44
\u_pd_asp|u_core|last_corr_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(3),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(3));

-- Location: FF_X16_Y5_N50
\u_pd_asp|u_core|last_corr_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(2),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(2));

-- Location: LABCELL_X17_Y5_N24
\u_pd_asp|u_core|LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~4_combout\ = ( \u_pd_asp|u_core|last_corr_r\(3) & ( \u_pd_asp|u_core|last_corr_r\(2) & ( (!\u_pd_asp|in_word_r\(2)) # (!\u_pd_asp|in_word_r\(3)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(3) & ( \u_pd_asp|u_core|last_corr_r\(2) & 
-- ( (!\u_pd_asp|in_word_r\(2) & !\u_pd_asp|in_word_r\(3)) ) ) ) # ( \u_pd_asp|u_core|last_corr_r\(3) & ( !\u_pd_asp|u_core|last_corr_r\(2) & ( !\u_pd_asp|in_word_r\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000011110000000000001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_in_word_r\(2),
	datad => \u_pd_asp|ALT_INV_in_word_r\(3),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(3),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(2),
	combout => \u_pd_asp|u_core|LessThan0~4_combout\);

-- Location: IOIBUF_X54_Y0_N18
\recv.data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(1),
	o => \recv.data[1]~input_o\);

-- Location: LABCELL_X23_Y4_N27
\pd_in_word[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[1]~feeder_combout\ = ( \recv.data[1]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[1]~input_o\,
	combout => \pd_in_word[1]~feeder_combout\);

-- Location: LABCELL_X24_Y4_N12
\cor_low_payload_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_payload_r~0_combout\ = ( !\reset~input_o\ & ( \recv.data[17]~input_o\ & ( !\init~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_init~input_o\,
	datae => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_recv.data[17]~input_o\,
	combout => \cor_low_payload_r~0_combout\);

-- Location: FF_X24_Y4_N14
\cor_low_payload_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cor_low_payload_r~0_combout\,
	ena => \cor_low_payload_r[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cor_low_payload_r(17));

-- Location: FF_X23_Y4_N28
\pd_in_word[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[1]~feeder_combout\,
	asdata => cor_low_payload_r(17),
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(1));

-- Location: FF_X16_Y6_N41
\u_pd_asp|in_word_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(1),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(1));

-- Location: FF_X18_Y6_N23
\u_pd_asp|u_core|last_corr_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(1),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(1));

-- Location: IOIBUF_X34_Y0_N92
\recv.data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(0),
	o => \recv.data[0]~input_o\);

-- Location: LABCELL_X23_Y4_N9
\pd_in_word[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[0]~feeder_combout\ = ( \recv.data[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[0]~input_o\,
	combout => \pd_in_word[0]~feeder_combout\);

-- Location: LABCELL_X24_Y4_N33
\cor_low_payload_r~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \cor_low_payload_r~2_combout\ = ( !\reset~input_o\ & ( \recv.data[16]~input_o\ & ( !\init~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_init~input_o\,
	datae => \ALT_INV_reset~input_o\,
	dataf => \ALT_INV_recv.data[16]~input_o\,
	combout => \cor_low_payload_r~2_combout\);

-- Location: FF_X24_Y4_N34
\cor_low_payload_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \cor_low_payload_r~2_combout\,
	ena => \cor_low_payload_r[16]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cor_low_payload_r(16));

-- Location: FF_X23_Y4_N10
\pd_in_word[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[0]~feeder_combout\,
	asdata => cor_low_payload_r(16),
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(0));

-- Location: MLABCELL_X21_Y6_N39
\u_pd_asp|in_word_r[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|in_word_r[0]~feeder_combout\ = ( pd_in_word(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_pd_in_word(0),
	combout => \u_pd_asp|in_word_r[0]~feeder_combout\);

-- Location: FF_X21_Y6_N41
\u_pd_asp|in_word_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|in_word_r[0]~feeder_combout\,
	sclr => \pd_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(0));

-- Location: FF_X18_Y6_N5
\u_pd_asp|u_core|last_corr_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(0),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(0));

-- Location: LABCELL_X18_Y6_N21
\u_pd_asp|u_core|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~2_combout\ = ( \u_pd_asp|in_word_r\(1) & ( \u_pd_asp|u_core|last_corr_r\(0) & ( (\u_pd_asp|u_core|last_corr_r\(1) & !\u_pd_asp|in_word_r\(0)) ) ) ) # ( !\u_pd_asp|in_word_r\(1) & ( \u_pd_asp|u_core|last_corr_r\(0) & ( 
-- (!\u_pd_asp|in_word_r\(0)) # (\u_pd_asp|u_core|last_corr_r\(1)) ) ) ) # ( !\u_pd_asp|in_word_r\(1) & ( !\u_pd_asp|u_core|last_corr_r\(0) & ( \u_pd_asp|u_core|last_corr_r\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000000000000011111111010101010101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_last_corr_r\(1),
	datad => \u_pd_asp|ALT_INV_in_word_r\(0),
	datae => \u_pd_asp|ALT_INV_in_word_r\(1),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(0),
	combout => \u_pd_asp|u_core|LessThan0~2_combout\);

-- Location: LABCELL_X17_Y5_N36
\u_pd_asp|u_core|LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~3_combout\ = ( \u_pd_asp|u_core|last_corr_r\(3) & ( \u_pd_asp|u_core|last_corr_r\(2) & ( (\u_pd_asp|in_word_r\(2) & \u_pd_asp|in_word_r\(3)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(3) & ( \u_pd_asp|u_core|last_corr_r\(2) & ( 
-- (\u_pd_asp|in_word_r\(2) & !\u_pd_asp|in_word_r\(3)) ) ) ) # ( \u_pd_asp|u_core|last_corr_r\(3) & ( !\u_pd_asp|u_core|last_corr_r\(2) & ( (!\u_pd_asp|in_word_r\(2) & \u_pd_asp|in_word_r\(3)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(3) & ( 
-- !\u_pd_asp|u_core|last_corr_r\(2) & ( (!\u_pd_asp|in_word_r\(2) & !\u_pd_asp|in_word_r\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000000001111000000001111000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_in_word_r\(2),
	datad => \u_pd_asp|ALT_INV_in_word_r\(3),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(3),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(2),
	combout => \u_pd_asp|u_core|LessThan0~3_combout\);

-- Location: LABCELL_X23_Y4_N24
\pd_in_word[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[5]~feeder_combout\ = \recv.data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_recv.data[5]~input_o\,
	combout => \pd_in_word[5]~feeder_combout\);

-- Location: FF_X23_Y4_N26
\pd_in_word[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[5]~feeder_combout\,
	asdata => \recv.data[1]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(5));

-- Location: FF_X17_Y7_N53
\u_pd_asp|in_word_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(5),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(5));

-- Location: FF_X18_Y7_N53
\u_pd_asp|u_core|last_corr_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(5),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(5));

-- Location: LABCELL_X23_Y4_N6
\pd_in_word[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \pd_in_word[4]~feeder_combout\ = ( \recv.data[4]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_recv.data[4]~input_o\,
	combout => \pd_in_word[4]~feeder_combout\);

-- Location: FF_X23_Y4_N8
\pd_in_word[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \pd_in_word[4]~feeder_combout\,
	asdata => \recv.data[0]~input_o\,
	sclr => \pd_in_word[14]~9_combout\,
	sload => \pd_in_word[14]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pd_in_word(4));

-- Location: FF_X17_Y7_N50
\u_pd_asp|in_word_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => pd_in_word(4),
	sclr => \pd_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|in_word_r\(4));

-- Location: FF_X18_Y7_N47
\u_pd_asp|u_core|last_corr_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(4),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|last_corr_r\(4));

-- Location: LABCELL_X18_Y7_N6
\u_pd_asp|u_core|LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~5_combout\ = ( \u_pd_asp|in_word_r\(4) & ( \u_pd_asp|in_word_r\(5) & ( (\u_pd_asp|u_core|last_corr_r\(5) & \u_pd_asp|u_core|last_corr_r\(4)) ) ) ) # ( !\u_pd_asp|in_word_r\(4) & ( \u_pd_asp|in_word_r\(5) & ( 
-- (\u_pd_asp|u_core|last_corr_r\(5) & !\u_pd_asp|u_core|last_corr_r\(4)) ) ) ) # ( \u_pd_asp|in_word_r\(4) & ( !\u_pd_asp|in_word_r\(5) & ( (!\u_pd_asp|u_core|last_corr_r\(5) & \u_pd_asp|u_core|last_corr_r\(4)) ) ) ) # ( !\u_pd_asp|in_word_r\(4) & ( 
-- !\u_pd_asp|in_word_r\(5) & ( (!\u_pd_asp|u_core|last_corr_r\(5) & !\u_pd_asp|u_core|last_corr_r\(4)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000000001111000000001111000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(5),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(4),
	datae => \u_pd_asp|ALT_INV_in_word_r\(4),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(5),
	combout => \u_pd_asp|u_core|LessThan0~5_combout\);

-- Location: LABCELL_X18_Y6_N30
\u_pd_asp|u_core|LessThan0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~6_combout\ = ( \u_pd_asp|u_core|LessThan0~3_combout\ & ( \u_pd_asp|u_core|LessThan0~5_combout\ & ( (\u_pd_asp|u_core|LessThan0~1_combout\ & (\u_pd_asp|u_core|LessThan0~0_combout\ & ((\u_pd_asp|u_core|LessThan0~2_combout\) # 
-- (\u_pd_asp|u_core|LessThan0~4_combout\)))) ) ) ) # ( !\u_pd_asp|u_core|LessThan0~3_combout\ & ( \u_pd_asp|u_core|LessThan0~5_combout\ & ( (\u_pd_asp|u_core|LessThan0~1_combout\ & (\u_pd_asp|u_core|LessThan0~0_combout\ & 
-- \u_pd_asp|u_core|LessThan0~4_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_LessThan0~1_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_LessThan0~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan0~4_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_LessThan0~2_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_LessThan0~3_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~5_combout\,
	combout => \u_pd_asp|u_core|LessThan0~6_combout\);

-- Location: LABCELL_X17_Y7_N51
\u_pd_asp|u_core|LessThan0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~8_combout\ = ( \u_pd_asp|u_core|last_corr_r\(5) & ( (!\u_pd_asp|in_word_r\(5)) # ((\u_pd_asp|u_core|last_corr_r\(4) & !\u_pd_asp|in_word_r\(4))) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(5) & ( (\u_pd_asp|u_core|last_corr_r\(4) & 
-- (!\u_pd_asp|in_word_r\(4) & !\u_pd_asp|in_word_r\(5))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000011111111010100001111111101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_last_corr_r\(4),
	datac => \u_pd_asp|ALT_INV_in_word_r\(4),
	datad => \u_pd_asp|ALT_INV_in_word_r\(5),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(5),
	combout => \u_pd_asp|u_core|LessThan0~8_combout\);

-- Location: LABCELL_X19_Y8_N42
\u_pd_asp|u_core|LessThan0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~9_combout\ = ( \u_pd_asp|u_core|last_corr_r\(9) & ( \u_pd_asp|u_core|last_corr_r\(8) & ( (!\u_pd_asp|in_word_r\(9)) # (!\u_pd_asp|in_word_r\(8)) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(9) & ( \u_pd_asp|u_core|last_corr_r\(8) & 
-- ( (!\u_pd_asp|in_word_r\(9) & !\u_pd_asp|in_word_r\(8)) ) ) ) # ( \u_pd_asp|u_core|last_corr_r\(9) & ( !\u_pd_asp|u_core|last_corr_r\(8) & ( !\u_pd_asp|in_word_r\(9) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000011110000000000001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_in_word_r\(9),
	datad => \u_pd_asp|ALT_INV_in_word_r\(8),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(9),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(8),
	combout => \u_pd_asp|u_core|LessThan0~9_combout\);

-- Location: LABCELL_X17_Y7_N42
\u_pd_asp|u_core|LessThan0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~7_combout\ = ( \u_pd_asp|u_core|last_corr_r\(6) & ( (!\u_pd_asp|in_word_r\(6) & ((!\u_pd_asp|in_word_r\(7)) # (\u_pd_asp|u_core|last_corr_r\(7)))) # (\u_pd_asp|in_word_r\(6) & (\u_pd_asp|u_core|last_corr_r\(7) & 
-- !\u_pd_asp|in_word_r\(7))) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(6) & ( (\u_pd_asp|u_core|last_corr_r\(7) & !\u_pd_asp|in_word_r\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000011001111000011001100111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_in_word_r\(6),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(7),
	datad => \u_pd_asp|ALT_INV_in_word_r\(7),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(6),
	combout => \u_pd_asp|u_core|LessThan0~7_combout\);

-- Location: LABCELL_X18_Y7_N54
\u_pd_asp|u_core|LessThan0~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~10_combout\ = ( !\u_pd_asp|u_core|LessThan0~7_combout\ & ( \u_pd_asp|u_core|LessThan0~0_combout\ & ( (!\u_pd_asp|u_core|LessThan0~9_combout\ & ((!\u_pd_asp|u_core|LessThan0~8_combout\) # 
-- (!\u_pd_asp|u_core|LessThan0~1_combout\))) ) ) ) # ( \u_pd_asp|u_core|LessThan0~7_combout\ & ( !\u_pd_asp|u_core|LessThan0~0_combout\ & ( !\u_pd_asp|u_core|LessThan0~9_combout\ ) ) ) # ( !\u_pd_asp|u_core|LessThan0~7_combout\ & ( 
-- !\u_pd_asp|u_core|LessThan0~0_combout\ & ( !\u_pd_asp|u_core|LessThan0~9_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_LessThan0~8_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan0~1_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_LessThan0~9_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_LessThan0~7_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~0_combout\,
	combout => \u_pd_asp|u_core|LessThan0~10_combout\);

-- Location: LABCELL_X19_Y7_N6
\u_pd_asp|u_core|state_r~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~4_combout\ = ( \u_pd_asp|u_core|LessThan0~6_combout\ & ( \u_pd_asp|u_core|LessThan0~10_combout\ & ( (!\u_pd_asp|u_core|state_r~q\ & ((!\u_pd_asp|u_core|LessThan0~16_combout\) # ((\u_pd_asp|u_core|LessThan0~19_combout\) # 
-- (\u_pd_asp|u_core|LessThan0~12_combout\)))) ) ) ) # ( !\u_pd_asp|u_core|LessThan0~6_combout\ & ( \u_pd_asp|u_core|LessThan0~10_combout\ & ( (!\u_pd_asp|u_core|state_r~q\ & ((!\u_pd_asp|u_core|LessThan0~16_combout\) # 
-- (\u_pd_asp|u_core|LessThan0~19_combout\))) ) ) ) # ( \u_pd_asp|u_core|LessThan0~6_combout\ & ( !\u_pd_asp|u_core|LessThan0~10_combout\ & ( (!\u_pd_asp|u_core|state_r~q\ & ((!\u_pd_asp|u_core|LessThan0~16_combout\) # 
-- ((\u_pd_asp|u_core|LessThan0~19_combout\) # (\u_pd_asp|u_core|LessThan0~12_combout\)))) ) ) ) # ( !\u_pd_asp|u_core|LessThan0~6_combout\ & ( !\u_pd_asp|u_core|LessThan0~10_combout\ & ( (!\u_pd_asp|u_core|state_r~q\ & 
-- ((!\u_pd_asp|u_core|LessThan0~16_combout\) # ((\u_pd_asp|u_core|LessThan0~19_combout\) # (\u_pd_asp|u_core|LessThan0~12_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110011001100100011001100110010001000110011001000110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_LessThan0~16_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_state_r~q\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan0~12_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_LessThan0~19_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_LessThan0~6_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~10_combout\,
	combout => \u_pd_asp|u_core|state_r~4_combout\);

-- Location: LABCELL_X18_Y7_N21
\u_pd_asp|u_core|state_r~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~11_combout\ = ( \u_pd_asp|in_word_r\(17) & ( (!\u_pd_asp|u_core|last_corr_r\(17)) # ((!\u_pd_asp|u_core|last_corr_r\(16) & \u_pd_asp|in_word_r\(16))) ) ) # ( !\u_pd_asp|in_word_r\(17) & ( (!\u_pd_asp|u_core|last_corr_r\(16) & 
-- (\u_pd_asp|in_word_r\(16) & !\u_pd_asp|u_core|last_corr_r\(17))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000000000000011000000000011111111000011001111111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_last_corr_r\(16),
	datac => \u_pd_asp|ALT_INV_in_word_r\(16),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(17),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(17),
	combout => \u_pd_asp|u_core|state_r~11_combout\);

-- Location: LABCELL_X18_Y7_N48
\u_pd_asp|u_core|state_r~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~13_combout\ = ( \u_pd_asp|in_word_r\(19) & ( \u_pd_asp|in_word_r\(18) & ( (!\u_pd_asp|u_core|last_corr_r\(19)) # (!\u_pd_asp|u_core|last_corr_r\(18)) ) ) ) # ( !\u_pd_asp|in_word_r\(19) & ( \u_pd_asp|in_word_r\(18) & ( 
-- (!\u_pd_asp|u_core|last_corr_r\(19) & !\u_pd_asp|u_core|last_corr_r\(18)) ) ) ) # ( \u_pd_asp|in_word_r\(19) & ( !\u_pd_asp|in_word_r\(18) & ( !\u_pd_asp|u_core|last_corr_r\(19) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101010100000101000001111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_last_corr_r\(19),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(18),
	datae => \u_pd_asp|ALT_INV_in_word_r\(19),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(18),
	combout => \u_pd_asp|u_core|state_r~13_combout\);

-- Location: LABCELL_X17_Y5_N12
\u_pd_asp|u_core|state_r~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~12_combout\ = ( !\u_pd_asp|u_core|last_corr_r\(14) & ( \u_pd_asp|u_core|last_corr_r\(15) & ( (\u_pd_asp|in_word_r\(14) & \u_pd_asp|in_word_r\(15)) ) ) ) # ( \u_pd_asp|u_core|last_corr_r\(14) & ( !\u_pd_asp|u_core|last_corr_r\(15) 
-- & ( \u_pd_asp|in_word_r\(15) ) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(14) & ( !\u_pd_asp|u_core|last_corr_r\(15) & ( (\u_pd_asp|in_word_r\(15)) # (\u_pd_asp|in_word_r\(14)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111000011110000111100000011000000110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_in_word_r\(14),
	datac => \u_pd_asp|ALT_INV_in_word_r\(15),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(14),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(15),
	combout => \u_pd_asp|u_core|state_r~12_combout\);

-- Location: LABCELL_X16_Y7_N54
\u_pd_asp|u_core|state_r~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~14_combout\ = ( !\u_pd_asp|u_core|state_r~13_combout\ & ( \u_pd_asp|u_core|state_r~12_combout\ & ( (!\u_pd_asp|u_core|state_r~0_combout\) # ((!\u_pd_asp|u_core|state_r~1_combout\ & !\u_pd_asp|u_core|state_r~11_combout\)) ) ) ) # ( 
-- !\u_pd_asp|u_core|state_r~13_combout\ & ( !\u_pd_asp|u_core|state_r~12_combout\ & ( (!\u_pd_asp|u_core|state_r~0_combout\) # (!\u_pd_asp|u_core|state_r~11_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111001100000000000000000011111100110011000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_state_r~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_state_r~1_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_state_r~11_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_state_r~13_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~12_combout\,
	combout => \u_pd_asp|u_core|state_r~14_combout\);

-- Location: LABCELL_X18_Y6_N9
\u_pd_asp|u_core|LessThan0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~21_combout\ = ( \u_pd_asp|u_core|LessThan0~5_combout\ & ( (\u_pd_asp|u_core|LessThan0~1_combout\ & \u_pd_asp|u_core|LessThan0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_LessThan0~1_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan0~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~5_combout\,
	combout => \u_pd_asp|u_core|LessThan0~21_combout\);

-- Location: LABCELL_X18_Y6_N36
\u_pd_asp|u_core|state_r~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~5_combout\ = ( \u_pd_asp|u_core|last_corr_r\(1) & ( (\u_pd_asp|in_word_r\(1) & (\u_pd_asp|in_word_r\(0) & !\u_pd_asp|u_core|last_corr_r\(0))) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(1) & ( ((\u_pd_asp|in_word_r\(0) & 
-- !\u_pd_asp|u_core|last_corr_r\(0))) # (\u_pd_asp|in_word_r\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101010101000001010000000001011111010101010000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(1),
	datac => \u_pd_asp|ALT_INV_in_word_r\(0),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(0),
	datae => \u_pd_asp|u_core|ALT_INV_last_corr_r\(1),
	combout => \u_pd_asp|u_core|state_r~5_combout\);

-- Location: LABCELL_X17_Y5_N51
\u_pd_asp|u_core|state_r~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~6_combout\ = ( \u_pd_asp|u_core|state_r~5_combout\ & ( (!\u_pd_asp|in_word_r\(3) & (!\u_pd_asp|u_core|last_corr_r\(3) & ((!\u_pd_asp|u_core|last_corr_r\(2)) # (\u_pd_asp|in_word_r\(2))))) # (\u_pd_asp|in_word_r\(3) & 
-- (((!\u_pd_asp|u_core|last_corr_r\(2)) # (!\u_pd_asp|u_core|last_corr_r\(3))) # (\u_pd_asp|in_word_r\(2)))) ) ) # ( !\u_pd_asp|u_core|state_r~5_combout\ & ( (!\u_pd_asp|in_word_r\(3) & (\u_pd_asp|in_word_r\(2) & (!\u_pd_asp|u_core|last_corr_r\(2) & 
-- !\u_pd_asp|u_core|last_corr_r\(3)))) # (\u_pd_asp|in_word_r\(3) & ((!\u_pd_asp|u_core|last_corr_r\(3)) # ((\u_pd_asp|in_word_r\(2) & !\u_pd_asp|u_core|last_corr_r\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001100010000011100110001000011110111001100011111011100110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(2),
	datab => \u_pd_asp|ALT_INV_in_word_r\(3),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(2),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(3),
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~5_combout\,
	combout => \u_pd_asp|u_core|state_r~6_combout\);

-- Location: LABCELL_X19_Y5_N27
\u_pd_asp|u_core|state_r~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~15_combout\ = ( \u_pd_asp|in_word_r\(13) & ( \u_pd_asp|in_word_r\(12) & ( (!\u_pd_asp|u_core|last_corr_r\(13)) # (!\u_pd_asp|u_core|last_corr_r\(12)) ) ) ) # ( !\u_pd_asp|in_word_r\(13) & ( \u_pd_asp|in_word_r\(12) & ( 
-- (!\u_pd_asp|u_core|last_corr_r\(13) & !\u_pd_asp|u_core|last_corr_r\(12)) ) ) ) # ( \u_pd_asp|in_word_r\(13) & ( !\u_pd_asp|in_word_r\(12) & ( !\u_pd_asp|u_core|last_corr_r\(13) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000011110000000000001111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(13),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(12),
	datae => \u_pd_asp|ALT_INV_in_word_r\(13),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(12),
	combout => \u_pd_asp|u_core|state_r~15_combout\);

-- Location: LABCELL_X19_Y5_N36
\u_pd_asp|u_core|state_r~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~16_combout\ = ( \u_pd_asp|in_word_r\(10) & ( (!\u_pd_asp|u_core|last_corr_r\(11) & ((!\u_pd_asp|u_core|last_corr_r\(10)) # (\u_pd_asp|in_word_r\(11)))) # (\u_pd_asp|u_core|last_corr_r\(11) & (\u_pd_asp|in_word_r\(11) & 
-- !\u_pd_asp|u_core|last_corr_r\(10))) ) ) # ( !\u_pd_asp|in_word_r\(10) & ( (!\u_pd_asp|u_core|last_corr_r\(11) & \u_pd_asp|in_word_r\(11)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110011001111000011001100111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_last_corr_r\(11),
	datac => \u_pd_asp|ALT_INV_in_word_r\(11),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(10),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(10),
	combout => \u_pd_asp|u_core|state_r~16_combout\);

-- Location: LABCELL_X18_Y6_N57
\u_pd_asp|u_core|state_r~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~17_combout\ = ( \u_pd_asp|u_core|state_r~16_combout\ & ( \u_pd_asp|u_core|state_r~2_combout\ & ( (\u_pd_asp|u_core|state_r~1_combout\ & (\u_pd_asp|u_core|state_r~0_combout\ & ((\u_pd_asp|u_core|state_r~3_combout\) # 
-- (\u_pd_asp|u_core|state_r~15_combout\)))) ) ) ) # ( !\u_pd_asp|u_core|state_r~16_combout\ & ( \u_pd_asp|u_core|state_r~2_combout\ & ( (\u_pd_asp|u_core|state_r~15_combout\ & (\u_pd_asp|u_core|state_r~1_combout\ & \u_pd_asp|u_core|state_r~0_combout\)) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000100010000000000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_state_r~15_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_state_r~1_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_state_r~3_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_state_r~0_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_state_r~16_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~2_combout\,
	combout => \u_pd_asp|u_core|state_r~17_combout\);

-- Location: LABCELL_X17_Y7_N54
\u_pd_asp|u_core|state_r~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~8_combout\ = ( \u_pd_asp|u_core|last_corr_r\(4) & ( (\u_pd_asp|in_word_r\(5) & !\u_pd_asp|u_core|last_corr_r\(5)) ) ) # ( !\u_pd_asp|u_core|last_corr_r\(4) & ( (!\u_pd_asp|in_word_r\(5) & (!\u_pd_asp|u_core|last_corr_r\(5) & 
-- \u_pd_asp|in_word_r\(4))) # (\u_pd_asp|in_word_r\(5) & ((!\u_pd_asp|u_core|last_corr_r\(5)) # (\u_pd_asp|in_word_r\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000011110011001100001111001100110000001100000011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_in_word_r\(5),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(5),
	datad => \u_pd_asp|ALT_INV_in_word_r\(4),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(4),
	combout => \u_pd_asp|u_core|state_r~8_combout\);

-- Location: LABCELL_X17_Y7_N21
\u_pd_asp|u_core|state_r~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~7_combout\ = ( \u_pd_asp|in_word_r\(7) & ( \u_pd_asp|u_core|last_corr_r\(6) & ( !\u_pd_asp|u_core|last_corr_r\(7) ) ) ) # ( \u_pd_asp|in_word_r\(7) & ( !\u_pd_asp|u_core|last_corr_r\(6) & ( (!\u_pd_asp|u_core|last_corr_r\(7)) # 
-- (\u_pd_asp|in_word_r\(6)) ) ) ) # ( !\u_pd_asp|in_word_r\(7) & ( !\u_pd_asp|u_core|last_corr_r\(6) & ( (\u_pd_asp|in_word_r\(6) & !\u_pd_asp|u_core|last_corr_r\(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000111111110101010100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(6),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(7),
	datae => \u_pd_asp|ALT_INV_in_word_r\(7),
	dataf => \u_pd_asp|u_core|ALT_INV_last_corr_r\(6),
	combout => \u_pd_asp|u_core|state_r~7_combout\);

-- Location: LABCELL_X19_Y8_N48
\u_pd_asp|u_core|state_r~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~9_combout\ = ( \u_pd_asp|in_word_r\(8) & ( (!\u_pd_asp|in_word_r\(9) & (!\u_pd_asp|u_core|last_corr_r\(8) & !\u_pd_asp|u_core|last_corr_r\(9))) # (\u_pd_asp|in_word_r\(9) & ((!\u_pd_asp|u_core|last_corr_r\(8)) # 
-- (!\u_pd_asp|u_core|last_corr_r\(9)))) ) ) # ( !\u_pd_asp|in_word_r\(8) & ( (\u_pd_asp|in_word_r\(9) & !\u_pd_asp|u_core|last_corr_r\(9)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000011110101010100001111010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(9),
	datac => \u_pd_asp|u_core|ALT_INV_last_corr_r\(8),
	datad => \u_pd_asp|u_core|ALT_INV_last_corr_r\(9),
	dataf => \u_pd_asp|ALT_INV_in_word_r\(8),
	combout => \u_pd_asp|u_core|state_r~9_combout\);

-- Location: LABCELL_X16_Y7_N15
\u_pd_asp|u_core|state_r~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~10_combout\ = ( \u_pd_asp|u_core|LessThan0~0_combout\ & ( !\u_pd_asp|u_core|state_r~9_combout\ & ( (!\u_pd_asp|u_core|state_r~7_combout\ & ((!\u_pd_asp|u_core|state_r~8_combout\) # (!\u_pd_asp|u_core|LessThan0~1_combout\))) ) ) ) 
-- # ( !\u_pd_asp|u_core|LessThan0~0_combout\ & ( !\u_pd_asp|u_core|state_r~9_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_state_r~8_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan0~1_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_state_r~7_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_LessThan0~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~9_combout\,
	combout => \u_pd_asp|u_core|state_r~10_combout\);

-- Location: LABCELL_X17_Y7_N15
\u_pd_asp|u_core|state_r~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~18_combout\ = ( !\u_pd_asp|u_core|state_r~17_combout\ & ( \u_pd_asp|u_core|state_r~10_combout\ & ( (\u_pd_asp|u_core|state_r~14_combout\ & ((!\u_pd_asp|u_core|LessThan0~21_combout\) # ((!\u_pd_asp|u_core|state_r~6_combout\) # 
-- (!\u_pd_asp|u_core|LessThan0~12_combout\)))) ) ) ) # ( !\u_pd_asp|u_core|state_r~17_combout\ & ( !\u_pd_asp|u_core|state_r~10_combout\ & ( (\u_pd_asp|u_core|state_r~14_combout\ & !\u_pd_asp|u_core|LessThan0~12_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000000000000000000001010101010101000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_state_r~14_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_LessThan0~21_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_state_r~6_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_LessThan0~12_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_state_r~17_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~10_combout\,
	combout => \u_pd_asp|u_core|state_r~18_combout\);

-- Location: LABCELL_X18_Y7_N30
\u_pd_asp|u_core|state_r~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|state_r~19_combout\ = ( \u_pd_asp|u_core|state_r~q\ & ( \u_pd_asp|u_core|state_r~18_combout\ & ( (!\u_pd_asp|u_core|process_0~0_combout\ & ((!\u_pd_asp|u_core|sample_accepted~0_combout\) # ((!\u_pd_asp|u_core|state_r~4_combout\) # 
-- (!\u_pd_asp|u_core|first_seen_r~q\)))) ) ) ) # ( !\u_pd_asp|u_core|state_r~q\ & ( \u_pd_asp|u_core|state_r~18_combout\ & ( (\u_pd_asp|u_core|sample_accepted~0_combout\ & (!\u_pd_asp|u_core|process_0~0_combout\ & (\u_pd_asp|u_core|state_r~4_combout\ & 
-- \u_pd_asp|u_core|first_seen_r~q\))) ) ) ) # ( \u_pd_asp|u_core|state_r~q\ & ( !\u_pd_asp|u_core|state_r~18_combout\ & ( (!\u_pd_asp|u_core|process_0~0_combout\ & ((!\u_pd_asp|u_core|sample_accepted~0_combout\) # (!\u_pd_asp|u_core|first_seen_r~q\))) ) ) ) 
-- # ( !\u_pd_asp|u_core|state_r~q\ & ( !\u_pd_asp|u_core|state_r~18_combout\ & ( (\u_pd_asp|u_core|sample_accepted~0_combout\ & (!\u_pd_asp|u_core|process_0~0_combout\ & (\u_pd_asp|u_core|state_r~4_combout\ & \u_pd_asp|u_core|first_seen_r~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100110011001000100000000000000001001100110011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_process_0~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_state_r~4_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_first_seen_r~q\,
	datae => \u_pd_asp|u_core|ALT_INV_state_r~q\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~18_combout\,
	combout => \u_pd_asp|u_core|state_r~19_combout\);

-- Location: FF_X18_Y7_N32
\u_pd_asp|u_core|state_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|state_r~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|state_r~q\);

-- Location: LABCELL_X19_Y6_N51
\u_pd_asp|core_clear\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|core_clear~combout\ = ( \u_pd_asp|core_clear~1_combout\ & ( \u_pd_asp|core_clear~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	dataf => \u_pd_asp|ALT_INV_core_clear~1_combout\,
	combout => \u_pd_asp|core_clear~combout\);

-- Location: LABCELL_X19_Y6_N48
\u_pd_asp|u_core|LessThan0~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan0~20_combout\ = ( \u_pd_asp|u_core|LessThan0~10_combout\ & ( (\u_pd_asp|u_core|LessThan0~16_combout\ & (!\u_pd_asp|u_core|LessThan0~19_combout\ & ((!\u_pd_asp|u_core|LessThan0~6_combout\) # 
-- (!\u_pd_asp|u_core|LessThan0~12_combout\)))) ) ) # ( !\u_pd_asp|u_core|LessThan0~10_combout\ & ( (\u_pd_asp|u_core|LessThan0~16_combout\ & (!\u_pd_asp|u_core|LessThan0~19_combout\ & !\u_pd_asp|u_core|LessThan0~12_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000000001100000000000000110000001000000011000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_LessThan0~6_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_LessThan0~16_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan0~19_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_LessThan0~12_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~10_combout\,
	combout => \u_pd_asp|u_core|LessThan0~20_combout\);

-- Location: LABCELL_X19_Y6_N54
\u_pd_asp|u_core|counter_r[17]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|counter_r[17]~0_combout\ = ( \u_pd_asp|core_clear~combout\ & ( \u_pd_asp|u_core|LessThan0~20_combout\ ) ) # ( !\u_pd_asp|core_clear~combout\ & ( \u_pd_asp|u_core|LessThan0~20_combout\ & ( (\reset~input_o\) # (\init~input_o\) ) ) ) # ( 
-- \u_pd_asp|core_clear~combout\ & ( !\u_pd_asp|u_core|LessThan0~20_combout\ ) ) # ( !\u_pd_asp|core_clear~combout\ & ( !\u_pd_asp|u_core|LessThan0~20_combout\ & ( (((!\u_pd_asp|u_core|state_r~q\ & \u_pd_asp|u_core|first_seen_r~q\)) # (\reset~input_o\)) # 
-- (\init~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111110111111111111111111111100111111001111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_state_r~q\,
	datab => \ALT_INV_init~input_o\,
	datac => \ALT_INV_reset~input_o\,
	datad => \u_pd_asp|u_core|ALT_INV_first_seen_r~q\,
	datae => \u_pd_asp|ALT_INV_core_clear~combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan0~20_combout\,
	combout => \u_pd_asp|u_core|counter_r[17]~0_combout\);

-- Location: FF_X19_Y7_N32
\u_pd_asp|u_core|counter_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~1_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(0));

-- Location: LABCELL_X19_Y7_N33
\u_pd_asp|u_core|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~5_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(1) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~2\ ))
-- \u_pd_asp|u_core|Add0~6\ = CARRY(( \u_pd_asp|u_core|counter_r\(1) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(1),
	cin => \u_pd_asp|u_core|Add0~2\,
	sumout => \u_pd_asp|u_core|Add0~5_sumout\,
	cout => \u_pd_asp|u_core|Add0~6\);

-- Location: FF_X19_Y7_N35
\u_pd_asp|u_core|counter_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~5_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(1));

-- Location: LABCELL_X19_Y7_N36
\u_pd_asp|u_core|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~9_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(2) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~6\ ))
-- \u_pd_asp|u_core|Add0~10\ = CARRY(( \u_pd_asp|u_core|counter_r\(2) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(2),
	cin => \u_pd_asp|u_core|Add0~6\,
	sumout => \u_pd_asp|u_core|Add0~9_sumout\,
	cout => \u_pd_asp|u_core|Add0~10\);

-- Location: FF_X19_Y7_N38
\u_pd_asp|u_core|counter_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~9_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(2));

-- Location: LABCELL_X19_Y7_N39
\u_pd_asp|u_core|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~13_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(3) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~10\ ))
-- \u_pd_asp|u_core|Add0~14\ = CARRY(( \u_pd_asp|u_core|counter_r\(3) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(3),
	cin => \u_pd_asp|u_core|Add0~10\,
	sumout => \u_pd_asp|u_core|Add0~13_sumout\,
	cout => \u_pd_asp|u_core|Add0~14\);

-- Location: FF_X19_Y7_N41
\u_pd_asp|u_core|counter_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~13_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(3));

-- Location: LABCELL_X19_Y7_N42
\u_pd_asp|u_core|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~17_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(4) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~14\ ))
-- \u_pd_asp|u_core|Add0~18\ = CARRY(( \u_pd_asp|u_core|counter_r\(4) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(4),
	cin => \u_pd_asp|u_core|Add0~14\,
	sumout => \u_pd_asp|u_core|Add0~17_sumout\,
	cout => \u_pd_asp|u_core|Add0~18\);

-- Location: FF_X19_Y7_N44
\u_pd_asp|u_core|counter_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~17_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(4));

-- Location: LABCELL_X19_Y7_N45
\u_pd_asp|u_core|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~21_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(5) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~18\ ))
-- \u_pd_asp|u_core|Add0~22\ = CARRY(( \u_pd_asp|u_core|counter_r\(5) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(5),
	cin => \u_pd_asp|u_core|Add0~18\,
	sumout => \u_pd_asp|u_core|Add0~21_sumout\,
	cout => \u_pd_asp|u_core|Add0~22\);

-- Location: FF_X19_Y7_N47
\u_pd_asp|u_core|counter_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~21_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(5));

-- Location: LABCELL_X19_Y7_N48
\u_pd_asp|u_core|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~25_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(6) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~22\ ))
-- \u_pd_asp|u_core|Add0~26\ = CARRY(( \u_pd_asp|u_core|counter_r\(6) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(6),
	cin => \u_pd_asp|u_core|Add0~22\,
	sumout => \u_pd_asp|u_core|Add0~25_sumout\,
	cout => \u_pd_asp|u_core|Add0~26\);

-- Location: FF_X19_Y7_N50
\u_pd_asp|u_core|counter_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~25_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(6));

-- Location: LABCELL_X19_Y7_N51
\u_pd_asp|u_core|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~29_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(7) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~26\ ))
-- \u_pd_asp|u_core|Add0~30\ = CARRY(( \u_pd_asp|u_core|counter_r\(7) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(7),
	cin => \u_pd_asp|u_core|Add0~26\,
	sumout => \u_pd_asp|u_core|Add0~29_sumout\,
	cout => \u_pd_asp|u_core|Add0~30\);

-- Location: FF_X19_Y7_N53
\u_pd_asp|u_core|counter_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~29_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(7));

-- Location: LABCELL_X19_Y5_N30
\u_pd_asp|cfg_min_spacing~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|cfg_min_spacing~2_combout\ = ( !\u_pd_asp|in_word_r\(14) & ( (!\reset~input_o\ & !\init~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_reset~input_o\,
	datad => \ALT_INV_init~input_o\,
	dataf => \u_pd_asp|ALT_INV_in_word_r\(14),
	combout => \u_pd_asp|cfg_min_spacing~2_combout\);

-- Location: MLABCELL_X21_Y5_N42
\u_pd_asp|cfg_output_dest[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|cfg_output_dest[1]~0_combout\ = ( \u_pd_asp|in_word_r\(24) & ( \u_pd_asp|enabled_r~0_combout\ & ( (!\u_pd_asp|in_word_r\(25)) # ((\reset~input_o\) # (\init~input_o\)) ) ) ) # ( !\u_pd_asp|in_word_r\(24) & ( \u_pd_asp|enabled_r~0_combout\ & ( 
-- (\reset~input_o\) # (\init~input_o\) ) ) ) # ( \u_pd_asp|in_word_r\(24) & ( !\u_pd_asp|enabled_r~0_combout\ & ( (\reset~input_o\) # (\init~input_o\) ) ) ) # ( !\u_pd_asp|in_word_r\(24) & ( !\u_pd_asp|enabled_r~0_combout\ & ( (\reset~input_o\) # 
-- (\init~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111100111111001111111011111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(25),
	datab => \ALT_INV_init~input_o\,
	datac => \ALT_INV_reset~input_o\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(24),
	dataf => \u_pd_asp|ALT_INV_enabled_r~0_combout\,
	combout => \u_pd_asp|cfg_output_dest[1]~0_combout\);

-- Location: FF_X17_Y7_N11
\u_pd_asp|cfg_min_spacing[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|cfg_min_spacing~2_combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(6));

-- Location: FF_X17_Y7_N8
\u_pd_asp|cfg_min_spacing[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(13),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(5));

-- Location: LABCELL_X19_Y5_N9
\u_pd_asp|cfg_min_spacing~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|cfg_min_spacing~1_combout\ = ( !\u_pd_asp|in_word_r\(15) & ( (!\reset~input_o\ & !\init~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \ALT_INV_init~input_o\,
	dataf => \u_pd_asp|ALT_INV_in_word_r\(15),
	combout => \u_pd_asp|cfg_min_spacing~1_combout\);

-- Location: FF_X17_Y7_N26
\u_pd_asp|cfg_min_spacing[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|cfg_min_spacing~1_combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(7));

-- Location: LABCELL_X17_Y7_N24
\u_pd_asp|u_core|LessThan1~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~7_combout\ = ( \u_pd_asp|cfg_min_spacing\(7) & ( \u_pd_asp|u_core|counter_r\(5) & ( (!\u_pd_asp|u_core|counter_r\(7) & (!\u_pd_asp|cfg_min_spacing\(6) & !\u_pd_asp|u_core|counter_r\(6))) ) ) ) # ( !\u_pd_asp|cfg_min_spacing\(7) 
-- & ( \u_pd_asp|u_core|counter_r\(5) & ( (!\u_pd_asp|u_core|counter_r\(7)) # ((!\u_pd_asp|cfg_min_spacing\(6) & !\u_pd_asp|u_core|counter_r\(6))) ) ) ) # ( \u_pd_asp|cfg_min_spacing\(7) & ( !\u_pd_asp|u_core|counter_r\(5) & ( 
-- (!\u_pd_asp|u_core|counter_r\(7) & ((!\u_pd_asp|cfg_min_spacing\(6) & ((!\u_pd_asp|u_core|counter_r\(6)) # (\u_pd_asp|cfg_min_spacing\(5)))) # (\u_pd_asp|cfg_min_spacing\(6) & (!\u_pd_asp|u_core|counter_r\(6) & \u_pd_asp|cfg_min_spacing\(5))))) ) ) ) # ( 
-- !\u_pd_asp|cfg_min_spacing\(7) & ( !\u_pd_asp|u_core|counter_r\(5) & ( (!\u_pd_asp|u_core|counter_r\(7)) # ((!\u_pd_asp|cfg_min_spacing\(6) & ((!\u_pd_asp|u_core|counter_r\(6)) # (\u_pd_asp|cfg_min_spacing\(5)))) # (\u_pd_asp|cfg_min_spacing\(6) & 
-- (!\u_pd_asp|u_core|counter_r\(6) & \u_pd_asp|cfg_min_spacing\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110101011111110100000001010100011101010111010101000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(7),
	datab => \u_pd_asp|ALT_INV_cfg_min_spacing\(6),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(6),
	datad => \u_pd_asp|ALT_INV_cfg_min_spacing\(5),
	datae => \u_pd_asp|ALT_INV_cfg_min_spacing\(7),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(5),
	combout => \u_pd_asp|u_core|LessThan1~7_combout\);

-- Location: FF_X17_Y7_N44
\u_pd_asp|cfg_threshold[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(7),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_threshold\(3));

-- Location: FF_X17_Y7_N28
\u_pd_asp|cfg_threshold[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(6),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_threshold\(2));

-- Location: FF_X17_Y7_N56
\u_pd_asp|cfg_threshold[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(4),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_threshold\(0));

-- Location: FF_X17_Y7_N47
\u_pd_asp|cfg_threshold[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(5),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_threshold\(1));

-- Location: LABCELL_X17_Y7_N57
\u_pd_asp|u_core|qualifies_threshold~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|qualifies_threshold~0_combout\ = ( \u_pd_asp|cfg_threshold\(1) & ( (!\u_pd_asp|cfg_threshold\(0) & (\u_pd_asp|in_word_r\(16) & \u_pd_asp|in_word_r\(17))) ) ) # ( !\u_pd_asp|cfg_threshold\(1) & ( ((!\u_pd_asp|cfg_threshold\(0) & 
-- \u_pd_asp|in_word_r\(16))) # (\u_pd_asp|in_word_r\(17)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101011111111000010101111111100000000000010100000000000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_cfg_threshold\(0),
	datac => \u_pd_asp|ALT_INV_in_word_r\(16),
	datad => \u_pd_asp|ALT_INV_in_word_r\(17),
	dataf => \u_pd_asp|ALT_INV_cfg_threshold\(1),
	combout => \u_pd_asp|u_core|qualifies_threshold~0_combout\);

-- Location: LABCELL_X17_Y7_N3
\u_pd_asp|u_core|qualifies_threshold~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|qualifies_threshold~1_combout\ = ( !\u_pd_asp|cfg_threshold\(2) & ( (!\u_pd_asp|cfg_threshold\(1) & !\u_pd_asp|cfg_threshold\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_cfg_threshold\(1),
	datad => \u_pd_asp|ALT_INV_cfg_threshold\(0),
	dataf => \u_pd_asp|ALT_INV_cfg_threshold\(2),
	combout => \u_pd_asp|u_core|qualifies_threshold~1_combout\);

-- Location: LABCELL_X17_Y7_N36
\u_pd_asp|u_core|qualifies_threshold~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|qualifies_threshold~2_combout\ = ( \u_pd_asp|u_core|qualifies_threshold~0_combout\ & ( \u_pd_asp|u_core|qualifies_threshold~1_combout\ & ( (\u_pd_asp|cfg_threshold\(3) & ((!\u_pd_asp|in_word_r\(19)) # ((\u_pd_asp|cfg_threshold\(2) & 
-- !\u_pd_asp|in_word_r\(18))))) ) ) ) # ( !\u_pd_asp|u_core|qualifies_threshold~0_combout\ & ( \u_pd_asp|u_core|qualifies_threshold~1_combout\ & ( (\u_pd_asp|cfg_threshold\(3) & (((!\u_pd_asp|in_word_r\(19)) # (!\u_pd_asp|in_word_r\(18))) # 
-- (\u_pd_asp|cfg_threshold\(2)))) ) ) ) # ( \u_pd_asp|u_core|qualifies_threshold~0_combout\ & ( !\u_pd_asp|u_core|qualifies_threshold~1_combout\ & ( (!\u_pd_asp|cfg_threshold\(3) & (\u_pd_asp|cfg_threshold\(2) & (!\u_pd_asp|in_word_r\(19) & 
-- !\u_pd_asp|in_word_r\(18)))) # (\u_pd_asp|cfg_threshold\(3) & ((!\u_pd_asp|in_word_r\(19)) # ((\u_pd_asp|cfg_threshold\(2) & !\u_pd_asp|in_word_r\(18))))) ) ) ) # ( !\u_pd_asp|u_core|qualifies_threshold~0_combout\ & ( 
-- !\u_pd_asp|u_core|qualifies_threshold~1_combout\ & ( (!\u_pd_asp|cfg_threshold\(3) & (!\u_pd_asp|in_word_r\(19) & ((!\u_pd_asp|in_word_r\(18)) # (\u_pd_asp|cfg_threshold\(2))))) # (\u_pd_asp|cfg_threshold\(3) & (((!\u_pd_asp|in_word_r\(19)) # 
-- (!\u_pd_asp|in_word_r\(18))) # (\u_pd_asp|cfg_threshold\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010101110001011100010101000001010101010100010101000101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_cfg_threshold\(3),
	datab => \u_pd_asp|ALT_INV_cfg_threshold\(2),
	datac => \u_pd_asp|ALT_INV_in_word_r\(19),
	datad => \u_pd_asp|ALT_INV_in_word_r\(18),
	datae => \u_pd_asp|u_core|ALT_INV_qualifies_threshold~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_qualifies_threshold~1_combout\,
	combout => \u_pd_asp|u_core|qualifies_threshold~2_combout\);

-- Location: LABCELL_X17_Y7_N48
\u_pd_asp|u_core|LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~2_combout\ = ( \u_pd_asp|u_core|counter_r\(5) & ( !\u_pd_asp|cfg_min_spacing\(5) ) ) # ( !\u_pd_asp|u_core|counter_r\(5) & ( \u_pd_asp|cfg_min_spacing\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_cfg_min_spacing\(5),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(5),
	combout => \u_pd_asp|u_core|LessThan1~2_combout\);

-- Location: FF_X17_Y7_N5
\u_pd_asp|cfg_min_spacing[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(12),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(4));

-- Location: LABCELL_X17_Y7_N45
\u_pd_asp|u_core|LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~3_combout\ = ( \u_pd_asp|u_core|counter_r\(4) & ( !\u_pd_asp|cfg_min_spacing\(4) ) ) # ( !\u_pd_asp|u_core|counter_r\(4) & ( \u_pd_asp|cfg_min_spacing\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_cfg_min_spacing\(4),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(4),
	combout => \u_pd_asp|u_core|LessThan1~3_combout\);

-- Location: LABCELL_X17_Y7_N9
\u_pd_asp|u_core|LessThan1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~4_combout\ = ( \u_pd_asp|cfg_min_spacing\(6) & ( !\u_pd_asp|u_core|LessThan1~3_combout\ & ( (!\u_pd_asp|u_core|counter_r\(6) & (!\u_pd_asp|u_core|LessThan1~2_combout\ & (!\u_pd_asp|u_core|counter_r\(7) $ 
-- (!\u_pd_asp|cfg_min_spacing\(7))))) ) ) ) # ( !\u_pd_asp|cfg_min_spacing\(6) & ( !\u_pd_asp|u_core|LessThan1~3_combout\ & ( (\u_pd_asp|u_core|counter_r\(6) & (!\u_pd_asp|u_core|LessThan1~2_combout\ & (!\u_pd_asp|u_core|counter_r\(7) $ 
-- (!\u_pd_asp|cfg_min_spacing\(7))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000000000001010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(6),
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(7),
	datac => \u_pd_asp|ALT_INV_cfg_min_spacing\(7),
	datad => \u_pd_asp|u_core|ALT_INV_LessThan1~2_combout\,
	datae => \u_pd_asp|ALT_INV_cfg_min_spacing\(6),
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan1~3_combout\,
	combout => \u_pd_asp|u_core|LessThan1~4_combout\);

-- Location: LABCELL_X19_Y7_N54
\u_pd_asp|u_core|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~33_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(8) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~30\ ))
-- \u_pd_asp|u_core|Add0~34\ = CARRY(( \u_pd_asp|u_core|counter_r\(8) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(8),
	cin => \u_pd_asp|u_core|Add0~30\,
	sumout => \u_pd_asp|u_core|Add0~33_sumout\,
	cout => \u_pd_asp|u_core|Add0~34\);

-- Location: FF_X19_Y7_N56
\u_pd_asp|u_core|counter_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~33_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(8));

-- Location: LABCELL_X19_Y7_N57
\u_pd_asp|u_core|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~37_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(9) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~34\ ))
-- \u_pd_asp|u_core|Add0~38\ = CARRY(( \u_pd_asp|u_core|counter_r\(9) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(9),
	cin => \u_pd_asp|u_core|Add0~34\,
	sumout => \u_pd_asp|u_core|Add0~37_sumout\,
	cout => \u_pd_asp|u_core|Add0~38\);

-- Location: FF_X19_Y7_N59
\u_pd_asp|u_core|counter_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~37_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(9));

-- Location: LABCELL_X19_Y6_N0
\u_pd_asp|u_core|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~41_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(10) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~38\ ))
-- \u_pd_asp|u_core|Add0~42\ = CARRY(( \u_pd_asp|u_core|counter_r\(10) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(10),
	cin => \u_pd_asp|u_core|Add0~38\,
	sumout => \u_pd_asp|u_core|Add0~41_sumout\,
	cout => \u_pd_asp|u_core|Add0~42\);

-- Location: FF_X19_Y6_N2
\u_pd_asp|u_core|counter_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~41_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(10));

-- Location: LABCELL_X19_Y6_N3
\u_pd_asp|u_core|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~45_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(11) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~42\ ))
-- \u_pd_asp|u_core|Add0~46\ = CARRY(( \u_pd_asp|u_core|counter_r\(11) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(11),
	cin => \u_pd_asp|u_core|Add0~42\,
	sumout => \u_pd_asp|u_core|Add0~45_sumout\,
	cout => \u_pd_asp|u_core|Add0~46\);

-- Location: FF_X19_Y6_N5
\u_pd_asp|u_core|counter_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~45_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(11));

-- Location: LABCELL_X19_Y6_N6
\u_pd_asp|u_core|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~49_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(12) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~46\ ))
-- \u_pd_asp|u_core|Add0~50\ = CARRY(( \u_pd_asp|u_core|counter_r\(12) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(12),
	cin => \u_pd_asp|u_core|Add0~46\,
	sumout => \u_pd_asp|u_core|Add0~49_sumout\,
	cout => \u_pd_asp|u_core|Add0~50\);

-- Location: FF_X19_Y6_N8
\u_pd_asp|u_core|counter_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~49_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(12));

-- Location: LABCELL_X19_Y6_N9
\u_pd_asp|u_core|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~53_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(13) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~50\ ))
-- \u_pd_asp|u_core|Add0~54\ = CARRY(( \u_pd_asp|u_core|counter_r\(13) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(13),
	cin => \u_pd_asp|u_core|Add0~50\,
	sumout => \u_pd_asp|u_core|Add0~53_sumout\,
	cout => \u_pd_asp|u_core|Add0~54\);

-- Location: FF_X19_Y6_N11
\u_pd_asp|u_core|counter_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~53_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(13));

-- Location: LABCELL_X19_Y6_N12
\u_pd_asp|u_core|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~57_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(14) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~54\ ))
-- \u_pd_asp|u_core|Add0~58\ = CARRY(( \u_pd_asp|u_core|counter_r\(14) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(14),
	cin => \u_pd_asp|u_core|Add0~54\,
	sumout => \u_pd_asp|u_core|Add0~57_sumout\,
	cout => \u_pd_asp|u_core|Add0~58\);

-- Location: FF_X19_Y6_N14
\u_pd_asp|u_core|counter_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~57_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(14));

-- Location: LABCELL_X19_Y6_N15
\u_pd_asp|u_core|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~61_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(15) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~58\ ))
-- \u_pd_asp|u_core|Add0~62\ = CARRY(( \u_pd_asp|u_core|counter_r\(15) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(15),
	cin => \u_pd_asp|u_core|Add0~58\,
	sumout => \u_pd_asp|u_core|Add0~61_sumout\,
	cout => \u_pd_asp|u_core|Add0~62\);

-- Location: FF_X19_Y6_N17
\u_pd_asp|u_core|counter_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~61_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(15));

-- Location: LABCELL_X19_Y6_N18
\u_pd_asp|u_core|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~65_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(16) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~62\ ))
-- \u_pd_asp|u_core|Add0~66\ = CARRY(( \u_pd_asp|u_core|counter_r\(16) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(16),
	cin => \u_pd_asp|u_core|Add0~62\,
	sumout => \u_pd_asp|u_core|Add0~65_sumout\,
	cout => \u_pd_asp|u_core|Add0~66\);

-- Location: FF_X19_Y6_N20
\u_pd_asp|u_core|counter_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~65_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(16));

-- Location: LABCELL_X19_Y7_N0
\u_pd_asp|u_core|LessThan1~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~8_combout\ = ( !\u_pd_asp|u_core|counter_r\(12) & ( (!\u_pd_asp|u_core|counter_r\(8) & (!\u_pd_asp|u_core|counter_r\(16) & !\u_pd_asp|u_core|counter_r\(11))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(8),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(16),
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(11),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(12),
	combout => \u_pd_asp|u_core|LessThan1~8_combout\);

-- Location: LABCELL_X19_Y6_N21
\u_pd_asp|u_core|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~69_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(17) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~66\ ))
-- \u_pd_asp|u_core|Add0~70\ = CARRY(( \u_pd_asp|u_core|counter_r\(17) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(17),
	cin => \u_pd_asp|u_core|Add0~66\,
	sumout => \u_pd_asp|u_core|Add0~69_sumout\,
	cout => \u_pd_asp|u_core|Add0~70\);

-- Location: FF_X19_Y6_N23
\u_pd_asp|u_core|counter_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~69_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(17));

-- Location: LABCELL_X19_Y6_N24
\u_pd_asp|u_core|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~73_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(18) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~70\ ))
-- \u_pd_asp|u_core|Add0~74\ = CARRY(( \u_pd_asp|u_core|counter_r\(18) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(18),
	cin => \u_pd_asp|u_core|Add0~70\,
	sumout => \u_pd_asp|u_core|Add0~73_sumout\,
	cout => \u_pd_asp|u_core|Add0~74\);

-- Location: FF_X19_Y6_N26
\u_pd_asp|u_core|counter_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~73_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(18));

-- Location: LABCELL_X19_Y6_N27
\u_pd_asp|u_core|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~93_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(19) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~74\ ))
-- \u_pd_asp|u_core|Add0~94\ = CARRY(( \u_pd_asp|u_core|counter_r\(19) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(19),
	cin => \u_pd_asp|u_core|Add0~74\,
	sumout => \u_pd_asp|u_core|Add0~93_sumout\,
	cout => \u_pd_asp|u_core|Add0~94\);

-- Location: FF_X19_Y6_N29
\u_pd_asp|u_core|counter_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~93_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(19));

-- Location: LABCELL_X19_Y6_N30
\u_pd_asp|u_core|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~89_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(20) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~94\ ))
-- \u_pd_asp|u_core|Add0~90\ = CARRY(( \u_pd_asp|u_core|counter_r\(20) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(20),
	cin => \u_pd_asp|u_core|Add0~94\,
	sumout => \u_pd_asp|u_core|Add0~89_sumout\,
	cout => \u_pd_asp|u_core|Add0~90\);

-- Location: FF_X19_Y6_N32
\u_pd_asp|u_core|counter_r[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~89_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(20));

-- Location: LABCELL_X19_Y6_N33
\u_pd_asp|u_core|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~85_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(21) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~90\ ))
-- \u_pd_asp|u_core|Add0~86\ = CARRY(( \u_pd_asp|u_core|counter_r\(21) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(21),
	cin => \u_pd_asp|u_core|Add0~90\,
	sumout => \u_pd_asp|u_core|Add0~85_sumout\,
	cout => \u_pd_asp|u_core|Add0~86\);

-- Location: FF_X19_Y6_N35
\u_pd_asp|u_core|counter_r[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~85_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(21));

-- Location: LABCELL_X19_Y6_N36
\u_pd_asp|u_core|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~81_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(22) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~86\ ))
-- \u_pd_asp|u_core|Add0~82\ = CARRY(( \u_pd_asp|u_core|counter_r\(22) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(22),
	cin => \u_pd_asp|u_core|Add0~86\,
	sumout => \u_pd_asp|u_core|Add0~81_sumout\,
	cout => \u_pd_asp|u_core|Add0~82\);

-- Location: FF_X19_Y6_N38
\u_pd_asp|u_core|counter_r[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~81_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(22));

-- Location: LABCELL_X19_Y6_N39
\u_pd_asp|u_core|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add0~77_sumout\ = SUM(( \u_pd_asp|u_core|counter_r\(23) ) + ( GND ) + ( \u_pd_asp|u_core|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(23),
	cin => \u_pd_asp|u_core|Add0~82\,
	sumout => \u_pd_asp|u_core|Add0~77_sumout\);

-- Location: FF_X19_Y6_N41
\u_pd_asp|u_core|counter_r[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add0~77_sumout\,
	sclr => \u_pd_asp|u_core|counter_r[17]~0_combout\,
	ena => \u_pd_asp|u_core|counter_r[17]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|counter_r\(23));

-- Location: LABCELL_X19_Y6_N45
\u_pd_asp|u_core|LessThan1~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~10_combout\ = ( !\u_pd_asp|u_core|counter_r\(22) & ( !\u_pd_asp|u_core|counter_r\(20) & ( (!\u_pd_asp|u_core|counter_r\(19) & (!\u_pd_asp|u_core|counter_r\(23) & !\u_pd_asp|u_core|counter_r\(21))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(19),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(23),
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(21),
	datae => \u_pd_asp|u_core|ALT_INV_counter_r\(22),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(20),
	combout => \u_pd_asp|u_core|LessThan1~10_combout\);

-- Location: LABCELL_X19_Y5_N33
\u_pd_asp|u_core|LessThan1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~9_combout\ = ( !\u_pd_asp|u_core|counter_r\(9) & ( (!\u_pd_asp|u_core|counter_r\(17) & (!\u_pd_asp|u_core|counter_r\(15) & (!\u_pd_asp|u_core|counter_r\(14) & !\u_pd_asp|u_core|counter_r\(10)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(17),
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(15),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(14),
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(10),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(9),
	combout => \u_pd_asp|u_core|LessThan1~9_combout\);

-- Location: LABCELL_X19_Y7_N12
\u_pd_asp|u_core|LessThan1~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~11_combout\ = ( \u_pd_asp|u_core|LessThan1~10_combout\ & ( \u_pd_asp|u_core|LessThan1~9_combout\ & ( (\u_pd_asp|u_core|LessThan1~8_combout\ & (!\u_pd_asp|u_core|counter_r\(18) & !\u_pd_asp|u_core|counter_r\(13))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_LessThan1~8_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(18),
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(13),
	datae => \u_pd_asp|u_core|ALT_INV_LessThan1~10_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan1~9_combout\,
	combout => \u_pd_asp|u_core|LessThan1~11_combout\);

-- Location: FF_X19_Y8_N20
\u_pd_asp|cfg_min_spacing[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(10),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(2));

-- Location: LABCELL_X19_Y8_N12
\u_pd_asp|cfg_min_spacing~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|cfg_min_spacing~0_combout\ = ( !\init~input_o\ & ( !\u_pd_asp|in_word_r\(11) & ( !\reset~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_reset~input_o\,
	datae => \ALT_INV_init~input_o\,
	dataf => \u_pd_asp|ALT_INV_in_word_r\(11),
	combout => \u_pd_asp|cfg_min_spacing~0_combout\);

-- Location: LABCELL_X19_Y8_N57
\u_pd_asp|cfg_min_spacing[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|cfg_min_spacing[3]~feeder_combout\ = ( \u_pd_asp|cfg_min_spacing~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_pd_asp|ALT_INV_cfg_min_spacing~0_combout\,
	combout => \u_pd_asp|cfg_min_spacing[3]~feeder_combout\);

-- Location: FF_X19_Y8_N59
\u_pd_asp|cfg_min_spacing[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|cfg_min_spacing[3]~feeder_combout\,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(3));

-- Location: FF_X19_Y8_N14
\u_pd_asp|cfg_min_spacing[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(8),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(0));

-- Location: FF_X19_Y8_N23
\u_pd_asp|cfg_min_spacing[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(9),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_min_spacing\(1));

-- Location: LABCELL_X19_Y8_N51
\u_pd_asp|u_core|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~0_combout\ = ( \u_pd_asp|u_core|counter_r\(0) & ( (!\u_pd_asp|u_core|counter_r\(1) & \u_pd_asp|cfg_min_spacing\(1)) ) ) # ( !\u_pd_asp|u_core|counter_r\(0) & ( (!\u_pd_asp|cfg_min_spacing\(0) & (!\u_pd_asp|u_core|counter_r\(1) & 
-- \u_pd_asp|cfg_min_spacing\(1))) # (\u_pd_asp|cfg_min_spacing\(0) & ((!\u_pd_asp|u_core|counter_r\(1)) # (\u_pd_asp|cfg_min_spacing\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000011110011001100001111001100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_cfg_min_spacing\(0),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(1),
	datad => \u_pd_asp|ALT_INV_cfg_min_spacing\(1),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(0),
	combout => \u_pd_asp|u_core|LessThan1~0_combout\);

-- Location: LABCELL_X19_Y8_N30
\u_pd_asp|u_core|LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~1_combout\ = ( \u_pd_asp|u_core|counter_r\(3) & ( \u_pd_asp|u_core|LessThan1~0_combout\ & ( (!\u_pd_asp|cfg_min_spacing\(3) & ((!\u_pd_asp|u_core|counter_r\(2)) # (\u_pd_asp|cfg_min_spacing\(2)))) ) ) ) # ( 
-- !\u_pd_asp|u_core|counter_r\(3) & ( \u_pd_asp|u_core|LessThan1~0_combout\ & ( ((!\u_pd_asp|cfg_min_spacing\(3)) # (!\u_pd_asp|u_core|counter_r\(2))) # (\u_pd_asp|cfg_min_spacing\(2)) ) ) ) # ( \u_pd_asp|u_core|counter_r\(3) & ( 
-- !\u_pd_asp|u_core|LessThan1~0_combout\ & ( (\u_pd_asp|cfg_min_spacing\(2) & (!\u_pd_asp|cfg_min_spacing\(3) & !\u_pd_asp|u_core|counter_r\(2))) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(3) & ( !\u_pd_asp|u_core|LessThan1~0_combout\ & ( 
-- (!\u_pd_asp|cfg_min_spacing\(3)) # ((\u_pd_asp|cfg_min_spacing\(2) & !\u_pd_asp|u_core|counter_r\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110111001100010001000000000011111111110111011100110001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_cfg_min_spacing\(2),
	datab => \u_pd_asp|ALT_INV_cfg_min_spacing\(3),
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(2),
	datae => \u_pd_asp|u_core|ALT_INV_counter_r\(3),
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan1~0_combout\,
	combout => \u_pd_asp|u_core|LessThan1~1_combout\);

-- Location: LABCELL_X18_Y7_N27
\u_pd_asp|u_core|LessThan1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~5_combout\ = ( !\u_pd_asp|u_core|counter_r\(4) & ( \u_pd_asp|cfg_min_spacing\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|ALT_INV_cfg_min_spacing\(4),
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(4),
	combout => \u_pd_asp|u_core|LessThan1~5_combout\);

-- Location: LABCELL_X18_Y7_N3
\u_pd_asp|u_core|LessThan1~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|LessThan1~6_combout\ = ( !\u_pd_asp|u_core|LessThan1~2_combout\ & ( \u_pd_asp|u_core|LessThan1~5_combout\ & ( (!\u_pd_asp|u_core|counter_r\(7) & (\u_pd_asp|cfg_min_spacing\(7) & (!\u_pd_asp|cfg_min_spacing\(6) $ 
-- (!\u_pd_asp|u_core|counter_r\(6))))) # (\u_pd_asp|u_core|counter_r\(7) & (!\u_pd_asp|cfg_min_spacing\(7) & (!\u_pd_asp|cfg_min_spacing\(6) $ (!\u_pd_asp|u_core|counter_r\(6))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000110011000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(7),
	datab => \u_pd_asp|ALT_INV_cfg_min_spacing\(7),
	datac => \u_pd_asp|ALT_INV_cfg_min_spacing\(6),
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(6),
	datae => \u_pd_asp|u_core|ALT_INV_LessThan1~2_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan1~5_combout\,
	combout => \u_pd_asp|u_core|LessThan1~6_combout\);

-- Location: LABCELL_X19_Y7_N24
\u_pd_asp|u_core|missed_peaks_r[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|missed_peaks_r[0]~0_combout\ = ( \u_pd_asp|u_core|LessThan1~1_combout\ & ( \u_pd_asp|u_core|LessThan1~6_combout\ & ( (!\u_pd_asp|u_core|qualifies_threshold~2_combout\ & !\u_pd_asp|u_core|LessThan1~11_combout\) ) ) ) # ( 
-- !\u_pd_asp|u_core|LessThan1~1_combout\ & ( \u_pd_asp|u_core|LessThan1~6_combout\ & ( (!\u_pd_asp|u_core|qualifies_threshold~2_combout\ & !\u_pd_asp|u_core|LessThan1~11_combout\) ) ) ) # ( \u_pd_asp|u_core|LessThan1~1_combout\ & ( 
-- !\u_pd_asp|u_core|LessThan1~6_combout\ & ( (!\u_pd_asp|u_core|qualifies_threshold~2_combout\ & ((!\u_pd_asp|u_core|LessThan1~11_combout\) # ((!\u_pd_asp|u_core|LessThan1~7_combout\ & !\u_pd_asp|u_core|LessThan1~4_combout\)))) ) ) ) # ( 
-- !\u_pd_asp|u_core|LessThan1~1_combout\ & ( !\u_pd_asp|u_core|LessThan1~6_combout\ & ( (!\u_pd_asp|u_core|qualifies_threshold~2_combout\ & ((!\u_pd_asp|u_core|LessThan1~7_combout\) # (!\u_pd_asp|u_core|LessThan1~11_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110010001000110011001000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_LessThan1~7_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_qualifies_threshold~2_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_LessThan1~4_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_LessThan1~11_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_LessThan1~1_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_LessThan1~6_combout\,
	combout => \u_pd_asp|u_core|missed_peaks_r[0]~0_combout\);

-- Location: LABCELL_X18_Y7_N24
\u_pd_asp|u_core|first_peak_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|first_peak_r~0_combout\ = ( \u_pd_asp|u_core|first_seen_r~q\ & ( (!\u_pd_asp|u_core|process_0~0_combout\ & (((\u_pd_asp|u_core|state_r~4_combout\ & \u_pd_asp|u_core|sample_accepted~0_combout\)) # (\u_pd_asp|u_core|first_peak_r~q\))) ) ) # 
-- ( !\u_pd_asp|u_core|first_seen_r~q\ & ( (!\u_pd_asp|u_core|process_0~0_combout\ & \u_pd_asp|u_core|first_peak_r~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000100110011000000010011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_state_r~4_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_process_0~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_first_peak_r~q\,
	dataf => \u_pd_asp|u_core|ALT_INV_first_seen_r~q\,
	combout => \u_pd_asp|u_core|first_peak_r~0_combout\);

-- Location: FF_X18_Y7_N26
\u_pd_asp|u_core|first_peak_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|first_peak_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|first_peak_r~q\);

-- Location: LABCELL_X18_Y6_N45
\u_pd_asp|u_core|peak_valid_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|peak_valid_r~0_combout\ = ( \u_pd_asp|u_core|sample_accepted~0_combout\ & ( \u_pd_asp|u_core|state_r~4_combout\ & ( (\u_pd_asp|u_core|first_seen_r~q\ & (\u_pd_asp|u_core|missed_peaks_r[0]~0_combout\ & (\u_pd_asp|u_core|first_peak_r~q\ & 
-- !\u_pd_asp|u_core|process_0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_first_seen_r~q\,
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r[0]~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_first_peak_r~q\,
	datad => \u_pd_asp|u_core|ALT_INV_process_0~0_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~4_combout\,
	combout => \u_pd_asp|u_core|peak_valid_r~0_combout\);

-- Location: FF_X18_Y6_N47
\u_pd_asp|u_core|peak_valid_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|peak_valid_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_valid_r~q\);

-- Location: MLABCELL_X21_Y6_N9
\u_pd_asp|out_pending_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_pending_r~0_combout\ = ( \u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & !\init~input_o\) ) ) ) # ( !\u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & (!\init~input_o\ & 
-- ((\u_pd_asp|in_word_r\(24)) # (\u_pd_asp|u_core|peak_valid_r~q\)))) ) ) ) # ( \u_pd_asp|in_word_r\(25) & ( !\u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & (\u_pd_asp|u_core|peak_valid_r~q\ & !\init~input_o\)) ) ) ) # ( !\u_pd_asp|in_word_r\(25) & 
-- ( !\u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & (\u_pd_asp|u_core|peak_valid_r~q\ & !\init~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000100000000000101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \u_pd_asp|u_core|ALT_INV_peak_valid_r~q\,
	datac => \u_pd_asp|ALT_INV_in_word_r\(24),
	datad => \ALT_INV_init~input_o\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|out_pending_r~0_combout\);

-- Location: FF_X21_Y6_N11
\u_pd_asp|out_pending_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_pending_r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_pending_r~q\);

-- Location: LABCELL_X17_Y6_N0
\u_pd_asp|u_core|Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~1_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(0) ) + ( VCC ) + ( !VCC ))
-- \u_pd_asp|u_core|Add2~2\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(0),
	cin => GND,
	sumout => \u_pd_asp|u_core|Add2~1_sumout\,
	cout => \u_pd_asp|u_core|Add2~2\);

-- Location: LABCELL_X18_Y6_N27
\u_pd_asp|u_core|missed_peaks_r[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\ = ( \u_pd_asp|u_core|sample_accepted~0_combout\ & ( \u_pd_asp|u_core|state_r~4_combout\ & ( ((\u_pd_asp|u_core|first_seen_r~q\ & (\u_pd_asp|u_core|first_peak_r~q\ & 
-- !\u_pd_asp|u_core|missed_peaks_r[0]~0_combout\))) # (\u_pd_asp|u_core|process_0~0_combout\) ) ) ) # ( !\u_pd_asp|u_core|sample_accepted~0_combout\ & ( \u_pd_asp|u_core|state_r~4_combout\ & ( \u_pd_asp|u_core|process_0~0_combout\ ) ) ) # ( 
-- \u_pd_asp|u_core|sample_accepted~0_combout\ & ( !\u_pd_asp|u_core|state_r~4_combout\ & ( \u_pd_asp|u_core|process_0~0_combout\ ) ) ) # ( !\u_pd_asp|u_core|sample_accepted~0_combout\ & ( !\u_pd_asp|u_core|state_r~4_combout\ & ( 
-- \u_pd_asp|u_core|process_0~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110001000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_first_seen_r~q\,
	datab => \u_pd_asp|u_core|ALT_INV_first_peak_r~q\,
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r[0]~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_process_0~0_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~4_combout\,
	combout => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\);

-- Location: FF_X17_Y6_N2
\u_pd_asp|u_core|missed_peaks_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~1_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(0));

-- Location: LABCELL_X19_Y7_N18
\u_pd_asp|u_core|peak_count_r[16]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|peak_count_r[16]~0_combout\ = ( \u_pd_asp|u_core|sample_accepted~0_combout\ & ( \u_pd_asp|u_core|state_r~4_combout\ & ( ((\u_pd_asp|u_core|first_peak_r~q\ & (\u_pd_asp|u_core|missed_peaks_r[0]~0_combout\ & 
-- \u_pd_asp|u_core|first_seen_r~q\))) # (\u_pd_asp|u_core|process_0~0_combout\) ) ) ) # ( !\u_pd_asp|u_core|sample_accepted~0_combout\ & ( \u_pd_asp|u_core|state_r~4_combout\ & ( \u_pd_asp|u_core|process_0~0_combout\ ) ) ) # ( 
-- \u_pd_asp|u_core|sample_accepted~0_combout\ & ( !\u_pd_asp|u_core|state_r~4_combout\ & ( \u_pd_asp|u_core|process_0~0_combout\ ) ) ) # ( !\u_pd_asp|u_core|sample_accepted~0_combout\ & ( !\u_pd_asp|u_core|state_r~4_combout\ & ( 
-- \u_pd_asp|u_core|process_0~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_process_0~0_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_first_peak_r~q\,
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r[0]~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_first_seen_r~q\,
	datae => \u_pd_asp|u_core|ALT_INV_sample_accepted~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_state_r~4_combout\,
	combout => \u_pd_asp|u_core|peak_count_r[16]~0_combout\);

-- Location: FF_X18_Y7_N7
\u_pd_asp|u_core|peak_count_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(0),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(0));

-- Location: MLABCELL_X21_Y7_N0
\u_pd_asp|u_core|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~1_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(0) ) + ( VCC ) + ( !VCC ))
-- \u_pd_asp|u_core|Add1~2\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(0),
	cin => GND,
	sumout => \u_pd_asp|u_core|Add1~1_sumout\,
	cout => \u_pd_asp|u_core|Add1~2\);

-- Location: FF_X21_Y7_N2
\u_pd_asp|u_core|total_peaks_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~1_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(0));

-- Location: LABCELL_X18_Y5_N57
\u_pd_asp|out_word_r[14]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r[14]~0_combout\ = ( \u_pd_asp|in_word_r\(24) & ( (!\u_pd_asp|in_word_r\(25) & \u_pd_asp|core_clear~0_combout\) ) ) # ( !\u_pd_asp|in_word_r\(24) & ( (\u_pd_asp|in_word_r\(25) & \u_pd_asp|core_clear~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(25),
	datad => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	dataf => \u_pd_asp|ALT_INV_in_word_r\(24),
	combout => \u_pd_asp|out_word_r[14]~0_combout\);

-- Location: LABCELL_X19_Y5_N39
\u_pd_asp|cmd_status_error~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|cmd_status_error~0_combout\ = ( \u_pd_asp|core_clear~0_combout\ & ( \u_pd_asp|in_word_r\(25) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|cmd_status_error~0_combout\);

-- Location: LABCELL_X19_Y8_N18
\u_pd_asp|out_word_r~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~1_combout\ = ( \u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|total_peaks_r\(0) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|missed_peaks_r\(0) ) ) ) # ( \u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|counter_r\(0) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|peak_count_r\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000011110000111101010101010101010000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(0),
	datab => \u_pd_asp|u_core|ALT_INV_peak_count_r\(0),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(0),
	datad => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(0),
	datae => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~1_combout\);

-- Location: MLABCELL_X21_Y6_N18
\u_pd_asp|out_word_r[14]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r[14]~2_combout\ = ( \u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ ) ) # ( !\u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ & ( (((\u_pd_asp|in_word_r\(24)) # (\init~input_o\)) # 
-- (\u_pd_asp|u_core|peak_valid_r~q\)) # (\reset~input_o\) ) ) ) # ( \u_pd_asp|in_word_r\(25) & ( !\u_pd_asp|core_clear~0_combout\ & ( ((\init~input_o\) # (\u_pd_asp|u_core|peak_valid_r~q\)) # (\reset~input_o\) ) ) ) # ( !\u_pd_asp|in_word_r\(25) & ( 
-- !\u_pd_asp|core_clear~0_combout\ & ( ((\init~input_o\) # (\u_pd_asp|u_core|peak_valid_r~q\)) # (\reset~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101111111011111110111111101111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \u_pd_asp|u_core|ALT_INV_peak_valid_r~q\,
	datac => \ALT_INV_init~input_o\,
	datad => \u_pd_asp|ALT_INV_in_word_r\(24),
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|out_word_r[14]~2_combout\);

-- Location: FF_X19_Y8_N32
\u_pd_asp|out_word_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~1_combout\,
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(0));

-- Location: LABCELL_X19_Y8_N9
\data~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~0_combout\ = ( \u_pd_asp|out_word_r\(0) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_pending_r~q\,
	dataf => \u_pd_asp|ALT_INV_out_word_r\(0),
	combout => \data~0_combout\);

-- Location: MLABCELL_X21_Y7_N3
\u_pd_asp|u_core|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~5_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(1) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~2\ ))
-- \u_pd_asp|u_core|Add1~6\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(1) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(1),
	cin => \u_pd_asp|u_core|Add1~2\,
	sumout => \u_pd_asp|u_core|Add1~5_sumout\,
	cout => \u_pd_asp|u_core|Add1~6\);

-- Location: FF_X21_Y7_N5
\u_pd_asp|u_core|total_peaks_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~5_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(1));

-- Location: LABCELL_X17_Y6_N3
\u_pd_asp|u_core|Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~5_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(1) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~2\ ))
-- \u_pd_asp|u_core|Add2~6\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(1) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(1),
	cin => \u_pd_asp|u_core|Add2~2\,
	sumout => \u_pd_asp|u_core|Add2~5_sumout\,
	cout => \u_pd_asp|u_core|Add2~6\);

-- Location: FF_X17_Y6_N5
\u_pd_asp|u_core|missed_peaks_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~5_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(1));

-- Location: FF_X19_Y5_N5
\u_pd_asp|u_core|peak_count_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(1),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(1));

-- Location: LABCELL_X19_Y5_N57
\u_pd_asp|out_word_r~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~3_combout\ = ( \u_pd_asp|u_core|counter_r\(1) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|total_peaks_r\(1)) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(1) & ( 
-- \u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|u_core|total_peaks_r\(1) & \u_pd_asp|cmd_status_error~0_combout\) ) ) ) # ( \u_pd_asp|u_core|counter_r\(1) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(1)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(1))) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(1) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(1)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001100000101000001011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(1),
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(1),
	datac => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_peak_count_r\(1),
	datae => \u_pd_asp|u_core|ALT_INV_counter_r\(1),
	dataf => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	combout => \u_pd_asp|out_word_r~3_combout\);

-- Location: FF_X17_Y5_N50
\u_pd_asp|out_word_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~3_combout\,
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(1));

-- Location: LABCELL_X17_Y5_N48
\data~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~1_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|ALT_INV_out_word_r\(1),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~1_combout\);

-- Location: MLABCELL_X21_Y7_N6
\u_pd_asp|u_core|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~9_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(2) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~6\ ))
-- \u_pd_asp|u_core|Add1~10\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(2) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(2),
	cin => \u_pd_asp|u_core|Add1~6\,
	sumout => \u_pd_asp|u_core|Add1~9_sumout\,
	cout => \u_pd_asp|u_core|Add1~10\);

-- Location: FF_X21_Y7_N8
\u_pd_asp|u_core|total_peaks_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~9_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(2));

-- Location: LABCELL_X17_Y6_N6
\u_pd_asp|u_core|Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~9_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(2) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~6\ ))
-- \u_pd_asp|u_core|Add2~10\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(2) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(2),
	cin => \u_pd_asp|u_core|Add2~6\,
	sumout => \u_pd_asp|u_core|Add2~9_sumout\,
	cout => \u_pd_asp|u_core|Add2~10\);

-- Location: FF_X17_Y6_N8
\u_pd_asp|u_core|missed_peaks_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~9_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(2));

-- Location: FF_X18_Y6_N25
\u_pd_asp|u_core|peak_count_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(2),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(2));

-- Location: MLABCELL_X21_Y6_N33
\u_pd_asp|out_word_r~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~4_combout\ = ( \u_pd_asp|u_core|peak_count_r\(2) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(2)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(2))) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(2) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(2)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(2))) ) ) ) # ( \u_pd_asp|u_core|peak_count_r\(2) & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\) # (\u_pd_asp|u_core|counter_r\(2)) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(2) & ( 
-- !\u_pd_asp|cmd_status_error~0_combout\ & ( (\u_pd_asp|u_core|counter_r\(2) & \u_pd_asp|out_word_r[14]~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111110000111100110011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(2),
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(2),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(2),
	datad => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_peak_count_r\(2),
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~4_combout\);

-- Location: FF_X21_Y6_N34
\u_pd_asp|out_word_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~4_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(2));

-- Location: LABCELL_X18_Y4_N24
\data~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~2_combout\ = ( \u_pd_asp|out_word_r\(2) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(2),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~2_combout\);

-- Location: FF_X18_Y7_N56
\u_pd_asp|u_core|peak_count_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(3),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(3));

-- Location: LABCELL_X17_Y6_N9
\u_pd_asp|u_core|Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~13_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(3) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~10\ ))
-- \u_pd_asp|u_core|Add2~14\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(3) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(3),
	cin => \u_pd_asp|u_core|Add2~10\,
	sumout => \u_pd_asp|u_core|Add2~13_sumout\,
	cout => \u_pd_asp|u_core|Add2~14\);

-- Location: FF_X17_Y6_N11
\u_pd_asp|u_core|missed_peaks_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~13_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(3));

-- Location: MLABCELL_X21_Y7_N9
\u_pd_asp|u_core|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~13_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(3) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~10\ ))
-- \u_pd_asp|u_core|Add1~14\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(3) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(3),
	cin => \u_pd_asp|u_core|Add1~10\,
	sumout => \u_pd_asp|u_core|Add1~13_sumout\,
	cout => \u_pd_asp|u_core|Add1~14\);

-- Location: FF_X21_Y7_N11
\u_pd_asp|u_core|total_peaks_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~13_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(3));

-- Location: LABCELL_X16_Y7_N51
\u_pd_asp|out_word_r~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~5_combout\ = ( \u_pd_asp|u_core|total_peaks_r\(3) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|u_core|counter_r\(3)) # (\u_pd_asp|cmd_status_error~0_combout\) ) ) ) # ( !\u_pd_asp|u_core|total_peaks_r\(3) & ( 
-- \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & \u_pd_asp|u_core|counter_r\(3)) ) ) ) # ( \u_pd_asp|u_core|total_peaks_r\(3) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|peak_count_r\(3))) # (\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(3)))) ) ) ) # ( !\u_pd_asp|u_core|total_peaks_r\(3) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|peak_count_r\(3))) # (\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001110111010001000111011100001100000011000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_peak_count_r\(3),
	datab => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(3),
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(3),
	datae => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(3),
	dataf => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	combout => \u_pd_asp|out_word_r~5_combout\);

-- Location: FF_X16_Y7_N52
\u_pd_asp|out_word_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~5_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(3));

-- Location: LABCELL_X18_Y4_N57
\data~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~3_combout\ = ( \u_pd_asp|out_word_r\(3) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(3),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~3_combout\);

-- Location: MLABCELL_X21_Y7_N12
\u_pd_asp|u_core|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~17_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(4) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~14\ ))
-- \u_pd_asp|u_core|Add1~18\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(4) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(4),
	cin => \u_pd_asp|u_core|Add1~14\,
	sumout => \u_pd_asp|u_core|Add1~17_sumout\,
	cout => \u_pd_asp|u_core|Add1~18\);

-- Location: FF_X21_Y7_N14
\u_pd_asp|u_core|total_peaks_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~17_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(4));

-- Location: LABCELL_X17_Y6_N12
\u_pd_asp|u_core|Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~17_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(4) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~14\ ))
-- \u_pd_asp|u_core|Add2~18\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(4) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(4),
	cin => \u_pd_asp|u_core|Add2~14\,
	sumout => \u_pd_asp|u_core|Add2~17_sumout\,
	cout => \u_pd_asp|u_core|Add2~18\);

-- Location: FF_X17_Y6_N14
\u_pd_asp|u_core|missed_peaks_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~17_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(4));

-- Location: LABCELL_X18_Y8_N27
\u_pd_asp|u_core|peak_count_r[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|peak_count_r[4]~feeder_combout\ = ( \u_pd_asp|u_core|counter_r\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(4),
	combout => \u_pd_asp|u_core|peak_count_r[4]~feeder_combout\);

-- Location: FF_X18_Y8_N28
\u_pd_asp|u_core|peak_count_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|peak_count_r[4]~feeder_combout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(4));

-- Location: MLABCELL_X21_Y6_N42
\u_pd_asp|out_word_r~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~6_combout\ = ( \u_pd_asp|u_core|peak_count_r\(4) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(4)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(4))) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(4) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(4)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(4))) ) ) ) # ( \u_pd_asp|u_core|peak_count_r\(4) & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\) # (\u_pd_asp|u_core|counter_r\(4)) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(4) & ( 
-- !\u_pd_asp|cmd_status_error~0_combout\ & ( (\u_pd_asp|u_core|counter_r\(4) & \u_pd_asp|out_word_r[14]~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011111100111111001100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(4),
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(4),
	datac => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(4),
	datae => \u_pd_asp|u_core|ALT_INV_peak_count_r\(4),
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~6_combout\);

-- Location: FF_X21_Y6_N44
\u_pd_asp|out_word_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~6_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(4));

-- Location: MLABCELL_X21_Y6_N51
\data~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~4_combout\ = (\u_pd_asp|out_pending_r~q\ & \u_pd_asp|out_word_r\(4))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_out_pending_r~q\,
	datac => \u_pd_asp|ALT_INV_out_word_r\(4),
	combout => \data~4_combout\);

-- Location: LABCELL_X17_Y6_N15
\u_pd_asp|u_core|Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~21_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(5) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~18\ ))
-- \u_pd_asp|u_core|Add2~22\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(5) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(5),
	cin => \u_pd_asp|u_core|Add2~18\,
	sumout => \u_pd_asp|u_core|Add2~21_sumout\,
	cout => \u_pd_asp|u_core|Add2~22\);

-- Location: FF_X17_Y6_N17
\u_pd_asp|u_core|missed_peaks_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~21_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(5));

-- Location: MLABCELL_X21_Y7_N15
\u_pd_asp|u_core|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~21_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(5) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~18\ ))
-- \u_pd_asp|u_core|Add1~22\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(5) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(5),
	cin => \u_pd_asp|u_core|Add1~18\,
	sumout => \u_pd_asp|u_core|Add1~21_sumout\,
	cout => \u_pd_asp|u_core|Add1~22\);

-- Location: FF_X21_Y7_N17
\u_pd_asp|u_core|total_peaks_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~21_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(5));

-- Location: FF_X18_Y7_N5
\u_pd_asp|u_core|peak_count_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(5),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(5));

-- Location: LABCELL_X17_Y5_N6
\u_pd_asp|out_word_r~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~7_combout\ = ( \u_pd_asp|u_core|peak_count_r\(5) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(5))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- ((\u_pd_asp|u_core|total_peaks_r\(5)))) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(5) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(5))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- ((\u_pd_asp|u_core|total_peaks_r\(5)))) ) ) ) # ( \u_pd_asp|u_core|peak_count_r\(5) & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\) # (\u_pd_asp|u_core|counter_r\(5)) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(5) & ( 
-- !\u_pd_asp|cmd_status_error~0_combout\ & ( (\u_pd_asp|out_word_r[14]~0_combout\ & \u_pd_asp|u_core|counter_r\(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111100001111111101010011010100110101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(5),
	datab => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(5),
	datac => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(5),
	datae => \u_pd_asp|u_core|ALT_INV_peak_count_r\(5),
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~7_combout\);

-- Location: FF_X17_Y5_N8
\u_pd_asp|out_word_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~7_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(5));

-- Location: LABCELL_X17_Y5_N33
\data~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~5_combout\ = ( \u_pd_asp|out_word_r\(5) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_pending_r~q\,
	dataf => \u_pd_asp|ALT_INV_out_word_r\(5),
	combout => \data~5_combout\);

-- Location: LABCELL_X17_Y6_N18
\u_pd_asp|u_core|Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~25_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(6) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~22\ ))
-- \u_pd_asp|u_core|Add2~26\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(6) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(6),
	cin => \u_pd_asp|u_core|Add2~22\,
	sumout => \u_pd_asp|u_core|Add2~25_sumout\,
	cout => \u_pd_asp|u_core|Add2~26\);

-- Location: FF_X17_Y6_N20
\u_pd_asp|u_core|missed_peaks_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~25_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(6));

-- Location: MLABCELL_X21_Y7_N18
\u_pd_asp|u_core|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~25_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(6) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~22\ ))
-- \u_pd_asp|u_core|Add1~26\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(6) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(6),
	cin => \u_pd_asp|u_core|Add1~22\,
	sumout => \u_pd_asp|u_core|Add1~25_sumout\,
	cout => \u_pd_asp|u_core|Add1~26\);

-- Location: FF_X21_Y7_N20
\u_pd_asp|u_core|total_peaks_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~25_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(6));

-- Location: FF_X19_Y5_N43
\u_pd_asp|u_core|peak_count_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(6),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(6));

-- Location: LABCELL_X18_Y5_N42
\u_pd_asp|out_word_r~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~8_combout\ = ( \u_pd_asp|u_core|counter_r\(6) & ( \u_pd_asp|u_core|peak_count_r\(6) & ( (!\u_pd_asp|cmd_status_error~0_combout\) # ((!\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(6))) # 
-- (\u_pd_asp|out_word_r[14]~0_combout\ & ((\u_pd_asp|u_core|total_peaks_r\(6))))) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(6) & ( \u_pd_asp|u_core|peak_count_r\(6) & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & (((!\u_pd_asp|cmd_status_error~0_combout\)) # 
-- (\u_pd_asp|u_core|missed_peaks_r\(6)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & (((\u_pd_asp|cmd_status_error~0_combout\ & \u_pd_asp|u_core|total_peaks_r\(6))))) ) ) ) # ( \u_pd_asp|u_core|counter_r\(6) & ( !\u_pd_asp|u_core|peak_count_r\(6) & ( 
-- (!\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(6) & (\u_pd_asp|cmd_status_error~0_combout\))) # (\u_pd_asp|out_word_r[14]~0_combout\ & (((!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|total_peaks_r\(6))))) ) ) ) # 
-- ( !\u_pd_asp|u_core|counter_r\(6) & ( !\u_pd_asp|u_core|peak_count_r\(6) & ( (\u_pd_asp|cmd_status_error~0_combout\ & ((!\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(6))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- ((\u_pd_asp|u_core|total_peaks_r\(6)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000111010100100101011110100010101001111111001011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(6),
	datac => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(6),
	datae => \u_pd_asp|u_core|ALT_INV_counter_r\(6),
	dataf => \u_pd_asp|u_core|ALT_INV_peak_count_r\(6),
	combout => \u_pd_asp|out_word_r~8_combout\);

-- Location: FF_X18_Y5_N43
\u_pd_asp|out_word_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~8_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(6));

-- Location: LABCELL_X19_Y4_N36
\data~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~6_combout\ = ( \u_pd_asp|out_word_r\(6) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(6),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~6_combout\);

-- Location: MLABCELL_X21_Y7_N21
\u_pd_asp|u_core|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~29_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(7) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~26\ ))
-- \u_pd_asp|u_core|Add1~30\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(7) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(7),
	cin => \u_pd_asp|u_core|Add1~26\,
	sumout => \u_pd_asp|u_core|Add1~29_sumout\,
	cout => \u_pd_asp|u_core|Add1~30\);

-- Location: FF_X21_Y7_N23
\u_pd_asp|u_core|total_peaks_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~29_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(7));

-- Location: LABCELL_X17_Y6_N21
\u_pd_asp|u_core|Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~29_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(7) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~26\ ))
-- \u_pd_asp|u_core|Add2~30\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(7) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(7),
	cin => \u_pd_asp|u_core|Add2~26\,
	sumout => \u_pd_asp|u_core|Add2~29_sumout\,
	cout => \u_pd_asp|u_core|Add2~30\);

-- Location: FF_X17_Y6_N23
\u_pd_asp|u_core|missed_peaks_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~29_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(7));

-- Location: FF_X18_Y7_N10
\u_pd_asp|u_core|peak_count_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(7),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(7));

-- Location: LABCELL_X16_Y7_N21
\u_pd_asp|out_word_r~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~9_combout\ = ( \u_pd_asp|u_core|peak_count_r\(7) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|counter_r\(7)))) # (\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(7))) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(7) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|counter_r\(7)))) # (\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(7))) ) ) ) # ( \u_pd_asp|u_core|peak_count_r\(7) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|missed_peaks_r\(7)) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(7) & 
-- ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|cmd_status_error~0_combout\ & \u_pd_asp|u_core|missed_peaks_r\(7)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011110011001111111100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(7),
	datab => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(7),
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(7),
	datae => \u_pd_asp|u_core|ALT_INV_peak_count_r\(7),
	dataf => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	combout => \u_pd_asp|out_word_r~9_combout\);

-- Location: FF_X16_Y7_N22
\u_pd_asp|out_word_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~9_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(7));

-- Location: LABCELL_X16_Y3_N48
\data~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~7_combout\ = ( \u_pd_asp|out_word_r\(7) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_pending_r~q\,
	datae => \u_pd_asp|ALT_INV_out_word_r\(7),
	combout => \data~7_combout\);

-- Location: MLABCELL_X21_Y7_N24
\u_pd_asp|u_core|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~33_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(8) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~30\ ))
-- \u_pd_asp|u_core|Add1~34\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(8) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(8),
	cin => \u_pd_asp|u_core|Add1~30\,
	sumout => \u_pd_asp|u_core|Add1~33_sumout\,
	cout => \u_pd_asp|u_core|Add1~34\);

-- Location: FF_X21_Y7_N26
\u_pd_asp|u_core|total_peaks_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~33_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(8));

-- Location: LABCELL_X17_Y6_N24
\u_pd_asp|u_core|Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~33_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(8) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~30\ ))
-- \u_pd_asp|u_core|Add2~34\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(8) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(8),
	cin => \u_pd_asp|u_core|Add2~30\,
	sumout => \u_pd_asp|u_core|Add2~33_sumout\,
	cout => \u_pd_asp|u_core|Add2~34\);

-- Location: FF_X17_Y6_N26
\u_pd_asp|u_core|missed_peaks_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~33_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(8));

-- Location: FF_X18_Y8_N55
\u_pd_asp|u_core|peak_count_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(8),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(8));

-- Location: LABCELL_X19_Y8_N24
\u_pd_asp|out_word_r~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~10_combout\ = ( \u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|u_core|peak_count_r\(8) & ( (!\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|counter_r\(8))) # (\u_pd_asp|cmd_status_error~0_combout\ & 
-- ((\u_pd_asp|u_core|total_peaks_r\(8)))) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|u_core|peak_count_r\(8) & ( (!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|missed_peaks_r\(8)) ) ) ) # ( \u_pd_asp|out_word_r[14]~0_combout\ 
-- & ( !\u_pd_asp|u_core|peak_count_r\(8) & ( (!\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|counter_r\(8))) # (\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|total_peaks_r\(8)))) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( 
-- !\u_pd_asp|u_core|peak_count_r\(8) & ( (\u_pd_asp|cmd_status_error~0_combout\ & \u_pd_asp|u_core|missed_peaks_r\(8)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101001001110010011110101010111111110010011100100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(8),
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(8),
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(8),
	datae => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_peak_count_r\(8),
	combout => \u_pd_asp|out_word_r~10_combout\);

-- Location: FF_X19_Y8_N25
\u_pd_asp|out_word_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~10_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(8));

-- Location: LABCELL_X19_Y8_N39
\data~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~8_combout\ = (\u_pd_asp|out_pending_r~q\ & \u_pd_asp|out_word_r\(8))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_pending_r~q\,
	datac => \u_pd_asp|ALT_INV_out_word_r\(8),
	combout => \data~8_combout\);

-- Location: FF_X18_Y7_N1
\u_pd_asp|u_core|peak_count_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(9),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(9));

-- Location: MLABCELL_X21_Y7_N27
\u_pd_asp|u_core|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~37_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(9) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~34\ ))
-- \u_pd_asp|u_core|Add1~38\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(9) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(9),
	cin => \u_pd_asp|u_core|Add1~34\,
	sumout => \u_pd_asp|u_core|Add1~37_sumout\,
	cout => \u_pd_asp|u_core|Add1~38\);

-- Location: FF_X21_Y7_N29
\u_pd_asp|u_core|total_peaks_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~37_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(9));

-- Location: LABCELL_X17_Y6_N27
\u_pd_asp|u_core|Add2~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~37_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(9) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~34\ ))
-- \u_pd_asp|u_core|Add2~38\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(9) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(9),
	cin => \u_pd_asp|u_core|Add2~34\,
	sumout => \u_pd_asp|u_core|Add2~37_sumout\,
	cout => \u_pd_asp|u_core|Add2~38\);

-- Location: FF_X17_Y6_N29
\u_pd_asp|u_core|missed_peaks_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~37_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(9));

-- Location: LABCELL_X16_Y7_N27
\u_pd_asp|out_word_r~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~11_combout\ = ( \u_pd_asp|u_core|counter_r\(9) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|total_peaks_r\(9)) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(9) & ( 
-- \u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|u_core|total_peaks_r\(9) & \u_pd_asp|cmd_status_error~0_combout\) ) ) ) # ( \u_pd_asp|u_core|counter_r\(9) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|peak_count_r\(9))) # (\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(9)))) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(9) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|peak_count_r\(9))) # (\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111100000011000000111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_peak_count_r\(9),
	datab => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(9),
	datac => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(9),
	datae => \u_pd_asp|u_core|ALT_INV_counter_r\(9),
	dataf => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	combout => \u_pd_asp|out_word_r~11_combout\);

-- Location: FF_X16_Y7_N28
\u_pd_asp|out_word_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~11_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(9));

-- Location: LABCELL_X18_Y4_N51
\data~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~9_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_word_r\(9),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~9_combout\);

-- Location: MLABCELL_X21_Y7_N30
\u_pd_asp|u_core|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~41_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(10) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~38\ ))
-- \u_pd_asp|u_core|Add1~42\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(10) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(10),
	cin => \u_pd_asp|u_core|Add1~38\,
	sumout => \u_pd_asp|u_core|Add1~41_sumout\,
	cout => \u_pd_asp|u_core|Add1~42\);

-- Location: FF_X21_Y7_N32
\u_pd_asp|u_core|total_peaks_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~41_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(10));

-- Location: FF_X18_Y6_N14
\u_pd_asp|u_core|peak_count_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(10),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(10));

-- Location: LABCELL_X17_Y6_N30
\u_pd_asp|u_core|Add2~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~41_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(10) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~38\ ))
-- \u_pd_asp|u_core|Add2~42\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(10) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(10),
	cin => \u_pd_asp|u_core|Add2~38\,
	sumout => \u_pd_asp|u_core|Add2~41_sumout\,
	cout => \u_pd_asp|u_core|Add2~42\);

-- Location: FF_X17_Y6_N32
\u_pd_asp|u_core|missed_peaks_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~41_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(10));

-- Location: LABCELL_X22_Y6_N12
\u_pd_asp|out_word_r~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~12_combout\ = ( \u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|total_peaks_r\(10) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|missed_peaks_r\(10) ) ) ) # ( \u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|counter_r\(10) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|peak_count_r\(10) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111001100110011001100000000111111110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(10),
	datab => \u_pd_asp|u_core|ALT_INV_counter_r\(10),
	datac => \u_pd_asp|u_core|ALT_INV_peak_count_r\(10),
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(10),
	datae => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~12_combout\);

-- Location: FF_X22_Y6_N13
\u_pd_asp|out_word_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~12_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(10));

-- Location: LABCELL_X23_Y6_N39
\data~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~10_combout\ = ( \u_pd_asp|out_word_r\(10) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(10),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~10_combout\);

-- Location: LABCELL_X17_Y6_N33
\u_pd_asp|u_core|Add2~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~45_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(11) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~42\ ))
-- \u_pd_asp|u_core|Add2~46\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(11) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(11),
	cin => \u_pd_asp|u_core|Add2~42\,
	sumout => \u_pd_asp|u_core|Add2~45_sumout\,
	cout => \u_pd_asp|u_core|Add2~46\);

-- Location: FF_X17_Y6_N35
\u_pd_asp|u_core|missed_peaks_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~45_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(11));

-- Location: MLABCELL_X21_Y7_N33
\u_pd_asp|u_core|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~45_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(11) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~42\ ))
-- \u_pd_asp|u_core|Add1~46\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(11) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(11),
	cin => \u_pd_asp|u_core|Add1~42\,
	sumout => \u_pd_asp|u_core|Add1~45_sumout\,
	cout => \u_pd_asp|u_core|Add1~46\);

-- Location: FF_X21_Y7_N35
\u_pd_asp|u_core|total_peaks_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~45_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(11));

-- Location: FF_X18_Y6_N34
\u_pd_asp|u_core|peak_count_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(11),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(11));

-- Location: MLABCELL_X21_Y6_N3
\u_pd_asp|out_word_r~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~13_combout\ = ( \u_pd_asp|u_core|peak_count_r\(11) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(11))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- ((\u_pd_asp|u_core|total_peaks_r\(11)))) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(11) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(11))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- ((\u_pd_asp|u_core|total_peaks_r\(11)))) ) ) ) # ( \u_pd_asp|u_core|peak_count_r\(11) & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\) # (\u_pd_asp|u_core|counter_r\(11)) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(11) & 
-- ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (\u_pd_asp|out_word_r[14]~0_combout\ & \u_pd_asp|u_core|counter_r\(11)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101101010101111111100100111001001110010011100100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(11),
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(11),
	datad => \u_pd_asp|u_core|ALT_INV_counter_r\(11),
	datae => \u_pd_asp|u_core|ALT_INV_peak_count_r\(11),
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~13_combout\);

-- Location: FF_X21_Y6_N4
\u_pd_asp|out_word_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~13_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(11));

-- Location: LABCELL_X19_Y4_N6
\data~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~11_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(11) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_out_word_r\(11),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~11_combout\);

-- Location: MLABCELL_X21_Y7_N36
\u_pd_asp|u_core|Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~49_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(12) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~46\ ))
-- \u_pd_asp|u_core|Add1~50\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(12) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(12),
	cin => \u_pd_asp|u_core|Add1~46\,
	sumout => \u_pd_asp|u_core|Add1~49_sumout\,
	cout => \u_pd_asp|u_core|Add1~50\);

-- Location: FF_X21_Y7_N38
\u_pd_asp|u_core|total_peaks_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~49_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(12));

-- Location: LABCELL_X18_Y8_N12
\u_pd_asp|u_core|peak_count_r[12]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|peak_count_r[12]~feeder_combout\ = ( \u_pd_asp|u_core|counter_r\(12) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(12),
	combout => \u_pd_asp|u_core|peak_count_r[12]~feeder_combout\);

-- Location: FF_X18_Y8_N14
\u_pd_asp|u_core|peak_count_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|peak_count_r[12]~feeder_combout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(12));

-- Location: LABCELL_X17_Y6_N36
\u_pd_asp|u_core|Add2~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~49_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(12) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~46\ ))
-- \u_pd_asp|u_core|Add2~50\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(12) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(12),
	cin => \u_pd_asp|u_core|Add2~46\,
	sumout => \u_pd_asp|u_core|Add2~49_sumout\,
	cout => \u_pd_asp|u_core|Add2~50\);

-- Location: FF_X17_Y6_N38
\u_pd_asp|u_core|missed_peaks_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~49_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(12));

-- Location: LABCELL_X22_Y6_N6
\u_pd_asp|out_word_r~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~14_combout\ = ( \u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|total_peaks_r\(12) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|missed_peaks_r\(12) ) ) ) # ( \u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|counter_r\(12) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|peak_count_r\(12) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000011110000111100000000111111110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(12),
	datab => \u_pd_asp|u_core|ALT_INV_peak_count_r\(12),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(12),
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(12),
	datae => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~14_combout\);

-- Location: FF_X22_Y6_N7
\u_pd_asp|out_word_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~14_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(12));

-- Location: LABCELL_X23_Y6_N6
\data~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~12_combout\ = ( \u_pd_asp|out_word_r\(12) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(12),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~12_combout\);

-- Location: MLABCELL_X21_Y7_N39
\u_pd_asp|u_core|Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~53_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(13) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~50\ ))
-- \u_pd_asp|u_core|Add1~54\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(13) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(13),
	cin => \u_pd_asp|u_core|Add1~50\,
	sumout => \u_pd_asp|u_core|Add1~53_sumout\,
	cout => \u_pd_asp|u_core|Add1~54\);

-- Location: FF_X21_Y7_N41
\u_pd_asp|u_core|total_peaks_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~53_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(13));

-- Location: FF_X18_Y7_N14
\u_pd_asp|u_core|peak_count_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(13),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(13));

-- Location: LABCELL_X17_Y6_N39
\u_pd_asp|u_core|Add2~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~53_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(13) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~50\ ))
-- \u_pd_asp|u_core|Add2~54\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(13) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(13),
	cin => \u_pd_asp|u_core|Add2~50\,
	sumout => \u_pd_asp|u_core|Add2~53_sumout\,
	cout => \u_pd_asp|u_core|Add2~54\);

-- Location: FF_X17_Y6_N41
\u_pd_asp|u_core|missed_peaks_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~53_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(13));

-- Location: LABCELL_X19_Y8_N0
\u_pd_asp|out_word_r~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~15_combout\ = ( \u_pd_asp|u_core|missed_peaks_r\(13) & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\) # (\u_pd_asp|u_core|total_peaks_r\(13)) ) ) ) # ( !\u_pd_asp|u_core|missed_peaks_r\(13) & ( 
-- \u_pd_asp|cmd_status_error~0_combout\ & ( (\u_pd_asp|out_word_r[14]~0_combout\ & \u_pd_asp|u_core|total_peaks_r\(13)) ) ) ) # ( \u_pd_asp|u_core|missed_peaks_r\(13) & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(13)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|counter_r\(13))) ) ) ) # ( !\u_pd_asp|u_core|missed_peaks_r\(13) & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(13)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & (\u_pd_asp|u_core|counter_r\(13))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111011101000100011101110100000011000000111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(13),
	datab => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(13),
	datad => \u_pd_asp|u_core|ALT_INV_peak_count_r\(13),
	datae => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(13),
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~15_combout\);

-- Location: FF_X19_Y8_N2
\u_pd_asp|out_word_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~15_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(13));

-- Location: LABCELL_X19_Y8_N36
\data~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~13_combout\ = (\u_pd_asp|out_pending_r~q\ & \u_pd_asp|out_word_r\(13))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_pending_r~q\,
	datac => \u_pd_asp|ALT_INV_out_word_r\(13),
	combout => \data~13_combout\);

-- Location: LABCELL_X17_Y6_N42
\u_pd_asp|u_core|Add2~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~57_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(14) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~54\ ))
-- \u_pd_asp|u_core|Add2~58\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(14) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(14),
	cin => \u_pd_asp|u_core|Add2~54\,
	sumout => \u_pd_asp|u_core|Add2~57_sumout\,
	cout => \u_pd_asp|u_core|Add2~58\);

-- Location: FF_X17_Y6_N44
\u_pd_asp|u_core|missed_peaks_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~57_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(14));

-- Location: FF_X19_Y5_N40
\u_pd_asp|u_core|peak_count_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(14),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(14));

-- Location: MLABCELL_X21_Y7_N42
\u_pd_asp|u_core|Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~57_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(14) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~54\ ))
-- \u_pd_asp|u_core|Add1~58\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(14) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(14),
	cin => \u_pd_asp|u_core|Add1~54\,
	sumout => \u_pd_asp|u_core|Add1~57_sumout\,
	cout => \u_pd_asp|u_core|Add1~58\);

-- Location: FF_X21_Y7_N44
\u_pd_asp|u_core|total_peaks_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~57_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(14));

-- Location: LABCELL_X19_Y5_N51
\u_pd_asp|out_word_r~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~16_combout\ = ( \u_pd_asp|u_core|total_peaks_r\(14) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|counter_r\(14)) ) ) ) # ( !\u_pd_asp|u_core|total_peaks_r\(14) & ( 
-- \u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|u_core|counter_r\(14) & !\u_pd_asp|cmd_status_error~0_combout\) ) ) ) # ( \u_pd_asp|u_core|total_peaks_r\(14) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(14)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(14))) ) ) ) # ( !\u_pd_asp|u_core|total_peaks_r\(14) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ 
-- & ((\u_pd_asp|u_core|peak_count_r\(14)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(14))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001101010101000000000101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_counter_r\(14),
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(14),
	datac => \u_pd_asp|u_core|ALT_INV_peak_count_r\(14),
	datad => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datae => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(14),
	dataf => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	combout => \u_pd_asp|out_word_r~16_combout\);

-- Location: FF_X21_Y5_N1
\u_pd_asp|out_word_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~16_combout\,
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(14));

-- Location: LABCELL_X24_Y5_N15
\data~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~14_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(14) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_word_r\(14),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~14_combout\);

-- Location: LABCELL_X17_Y6_N45
\u_pd_asp|u_core|Add2~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~61_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(15) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~58\ ))
-- \u_pd_asp|u_core|Add2~62\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(15) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(15),
	cin => \u_pd_asp|u_core|Add2~58\,
	sumout => \u_pd_asp|u_core|Add2~61_sumout\,
	cout => \u_pd_asp|u_core|Add2~62\);

-- Location: FF_X17_Y6_N47
\u_pd_asp|u_core|missed_peaks_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~61_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(15));

-- Location: MLABCELL_X21_Y7_N45
\u_pd_asp|u_core|Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~61_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(15) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~58\ ))
-- \u_pd_asp|u_core|Add1~62\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(15) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(15),
	cin => \u_pd_asp|u_core|Add1~58\,
	sumout => \u_pd_asp|u_core|Add1~61_sumout\,
	cout => \u_pd_asp|u_core|Add1~62\);

-- Location: FF_X21_Y7_N47
\u_pd_asp|u_core|total_peaks_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~61_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(15));

-- Location: FF_X18_Y6_N10
\u_pd_asp|u_core|peak_count_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(15),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(15));

-- Location: MLABCELL_X21_Y6_N12
\u_pd_asp|out_word_r~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~17_combout\ = ( \u_pd_asp|u_core|counter_r\(15) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|total_peaks_r\(15)) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(15) & ( 
-- \u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|u_core|total_peaks_r\(15) & \u_pd_asp|cmd_status_error~0_combout\) ) ) ) # ( \u_pd_asp|u_core|counter_r\(15) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(15)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(15))) ) ) ) # ( !\u_pd_asp|u_core|counter_r\(15) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(15)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(15))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000001011111010100000011000000111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(15),
	datab => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(15),
	datac => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_peak_count_r\(15),
	datae => \u_pd_asp|u_core|ALT_INV_counter_r\(15),
	dataf => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	combout => \u_pd_asp|out_word_r~17_combout\);

-- Location: FF_X21_Y6_N14
\u_pd_asp|out_word_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~17_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(15));

-- Location: MLABCELL_X21_Y6_N48
\data~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~15_combout\ = ( \u_pd_asp|out_word_r\(15) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_out_pending_r~q\,
	dataf => \u_pd_asp|ALT_INV_out_word_r\(15),
	combout => \data~15_combout\);

-- Location: MLABCELL_X21_Y7_N48
\u_pd_asp|u_core|Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~65_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(16) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~62\ ))
-- \u_pd_asp|u_core|Add1~66\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(16) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(16),
	cin => \u_pd_asp|u_core|Add1~62\,
	sumout => \u_pd_asp|u_core|Add1~65_sumout\,
	cout => \u_pd_asp|u_core|Add1~66\);

-- Location: FF_X21_Y7_N50
\u_pd_asp|u_core|total_peaks_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~65_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(16));

-- Location: FF_X18_Y6_N17
\u_pd_asp|u_core|peak_count_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(16),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(16));

-- Location: LABCELL_X17_Y6_N48
\u_pd_asp|u_core|Add2~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~65_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(16) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~62\ ))
-- \u_pd_asp|u_core|Add2~66\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(16) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(16),
	cin => \u_pd_asp|u_core|Add2~62\,
	sumout => \u_pd_asp|u_core|Add2~65_sumout\,
	cout => \u_pd_asp|u_core|Add2~66\);

-- Location: FF_X17_Y6_N50
\u_pd_asp|u_core|missed_peaks_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~65_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(16));

-- Location: LABCELL_X18_Y5_N12
\u_pd_asp|out_word_r~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~18_combout\ = ( \u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|total_peaks_r\(16) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|missed_peaks_r\(16) ) ) ) # ( \u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( \u_pd_asp|u_core|counter_r\(16) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( 
-- \u_pd_asp|u_core|peak_count_r\(16) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000011110000111100000000111111110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(16),
	datab => \u_pd_asp|u_core|ALT_INV_peak_count_r\(16),
	datac => \u_pd_asp|u_core|ALT_INV_counter_r\(16),
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(16),
	datae => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~18_combout\);

-- Location: FF_X17_Y5_N26
\u_pd_asp|out_word_r[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~18_combout\,
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(16));

-- Location: LABCELL_X17_Y5_N0
\data~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~16_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(16) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_word_r\(16),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~16_combout\);

-- Location: LABCELL_X17_Y6_N51
\u_pd_asp|u_core|Add2~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~69_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(17) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~66\ ))
-- \u_pd_asp|u_core|Add2~70\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(17) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(17),
	cin => \u_pd_asp|u_core|Add2~66\,
	sumout => \u_pd_asp|u_core|Add2~69_sumout\,
	cout => \u_pd_asp|u_core|Add2~70\);

-- Location: FF_X17_Y6_N53
\u_pd_asp|u_core|missed_peaks_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~69_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(17));

-- Location: FF_X19_Y5_N14
\u_pd_asp|u_core|peak_count_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(17),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(17));

-- Location: MLABCELL_X21_Y7_N51
\u_pd_asp|u_core|Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~69_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(17) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~66\ ))
-- \u_pd_asp|u_core|Add1~70\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(17) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(17),
	cin => \u_pd_asp|u_core|Add1~66\,
	sumout => \u_pd_asp|u_core|Add1~69_sumout\,
	cout => \u_pd_asp|u_core|Add1~70\);

-- Location: FF_X21_Y7_N53
\u_pd_asp|u_core|total_peaks_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~69_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(17));

-- Location: LABCELL_X19_Y5_N15
\u_pd_asp|out_word_r~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~19_combout\ = ( \u_pd_asp|out_word_r[14]~0_combout\ & ( \u_pd_asp|u_core|counter_r\(17) & ( (!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|total_peaks_r\(17)) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( 
-- \u_pd_asp|u_core|counter_r\(17) & ( (!\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|peak_count_r\(17)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(17))) ) ) ) # ( \u_pd_asp|out_word_r[14]~0_combout\ & ( 
-- !\u_pd_asp|u_core|counter_r\(17) & ( (\u_pd_asp|cmd_status_error~0_combout\ & \u_pd_asp|u_core|total_peaks_r\(17)) ) ) ) # ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( !\u_pd_asp|u_core|counter_r\(17) & ( (!\u_pd_asp|cmd_status_error~0_combout\ & 
-- ((\u_pd_asp|u_core|peak_count_r\(17)))) # (\u_pd_asp|cmd_status_error~0_combout\ & (\u_pd_asp|u_core|missed_peaks_r\(17))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101000000000000111100110101001101011111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(17),
	datab => \u_pd_asp|u_core|ALT_INV_peak_count_r\(17),
	datac => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(17),
	datae => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	dataf => \u_pd_asp|u_core|ALT_INV_counter_r\(17),
	combout => \u_pd_asp|out_word_r~19_combout\);

-- Location: FF_X18_Y5_N7
\u_pd_asp|out_word_r[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~19_combout\,
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(17));

-- Location: LABCELL_X19_Y4_N51
\data~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~17_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(17) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_word_r\(17),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~17_combout\);

-- Location: MLABCELL_X21_Y7_N54
\u_pd_asp|u_core|Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~73_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(18) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~70\ ))
-- \u_pd_asp|u_core|Add1~74\ = CARRY(( \u_pd_asp|u_core|total_peaks_r\(18) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(18),
	cin => \u_pd_asp|u_core|Add1~70\,
	sumout => \u_pd_asp|u_core|Add1~73_sumout\,
	cout => \u_pd_asp|u_core|Add1~74\);

-- Location: FF_X21_Y7_N56
\u_pd_asp|u_core|total_peaks_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~73_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(18));

-- Location: LABCELL_X17_Y6_N54
\u_pd_asp|u_core|Add2~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~73_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(18) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~70\ ))
-- \u_pd_asp|u_core|Add2~74\ = CARRY(( \u_pd_asp|u_core|missed_peaks_r\(18) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(18),
	cin => \u_pd_asp|u_core|Add2~70\,
	sumout => \u_pd_asp|u_core|Add2~73_sumout\,
	cout => \u_pd_asp|u_core|Add2~74\);

-- Location: FF_X17_Y6_N56
\u_pd_asp|u_core|missed_peaks_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~73_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(18));

-- Location: FF_X18_Y7_N16
\u_pd_asp|u_core|peak_count_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(18),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(18));

-- Location: LABCELL_X16_Y7_N9
\u_pd_asp|out_word_r~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~20_combout\ = ( \u_pd_asp|u_core|peak_count_r\(18) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|state_r~q\))) # (\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(18))) ) ) ) # ( !\u_pd_asp|u_core|peak_count_r\(18) & ( \u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\ & ((\u_pd_asp|u_core|state_r~q\))) # (\u_pd_asp|cmd_status_error~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(18))) ) ) ) # ( \u_pd_asp|u_core|peak_count_r\(18) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (!\u_pd_asp|cmd_status_error~0_combout\) # (\u_pd_asp|u_core|missed_peaks_r\(18)) ) ) ) # ( 
-- !\u_pd_asp|u_core|peak_count_r\(18) & ( !\u_pd_asp|out_word_r[14]~0_combout\ & ( (\u_pd_asp|u_core|missed_peaks_r\(18) & \u_pd_asp|cmd_status_error~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011111100111111001100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(18),
	datab => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(18),
	datac => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	datad => \u_pd_asp|u_core|ALT_INV_state_r~q\,
	datae => \u_pd_asp|u_core|ALT_INV_peak_count_r\(18),
	dataf => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	combout => \u_pd_asp|out_word_r~20_combout\);

-- Location: FF_X16_Y7_N10
\u_pd_asp|out_word_r[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~20_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(18));

-- Location: LABCELL_X19_Y4_N54
\data~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~18_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(18) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \u_pd_asp|ALT_INV_out_word_r\(18),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~18_combout\);

-- Location: MLABCELL_X21_Y7_N57
\u_pd_asp|u_core|Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add1~77_sumout\ = SUM(( \u_pd_asp|u_core|total_peaks_r\(19) ) + ( GND ) + ( \u_pd_asp|u_core|Add1~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(19),
	cin => \u_pd_asp|u_core|Add1~74\,
	sumout => \u_pd_asp|u_core|Add1~77_sumout\);

-- Location: FF_X21_Y7_N59
\u_pd_asp|u_core|total_peaks_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add1~77_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|total_peaks_r\(19));

-- Location: FF_X19_Y5_N25
\u_pd_asp|u_core|peak_count_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|u_core|counter_r\(19),
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	sload => VCC,
	ena => \u_pd_asp|u_core|peak_count_r[16]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|peak_count_r\(19));

-- Location: LABCELL_X17_Y6_N57
\u_pd_asp|u_core|Add2~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|u_core|Add2~77_sumout\ = SUM(( \u_pd_asp|u_core|missed_peaks_r\(19) ) + ( GND ) + ( \u_pd_asp|u_core|Add2~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(19),
	cin => \u_pd_asp|u_core|Add2~74\,
	sumout => \u_pd_asp|u_core|Add2~77_sumout\);

-- Location: FF_X17_Y6_N59
\u_pd_asp|u_core|missed_peaks_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|u_core|Add2~77_sumout\,
	sclr => \u_pd_asp|u_core|process_0~0_combout\,
	ena => \u_pd_asp|u_core|missed_peaks_r[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|u_core|missed_peaks_r\(19));

-- Location: LABCELL_X22_Y5_N24
\u_pd_asp|out_word_r~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~21_combout\ = ( \u_pd_asp|enabled_r~q\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(19)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(19))) ) ) ) # ( !\u_pd_asp|enabled_r~q\ & ( \u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & ((\u_pd_asp|u_core|missed_peaks_r\(19)))) # (\u_pd_asp|out_word_r[14]~0_combout\ & 
-- (\u_pd_asp|u_core|total_peaks_r\(19))) ) ) ) # ( \u_pd_asp|enabled_r~q\ & ( !\u_pd_asp|cmd_status_error~0_combout\ & ( (\u_pd_asp|u_core|peak_count_r\(19)) # (\u_pd_asp|out_word_r[14]~0_combout\) ) ) ) # ( !\u_pd_asp|enabled_r~q\ & ( 
-- !\u_pd_asp|cmd_status_error~0_combout\ & ( (!\u_pd_asp|out_word_r[14]~0_combout\ & \u_pd_asp|u_core|peak_count_r\(19)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100001111110011111100010001110111010001000111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|u_core|ALT_INV_total_peaks_r\(19),
	datab => \u_pd_asp|ALT_INV_out_word_r[14]~0_combout\,
	datac => \u_pd_asp|u_core|ALT_INV_peak_count_r\(19),
	datad => \u_pd_asp|u_core|ALT_INV_missed_peaks_r\(19),
	datae => \u_pd_asp|ALT_INV_enabled_r~q\,
	dataf => \u_pd_asp|ALT_INV_cmd_status_error~0_combout\,
	combout => \u_pd_asp|out_word_r~21_combout\);

-- Location: FF_X22_Y5_N26
\u_pd_asp|out_word_r[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~21_combout\,
	sclr => \pd_reset~combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(19));

-- Location: LABCELL_X22_Y5_N30
\data~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~19_combout\ = ( \u_pd_asp|out_word_r\(19) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_pending_r~q\,
	dataf => \u_pd_asp|ALT_INV_out_word_r\(19),
	combout => \data~19_combout\);

-- Location: MLABCELL_X21_Y5_N48
\u_pd_asp|out_word_r~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~22_combout\ = ( !\reset~input_o\ & ( (!\init~input_o\ & (((!\u_pd_asp|in_word_r\(25)) # (!\u_pd_asp|core_clear~0_combout\)) # (\u_pd_asp|in_word_r\(24)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011000100110011001100010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(24),
	datab => \ALT_INV_init~input_o\,
	datac => \u_pd_asp|ALT_INV_in_word_r\(25),
	datad => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \u_pd_asp|out_word_r~22_combout\);

-- Location: FF_X21_Y5_N49
\u_pd_asp|out_word_r[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~22_combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(24));

-- Location: MLABCELL_X21_Y5_N51
\data~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~20_combout\ = ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(24) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_word_r\(24),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~20_combout\);

-- Location: MLABCELL_X21_Y6_N27
\u_pd_asp|out_word_r~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~23_combout\ = ( \u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ & ( (!\init~input_o\ & !\reset~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_init~input_o\,
	datad => \ALT_INV_reset~input_o\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|out_word_r~23_combout\);

-- Location: FF_X21_Y6_N28
\u_pd_asp|out_word_r[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~23_combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(25));

-- Location: LABCELL_X23_Y6_N3
\data~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~21_combout\ = ( \u_pd_asp|out_word_r\(25) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~21_combout\);

-- Location: MLABCELL_X21_Y6_N57
\u_pd_asp|out_word_r~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~24_combout\ = ( \u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & !\init~input_o\) ) ) ) # ( !\u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ & ( (!\reset~input_o\ & 
-- (\u_pd_asp|in_word_r\(24) & !\init~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datac => \u_pd_asp|ALT_INV_in_word_r\(24),
	datad => \ALT_INV_init~input_o\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|out_word_r~24_combout\);

-- Location: FF_X23_Y6_N56
\u_pd_asp|out_word_r[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~24_combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(26));

-- Location: LABCELL_X23_Y6_N54
\data~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~22_combout\ = ( \u_pd_asp|out_word_r\(26) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(26),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~22_combout\);

-- Location: FF_X23_Y6_N53
\u_pd_asp|out_word_r[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~24_combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(28));

-- Location: LABCELL_X23_Y6_N51
\data~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~23_combout\ = ( \u_pd_asp|out_word_r\(28) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(28),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~23_combout\);

-- Location: FF_X23_Y6_N44
\u_pd_asp|out_word_r[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|out_word_r~24_combout\,
	sload => VCC,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(29));

-- Location: LABCELL_X23_Y6_N42
\data~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~24_combout\ = ( \u_pd_asp|out_word_r\(29) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \u_pd_asp|ALT_INV_out_word_r\(29),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \data~24_combout\);

-- Location: MLABCELL_X21_Y5_N3
\u_pd_asp|out_word_r[14]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r[14]~25_combout\ = ( \u_pd_asp|in_word_r\(25) & ( (!\init~input_o\ & (!\reset~input_o\ & !\u_pd_asp|core_clear~0_combout\)) ) ) # ( !\u_pd_asp|in_word_r\(25) & ( (!\init~input_o\ & (!\reset~input_o\ & ((!\u_pd_asp|in_word_r\(24)) # 
-- (!\u_pd_asp|core_clear~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000010000000110000000000000011000000100000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(24),
	datab => \ALT_INV_init~input_o\,
	datac => \ALT_INV_reset~input_o\,
	datad => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	combout => \u_pd_asp|out_word_r[14]~25_combout\);

-- Location: FF_X21_Y5_N5
\u_pd_asp|out_word_r[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r[14]~25_combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(30));

-- Location: MLABCELL_X21_Y5_N30
\data~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \data~25_combout\ = ( \u_pd_asp|out_word_r\(30) & ( \u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_pending_r~q\,
	datae => \u_pd_asp|ALT_INV_out_word_r\(30),
	combout => \data~25_combout\);

-- Location: FF_X17_Y7_N40
\u_pd_asp|cfg_output_dest[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(16),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_output_dest\(0));

-- Location: MLABCELL_X21_Y5_N54
\u_pd_asp|out_word_r~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~26_combout\ = ( !\u_pd_asp|in_word_r\(25) & ( \u_pd_asp|core_clear~0_combout\ & ( (!\u_pd_asp|in_word_r\(24) & (\u_pd_asp|cfg_output_dest\(0) & (!\reset~input_o\ & !\init~input_o\))) ) ) ) # ( \u_pd_asp|in_word_r\(25) & ( 
-- !\u_pd_asp|core_clear~0_combout\ & ( (\u_pd_asp|cfg_output_dest\(0) & (!\reset~input_o\ & !\init~input_o\)) ) ) ) # ( !\u_pd_asp|in_word_r\(25) & ( !\u_pd_asp|core_clear~0_combout\ & ( (\u_pd_asp|cfg_output_dest\(0) & (!\reset~input_o\ & !\init~input_o\)) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000000001100000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(24),
	datab => \u_pd_asp|ALT_INV_cfg_output_dest\(0),
	datac => \ALT_INV_reset~input_o\,
	datad => \ALT_INV_init~input_o\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|out_word_r~26_combout\);

-- Location: FF_X21_Y5_N55
\u_pd_asp|out_word_r[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~26_combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(20));

-- Location: FF_X21_Y5_N34
\u_pd_asp|cfg_output_dest[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(19),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_output_dest\(3));

-- Location: MLABCELL_X21_Y5_N36
\u_pd_asp|out_word_r~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~27_combout\ = ( \u_pd_asp|in_word_r\(25) & ( \u_pd_asp|cfg_output_dest\(3) & ( (!\init~input_o\ & (!\reset~input_o\ & !\u_pd_asp|core_clear~0_combout\)) ) ) ) # ( !\u_pd_asp|in_word_r\(25) & ( \u_pd_asp|cfg_output_dest\(3) & ( 
-- (!\init~input_o\ & (!\reset~input_o\ & ((!\u_pd_asp|in_word_r\(24)) # (!\u_pd_asp|core_clear~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011000000100000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(24),
	datab => \ALT_INV_init~input_o\,
	datac => \ALT_INV_reset~input_o\,
	datad => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \u_pd_asp|ALT_INV_cfg_output_dest\(3),
	combout => \u_pd_asp|out_word_r~27_combout\);

-- Location: FF_X21_Y5_N38
\u_pd_asp|out_word_r[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~27_combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(23));

-- Location: LABCELL_X17_Y5_N45
\addr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addr~0_combout\ = ( \u_pd_asp|out_word_r\(23) & ( \u_pd_asp|out_pending_r~q\ ) ) # ( !\u_pd_asp|out_word_r\(23) & ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(20) ) ) ) # ( \u_pd_asp|out_word_r\(23) & ( !\u_pd_asp|out_pending_r~q\ ) ) # ( 
-- !\u_pd_asp|out_word_r\(23) & ( !\u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_word_r\(20),
	datae => \u_pd_asp|ALT_INV_out_word_r\(23),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \addr~0_combout\);

-- Location: FF_X17_Y7_N59
\u_pd_asp|cfg_output_dest[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(17),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_output_dest\(1));

-- Location: MLABCELL_X21_Y5_N21
\u_pd_asp|out_word_r~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~28_combout\ = ( \u_pd_asp|in_word_r\(25) & ( !\reset~input_o\ & ( (!\init~input_o\ & (\u_pd_asp|cfg_output_dest\(1) & !\u_pd_asp|core_clear~0_combout\)) ) ) ) # ( !\u_pd_asp|in_word_r\(25) & ( !\reset~input_o\ & ( (!\init~input_o\ & 
-- (\u_pd_asp|cfg_output_dest\(1) & ((!\u_pd_asp|in_word_r\(24)) # (!\u_pd_asp|core_clear~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001000000011000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(24),
	datab => \ALT_INV_init~input_o\,
	datac => \u_pd_asp|ALT_INV_cfg_output_dest\(1),
	datad => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	datae => \u_pd_asp|ALT_INV_in_word_r\(25),
	dataf => \ALT_INV_reset~input_o\,
	combout => \u_pd_asp|out_word_r~28_combout\);

-- Location: FF_X21_Y5_N23
\u_pd_asp|out_word_r[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~28_combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(21));

-- Location: MLABCELL_X21_Y5_N12
\addr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \addr~1_combout\ = ( \u_pd_asp|out_word_r\(21) & ( \u_pd_asp|out_pending_r~q\ ) ) # ( !\u_pd_asp|out_word_r\(21) & ( \u_pd_asp|out_pending_r~q\ & ( \u_pd_asp|out_word_r\(23) ) ) ) # ( \u_pd_asp|out_word_r\(21) & ( !\u_pd_asp|out_pending_r~q\ ) ) # ( 
-- !\u_pd_asp|out_word_r\(21) & ( !\u_pd_asp|out_pending_r~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \u_pd_asp|ALT_INV_out_word_r\(23),
	datae => \u_pd_asp|ALT_INV_out_word_r\(21),
	dataf => \u_pd_asp|ALT_INV_out_pending_r~q\,
	combout => \addr~1_combout\);

-- Location: FF_X17_Y7_N2
\u_pd_asp|cfg_output_dest[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \u_pd_asp|in_word_r\(18),
	sclr => \pd_reset~combout\,
	sload => VCC,
	ena => \u_pd_asp|cfg_output_dest[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|cfg_output_dest\(2));

-- Location: MLABCELL_X21_Y5_N6
\u_pd_asp|out_word_r~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_pd_asp|out_word_r~29_combout\ = ( !\reset~input_o\ & ( \u_pd_asp|core_clear~0_combout\ & ( (!\u_pd_asp|in_word_r\(25) & (\u_pd_asp|cfg_output_dest\(2) & (!\u_pd_asp|in_word_r\(24) & !\init~input_o\))) ) ) ) # ( !\reset~input_o\ & ( 
-- !\u_pd_asp|core_clear~0_combout\ & ( (\u_pd_asp|cfg_output_dest\(2) & !\init~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000000000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_in_word_r\(25),
	datab => \u_pd_asp|ALT_INV_cfg_output_dest\(2),
	datac => \u_pd_asp|ALT_INV_in_word_r\(24),
	datad => \ALT_INV_init~input_o\,
	datae => \ALT_INV_reset~input_o\,
	dataf => \u_pd_asp|ALT_INV_core_clear~0_combout\,
	combout => \u_pd_asp|out_word_r~29_combout\);

-- Location: FF_X21_Y5_N7
\u_pd_asp|out_word_r[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \u_pd_asp|out_word_r~29_combout\,
	ena => \u_pd_asp|out_word_r[14]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_pd_asp|out_word_r\(22));

-- Location: LABCELL_X17_Y5_N30
\addr~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \addr~2_combout\ = (!\u_pd_asp|out_pending_r~q\) # ((\u_pd_asp|out_word_r\(23)) # (\u_pd_asp|out_word_r\(22)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010111111111111101011111111111110101111111111111010111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \u_pd_asp|ALT_INV_out_pending_r~q\,
	datac => \u_pd_asp|ALT_INV_out_word_r\(22),
	datad => \u_pd_asp|ALT_INV_out_word_r\(23),
	combout => \addr~2_combout\);

-- Location: IOIBUF_X76_Y81_N1
\recv.data[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(20),
	o => \recv.data[20]~input_o\);

-- Location: IOIBUF_X66_Y81_N92
\recv.data[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(21),
	o => \recv.data[21]~input_o\);

-- Location: IOIBUF_X62_Y81_N35
\recv.data[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(22),
	o => \recv.data[22]~input_o\);

-- Location: IOIBUF_X58_Y81_N58
\recv.data[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_recv.data\(23),
	o => \recv.data[23]~input_o\);

-- Location: LABCELL_X37_Y9_N3
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


