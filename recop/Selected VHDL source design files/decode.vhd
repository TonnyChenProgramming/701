--decode includes control unit, register file, and sign extend
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;

entity decode is 
    port(
        clk : in bit_1;
        init : in bit_1;
        reset : in bit_1;

        instruction : in bit_32;
        --derived output from instruction
        ir_operand: out bit_16;

        --register related output signals
        rx : out bit_16;
        rz: out bit_16;
        r7 : out bit_16

        --control unit output signals
        --dpcr: out bit_32;
        --er: out bit_1;
        --eot: out bit_1;
        --svop : out bit_16;
        --sip_r : out bit_16;
        --sop : out bit_16;
        --dprr :out bit_2;

    );

end decode;

architecture beh of decode is
    -- initialise all the write back signal for register file
    signal ld_r : bit_1;
    signal rf_input_sel : bit_3;
	 signal ir_operand_input : bit_16;
    signal dm_out : bit_16;
    signal aluout : bit_16;
    signal rz_max       : bit_16;
    signal sip_hold     : bit_16;
    signal er_temp      : bit_1;
    signal dprr_res     : bit_1;
    signal dprr_res_reg : bit_1;
    signal dprr_wren    : bit_1;

    --declare signals from instruction
    signal sel_z        :integer range 0 to 15;
    signal sel_x        :integer range 0 to 15;
    signal opcode       :bit_6;

begin

    --disable all the write back signal for register file
    ld_r <= '0';
    rf_input_sel <= "000";
	 ir_operand_input  <= x"0000";
    dm_out  <= x"0000";
    aluout  <= x"0000";
    rz_max  <= x"0000";
    sip_hold  <= x"0000";
    er_temp  <= '0'; 
    dprr_res  <= '0'; 
    dprr_res_reg  <= '0'; 
    dprr_wren  <= '0'; 

    --assign signals from instruction
    sel_z <= to_integer(unsigned(instruction(23 downto 20)));
    sel_x <= to_integer(unsigned(instruction(19 downto 16)));
    ir_operand <= instruction(15 downto 0);
	 opcode <= instruction(31 downto 26);

    u_regfile : entity work.regfile
    port map (
        clk          => clk,
        init         => init,
        ld_r         => ld_r,
        sel_z        => sel_z,
        sel_x        => sel_x,
        rx           => rx,
        rz           => rz,
        rf_input_sel => rf_input_sel,
        ir_operand   => ir_operand_input,
        dm_out       => dm_out,
        aluout       => aluout,
        rz_max       => rz_max,
        sip_hold     => sip_hold,
        er_temp      => er_temp,
        r7           => r7,
        dprr_res     => dprr_res,
        dprr_res_reg => dprr_res_reg,
        dprr_wren    => dprr_wren
    );

end beh;