-- ============================================================================
-- ReCOP_IP.vhd  –  ReCOP Coprocessor IP  (top-level component wrapper)
--
-- ── What this file is ────────────────────────────────────────────────────────
-- Self-contained ReCOP coprocessor ready to be dropped into any larger design
-- as a single component.  All internal details (FSM, register file, ALU,
-- memories) are hidden behind the seven-signal external interface below.
--
-- ── External interface ───────────────────────────────────────────────────────
--
--   clock  in  std_logic                      50 MHz system clock (DE1-SoC)
--   reset  in  std_logic                      synchronous reset, active-high
--   init   in  std_logic                      re-initialise PC and registers
--
--   sip    in  std_logic_vector(15 downto 0)  Serial Input Port
--                                             Data written here by the host
--                                             before issuing a DATACALL; ReCOP
--                                             reads it with the LSIP instruction.
--
--   sop    out std_logic_vector(15 downto 0)  Serial Output Port
--                                             Written by ReCOP via SSOP;
--                                             read by the host after execution.
--
--   dpcr   out std_logic_vector(31 downto 0)  Data Path Control Register
--                                             32-bit control word produced by
--                                             DATACALL / DATACALL #val.
--                                             Upper 16 bits = Rx value,
--                                             Lower 16 bits = immediate or R7.
--
--   dprr   out std_logic_vector(1 downto 0)   Data Path Result Register
--                                             bit 1 = IRQ (interrupt request)
--                                             bit 0 = result flag (SRES/DPRR)
--
-- ── Optional debug port ───────────────────────────────────────────────────────
--   debug_state  out std_logic_vector(2 downto 0)
--                                             Current FSM state (for waveforms)
--                                             000=FETCH  001=DECODE  010=EXECUTE
--                                             011=MEM_READ  100=MEM_WRITE
--                                             101=WRITEBACK
--
-- ── Instantiation example ────────────────────────────────────────────────────
--
--   recop : entity work.ReCOP_IP
--       port map (
--           clock       => sys_clk,
--           reset       => sys_reset,
--           init        => recop_init,
--           sip         => host_to_recop,
--           sop         => recop_to_host,
--           dpcr        => recop_dpcr,
--           dprr        => recop_dprr,
--           debug_state => open            -- tie off in synthesis
--       );
--
-- ── Internal architecture ─────────────────────────────────────────────────────
--   Stage 1 – FETCH    : program_counter  +  ReCOP_PM (512 × 32-bit ROM)
--   Stage 2 – DECODE   : regfile (16 × 16-bit)  +  multicycle_moore_machine
--   Stage 3 – EXECUTE  : execute (ALU + 16-bit DM + MAX comparator)
--   Support            : registers (DPCR, ER, EOT, SIP, SOP, DPRR, SVOP)
--
-- ── Device target ────────────────────────────────────────────────────────────
--   DE1-SoC  /  Cyclone V  (5CSEMA5F31C6)
--   Program Memory : 512 × 32-bit  →  2 × M10K blocks
--   Data   Memory  : 512 × 16-bit  →  1 × M10K block   (16-bit data path)
--
-- ── Instruction encoding ─────────────────────────────────────────────────────
--   [AM:2][OP:6][Rz:4][Rx:4][OPERAND:16]   (matches opcodes.vhd)
--   Assemble programs with:  python recop_asm.py prog.asm  (assembler v2)
--
-- ── Design decision ──────────────────────────────────────────────────────────
--   * Data path (registers, ALU, DM) is intentionally 16-bit, matching the
--     ReCOP ISA where all register values and the SIP/SOP ports are 16-bit.
--     Instructions are 32-bit; DPCR is 32-bit.  This is the agreed group design.
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.recop_types.all;
use work.various_constants.all;

-- ----------------------------------------------------------------------------
entity ReCOP_IP is
    port (
        -- ── Clock and control ────────────────────────────────────────────
        clock       : in  std_logic;
        reset       : in  std_logic;
        init        : in  std_logic;

        -- ── Coprocessor data interface ───────────────────────────────────
        sip         : in  std_logic_vector(15 downto 0);   -- Serial Input  Port
        sop         : out std_logic_vector(15 downto 0);   -- Serial Output Port
        dpcr        : out std_logic_vector(31 downto 0);   -- Data Path Control Reg
        dprr        : out std_logic_vector(1  downto 0);   -- Data Path Result  Reg

        -- ── Debug (tie to open in synthesis) ────────────────────────────
        debug_state : out std_logic_vector(2  downto 0)    -- FSM state
    );
end entity ReCOP_IP;

-- ----------------------------------------------------------------------------
architecture Structural of ReCOP_IP is

    -- ── Program counter ───────────────────────────────────────────────────────
    signal current_pc  : bit_16;
    signal pc_plus_1   : bit_16;
    signal next_pc     : bit_16;
    signal pc_write    : bit_1;
    signal pc_sel      : bit_2;

    -- ── Instruction register (32-bit word from PM) ────────────────────────────
    signal instruction : bit_32;

    -- ── Decoded instruction fields ────────────────────────────────────────────
    signal sel_z       : integer range 0 to 15;
    signal sel_x       : integer range 0 to 15;
    signal ir_operand  : bit_16;

    -- ── Register file outputs ─────────────────────────────────────────────────
    signal rx          : bit_16;
    signal rz          : bit_16;
    signal r7          : bit_16;

    -- ── Control signals (multicycle FSM → datapath) ───────────────────────────
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

    -- ── Execute outputs ───────────────────────────────────────────────────────
    signal alu_result  : bit_16;
    signal rz_max      : bit_16;
    signal dm_out      : bit_16;
    signal z_flag      : bit_1;

    -- ── Special register outputs ──────────────────────────────────────────────
    signal er          : bit_1;
    signal eot         : bit_1;
    signal svop        : bit_16;
    signal sip_r       : bit_16;

begin

    -- ═════════════════════════════════════════════════════════════════════════
    --  FETCH STAGE
    --  PC increments by 1 each cycle unless the FSM asserts pc_write=0
    --  (stall) or a jump is taken (pc_sel ≠ 00).
    -- ═════════════════════════════════════════════════════════════════════════

    pc_plus_1 <= bit_16(unsigned(current_pc) + 1);

    with pc_sel select
        next_pc <= pc_plus_1   when pc_sel_plus_one,
                   ir_operand  when pc_sel_from_operand,
                   rx          when pc_sel_from_rx,
                   x"0000"     when pc_sel_from_zero,
                   pc_plus_1   when others;

    u_pc : entity work.program_counter
        port map (
            clk        => clock,
            init       => init,
            reset      => reset,
            pc_write   => pc_write,
            next_pc    => next_pc,
            current_pc => current_pc
        );

    -- Program Memory  (512 × 32-bit ROM, Cyclone V M10K)
    -- Initialised from program.mif generated by recop_asm.py (assembler v2)
    u_pm : entity work.ReCOP_PM
        port map (
            clock => clock,
            addr  => current_pc(8 downto 0),   -- 9-bit = 512 word address space
            instr => instruction
        );


    -- ═════════════════════════════════════════════════════════════════════════
    --  DECODE STAGE
    --  Instruction fields are decoded combinationally.
    --  Register file reads are available one cycle later.
    --
    --  Instruction word layout  [AM:2][OP:6][Rz:4][Rx:4][OPERAND:16]
    --    bits 31-30 : AM       (addressing mode)
    --    bits 29-24 : OP       (function code)
    --    bits 23-20 : Rz addr  → sel_z
    --    bits 19-16 : Rx addr  → sel_x
    --    bits 15-0  : operand  → ir_operand
    -- ═════════════════════════════════════════════════════════════════════════

    sel_z      <= to_integer(unsigned(instruction(23 downto 20)));
    sel_x      <= to_integer(unsigned(instruction(19 downto 16)));
    ir_operand <= instruction(15 downto 0);

    u_rf : entity work.regfile
        port map (
            clk          => clock,
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


    -- ═════════════════════════════════════════════════════════════════════════
    --  CONTROL UNIT  –  Multicycle Moore Machine
    --  6 states: FETCH → DECODE → EXECUTE → [MEM_READ|MEM_WRITE] → WRITEBACK
    --  Opcode = instruction[31:24] = {AM[1:0], OP[5:0]}
    -- ═════════════════════════════════════════════════════════════════════════

    u_cu : entity work.multicycle_moore_machine
        port map (
            clk           => clock,
            init          => init,
            reset         => reset,
            opcode        => instruction(31 downto 24),
            rz            => rz,
            z_flag        => z_flag,
            state_bits    => debug_state,
            ld_r          => ld_r,
            rf_input_sel  => rf_input_sel,
            dprr_wren     => dprr_wren,
            dpcr_lsb_sel  => dpcr_lsb_sel,
            dpcr_wr       => dpcr_wr,
            er_wr         => er_wr,
            er_clr        => er_clr,
            eot_wr        => eot_wr,
            eot_clr       => eot_clr,
            svop_wr       => svop_wr,
            sop_wr        => sop_wr,
            irq_wr        => irq_wr,
            irq_clr       => irq_clr,
            result_wen    => result_wen,
            result        => result_sig,
            alu_operation => alu_operation,
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            clr_z_flag    => clr_z_flag,
            dm_wr_en      => dm_wr_en,
            dm_addr_sel   => dm_addr_sel,
            dm_data_sel   => dm_data_sel,
            pc_sel        => pc_sel,
            pc_write      => pc_write
        );


    -- ═════════════════════════════════════════════════════════════════════════
    --  EXECUTE STAGE
    --  Contains: ALU, MAX comparator, Data Memory (16-bit, internal)
    --  dm_addr_sel: "00"=Rz  "01"=ir_operand  "10"=Rx
    --  dm_data_sel: "00"=Rx  "01"=ir_operand  "10"=pc_in
    -- ═════════════════════════════════════════════════════════════════════════

    u_ex : entity work.execute
        port map (
            clk           => clock,
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


    -- ═════════════════════════════════════════════════════════════════════════
    --  SPECIAL REGISTERS
    --  DPCR : 32-bit data path control register (output to host)
    --  ER   : environment-ready flag
    --  EOT  : end-of-thread flag
    --  SOP  : 16-bit serial output port (written by SSOP)
    --  SVOP : 16-bit scalar vector output port (written by SSVOP)
    --  SIP_r: registered copy of SIP (read by LSIP)
    --  DPRR : 2-bit result register (bit1=IRQ, bit0=result)
    -- ═════════════════════════════════════════════════════════════════════════

    u_regs : entity work.registers
        port map (
            clk          => clock,
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

end architecture Structural;
