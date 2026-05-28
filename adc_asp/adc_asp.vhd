library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

-- ADC-ASP core
--
-- This block emulates an analogue-to-digital converter for early HMPSoC/NoC
-- integration work. Instead of reading a real ADC pin, it emits deterministic
-- sample streams from four virtual channels. That makes simulation repeatable
-- and lets ReCOP/NoC development continue before physical ADC hardware is used.
entity adc_asp_core is
    port(
        clk         : in  std_logic;
        reset       : in  std_logic;

        cmd_valid   : in  std_logic;
        cmd_ready   : out std_logic;
        cmd_word    : in  packet_word_t;

        out_valid   : out std_logic;
        out_ready   : in  std_logic;
        out_word    : out packet_word_t;

        status_word : out packet_word_t
    );
end entity adc_asp_core;

architecture rtl of adc_asp_core is
    -- VHDL/hardware reading note:
    -- These architecture signals describe physical storage or wires inside the
    -- ADC-ASP. The signals assigned inside rising_edge(clk) below become
    -- flip-flops/registers. Unlike a C++ local variable, each register keeps
    -- its value between clock ticks until new hardware logic loads it.
    signal enabled       : std_logic := '0';
    signal channel_sel   : unsigned(1 downto 0) := (others => '0');
    signal sample_div    : unsigned(3 downto 0) := (others => '0');
    signal div_count     : unsigned(3 downto 0) := (others => '0');
    signal phase         : unsigned(5 downto 0) := (others => '0');
    signal dest_node     : nibble_t := AVE_ASP_ADDR(3 downto 0);
    signal sample_reg    : sample16_t := (others => '0');
    signal out_valid_reg : std_logic := '0';

    -- Small signed lookup table used for channel 0. The other channels derive
    -- simple waveforms mathematically so that the ASP stays compact.
    type wave_rom_t is array (0 to 15) of sample16_t;
    constant SINE_LIKE_ROM : wave_rom_t := (
        to_signed(0, 16),    to_signed(383, 16),  to_signed(707, 16),  to_signed(924, 16),
        to_signed(1000, 16), to_signed(924, 16),  to_signed(707, 16),  to_signed(383, 16),
        to_signed(0, 16),    to_signed(-383, 16), to_signed(-707, 16), to_signed(-924, 16),
        to_signed(-1000, 16),to_signed(-924, 16), to_signed(-707, 16), to_signed(-383, 16)
    );

    -- This function is the "Virtual waveform generator" block from the report
    -- diagram. It has no clock and no memory by itself: for a given channel and
    -- phase input, synthesis builds combinational logic that immediately
    -- produces the matching sample value.
    function next_sample(ch : unsigned(1 downto 0); ph : unsigned(5 downto 0)) return sample16_t is
        -- Variables inside a function are temporary calculation names, closer
        -- to C++ locals. They do not become registers unless their result is
        -- stored into a signal in a clocked process.
        variable low4 : integer range 0 to 15;
        variable saw  : integer;
    begin
        low4 := to_integer(ph(3 downto 0));

        case to_integer(ch) is
            when 0 =>
                return SINE_LIKE_ROM(low4);
            when 1 =>
                -- Ramp/sawtooth channel. Useful for checking average filters.
                saw := (to_integer(ph) * 64) - 2048;
                return to_signed(saw, 16);
            when 2 =>
                -- Square channel. Useful for testing peak and threshold logic.
                if ph(5) = '0' then
                    return to_signed(1200, 16);
                else
                    return to_signed(-1200, 16);
                end if;
            when others =>
                -- Alternating small/large channel for correlation experiments.
                if ph(0) = '0' then
                    return to_signed(300 + (low4 * 20), 16);
                else
                    return to_signed(-300 - (low4 * 20), 16);
                end if;
        end case;
    end function;
begin
    -- Concurrent assignments are always active hardware connections, not
    -- statements that run once in order. When sample_reg or dest_node changes,
    -- the packet builder output changes with them.
    cmd_ready <= '1';
    out_valid <= out_valid_reg;
    out_word <= make_packet(PKT_KIND_DATA, TAG_DIRECT_DATA, dest_node, payload_from_sample16(sample_reg));

    -- Status is always available for debug LEDs, SignalTap, or a simple NI
    -- status read. Payload bits: enabled, channel, divider, and phase.
    status_word <= make_packet(
        PKT_KIND_STATUS,
        TAG_STATUS,
        RECOP_ADDR(3 downto 0),
        -- 15 enabled, 14..13 channel, 12..9 divider, 8..3 phase, 2..0 spare.
        "0000" & enabled & std_logic_vector(channel_sel) & std_logic_vector(sample_div) & std_logic_vector(phase) & "000"
    );

    -- This clocked process is the report diagram's control unit plus the
    -- registers it controls. All <= signal updates inside one rising edge are
    -- scheduled together, so later tests in this same process still see the
    -- old signal values from the start of the clock edge.
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                enabled       <= '0';
                channel_sel   <= (others => '0');
                sample_div    <= (others => '0');
                div_count     <= (others => '0');
                phase         <= (others => '0');
                dest_node     <= AVE_ASP_ADDR(3 downto 0);
                sample_reg    <= (others => '0');
                out_valid_reg <= '0';
            else
                -- HOLD behavior from the diagram: once out_valid_reg is high,
                -- sample_reg/out_word stay unchanged until the downstream NI
                -- accepts the packet by raising out_ready in the same cycle.
                if out_valid_reg = '1' and out_ready = '1' then
                    out_valid_reg <= '0';
                end if;

                -- Command decoder and configuration registers from the top row
                -- of the report diagram. cmd_ready is tied high, so a command
                -- is accepted whenever cmd_valid is high.
                if cmd_valid = '1' and packet_kind(cmd_word) = PKT_KIND_CMD then
                    case packet_code(cmd_word) is
                        when CMD_CONFIG =>
                            -- Payload format:
                            -- 19..16 output destination, 15..14 virtual channel,
                            -- 13..10 sample divider, 9..0 spare.
                            dest_node   <= cmd_word(19 downto 16);
                            channel_sel <= unsigned(cmd_word(15 downto 14));
                            sample_div  <= unsigned(cmd_word(13 downto 10));
                        when CMD_START =>
                            enabled <= '1';
                        when CMD_STOP =>
                            enabled <= '0';
                        when CMD_CLEAR =>
                            phase <= (others => '0');
                            div_count <= (others => '0');
                            out_valid_reg <= '0';
                        when others =>
                            null;
                    end case;
                end if;

                -- The divider emulates lower sample rates. sample_div=0 emits
                -- on every generation opportunity, sample_div=7 emits once
                -- every 8 generation opportunities. If a packet was just
                -- accepted this clock, this simple RTL waits until the next
                -- clock before generating another one because signal tests use
                -- the old out_valid_reg value.
                if enabled = '1' and out_valid_reg = '0' then
                    if div_count = sample_div then
                        div_count <= (others => '0');
                        -- These three registers load together on the next clock
                        -- edge: store the generated sample, advance the phase,
                        -- and mark the output packet as valid.
                        sample_reg <= next_sample(channel_sel, phase);
                        phase <= phase + 1;
                        out_valid_reg <= '1';
                    else
                        div_count <= div_count + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

-- TDMA-MIN facing wrapper for the ADC-ASP core.
entity adc_asp is
    port (
        clock : in  bit_1;
        reset : in  bit_1;
        init  : in  bit_1;

        send  : out tdma_min_port;
        recv  : in  tdma_min_port
    );
end entity adc_asp;

architecture rtl of adc_asp is
    signal asp_reset        : bit_1;
    signal recv_word        : packet_word_t;
    signal cmd_valid        : std_logic;
    signal cmd_ready        : std_logic;
    signal out_valid        : std_logic;
    signal out_ready        : std_logic;
    signal out_word         : packet_word_t;
    signal status_word      : packet_word_t;
    signal status_pending_r : std_logic := '0';

    function port4_to_addr8(port4 : std_logic_vector(3 downto 0)) return addr8_t is
    begin
        case port4 is
            when "0000" => return RECOP_ADDR;
            when "0001" => return ADC_ADDR;
            when "0010" => return AVE_ASP_ADDR;
            when "0011" => return COR_ASP_ADDR;
            when "0100" => return PK_ADDR;
            when "0101" => return NIOS_II_ADDR;
            when "0110" => return IDLE_ADDR;
            when others => return NULL_ADDR;
        end case;
    end function;
begin
    asp_reset <= reset or init;
    recv_word <= packet_word_t(std_logic_vector(recv.data));

    cmd_valid <= '1' when recv.addr = ADC_ADDR
                      and packet_kind(recv_word) = PKT_KIND_CMD
                 else '0';

    out_ready <= not status_pending_r;

    u_core : entity work.adc_asp_core
        port map (
            clk         => clock,
            reset       => asp_reset,
            cmd_valid   => cmd_valid,
            cmd_ready   => cmd_ready,
            cmd_word    => recv_word,
            out_valid   => out_valid,
            out_ready   => out_ready,
            out_word    => out_word,
            status_word => status_word
        );

    process(clock)
    begin
        if rising_edge(clock) then
            if asp_reset = '1' then
                status_pending_r <= '0';
            else
                if status_pending_r = '1' then
                    status_pending_r <= '0';
                end if;

                if cmd_valid = '1' then
                    status_pending_r <= '1';
                end if;
            end if;
        end if;
    end process;

    send.addr <= port4_to_addr8(packet_dest(status_word)) when status_pending_r = '1'
                 else port4_to_addr8(packet_dest(out_word)) when out_valid = '1'
                 else NULL_ADDR;

    send.data <= status_word when status_pending_r = '1'
                 else out_word when out_valid = '1'
                 else (others => '0');

end architecture rtl;
