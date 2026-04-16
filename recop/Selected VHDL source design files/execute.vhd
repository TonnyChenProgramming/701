library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.recop_types.all;
use work.various_constants.all;
use work.opcodes.all;

entity execute is
    port(
        clk     : in bit_1;
        init    : in bit_1;
        reset   : in bit_1;

        
        -- DECODE
        rz          : in bit_16;
        rx          : in bit_16;
        ir_operand  : in bit_16;

        
        -- FETCH
        pc_in       : in bit_16;

        -- CONTROL SIGNALS
        -- ALU
        alu_operation : in bit_3;
        alu_op1_sel   : in bit_2;
        alu_op2_sel   : in bit_1;
        clr_z_flag    : in bit_1;

        -- Data Memory
        dm_wren       : in bit_1;
        dm_addr_sel   : in bit_2;   -- "00"=Rz  "01"=ir_operand  "10"=Rx
        dm_data_sel   : in bit_2;   -- "00"=Rx  "01"=ir_operand  "10"=pc_in

        -- DPCR
        dpcr_wr       : in bit_1;
        dpcr_lsb_sel  : in bit_1;   -- '0'= Rz&Rx  '1'= Rx&ir_operand

        -- OUTPUTS
        alu_result  : out bit_16;
        max_result  : out bit_16;   -- MAX comparator result RF rz_max port

        -- Zero flag back to fetch (for JMP conditions) and CU
        z_flag      : out bit_1;

        -- DM read result back to decode (for LDR RF write-back)
        dm_out      : out bit_16;

        -- DPCR to NoC
        dpcr        : out bit_32;

        -- Jump target back to fetch
        -- Execute exposes rx and ir_operand so fetch can MUX the PC
        rx_out      : out bit_16;
        rz_out      : out bit_16
    );
end execute;

architecture beh of execute is

    -- Internal signals
    signal alu_result_int : bit_16;
    signal dm_address_int : bit_16;
    signal dm_data_int    : bit_16;
    signal dpcr_reg       : bit_32;
    signal z_flag_int     : bit_1;

begin

    -- MAX Comparator
    -- MAX Rz #Operand: result = Rz if Rz >= ir_operand, else ir_operand
    max_result <= rz when (unsigned(rz) >= unsigned(ir_operand))
                     else ir_operand;

    -- ALU instantiation
    -- OP1 MUX and OP2 MUX are inside ALU.vhd already
    u_alu : entity work.alu
        port map (
            clk           => clk,
            z_flag        => z_flag_int,
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

    with dm_addr_sel select
        dm_address_int <= rz         when "00",		-- STR Rz Rx, STR Rz #Op
                          ir_operand when "01",	   -- LDR Rz $Op, STR Rx $Op, STRPC $Op
                          rx         when "10",	   -- Rx          LDR Rz Rx
                          x"0000"    when others;

    with dm_data_sel select
        dm_data_int <= rx         when "00",		-- STR Rz Rx, STR Rx $Op
                       ir_operand when "01",		-- ir_operand → STR Rz #Op
                       pc_in      when "10",		-- STRPC $Op
                       x"0000"    when others;

    -- Data Memory instantiation
    -- address(11:0), clock, data(15:0), wren, q(15:0)
    u_dm : entity work.data_mem
        port map (
            address => dm_address_int(11 downto 0),
            clock   => clk,
            data    => dm_data_int,
            wren    => dm_wren,
            q       => dm_out
        );

    -- DPCR Register (32-bit)
    -- DATACALL Rz Rx:        DPCR = Rz & Rx
    -- DATACALL Rx #Operand:  DPCR = Rx & ir_operand
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' or init = '1' then
                dpcr_reg <= x"00000000";
            elsif dpcr_wr = '1' then
                if dpcr_lsb_sel = '0' then
                    dpcr_reg <= rz & rx;           -- DATACALL Rz Rx
                else
                    dpcr_reg <= rx & ir_operand;   -- DATACALL Rx #Operand
                end if;
            end if;
        end if;
    end process;

    -- Output assignments
    alu_result  <= alu_result_int;
    z_flag      <= z_flag_int;
    dpcr        <= dpcr_reg;
    rx_out      <= rx;
    rz_out      <= rz;

end beh;