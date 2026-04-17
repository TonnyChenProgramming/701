library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.opcodes.all;

entity execute is
    port(
        clk   : in bit_1;
        init  : in bit_1;
        reset : in bit_1;

        -- Data inputs from decode/regfile
        rx         : in bit_16;
        rz         : in bit_16;
        ir_operand : in bit_16;
        pc_in      : in bit_16;

        -- Control signals from control_signal_generator
        alu_operation : in bit_3;
        alu_op1_sel   : in bit_2;
        alu_op2_sel   : in bit_1;
        clr_z_flag    : in bit_1;
        dm_wr_en      : in bit_1;
        dm_addr_sel   : in bit_2;   -- "00"=Rz  "01"=ir_operand  "10"=Rx
        dm_data_sel   : in bit_2;   -- "00"=Rx  "01"=ir_operand  "10"=pc_in

        -- Outputs back to DecodeandWriteback (for RF writeback)
        alu_result : out bit_16;
        rz_max     : out bit_16;
        dm_out     : out bit_16;
        z_flag     : out bit_1
    );
end execute;

architecture beh of execute is

    signal alu_result_int : bit_16;
    signal dm_address_int : bit_16;
    signal dm_data_int    : bit_16;

begin

    -- MAX comparator (pure combinational)
    -- MAX Rz #Operand: result = larger of {Rz, ir_operand}
    rz_max <= rz when (unsigned(rz) >= unsigned(ir_operand)) else ir_operand;

    -- ALU (OP1/OP2 MUXes are already inside ALU.vhd)
    u_alu : entity work.alu
        port map (
            clk           => clk,
            z_flag        => z_flag,
            alu_operation => alu_operation,
            alu_op1_sel   => alu_op1_sel,
            alu_op2_sel   => alu_op2_sel,
            alu_carry     => '0',
            alu_result    => alu_result_int,
            rx            => rx,
            rz            => rz,
            ir_operand    => ir_operand,
            clr_z_flag    => clr_z_flag,
            reset         => reset
        );

    -- DM Address MUX
    -- "00" = Rz         STR Rz Rx, STR Rz #Op
    -- "01" = ir_operand LDR Rz $Op, STR Rx $Op, STRPC $Op
    -- "10" = Rx         LDR Rz Rx
    with dm_addr_sel select
        dm_address_int <= rz         when dm_addr_from_rz,
                          ir_operand when dm_addr_from_ir_operand,
                          rx         when dm_addr_from_rx,
                          x"0000"    when others;

    -- DM Write Data MUX
    -- "00" = Rx         STR Rz Rx, STR Rx $Op
    -- "01" = ir_operand STR Rz #Op
    -- "10" = pc_in      STRPC $Op
    with dm_data_sel select
        dm_data_int <= rx         when dm_data_from_rx,
                       ir_operand when dm_data_from_ir_operand,
                       pc_in      when dm_data_from_pc,
                       x"0000"    when others;

    -- Data Memory (Altera altsyncram IP)
    u_dm : entity work.data_memory_ip
        port map (
            address => dm_address_int(11 downto 0),
            clock   => clk,
            data    => dm_data_int,
            wren    => dm_wr_en,
            q       => dm_out
        );

    alu_result <= alu_result_int;

end beh;