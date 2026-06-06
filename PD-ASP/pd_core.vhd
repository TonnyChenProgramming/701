-- pd_core.vhd
--
-- Peak-Detection ASP — Algorithm Core
--
-- Author: Eric Chen
-- Course: COMPSYS 701, 2026, Individual Project

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity pd_core is
    port (
        clk              : in  std_logic;
        reset            : in  std_logic;
 
        -- Control inputs (from NoC wrapper, driven by CMD packets)
        enable           : in  std_logic;  -- master enable (START / STOP)
        clear            : in  std_logic;  -- one-cycle pulse, soft reset of FSM
 
        -- Configuration inputs (from NoC wrapper, written by CONFIG packets)
        min_peak_spacing : in  unsigned(15 downto 0);
        threshold_msb    : in  unsigned(3 downto 0);  -- 0 = threshold disabled
 
        -- Streaming input from COR-ASP (correlation values, 20-bit unsigned)
        corr_in          : in  unsigned(19 downto 0);
        corr_valid       : in  std_logic;
        corr_ready       : out std_logic;  -- always '1' once enabled
 
        -- Peak event output (consumed by NoC wrapper)
        peak_count       : out unsigned(19 downto 0);  -- samples since last peak
        peak_value       : out unsigned(19 downto 0);  -- local maximum value
        peak_valid       : out std_logic;  -- one-cycle pulse on accepted peak
 
        -- Status outputs for the wrapper to expose via STATUS packets
        fsm_state        : out std_logic;  -- 0 = POS_SLOPE, 1 = NEG_SLOPE
        live_counter     : out unsigned(23 downto 0);
        total_peaks      : out unsigned(19 downto 0);
        missed_peaks     : out unsigned(19 downto 0)
    );
end entity pd_core;
 
architecture rtl of pd_core is
 
    -- FSM state encoding
    constant POS_SLOPE : std_logic := '0';
    constant NEG_SLOPE : std_logic := '1';
 
    -- Registered state
    signal state_r        : std_logic := POS_SLOPE;
    signal last_corr_r    : unsigned(19 downto 0) := (others => '0');
    signal counter_r      : unsigned(23 downto 0) := (others => '0');
    signal peak_count_r   : unsigned(19 downto 0) := (others => '0');
    signal peak_value_r   : unsigned(19 downto 0) := (others => '0');
    signal peak_valid_r   : std_logic := '0';
    signal first_seen_r   : std_logic := '0';  -- seen at least one sample
    signal first_peak_r   : std_logic := '0';  -- first peak suppressed
    signal total_peaks_r  : unsigned(19 downto 0) := (others => '0');
    signal missed_peaks_r : unsigned(19 downto 0) := (others => '0');
 
    -- Combinational helpers
    signal sample_accepted : std_logic;
    signal is_peak_edge    : std_logic;  -- slope inverted POS -> NEG this cycle
    signal qualifies_spacing : std_logic;
    signal qualifies_threshold : std_logic;
    signal peak_accepted   : std_logic;
 
begin
 
    -- We always accept input when enabled. Peak detection is single-cycle.
    corr_ready <= enable;
 
    sample_accepted <= corr_valid and enable;
 
    -- Slope inversion detection: only valid once we have a prior sample to
    -- compare against (first_seen_r). On the very first sample we just
    -- register it as last_corr without firing anything.
    is_peak_edge <= '1' when (sample_accepted = '1'
                              and first_seen_r  = '1'
                              and state_r       = POS_SLOPE
                              and corr_in < last_corr_r)
                   else '0';
 
    qualifies_spacing <= '1' when (counter_r >= resize(min_peak_spacing, 24))
                         else '0';
 
    -- Threshold check: if threshold_msb is 0 the qualifier is disabled.
    -- Otherwise the top 4 bits of corr_in must exceed threshold_msb.
    qualifies_threshold <= '1' when (threshold_msb = "0000")
                           else '1' when (corr_in(19 downto 16) > threshold_msb)
                           else '0';
 
    peak_accepted <= is_peak_edge and qualifies_spacing and qualifies_threshold;
 
    -- Main sequential process
    process(clk)
    begin
        if rising_edge(clk) then
 
            -- One-cycle default for the peak_valid pulse
            peak_valid_r <= '0';
 
            if reset = '1' or clear = '1' then
                state_r        <= POS_SLOPE;
                last_corr_r    <= (others => '0');
                counter_r      <= (others => '0');
                peak_count_r   <= (others => '0');
                peak_value_r   <= (others => '0');
                peak_valid_r   <= '0';
                first_seen_r   <= '0';
                first_peak_r   <= '0';
                total_peaks_r  <= (others => '0');
                missed_peaks_r <= (others => '0');
 
            elsif sample_accepted = '1' then
                last_corr_r  <= corr_in;
                first_seen_r <= '1';
                counter_r    <= counter_r + 1;
 
                -- Slope FSM transitions
                if first_seen_r = '1' then
                    case state_r is
 
                        when POS_SLOPE =>
                            if corr_in < last_corr_r then
                                -- Peak edge: slope inverted
                                state_r <= NEG_SLOPE;
 
                                if first_peak_r = '0' then
                                    -- Discard the very first peak (count
                                    -- since reset is meaningless)
                                    first_peak_r <= '1';
                                    counter_r    <= (others => '0');
 
                                elsif peak_accepted = '1' then
                                    peak_count_r  <= counter_r(19 downto 0);
                                    peak_value_r  <= last_corr_r;
                                    peak_valid_r  <= '1';
                                    counter_r     <= (others => '0');
                                    total_peaks_r <= total_peaks_r + 1;
 
                                else
                                    -- Spacing or threshold rejected the peak
                                    missed_peaks_r <= missed_peaks_r + 1;
                                    counter_r      <= (others => '0');
                                end if;
                            end if;
 
                        when NEG_SLOPE =>
                            if corr_in > last_corr_r then
                                -- Trough: resume tracking upward, no peak fires
                                state_r <= POS_SLOPE;
                            end if;
 
                        when others =>
                            state_r <= POS_SLOPE;
                    end case;
                end if;
 
            end if;
        end if;
    end process;
 
    -- Output assignments
    peak_count   <= peak_count_r;
    peak_value   <= peak_value_r;
    peak_valid   <= peak_valid_r;
    fsm_state    <= state_r;
    live_counter <= counter_r;
    total_peaks  <= total_peaks_r;
    missed_peaks <= missed_peaks_r;
 
end architecture rtl;
