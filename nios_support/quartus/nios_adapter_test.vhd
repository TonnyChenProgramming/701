library ieee;
library Nios_System_2A;
use ieee.std_logic_1164.all;

-- Minimal DE1-SoC board wrapper for the Nios-to-NoC adapter smoke test.
-- TDMA-MIN is intentionally not connected yet. The Nios console enables the
-- adapter-local loopback path with "hwloop 1" before sending a test packet.
entity nios_adapter_test is
    port (
        CLOCK_50  : in    std_logic;
        KEY       : in    std_logic_vector(1 downto 0);
        LEDR      : out   std_logic_vector(7 downto 0);

        DRAM_DQ   : inout std_logic_vector(15 downto 0);
        DRAM_ADDR : out   std_logic_vector(12 downto 0);
        DRAM_BA   : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N : out  std_logic;
        DRAM_CKE   : out  std_logic;
        DRAM_CLK   : out  std_logic;
        DRAM_CS_N  : out  std_logic;
        DRAM_LDQM  : out  std_logic;
        DRAM_RAS_N : out  std_logic;
        DRAM_UDQM  : out  std_logic;
        DRAM_WE_N  : out  std_logic
    );
end entity nios_adapter_test;

architecture rtl of nios_adapter_test is
    signal dram_dqm      : std_logic_vector(1 downto 0);
    signal noc_send_addr : std_logic_vector(7 downto 0);
    signal noc_send_data : std_logic_vector(31 downto 0);
begin
    DRAM_UDQM <= dram_dqm(1);
    DRAM_LDQM <= dram_dqm(0);

    u_nios : entity Nios_System_2A.Nios_System_2A
        port map (
            button_pio_external_connection_export => KEY,
            clocks_ref_clk_clk                    => CLOCK_50,
            clocks_ref_reset_reset                => not KEY(0),
            clocks_sdram_clk_clk                  => DRAM_CLK,
            led_pio_external_connection_export    => LEDR,
            sdram_wire_addr                       => DRAM_ADDR,
            sdram_wire_ba                         => DRAM_BA,
            sdram_wire_cas_n                      => DRAM_CAS_N,
            sdram_wire_cke                        => DRAM_CKE,
            sdram_wire_cs_n                       => DRAM_CS_N,
            sdram_wire_dq                         => DRAM_DQ,
            sdram_wire_dqm                        => dram_dqm,
            sdram_wire_ras_n                      => DRAM_RAS_N,
            sdram_wire_we_n                       => DRAM_WE_N,
            noc_send_addr                         => noc_send_addr,
            noc_send_data                         => noc_send_data,
            noc_recv_addr                         => (others => '0'),
            noc_recv_data                         => (others => '0')
        );
end architecture rtl;
