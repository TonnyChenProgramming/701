#include <ctype.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "nios_command.h"
#include "nios_packet.h"

#define NIOS_LINE_MAX 80

static void nios_print_help(void)
{
    printf("cmd: adc <dest> <ch> <div>, avg <dest> <win>, corwin <n>, offset <n>, pk <dest> <sp> <th>, rx <hex>, status, exit\n");
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
    } else if (strcmp(command, "status") == 0) {
        nios_command_print_status(state);
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
    char line[NIOS_LINE_MAX];

    nios_command_init(&state);

    printf("Nios command console\n");
    nios_print_help();

    while (1) {
        printf("\nnios> ");
        fflush(stdout);

        if (fgets(line, sizeof(line), stdin) == NULL) {
            break;
        }

        if (!nios_handle_line(&state, line)) {
            break;
        }
    }

    printf("end\n");
    return 0;
}
