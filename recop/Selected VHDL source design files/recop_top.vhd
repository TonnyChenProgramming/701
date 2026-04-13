library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;

entity recop_top is
    port(
        clk : in bit_1;
        init : in bit_1;
        reset : in bit_1;
        sip : in bit_16;

        dprr : out bit_2;
        dpcr : out bit_32;
        sop : out bit_16
    );
end recop_top;

architecture beh of recop_top is
    -- fetch
    signal current_pc   : bit_16;
    signal pc_plus_1    : bit_16;
    -- decode
    signal instruction  : bit_32;
    signal sel_z        : integer range 0 to 15;
    signal sel_x        : integer range 0 to 15;
    signal ir_operand   : bit_16;

    -- control signal
    signal dpcr_lsb_sel : bit_1;
    signal dpcr_wr      : bit_1;
    signal er_wr        : bit_1;
    signal er_clr       : bit_1;
    signal eot_wr       : bit_1;
    signal eot_clr      : bit_1;
    signal svop_wr      : bit_1;
    signal sop_wr       : bit_1;
    signal irq_wr       : bit_1;
    signal irq_clr      : bit_1;
    signal result_wen   : bit_1;

    -- status signal
    signal er           : bit_1;
    signal eot          : bit_1;
    signal result       : bit_1;
    
    -- interfacing signal
    signal svop         : bit_16; -- unused
    signal sip_r        : bit_16;

    -- register file signals
    signal ld_r         : bit_1; 
    signal rx           : bit_16; 
    signal rz           : bit_16; 
    signal rf_input_sel : bit_3;

    signal dm_out       : bit_16;
    signal aluout       : bit_16;
    signal rz_max       : bit_16;
    signal sip_hold     : bit_16;
    signal er_temp      : bit_1;

    signal r7           : bit_16;
    signal dprr_res     : bit_1;
    signal dprr_res_reg : bit_1;
    signal dprr_wren    : bit_1;

    -- ALU signals
    signal alu_operation : bit_3;
    signal alu_op1_sel	 : bit_2;
	signal alu_op2_sel	 : bit_1;
	signal alu_carry	 : bit_1;   --curently unused
    
    signal clr_z_flag	 : bit_1;   --both clear z_flag

    signal z_flag        : bit_1;
    signal alu_result    : bit_16;

    -- data memory ip signals
    signal data_memory_wren : bit_1; -- 0 - read memoru; 1 - write memory

begin
       -- combinational circuit
       pc_plus_1 <= std_logic_vector(unsigned(current_pc) + 1);
       sel_z <= to_integer(unsigned(instruction(23 downto 20)));
       sel_x <= to_integer(unsigned(instruction(19 downto 16)));
       ir_operand <= instruction(15 downto 0);
       u_pc : entity work.program_counter
       port map (
            clk => clk,
            init => init, 
            reset => reset,
            pc_plus_1 => pc_plus_1,
            current_pc => current_pc
       );
       u_im_ip : entity work.instructin_memory_ip
       port map (
            address => current_pc(10 downto 0),
            clock => clk,
            q => instruction
       );
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
            ir_operand   => ir_operand,
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
        u_registers : entity work.registers
        port map(
  		clk => clk,
		reset => reset,
		dpcr => dpcr,
		r7 => r7,
		rx => rx,
		ir_operand => ir_operand,
		dpcr_lsb_sel => dpcr_lsb_sel,
		dpcr_wr =>dpcr_wr,
		-- environment ready and set and clear signals
		er => er,
		er_wr => er_wr,
		er_clr => er_clr,
		-- end of thread and set and clear signals
		eot => eot,
		eot_wr => eot_wr,
		eot_clr => eot_clr,
		-- svop and write enable signal
		svop => svop,
		svop_wr => svop_wr,
		-- sip souce and registered outputs
		sip_r => sip_r,
		sip => sip, 
		-- sop and write enable signal
		sop => sop,
		sop_wr => sop_wr,
		-- dprr, irq (dprr(1)) set and clear signals and result source and write enable signal
		dprr => dprr,
		irq_wr => irq_wr,
		irq_clr => irq_clr,
		result_wen => result_wen,
		result => result
        );
        u_ALU : entity work.alu
        port map (
            clk => clk,
            z_flag => z_flag,
            alu_operation => alu_operation,
            alu_op1_sel => alu_op1_sel,
            alu_op2_sel => alu_op2_sel,
            alu_carry => alu_carry,
            alu_result => alu_result,
            rx => rx,
            rz => rz,
            ir_operand => ir_operand,
            clr_z_flag => clr_z_flag,
            reset => reset
        );
        u_dm_ip : entity work.data_memory_ip
        port map (
            address => alu_result(11 downto 0),
            clock => clk,
            data => rz,
            wren => data_memory_wren,
            q => dm_out
        );

end beh;