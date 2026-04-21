-- ReCOP_IP.vhd  (SIMULATION VERSION v2 - with Instruction Register fix)
-- Fix: Added IR register to latch instruction during FETCH.
-- Without IR, the combinational PM changes instruction when PC updates,
-- causing WRITEBACK to use the wrong opcode/operand.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.recop_types.all;
use work.various_constants.all;

entity ReCOP_IP is
    port (
        clock       : in  bit_1;
        reset       : in  bit_1;
        init        : in  bit_1;
        sip         : in  bit_16;
        sop         : out bit_16;
        dpcr        : out bit_32;
        dprr        : out bit_2;
        debug_state : out bit_3
    );
end entity ReCOP_IP;

architecture Structural of ReCOP_IP is

    signal current_pc  : bit_16;
    signal pc_plus_1   : bit_16;
    signal next_pc     : bit_16;
    signal pc_write    : bit_1;
    signal pc_sel      : bit_2;

    -- Raw output from combinational ROM
    signal pm_q        : bit_32;
    -- Instruction Register: latches pm_q during FETCH, stays stable after
    signal ir          : bit_32 := x"34000000";

    signal sel_z       : integer range 0 to 15;
    signal sel_x       : integer range 0 to 15;
    signal ir_operand  : bit_16;

    signal rx, rz, r7  : bit_16;

    signal ld_r          : bit_1;
    signal rf_input_sel  : bit_3;
    signal dprr_wren     : bit_1;
    signal dpcr_lsb_sel  : bit_1;
    signal dpcr_wr       : bit_1;
    signal er_wr, er_clr : bit_1;
    signal eot_wr, eot_clr : bit_1;
    signal svop_wr, sop_wr : bit_1;
    signal irq_wr, irq_clr : bit_1;
    signal result_wen, result_sig : bit_1;
    signal alu_operation : bit_3;
    signal alu_op1_sel   : bit_2;
    signal alu_op2_sel   : bit_1;
    signal clr_z_flag    : bit_1;
    signal dm_wr_en      : bit_1;
    signal dm_addr_sel   : bit_2;
    signal dm_data_sel   : bit_2;

    signal alu_result, rz_max, dm_out : bit_16;
    signal z_flag        : bit_1;
    signal er, eot       : bit_1;
    signal svop, sip_r   : bit_16;

    signal state_bits    : bit_3;

begin

    debug_state <= state_bits;

    -- =========================================================
    -- FETCH
    -- =========================================================
    pc_plus_1 <= bit_16(unsigned(current_pc) + 1);

    with pc_sel select
        next_pc <= pc_plus_1  when pc_sel_plus_one,
                   ir_operand when pc_sel_from_operand,
                   rx         when pc_sel_from_rx,
                   x"0000"    when pc_sel_from_zero,
                   pc_plus_1  when others;

    u_pc : entity work.program_counter
        port map (clk => clock, init => init, reset => reset,
                  pc_write => pc_write, next_pc => next_pc,
                  current_pc => current_pc);

    -- Combinational ROM
    u_pm : entity work.instruction_memory_comb
        port map (address => current_pc, q => pm_q);

    -- =========================================================
    -- INSTRUCTION REGISTER
    -- Latches the instruction during S_FETCH (state_bits="000")
    -- so it stays stable during DECODE, EXECUTE, and WRITEBACK
    -- even after the PC has changed.
    -- =========================================================
    process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' or init = '1' then
                ir <= x"34000000";  -- NOOP on reset
            elsif state_bits = "000" then  -- S_FETCH
                ir <= pm_q;
            end if;
        end if;
    end process;

    -- Use IR (not pm_q) for all decode/execute signals
    sel_z      <= to_integer(unsigned(ir(23 downto 20)));
    sel_x      <= to_integer(unsigned(ir(19 downto 16)));
    ir_operand <= ir(15 downto 0);

    -- =========================================================
    -- DECODE (Register File)
    -- =========================================================
    u_rf : entity work.regfile
        port map (clk => clock, init => init, ld_r => ld_r,
                  sel_z => sel_z, sel_x => sel_x,
                  rx => rx, rz => rz, rf_input_sel => rf_input_sel,
                  ir_operand => ir_operand, dm_out => dm_out,
                  aluout => alu_result, rz_max => rz_max,
                  sip_hold => sip_r, er_temp => '0', r7 => r7,
                  dprr_res => '0', dprr_res_reg => '0',
                  dprr_wren => dprr_wren);

    -- =========================================================
    -- CONTROL UNIT
    -- Uses ir(31:24) not pm_q(31:24)
    -- =========================================================
    u_cu : entity work.multicycle_moore_machine
        port map (clk => clock, init => init, reset => reset,
                  opcode => ir(31 downto 24),  -- from IR, not raw ROM
                  rz => rz, z_flag => z_flag,
                  state_bits => state_bits,
                  ld_r => ld_r, rf_input_sel => rf_input_sel,
                  dprr_wren => dprr_wren,
                  dpcr_lsb_sel => dpcr_lsb_sel, dpcr_wr => dpcr_wr,
                  er_wr => er_wr, er_clr => er_clr,
                  eot_wr => eot_wr, eot_clr => eot_clr,
                  svop_wr => svop_wr, sop_wr => sop_wr,
                  irq_wr => irq_wr, irq_clr => irq_clr,
                  result_wen => result_wen, result => result_sig,
                  alu_operation => alu_operation,
                  alu_op1_sel => alu_op1_sel, alu_op2_sel => alu_op2_sel,
                  clr_z_flag => clr_z_flag,
                  dm_wr_en => dm_wr_en,
                  dm_addr_sel => dm_addr_sel, dm_data_sel => dm_data_sel,
                  pc_sel => pc_sel, pc_write => pc_write);

    -- =========================================================
    -- EXECUTE
    -- =========================================================
    u_ex : entity work.execute
        port map (clk => clock, init => init, reset => reset,
                  rx => rx, rz => rz, ir_operand => ir_operand,
                  pc_in => current_pc,
                  alu_operation => alu_operation,
                  alu_op1_sel => alu_op1_sel, alu_op2_sel => alu_op2_sel,
                  clr_z_flag => clr_z_flag,
                  dm_wr_en => dm_wr_en,
                  dm_addr_sel => dm_addr_sel, dm_data_sel => dm_data_sel,
                  alu_result => alu_result, rz_max => rz_max,
                  dm_out => dm_out, z_flag => z_flag);

    -- =========================================================
    -- SPECIAL REGISTERS
    -- =========================================================
    u_regs : entity work.registers
        port map (clk => clock, reset => reset,
                  dpcr => dpcr, r7 => r7, rx => rx,
                  ir_operand => ir_operand,
                  dpcr_lsb_sel => dpcr_lsb_sel, dpcr_wr => dpcr_wr,
                  er => er, er_wr => er_wr, er_clr => er_clr,
                  eot => eot, eot_wr => eot_wr, eot_clr => eot_clr,
                  svop => svop, svop_wr => svop_wr,
                  sip_r => sip_r, sip => sip,
                  sop => sop, sop_wr => sop_wr,
                  dprr => dprr, irq_wr => irq_wr, irq_clr => irq_clr,
                  result_wen => result_wen, result => result_sig);

end architecture Structural;
