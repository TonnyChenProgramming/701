library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_types.all;
use work.TdmaMinTypes.all;
use work.asp_packet_pkg.all;

-- Standalone Member C integration top.
--
-- This is a compact TDMA-style NoC harness for ASP data-path evidence:
--
--   mock ReCOP/Nios packet source
--       -> router
--       -> ADC ASP -> AVG ASP -> COR ASP -> Peak ASP
--       -> mock ReCOP/Nios packet sink
--
-- It intentionally keeps the ReCOP instruction upload and Nios Avalon-MM
-- adapter out of scope. Member A/B can replace mock_send/mock_recv with their
-- real NoC ports later without changing the ASP address contract.
entity gp2_asp_noc_top is
    port (
        clock : in  bit_1;
        reset : in  bit_1;
        init  : in  bit_1;

        mock_send : in  tdma_min_port;
        mock_recv : out tdma_min_port;

        debug_route    : out tdma_min_port;
        debug_adc_send : out tdma_min_port;
        debug_avg_send : out tdma_min_port;
        debug_cor_send : out tdma_min_port;
        debug_pk_send  : out tdma_min_port
    );
end entity gp2_asp_noc_top;

architecture rtl of gp2_asp_noc_top is
    constant NULL_TDMA_PORT : tdma_min_port := (
        addr => NULL_ADDR,
        data => (others => '0')
    );

    signal route_reg : tdma_min_port := NULL_TDMA_PORT;

    signal ext_pending : tdma_min_port := NULL_TDMA_PORT;
    signal adc_pending : tdma_min_port := NULL_TDMA_PORT;
    signal avg_pending : tdma_min_port := NULL_TDMA_PORT;
    signal cor_pending : tdma_min_port := NULL_TDMA_PORT;
    signal pk_pending  : tdma_min_port := NULL_TDMA_PORT;

    signal slot_r : natural range 0 to 4 := 0;

    signal adc_recv : tdma_min_port := NULL_TDMA_PORT;
    signal avg_recv : tdma_min_port := NULL_TDMA_PORT;
    signal cor_recv : tdma_min_port := NULL_TDMA_PORT;
    signal pk_recv  : tdma_min_port := NULL_TDMA_PORT;

    signal adc_send : tdma_min_port := NULL_TDMA_PORT;
    signal avg_send : tdma_min_port := NULL_TDMA_PORT;
    signal cor_send : tdma_min_port := NULL_TDMA_PORT;
    signal pk_send  : tdma_min_port := NULL_TDMA_PORT;

    function is_active_port(p : tdma_min_port) return boolean is
    begin
        return p.addr /= NULL_ADDR;
    end function;
begin
    ------------------------------------------------------------------------
    -- Route decode: present the registered NoC packet only to its destination.
    ------------------------------------------------------------------------
    adc_recv <= route_reg when route_reg.addr = ADC_ADDR else NULL_TDMA_PORT;
    avg_recv <= route_reg when route_reg.addr = AVE_ASP_ADDR else NULL_TDMA_PORT;
    cor_recv <= route_reg when route_reg.addr = COR_ASP_ADDR else NULL_TDMA_PORT;
    pk_recv  <= route_reg when route_reg.addr = PK_ADDR else NULL_TDMA_PORT;

    mock_recv <= route_reg when route_reg.addr = RECOP_ADDR
                           or route_reg.addr = NIOS_II_ADDR
                           or route_reg.addr = IDLE_ADDR
                 else NULL_TDMA_PORT;

    debug_route    <= route_reg;
    debug_adc_send <= adc_send;
    debug_avg_send <= avg_send;
    debug_cor_send <= cor_send;
    debug_pk_send  <= pk_send;

    ------------------------------------------------------------------------
    -- TDMA-style router with one mailbox per source.
    --
    -- The existing ASP wrappers do not expose ready/valid on tdma_min_port, so
    -- each source gets a one-entry capture register. A five-slot TDMA schedule
    -- then forwards one pending packet per cycle in a repeatable order:
    -- external/mock, ADC, AVG, COR, PK.
    --
    -- Continuous sample streams must be configured within this slot bandwidth.
    -- For the ADC virtual source, sample_divider=4 gives one sample roughly per
    -- TDMA frame, so the AVG stage receives consecutive source samples.
    ------------------------------------------------------------------------
    process(clock)
        variable ext_next   : tdma_min_port;
        variable adc_next   : tdma_min_port;
        variable avg_next   : tdma_min_port;
        variable cor_next   : tdma_min_port;
        variable pk_next    : tdma_min_port;
        variable route_next : tdma_min_port;
    begin
        if rising_edge(clock) then
            if reset = '1' or init = '1' then
                ext_pending <= NULL_TDMA_PORT;
                adc_pending <= NULL_TDMA_PORT;
                avg_pending <= NULL_TDMA_PORT;
                cor_pending <= NULL_TDMA_PORT;
                pk_pending  <= NULL_TDMA_PORT;
                route_reg   <= NULL_TDMA_PORT;
                slot_r      <= 0;
            else
                ext_next := ext_pending;
                adc_next := adc_pending;
                avg_next := avg_pending;
                cor_next := cor_pending;
                pk_next  := pk_pending;

                if is_active_port(mock_send) and not is_active_port(ext_next) then
                    ext_next := mock_send;
                end if;

                if is_active_port(adc_send) and not is_active_port(adc_next) then
                    adc_next := adc_send;
                end if;

                if is_active_port(avg_send) and not is_active_port(avg_next) then
                    avg_next := avg_send;
                end if;

                if is_active_port(cor_send) and not is_active_port(cor_next) then
                    cor_next := cor_send;
                end if;

                if is_active_port(pk_send) and not is_active_port(pk_next) then
                    pk_next := pk_send;
                end if;

                route_next := NULL_TDMA_PORT;

                case slot_r is
                    when 0 =>
                        route_next := ext_next;
                        ext_next := NULL_TDMA_PORT;
                    when 1 =>
                        route_next := adc_next;
                        adc_next := NULL_TDMA_PORT;
                    when 2 =>
                        route_next := avg_next;
                        avg_next := NULL_TDMA_PORT;
                    when 3 =>
                        route_next := cor_next;
                        cor_next := NULL_TDMA_PORT;
                    when others =>
                        route_next := pk_next;
                        pk_next := NULL_TDMA_PORT;
                end case;

                route_reg   <= route_next;
                ext_pending <= ext_next;
                adc_pending <= adc_next;
                avg_pending <= avg_next;
                cor_pending <= cor_next;
                pk_pending  <= pk_next;

                if slot_r = 4 then
                    slot_r <= 0;
                else
                    slot_r <= slot_r + 1;
                end if;
            end if;
        end if;
    end process;

    u_adc : entity work.adc_asp
        port map (
            clock => clock,
            reset => reset,
            init  => init,
            send  => adc_send,
            recv  => adc_recv
        );

    u_avg : entity work.avg_asp
        port map (
            clock => clock,
            reset => reset,
            init  => init,
            send  => avg_send,
            recv  => avg_recv
        );

    u_cor : entity work.Correlation_ASP
        port map (
            clock => clock,
            reset => reset,
            init  => init,
            send  => cor_send,
            recv  => cor_recv
        );

    u_peak : entity work.PeakDetector_ASP
        port map (
            clock => clock,
            reset => reset,
            init  => init,
            send  => pk_send,
            recv  => pk_recv
        );
end architecture rtl;
