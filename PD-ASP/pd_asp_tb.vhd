-- pd_asp_tb.vhd
--
-- Testbench for the Peak-Detection ASP.
--
-- Author: Eric Chen
-- Course: COMPSYS 701, 2026, Individual Project

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.asp_packet_pkg.all;

entity pd_asp_tb is
end entity pd_asp_tb;

architecture sim of pd_asp_tb is

    constant CLK_PERIOD       : time := 10 ns;    -- 100 MHz
    constant SAMPLES_PER_CYCLE : integer := 320;  -- 16 kHz / 50 Hz
    constant N_CYCLES         : integer := 3;
    constant TOTAL_SAMPLES    : integer := SAMPLES_PER_CYCLE * N_CYCLES;

    -- Status-request CMD codes
    constant CMD_STATUS_REQ_STATE  : std_logic_vector(3 downto 0) := "0101";
    constant CMD_STATUS_REQ_COUNTS : std_logic_vector(3 downto 0) := "0110";
    constant CMD_STATUS_REQ_ERRORS : std_logic_vector(3 downto 0) := "0111";

    -- Port assignments
    constant PORT_NIOS  : std_logic_vector(3 downto 0) := "0000";
    constant PORT_RECOP : std_logic_vector(3 downto 0) := "0001";
    constant PORT_COR   : std_logic_vector(3 downto 0) := "0100";
    constant PORT_PD    : std_logic_vector(3 downto 0) := "0101";

    signal clk       : std_logic := '0';
    signal reset     : std_logic := '1';

    signal in_valid  : std_logic := '0';
    signal in_ready  : std_logic;
    signal in_word   : packet_word_t := (others => '0');

    signal out_valid : std_logic;
    signal out_ready : std_logic := '1';   -- always consume
    signal out_word  : packet_word_t;

    -- Verification counters
    signal observed_peaks : integer := 0;
    signal last_peak_count : integer := 0;


    -- Synthetic correlation generator
    --
    -- The correlation function r(x) of a 50 Hz cosine has the same period as
    -- the input. We model it as a positive cosine-squared with low-amplitude
    -- additive noise. Mid-range bias keeps values comfortably inside 20 bits.

    function corr_sample(idx : integer) return unsigned is
        variable phase     : real;
        variable cos_val   : real;
        variable scaled    : real;
        variable noise     : real;
        variable raw       : integer;
        variable result    : integer;
        variable seed1     : positive := 42;
        variable seed2     : positive := 13;
        variable rand_val  : real;
    begin
        -- Phase across one signal cycle of SAMPLES_PER_CYCLE samples
        phase   := real(idx mod SAMPLES_PER_CYCLE)
                 * 2.0 * MATH_PI / real(SAMPLES_PER_CYCLE);
        -- cosine-squared style: peaks at the start of each cycle
        cos_val := (cos(phase) + 1.0) / 2.0;        -- range 0..1
        scaled  := cos_val * 800000.0 + 100000.0;   -- centred mid-range

        -- Small deterministic perturbation (no UNIFORM call so result is
        -- reproducible across runs). Kept low so as not to drown the
        -- correlation peak — real correlation curves are very smooth after
        -- the moving-average filter and the Salcic symmetry detection.
        noise   := real((idx * 137) mod 256) - 128.0;

        raw     := integer(scaled + noise);

        if raw < 0 then
            result := 0;
        elsif raw > 1048575 then
            result := 1048575;
        else
            result := raw;
        end if;

        return to_unsigned(result, 20);
    end function;


    -- Procedure: send one packet to the DUT, wait for in_ready (always '1')
    -- in this design, but kept for protocol correctness).
    procedure send_packet (
        signal clk_s   : in  std_logic;
        signal v_s     : out std_logic;
        signal r_s     : in  std_logic;
        signal w_s     : out packet_word_t;
        constant pkt   : in  packet_word_t
    ) is
    begin
        wait until rising_edge(clk_s);
        w_s <= pkt;
        v_s <= '1';
        wait until rising_edge(clk_s) and r_s = '1';
        v_s <= '0';
        w_s <= (others => '0');
    end procedure;

begin


    -- Clock
    clk <= not clk after CLK_PERIOD / 2;

 
    -- DUT
    dut : entity work.pd_asp
        generic map (
            MY_PORT    => PORT_PD,
            RECOP_PORT => PORT_RECOP
        )
        port map (
            clk       => clk,
            reset     => reset,
            in_valid  => in_valid,
            in_ready  => in_ready,
            in_word   => in_word,
            out_valid => out_valid,
            out_ready => out_ready,
            out_word  => out_word
        );

  
    -- Stimulus
    stim : process

        variable cfg_payload : payload20_t;
        variable data_payload : payload20_t;
    begin
        -- Reset
        reset    <= '1';
        in_valid <= '0';
        in_word  <= (others => '0');
        wait for 5 * CLK_PERIOD;
        reset    <= '0';
        wait for 2 * CLK_PERIOD;

        -- CONFIG: output_dest=Nios (0x0), spacing=100 (0x64), threshold=0
        --   payload = 0000_01100100_0000_0000
        cfg_payload := PORT_NIOS                                -- [19:16]
                     & std_logic_vector(to_unsigned(100, 8))    -- [15:8]
                     & "0000"                                   -- [7:4]
                     & "0000";                                  -- [3:0]
        send_packet(clk, in_valid, in_ready, in_word,
                    make_packet(PKT_KIND_CMD, CMD_CONFIG,
                                PORT_PD, cfg_payload));

        -- START
        send_packet(clk, in_valid, in_ready, in_word,
                    make_packet(PKT_KIND_CMD, CMD_START,
                                PORT_PD, (others => '0')));

        -- Stream correlation samples
        for i in 0 to TOTAL_SAMPLES - 1 loop
            data_payload := std_logic_vector(corr_sample(i));
            send_packet(clk, in_valid, in_ready, in_word,
                        make_packet(PKT_KIND_DATA, "0000",
                                    PORT_PD, data_payload));
        end loop;

        -- Let any in-flight packet drain
        wait for 50 * CLK_PERIOD;

        -- Ask for peak counts
        send_packet(clk, in_valid, in_ready, in_word,
                    make_packet(PKT_KIND_CMD, CMD_STATUS_REQ_COUNTS,
                                PORT_PD, (others => '0')));

        wait for 20 * CLK_PERIOD;

        -- Ask for error counts
        send_packet(clk, in_valid, in_ready, in_word,
                    make_packet(PKT_KIND_CMD, CMD_STATUS_REQ_ERRORS,
                                PORT_PD, (others => '0')));

        wait for 50 * CLK_PERIOD;

        report "----- Test complete -----";
        report "Observed peak events: " & integer'image(observed_peaks);
        report "Last peak_count value: " & integer'image(last_peak_count);

        -- We sent 3 full cycles of 320 samples = 960 samples. With the
        -- first-peak suppression that gives 2-3 emitted peaks; the
        -- send_packet procedure runs at ~1 sample per 2 clocks so simulation
        -- time is approx 19.2us, leaving room for all 3 of cycles 1..3
        -- and potentially the start of a 4th. Accept 2..4 peaks.
        if observed_peaks >= 2 and observed_peaks <= 4 then
            report "PASS: peak count within expected range" severity note;
        else
            report "FAIL: unexpected peak count" severity failure;
        end if;

        -- peak_count is in *accepted samples* between peaks. The testbench
        -- send_packet procedure delivers approximately one sample every
        -- 2 clock cycles, so over one 320-clock-cycle signal period the
        -- counter sees roughly 160 accepted samples. For a real ADC running
        -- at 16 kHz with one sample per clock, this would be 320.
        if last_peak_count > 140 and last_peak_count < 180 then
            report "PASS: inter-peak interval consistent with 50 Hz @ 16 kHz"
                severity note;
        else
            report "FAIL: inter-peak interval out of expected range"
                severity failure;
        end if;

        wait;
    end process;


    -- Output monitor: print and count every packet the DUT emits
    monitor : process(clk)
        variable kind_v    : std_logic_vector(3 downto 0);
        variable code_v    : std_logic_vector(3 downto 0);
        variable dest_v    : std_logic_vector(3 downto 0);
        variable payload_v : payload20_t;
    begin
        if rising_edge(clk) then
            if out_valid = '1' and out_ready = '1' then
                kind_v    := packet_kind(out_word);
                code_v    := packet_code(out_word);
                dest_v    := packet_dest(out_word);
                payload_v := packet_payload(out_word);

                if kind_v = PKT_KIND_EVENT and code_v = EVENT_MAX_PEAK then
                    observed_peaks  <= observed_peaks + 1;
                    last_peak_count <= to_integer(unsigned(payload_v));
                    report "EVENT peak. dest=" & integer'image(to_integer(unsigned(dest_v)))
                         & " count=" & integer'image(to_integer(unsigned(payload_v)));

                elsif kind_v = PKT_KIND_STATUS then
                    report "STATUS reply. code="
                         & integer'image(to_integer(unsigned(code_v)))
                         & " payload=0x"
                         & integer'image(to_integer(unsigned(payload_v)));
                end if;
            end if;
        end if;
    end process;

end architecture sim;