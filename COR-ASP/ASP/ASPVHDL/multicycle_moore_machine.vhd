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
        --input control signal
        config_en : in bit_1;
        calculate : in bit_1;
        counter_gr_corr_window : in bit_1;

        --output control signal
        ----address genertor related
        new_ave_addr_en :       out bit_1;
        new_ave_addr_clr :      out bit_1;
        cor_window_ld :         out bit_1;
        counter_en:             out bit_1;
        counter_clr:            out bit_1;
        ave_dm_addr_sel      :  out bit_2;
		correlation_origin_ld:  out bit_1;
		
        ----operation related
        current_ave_data_ld :       out bit_1;
        current_ave_data_clr :      out bit_1;
        multiplicand_temp_ld :      out bit_1;
        multiplicand_temp_clr :      out bit_1;
        offset_h_ld         :       out bit_1;
        cor_pair_product_en :       out bit_1;
        cor_pair_product_clr :       out bit_1;
        cor_temp_en:                out bit_1;
        cor_temp_clr        :       out bit_1;
        ---- configuration related
        config_done         :       out bit_1;

        ---- reset related
        reset_done          :       out bit_1;
        --system output signal
        correlation_rdy:            out bit_1;
        current_state  :            out bit_4
	);
end multicycle_moore_machine;
architecture beh of multicycle_moore_machine is  
    type state_type is (
        S_CONFIG,
        S_INIT,
        S_CAPTURE_NEW_ADDR,
        S_LOAD_ORIGIN,
        S_LOAD1,
        S_LOAD2,
        S_LOAD3,
        S_LOAD4,
        S_MULTIPLY,
        S_ACCUMULATE,
        S_OUTPUT
    );

    signal state, next_state : state_type;
    
begin

    --initialisation and next state update
    process(clk, reset, init)
    begin
        if reset = '1' then
            state <= S_INIT;
            reset_done <= '1';
        elsif init = '1' then
            state <= S_INIT;
            reset_done <= '1';
        elsif rising_edge(clk) then
            state <= next_state;
            reset_done <= '0';
        end if;
    end process;
    
    --next state logic
    process(state,config_en,calculate,counter_gr_corr_window)
    begin
        next_state <= S_INIT;

        case state is
            when S_INIT =>
                if config_en = '1' then
                    next_state <= S_CONFIG;
                elsif calculate = '1' then
                    next_state <= S_CAPTURE_NEW_ADDR;
                else
                    next_state <= S_INIT;
                end if;
            when S_CONFIG =>
                next_state <= S_INIT;
            when S_CAPTURE_NEW_ADDR =>
                next_state <= S_LOAD_ORIGIN;
            when S_LOAD_ORIGIN =>
                next_state <= S_LOAD1;
            when S_LOAD1 =>
                next_state <= S_LOAD2;
            when S_LOAD2 =>
                next_state <= S_LOAD3;
            when S_LOAD3 =>
                next_state <= S_LOAD4;
            when S_LOAD4 => 
                next_state <= S_MULTIPLY;
            when S_MULTIPLY =>
                next_state <= S_ACCUMULATE;
            when S_ACCUMULATE =>
                if  counter_gr_corr_window = '1' then
                    next_state <= S_OUTPUT;
                else
                    next_state <= S_LOAD1;
                end if;
            when S_OUTPUT =>
                next_state <= S_INIT;
            when others =>
                next_state <= S_INIT;
        end case;
    end process;

    --moore machine output logic
    process(state)
    begin
        --output control signal
        ----address genertor related
        new_ave_addr_en <= '0';
        new_ave_addr_clr <= '0';
        cor_window_ld <= '0';
        counter_en <= '0';
        counter_clr <= '0';
        correlation_origin_ld <= '0';
        ave_dm_addr_sel <= "00";     
        ----operation related
        current_ave_data_ld <= '0';
        current_ave_data_clr <= '0';
        multiplicand_temp_ld <= '0';
        multiplicand_temp_clr <= '0';
        offset_h_ld <= '0'; 
        cor_pair_product_en <= '0';
        cor_pair_product_clr <= '0';
        cor_temp_en <= '0';
        cor_temp_clr <= '0';
        ---- configuration related
        config_done <= '0';
        --system output signal
        correlation_rdy <= '0'; 

        case state is
            when S_INIT =>
                correlation_rdy <= '0';
                current_ave_data_clr <= '1';
                multiplicand_temp_clr <= '1';
                cor_pair_product_clr <= '1';
                counter_clr <= '1';
                cor_temp_clr <= '0';

            when S_CONFIG =>
                cor_window_ld <= '1';
                offset_h_ld <= '1';
                cor_temp_clr <= '0';
                config_done <= '1';

            when S_CAPTURE_NEW_ADDR =>
                new_ave_addr_en <= '1';
                counter_clr <= '1';
                cor_temp_clr <= '1';

            when S_LOAD_ORIGIN =>
                correlation_origin_ld <= '1';

            when S_LOAD1 =>
                ave_dm_addr_sel <= ADDR_SEL_RIGHT;
                cor_pair_product_clr <= '1';

            when S_LOAD2 =>
                ave_dm_addr_sel <= ADDR_SEL_LEFT; --dm is processing ADDR_SEL_RIGHT

            when S_LOAD3 =>
                --dm is processing ADDR_SEL_LEFT
                current_ave_data_ld <= '1'; --receive signal from ADDR_SEL_RIGHT
                counter_en <= '1'; -- increment the counter for comparison and next cycle
            when S_LOAD4 =>
                current_ave_data_ld <= '1'; --receive signal from ADDR_SEL_LEFT
                multiplicand_temp_ld <= '1';--receive signal from ADDR_SEL_RIGHT
            when S_MULTIPLY =>
                cor_pair_product_en <= '1';

            when S_ACCUMULATE =>
                cor_temp_en <= '1';

            when S_OUTPUT =>
                correlation_rdy <= '1';

            when others =>
                null;

        end case;
    end process;

    -- output current state for debugging
    process(state)
    begin
        case state is
            when S_INIT =>
                current_state <= "0000";
            when S_CONFIG =>
                current_state <= "0001";
            when S_CAPTURE_NEW_ADDR =>
                current_state <= "0010";
            when S_LOAD_ORIGIN =>
                current_state <= "0011";
            when S_LOAD1 =>
                current_state <= "0100";
            when S_LOAD2 =>
                current_state <= "0101";
            when S_LOAD3 =>
                current_state <= "0110";
            when S_LOAD4 =>
                current_state <= "0111";
            when S_MULTIPLY =>
                current_state <= "1000";
            when S_ACCUMULATE =>
                current_state <= "1001";
            when S_OUTPUT =>
                current_state <= "1010";
            when others =>
                null;

        end case;
    end process;
end beh;