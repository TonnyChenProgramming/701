LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.asp_types.all;
use work.TdmaMinTypes.all;

entity Correlation_ASP is
	port (
		clock : in  bit_1;
		reset : in bit_1;
		init  : in bit_1;

		send  : out tdma_min_port;
		recv  : in  tdma_min_port
	);
end entity;

architecture rtl of Correlation_ASP is
    signal asp_reset  : bit_1;
    signal core_reset : bit_1;

	-- config handshake from core
	signal config_done : bit_1;
    signal config_done_status_reg : bit_1;

    signal direct_passthrough_en : bit_1;
    -- status transmit handshake between decoder and encoder
    signal status_transmit_done :  bit_1;
    signal status_pending : bit_1;
    
    -- reset handshake
    signal reset_done : bit_1;
    signal reset_request : bit_1;
    signal reset_done_status_reg : bit_1;
    -- RAM write interface
	signal dm_data_in : bit_16 := x"0000";
	signal dm_wr_addr :  bit_9;
	signal dm_wren    : bit_1;
	signal dm_rd_addr    : bit_9 := "000000000";
    signal average_data_from_mem  : bit_16;


    -- correlation control
    signal calculate : bit_1;
    signal new_ave_data_addr : bit_9;
    signal config_en : bit_1;
    signal correlation_window_n : bit_9;
    signal offset_h :  bit_16;

	--corelation status signals
	signal current_state : bit_4;

	--corelation output signals
	
    signal correlation : bit_36;
    signal correlation_rdy : bit_1;
begin
    asp_reset <= reset or init;
    core_reset <= reset or reset_request;

	u_decoder : entity work.CorAspDecoder
    port map(
        clock => clock,
        reset => asp_reset,

        recv => recv,

        direct_passthrough_en => direct_passthrough_en,

		dm_data_in => dm_data_in,
		dm_wr_addr => dm_wr_addr,
		dm_wren => dm_wren,

        calculate => calculate,
        new_ave_data_addr => new_ave_data_addr,
        config_en =>config_en,
        correlation_window_n => correlation_window_n,
        offset_h => offset_h,

        config_done => config_done,
        config_done_status_reg => config_done_status_reg,

        status_transmit_done => status_transmit_done,
        status_pending => status_pending,

        reset_done => reset_done,
        reset_done_status_reg => reset_done_status_reg,
        reset_request => reset_request
    );
    u_encoder : entity work.CorAspEncoder
    port map (
        clock => clock,
        reset => asp_reset,

        send => send,  

        config_done_reg => config_done_status_reg,
        reset_done_reg =>reset_done_status_reg,

        direct_passthrough_en  => direct_passthrough_en,
        direct_passthrough_data => dm_data_in,

        status_pending => status_pending,
        status_transmit_done => status_transmit_done,

        correlation => correlation,
        correlation_rdy => correlation_rdy

    );

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
        reset => core_reset,
        init => init,

        --reset done
        reset_done => reset_done,
        --customised control signals
        config_en   => config_en,
		config_done => config_done,
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


end architecture;
