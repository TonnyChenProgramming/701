#include <stdint.h>
#include <stdio.h>

#include "nios_display.h"

static const char *nios_display_yes_no(int value)
{
    return value ? "yes" : "no";
}

static const char *nios_display_dest_name(uint32_t dest)
{
    switch (dest) {
        case NIOS_ADDR_RECOP:
            return "RECOP";
        case NIOS_ADDR_ADC_ASP:
            return "ADC";
        case NIOS_ADDR_AVE_ASP:
            return "AVG";
        case NIOS_ADDR_COR_ASP:
            return "COR";
        case NIOS_ADDR_PK_ASP:
            return "PK";
        case NIOS_ADDR_NIOS_II:
            return "NIOS";
        case NIOS_ADDR_IDLE:
            return "IDLE";
        case NIOS_ADDR_NULL:
            return "NULL";
        default:
            return "?";
    }
}

static const char *nios_display_status_name(uint32_t code)
{
    switch (code) {
        case NIOS_TAG_STATUS:
            return "STATUS";
        case NIOS_CMD_CONFIG:
            return "CONFIG_DONE";
        case NIOS_CMD_START:
            return "START_DONE";
        case NIOS_CMD_STOP:
            return "STOP_DONE";
        case NIOS_CMD_CLEAR:
            return "CLEAR_DONE";
        default:
            return "STATUS?";
    }
}

void nios_display_format(
    const nios_command_state_t *state,
    nios_display_snapshot_t *snapshot
)
{
    snprintf(snapshot->lines[0], sizeof(snapshot->lines[0]),
             "NIOS ASP STATUS");
    snprintf(snapshot->lines[1], sizeof(snapshot->lines[1]),
             "LINK: %s", state->adapter == NULL ? "DRY RUN" : "AVALON-NOC");
    snprintf(snapshot->lines[2], sizeof(snapshot->lines[2]),
             "ADC: cfg=%s dest=%s ch=%lu div=%lu",
             nios_display_yes_no((state->config_done_mask & NIOS_DISPLAY_CFG_ADC) != 0u),
             nios_display_dest_name(state->adc_dest),
             (unsigned long)state->adc_channel,
             (unsigned long)state->adc_divider);
    snprintf(snapshot->lines[3], sizeof(snapshot->lines[3]),
             "AVG: cfg=%s dest=%s window=%lu",
             nios_display_yes_no((state->config_done_mask & NIOS_DISPLAY_CFG_AVG) != 0u),
             nios_display_dest_name(state->avg_dest),
             (unsigned long)state->avg_window);
    snprintf(snapshot->lines[4], sizeof(snapshot->lines[4]),
             "COR: cfg=%s window=%lu offset=%lu",
             nios_display_yes_no((state->config_done_mask & NIOS_DISPLAY_CFG_COR) != 0u),
             (unsigned long)state->cor_window,
             (unsigned long)state->cor_offset);
    snprintf(snapshot->lines[5], sizeof(snapshot->lines[5]),
             "PK : cfg=%s dest=%s spacing=%lu threshold=%lu",
             nios_display_yes_no((state->config_done_mask & NIOS_DISPLAY_CFG_PK) != 0u),
             nios_display_dest_name(state->pk_dest),
             (unsigned long)state->pk_spacing,
             (unsigned long)state->pk_threshold);

    if (state->has_peak_count) {
        snprintf(snapshot->lines[6], sizeof(snapshot->lines[6]),
                 "RESULT: peak count=%lu",
                 (unsigned long)state->latest_peak_count);
    } else {
        snprintf(snapshot->lines[6], sizeof(snapshot->lines[6]),
                 "RESULT: waiting for PK event");
    }

    if (state->has_last_status) {
        snprintf(snapshot->lines[7], sizeof(snapshot->lines[7]),
                 "ACK: %s from %s detail=0x%04lX",
                 nios_display_status_name(state->last_status_code),
                 nios_display_dest_name(state->last_status_source),
                 (unsigned long)state->last_status_detail);
    } else {
        snprintf(snapshot->lines[7], sizeof(snapshot->lines[7]),
                 "ACK: waiting for ASP status");
    }
}

void nios_display_print_uart(const nios_command_state_t *state)
{
    nios_display_snapshot_t snapshot;
    unsigned int row;

    nios_display_format(state, &snapshot);
    for (row = 0u; row < NIOS_DISPLAY_LINE_COUNT; row++) {
        printf("%s\n", snapshot.lines[row]);
    }
}

#ifdef NIOS_VGA_CHAR_BUFFER_BASE
static void nios_display_write_line(unsigned int row, const char *text)
{
    volatile uint8_t *buffer = (volatile uint8_t *)(uintptr_t)NIOS_VGA_CHAR_BUFFER_BASE;
    unsigned int col;
    int ended = 0;

    if (row >= NIOS_VGA_CHAR_ROWS) {
        return;
    }

    for (col = 0u; col < NIOS_VGA_CHAR_COLS; col++) {
        char ch = ended ? ' ' : text[col];

        if (ch == '\0') {
            ch = ' ';
            ended = 1;
        }

        buffer[(row * NIOS_VGA_CHAR_ROW_STRIDE) + col] =
            (uint8_t)ch;
    }
}
#endif

int nios_display_write_vga(const nios_command_state_t *state)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    nios_display_snapshot_t snapshot;
    unsigned int row;

    nios_display_format(state, &snapshot);
    for (row = 0u; row < NIOS_DISPLAY_LINE_COUNT; row++) {
        nios_display_write_line(row + 2u, snapshot.lines[row]);
    }
    return 0;
#else
    (void)state;
    return -1;
#endif
}
