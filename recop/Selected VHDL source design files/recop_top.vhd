--fetch includes program counter, instruction memory
--decode includes control unit, register file, and sign extend
-- execute include alu, memory, write back
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;

-- =============================================================================
-- recop_top.vhd
-- ReCOP processor top-level with full DE1-SoC peripheral interface
--
-- GP1 (standalone demo):
--   - CLOCK_50 → clk
--   - KEY[0]   → reset (active HIGH internally, button is active LOW)
--   - KEY[1]   → init  (active HIGH internally, button is active LOW)
--   - SW[9:0]  → SIP[9:0] (test input data, upper 6 bits tied to 0)
--   - HEX3..0  → SOP[15:0] displayed as 4 hex digits
--   - HEX5..4  → PC[7:0]   displayed as 2 hex digits
--   - LEDR[9]  → Z flag
--   - LEDR[8]  → EOT flag
--   - LEDR[7]  → ER flag
--   - LEDR[6:5]→ DPRR[1:0]
--   - LEDR[4:2]→ FSM state [2:0]
--   - LEDR[1:0]→ reserved ('0')
--
-- GP2 (NoC integration):
--   - Replace SW-driven SIP with TDMA-MIN Network Interface SIP signal
--   - dprr / dpcr / sop ports connect to TDMA-MIN NI input FIFO
-- =============================================================================

entity recop_top is
    port(
<<<<<<< Updated upstream
        clk : in bit_1;
        init : in bit_1;
        reset : in bit_1;
        sip : in bit_16;

        dprr : out bit_2;
        dpcr : out bit_32;
        sop : out bit_16
=======
        -- System
        CLOCK_50  : in  bit_1;                           -- 50 MHz on-board oscillator

        -- DE1-SoC input peripherals
        KEY       : in  std_logic_vector(3 downto 0);    -- Push buttons (active LOW)
                                                          --   KEY[0] → reset
                                                          --   KEY[1] → init
                                                          --   KEY[2], KEY[3] → reserved (GP2 use)
        SW        : in  std_logic_vector(9 downto 0);    -- Slide switches
                                                          --   SW[9:0] → SIP[9:0] (demo input)

        -- DE1-SoC output peripherals
        LEDR      : out std_logic_vector(9 downto 0);    -- Red LEDs (see mapping above)
        HEX0      : out std_logic_vector(6 downto 0);    -- SOP[3:0]   (active-low segments)
        HEX1      : out std_logic_vector(6 downto 0);    -- SOP[7:4]
        HEX2      : out std_logic_vector(6 downto 0);    -- SOP[11:8]
        HEX3      : out std_logic_vector(6 downto 0);    -- SOP[15:12]
        HEX4      : out std_logic_vector(6 downto 0);    -- PC[3:0]
        HEX5      : out std_logic_vector(6 downto 0);    -- PC[7:4]

        -- NoC / TDMA-MIN interface (planned for GP2)
        -- NOTE: SIP (serial input) is driven from SW in GP1 demo.
        --       For GP2, add:  noc_sip : in bit_16  and route it to internal sip.
        dprr      : out bit_2;                            -- DataCall Result Ready Reg → NI
        dpcr      : out bit_32;                           -- DataCall Param & Control  → NI
        sop       : out bit_16                            -- Serial Output Port        → NI
>>>>>>> Stashed changes
    );
end entity recop_top;

architecture beh of recop_top is
<<<<<<< Updated upstream
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
=======

    -- Board to internal signal mapping
    signal clk   : bit_1;
    signal reset : bit_1;
    signal init  : bit_1;
    signal sip   : bit_16;

    -- Internal buffer signals
    -- Needed so we can both drive the output ports AND read them for display
    -- (VHDL-1993 does not allow reading from output ports in the architecture)
    signal sop_sig   : bit_16;
    signal dprr_sig  : bit_2;
    signal dpcr_sig  : bit_32;

    -- Fetch stage
    signal current_pc  : bit_16;
    signal pc_write    : bit_1;
    signal pc_plus_1   : bit_16;
    signal next_pc     : bit_16;
    signal instruction : bit_32;

    -- Decode / Writeback stage
    signal sel_z      : integer range 0 to 15;
    signal sel_x      : integer range 0 to 15;
    signal rx         : bit_16;
    signal rz         : bit_16;
    signal r7         : bit_16;
    signal ir_operand : bit_16;

    -- CU to Datapath control signals
    signal ld_r          : bit_1;   -- Register file write enable
    signal rf_input_sel  : bit_3;   -- Selects writeback data source for RF
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
    signal alu_operation : bit_3;   -- ALU function select
    signal alu_op1_sel   : bit_2;   -- MUX_OP1 select (inside ALU.vhd)
    signal alu_op2_sel   : bit_1;   -- MUX_OP2 select (inside ALU.vhd)
    signal clr_z_flag    : bit_1;
    signal dm_wr_en      : bit_1;   -- Data memory write enable
    signal dm_addr_sel   : bit_2;   -- Data memory address MUX select
    signal dm_data_sel   : bit_2;   -- Data memory write-data MUX select
    signal pc_sel        : bit_2;   -- Next-PC MUX select

    -- Datapath → CU status signals
    signal z_flag             : bit_1;
    signal current_state_bits : bit_3;  -- FSM state, routed to LEDR for debug

    -- Execute stage outputs
    signal alu_result : bit_16;
    signal rz_max     : bit_16;
    signal dm_out     : bit_16;

    -- Special registers
    signal er    : bit_1;
    signal eot   : bit_1;
    signal svop  : bit_16;
    signal sip_r : bit_16;


    -- Seven-segment decoder (active-low outputs, segments: gfedcba)
    -- '0' = segment ON, '1' = segment OFF  (DE1-SoC convention)
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


    -- BOARD SIGNAL ADAPTATION
    clk   <= CLOCK_50;
    reset <= not KEY(0);    -- KEY[0] active-low button → active-high internal reset
    init  <= not KEY(1);    -- KEY[1] active-low button → active-high internal init

    -- SIP: SW[9:0] drives lower 10 bits; upper 6 bits tied to '0'
    -- *** GP2 change: replace this line with:  sip <= noc_sip;
    sip   <= "000000" & SW;


    -- OUTPUT PORT ASSIGNMENTS (internal buffer → entity output port)
    sop  <= sop_sig;
    dprr <= dprr_sig;
    dpcr <= dpcr_sig;

    -- DE1-SoC DISPLAY LOGIC
    -- Red LED mapping
    LEDR(9)          <= z_flag;            -- Z flag (set by ALU result = 0)
    LEDR(8)          <= eot;               -- End-Of-Transfer flag
    LEDR(7)          <= er;                -- External Ready flag
    LEDR(6 downto 5) <= dprr_sig;          -- DataCall Result Ready [1:0]
    LEDR(4 downto 2) <= current_state_bits;-- FSM state [2:0] for debug
    LEDR(1 downto 0) <= "00";             -- reserved

    -- HEX display: SOP[15:0] on HEX3..HEX0 (4 hex digits), PC[7:0] on HEX5..HEX4
    HEX0 <= hex_to_7seg(sop_sig(3  downto 0));
    HEX1 <= hex_to_7seg(sop_sig(7  downto 4));
    HEX2 <= hex_to_7seg(sop_sig(11 downto 8));
    HEX3 <= hex_to_7seg(sop_sig(15 downto 12));
    HEX4 <= hex_to_7seg(current_pc(3  downto 0));
    HEX5 <= hex_to_7seg(current_pc(7  downto 4));

    -- CONTROL UNIT  –  Multicycle Moore FSM
    -- Inputs:  clk, init, reset  (system)
    --          opcode (from IR[31:24]), rz (for PRESENT), z_flag (for SZ)
    -- Outputs: all datapath control signals listed below
    u_cu : entity work.multicycle_moore_machine
        port map(
            -- External control inputs
            clk           => clk,
            init          => init,
            reset         => reset,
            -- Status signals from datapath
            opcode        => instruction(31 downto 24),
            rz            => rz,
            z_flag        => z_flag,
            -- Debug output
            state_bits    => current_state_bits,
            -- RF control
            ld_r          => ld_r,
            rf_input_sel  => rf_input_sel,
            -- Special register control
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
            -- ALU control
            alu_operation => alu_operation,
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            clr_z_flag    => clr_z_flag,
            -- Data memory control
            dm_wr_en      => dm_wr_en,
            dm_addr_sel   => dm_addr_sel,
            dm_data_sel   => dm_data_sel,
            -- PC control
            pc_sel        => pc_sel,
            pc_write      => pc_write
        );
		  

    -- FETCH STAGE  –  Program Counter + Instruction Memory
    -- PC+1 computed combinationally; pc_sel MUX chooses next PC source
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
            pc_write   => pc_write,
            next_pc    => next_pc,
>>>>>>> Stashed changes
            current_pc => current_pc
       );

<<<<<<< Updated upstream
       u_im_ip : entity work.instructin_memory_ip
       port map (
            address => current_pc(10 downto 0),
            clock => clk,
            q => instruction
       );
       
       u_regfile : entity work.regfile
        port map (
=======
    u_im_ip : entity work.instruction_memory_ip
        port map(
            address => current_pc(8 downto 0),
            clock   => clk,
            q       => instruction
        );


    -- DECODE & WRITEBACK STAGE  –  Register File
    -- Rz/Rx read combinationally; writeback occurs when ld_r='1'
    -- rf_input_sel (MUX_Z, inside regfile.vhd) chooses what gets written back
    sel_z      <= to_integer(unsigned(instruction(23 downto 20)));
    sel_x      <= to_integer(unsigned(instruction(19 downto 16)));
    ir_operand <= instruction(15 downto 0);

    u_regfile : entity work.regfile
        port map(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
=======


    -- EXECUTE STAGE  –  ALU + Data Memory + MUXes + MAX comparator
    -- MUX_OP1 and MUX_OP2 are inside ALU.vhd
    -- Results feed back to decode stage for RF writeback
    u_execute : entity work.execute
        port map(
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


    -- SPECIAL REGISTERS  –  DPCR, ER, EOT, SIP, SOP, DPRR, SVOP
    -- All written using CU control signals; ER/EOT readable back via LEDR
    u_registers : entity work.registers
        port map(
            clk          => clk,
            reset        => reset,
            dpcr         => dpcr_sig,       -- buffered → also drives dpcr output port
            r7           => r7,
            rx           => rx,
            ir_operand   => ir_operand,
            dpcr_lsb_sel => dpcr_lsb_sel,
            dpcr_wr      => dpcr_wr,
            er           => er,             -- ER flag → LEDR[7]
            er_wr        => er_wr,
            er_clr       => er_clr,
            eot          => eot,            -- EOT flag → LEDR[8]
            eot_wr       => eot_wr,
            eot_clr      => eot_clr,
            svop         => svop,
            svop_wr      => svop_wr,
            sip_r        => sip_r,
            sip          => sip,            -- driven from SW (demo) / NoC NI (GP2)
            sop          => sop_sig,        -- buffered → HEX3..0 + sop output port
            sop_wr       => sop_wr,
            dprr         => dprr_sig,       -- buffered → LEDR[6:5] + dprr output port
            irq_wr       => irq_wr,
            irq_clr      => irq_clr,
            result_wen   => result_wen,
            result       => result_sig
>>>>>>> Stashed changes
        );

end architecture beh;