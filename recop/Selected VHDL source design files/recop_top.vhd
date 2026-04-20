library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;

entity recop_top is
    port(
        clk   : in bit_1;
        init  : in bit_1;
        reset : in bit_1;
        sip   : in bit_16;

        debug_state : out bit_3;

        dprr  : out bit_2;
        dpcr  : out bit_32;
        sop   : out bit_16
    );
end recop_top;

architecture beh of recop_top is
	

    -- Fetch
    signal current_pc   : bit_16;
    signal pc_write	    : bit_1;	-- multicycle fsm related
    signal pc_plus_1    : bit_16;
    signal next_pc      : bit_16;

    signal instruction  : bit_32;
    --Decode inputs
    signal sel_z : integer range 0 to 15;
    signal sel_x : integer range 0 to 15;

    -- Decode outputs
    signal rx           : bit_16;
    signal rz           : bit_16;
    signal r7           : bit_16;
    signal ir_operand   : bit_16;

    -- Control signals (from decode/CU to execute and top)
    signal ld_r          : bit_1;	-- multicycle fsm related
    signal rf_input_sel  : bit_3;
    signal dprr_wren     : bit_1;
    signal dpcr_lsb_sel  : bit_1;
    signal dpcr_wr       : bit_1;
    signal er_wr         : bit_1;
    signal er_clr        : bit_1;
    signal eot_wr        : bit_1;
    signal eot_clr       : bit_1;
    signal svop_wr       : bit_1;
    signal sop_wr        : bit_1;
    signal irq_wr        : bit_1;
    signal irq_clr       : bit_1;
    signal result_wen    : bit_1;
    signal result_sig    : bit_1;
    signal alu_operation : bit_3;	-- multicycle fsm related
    signal alu_op1_sel   : bit_2;
    signal alu_op2_sel   : bit_1;
    signal clr_z_flag    : bit_1;
    signal dm_wr_en      : bit_1;	-- multicycle fsm related
    signal dm_addr_sel   : bit_2;
    signal dm_data_sel   : bit_2;
    signal pc_sel        : bit_2;

    -- Execute outputs
    signal alu_result    : bit_16;
    signal rz_max        : bit_16;
    signal dm_out        : bit_16;
    signal z_flag        : bit_1;

    -- Special registers
    signal er            : bit_1;
    signal eot           : bit_1;
    signal svop          : bit_16;
    signal sip_r         : bit_16;

begin
	-- initiliase current pc to zero
	--FSM Moore Machine + control unit
    -- Minimum 3 cycles:
    --   FETCH -> DECODE -> EXECUTE/MEM_WRITE -> FETCH
    -- Maximum 4 cycles:
    --   FETCH -> DECODE -> EXECUTE/MEM_READ -> WRITEBACK -> FETCH
    u_cu : entity work.multicycle_moore_machine
        port map(
            --inputs
            clk        => clk,
            init       => init,
            reset      => reset,

            opcode       => instruction(31 downto 24),
            rz           => rz,
            z_flag       => z_flag,

            --outputs
            state_bits  => debug_state,
            ld_r         => ld_r,	-- multicycle fsm related
            rf_input_sel => rf_input_sel,
            dprr_wren    => dprr_wren,

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
            result       => result_sig,

            alu_operation => alu_operation,	-- multicycle fsm related
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            clr_z_flag    => clr_z_flag,

            dm_wr_en    => dm_wr_en,	-- multicycle fsm related
            dm_addr_sel => dm_addr_sel,
            dm_data_sel => dm_data_sel,

            pc_sel      => pc_sel,
            pc_write    => pc_write	-- multicycle fsm related
        );


    -- FETCH
    -- PC+1 computed combinationally
    -- pc_sel MUX selects: normal(+1) / jump to operand / jump to Rx

    pc_plus_1 <= bit_16(unsigned(current_pc) + 1);

    with pc_sel select
        next_pc <= pc_plus_1    when pc_sel_plus_one,
                   ir_operand   when pc_sel_from_operand,
                   rx           when pc_sel_from_rx,
                   x"0000"      when pc_sel_from_zero,
                   pc_plus_1    when others;
    
    u_pc : entity work.program_counter
        port map (
            clk        => clk,
            init       => init,
            reset      => reset,

		    pc_write   => pc_write,
            next_pc    => next_pc,
            current_pc => current_pc
        );

    u_im_ip : entity work.instruction_memory_ip
        port map (
            address => current_pc(8 downto 0),
            clock   => clk,
            q       => instruction
        );

    --u_im_comb : entity work.instruction_memory_comb
		--port map (
            --address => current_pc,
            --q => instruction
		--);

    -- DECODE AND WRITEBACK
    -- Contains RF only
    -- Reads Rz/Rx for execute; writes results back on next clock when ld_r='1'
        sel_z <= to_integer(unsigned(instruction(23 downto 20))); -- 4 bits 2^4 = 16 register
        sel_x <= to_integer(unsigned(instruction(19 downto 16))); --4 bits 2^4 = 16 register
        ir_operand <= instruction(15 downto 0);
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
            aluout       => alu_result,
            rz_max       => rz_max,
            sip_hold     => sip_r,
            er_temp      => '0',
            r7           => r7,
            dprr_res     => '0',
            dprr_res_reg => '0',
            dprr_wren    => dprr_wren
        );
		  
    -- EXECUTE
    -- Contains ALU + Data Memory + MUXes + MAX comparator
    -- Results feed back to decode for RF writeback

    u_execute : entity work.execute
        port map (
            clk           => clk,
            init          => init,
            reset         => reset,
            rx            => rx,
            rz            => rz,
            ir_operand    => ir_operand,
            pc_in         => current_pc,
            alu_operation => alu_operation,
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            clr_z_flag    => clr_z_flag,
            dm_wr_en      => dm_wr_en,
            dm_addr_sel   => dm_addr_sel,
            dm_data_sel   => dm_data_sel,
            alu_result    => alu_result,
            rz_max        => rz_max,
            dm_out        => dm_out,
            z_flag        => z_flag
        );


    -- SPECIAL REGISTERS (DPCR, ER, EOT, SIP, SOP, DPRR)

    u_registers : entity work.registers
        port map (
            clk          => clk,
            reset        => reset,
            dpcr         => dpcr,
            r7           => r7,
            rx           => rx,
            ir_operand   => ir_operand,
            dpcr_lsb_sel => dpcr_lsb_sel,
            dpcr_wr      => dpcr_wr,
            er           => er,
            er_wr        => er_wr,
            er_clr       => er_clr,
            eot          => eot,
            eot_wr       => eot_wr,
            eot_clr      => eot_clr,
            svop         => svop,
            svop_wr      => svop_wr,
            sip_r        => sip_r,
            sip          => sip,
            sop          => sop,
            sop_wr       => sop_wr,
            dprr         => dprr,
            irq_wr       => irq_wr,
            irq_clr      => irq_clr,
            result_wen   => result_wen,
            result       => result_sig
        );

end beh;