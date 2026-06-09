#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "nios_display.h"

static const char *nios_display_cfg_mark(uint32_t mask, uint32_t bit)
{
    return (mask & bit) != 0u ? "OK" : "--";
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

static const char *nios_display_path_name(const nios_command_state_t *state)
{
    if ((state->config_done_mask & NIOS_DISPLAY_CFG_ADC) != 0u
        && state->adc_dest == NIOS_ADDR_NIOS_II) {
        return "ADC -> NIOS";
    }

    if ((state->config_done_mask & (NIOS_DISPLAY_CFG_ADC | NIOS_DISPLAY_CFG_AVG))
        == (NIOS_DISPLAY_CFG_ADC | NIOS_DISPLAY_CFG_AVG)
        && state->adc_dest == NIOS_ADDR_AVE_ASP
        && state->avg_dest == NIOS_ADDR_NIOS_II) {
        return "ADC -> AVG -> NIOS";
    }

    if ((state->config_done_mask
         & (NIOS_DISPLAY_CFG_ADC
            | NIOS_DISPLAY_CFG_AVG
            | NIOS_DISPLAY_CFG_COR
            | NIOS_DISPLAY_CFG_PK))
        == (NIOS_DISPLAY_CFG_ADC
            | NIOS_DISPLAY_CFG_AVG
            | NIOS_DISPLAY_CFG_COR
            | NIOS_DISPLAY_CFG_PK)
        && state->adc_dest == NIOS_ADDR_AVE_ASP
        && state->avg_dest == NIOS_ADDR_COR_ASP
        && state->pk_dest == NIOS_ADDR_NIOS_II) {
        return "ADC -> AVG -> COR -> PK -> NIOS";
    }

    return "waiting for configuration";
}

static const char *nios_display_mode_name(const nios_command_state_t *state)
{
    if (strcmp(state->last_demo_name, "board") == 0) {
        return "BOARD CONTROL";
    }

    if (strcmp(state->last_demo_name, "adc") == 0) {
        return "ADC DIRECT";
    }

    if (strcmp(state->last_demo_name, "avg") == 0) {
        return "AVG DIRECT";
    }

    if (strcmp(state->last_demo_name, "full") == 0) {
        return "FULL PIPELINE";
    }

    return "READY";
}

static const char *nios_display_control_name(const nios_command_state_t *state)
{
    if (state->board_demo_armed) {
        return "SWITCH/KEY";
    }

    if (state->last_demo_name[0] != '\0') {
        return "UART";
    }

    return "UART / BOARD";
}

void nios_display_format(
    const nios_command_state_t *state,
    nios_display_snapshot_t *snapshot
)
{
    unsigned int row;

    for (row = 0u; row < NIOS_DISPLAY_LINE_COUNT; row++) {
        snapshot->lines[row][0] = '\0';
    }

    snprintf(snapshot->lines[0], sizeof(snapshot->lines[0]),
             "FREQUENCY DETECTOR DASHBOARD");
    snprintf(snapshot->lines[2], sizeof(snapshot->lines[2]),
             "Mode    : %s        Control: %s",
             nios_display_mode_name(state),
             nios_display_control_name(state));
    snprintf(snapshot->lines[3], sizeof(snapshot->lines[3]),
             "Path    : %s", nios_display_path_name(state));
    snprintf(snapshot->lines[4], sizeof(snapshot->lines[4]),
             "Link    : %s",
             state->adapter == NULL ? "DRY RUN" : "AVALON-NOC");

    snprintf(snapshot->lines[6], sizeof(snapshot->lines[6]),
             "Pipeline:");
    snprintf(snapshot->lines[7], sizeof(snapshot->lines[7]),
             "ADC[%s] -> AVG[%s] -> COR[%s] -> PK[%s] -> NIOS[%s]",
             nios_display_cfg_mark(state->config_done_mask, NIOS_DISPLAY_CFG_ADC),
             nios_display_cfg_mark(state->config_done_mask, NIOS_DISPLAY_CFG_AVG),
             nios_display_cfg_mark(state->config_done_mask, NIOS_DISPLAY_CFG_COR),
             nios_display_cfg_mark(state->config_done_mask, NIOS_DISPLAY_CFG_PK),
             state->has_last_rx ? "RX" : "--");

    snprintf(snapshot->lines[9], sizeof(snapshot->lines[9]),
             "Config:");
    snprintf(snapshot->lines[10], sizeof(snapshot->lines[10]),
             "div=%lu | avg=%lu | cor_win=%lu | off=%lu | pk_sp=%lu | th=%lu",
             (unsigned long)state->adc_divider,
             (unsigned long)state->avg_window,
             (unsigned long)state->cor_window,
             (unsigned long)state->cor_offset,
             (unsigned long)state->pk_spacing,
             (unsigned long)state->pk_threshold);

    snprintf(snapshot->lines[12], sizeof(snapshot->lines[12]),
             "Latest Result:");

    if (state->has_peak_value) {
        snprintf(snapshot->lines[13], sizeof(snapshot->lines[13]),
                 "Peak value   : %lu",
                 (unsigned long)state->latest_peak_value);
    } else {
        snprintf(snapshot->lines[13], sizeof(snapshot->lines[13]),
                 "Peak value   : waiting");
    }

    if (state->has_peak_count) {
        snprintf(snapshot->lines[14], sizeof(snapshot->lines[14]),
                 "Peak spacing : %lu samples",
                 (unsigned long)state->latest_peak_count);
    } else {
        snprintf(snapshot->lines[14], sizeof(snapshot->lines[14]),
                 "Peak spacing : waiting");
    }

    snprintf(snapshot->lines[15], sizeof(snapshot->lines[15]),
             "PK events    : %lu",
             (unsigned long)state->peak_event_packets);

    if (state->last_capture_requested != 0u) {
        snprintf(snapshot->lines[16], sizeof(snapshot->lines[16]),
                 "RX packets   : %lu / %lu",
                 (unsigned long)state->last_capture_received,
                 (unsigned long)state->last_capture_requested);
    } else {
        snprintf(snapshot->lines[16], sizeof(snapshot->lines[16]),
                 "RX packets   : waiting for capture");
    }

    snprintf(snapshot->lines[17], sizeof(snapshot->lines[17]),
             "RX overflow  : %s",
             state->last_capture_overflow ? "seen" : "clear");

    if (state->has_last_status) {
        snprintf(snapshot->lines[19], sizeof(snapshot->lines[19]),
                 "Status       : %s from %s, detail=0x%04lX",
                 nios_display_status_name(state->last_status_code),
                 nios_display_dest_name(state->last_status_source),
                 (unsigned long)state->last_status_detail);
    } else if (state->has_peak_count || state->has_peak_value) {
        snprintf(snapshot->lines[19], sizeof(snapshot->lines[19]),
                 "Status       : receiving PK events from NoC");
    } else if (state->board_demo_armed) {
        snprintf(snapshot->lines[19], sizeof(snapshot->lines[19]),
                 "Status       : board armed; use SW1..0 + KEY3");
    } else {
        snprintf(snapshot->lines[19], sizeof(snapshot->lines[19]),
                 "Status       : waiting for ASP response");
    }

    if (state->last_demo_name[0] == '\0') {
        snprintf(snapshot->lines[21], sizeof(snapshot->lines[21]),
                 "Demo         : run demo full 8 or demo board 8");
    } else if (state->last_capture_requested != 0u) {
        snprintf(snapshot->lines[21], sizeof(snapshot->lines[21]),
                 "Demo         : %s %lu | capture %lu/%lu",
                 state->last_demo_name,
                 (unsigned long)state->last_demo_count,
                 (unsigned long)state->last_capture_received,
                 (unsigned long)state->last_capture_requested);
    } else if (state->board_demo_armed) {
        snprintf(snapshot->lines[21], sizeof(snapshot->lines[21]),
                 "Demo         : board %lu | then capture %lu",
                 (unsigned long)state->last_demo_count,
                 (unsigned long)state->last_demo_count);
    } else {
        snprintf(snapshot->lines[21], sizeof(snapshot->lines[21]),
                 "Demo         : %s %lu",
                 state->last_demo_name,
                 (unsigned long)state->last_demo_count);
    }

    if (state->board_demo_armed) {
        snprintf(snapshot->lines[22], sizeof(snapshot->lines[22]),
                 "Board input  : SW1..0 select ASP, KEY3 start");
        snprintf(snapshot->lines[23], sizeof(snapshot->lines[23]),
                 "               KEY2 stop, KEY1 clear");
    } else {
        snprintf(snapshot->lines[22], sizeof(snapshot->lines[22]),
                 "UART command : demo full <n>, demo board <n>, display");
        snprintf(snapshot->lines[23], sizeof(snapshot->lines[23]),
                 "Board demo   : SW select ASP, KEY3 starts selected ASP");
    }
}

void nios_display_print_uart(const nios_command_state_t *state)
{
    nios_display_snapshot_t snapshot;
    unsigned int row;

    nios_display_format(state, &snapshot);
    for (row = 0u; row < NIOS_DISPLAY_LINE_COUNT; row++) {
        nios_console_printf("%s\n", snapshot.lines[row]);
    }
}

#ifdef NIOS_VGA_CHAR_BUFFER_BASE
#define NIOS_VGA_TOP_MARGIN 4u
#define NIOS_VGA_LEFT_MARGIN 6u
#define NIOS_VGA_RIGHT_MARGIN 2u
#define NIOS_VGA_STATUS_START_ROW NIOS_VGA_TOP_MARGIN
#define NIOS_VGA_ROW_SPACING 2u

#if NIOS_VGA_CHAR_COLS > (NIOS_VGA_LEFT_MARGIN + NIOS_VGA_RIGHT_MARGIN)
#define NIOS_VGA_VISIBLE_COLS (NIOS_VGA_CHAR_COLS - NIOS_VGA_LEFT_MARGIN - NIOS_VGA_RIGHT_MARGIN)
#else
#define NIOS_VGA_VISIBLE_COLS NIOS_VGA_CHAR_COLS
#endif

static int nios_vga_ready;

static unsigned int nios_display_dashboard_row(unsigned int row)
{
    return NIOS_VGA_STATUS_START_ROW + (row * NIOS_VGA_ROW_SPACING);
}

static void nios_display_write_line(unsigned int row, const char *text)
{
    volatile uint8_t *buffer = (volatile uint8_t *)(uintptr_t)NIOS_VGA_CHAR_BUFFER_BASE;
    unsigned int col;
    int ended = 0;

    if (row >= NIOS_VGA_CHAR_ROWS) {
        return;
    }

    if (text == NULL) {
        text = "";
    }

    for (col = 0u; col < NIOS_VGA_CHAR_COLS; col++) {
        buffer[(row * NIOS_VGA_CHAR_ROW_STRIDE) + col] = (uint8_t)' ';
    }

    for (col = 0u; col < NIOS_VGA_VISIBLE_COLS; col++) {
        char ch = ended ? ' ' : text[col];

        if (ch == '\0') {
            ch = ' ';
            ended = 1;
        }

        buffer[(row * NIOS_VGA_CHAR_ROW_STRIDE) + NIOS_VGA_LEFT_MARGIN + col] =
            (uint8_t)ch;
    }
}

static void nios_display_draw_dashboard(const nios_command_state_t *state)
{
    nios_display_snapshot_t snapshot;
    unsigned int row;

    for (row = 0u; row < NIOS_VGA_CHAR_ROWS; row++) {
        nios_display_write_line(row, "");
    }

    if (state != NULL) {
        nios_display_format(state, &snapshot);
        for (row = 0u; row < NIOS_DISPLAY_LINE_COUNT; row++) {
            nios_display_write_line(nios_display_dashboard_row(row),
                                    snapshot.lines[row]);
        }
    } else {
        nios_display_write_line(nios_display_dashboard_row(0u),
                                "FREQUENCY DETECTOR DASHBOARD");
        nios_display_write_line(nios_display_dashboard_row(2u),
                                "Mode    : READY        Control: UART / BOARD");
        nios_display_write_line(nios_display_dashboard_row(3u),
                                "Path    : waiting for configuration");
        nios_display_write_line(nios_display_dashboard_row(4u),
                                "Link    : waiting for Nios II");
        nios_display_write_line(nios_display_dashboard_row(6u),
                                "Pipeline:");
        nios_display_write_line(nios_display_dashboard_row(7u),
                                "ADC[--] -> AVG[--] -> COR[--] -> PK[--] -> NIOS[--]");
        nios_display_write_line(nios_display_dashboard_row(12u),
                                "Latest Result:");
        nios_display_write_line(nios_display_dashboard_row(13u),
                                "Peak value   : waiting");
        nios_display_write_line(nios_display_dashboard_row(14u),
                                "Peak spacing : waiting");
        nios_display_write_line(nios_display_dashboard_row(19u),
                                "Status       : waiting for command");
        nios_display_write_line(nios_display_dashboard_row(21u),
                                "Demo         : run demo full 8 or demo board 8");
        nios_display_write_line(nios_display_dashboard_row(22u),
                                "UART command : demo full <n>, demo board <n>, display");
    }
}
#endif

void nios_display_init_vga(void)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    unsigned int row;

    nios_vga_ready = 1;

    for (row = 0u; row < NIOS_VGA_CHAR_ROWS; row++) {
        nios_display_write_line(row, "");
    }

    nios_display_draw_dashboard(NULL);
#endif
}

void nios_display_clear_console(void)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    if (!nios_vga_ready) {
        nios_display_init_vga();
    }

    nios_display_draw_dashboard(NULL);
#endif
}

void nios_display_log_line(const char *text)
{
    (void)text;
}

void nios_display_log_text(const char *text)
{
    (void)text;
}

int nios_display_write_vga(const nios_command_state_t *state)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    if (!nios_vga_ready) {
        nios_display_init_vga();
    }

    nios_display_draw_dashboard(state);
    return 0;
#else
    (void)state;
    return -1;
#endif
}

int nios_console_printf(const char *format, ...)
{
    char text[512];
    va_list args;
    int written;

    va_start(args, format);
    written = vprintf(format, args);
    va_end(args);

    va_start(args, format);
    if (vsnprintf(text, sizeof(text), format, args) >= 0) {
        text[sizeof(text) - 1u] = '\0';
        nios_display_log_text(text);
    }
    va_end(args);

    return written;
}
