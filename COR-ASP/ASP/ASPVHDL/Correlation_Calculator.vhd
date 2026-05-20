LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.asp_types.all;
ENTITY Correlation_Calculator is
	port
	(
        clock : in bit_1;
        reset : in bit_1;
        init  : in bit_1;

        reset_done : out bit_1;
        --customised configuration signals
        config_en   :           in bit_1;
		config_done :           out bit_1;
        correlation_window_n :  in bit_9;
        offset_h :              in bit_16;

        average_data_from_mem :          in bit_16;
        calculate   :           in bit_1;
        new_ave_data_addr :     in bit_9;

        ave_data_mem_addr : out bit_9;
        correlation : out bit_36;
        correlation_rdy: out bit_1;
        current_state : out bit_4
	);
end Correlation_Calculator;
architecture beh of Correlation_Calculator is  
    --control signals
    ----address genertor related
    signal new_ave_addr_en : bit_1;
    signal new_ave_addr_clr : bit_1;
    signal cor_window_ld : bit_1;
    signal counter_en : bit_1;
    signal counter_clr : bit_1;
    signal correlation_origin_ld : bit_1;
    signal ave_dm_addr_sel : bit_2;
    signal counter_gr_corr_window : bit_1;

    ----operation related
    signal current_ave_data_ld : bit_1;
    signal current_ave_data_clr : bit_1;
    signal multiplicand_temp_ld : bit_1;
    signal multiplicand_temp_clr : bit_1;
    signal offset_h_ld : bit_1;      
    signal cor_pair_product_en : bit_1;
    signal cor_pair_product_clr : bit_1;
    signal cor_temp_en : bit_1;          
    signal cor_temp_clr : bit_1;
    begin
    u_multicycle_moore_machine : entity work.multicycle_moore_machine
    port map(
        --system control signal
        clk => clock, 
        reset => reset,
        init  => init,
        --input control signal
        config_en => config_en,
        calculate => calculate,
        counter_gr_corr_window => counter_gr_corr_window,

        --output control signal
        ----address genertor related
        new_ave_addr_en => new_ave_addr_en,
        new_ave_addr_clr => new_ave_addr_clr,
        cor_window_ld => cor_window_ld,
        counter_en => counter_en,
        counter_clr => counter_clr,
        ave_dm_addr_sel => ave_dm_addr_sel,
        correlation_origin_ld => correlation_origin_ld,
        ----operation related
        current_ave_data_ld => current_ave_data_ld,
        current_ave_data_clr => current_ave_data_clr,
        multiplicand_temp_ld => multiplicand_temp_ld,
        multiplicand_temp_clr => multiplicand_temp_clr,
        offset_h_ld => offset_h_ld,
        cor_pair_product_en => cor_pair_product_en,
        cor_pair_product_clr => cor_pair_product_clr,
        cor_temp_en => cor_temp_en,
        cor_temp_clr => cor_temp_clr,
        -- configuration related
        config_done => config_done,

        -- reset related
        reset_done => reset_done,
        --system output signal
        correlation_rdy => correlation_rdy,

        --current state for debugging
        current_state => current_state
    );
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
        correlation_origin_ld => correlation_origin_ld,

        --output
        ave_data_mem_addr => ave_data_mem_addr,
        counter_gr_corr_window => counter_gr_corr_window

    );
    

    u_operation : entity work.mac
    port map(
        --system control signal
        clk => clock,
        --input data
        average_data => average_data_from_mem,
        offset_h => offset_h,   
        --input control signal
        current_ave_data_ld => current_ave_data_ld,
        current_ave_data_clr => current_ave_data_clr,
        multiplicand_temp_ld => multiplicand_temp_ld,
        multiplicand_temp_clr => multiplicand_temp_clr,
        offset_h_ld => offset_h_ld,
        cor_pair_product_en => cor_pair_product_en,
        cor_pair_product_clr => cor_pair_product_clr,
        cor_temp_en => cor_temp_en,
        cor_temp_clr => cor_temp_clr,

        --output
        correlation_temp_ff => correlation

    );


        
end beh;

