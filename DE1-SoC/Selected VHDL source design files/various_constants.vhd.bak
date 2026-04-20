-- Zoran Salcic

library ieee;
use ieee.std_logic_1164.all;
use work.recop_types.all;

package various_constants is
-- PC
---- next program counte selection pc_sel
	constant pc_sel_plus_one : bit_2 := "00";
	constant pc_sel_from_operand : bit_2 := "01";
	constant pc_sel_from_rx : bit_2 := "10";
	constant pc_sel_unused : bit_2 := "11";
-- ALU
---- ALU operation selection alu_sel
	constant alu_add: bit_3 := "000";
	constant alu_sub: bit_3 := "001";
	constant alu_and: bit_3 := "010";
	constant alu_or: bit_3 := "011";
	constant alu_idle: bit_3 := "100";
	constant alu_max: bit_3 := "101";
---- ALU operand 1 selection alu_op1_sel
	constant alu_op1_from_rx        : bit_2 := "00";
	constant alu_op1_from_immediate : bit_2 := "01";
	constant alu_op1_const_1        : bit_2 := "10";
	constant alu_op1_const_0        : bit_2 := "11";  -- fallback

---- ALU operand 2 selection alu_op2_sel
	constant alu_op2_from_rx : bit_1 := '0';
	constant alu_op2_from_rz : bit_1 := '1';

-- register write 
---- write back selection ld_r
	constant register_write_back_enabled : bit_1 := '1';
	constant register_write_back_disabled : bit_1 := '0';
---- write back source selection rf_input_sel
	constant from_ir_operand   : bit_3 := "000";
	constant from_dprr_res_reg : bit_3 := "001";
	constant from_reserved_010 : bit_3 := "010";
	constant from_aluout       : bit_3 := "011";
	constant from_rz_max       : bit_3 := "100";
	constant from_sip_hold     : bit_3 := "101";
	constant from_er_temp      : bit_3 := "110";
	constant from_dm_out       : bit_3 := "111";

-- data memory
---- data memory write selection dm_wr_en
	constant dm_write_enable  : bit_1 := '1';
	constant dm_read_enable : bit_1 := '0';
---- data memory address source mem_addr_sel
	constant dm_addr_from_rx : bit_2 := "00";
	constant dm_addr_from_rz : bit_2 := "01";
	constant dm_addr_from_ir_operand : bit_2 := "10";
	constant unused : bit_2 := "11";
---- data memory write data source dm_data_sel
	constant dm_data_from_rx         : bit_2 := "00";
	constant dm_data_from_rz         : bit_2 := "01";
	constant dm_data_from_ir_operand : bit_2 := "10";
	constant dm_data_from_pc         : bit_2 := "11";

end various_constants;	
