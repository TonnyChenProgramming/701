-- pd_asp.vhd
--
-- Peak-Detection ASP — Top-level NoC-facing wrapper.
--
-- Author: Eric Chen
-- Course: COMPSYS 701, 2026, Individual Project

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
use work.asp_packet_pkg.all;
 
entity pd_asp is
    generic (
        MY_PORT       : std_logic_vector(3 downto 0) := "0101";
        RECOP_PORT    : std_logic_vector(3 downto 0) := "0001"
    );
    port (
        clk         : in  std_logic;
        reset       : in  std_logic;
 
        in_valid    : in  std_logic;
        in_ready    : out std_logic;
        in_word     : in  packet_word_t;
 
        out_valid   : out std_logic;
        out_ready   : in  std_logic;
        out_word    : out packet_word_t
    );
end entity pd_asp;
 
architecture rtl of pd_asp is
 
    -- Status-request CMD codes (extends asp_packet_pkg)
    constant CMD_STATUS_REQ_STATE  : std_logic_vector(3 downto 0) := "0101";
    constant CMD_STATUS_REQ_COUNTS : std_logic_vector(3 downto 0) := "0110";
    constant CMD_STATUS_REQ_ERRORS : std_logic_vector(3 downto 0) := "0111";
 
    -- Registered input pipeline stage (timing closure)
    signal in_valid_r : std_logic     := '0';
    signal in_word_r  : packet_word_t := (others => '0');
 
    -- Configuration registers
    signal cfg_output_dest : std_logic_vector(3 downto 0) := "0000";
    signal cfg_min_spacing : unsigned(15 downto 0)        := to_unsigned(200, 16);
    signal cfg_threshold   : unsigned(3 downto 0)         := (others => '0');
    signal enabled_r       : std_logic := '0';
 
    -- Core signals
    signal core_clear         : std_logic;
    signal core_corr_in       : unsigned(19 downto 0);
    signal core_corr_valid    : std_logic;
    signal core_corr_ready    : std_logic;
    signal core_peak_count    : unsigned(19 downto 0);
    signal core_peak_value    : unsigned(19 downto 0);
    signal core_peak_valid    : std_logic;
    signal core_fsm_state     : std_logic;
    signal core_live_counter  : unsigned(23 downto 0);
    signal core_total_peaks   : unsigned(19 downto 0);
    signal core_missed_peaks  : unsigned(19 downto 0);
 
    -- Output staging
    signal out_pending_r : std_logic     := '0';
    signal out_word_r    : packet_word_t := (others => '0');
    signal status_pending_r : std_logic   := '0';
    signal status_command_r : nibble_t    := CMD_NOP;
    signal peak_value_pending_r : std_logic := '0';
    signal peak_value_r         : unsigned(19 downto 0) := (others => '0');
 
    -- Combinational packet classification (now from REGISTERED input)
    signal in_kind          : std_logic_vector(3 downto 0);
    signal in_code          : std_logic_vector(3 downto 0);
    signal in_dest          : std_logic_vector(3 downto 0);
    signal in_payload       : payload20_t;
    signal addressed_to_me  : std_logic;
    signal is_cmd_for_me    : std_logic;
    signal is_data_in       : std_logic;
 
    signal cmd_clear_pulse  : std_logic;
    signal cmd_status_state : std_logic;
    signal cmd_status_count : std_logic;
    signal cmd_status_error : std_logic;
 
begin
 

    -- Input register stage. Adds 1 cycle of latency but breaks the long
    -- input-port-to-register critical path that limited Fmax to 77 MHz.
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                in_valid_r <= '0';
                in_word_r  <= (others => '0');
            else
                in_valid_r <= in_valid;
                in_word_r  <= in_word;
            end if;
        end if;
    end process;
 
    -- We always accept input. Backpressure happens only on the output side.
    in_ready <= '1';
 

    -- Decode the REGISTERED input fields (short combinational paths now).
    in_kind         <= packet_kind(in_word_r);
    in_code         <= packet_code(in_word_r);
    in_dest         <= packet_dest(in_word_r);
    in_payload      <= packet_payload(in_word_r);
 
    addressed_to_me <= '1' when in_dest = MY_PORT else '0';
 
    is_cmd_for_me   <= '1' when (in_valid_r = '1'
                                 and in_kind = PKT_KIND_CMD
                                 and addressed_to_me = '1')
                       else '0';
 
    is_data_in      <= '1' when (in_valid_r = '1'
                                 and in_kind = PKT_KIND_DATA
                                 and addressed_to_me = '1')
                       else '0';
 
    core_corr_in    <= unsigned(in_payload);
    core_corr_valid <= is_data_in;
 
    cmd_clear_pulse  <= '1' when (is_cmd_for_me = '1' and in_code = CMD_CLEAR)
                        else '0';
    cmd_status_state <= '1' when (is_cmd_for_me = '1'
                                  and in_code = CMD_STATUS_REQ_STATE) else '0';
    cmd_status_count <= '1' when (is_cmd_for_me = '1'
                                  and in_code = CMD_STATUS_REQ_COUNTS) else '0';
    cmd_status_error <= '1' when (is_cmd_for_me = '1'
                                  and in_code = CMD_STATUS_REQ_ERRORS) else '0';
 
    core_clear <= cmd_clear_pulse;
 

    -- Configuration / control register updates
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                enabled_r        <= '0';
                cfg_output_dest  <= "0000";
                cfg_min_spacing  <= to_unsigned(200, 16);
                cfg_threshold    <= (others => '0');
            elsif is_cmd_for_me = '1' then
                case in_code is
                    when CMD_CONFIG =>
                        cfg_output_dest <= in_payload(19 downto 16);
                        cfg_min_spacing <= resize(unsigned(in_payload(15 downto 8)), 16);
                        cfg_threshold   <= unsigned(in_payload(7 downto 4));
                    when CMD_START =>
                        enabled_r <= '1';
                    when CMD_STOP =>
                        enabled_r <= '0';
                    when CMD_CLEAR =>
                        enabled_r <= '0';
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;
 
 
    -- Algorithm core
    u_core : entity work.pd_core
        port map (
            clk              => clk,
            reset            => reset,
            enable           => enabled_r,
            clear            => core_clear,
            min_peak_spacing => cfg_min_spacing,
            threshold_msb    => cfg_threshold,
            corr_in          => core_corr_in,
            corr_valid       => core_corr_valid,
            corr_ready       => core_corr_ready,
            peak_count       => core_peak_count,
            peak_value       => core_peak_value,
            peak_valid       => core_peak_valid,
            fsm_state        => core_fsm_state,
            live_counter     => core_live_counter,
            total_peaks      => core_total_peaks,
            missed_peaks     => core_missed_peaks
        );
 

    -- Output arbitration and packet building
    process(clk)
        variable status_state_payload  : payload20_t;
        variable status_counts_payload : payload20_t;
        variable status_errors_payload : payload20_t;
        variable status_control_payload : payload20_t;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                out_pending_r    <= '0';
                out_word_r       <= (others => '0');
                status_pending_r <= '0';
                status_command_r <= CMD_NOP;
                peak_value_pending_r <= '0';
                peak_value_r <= (others => '0');
            else
                if out_pending_r = '1' and out_ready = '1' then
                    out_pending_r <= '0';
                end if;
 
                if out_pending_r = '0' or out_ready = '1' then
                    status_state_payload := enabled_r
                                          & core_fsm_state
                                          & std_logic_vector(core_live_counter(17 downto 0));
                    status_counts_payload := std_logic_vector(core_total_peaks);
                    status_errors_payload := std_logic_vector(core_missed_peaks);
                    status_control_payload := (others => '0');
                    status_control_payload(15) := enabled_r;
                    status_control_payload(3 downto 0) := status_command_r;

                    if status_command_r = CMD_CONFIG then
                        status_control_payload(14) := '1';
                    elsif status_command_r = CMD_CLEAR then
                        status_control_payload(13) := '1';
                    end if;

                    if status_pending_r = '1' then
                        -- Automatic command acknowledgement for the ReCOP LED
                        -- controller. Bit 15 mirrors the enabled/running state.
                        out_word_r    <= make_packet(PKT_KIND_STATUS,
                                                     TAG_STATUS,
                                                     RECOP_PORT,
                                                     status_control_payload);
                        out_pending_r <= '1';
                        status_pending_r <= '0';
                    elsif cmd_status_state = '1' then
                        out_word_r    <= make_packet(PKT_KIND_STATUS,
                                                     CMD_STATUS_REQ_STATE,
                                                     RECOP_PORT,
                                                     status_state_payload);
                        out_pending_r <= '1';
                    elsif cmd_status_count = '1' then
                        out_word_r    <= make_packet(PKT_KIND_STATUS,
                                                     CMD_STATUS_REQ_COUNTS,
                                                     RECOP_PORT,
                                                     status_counts_payload);
                        out_pending_r <= '1';
                    elsif cmd_status_error = '1' then
                        out_word_r    <= make_packet(PKT_KIND_STATUS,
                                                     CMD_STATUS_REQ_ERRORS,
                                                     RECOP_PORT,
                                                     status_errors_payload);
                        out_pending_r <= '1';
                    elsif peak_value_pending_r = '1' then
                        out_word_r    <= make_packet(PKT_KIND_EVENT,
                                                     EVENT_PEAK_VALUE,
                                                     cfg_output_dest,
                                                     std_logic_vector(peak_value_r));
                        out_pending_r <= '1';
                        peak_value_pending_r <= '0';
                    elsif core_peak_valid = '1' then
                        out_word_r    <= make_packet(PKT_KIND_EVENT,
                                                     EVENT_MAX_PEAK,
                                                     cfg_output_dest,
                                                     std_logic_vector(core_peak_count));
                        out_pending_r <= '1';
                        peak_value_r <= core_peak_value;
                        peak_value_pending_r <= '1';
                    end if;
                end if;

                if is_cmd_for_me = '1' then
                    case in_code is
                        when CMD_NOP | CMD_CONFIG | CMD_START | CMD_STOP | CMD_CLEAR =>
                            status_command_r <= in_code;
                            status_pending_r <= '1';
                        when others =>
                            null;
                    end case;
                end if;
            end if;
        end if;
    end process;
 
    out_word  <= out_word_r;
    out_valid <= out_pending_r;
 
end architecture rtl;
