#include <ctype.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "nios_command.h"
#include "nios_display.h"
#include "nios_packet.h"

#define printf nios_console_printf

#define NIOS_LINE_MAX 80

static void nios_log_command_to_vga(const char *line)
{
    char display_line[NIOS_LINE_MAX + 8];
    unsigned int in = 0u;
    unsigned int out = 0u;

    display_line[out++] = 'n';
    display_line[out++] = 'i';
    display_line[out++] = 'o';
    display_line[out++] = 's';
    display_line[out++] = '>';
    display_line[out++] = ' ';

    while (line[in] != '\0'
           && line[in] != '\r'
           && line[in] != '\n'
           && out + 1u < sizeof(display_line)) {
        display_line[out++] = line[in++];
    }

    display_line[out] = '\0';
    nios_display_log_line(display_line);
}

static void nios_print_help(void)
{
    printf("cmd: adc <dest> <ch> <div>, avg <dest> <win>, corwin <n>, offset <n>, pk <dest> <sp> <th>, start|stop|clear <asp>, clear console, poll, capture <n>, demo <adc|avg|full|board> [n], hwstatus, hwclear, hwloop <0|1>, rx <hex>, status, display, cls, exit\n");
}

static void nios_lowercase(char *text)
{
    while (*text != '\0') {
        *text = (char)tolower((unsigned char)*text);
        text++;
    }
}

static int nios_parse_u16(const char *text, uint32_t *value_out)
{
    char *end = NULL;
    unsigned long value;

    if (text == NULL || *text == '\0') {
        return 0;
    }

    value = strtoul(text, &end, 0);
    if (end == text || *end != '\0' || value > 0xFFFFu) {
        return 0;
    }

    *value_out = (uint32_t)value;
    return 1;
}

static int nios_parse_limit(
    const char *text,
    uint32_t limit,
    uint32_t *value_out
)
{
    uint32_t value;

    if (!nios_parse_u16(text, &value) || value > limit) {
        return 0;
    }

    *value_out = value;
    return 1;
}

static int nios_parse_u32(const char *text, uint32_t *value_out)
{
    char *end = NULL;
    unsigned long value;

    if (text == NULL || *text == '\0') {
        return 0;
    }

    value = strtoul(text, &end, 0);
    if (end == text || *end != '\0' || value > 0xFFFFFFFFul) {
        return 0;
    }

    *value_out = (uint32_t)value;
    return 1;
}

static int nios_parse_dest(const char *text, uint32_t *dest_out)
{
    uint32_t value;

    if (strcmp(text, "recop") == 0) {
        *dest_out = NIOS_ADDR_RECOP;
    } else if (strcmp(text, "adc") == 0) {
        *dest_out = NIOS_ADDR_ADC_ASP;
    } else if (strcmp(text, "avg") == 0 || strcmp(text, "ave") == 0) {
        *dest_out = NIOS_ADDR_AVE_ASP;
    } else if (strcmp(text, "cor") == 0) {
        *dest_out = NIOS_ADDR_COR_ASP;
    } else if (strcmp(text, "pk") == 0) {
        *dest_out = NIOS_ADDR_PK_ASP;
    } else if (strcmp(text, "nios") == 0) {
        *dest_out = NIOS_ADDR_NIOS_II;
    } else if (strcmp(text, "idle") == 0) {
        *dest_out = NIOS_ADDR_IDLE;
    } else if (strcmp(text, "null") == 0) {
        *dest_out = NIOS_ADDR_NULL;
    } else if (nios_parse_limit(text, 7u, &value)) {
        *dest_out = value;
    } else {
        return 0;
    }

    return 1;
}

static int nios_handle_adc(
    nios_command_state_t *state,
    const char *dest_arg,
    const char *channel_arg,
    const char *divider_arg
)
{
    uint32_t dest;
    uint32_t channel;
    uint32_t divider;

    if (!nios_parse_dest(dest_arg, &dest)
        || !nios_parse_limit(channel_arg, 3u, &channel)
        || !nios_parse_limit(divider_arg, 15u, &divider)) {
        printf("ERR: adc <dest> <ch 0..3> <div 0..15>\n");
        return 0;
    }

    return nios_command_config_adc(state, dest, channel, divider);
}

static int nios_handle_avg(
    nios_command_state_t *state,
    const char *dest_arg,
    const char *window_arg
)
{
    uint32_t dest;
    uint32_t window;

    if (!nios_parse_dest(dest_arg, &dest) || !nios_parse_u16(window_arg, &window)) {
        printf("ERR: avg <dest> <1|2|4|8|16>\n");
        return 0;
    }

    if (nios_command_config_avg(state, dest, window) != 0) {
        printf("ERR: avg window 1|2|4|8|16\n");
        return 0;
    }

    return 0;
}

static int nios_handle_cor_window(
    nios_command_state_t *state,
    const char *argument
)
{
    uint32_t window;

    if (!nios_parse_u16(argument, &window)
        || nios_command_config_cor_window(state, window) != 0) {
        printf("ERR: corwin 1..511\n");
        return 0;
    }

    return 0;
}

static int nios_handle_offset(
    nios_command_state_t *state,
    const char *argument
)
{
    uint32_t offset;

    if (!nios_parse_u16(argument, &offset)) {
        printf("ERR: offset 0..65535\n");
        return 0;
    }

    return nios_command_config_cor_offset(state, offset);
}

static int nios_handle_pk(
    nios_command_state_t *state,
    const char *dest_arg,
    const char *spacing_arg,
    const char *threshold_arg
)
{
    uint32_t dest;
    uint32_t spacing;
    uint32_t threshold;

    if (!nios_parse_dest(dest_arg, &dest)
        || !nios_parse_limit(spacing_arg, 255u, &spacing)
        || !nios_parse_limit(threshold_arg, 15u, &threshold)) {
        printf("ERR: pk <dest> <spacing 0..255> <threshold 0..15>\n");
        return 0;
    }

    return nios_command_config_pk(state, dest, spacing, threshold);
}

static void nios_handle_rx(
    nios_command_state_t *state,
    const char *argument
)
{
    uint32_t packet;

    if (!nios_parse_u32(argument, &packet)) {
        printf("ERR: rx <hex>\n");
        return;
    }

    nios_command_record_rx(state, packet);
    nios_command_print_rx(packet);
}

static int nios_handle_control(
    nios_command_state_t *state,
    const char *dest_arg,
    uint32_t command
)
{
    uint32_t dest;

    if (!nios_parse_dest(dest_arg, &dest)
        || dest == NIOS_ADDR_RECOP
        || dest == NIOS_ADDR_NIOS_II
        || dest == NIOS_ADDR_IDLE
        || dest == NIOS_ADDR_NULL
        || nios_command_control_asp(state, dest, command) != 0) {
        printf("ERR: start|stop|clear <adc|avg|cor|pk>\n");
        return 0;
    }

    return 0;
}

static void nios_demo_cmd(const char *text)
{
    printf("CMD: %s\n", text);
    fflush(stdout);
}

static void nios_demo_stop_all(nios_command_state_t *state)
{
    nios_demo_cmd("stop adc");
    nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_STOP);
    nios_demo_cmd("stop avg");
    nios_command_control_asp(state, NIOS_ADDR_AVE_ASP, NIOS_CMD_STOP);
    nios_demo_cmd("stop cor");
    nios_command_control_asp(state, NIOS_ADDR_COR_ASP, NIOS_CMD_STOP);
    nios_demo_cmd("stop pk");
    nios_command_control_asp(state, NIOS_ADDR_PK_ASP, NIOS_CMD_STOP);
}

static void nios_demo_clear_all(nios_command_state_t *state)
{
    nios_demo_cmd("clear adc");
    nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_CLEAR);
    nios_demo_cmd("clear avg");
    nios_command_control_asp(state, NIOS_ADDR_AVE_ASP, NIOS_CMD_CLEAR);
    nios_demo_cmd("clear cor");
    nios_command_control_asp(state, NIOS_ADDR_COR_ASP, NIOS_CMD_CLEAR);
    nios_demo_cmd("clear pk");
    nios_command_control_asp(state, NIOS_ADDR_PK_ASP, NIOS_CMD_CLEAR);
}

static void nios_demo_hwclear(nios_command_state_t *state)
{
    nios_demo_cmd("hwclear");
    nios_command_clear_adapter(state);
}

static void nios_demo_hwloop(nios_command_state_t *state, int enabled)
{
    nios_demo_cmd(enabled ? "hwloop 1" : "hwloop 0");
    nios_command_set_loopback(state, enabled);
}

static void nios_demo_print_board_start_help(uint32_t requested)
{
    printf("BOARD DEMO ARMED\n");
    printf("Use SW1..SW0 and press KEY3 once for each START:\n");
    printf("  01 AVG  -> LEDR2\n");
    printf("  10 COR  -> LEDR1\n");
    printf("  11 PK   -> LEDR0\n");
    printf("  00 ADC  -> LEDR3\n");
    printf("Then run: capture %lu\n", (unsigned long)requested);
    fflush(stdout);
}

static int nios_run_demo(
    nios_command_state_t *state,
    const char *name,
    uint32_t requested
)
{
    printf("DEMO %s\n", name);
    fflush(stdout);

    if (strcmp(name, "adc") == 0) {
        if (requested == 0u) {
            requested = 16u;
        }

        nios_demo_hwclear(state);
        nios_demo_hwloop(state, 0);
        nios_demo_cmd("stop adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_STOP);
        nios_demo_cmd("adc nios 0 15");
        nios_command_config_adc(state, NIOS_ADDR_NIOS_II, 0u, 15u);
        nios_demo_cmd("clear adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_CLEAR);
        nios_demo_hwclear(state);
        nios_demo_cmd("start adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_START);
        printf("CAPTURE: ADC raw samples\n");
        nios_command_capture_adapter(state, requested);
        nios_demo_cmd("stop adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_STOP);
        return 0;
    }

    if (strcmp(name, "avg") == 0) {
        if (requested == 0u) {
            requested = 8u;
        }

        nios_demo_hwclear(state);
        nios_demo_hwloop(state, 0);
        nios_demo_cmd("stop adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_STOP);
        nios_demo_cmd("stop avg");
        nios_command_control_asp(state, NIOS_ADDR_AVE_ASP, NIOS_CMD_STOP);
        nios_demo_cmd("adc avg 0 15");
        nios_command_config_adc(state, NIOS_ADDR_AVE_ASP, 0u, 15u);
        nios_demo_cmd("avg nios 4");
        nios_command_config_avg(state, NIOS_ADDR_NIOS_II, 4u);
        nios_demo_cmd("clear adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_CLEAR);
        nios_demo_cmd("clear avg");
        nios_command_control_asp(state, NIOS_ADDR_AVE_ASP, NIOS_CMD_CLEAR);
        nios_demo_hwclear(state);
        nios_demo_cmd("start avg");
        nios_command_control_asp(state, NIOS_ADDR_AVE_ASP, NIOS_CMD_START);
        nios_demo_cmd("start adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_START);
        printf("CAPTURE: AVG window-4 output samples\n");
        nios_command_capture_adapter(state, requested);
        nios_demo_cmd("stop adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_STOP);
        nios_demo_cmd("stop avg");
        nios_command_control_asp(state, NIOS_ADDR_AVE_ASP, NIOS_CMD_STOP);
        return 0;
    }

    if (strcmp(name, "full") == 0 || strcmp(name, "peak") == 0) {
        if (requested == 0u) {
            requested = 8u;
        }

        nios_demo_hwclear(state);
        nios_demo_hwloop(state, 0);
        nios_demo_stop_all(state);
        nios_demo_cmd("adc avg 0 4");
        nios_command_config_adc(state, NIOS_ADDR_AVE_ASP, 0u, 4u);
        nios_demo_cmd("avg cor 4");
        nios_command_config_avg(state, NIOS_ADDR_COR_ASP, 4u);
        nios_demo_cmd("corwin 4");
        nios_command_config_cor_window(state, 4u);
        nios_demo_cmd("offset 100");
        nios_command_config_cor_offset(state, 100u);
        nios_demo_cmd("pk nios 0 0");
        nios_command_config_pk(state, NIOS_ADDR_NIOS_II, 0u, 0u);
        nios_demo_clear_all(state);
        nios_demo_hwclear(state);
        nios_demo_cmd("start avg");
        nios_command_control_asp(state, NIOS_ADDR_AVE_ASP, NIOS_CMD_START);
        nios_demo_cmd("start cor");
        nios_command_control_asp(state, NIOS_ADDR_COR_ASP, NIOS_CMD_START);
        nios_demo_cmd("start pk");
        nios_command_control_asp(state, NIOS_ADDR_PK_ASP, NIOS_CMD_START);
        nios_demo_cmd("start adc");
        nios_command_control_asp(state, NIOS_ADDR_ADC_ASP, NIOS_CMD_START);
        printf("CAPTURE: Peak count/value event packets\n");
        nios_command_capture_adapter(state, requested);
        nios_display_print_uart(state);
        nios_display_write_vga(state);
        return 0;
    }

    if (strcmp(name, "board") == 0 || strcmp(name, "switch") == 0) {
        if (requested == 0u) {
            requested = 8u;
        }

        nios_demo_hwclear(state);
        nios_demo_hwloop(state, 0);
        nios_demo_stop_all(state);
        nios_demo_cmd("adc avg 0 4");
        nios_command_config_adc(state, NIOS_ADDR_AVE_ASP, 0u, 4u);
        nios_demo_cmd("avg cor 4");
        nios_command_config_avg(state, NIOS_ADDR_COR_ASP, 4u);
        nios_demo_cmd("corwin 4");
        nios_command_config_cor_window(state, 4u);
        nios_demo_cmd("offset 100");
        nios_command_config_cor_offset(state, 100u);
        nios_demo_cmd("pk nios 0 0");
        nios_command_config_pk(state, NIOS_ADDR_NIOS_II, 0u, 0u);
        nios_demo_clear_all(state);
        nios_demo_hwclear(state);
        nios_demo_print_board_start_help(requested);
        return 0;
    }

    printf("ERR: demo <adc|avg|full|board> [count]\n");
    return -1;
}

static int nios_handle_line(nios_command_state_t *state, char *line)
{
    char command[16] = {0};
    char arg1[32] = {0};
    char arg2[32] = {0};
    char arg3[32] = {0};
    int fields;

    fields = sscanf(line, "%15s %31s %31s %31s", command, arg1, arg2, arg3);
    if (fields <= 0) {
        return 1;
    }

    nios_lowercase(command);
    nios_lowercase(arg1);
    nios_lowercase(arg2);
    nios_lowercase(arg3);

    if (strcmp(command, "adc") == 0) {
        if (fields < 4) {
            printf("ERR: adc <dest> <ch> <div>\n");
            return 1;
        }
        nios_handle_adc(state, arg1, arg2, arg3);
    } else if (strcmp(command, "avg") == 0) {
        if (fields < 3) {
            printf("ERR: avg <dest> <win>\n");
            return 1;
        }
        nios_handle_avg(state, arg1, arg2);
    } else if (strcmp(command, "corwin") == 0) {
        if (fields < 2) {
            printf("ERR: corwin <n>\n");
            return 1;
        }
        nios_handle_cor_window(state, arg1);
    } else if (strcmp(command, "offset") == 0) {
        if (fields < 2) {
            printf("ERR: offset <n>\n");
            return 1;
        }
        nios_handle_offset(state, arg1);
    } else if (strcmp(command, "pk") == 0) {
        if (fields < 4) {
            printf("ERR: pk <dest> <spacing> <threshold>\n");
            return 1;
        }
        nios_handle_pk(state, arg1, arg2, arg3);
    } else if (strcmp(command, "rx") == 0) {
        if (fields < 2) {
            printf("ERR: rx <hex>\n");
            return 1;
        }
        nios_handle_rx(state, arg1);
    } else if (strcmp(command, "start") == 0) {
        if (fields < 2) {
            printf("ERR: start <adc|avg|cor|pk>\n");
            return 1;
        }
        nios_handle_control(state, arg1, NIOS_CMD_START);
    } else if (strcmp(command, "stop") == 0) {
        if (fields < 2) {
            printf("ERR: stop <adc|avg|cor|pk>\n");
            return 1;
        }
        nios_handle_control(state, arg1, NIOS_CMD_STOP);
    } else if (strcmp(command, "clear") == 0) {
        if (fields < 2) {
            printf("ERR: clear <adc|avg|cor|pk|console>\n");
            return 1;
        }
        if (strcmp(arg1, "console") == 0
            || strcmp(arg1, "vga") == 0
            || strcmp(arg1, "screen") == 0) {
            nios_display_clear_console();
            printf("Console output cleared\n");
        } else {
            nios_handle_control(state, arg1, NIOS_CMD_CLEAR);
        }
    } else if (strcmp(command, "poll") == 0) {
        nios_command_poll_adapter(state);
    } else if (strcmp(command, "capture") == 0) {
        uint32_t count;

        if (fields < 2 || !nios_parse_limit(arg1, 256u, &count) || count == 0u) {
            printf("ERR: capture <1..256>\n");
            return 1;
        }
        nios_command_capture_adapter(state, count);
    } else if (strcmp(command, "demo") == 0) {
        uint32_t count = 0u;

        if (fields < 2) {
            printf("ERR: demo <adc|avg|full|board> [count]\n");
            return 1;
        }
        if (fields >= 3 && (!nios_parse_limit(arg2, 256u, &count) || count == 0u)) {
            printf("ERR: demo <adc|avg|full|board> [1..256]\n");
            return 1;
        }
        nios_run_demo(state, arg1, count);
    } else if (strcmp(command, "hwstatus") == 0) {
        nios_command_print_adapter_status(state);
    } else if (strcmp(command, "hwclear") == 0) {
        nios_command_clear_adapter(state);
    } else if (strcmp(command, "hwloop") == 0) {
        if (fields < 2 || (strcmp(arg1, "0") != 0 && strcmp(arg1, "1") != 0)) {
            printf("ERR: hwloop <0|1>\n");
            return 1;
        }
        nios_command_set_loopback(state, strcmp(arg1, "1") == 0);
    } else if (strcmp(command, "status") == 0) {
        nios_command_print_status(state);
    } else if (strcmp(command, "display") == 0) {
        nios_display_print_uart(state);
        nios_display_write_vga(state);
    } else if (strcmp(command, "cls") == 0) {
        nios_display_clear_console();
        printf("Console output cleared\n");
    } else if (strcmp(command, "help") == 0 || strcmp(command, "?") == 0) {
        nios_print_help();
    } else if (strcmp(command, "quit") == 0 || strcmp(command, "exit") == 0) {
        return 0;
    } else {
        printf("ERR: unknown command\n");
    }

    return 1;
}

int main(void)
{
    nios_command_state_t state;
#ifdef NIOS_NOC_ADAPTER_BASE
    nios_noc_adapter_t adapter;
#endif
    char line[NIOS_LINE_MAX];

    nios_command_init(&state);

#ifdef NIOS_NOC_ADAPTER_BASE
    nios_noc_adapter_init(
        &adapter,
        (uintptr_t)NIOS_NOC_ADAPTER_BASE,
        NIOS_NOC_DEFAULT_TIMEOUT
    );
    nios_command_attach_adapter(&state, &adapter);
#endif

    nios_display_init_vga();
    printf("Nios command console\n");
    nios_print_help();

    while (1) {
        fputs("\nnios> ", stdout);
        fflush(stdout);

        if (fgets(line, sizeof(line), stdin) == NULL) {
            break;
        }

        nios_log_command_to_vga(line);

        if (!nios_handle_line(&state, line)) {
            break;
        }
    }

    printf("end\n");
    return 0;
}
