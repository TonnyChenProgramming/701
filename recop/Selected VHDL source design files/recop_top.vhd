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

        dprr  : out bit_2;
        dpcr  : out bit_32;
        sop   : out bit_16
    );
end recop_top;

architecture beh of recop_top is

    -- Fetch
    signal current_pc   : bit_16;
    signal pc_plus_1    : bit_16;
    signal next_pc      : bit_16;
    signal instruction  : bit_32;

    -- Decode outputs
    signal rx           : bit_16;
    signal rz           : bit_16;
    signal r7           : bit_16;
    signal ir_operand   : bit_16;

    -- Control signals (from decode/CU to execute and top)
    signal ld_r          : bit_1;
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
    signal alu_operation : bit_3;
    signal alu_op1_sel   : bit_2;
    signal alu_op2_sel   : bit_1;
    signal clr_z_flag    : bit_1;
    signal dm_wr_en      : bit_1;
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


    -- FETCH
    -- PC+1 computed combinationally
    -- pc_sel MUX selects: normal(+1) / jump to operand / jump to Rx

    pc_plus_1 <= std_logic_vector(unsigned(current_pc) + 1);

    with pc_sel select
        next_pc <= pc_plus_1    when pc_sel_plus_one,
                   ir_operand   when pc_sel_from_operand,
                   rx           when pc_sel_from_rx,
                   pc_plus_1    when others;

    u_pc : entity work.program_counter
        port map (
            clk        => clk,
            init       => init,
            reset      => reset,
            pc_plus_1  => next_pc,
            current_pc => current_pc
        );

    u_im_ip : entity work.instructin_memory_ip
        port map (
            address => current_pc(10 downto 0),
            clock   => clk,
            q       => instruction
        );


    -- DECODE AND WRITEBACK
    -- Contains RF + CU
    -- Reads Rz/Rx for execute; writes results back on next clock when ld_r='1'

    u_decode : entity work.DecodeandWriteback
        port map (
            clk          => clk,
            init         => init,
            reset        => reset,
            instruction  => instruction,
            z_flag       => z_flag,
            dm_out       => dm_out,
            aluout       => alu_result,
            rz_max       => rz_max,
            sip_hold     => sip_r,

            rx           => rx,
            rz           => rz,
            r7           => r7,
            ir_operand   => ir_operand,

            ld_r         => ld_r,
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
            alu_operation => alu_operation,
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            clr_z_flag    => clr_z_flag,
            dm_wr_en      => dm_wr_en,
            dm_addr_sel   => dm_addr_sel,
            dm_data_sel   => dm_data_sel,
            pc_sel        => pc_sel
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