library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.opcodes.all;

entity control_signal_generator is
    port (
        opcode : in bit_8;   -- instruction[31:24] = AM(2) + function(6)
        rz     : in bit_16;  -- Rz value, needed for PRESENT check
        z_flag : in bit_1;   -- Z flag, needed for SZ check

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
        pc_sel : out bit_2
    );
end control_signal_generator;

architecture beh of control_signal_generator is
begin
    process(opcode, rz, z_flag)
    begin

        -- DEFAULTS: everything off / idle

        ld_r          <= '0';
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

        alu_operation <= alu_idle;
        alu_op1_sel   <= alu_op1_from_rx;
        alu_op2_sel   <= alu_op2_from_rz;
        clr_z_flag    <= '0';

        dm_wr_en      <= dm_read_enable;
        dm_addr_sel   <= dm_addr_from_rx;
        dm_data_sel   <= dm_data_from_rx;

        pc_sel        <= pc_sel_plus_one;


        -- DECODE: opcode(7:6) = AM bits, opcode(5:0) = function code

        case opcode(7 downto 6) is


            -- INHERENT  (no operands)

            when am_inherent =>
                case opcode(5 downto 0) is
                    when clfz =>
                        clr_z_flag <= '1';
                    when noop =>
                        null;
                    when others =>
                        null;
                end case;


            -- IMMEDIATE  (16-bit operand in ir_operand)

            when am_immediate =>
                alu_op1_sel <= alu_op1_from_immediate;
                case opcode(5 downto 0) is

                    when andr =>                          -- AND Rz Rx #Op
                        alu_operation <= alu_and;
                        alu_op2_sel   <= alu_op2_from_rx;
                        rf_input_sel  <= from_aluout;
                        ld_r          <= '1';

                    when orr =>                           -- OR Rz Rx #Op
                        alu_operation <= alu_or;
                        alu_op2_sel   <= alu_op2_from_rx;
                        rf_input_sel  <= from_aluout;
                        ld_r          <= '1';

                    when addr =>                          -- ADD Rz Rx #Op
                        alu_operation <= alu_add;
                        alu_op2_sel   <= alu_op2_from_rx;
                        rf_input_sel  <= from_aluout;
                        ld_r          <= '1';

                    when subvr =>                         -- SUBV Rz Rx #Op
                        alu_operation <= alu_sub;
                        alu_op2_sel   <= alu_op2_from_rx;
                        rf_input_sel  <= from_aluout;
                        ld_r          <= '1';

                    when subr =>                          -- SUB Rz #Op (Z only)
                        alu_operation <= alu_sub;
                        alu_op2_sel   <= alu_op2_from_rz;
                        -- ld_r stays '0': result discarded, only Z updated

                    when ldr =>                           -- LDR Rz #Op
                        rf_input_sel <= from_ir_operand;
                        ld_r         <= '1';

                    when str =>                           -- STR Rz #Op
                        dm_wr_en    <= dm_write_enable;
                        dm_addr_sel <= dm_addr_from_rz;
                        dm_data_sel <= dm_data_from_ir_operand;

                    when jmp =>                           -- JMP #Op
                        pc_sel <= pc_sel_from_operand;

                    when present =>                       -- PRESENT Rz #Op
                        if rz = x"0000" then
                            pc_sel <= pc_sel_from_operand;
                        else
                            pc_sel <= pc_sel_plus_one;
                        end if;

                    when datacall2 =>                     -- DATACALL Rx #Op
                        dpcr_lsb_sel <= '1';
                        dpcr_wr      <= '1';

                    when sz =>                            -- SZ #Op
                        if z_flag = '1' then
                            pc_sel <= pc_sel_from_operand;
                        else
                            pc_sel <= pc_sel_plus_one;
                        end if;

                    when others =>
                        null;
                end case;

					 
            -- DIRECT  (16-bit address in ir_operand)

            when am_direct =>
                case opcode(5 downto 0) is

                    when ldr =>                           -- LDR Rz $Op
                        dm_addr_sel  <= dm_addr_from_ir_operand;
                        rf_input_sel <= from_dm_out;
                        ld_r         <= '1';

                    when str =>                           -- STR Rx $Op
                        dm_wr_en    <= dm_write_enable;
                        dm_addr_sel <= dm_addr_from_ir_operand;
                        dm_data_sel <= dm_data_from_rx;

                    when strpc =>                         -- STRPC $Op
                        dm_wr_en    <= dm_write_enable;
                        dm_addr_sel <= dm_addr_from_ir_operand;
                        dm_data_sel <= dm_data_from_pc;

                    when lsip =>                          -- LSIP Rz
                        rf_input_sel <= from_sip_hold;
                        ld_r         <= '1';

                    when ssop =>                          -- SSOP Rx
                        sop_wr <= '1';

                    when others =>
                        null;
                end case;


            -- REGISTER  (uses Rz and Rx from register file)

            when am_register =>
                case opcode(5 downto 0) is

                    when andr =>                          -- AND Rz Rz Rx
                        alu_operation <= alu_and;
                        alu_op1_sel   <= alu_op1_from_rx;
                        alu_op2_sel   <= alu_op2_from_rz;
                        rf_input_sel  <= from_aluout;
                        ld_r          <= '1';

                    when orr =>                           -- OR Rz Rz Rx
                        alu_operation <= alu_or;
                        alu_op1_sel   <= alu_op1_from_rx;
                        alu_op2_sel   <= alu_op2_from_rz;
                        rf_input_sel  <= from_aluout;
                        ld_r          <= '1';

                    when addr =>                          -- ADD Rz Rz Rx
                        alu_operation <= alu_add;
                        alu_op1_sel   <= alu_op1_from_rx;
                        alu_op2_sel   <= alu_op2_from_rz;
                        rf_input_sel  <= from_aluout;
                        ld_r          <= '1';

                    when ldr =>                           -- LDR Rz Rx
                        dm_addr_sel  <= dm_addr_from_rx;
                        rf_input_sel <= from_dm_out;
                        ld_r         <= '1';

                    when str =>                           -- STR Rz Rx
                        dm_wr_en    <= dm_write_enable;
                        dm_addr_sel <= dm_addr_from_rz;
                        dm_data_sel <= dm_data_from_rx;

                    when jmp =>                           -- JMP Rx
                        pc_sel <= pc_sel_from_rx;

                    when datacall =>                      -- DATACALL Rz Rx
                        dpcr_lsb_sel <= '0';
                        dpcr_wr      <= '1';

                    when others =>
                        null;
                end case;

            when others =>
                null;
        end case;
    end process;

end beh;