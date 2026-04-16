--decode includes control unit, register file, and sign extend
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;

entity DecodeandWriteback is 
    port(
        clk : in bit_1;
        init : in bit_1;
        reset : in bit_1;

        instruction : in bit_32;
        --signal for combinational control unit
        z_flag : in bit_1;
        --signal for write back stage
        ld_r   : in bit_1;
        dm_out : in bit_16;
        aluout : in bit_16;
        rz_max : in bit_16;
        sip_hold : in bit_16;

        --register related output signals
        rx : out bit_16;
        rz: out bit_16;
        r7 : out bit_16;

        --control unit output signals
        
        -- register file related
        rf_input_sel : out bit_3;
		dprr_wren : out bit_1;

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
		result_wen: out bit_1;
		result :out bit_1;	

        -- alu related
        alu_operation : out bit_3;
        alu_op1_sel	 : out bit_2;
	    alu_op2_sel	 : out bit_1;
        clr_z_flag : out bit_1;

        -- data memory related
        dm_wr_en : out bit_1;
        dm_addr_sel : out bit_2; 
        dm_data_sel : out bit_2;

        -- branch related
        pc_sel : out bit_2

    );

end DecodeandWriteback;

architecture beh of DecodeandWriteback is
    -- initialise all the write back signal for register file

    signal er_temp      : bit_1;
    signal dprr_res     : bit_1;
    signal dprr_res_reg : bit_1;

    --declare signals from instruction
    signal sel_z        :integer range 0 to 15;
    signal sel_x        :integer range 0 to 15;
	signal ir_operand	:bit_16;
    signal opcode       :bit_8;

    -- clone internal used signal for output
    signal rf_input_sel_s : bit_3;
    signal dprr_wren_s    : bit_1;
    signal rz_s           : bit_16;
begin

    --disable all the write back signal for register file
    er_temp  <= '0'; 
    dprr_res  <= '0'; 
    dprr_res_reg  <= '0'; 

    --assign signals from instruction
    sel_z <= to_integer(unsigned(instruction(23 downto 20)));
    sel_x <= to_integer(unsigned(instruction(19 downto 16)));
    ir_operand <= instruction(15 downto 0);
    opcode <= instruction(31 downto 24);

    --send internal signal to output
    rf_input_sel <= rf_input_sel_s;
    dprr_wren    <= dprr_wren_s;
    rz           <= rz_s;

    u_regfile : entity work.regfile
    port map (
        clk          => clk,
        init         => init,
        ld_r         => ld_r,
        sel_z        => sel_z,
        sel_x        => sel_x,
        rx           => rx,
        rz           => rz_s,
        rf_input_sel => rf_input_sel_s,
        ir_operand   => ir_operand,
        dm_out       => dm_out,
        aluout       => aluout,
        rz_max       => rz_max,
        sip_hold     => sip_hold,
        er_temp      => er_temp,
        r7           => r7,
        dprr_res     => dprr_res,
        dprr_res_reg => dprr_res_reg,
        dprr_wren    => dprr_wren_s
    );
    u_controlpath : entity work.control_signal_generator
    port map(
        opcode       => opcode,
        rz           => rz_s,
        z_flag       => z_flag,

        -- register file related
        rf_input_sel => rf_input_sel_s,
        dprr_wren    => dprr_wren_s,

        -- port register related
        dpcr_lsb_sel => dpcr_lsb_sel,
        dpcr_wr      => dpcr_wr,
        er_wr        => er_wr,
        er_clr       => er_clr,
        eot_wr       => eot_wr,
        eot_clr      => eot_clr,
        svop_wr      => svop_wr,
        sop_wr       => sop_wr,
        irq_wr       => irq_wr,
        irq_clr      => irq_clr,
        result_wen   => result_wen,
        result       => result,

        -- alu related
        alu_operation => alu_operation,
        alu_op1_sel   => alu_op1_sel,
        alu_op2_sel   => alu_op2_sel,
        clr_z_flag    => clr_z_flag,

        -- data memory related
        dm_wr_en        => dm_wr_en,
        dm_addr_sel => dm_addr_sel,
        dm_data_sel  => dm_data_sel,

        -- branch related
        pc_sel       => pc_sel
    );


end beh;