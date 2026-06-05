library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

entity recop_top_soc_test_wrapper is
    port (
        CLOCK_50 : in  std_logic;
        KEY      : in  std_logic_vector(3 downto 0);
        SW       : in  std_logic_vector(9 downto 0);

        LEDR     : out std_logic_vector(9 downto 0);

        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0);
        HEX2     : out std_logic_vector(6 downto 0);
        HEX3     : out std_logic_vector(6 downto 0);
        HEX4     : out std_logic_vector(6 downto 0);
        HEX5     : out std_logic_vector(6 downto 0)
    );
end recop_top_soc_test_wrapper;

architecture beh of recop_top_soc_test_wrapper is

    signal reset_cpu     : bit_1;
    signal init_s        : bit_1;

    signal sip_s         : bit_16;
    signal recv_s        : tdma_min_port := (
        addr => (others => '0'),
        data => (others => '0')
    );

    signal send_s        : tdma_min_port;
    signal sop_s         : bit_16;
    signal dprr_s        : bit_2;
    signal current_state : bit_4;

    -- SW7/SW6/SW5 previous state for rising-edge detection
    signal recv_cmd_prev : std_logic_vector(2 downto 0) := "000";

    -- shadow status for fake ASP responses:
    -- bit3 ADC, bit2 AVE, bit1 COR, bit0 PK
    signal asp_status_shadow : std_logic_vector(3 downto 0) := "0000";

    function hex_to_7seg(nibble : std_logic_vector(3 downto 0))
        return std_logic_vector is
    begin
        case nibble is
            when "0000" => return "1000000";
            when "0001" => return "1111001";
            when "0010" => return "0100100";
            when "0011" => return "0110000";
            when "0100" => return "0011001";
            when "0101" => return "0010010";
            when "0110" => return "0000010";
            when "0111" => return "1111000";
            when "1000" => return "0000000";
            when "1001" => return "0010000";
            when "1010" => return "0001000";
            when "1011" => return "0000011";
            when "1100" => return "1000110";
            when "1101" => return "0100001";
            when "1110" => return "0000110";
            when "1111" => return "0001110";
            when others => return "1111111";
        end case;
    end function;

    function sw_to_asp_addr(sel : std_logic_vector(1 downto 0))
        return addr8_t is
    begin
        case sel is
            when "00" => return AVE_ASP_ADDR;
            when "01" => return ADC_ADDR;
            when "10" => return COR_ASP_ADDR;
            when others => return PK_ADDR;
        end case;
    end function;

begin

    ----------------------------------------------------------------
    -- Control signals
    -- DE1-SoC KEY is active-low:
    -- pressed     = 0
    -- not pressed = 1
    ----------------------------------------------------------------
    init_s    <= not KEY(0);
    reset_cpu <= not KEY(0);

    ----------------------------------------------------------------
    -- SIP mapping
    --
    -- sip_s(5 downto 4) = target ASP selected by SW1..SW0
    --   00 = AVE
    --   01 = ADC
    --   10 = COR
    --   11 = PK
    --
    -- sip_s(3 downto 0) = KEY3..KEY0
    --   KEY3 pressed => sip(3 downto 1) = "011" => START
    --   KEY2 pressed => sip(3 downto 1) = "101" => STOP
    --   KEY1 pressed => sip(3 downto 1) = "110" => CLEAR
    ----------------------------------------------------------------
    p_sip_map : process(SW, KEY)
        variable tmp : bit_16;
    begin
        tmp := (others => '1');
        tmp(5 downto 4) := SW(1 downto 0);
        tmp(3 downto 0) := KEY;
        sip_s <= tmp;
    end process;

    ----------------------------------------------------------------
    -- Fake RECV status packet generator for on-board testing
    --
    -- SW9..SW8 selects fake ASP source:
    --   00 = AVE
    --   01 = ADC
    --   10 = COR
    --   11 = PK
    --
    -- SW7 rising edge = START status
    -- SW6 rising edge = STOP status
    -- SW5 rising edge = CLEAR status
    ----------------------------------------------------------------
    p_recv_gen : process(CLOCK_50, reset_cpu)
        variable source_addr_v : addr8_t;
        variable payload_v     : payload20_t;
        variable shadow_v      : std_logic_vector(3 downto 0);
    begin
        if reset_cpu = '1' then
            recv_s.addr <= NULL_ADDR;
            recv_s.data <= (others => '0');
            recv_cmd_prev <= "000";
            asp_status_shadow <= "0000";

        elsif rising_edge(CLOCK_50) then

            -- default: no fake recv packet
            recv_s.addr <= NULL_ADDR;
            recv_s.data <= (others => '0');

            source_addr_v := sw_to_asp_addr(SW(9 downto 8));
            payload_v := (others => '0');
            shadow_v := asp_status_shadow;

            ------------------------------------------------------------
            -- START event: SW7 rising edge
            ------------------------------------------------------------
            if SW(7) = '1' and recv_cmd_prev(2) = '0' then

                case SW(9 downto 8) is
                    when "00" => shadow_v(2) := '1'; -- AVE on
                    when "01" => shadow_v(3) := '1'; -- ADC on
                    when "10" => shadow_v(1) := '1'; -- COR on
                    when others => shadow_v(0) := '1'; -- PK on
                end case;

                if source_addr_v = COR_ASP_ADDR then
                    -- COR operating: recv.data(1 downto 0) = "00"
                    payload_v(1 downto 0) := "00";
                elsif source_addr_v = AVE_ASP_ADDR then
                    payload_v(15) := shadow_v(2);
                elsif source_addr_v = ADC_ADDR then
                    payload_v(15) := shadow_v(3);
                elsif source_addr_v = PK_ADDR then
                    payload_v(15) := shadow_v(0);
                end if;

                recv_s.addr <= source_addr_v;
                recv_s.data <= make_packet(
                    PKT_KIND_STATUS,
                    TAG_STATUS,
                    RECOP_ADDR(3 downto 0),
                    payload_v
                );

                asp_status_shadow <= shadow_v;

            ------------------------------------------------------------
            -- STOP event: SW6 rising edge
            ------------------------------------------------------------
            elsif SW(6) = '1' and recv_cmd_prev(1) = '0' then

                case SW(9 downto 8) is
                    when "00" => shadow_v(2) := '0'; -- AVE off
                    when "01" => shadow_v(3) := '0'; -- ADC off
                    when "10" => shadow_v(1) := '0'; -- COR off
                    when others => shadow_v(0) := '0'; -- PK off
                end case;

                if source_addr_v = COR_ASP_ADDR then
                    -- any non-"00" means COR not operating
                    payload_v(1 downto 0) := "01";
                elsif source_addr_v = AVE_ASP_ADDR then
                    payload_v(15) := shadow_v(2);
                elsif source_addr_v = ADC_ADDR then
                    payload_v(15) := shadow_v(3);
                elsif source_addr_v = PK_ADDR then
                    payload_v(15) := shadow_v(0);
                end if;

                recv_s.addr <= source_addr_v;
                recv_s.data <= make_packet(
                    PKT_KIND_STATUS,
                    TAG_STATUS,
                    RECOP_ADDR(3 downto 0),
                    payload_v
                );

                asp_status_shadow <= shadow_v;

            ------------------------------------------------------------
            -- CLEAR event: SW5 rising edge
            ------------------------------------------------------------
            elsif SW(5) = '1' and recv_cmd_prev(0) = '0' then

                -- For simple board testing, CLEAR is treated as not operating.
                -- If you want to exactly mirror ADC/AVE cores, CLEAR does not
                -- necessarily disable enabled for ADC/AVE.
                case SW(9 downto 8) is
                    when "00" => shadow_v(2) := '0'; -- AVE off for test
                    when "01" => shadow_v(3) := '0'; -- ADC off for test
                    when "10" => shadow_v(1) := '0'; -- COR off
                    when others => shadow_v(0) := '0'; -- PK off
                end case;

                if source_addr_v = COR_ASP_ADDR then
                    payload_v(1 downto 0) := "10";
                elsif source_addr_v = AVE_ASP_ADDR then
                    payload_v(15) := shadow_v(2);
                elsif source_addr_v = ADC_ADDR then
                    payload_v(15) := shadow_v(3);
                elsif source_addr_v = PK_ADDR then
                    payload_v(15) := shadow_v(0);
                end if;

                recv_s.addr <= source_addr_v;
                recv_s.data <= make_packet(
                    PKT_KIND_STATUS,
                    TAG_STATUS,
                    RECOP_ADDR(3 downto 0),
                    payload_v
                );

                asp_status_shadow <= shadow_v;
            end if;

            recv_cmd_prev <= SW(7 downto 5);
        end if;
    end process;

    ----------------------------------------------------------------
    -- CPU instance
    ----------------------------------------------------------------
    u_recop : entity work.recop_top
        port map(
            clk                  => CLOCK_50,
            init                 => init_s,
            reset                => reset_cpu,

            sip                  => sip_s,
            recv                 => recv_s,

            dprr                 => dprr_s,
            dpcr                 => send_s,
            sop                  => sop_s,
            current_state_output => current_state
        );

    ----------------------------------------------------------------
    -- Send output
    ----------------------------------------------------------------
    -- If you later connect this wrapper into a real NoC, expose send_s.
    -- For this board-only wrapper, we only display it.
    ----------------------------------------------------------------

    ----------------------------------------------------------------
    -- LED mapping
    ----------------------------------------------------------------
    LEDR(3 downto 0) <= sop_s(3 downto 0);
    LEDR(5 downto 4) <= SW(1 downto 0);
    LEDR(7 downto 6) <= SW(9 downto 8);
    LEDR(9 downto 8) <= dprr_s;

    ----------------------------------------------------------------
    -- HEX mapping
    --
    -- HEX4 = send.addr low nibble
    -- HEX3..HEX0 = send.data low 16 bits
    ----------------------------------------------------------------
    HEX0 <= hex_to_7seg(send_s.data(19 downto 16));
    HEX1 <= hex_to_7seg(send_s.data(23 downto 20));
    HEX2 <= hex_to_7seg(send_s.data(27 downto 24));
    HEX3 <= hex_to_7seg(send_s.data(31 downto 28));
    HEX4 <= hex_to_7seg(send_s.addr(3 downto 0));
    HEX5 <= "1111111";

end beh;