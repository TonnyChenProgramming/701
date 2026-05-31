library ieee;
use ieee.std_logic_1164.all;

use work.asp_packet_pkg.all;
use work.TdmaMinTypes.all;

-- Platform Designer wrapper.
--
-- Platform Designer exposes conduit signals cleanly as flat vectors. The core
-- adapter keeps the TDMA-MIN record ports used by the ASP integration code.
entity avalon_noc_adapter_pd is
    port (
        clk           : in  std_logic;
        reset         : in  std_logic;

        avs_address   : in  std_logic_vector(2 downto 0);
        avs_read      : in  std_logic;
        avs_write     : in  std_logic;
        avs_writedata : in  std_logic_vector(31 downto 0);
        avs_readdata  : out std_logic_vector(31 downto 0);

        irq           : out std_logic;

        noc_send_addr : out std_logic_vector(7 downto 0);
        noc_send_data : out std_logic_vector(31 downto 0);
        noc_recv_addr : in  std_logic_vector(7 downto 0);
        noc_recv_data : in  std_logic_vector(31 downto 0)
    );
end entity avalon_noc_adapter_pd;

architecture rtl of avalon_noc_adapter_pd is
    signal send_port : tdma_min_port;
    signal recv_port : tdma_min_port;
begin
    noc_send_addr <= send_port.addr;
    noc_send_data <= send_port.data;
    recv_port.addr <= noc_recv_addr;
    recv_port.data <= noc_recv_data;

    u_adapter : entity work.avalon_noc_adapter
        port map (
            clk           => clk,
            reset         => reset,
            avs_address   => avs_address,
            avs_read      => avs_read,
            avs_write     => avs_write,
            avs_writedata => avs_writedata,
            avs_readdata  => avs_readdata,
            irq           => irq,
            send          => send_port,
            recv          => recv_port
        );
end architecture rtl;
