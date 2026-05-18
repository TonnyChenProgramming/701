LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.asp_types.all;
USE work.asp_constants.all;

ENTITY address_generator is
    port
    (
        -- system control signal
        clk : in bit_1;

        -- input data
        new_ave_data_addr    : in bit_9;
        correlation_window_n : in bit_9;

        -- input control signal
        new_ave_addr_en       : in bit_1;
        new_ave_addr_clr      : in bit_1;
        cor_window_ld         : in bit_1;
        counter_en            : in bit_1;
        counter_clr           : in bit_1;
        correlation_origin_ld : in bit_1;
        ave_dm_addr_sel       : in bit_2;

        -- output
        counter_gr_corr_window : out bit_1;
        ave_data_mem_addr      : out bit_9
    );
end address_generator;

architecture beh of address_generator is

    --------------------------------------------------------------------
    -- Default initial values.
    --
    -- This prevents the simulator from starting these registers as U.
    -- In Intel FPGA flow this is usually synthesizable as power-up value,
    -- but adding a real reset input would still be cleaner long-term.
    --------------------------------------------------------------------
    signal new_ave_data_addr_ff     : bit_9 := (others => '0');
    signal correlation_window_n_ff  : bit_9 := (others => '0');
    signal counter_ff               : bit_9 := (others => '0');
    signal current_corr_origin_ff   : bit_9 := (others => '0');

    signal addr_left                : bit_9 := (others => '0');
    signal addr_right               : bit_9 := (others => '0');

begin

    --------------------------------------------------------------------
    -- Newest average data address register
    --------------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if new_ave_addr_clr = '1' then
                new_ave_data_addr_ff <= (others => '0');

            elsif new_ave_addr_en = '1' then
                new_ave_data_addr_ff <= new_ave_data_addr;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Correlation window register
    --------------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if cor_window_ld = '1' then
                correlation_window_n_ff <= correlation_window_n;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Counter register
    --------------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if counter_clr = '1' then
                counter_ff <= (others => '0');

            elsif counter_en = '1' then
                counter_ff <= bit_9(unsigned(counter_ff) + 1);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Correlation origin register
    --
    -- Original formula:
    --   origin = new_ave_data_addr_ff - 1 - correlation_window_n_ff
    --
    -- Protection:
    --   If new_ave_data_addr_ff is not large enough, force origin to 0.
    --   This avoids unsigned underflow, e.g. 0 - 1 - window.
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if new_ave_addr_clr = '1' then
                current_corr_origin_ff <= (others => '0');

            elsif correlation_origin_ld = '1' then

                if unsigned(new_ave_data_addr_ff) >
                   unsigned(correlation_window_n_ff) then

                    current_corr_origin_ff <= bit_9(
                        unsigned(new_ave_data_addr_ff)
                        - 1
                        - unsigned(correlation_window_n_ff)
                    );

                else
                    current_corr_origin_ff <= (others => '0');
                end if;

            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Safe left address calculation
    --
    -- Original formula:
    --   addr_left = current_corr_origin_ff - counter_ff - 1
    --
    -- Protection:
    --   If current_corr_origin_ff is not large enough, force addr_left to 0.
    --------------------------------------------------------------------
    process(current_corr_origin_ff, counter_ff)
    begin
        addr_left <= (others => '0');

        if unsigned(current_corr_origin_ff) > unsigned(counter_ff) then
            addr_left <= bit_9(
                unsigned(current_corr_origin_ff)
                - unsigned(counter_ff)
                - 1
            );
        else
            addr_left <= (others => '0');
        end if;
    end process;

    --------------------------------------------------------------------
    -- Safe right address calculation
    --
    -- Original formula:
    --   addr_right = current_corr_origin_ff + counter_ff
    --
    -- This can still overflow if the sum exceeds 511. For now it wraps,
    -- which matches normal unsigned hardware behaviour. If you want to
    -- clamp it, we can add another guard.
    --------------------------------------------------------------------
    addr_right <= bit_9(
        unsigned(current_corr_origin_ff) + unsigned(counter_ff)
    );

    --------------------------------------------------------------------
    -- Combinational address mux
    --
    -- Default output is always 0.
    -- This prevents RAM rdaddress from becoming U when the selector is
    -- invalid or when no real memory read should happen.
    --------------------------------------------------------------------
    process(
        ave_dm_addr_sel,
        current_corr_origin_ff,
        addr_left,
        addr_right
    )
    begin
        ave_data_mem_addr <= (others => '0');

        case ave_dm_addr_sel is

            when ADDR_SEL_ORIGIN_INIT =>
                ave_data_mem_addr <= current_corr_origin_ff;

            when ADDR_SEL_LEFT =>
                ave_data_mem_addr <= addr_left;

            when ADDR_SEL_LEFT_WAIT =>
                ave_data_mem_addr <= addr_left;

            when ADDR_SEL_RIGHT =>
                ave_data_mem_addr <= addr_right;

            when others =>
                ave_data_mem_addr <= (others => '0');

        end case;
    end process;

    --------------------------------------------------------------------
    -- Control signal for Moore machine
    --
    -- Safe because both counter_ff and correlation_window_n_ff now start
    -- at deterministic zero.
    --------------------------------------------------------------------
    counter_gr_corr_window <= '1'
        when unsigned(counter_ff) >= unsigned(correlation_window_n_ff)
        else '0';

end beh;