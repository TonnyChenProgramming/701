library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.opcodes.all;

entity multicycle_moore_machine is
    port (
        clk      : in  bit_1;
        init     : in  bit_1;
        reset    : in  bit_1;

        opcode   : in  bit_8;
        rz       : in  bit_16;
        z_flag   : in  bit_1;

        state_bits : out bit_3;
        -- Register File
        ld_r         : out bit_1;
        rf_input_sel : out bit_3;
        dprr_wren    : out bit_1;

        -- Special registers
        dpcr_lsb_sel : out bit_1;
        dpcr_wr      : out bit_1;
        er_wr        : out bit_1;
        er_clr       : out bit_1;
        eot_wr       : out bit_1;
        eot_clr      : out bit_1;
        svop_wr      : out bit_1;
        sop_wr       : out bit_1;
        irq_wr       : out bit_1;
        irq_clr      : out bit_1;
        result_wen   : out bit_1;
        result       : out bit_1;

        -- ALU
        alu_operation : out bit_3;
        alu_op1_sel   : out bit_2;
        alu_op2_sel   : out bit_1;
        clr_z_flag    : out bit_1;

        -- Data Memory
        dm_wr_en    : out bit_1;
        dm_addr_sel : out bit_2;
        dm_data_sel : out bit_2;

        -- Branch / PC
        pc_sel      : out bit_2;
        pc_write    : out bit_1
    );
end entity;

architecture beh of multicycle_moore_machine is

    type state_type is (
        S_FETCH,
        S_DECODE,
        S_EXECUTE,
        S_MEM_READ,
        S_MEM_WRITE,
        S_WRITEBACK
    );

    signal state, next_state : state_type;

begin

    ----------------------------------------------------------------
    -- 1) State register
    ----------------------------------------------------------------
    process(clk, reset, init)
    begin
        if reset = '1' then
            state <= S_FETCH;
            --pc_sel <= pc_sel_from_zero;
        elsif init = '1' then
            state <= S_FETCH;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    ----------------------------------------------------------------
    -- 2) Next-state logic
    -- Minimum 3 cycles:
    --   FETCH -> DECODE -> EXECUTE/MEM_WRITE -> FETCH
    -- Maximum 4 cycles:
    --   FETCH -> DECODE -> EXECUTE/MEM_READ -> WRITEBACK -> FETCH
    ----------------------------------------------------------------
    process(state, opcode)
    begin
        next_state <= S_FETCH;

        case state is
            when S_FETCH =>
                next_state <= S_DECODE;

            when S_DECODE =>
                case opcode(7 downto 6) is

                    when am_inherent =>
                        -- clfz / noop
                        next_state <= S_EXECUTE;

                    when am_immediate =>
                        case opcode(5 downto 0) is
                            when str =>
                                next_state <= S_MEM_WRITE;  -- 3-cycle store
                            when ldr | andr | orr | addr | subvr =>
                                next_state <= S_EXECUTE;    -- may WB after execute
                            when subr | jmp | present | sz | datacall2 =>
                                next_state <= S_EXECUTE;    -- no WB
                            when others =>
                                next_state <= S_EXECUTE;
                        end case;

                    when am_direct =>
                        case opcode(5 downto 0) is
                            when ldr =>
                                next_state <= S_MEM_READ;   -- 4-cycle load
                            when str | strpc =>
                                next_state <= S_MEM_WRITE;  -- 3-cycle store
                            when lsip =>
                                next_state <= S_EXECUTE;    -- then WB
                            when ssop =>
                                next_state <= S_EXECUTE;    -- no WB
                            when others =>
                                next_state <= S_EXECUTE;
                        end case;

                    when am_register =>
                        case opcode(5 downto 0) is
                            when ldr =>
                                next_state <= S_MEM_READ;   -- 4-cycle load
                            when str =>
                                next_state <= S_MEM_WRITE;  -- 3-cycle store
                            when andr | orr | addr =>
                                next_state <= S_EXECUTE;    -- then WB
                            when jmp | datacall =>
                                next_state <= S_EXECUTE;    -- no WB
                            when others =>
                                next_state <= S_EXECUTE;
                        end case;

                    when others =>
                        next_state <= S_FETCH;
                end case;

            when S_EXECUTE =>
                case opcode(7 downto 6) is

                    when am_inherent =>
                        next_state <= S_FETCH;

                    when am_immediate =>
                        case opcode(5 downto 0) is
                            when andr | orr | addr | subvr | ldr =>
                                next_state <= S_WRITEBACK;
                            when others =>
                                next_state <= S_FETCH;
                        end case;

                    when am_direct =>
                        case opcode(5 downto 0) is
                            when lsip =>
                                next_state <= S_WRITEBACK;
                            when others =>
                                next_state <= S_FETCH;
                        end case;

                    when am_register =>
                        case opcode(5 downto 0) is
                            when andr | orr | addr =>
                                next_state <= S_WRITEBACK;
                            when others =>
                                next_state <= S_FETCH;
                        end case;

                    when others =>
                        next_state <= S_FETCH;
                end case;

            when S_MEM_READ =>
                next_state <= S_WRITEBACK;

            when S_MEM_WRITE =>
                next_state <= S_FETCH;

            when S_WRITEBACK =>
                next_state <= S_FETCH;

            when others =>
                next_state <= S_FETCH;
        end case;
    end process;

    ----------------------------------------------------------------
    -- 3) Moore output logic
    -- ALL outputs driven only here
    ----------------------------------------------------------------
    process(state, opcode, rz, z_flag)
    begin
        -- defaults
        ld_r          <= '0'; --fsm related
        rf_input_sel  <= from_ir_operand;
        dprr_wren     <= '0';

        dpcr_lsb_sel  <= '0';
        dpcr_wr       <= '0';
        er_wr         <= '0';
        er_clr        <= '0';
        eot_wr        <= '0';
        eot_clr       <= '0';
        svop_wr       <= '0';
        sop_wr        <= '0';
        irq_wr        <= '0';
        irq_clr       <= '0';
        result_wen    <= '0';
        result        <= '0';

        --alu_operation <= alu_idle; --fsm related
        --alu_op1_sel   <= alu_op1_from_rx;
        --alu_op2_sel   <= alu_op2_from_rz;
        clr_z_flag    <= '0';

        dm_wr_en      <= dm_read_enable;
        dm_addr_sel   <= dm_addr_from_rx;
        dm_data_sel   <= dm_data_from_rx;

        pc_sel        <= pc_sel_plus_one;
        pc_write      <= '0'; --fsm related

        case state is

            --------------------------------------------------------
            -- cycle 1
            --------------------------------------------------------
            when S_FETCH =>
                
                pc_write <= '1';
                if reset = '1' then
                    pc_sel <= pc_sel_from_zero;
                elsif init = '1' then
                    pc_sel <= pc_sel_from_zero;
                else
                    pc_sel <= pc_sel_plus_one;
                end if;

                alu_operation <= alu_idle;

            --------------------------------------------------------
            -- cycle 2
            --------------------------------------------------------
            when S_DECODE =>
                alu_operation <= alu_idle;

            --------------------------------------------------------
            -- cycle 3
            --------------------------------------------------------
            when S_EXECUTE =>
                case opcode(7 downto 6) is

                    when am_inherent =>
                        case opcode(5 downto 0) is
                            when clfz =>
                                clr_z_flag <= '1';
                            when noop =>
                                null;
                            when others =>
                                null;
                        end case;

                    when am_immediate =>
                        case opcode(5 downto 0) is
                            when andr =>
                                alu_operation <= alu_and;
                                alu_op1_sel   <= alu_op1_from_immediate;
                                alu_op2_sel   <= alu_op2_from_rx;

                            when orr =>
                                alu_operation <= alu_or;
                                alu_op1_sel   <= alu_op1_from_immediate;
                                alu_op2_sel   <= alu_op2_from_rx;

                            when addr =>
                                alu_operation <= alu_add;
                                alu_op1_sel   <= alu_op1_from_immediate;
                                alu_op2_sel   <= alu_op2_from_rx;

                            when subvr =>
                                alu_operation <= alu_sub;
                                alu_op1_sel   <= alu_op1_from_immediate;
                                alu_op2_sel   <= alu_op2_from_rx;

                            when subr =>
                                alu_operation <= alu_sub;
                                alu_op1_sel   <= alu_op1_from_immediate;
                                alu_op2_sel   <= alu_op2_from_rz;

                            when jmp =>
                                pc_sel   <= pc_sel_from_operand;
                                pc_write <= '1';

                            when present =>
                                if rz = x"0000" then
                                    pc_sel   <= pc_sel_from_operand;
                                    pc_write <= '1';
                                end if;

                            when sz =>
                                if z_flag = '1' then
                                    pc_sel   <= pc_sel_from_operand;
                                    pc_write <= '1';
                                end if;

                            when datacall2 =>
                                dpcr_lsb_sel <= '1';
                                dpcr_wr      <= '1';

                            when ldr =>
                                null; -- immediate load writes literal in WB

                            when others =>
                                null;
                        end case;

                    when am_direct =>
                        case opcode(5 downto 0) is
                            when lsip =>
                                null; -- WB in next cycle

                            when ssop =>
                                sop_wr <= '1';

                            when others =>
                                null;
                        end case;

                    when am_register =>
                        case opcode(5 downto 0) is
                            when andr =>
                                alu_operation <= alu_and;
                                alu_op1_sel   <= alu_op1_from_rx;
                                alu_op2_sel   <= alu_op2_from_rz;

                            when orr =>
                                alu_operation <= alu_or;
                                alu_op1_sel   <= alu_op1_from_rx;
                                alu_op2_sel   <= alu_op2_from_rz;

                            when addr =>
                                alu_operation <= alu_add;
                                alu_op1_sel   <= alu_op1_from_rx;
                                alu_op2_sel   <= alu_op2_from_rz;

                            when jmp =>
                                pc_sel   <= pc_sel_from_rx;
                                pc_write <= '1';

                            when datacall =>
                                dpcr_lsb_sel <= '0';
                                dpcr_wr      <= '1';

                            when others =>
                                null;
                        end case;

                    when others =>
                        null;
                end case;

            --------------------------------------------------------
            -- cycle 3 for load
            --------------------------------------------------------
            when S_MEM_READ =>
                case opcode(7 downto 6) is
                    when am_direct =>
                        if opcode(5 downto 0) = ldr then
                            dm_addr_sel <= dm_addr_from_ir_operand;
                        end if;

                    when am_register =>
                        if opcode(5 downto 0) = ldr then
                            dm_addr_sel <= dm_addr_from_rx;
                        end if;

                    when others =>
                        null;
                end case;

            --------------------------------------------------------
            -- cycle 3 for store
            --------------------------------------------------------
            when S_MEM_WRITE =>
                dm_wr_en <= dm_write_enable;

                case opcode(7 downto 6) is
                    when am_immediate =>
                        if opcode(5 downto 0) = str then
                            dm_addr_sel <= dm_addr_from_rz;
                            dm_data_sel <= dm_data_from_ir_operand;
                        end if;

                    when am_direct =>
                        case opcode(5 downto 0) is
                            when str =>
                                dm_addr_sel <= dm_addr_from_ir_operand;
                                dm_data_sel <= dm_data_from_rx;
                            when strpc =>
                                dm_addr_sel <= dm_addr_from_ir_operand;
                                dm_data_sel <= dm_data_from_pc;
                            when others =>
                                null;
                        end case;

                    when am_register =>
                        if opcode(5 downto 0) = str then
                            dm_addr_sel <= dm_addr_from_rz;
                            dm_data_sel <= dm_data_from_rx;
                        end if;

                    when others =>
                        null;
                end case;

            --------------------------------------------------------
            -- cycle 4
            --------------------------------------------------------
            when S_WRITEBACK =>
                case opcode(7 downto 6) is

                    when am_immediate =>
                        case opcode(5 downto 0) is
                            when andr | orr | addr | subvr =>
                                rf_input_sel <= from_aluout;
                                ld_r         <= '1';

                            when ldr =>
                                rf_input_sel <= from_ir_operand;
                                ld_r         <= '1';

                            when others =>
                                null;
                        end case;

                    when am_direct =>
                        case opcode(5 downto 0) is
                            when ldr =>
                                rf_input_sel <= from_dm_out;
                                ld_r         <= '1';

                            when lsip =>
                                rf_input_sel <= from_sip_hold;
                                ld_r         <= '1';

                            when others =>
                                null;
                        end case;

                    when am_register =>
                        case opcode(5 downto 0) is
                            when andr | orr | addr =>
                                rf_input_sel <= from_aluout;
                                ld_r         <= '1';

                            when ldr =>
                                rf_input_sel <= from_dm_out;
                                ld_r         <= '1';

                            when others =>
                                null;
                        end case;

                    when others =>
                        null;
                end case;

            when others =>
                null;
        end case;
    end process;
    ----------------------------------------------------------------
    -- 3) Moore output logic
    -- ALL outputs driven only here
    ----------------------------------------------------------------
    process(state)
    begin
        case state is
            when S_FETCH =>
                state_bits <= "000";

            when S_DECODE =>
                state_bits <= "001";

            when S_EXECUTE =>
                state_bits <= "010";

            when S_MEM_READ =>
                state_bits <= "011";

            when S_MEM_WRITE =>
                state_bits <= "100";

            when S_WRITEBACK =>
                state_bits <= "101";

            when others =>
                state_bits <= "000";
        end case;
    end process;

end architecture;