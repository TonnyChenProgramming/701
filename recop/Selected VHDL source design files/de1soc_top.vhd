-- ============================================================================
-- de1soc_top.vhd  –  DE1-SoC Board Top-Level for ReCOP
--
-- Board:   DE1-SoC (Terasic)
-- Device:  Intel Cyclone V  5CSEMA5F31C6
-- Clock:   50 MHz (CLOCK_50)
--
-- I/O mapping:
--   KEY[0]    active-low push-button  → reset  (active-high to ReCOP)
--   KEY[1]    active-low push-button  → init   (active-high to ReCOP)
--   SW[9:0]   10 slide-switches       → sip[9:0]  (upper 6 bits = 0)
--
--   LEDR[9:0] red LEDs                ← sop[9:0]
--
--   HEX1, HEX0  two 7-segment digits  ← sop[7:0]  (hex display)
--   HEX3, HEX2  two 7-segment digits  ← dpcr[7:0] lower byte
--   HEX4        one 7-segment digit   ← dprr  (result/IRQ flags)
--   HEX5        one 7-segment digit   ← debug_state FSM (0-5)
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.recop_types.all;

entity de1soc_top is
    port (
        CLOCK_50 : in  std_logic;

        KEY  : in  std_logic_vector(3 downto 0);  -- active-low
        SW   : in  std_logic_vector(9 downto 0);

        LEDR : out std_logic_vector(9 downto 0);

        HEX0 : out std_logic_vector(6 downto 0);  -- sop[3:0]
        HEX1 : out std_logic_vector(6 downto 0);  -- sop[7:4]
        HEX2 : out std_logic_vector(6 downto 0);  -- dpcr[3:0]
        HEX3 : out std_logic_vector(6 downto 0);  -- dpcr[7:4]
        HEX4 : out std_logic_vector(6 downto 0);  -- dprr
        HEX5 : out std_logic_vector(6 downto 0)   -- FSM state
    );
end entity de1soc_top;

architecture Structural of de1soc_top is

    -- Internal ReCOP interface signals
    signal sop_s         : bit_16;
    signal dpcr_s        : bit_32;
    signal dprr_s        : bit_2;
    signal debug_state_s : bit_3;

    -- 7-segment decoder: hex digit (3:0) → segments (6:0), active-low
    -- Segment order: [6]=g [5]=f [4]=e [3]=d [2]=c [1]=b [0]=a
    function hex_to_seg(digit : std_logic_vector(3 downto 0))
        return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case digit is
            when "0000" => seg := "1000000"; -- 0
            when "0001" => seg := "1111001"; -- 1
            when "0010" => seg := "0100100"; -- 2
            when "0011" => seg := "0110000"; -- 3
            when "0100" => seg := "0011001"; -- 4
            when "0101" => seg := "0010010"; -- 5
            when "0110" => seg := "0000010"; -- 6
            when "0111" => seg := "1111000"; -- 7
            when "1000" => seg := "0000000"; -- 8
            when "1001" => seg := "0010000"; -- 9
            when "1010" => seg := "0001000"; -- A
            when "1011" => seg := "0000011"; -- b
            when "1100" => seg := "1000110"; -- C
            when "1101" => seg := "0100001"; -- d
            when "1110" => seg := "0000110"; -- E
            when others => seg := "0001110"; -- F
        end case;
        return seg;
    end function;

begin

    -- ── ReCOP Core ──────────────────────────────────────────────────────────
    u_recop : entity work.recop_top
        port map (
            clk         => CLOCK_50,
            reset       => not KEY(0),      -- KEY active-low  → reset active-high
            init        => not KEY(1),      -- KEY active-low  → init  active-high
            sip         => "000000" & SW,   -- 10 switches into lower SIP bits
            sop         => sop_s,
            dpcr        => dpcr_s,
            dprr        => dprr_s,
            debug_state => debug_state_s
        );

    -- ── Outputs ──────────────────────────────────────────────────────────────
    LEDR <= sop_s(9 downto 0);

    -- SOP as two hex digits on HEX1:HEX0
    HEX0 <= hex_to_seg(sop_s(3 downto 0));
    HEX1 <= hex_to_seg(sop_s(7 downto 4));

    -- DPCR lower byte on HEX3:HEX2
    HEX2 <= hex_to_seg(dpcr_s(3 downto 0));
    HEX3 <= hex_to_seg(dpcr_s(7 downto 4));

    -- DPRR flags on HEX4: bit1=IRQ, bit0=result → show as 2-digit binary proxy
    HEX4 <= hex_to_seg("00" & dprr_s);

    -- FSM state (0-5) on HEX5
    HEX5 <= hex_to_seg('0' & debug_state_s);

end architecture Structural;
