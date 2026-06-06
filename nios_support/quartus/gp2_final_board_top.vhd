library ieee;
library Nios_System_2A;

use ieee.std_logic_1164.all;

use work.asp_packet_pkg.all;
use work.TdmaMinTypes.all;

-- DE1-SoC final GP2 integration wrapper.
--
-- Nios II config path:
--   JTAG UART command console -> Avalon-NoC adapter -> gp2_final_noc_asp_top
--
-- ReCOP control path:
--   KEY/SW -> ReCOP SIP command encoder -> gp2_final_noc_asp_top
--
-- ASP data path:
--   ADC -> AVG -> COR -> Peak -> Nios adapter RX
entity gp2_final_board_top is
    port (
        CLOCK_50  : in  std_logic;
        KEY       : in  std_logic_vector(3 downto 0);
        SW        : in  std_logic_vector(9 downto 0);
        LEDR      : out std_logic_vector(9 downto 0);

        VGA_B       : out std_logic_vector(7 downto 0);
        VGA_BLANK_N : out std_logic;
        VGA_CLK     : out std_logic;
        VGA_G       : out std_logic_vector(7 downto 0);
        VGA_HS      : out std_logic;
        VGA_R       : out std_logic_vector(7 downto 0);
        VGA_SYNC_N  : out std_logic;
        VGA_VS      : out std_logic;

        DRAM_DQ    : inout std_logic_vector(15 downto 0);
        DRAM_ADDR  : out   std_logic_vector(12 downto 0);
        DRAM_BA    : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N : out   std_logic;
        DRAM_CKE   : out   std_logic;
        DRAM_CLK   : out   std_logic;
        DRAM_CS_N  : out   std_logic;
        DRAM_LDQM  : out   std_logic;
        DRAM_RAS_N : out   std_logic;
        DRAM_UDQM  : out   std_logic;
        DRAM_WE_N  : out   std_logic
    );
end entity gp2_final_board_top;

architecture rtl of gp2_final_board_top is
    constant NULL_TDMA_PORT : tdma_min_port := (
        addr => NULL_ADDR,
        data => (others => '0')
    );

    signal reset_s : std_logic;
    signal nios_sys_clk : std_logic;
    signal dram_dqm : std_logic_vector(1 downto 0);

    signal nios_ledr : std_logic_vector(7 downto 0);

    signal noc_send_addr : std_logic_vector(7 downto 0);
    signal noc_send_data : std_logic_vector(31 downto 0);
    signal noc_recv_addr : std_logic_vector(7 downto 0);
    signal noc_recv_data : std_logic_vector(31 downto 0);

    signal nios_send_port  : tdma_min_port := NULL_TDMA_PORT;
    signal nios_recv_port  : tdma_min_port := NULL_TDMA_PORT;
    signal recop_send_port : tdma_min_port := NULL_TDMA_PORT;
    signal recop_recv_port : tdma_min_port := NULL_TDMA_PORT;

    signal recop_ledr : std_logic_vector(9 downto 0);
    signal peak_seen_r : std_logic := '0';
    signal recop_status_seen_r : std_logic := '0';

    signal debug_route      : tdma_min_port := NULL_TDMA_PORT;
    signal debug_nios_send  : tdma_min_port := NULL_TDMA_PORT;
    signal debug_recop_send : tdma_min_port := NULL_TDMA_PORT;
    signal debug_adc_send   : tdma_min_port := NULL_TDMA_PORT;
    signal debug_avg_send   : tdma_min_port := NULL_TDMA_PORT;
    signal debug_cor_send   : tdma_min_port := NULL_TDMA_PORT;
    signal debug_pk_send    : tdma_min_port := NULL_TDMA_PORT;

begin
    reset_s <= not KEY(0);

    DRAM_UDQM <= dram_dqm(1);
    DRAM_LDQM <= dram_dqm(0);

    nios_send_port.addr <= noc_send_addr;
    nios_send_port.data <= noc_send_data;
    noc_recv_addr <= std_logic_vector(nios_recv_port.addr);
    noc_recv_data <= std_logic_vector(nios_recv_port.data);

    u_nios : entity Nios_System_2A.Nios_System_2A
        port map (
            button_pio_external_connection_export => KEY(1 downto 0),
            clocks_ref_clk_clk                    => CLOCK_50,
            clocks_ref_reset_reset                => reset_s,
            clocks_sys_clk_export                 => nios_sys_clk,
            clocks_sdram_clk_clk                  => DRAM_CLK,
            led_pio_external_connection_export    => nios_ledr,
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
            noc_recv_addr                         => noc_recv_addr,
            noc_recv_data                         => noc_recv_data,
            video_vga_controller_0_external_interface_CLK   => VGA_CLK,
            video_vga_controller_0_external_interface_HS    => VGA_HS,
            video_vga_controller_0_external_interface_VS    => VGA_VS,
            video_vga_controller_0_external_interface_BLANK => VGA_BLANK_N,
            video_vga_controller_0_external_interface_SYNC  => VGA_SYNC_N,
            video_vga_controller_0_external_interface_R     => VGA_R,
            video_vga_controller_0_external_interface_G     => VGA_G,
            video_vga_controller_0_external_interface_B     => VGA_B
        );

    u_recop_control : entity work.gp2_recop_control_io
        port map (
            clk => nios_sys_clk,
            reset => reset_s,
            key => KEY,
            sw => SW,
            recv => recop_recv_port,
            send => recop_send_port,
            ledr => recop_ledr
        );

    u_final_noc : entity work.gp2_final_noc_asp_top
        port map (
            clock => nios_sys_clk,
            reset => reset_s,
            init  => '0',
            nios_send => nios_send_port,
            nios_recv => nios_recv_port,
            recop_send => recop_send_port,
            recop_recv => recop_recv_port,
            debug_route => debug_route,
            debug_nios_send => debug_nios_send,
            debug_recop_send => debug_recop_send,
            debug_adc_send => debug_adc_send,
            debug_avg_send => debug_avg_send,
            debug_cor_send => debug_cor_send,
            debug_pk_send => debug_pk_send
        );

    process(nios_sys_clk)
    begin
        if rising_edge(nios_sys_clk) then
            if reset_s = '1' then
                peak_seen_r <= '0';
                recop_status_seen_r <= '0';
            else
                if nios_recv_port.addr = NIOS_II_ADDR
                   and packet_kind(nios_recv_port.data) = PKT_KIND_EVENT then
                    peak_seen_r <= '1';
                end if;

                if recop_recv_port.addr = RECOP_ADDR
                   and packet_kind(recop_recv_port.data) = PKT_KIND_STATUS then
                    recop_status_seen_r <= '1';
                end if;
            end if;
        end if;
    end process;

    -- LEDR(3 downto 0): ReCOP ASP status LEDs: PK, COR, AVG, ADC.
    -- LEDR(7 downto 4): low nibble from the Nios LED PIO.
    -- LEDR(8): latched Peak event reached Nios through hwloop 0.
    -- LEDR(9): latched ASP status reached ReCOP.
    LEDR(3 downto 0) <= recop_ledr(3 downto 0);
    LEDR(7 downto 4) <= nios_ledr(3 downto 0);
    LEDR(8) <= peak_seen_r;
    LEDR(9) <= recop_status_seen_r;
end architecture rtl;
