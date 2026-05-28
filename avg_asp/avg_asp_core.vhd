library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.asp_packet_pkg.all;

-- AVG-ASP core
--
-- Moving average over 1, 2, 4, 8, or 16 samples. The window length is restricted
-- to powers of two so division is implemented as a right shift, matching the
-- project constraint that no general divider is required.
entity avg_asp_core is
    port(
        clk         : in  std_logic;
        reset       : in  std_logic;

        cmd_valid   : in  std_logic;
        cmd_ready   : out std_logic;
        cmd_word    : in  packet_word_t;

        in_valid    : in  std_logic;
        in_ready    : out std_logic;
        in_word     : in  packet_word_t;

        out_valid   : out std_logic;
        out_ready   : in  std_logic;
        out_word    : out packet_word_t;

        status_word : out packet_word_t
    );
end entity avg_asp_core;

architecture rtl of avg_asp_core is
    type sample_buffer_t is array (0 to 15) of sample16_t;

    signal enabled       : std_logic := '0';
    signal window_shift  : unsigned(2 downto 0) := "010";
    signal window_size   : unsigned(4 downto 0) := "00100";
    signal write_index   : unsigned(3 downto 0) := (others => '0');
    signal valid_count   : unsigned(4 downto 0) := (others => '0');
    signal dest_node     : nibble_t := COR_ASP_ADDR(3 downto 0);
    signal sample_buffer : sample_buffer_t := (others => (others => '0'));
    signal running_sum   : signed(19 downto 0) := (others => '0');
    signal avg_reg       : sample16_t := (others => '0');
    signal out_valid_reg : std_logic := '0';
    signal in_ready_i    : std_logic;

    function clamp_shift(shift : unsigned(2 downto 0)) return unsigned is
    begin
        if to_integer(shift) > 4 then
            return "100";
        else
            return shift;
        end if;
    end function;

    function shift_to_size(shift : unsigned(2 downto 0)) return unsigned is
    begin
        case to_integer(shift) is
            when 0 => return to_unsigned(1, 5);
            when 1 => return to_unsigned(2, 5);
            when 2 => return to_unsigned(4, 5);
            when 3 => return to_unsigned(8, 5);
            when others => return to_unsigned(16, 5);
        end case;
    end function;
begin
    cmd_ready <= '1';
    in_ready_i <= enabled and not out_valid_reg;
    in_ready <= in_ready_i;
    out_valid <= out_valid_reg;
    out_word <= make_packet(PKT_KIND_DATA, TAG_DIRECT_DATA, dest_node, payload_from_sample16(avg_reg));

    status_word <= make_packet(
        PKT_KIND_STATUS,
        TAG_STATUS,
        RECOP_ADDR(3 downto 0),
        "0000" & enabled & std_logic_vector(window_shift) & std_logic_vector(valid_count) & std_logic_vector(write_index) & "000"
    );

    process(clk)
        variable incoming        : sample16_t;
        variable outgoing_old    : sample16_t;
        variable next_sum        : signed(19 downto 0);
        variable shifted_value   : signed(19 downto 0);
        variable requested_shift : unsigned(2 downto 0);
    begin
        if rising_edge(clk) then
            if reset = '1' then
                enabled       <= '0';
                window_shift  <= "010";
                window_size   <= "00100";
                write_index   <= (others => '0');
                valid_count   <= (others => '0');
                dest_node     <= COR_ASP_ADDR(3 downto 0);
                sample_buffer <= (others => (others => '0'));
                running_sum   <= (others => '0');
                avg_reg       <= (others => '0');
                out_valid_reg <= '0';
            else
                if out_valid_reg = '1' and out_ready = '1' then
                    out_valid_reg <= '0';
                end if;

                if cmd_valid = '1' and packet_kind(cmd_word) = PKT_KIND_CMD then
                    case packet_code(cmd_word) is
                        when CMD_CONFIG =>
                            requested_shift := clamp_shift(unsigned(cmd_word(10 downto 8)));
                            dest_node    <= cmd_word(19 downto 16);
                            window_shift <= requested_shift;
                            window_size  <= shift_to_size(requested_shift);
                        when CMD_START =>
                            enabled <= '1';
                        when CMD_STOP =>
                            enabled <= '0';
                        when CMD_CLEAR =>
                            write_index <= (others => '0');
                            valid_count <= (others => '0');
                            sample_buffer <= (others => (others => '0'));
                            running_sum <= (others => '0');
                            out_valid_reg <= '0';
                        when others =>
                            null;
                    end case;
                end if;

                if in_valid = '1' and in_ready_i = '1' and packet_kind(in_word) = PKT_KIND_DATA then
                    incoming := packet_sample(in_word);

                    if valid_count = window_size then
                        outgoing_old := sample_buffer(to_integer(write_index));
                    else
                        outgoing_old := (others => '0');
                        valid_count <= valid_count + 1;
                    end if;

                    next_sum := running_sum + resize(incoming, 20) - resize(outgoing_old, 20);
                    running_sum <= next_sum;
                    sample_buffer(to_integer(write_index)) <= incoming;
                    if to_integer(write_index) = to_integer(window_size) - 1 then
                        write_index <= (others => '0');
                    else
                        write_index <= write_index + 1;
                    end if;

                    if valid_count = window_size or valid_count = window_size - 1 then
                        shifted_value := shift_right(next_sum, to_integer(window_shift));
                        avg_reg <= resize(shifted_value, 16);
                        out_valid_reg <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;
end architecture rtl;
