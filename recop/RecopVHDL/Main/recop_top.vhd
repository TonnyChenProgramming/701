-- =============================================================================
-- COMPSYS 701 – GP1 / GP2 ReCOP Top-Level
--
-- ─── External Interface Overview ────────────────────────────────────────────
--
-- DE1-SoC Peripherals
--   CLOCK_50       : 50 MHz system clock
--   KEY[3:0]       : Push buttons (active-low)
--                      KEY[0] → global reset
--                      KEY[1] → initialise / run  (starts PC from 0)
--                      KEY[2] → cycle HEX3-0 display mode
--                      KEY[3] → reserved (GP2 / single-step debug)
--   SW[9:0]        : Slide switches → SIP[9:0] (bits 15:10 zero-extended)
--   LEDR[9:0]      : Status LEDs (see mapping below)
--   HEX5-0         : 7-segment displays
--                      HEX5-4 always show PC[7:0]
--                      HEX3-0 show mode-selected 16-bit value (see below)
--
-- NoC Interface  (GP1: driven to top-level pins for observability;
--                 GP2: connect to TDMA-MIN port logic of ReCOP NoC node)
--   dpcr_out       : 32-bit DPCR value; changes on datacall instruction
--   noc_dpcr_valid : 1-cycle strobe; pulses when DPCR is written (datacall)
--   noc_irq_in     : NoC → ReCOP interrupt; high when ASP result is ready
--                    GP1: tie to '0'; GP2: connect to NoC IRQ output
--
-- Observation ports (testbench / oscilloscope)
--   dprr           : 2-bit Data-Processing Result Register
--   sop            : 16-bit Serial Output Port
--
-- ─── LEDR Bit-Field Map ─────────────────────────────────────────────────────
--   LEDR[9]     : Z flag          – last ALU result was zero
--   LEDR[8]     : EOT flag        – end-of-transfer (serial protocol)
--   LEDR[7]     : ER  flag        – external register valid
--   LEDR[6:5]   : DPRR[1:0]      – data-processing result / IRQ status
--   LEDR[4:3]   : display_mode   – which value HEX3-0 currently shows
--   LEDR[2:0]   : FSM state bits  000=FETCH  001=DECODE  010=EXECUTE
--                                 011=MEMREAD 100=MEMWRITE 101=WRITEBACK
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;

entity recop_top is
    port(
        CLOCK_50       : in  bit_1;
        KEY            : in  std_logic_vector(3 downto 0);
        SW             : in  std_logic_vector(9 downto 0);

        LEDR           : out std_logic_vector(9 downto 0);

        HEX0           : out std_logic_vector(6 downto 0);
        HEX1           : out std_logic_vector(6 downto 0);
        HEX2           : out std_logic_vector(6 downto 0);
        HEX3           : out std_logic_vector(6 downto 0);
        HEX4           : out std_logic_vector(6 downto 0);
        HEX5           : out std_logic_vector(6 downto 0);

        -- NoC Interface
        -- GP1 : outputs driven to top-level pins for scope/LA probing
        dpcr_out       : out bit_32;   -- DPCR register value → NoC
        noc_dpcr_valid : out bit_1;    -- 1-cycle strobe when DPCR updated
        noc_irq_in     : in  bit_1;    -- NoC result-ready IRQ → DPRR update
                                       -- GP1: tie externally to '0'

        -- Observation / Testbench Ports
        dprr           : out bit_2;    -- Data-Processing Result Register
        sop            : out bit_16    -- Serial Output Port
    );
end entity recop_top;

architecture beh of recop_top is

    -- =========================================================================
    -- BOARD ADAPTATION SIGNALS
    -- =========================================================================
    signal clk   : bit_1;    -- internal clock (CLOCK_50 routed)
    signal reset : bit_1;    -- active-high; inverted from KEY[0]
    signal init  : bit_1;    -- active-high; inverted from KEY[1]
    signal sip   : bit_16;   -- Serial Input Port: SW[9:0] zero-extended to 16 bits

    -- =========================================================================
    -- DISPLAY CONTROL SIGNALS
    -- =========================================================================
    signal key2_prev    : bit_1 := '1';   -- previous KEY[2] sample for edge detect
    signal display_mode : bit_2 := "00";  -- 2-bit counter cycled by KEY[2]
    signal hex_data     : bit_16;         -- 16-bit value routed to HEX3-0

    -- =========================================================================
    -- FETCH STAGE SIGNALS
    -- =========================================================================
    signal current_pc : bit_16;   -- current Program Counter value
    signal pc_write   : bit_1;    -- PC write-enable (from CU)
    signal pc_plus_1  : bit_16;   -- combinational PC+1
    signal next_pc    : bit_16;   -- next PC value selected by pc_sel MUX
    signal pm_out     : bit_32;   -- raw Instruction Memory (ROM) output

    -- =========================================================================
    -- INSTRUCTION REGISTER AND DECODED FIELDS
    -- =========================================================================
    -- IR latches pm_out during S_FETCH and holds the value stable for all
    -- subsequent stages (DECODE, EXECUTE, MEM, WRITEBACK).
    -- This prevents the opcode from changing when the PC advances at S_EXECUTE.
    signal ir          : bit_32 := x"34000000";  -- NOOP opcode on reset

    -- Decoded fields (always sourced from IR, never from raw pm_out)
    signal sel_z       : integer range 0 to 15;  -- destination register index
    signal sel_x       : integer range 0 to 15;  -- source register index
    signal ir_operand  : bit_16;                 -- 16-bit literal / address field

    -- =========================================================================
    -- REGISTER FILE OUTPUTS  (Decode/Writeback block)
    -- =========================================================================
    signal rx    : bit_16;   -- general-purpose register Rx (source)
    signal rz    : bit_16;   -- general-purpose register Rz (destination)
    signal r7    : bit_16;   -- R7 (used by DPCR upper-half construction)

    -- =========================================================================
    -- EXECUTE BLOCK OUTPUTS
    -- =========================================================================
    signal alu_result : bit_16;   -- ALU computation result
    signal rz_max     : bit_16;   -- Rz from MAX comparator path
    signal dm_out     : bit_16;   -- Data Memory read data

    -- =========================================================================
    -- SPECIAL REGISTER CONTENTS
    -- =========================================================================
    signal dpcr_sig  : bit_32;   -- Data-Processing Call Register  → NoC
    signal dprr_sig  : bit_2;    -- Data-Processing Result Register ← NoC (GP2)
    signal sop_sig   : bit_16;   -- Serial Output Port value
    signal svop      : bit_16;   -- Stored Value Output Port
    signal sip_r     : bit_16;   -- Registered (held) SIP snapshot
    signal er        : bit_1;    -- External Register flag
    signal eot       : bit_1;    -- End-Of-Transfer flag

    -- =========================================================================
    -- FSM STATE OBSERVABLE
    -- =========================================================================
    signal current_state_bits : bit_3;   -- 3-bit encoding of active FSM state
    signal z_flag             : bit_1;   -- Zero flag from ALU

    -- Register File controls
    signal ld_r         : bit_1;
    signal rf_input_sel : bit_3;
    signal dprr_wren    : bit_1;

    -- Special Register controls
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
    signal result_sig   : bit_1;   -- value written to DPRR(0) when result_wen fires

    -- ALU controls
    signal alu_operation : bit_3;
    signal alu_op1_sel   : bit_2;
    signal alu_op2_sel   : bit_1;
    signal clr_z_flag    : bit_1;

    -- Data Memory controls
    signal dm_wr_en    : bit_1;
    signal dm_addr_sel : bit_2;
    signal dm_data_sel : bit_2;

    -- Program Counter controls
    signal pc_sel : bit_2;

    -- =========================================================================
    -- 7-SEGMENT DECODER FUNCTION
    -- Returns a 7-bit active-low segment pattern for one hexadecimal nibble.
    -- Bit order: [6]=g  [5]=f  [4]=e  [3]=d  [2]=c  [1]=b  [0]=a
    -- =========================================================================
    function hex_to_7seg(nibble : std_logic_vector(3 downto 0))
        return std_logic_vector is
    begin
        case nibble is
            when "0000" => return "1000000"; -- 0
            when "0001" => return "1111001"; -- 1
            when "0010" => return "0100100"; -- 2
            when "0011" => return "0110000"; -- 3
            when "0100" => return "0011001"; -- 4
            when "0101" => return "0010010"; -- 5
            when "0110" => return "0000010"; -- 6
            when "0111" => return "1111000"; -- 7
            when "1000" => return "0000000"; -- 8
            when "1001" => return "0010000"; -- 9
            when "1010" => return "0001000"; -- A
            when "1011" => return "0000011"; -- b
            when "1100" => return "1000110"; -- C
            when "1101" => return "0100001"; -- d
            when "1110" => return "0000110"; -- E
            when "1111" => return "0001110"; -- F
            when others => return "1111111"; -- blank (all segments off)
        end case;
    end function;

begin

    -- =========================================================================
    -- BOARD PERIPHERAL ADAPTATION
    --     Convert DE1-SoC active-low buttons to internal active-high signals.
    -- =========================================================================
    clk   <= CLOCK_50;
    reset <= not KEY(0);    -- KEY[0]: active-low push-button → active-high reset
    init  <= not KEY(1);    -- KEY[1]: active-low push-button → active-high init

    -- Serial Input Port: SW[9:0] zero-extended to 16 bits.
    -- Lower 10 switches drive SIP[9:0]; SIP[15:10] are permanently '0'.
    sip <= "000000" & SW;

    -- KEY[3] is reserved for GP2 / single-step debug; no internal connection here.

    -- =========================================================================
    -- DISPLAY MODE REGISTER
    --     KEY[2] (falling edge = button press) cycles HEX3-0 through four modes.
    --     Modes wrap: "11" + 1 = "00".
    --     LEDR[4:3] mirrors display_mode so the operator knows the active mode.
    -- =========================================================================
    p_display_mode : process(clk, reset)
    begin
        if reset = '1' then
            key2_prev    <= '1';
            display_mode <= "00";
        elsif rising_edge(clk) then
            key2_prev <= KEY(2);
            -- Falling edge on KEY[2] = button pressed (active-low)
            if key2_prev = '1' and KEY(2) = '0' then
                display_mode <= bit_2(unsigned(display_mode) + 1);
            end if;
        end if;
    end process;

    -- =========================================================================
    -- LED ASSIGNMENTS
    -- =========================================================================
    LEDR(9)          <= z_flag;           -- Zero flag (last ALU result = 0)
    LEDR(8)          <= eot;              -- End-Of-Transfer flag
    LEDR(7)          <= er;               -- External Register flag
    LEDR(6 downto 5) <= dprr_sig;         -- DPRR[1:0] (IRQ / result status)
    LEDR(4 downto 3) <= display_mode;     -- Active HEX3-0 display mode
    LEDR(2 downto 0) <= current_state_bits; -- FSM state (000..101)

    -- =========================================================================
    -- 7-SEGMENT DISPLAY ASSIGNMENTS
    --     HEX5-4 : PC[7:0] — always visible for instruction-step debugging.
    --              PC bits [15:8] are omitted; the 512-word PM only uses [8:0].
    --     HEX3-0 : 16-bit value selected by display_mode.
    -- =========================================================================
    with display_mode select
        hex_data <= sop_sig               when "00",   -- SOP  (output port value)
                    svop                  when "01",   -- SVOP (stored value output port)
                    sip                   when "10",   -- SIP  (live switch reading)
                    dpcr_sig(15 downto 0) when others; -- DPCR LSB (NoC call debug)

    HEX0 <= hex_to_7seg(hex_data(3  downto  0));
    HEX1 <= hex_to_7seg(hex_data(7  downto  4));
    HEX2 <= hex_to_7seg(hex_data(11 downto  8));
    HEX3 <= hex_to_7seg(hex_data(15 downto 12));
    HEX4 <= hex_to_7seg(current_pc(3 downto  0));   -- PC nibble 0
    HEX5 <= hex_to_7seg(current_pc(7 downto  4));   -- PC nibble 1

    -- =========================================================================
    -- NoC INTERCONNECTION
    -- ─── GP1 (current) ───────────────────────────────────────────────────────
    --   dpcr_out is driven from the live DPCR register value.  noc_dpcr_valid
    --   pulses for one clock each time the CU asserts dpcr_wr (datacall /
    --   datacall2 instruction).  noc_irq_in is expected to be tied to '0'
    --   at board level; it feeds result_wen on the DPRR register so the
    --   software can distinguish GP1 (always 0) from GP2 (live IRQ).
    --
    -- ─── GP2 modifications required ─────────────────────────────────────────
    --   1. Connect dpcr_out  and noc_dpcr_valid to the TDMA-MIN send port of
    --      the ReCOP NoC node (packet header = ReCOP node address,
    --      payload = dpcr_out).
    --   2. Connect noc_irq_in to the TDMA-MIN receive IRQ output of the ReCOP
    --      node (raised when the ASP pipeline deposits a result packet).
    --   3. Replace the result_sig constant ('1') with the actual DPRR data
    --      carried in the incoming NoC packet if the protocol requires it.
    --   4. If bidirectional DPRR is needed, change the 'dprr' port from OUT
    --      to INOUT, or add a separate noc_dprr_in input and MUX it in.
    -- =========================================================================

    -- DPCR register value forwarded to NoC (or top-level pin in GP1)
    dpcr_out <= dpcr_sig;

    -- One-cycle valid strobe: registered version of dpcr_wr.
    -- The register removes any combinational glitch on dpcr_wr and aligns the
    -- strobe to the clock edge that follows the datacall instruction's execute
    -- stage — matching the TDMA-MIN send protocol.
    p_noc_valid : process(clk, reset)
    begin
        if reset = '1' then
            noc_dpcr_valid <= '0';
        elsif rising_edge(clk) then
            noc_dpcr_valid <= dpcr_wr;   -- dpcr_wr is '1' exactly during S_EXECUTE
        end if;                           -- of a datacall / datacall2 instruction
    end process;

    -- When noc_irq_in fires, write '1' into DPRR(0) to signal result-ready.
    -- The ReCOP program polls DPRR and branches on this flag.
    result_sig <= '1';   -- GP2: replace with packet payload bit if needed

    -- Observation ports
    sop  <= sop_sig;
    dprr <= dprr_sig;

    -- =========================================================================
    -- CONTROL UNIT (multicycle_moore_machine)
    -- ─── Status inputs ───────────────────────────────────────────────────────
    --   opcode   : IR[31:24] from the *latched* instruction register.
    --              Using pm_out here would be wrong: the ROM output changes
    --              one cycle after the PC updates (end of S_FETCH/S_EXECUTE).
    --   rz       : Used by the PRESENT instruction (branch-if-Rz=0).
    --   z_flag   : Used by the SZ instruction (branch-if-zero-flag).
    -- ─── All datapath control outputs ────────────────────────────────────────
    --   See Section 9 signal declarations for full per-signal documentation.
    -- =========================================================================
    u_cu : entity work.multicycle_moore_machine
        port map(
            clk           => clk,
            init          => init,
            reset         => reset,

            -- Status inputs to CU
            opcode        => ir(31 downto 24),   -- latched IR, NOT raw pm_out
            rz            => rz,                 -- Rz for PRESENT test
            z_flag        => z_flag,             -- Z flag for SZ branch

            -- FSM state observable (drives LEDR[2:0])
            state_bits    => current_state_bits,

            -- CU → Register File
            ld_r          => ld_r,
            rf_input_sel  => rf_input_sel,
            dprr_wren     => dprr_wren,

            -- CU → Special Registers
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
            -- result_wen from CU is always '0' in GP1 (no CU-initiated DPRR write).
            -- noc_irq_in is wired directly to registers.result_wen instead.
            -- GP2: if the CU also needs to assert result_wen, OR it with noc_irq_in.
            result_wen    => open,
            result        => open,

            -- CU → ALU
            alu_operation => alu_operation,
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            clr_z_flag    => clr_z_flag,

            -- CU → Data Memory
            dm_wr_en      => dm_wr_en,
            dm_addr_sel   => dm_addr_sel,
            dm_data_sel   => dm_data_sel,

            -- CU → Program Counter
            pc_sel        => pc_sel,
            pc_write      => pc_write
        );

    -- =========================================================================
    -- FETCH BLOCK
    --     Program Counter and Instruction Memory (ROM IP, 512 × 32-bit)
    -- =========================================================================

    -- Combinational PC+1 adder (registered inside program_counter entity)
    pc_plus_1 <= bit_16(unsigned(current_pc) + 1);

    -- Next-PC MUX: four sources, selected by CU signal pc_sel
    --   pc_sel_plus_one     (00) : sequential advance, normal flow
    --   pc_sel_from_operand (01) : JMP or branch to ir_operand target
    --   pc_sel_from_rx      (10) : JMP Rx (register-indirect jump)
    --   pc_sel_from_zero    (11) : reset / init (go to address 0)
    with pc_sel select
        next_pc <= pc_plus_1   when pc_sel_plus_one,
                   ir_operand  when pc_sel_from_operand,
                   rx          when pc_sel_from_rx,
                   x"0000"     when pc_sel_from_zero,
                   pc_plus_1   when others;

    u_pc : entity work.program_counter
        port map(
            clk        => clk,
            init       => init,
            reset      => reset,
            pc_write   => pc_write,   -- asserted by CU during S_EXECUTE / S_MEM*
            next_pc    => next_pc,
            current_pc => current_pc
        );

    -- Instruction Memory: 512 × 32-bit altsyncram ROM
    -- Only the lower 9 bits of the 16-bit PC address the 512-word ROM.
    -- Upper bits PC[15:9] are unused in GP1; reserved for GP2 larger programs.
    u_im_ip : entity work.instruction_memory_ip
        port map(
            address => current_pc(8 downto 0),
            clock   => clk,
            q       => pm_out
        );

    -- =========================================================================
    -- INSTRUCTION REGISTER
    --
    --     Captures the ROM output (pm_out) on the rising edge that ENDS S_FETCH
    --     (current_state_bits = "000").  The IR value then remains stable for
    --     the next three states (DECODE, EXECUTE/MEM, WRITEBACK) regardless of
    --     what pm_out does after the PC increments.
    --
    --     Without this register, advancing the PC during S_EXECUTE would change
    --     pm_out mid-instruction, corrupting the opcode seen by the CU.
    --
    --     Reset / init value = 0x34000000 = AM=00 opcode=110100 → NOOP
    -- =========================================================================
    p_ir : process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' or init = '1' then
                ir <= x"34000000";               -- NOOP while resetting
            elsif current_state_bits = "000" then -- latch only during S_FETCH
                ir <= pm_out;
            end if;
            -- During DECODE/EXECUTE/MEM/WRITEBACK: ir holds its value (no update)
        end if;
    end process;

    -- Combinational instruction field extraction (from stable IR)
    sel_z      <= to_integer(unsigned(ir(23 downto 20)));  -- Rz index [23:20]
    sel_x      <= to_integer(unsigned(ir(19 downto 16)));  -- Rx index [19:16]
    ir_operand <= ir(15 downto 0);                         -- 16-bit operand [15:0]

    -- =========================================================================
    -- DECODE + WRITEBACK BLOCK  –  Register File
    --
    --     The same physical register file entity serves both the DECODE stage
    --     (read ports: rx, rz, r7 become valid during S_DECODE) and the
    --     WRITEBACK stage (write port: Rz ← selected source when ld_r = '1').
    -- =========================================================================
    u_regfile : entity work.regfile
        port map(
            clk          => clk,
            init         => init,

            -- CU write-back controls (active during S_WRITEBACK)
            ld_r         => ld_r,
            rf_input_sel => rf_input_sel,

            -- Register index selectors from IR
            sel_z        => sel_z,
            sel_x        => sel_x,

            -- Write-data sources (MUXed by rf_input_sel inside regfile)
            ir_operand   => ir_operand,   -- immediate literal
            dm_out       => dm_out,       -- Data Memory read result
            aluout       => alu_result,   -- ALU computation result
            sip_hold     => sip_r,        -- latched SIP snapshot (LSIP)

            -- Register read outputs (available from S_DECODE onwards)
            rx           => rx,
            rz           => rz,
            rz_max       => rz_max,       -- Rz from MAX comparator path
            r7           => r7,           -- R7 for DPCR upper-half construction

            -- DPRR paths (GP2: NoC result can be written via regfile path)
            er_temp      => '0',          -- unused in GP1
            dprr_res     => '0',          -- unused in GP1
            dprr_res_reg => '0',          -- unused in GP1
            dprr_wren    => dprr_wren
        );

    -- =========================================================================
    -- EXECUTE BLOCK  –  ALU + Data Memory + MUXes
    -- =========================================================================
    u_execute : entity work.execute
        port map(
            clk           => clk,
            init          => init,
            reset         => reset,

            -- Operand inputs (from register file, after S_DECODE)
            rx            => rx,
            rz            => rz,
            ir_operand    => ir_operand,
            pc_in         => current_pc,

            -- CU ALU control signals
            alu_operation => alu_operation,
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            clr_z_flag    => clr_z_flag,

            -- CU Data Memory control signals
            dm_wr_en      => dm_wr_en,
            dm_addr_sel   => dm_addr_sel,
            dm_data_sel   => dm_data_sel,

            -- Outputs
            alu_result    => alu_result,
            rz_max        => rz_max,
            dm_out        => dm_out,
            z_flag        => z_flag        -- fed back to CU for SZ branch decision
        );

    -- =========================================================================
    -- SPECIAL REGISTERS BLOCK
    --
    --     Holds all ReCOP special-purpose registers:
    --       DPCR  – Data-Processing Call Register    (32-bit, → NoC)
    --       DPRR  – Data-Processing Result Register  (2-bit,  ← NoC in GP2)
    --       ER    – External Register flag            (1-bit)
    --       EOT   – End-Of-Transfer flag              (1-bit)
    --       SIP   – Serial Input Port                 (16-bit, from SW)
    --       SOP   – Serial Output Port                (16-bit, → HEX / LEDR)
    --       SVOP  – Stored Value Output Port          (16-bit)
    -- =========================================================================
    u_registers : entity work.registers
        port map(
            clk          => clk,
            reset        => reset,

            -- DPCR: written by datacall / datacall2 instructions
            -- dpcr_lsb_sel chooses whether Rx or ir_operand fills DPCR[15:0]
            -- r7 always fills DPCR[31:16]
            dpcr         => dpcr_sig,
            r7           => r7,
            rx           => rx,
            ir_operand   => ir_operand,
            dpcr_lsb_sel => dpcr_lsb_sel,
            dpcr_wr      => dpcr_wr,

            -- ER flag
            er           => er,
            er_wr        => er_wr,
            er_clr       => er_clr,

            -- EOT flag
            eot          => eot,
            eot_wr       => eot_wr,
            eot_clr      => eot_clr,

            -- SVOP register (written by svop_wr; shown on HEX3-0 in mode "01")
            svop         => svop,
            svop_wr      => svop_wr,

            -- SIP: live switch value passed in; sip_r is the registered snapshot
            -- (LSIP instruction reads sip_r into a general-purpose register)
            sip_r        => sip_r,
            sip          => sip,

            -- SOP: written by SSOP instruction; shown on HEX3-0 in mode "00"
            sop          => sop_sig,
            sop_wr       => sop_wr,

            -- DPRR: 2-bit register
            --   DPRR[1] : IRQ pending (set by irq_wr, cleared by irq_clr)
            --   DPRR[0] : result ready (set by result_wen when noc_irq_in fires)
            --
            -- GP1: noc_irq_in is tied to '0' externally → result_wen = '0'
            --       DPRR remains "00" throughout GP1 testing.
            -- GP2: noc_irq_in is driven by the TDMA-MIN receive IRQ of the
            --       ReCOP node.  When an ASP completes, the NoC raises this line,
            --       DPRR[0] becomes '1', and the ReCOP program (polling DPRR)
            --       detects the event and issues a read to retrieve the result.
            dprr         => dprr_sig,
            irq_wr       => irq_wr,
            irq_clr      => irq_clr,
            result_wen   => noc_irq_in,   -- GP2: NoC IRQ sets DPRR[0]
            result       => result_sig    -- '1': mark result as ready
        );

end architecture beh;