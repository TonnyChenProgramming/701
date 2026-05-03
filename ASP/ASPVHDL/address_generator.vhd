LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.asp_types.all;
USE work.asp_constants.all;

ENTITY address_generator is
	port
	(
        --system control signal
        clk : in bit_1;

        --input data
        new_ave_data_addr :     in bit_9;
        correlation_window_n :  in bit_9;

        --input control signal
        new_ave_addr_en :       in bit_1;
        new_ave_addr_clr :      in bit_1;
        cor_window_ld :         in bit_1;
        counter_en:             in bit_1;
        counter_clr:            in bit_1;
        ave_dm_addr_sel      :  in bit_2;


        --output
        ave_data_mem_addr : out bit_9
	);
end address_generator;
architecture beh of address_generator is  
    signal new_ave_data_addr_ff : bit_9;
    signal correlation_window_n_ff : bit_9;
    signal counter_ff : bit_9;

    signal current_corr_origin : bit_9;
    signal addr_left : bit_9;
    signal addr_right : bit_9;
begin
    -- newest average data address flip flop
	process (clk)
	begin
        if rising_edge(clk) then 
            if (new_ave_addr_clr = '1') then
                new_ave_data_addr_ff <= "000000000";
            elsif(new_ave_addr_en = '1') then
                new_ave_data_addr_ff <= new_ave_data_addr;
            end if;
            
        end if;
	end process;

    -- counter flip flop
    process (clk)
    begin
        if rising_edge(clk) then
            if (cor_window_ld = '1') then
                correlation_window_n_ff <= correlation_window_n;
            end if;
        end if;
    end process;

    --counter flip flop
    process (clk)
    begin
        if rising_edge(clk) then
            if (counter_clr = '1') then
                counter_ff <= "000000000";
            elsif (counter_en = '1') then
                counter_ff <= bit_9(unsigned(counter_ff) + 1);
            end if;
        end if;
    end process;

    -- combinational address calculation
    current_corr_origin <= bit_9(
        unsigned(new_ave_data_addr_ff) - 1 - unsigned(correlation_window_n_ff)
    );

    addr_left <= bit_9(
        unsigned(current_corr_origin) - unsigned(counter_ff) - 1
    );

    addr_right <= bit_9(
        unsigned(current_corr_origin) + unsigned(counter_ff)
    );

    -- combinational address mux
    with ave_dm_addr_sel select
        ave_data_mem_addr <= current_corr_origin when ADDR_SEL_ORIGIN_INIT,
                             addr_left           when ADDR_SEL_LEFT,
                             addr_left           when ADDR_SEL_LEFT_WAIT,
                             addr_right          when ADDR_SEL_RIGHT,
                             "000000000"         when others;
        
end beh;