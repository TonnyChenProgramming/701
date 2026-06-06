LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.asp_types.all;
USE work.asp_constants.all;
USE work.TdmaMinTypes.all;
USE work.asp_packet_pkg.all;

ENTITY CorAspEncoder is
	port
	(
        clock : in bit_1;
        reset : in bit_1;

        send  : out tdma_min_port;

        config_done_reg : in bit_1;
        reset_done_reg  : in bit_1;

        direct_passthrough_en   : in bit_1;
        direct_passthrough_data : in bit_16;

        status_pending       : in bit_1;
        status_transmit_done : out bit_1;

        correlation     : in bit_36;
        correlation_rdy : in bit_1
	);
END CorAspEncoder;

architecture beh of CorAspEncoder is
    signal double_packet_flag : bit_1 := '0';
    signal correlation_reg    : bit_36 := (others => '0');

begin

    process(clock)
    begin
        if rising_edge(clock) then

            ------------------------------------------------------------
            -- Default idle
            ------------------------------------------------------------
            send.addr <= (others => '0');
            send.data <= (others => '0');

            status_transmit_done <= '0';

            if reset = '1' then
                send.addr <= NULL_ADDR;
                send.data <= (others => '0');
                status_transmit_done <= '0';
                double_packet_flag <= '0';
                correlation_reg <= (others => '0');
            else

            ------------------------------------------------------------
            -- Priority 1: finish second correlation packet
            ------------------------------------------------------------
            if double_packet_flag = '1' then

                send.addr <= PK_ADDR;

                send.data <= make_packet(
                    kind    => PKT_KIND_DATA,
                    code    => TAG_RESULT_HIGH,
                    dest    => COR_ASP_ADDR(3 downto 0),
                    payload => "0000" & std_logic_vector(correlation_reg(35 downto 20))
                );

                double_packet_flag <= '0';

            ------------------------------------------------------------
            -- Priority 2: status response
            ------------------------------------------------------------
            elsif status_pending = '1' then

                send.addr <= RECOP_ADDR;

                send.data <= make_packet(
                    kind    => PKT_KIND_STATUS,
                    code    => TAG_STATUS,
                    dest    => COR_ASP_ADDR(3 downto 0),
                    payload => "00000000000000000" & config_done_reg & direct_passthrough_en & reset_done_reg
                );

                status_transmit_done <= '1';

            ------------------------------------------------------------
            -- Priority 3: correlation result low packet
            ------------------------------------------------------------
            elsif correlation_rdy = '1' then

                correlation_reg <= correlation;

                send.addr <= PK_ADDR;

                send.data <= make_packet(
                    kind    => PKT_KIND_DATA,
                    code    => TAG_RESULT_LOW,
                    dest    => COR_ASP_ADDR(3 downto 0),
                    payload => std_logic_vector(correlation(19 downto 0))
                );

                double_packet_flag <= '1';

            ------------------------------------------------------------
            -- Priority 4: direct passthrough
            ------------------------------------------------------------
            elsif direct_passthrough_en = '1' then

                send.addr <= PK_ADDR;

                send.data <= make_packet(
                    kind    => PKT_KIND_DATA,
                    code    => TAG_DIRECT_DATA,
                    dest    => COR_ASP_ADDR(3 downto 0),
                    payload => "0000" & direct_passthrough_data
                );

            else
                double_packet_flag <= '0';
                send.addr <= NULL_ADDR;
                send.data <= (others => '0');
            end if;
            end if;

        end if;
    end process;

end beh;
