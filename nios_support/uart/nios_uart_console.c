#include <ctype.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "nios_command.h"

#define NIOS_LINE_MAX 80

static void nios_print_help(void)
{
    printf("cmd: mode 1|2, window <n>, start, reset, status, help, exit\n");
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

static int nios_handle_mode(
    nios_command_state_t *state,
    const char *argument
)
{
    unsigned mode;

    if (strcmp(argument, "1") == 0) {
        mode = 1u;
    } else if (strcmp(argument, "2") == 0) {
        mode = 2u;
    } else {
        printf("ERR: mode 1|2\n");
        return 0;
    }

    return nios_command_set_mode(state, mode);
}

static int nios_handle_window(
    nios_command_state_t *state,
    const char *argument
)
{
    uint32_t window;

    if (!nios_parse_u16(argument, &window) || window == 0u) {
        printf("ERR: window 1..65535\n");
        return 0;
    }

    return nios_command_set_window(state, window);
}

static int nios_handle_line(nios_command_state_t *state, char *line)
{
    char command[16] = {0};
    char argument[32] = {0};
    int fields;

    fields = sscanf(line, "%15s %31s", command, argument);
    if (fields <= 0) {
        return 1;
    }

    nios_lowercase(command);
    nios_lowercase(argument);

    if (strcmp(command, "mode") == 0) {
        if (fields < 2) {
            printf("ERR: mode 1|2\n");
            return 1;
        }
        nios_handle_mode(state, argument);
    } else if (strcmp(command, "window") == 0) {
        if (fields < 2) {
            printf("ERR: window <n>\n");
            return 1;
        }
        nios_handle_window(state, argument);
    } else if (strcmp(command, "start") == 0) {
        nios_command_start(state);
    } else if (strcmp(command, "reset") == 0) {
        nios_command_reset(state);
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
