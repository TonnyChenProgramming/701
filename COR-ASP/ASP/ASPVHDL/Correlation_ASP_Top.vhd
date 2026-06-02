LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.asp_types.all;

ENTITY Correlation_ASP_Top is
	port
	(
        --system signal
		clock		: in bit_1;
        init        : in bit_1;
        reset       : in bit_1;

        -- dm input signal
		dm_data_in		: in bit_16;
		dm_wr_addr  	: in bit_9;
		dm_wren		: in bit_1;

        -- correlation signals
        calculate   : in bit_1;
        new_ave_data_addr : in bit_9;
        config_en         : in bit_1;
        correlation_window_n :  in bit_9;
        offset_h :              in bit_16;

        correlation : out bit_36;
        correlation_rdy: out bit_1
	);
END Correlation_ASP_Top;

--circular buffer!!!!!
architecture beh of Correlation_ASP_Top is  
    signal dm_rd_addr    : bit_9;
    signal average_data_from_mem  : bit_16;
    signal current_state : bit_4;
begin

    u_memory : entity work.AverageFilteredData
    port map(
        clock => clock,
		data => dm_data_in,
		rdaddress => dm_rd_addr,	
		wraddress => dm_wr_addr,	
		wren => dm_wren,		
		q => average_data_from_mem		
    );
    u_correlation_calculator : entity work.Correlation_Calculator
    port map(
        clock => clock,
        reset => reset,
        init => init,

        --customised control signals
        config_en   => config_en,
        correlation_window_n => correlation_window_n,
        offset_h => offset_h,

        average_data_from_mem => average_data_from_mem,
        calculate => calculate,
        new_ave_data_addr => new_ave_data_addr,

        ave_data_mem_addr => dm_rd_addr,
        correlation => correlation,
        correlation_rdy => correlation_rdy,
        current_state => current_state
    );
end beh;