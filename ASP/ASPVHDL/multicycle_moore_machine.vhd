LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.asp_types.all;
USE work.asp_constants.all;

ENTITY multicycle_moore_machine is
	port
	(
        --system control signal
        clk : in bit_1;
        reset : in bit_1;
        init  : in bit_1;
        --input data
        calculate : in bit_1;

        --output control signal
        ----address genertor related
        new_ave_addr_en :       out bit_1;
        new_ave_addr_clr :      out bit_1;
        cor_window_ld :         out bit_1;
        counter_en:             out bit_1;
        counter_clr:            out bit_1;
        ave_dm_addr_sel      :  out bit_2;
        ----operation related
        current_ave_data_ld :       out bit_1;
        multiplicand_temp_ld :      out bit_1;
        offset_h_ld         :       out bit_1;
        cor_pair_product_en :       out bit_1;
        cor_temp_en:                out bit_1;
        cor_temp_clr        :       out bit_1;

        --system output signal
        correlation_rdy:            out bit_1
	);
end multicycle_moore_machine;
architecture beh of multicycle_moore_machine is  
    type state_type is (
        S_CONFIG,
        S_INIT,
        S_NEW_CORR,
        S_LOAD1,
        S_LOAD2,
        S_MULTIPLY,
        S_ACCUMULATE,
        S_OUTPUT
    );

    signal state, next_state : state_type;
begin
        
end beh;