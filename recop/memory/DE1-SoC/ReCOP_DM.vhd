-- ============================================================================
-- ReCOP_DM.vhd  –  Data Memory (RAM)  [DE1-SoC / Cyclone V]
--
-- Capacity      : 512 words × 32 bits  (fits in 2 × Cyclone V M10K blocks)
-- Technology    : Altera altsyncram, SINGLE_PORT mode, Cyclone V (5CSEMA5F31C6)
-- Read          : synchronous, 1-clock latency
-- Write         : synchronous, 1-clock latency
-- Write-then-read same address same cycle: returns OLD data (read-before-write)
-- Power-up init : zeros (all bits cleared)
--
-- External interface:
--   clock    in  std_logic                     system clock (50 MHz DE1-SoC)
--   addr     in  std_logic_vector(8 downto 0)  9-bit word address
--   wr_en    in  std_logic                     '1' = write, '0' = read
--   data_in  in  std_logic_vector(31 downto 0) write data (from datapath)
--   data_out out std_logic_vector(31 downto 0) read data  (to datapath)
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library altera_mf;
use altera_mf.all;

entity ReCOP_DM is
    port (
        clock    : in  std_logic;
        addr     : in  std_logic_vector(8 downto 0);
        wr_en    : in  std_logic;
        data_in  : in  std_logic_vector(31 downto 0);
        data_out : out std_logic_vector(31 downto 0)
    );
end entity ReCOP_DM;

architecture Behavior of ReCOP_DM is

    component altsyncram
    generic (
        clock_enable_input_a          : string;
        clock_enable_output_a         : string;
        intended_device_family        : string;
        lpm_hint                      : string;
        lpm_type                      : string;
        numwords_a                    : natural;
        operation_mode                : string;
        outdata_aclr_a                : string;
        outdata_reg_a                 : string;
        power_up_uninitialized        : string;
        read_during_write_mode_port_a : string;
        widthad_a                     : natural;
        width_a                       : natural;
        width_byteena_a               : natural
    );
    port (
        clock0    : in  std_logic;
        address_a : in  std_logic_vector(8 downto 0);
        wren_a    : in  std_logic;
        data_a    : in  std_logic_vector(31 downto 0);
        q_a       : out std_logic_vector(31 downto 0)
    );
    end component;

begin

    dm_core : altsyncram
    generic map (
        clock_enable_input_a          => "BYPASS",
        clock_enable_output_a         => "BYPASS",
        intended_device_family        => "Cyclone V",
        lpm_hint                      => "ENABLE_RUNTIME_MOD=NO",
        lpm_type                      => "altsyncram",
        numwords_a                    => 512,
        operation_mode                => "SINGLE_PORT",
        outdata_aclr_a                => "NONE",
        outdata_reg_a                 => "UNREGISTERED",
        power_up_uninitialized        => "FALSE",
        read_during_write_mode_port_a => "OLD_DATA",
        widthad_a                     => 9,
        width_a                       => 32,
        width_byteena_a               => 1
    )
    port map (
        clock0    => clock,
        address_a => addr,
        wren_a    => wr_en,
        data_a    => data_in,
        q_a       => data_out
    );

end architecture Behavior;
