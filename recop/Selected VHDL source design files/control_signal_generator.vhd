library ieee;
use ieee.std_logic_1164.all;

use IEEE.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.opcodes.all;

entity control_signal_generator is
	port (
        opcode : input bit_8;

        -- register file related
        ld_r : out bit_1;
        rf_input_sel : out bit_3;
		dprr_wren : out bit_1
        
        -- port register related
		dpcr_lsb_sel : out bit_1;
		dpcr_wr : out bit_1;
		er_wr : out bit_1;
		er_clr : out bit_1;
		eot_wr : out bit_1;
		eot_clr : out bit_1;
		svop_wr : out bit_1;
        sop_wr : out bit_1;	
		irq_wr:out bit_1;
		irq_clr:out bit_1;
		result_wen: iout bit_1;
		result :out bit_1	

        -- alu related
        alu_operation : out bit_3;
        alu_op1_sel	 : out bit_2;
	    alu_op2_sel	 : out bit_1;
        clr_z_flag : out bit_1;

        -- data memory related
        wren : out bit_1;
		);
end control_signal_generator;

architecture beh of control_signal_generator is

begin


	
end beh;
