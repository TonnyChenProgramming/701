library ieee;
use ieee.std_logic_1164.all;
use work.recop_types.all;

package various_constants is

    -- ALU operation (alu_operation : bit_3)
    constant alu_add  : bit_3 := "000";
    constant alu_sub  : bit_3 := "001";
    constant alu_and  : bit_3 := "010";
    constant alu_or   : bit_3 := "011";
    constant alu_idle : bit_3 := "100";
    constant alu_max  : bit_3 := "101";

    -- ALU OP1 source (alu_op1_sel : bit_2)
    -- "00"=Rx  "01"=ir_operand  "10"=0x0001  "11"=0x0000
    constant alu_op1_from_rx        : bit_2 := "00";
    constant alu_op1_from_immediate : bit_2 := "01";

    -- ALU OP2 source (alu_op2_sel : bit_1)
    -- '0'=Rx  '1'=Rz
    constant alu_op2_from_rx : bit_1 := '0';
    constant alu_op2_from_rz : bit_1 := '1';

    -- Register File write data source (rf_input_sel : bit_3)
    -- "000"=ir_operand  "011"=aluout  "100"=rz_max  "101"=sip_hold  "110"=er_temp  "111"=dm_out
    constant from_ir_operand : bit_3 := "000";
    constant from_aluout     : bit_3 := "011";
    constant from_rz_max     : bit_3 := "100";
    constant from_sip_hold   : bit_3 := "101";
    constant from_er_temp    : bit_3 := "110";
    constant from_dm_out     : bit_3 := "111";

    -- Data memory write enable (dm_wr_en : bit_1)
    constant dm_read_enable  : bit_1 := '0';
    constant dm_write_enable : bit_1 := '1';

    -- Data memory address source (dm_addr_sel : bit_2)
    -- "00"=Rz  "01"=ir_operand  "10"=Rx
    constant dm_addr_from_rz         : bit_2 := "00";
    constant dm_addr_from_ir_operand : bit_2 := "01";
    constant dm_addr_from_rx         : bit_2 := "10";

    -- Data memory write data source (dm_data_sel : bit_2)
    -- "00"=Rx  "01"=ir_operand  "10"=pc_in
    constant dm_data_from_rx         : bit_2 := "00";
    constant dm_data_from_ir_operand : bit_2 := "01";
    constant dm_data_from_pc         : bit_2 := "10";

    -- PC source (pc_sel : bit_2)
    -- "00"=pc+1  "01"=ir_operand  "10"=Rx
    constant pc_sel_plus_one     : bit_2 := "00";
    constant pc_sel_from_operand : bit_2 := "01";
    constant pc_sel_from_rx      : bit_2 := "10";
    constant pc_sel_from_zero    : bit_2 := "11";

end various_constants;