LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.asp_types.all;
USE work.asp_constants.all;

ENTITY mac is
	port
	(
        --system control signal
        clk : in bit_1;

        --input data
        average_data :     in bit_16;
        offset_h     :     in bit_16;
        --input control signal
        current_ave_data_ld :       in bit_1;
        multiplicand_temp_ld :      in bit_1;
        offset_h_ld         :       in bit_1;
        cor_pair_product_en :       in bit_1;
        cor_temp_en:                in bit_1;
        cor_temp_clr        :       in bit_1;

        --output
        correlation_temp_ff :       out bit_36
	);
end mac;
architecture beh of mac is  
    signal offset_h_ff : bit_16;
    signal current_ave_data_ff : bit_17;
    signal multiplicand_temp_ff : bit_17;
    signal cor_pair_product_ff : bit_34;
    signal correlation_temp_ff_i  : bit_36;
begin
    -- offset h flip flop
	process (clk)
	begin
        if rising_edge(clk) then 
            if (offset_h_ld  = '1') then
                offset_h_ff <= offset_h;
            end if;
            
        end if;
	end process;

    -- current average data flip flop
    process (clk)
    begin
        if rising_edge(clk) then
            if (current_ave_data_ld = '1') then
                current_ave_data_ff <= bit_17(resize(unsigned(average_data), 17) + resize(unsigned(offset_h_ff), 17));
            end if;
        end if;
    end process;

    --multiplicand temporary flip flop
    process (clk)
    begin
        if rising_edge(clk) then
            if (multiplicand_temp_ld = '1') then
                multiplicand_temp_ff <= current_ave_data_ff;
            end if;
        end if;
    end process;

    --correlation pair product flip flop
    process (clk)
    begin
        if rising_edge(clk) then
            if (cor_pair_product_en = '1') then
                cor_pair_product_ff <= bit_34(unsigned(current_ave_data_ff) * unsigned(multiplicand_temp_ff));
            end if;
        end if;
    end process;

    --correlation temporary accumulator flip flop
    process (clk)
    begin
        if rising_edge(clk) then
            if (cor_temp_clr = '1') then
                correlation_temp_ff_i <= (others => '0');
            elsif (cor_temp_en = '1') then
                correlation_temp_ff_i <= bit_36(unsigned(correlation_temp_ff_i) + resize(unsigned(cor_pair_product_ff), 36));
            end if;
        end if;
    end process;
    correlation_temp_ff <= correlation_temp_ff_i;

        
end beh;