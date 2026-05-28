LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

USE work.asp_types.all;
USE work.TdmaMinTypes.all;
USE work.asp_packet_pkg.all;

ENTITY CorAspDecoder is
	port
	(
        -- system signal
		clock : in bit_1;

        -- packet input from NoC
        recv : in tdma_min_port;

        -- mode output
        -- '1' = direct passthrough mode
        -- '0' = correlation processing mode
        direct_passthrough_en : out bit_1;
        
        -- RAM write interface
		dm_data_in : out bit_16;
		dm_wr_addr : out bit_9;
		dm_wren    : out bit_1;

        -- correlation control
        calculate : out bit_1;
        new_ave_data_addr : out bit_9;
        config_en : out bit_1;
        correlation_window_n : out bit_9;
        offset_h : out bit_16;

        -- config handshake from core
        config_done : in bit_1;
        config_done_status_reg : out bit_1;
        -- status transmit handshake
        status_transmit_done : in bit_1;
        status_pending : out bit_1;

        -- clear handshake
        reset_done    : in bit_1;
        reset_done_status_reg : out bit_1;
        reset_request : out bit_1
	);
END CorAspDecoder;

ARCHITECTURE beh OF CorAspDecoder IS

    signal mode_reg : bit_1 := MODE_PASS_THROUGH;

    signal window_reg : bit_9  := (others => '0');
    signal offset_reg : bit_16 := (others => '0');

    signal next_write_addr_reg : bit_9 := "111111111";

    signal config_pending_reg    : bit_1 := '0';
    signal calculate_pending_reg : bit_1 := '0';

    signal status_pending_reg : bit_1 := '0';
    signal reset_request_reg  : bit_1 := '0';

BEGIN

    --------------------------------------------------------------------
    -- Stable registered outputs
    --------------------------------------------------------------------
    correlation_window_n <= window_reg;
    offset_h <= offset_reg;

    new_ave_data_addr <= next_write_addr_reg;
    dm_wr_addr <= next_write_addr_reg;

    config_en <= config_pending_reg;
    direct_passthrough_en <= mode_reg;

    status_pending <= status_pending_reg;
    reset_request <= reset_request_reg;

    --------------------------------------------------------------------
    -- Packet decoder / mode controller
    --------------------------------------------------------------------
    process(clock)
    begin
        if rising_edge(clock) then

            ------------------------------------------------------------
            -- Default one-cycle pulse outputs
            ------------------------------------------------------------
            dm_wren <= '0';
            calculate <= '0';

            ------------------------------------------------------------
            -- Handshake 1: config handshake
            -- Decoder raises config_pending_reg.
            -- Core raises config_done after loading window/offset.
            ------------------------------------------------------------
            if config_done = '1' then
                config_pending_reg <= '0';
                config_done_status_reg <= '1';
                status_pending_reg <= '1';

            end if;

            ------------------------------------------------------------
            -- Handshake 2: status transmit handshake
            -- Decoder raises status_pending_reg after command handling.
            -- Status encoder/transmitter clears it with status_transmit_done.
            ------------------------------------------------------------
            if status_transmit_done = '1' then
                status_pending_reg <= '0';
                reset_done_status_reg <= '0';
                config_done_status_reg <= '0';
            end if;

            ------------------------------------------------------------
            -- Handshake 3: clear/reset request handshake
            -- Decoder raises reset_request_reg after CMD_CLEAR.
            -- Core/wrapper clears it with reset_done.
            ------------------------------------------------------------
            if reset_done = '1' then
                reset_request_reg <= '0';
                reset_done_status_reg <= '1';
                status_pending_reg <= '1';
            end if;

            ------------------------------------------------------------
            -- Delayed calculate pulse
            ------------------------------------------------------------
            if calculate_pending_reg = '1' then
                calculate <= '1';
                calculate_pending_reg <= '0';
            end if;

            ------------------------------------------------------------
            -- Decode incoming packet
            ------------------------------------------------------------
            case packet_kind(recv.data) is

                --------------------------------------------------------
                -- Command packet from ReCOP / controller
                --------------------------------------------------------
                when PKT_KIND_CMD =>

                    case packet_code(recv.data) is

                        when CMD_NOP =>
                            status_pending_reg <= '1';

                        ------------------------------------------------
                        -- CONFIG command
                        --
                        -- tag = TAG_WINDOW: window
                        -- tag = TAG_OFFSET: offset_h
                        ------------------------------------------------
                        when CMD_CONFIG =>

                            case packet_tag(recv.data) is

                                when TAG_WINDOW =>
                                    window_reg <= bit_9(packet_payload(recv.data)(8 downto 0));
                                    config_pending_reg <= '1';


                                when TAG_OFFSET =>
                                    offset_reg <= bit_16(packet_payload(recv.data)(15 downto 0));
                                    config_pending_reg <= '1';
                                    

                                when others =>
                                    null;

                            end case;

                        ------------------------------------------------
                        -- START command
                        -- Switch to correlation processing mode.
                        ------------------------------------------------
                        when CMD_START =>
                            mode_reg <= MODE_CORRELATION;
                            status_pending_reg <= '1';

                        ------------------------------------------------
                        -- STOP command
                        -- Switch back to direct passthrough mode.
                        ------------------------------------------------
                        when CMD_STOP =>
                            mode_reg <= MODE_PASS_THROUGH;
                            calculate_pending_reg <= '0';
                            status_pending_reg <= '1';

                        ------------------------------------------------
                        -- CLEAR command
                        -- Packet-level soft reset request.
                        ------------------------------------------------
                        when CMD_CLEAR =>
                            mode_reg <= MODE_PASS_THROUGH;
                            next_write_addr_reg <= "111111111";

                            config_pending_reg <= '0';
                            calculate_pending_reg <= '0';

                            reset_request_reg <= '1';

                            dm_data_in <= (others => '0');

                        when others =>
                            null;

                    end case;

                --------------------------------------------------------
                -- DATA packet from AVG-ASP
                --
                -- In direct passthrough mode:
                --   do nothing internally.but only passing the data to dm_data_in
                --
                -- In correlation mode:
                --   write sample to RAM
                --   update next write address
                --   trigger calculate on following cycle
                --------------------------------------------------------
                when PKT_KIND_DATA =>

                    if mode_reg = MODE_CORRELATION then

                        dm_data_in <= bit_16(packet_payload(recv.data)(15 downto 0));
                        dm_wren <= '1';

                        next_write_addr_reg <= bit_9(unsigned(next_write_addr_reg) + 1);

                        calculate_pending_reg <= '1';

                    else
                        dm_data_in <= bit_16(packet_payload(recv.data)(15 downto 0));
                    end if;

                --------------------------------------------------------
                -- STATUS / EVENT ignored by COR decoder
                --------------------------------------------------------
                when PKT_KIND_STATUS =>
                    null;

                when PKT_KIND_EVENT =>
                    null;

                when others =>
                    null;

            end case;

        end if;
    end process;

END beh;