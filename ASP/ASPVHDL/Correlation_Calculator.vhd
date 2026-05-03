LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.asp_types.all;
ENTITY Correlation_Calculator is
	port
	(
        clock : in bit_1;
        reset : in bit_1;
        init  : in bit_1;

        average_data :          in bit_16;
        calculate   :           in bit_1;
        new_ave_data_addr :     in bit_9;

        ave_data_mem_addr : out bit_9;
        correlation : out bit_36;
        correlation_rdy: out bit_1
	);
end Correlation_Calculator;
architecture beh of Correlation_Calculator is  
    --configurable signals
    signal config_en  : bit_1;
    signal correlation_window_n : bit_9;
    signal offset_h : bit_16;

    --dm related
    signal dm_data_in : bit_16;
    signal dm_rd_addr : bit_9;
    signal dm_wr_addr : bit_9;
    signal dm_wren    : bit_1;
    signal dm_data_out : bit_16;
    --control signals
    ----address genertor related
    signal new_ave_addr_en : bit_1;
    signal new_ave_addr_clr : bit_1;
    signal cor_window_ld : bit_1;
    signal counter_en : bit_1;
    signal counter_clr : bit_1;
    signal ave_dm_addr_sel : bit_2;

    ----operation related
    signal current_ave_data_ld : bit_1;
    signal multiplicand_temp_ld : bit_1;
    signal offset_h_ld : bit_1;      
    signal cor_pair_product_en : bit_1;
    signal cor_temp_en : bit_1;          
    signal cor_temp_clr : bit_1;
    begin
    u_address_generator : entity work.address_generator
    port map(
        --system control signal
        clk => clock,

        --input data
        new_ave_data_addr => new_ave_data_addr,
        correlation_window_n => correlation_window_n,

        --input control signal
        new_ave_addr_en => new_ave_addr_en,
        new_ave_addr_clr => new_ave_addr_clr,
        cor_window_ld => cor_window_ld,
        counter_en => counter_en,
        counter_clr => counter_clr,
        ave_dm_addr_sel => ave_dm_addr_sel,


        --output
        ave_data_mem_addr => ave_data_mem_addr
    );
    
    u_memory : entity work.AverageFilteredData
    port map(
        clock => clock,
		data => dm_data_in,
		rdaddress => dm_rd_addr,	
		wraddress => dm_wr_addr,	
		wren => dm_wren,		
		q => dm_data_out		
    );

    u_operation : entity work.mac
    port map(
        --system control signal
        clk => clock,
        --input data
        average_data => average_data,
        offset_h => offset_h,   
        --input control signal
        current_ave_data_ld => current_ave_data_ld,
        multiplicand_temp_ld => multiplicand_temp_ld,
        offset_h_ld => offset_h_ld,
        cor_pair_product_en => cor_pair_product_en,
        cor_temp_en => cor_temp_en,
        cor_temp_clr => cor_temp_clr,

        --output
        correlation_temp_ff => correlation

    );


        
end beh;

