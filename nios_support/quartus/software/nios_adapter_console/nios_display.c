#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

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

    if (state->has_peak_count && state->has_peak_value) {
        snprintf(snapshot->lines[6], sizeof(snapshot->lines[6]),
                 "RESULT: peak value=%lu spacing=%lu",
                 (unsigned long)state->latest_peak_value,
                 (unsigned long)state->latest_peak_count);
    } else if (state->has_peak_count) {
        snprintf(snapshot->lines[6], sizeof(snapshot->lines[6]),
                 "RESULT: peak spacing=%lu, waiting value",
                 (unsigned long)state->latest_peak_count);
    } else if (state->has_peak_value) {
        snprintf(snapshot->lines[6], sizeof(snapshot->lines[6]),
                 "RESULT: peak value=%lu",
                 (unsigned long)state->latest_peak_value);
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
        nios_console_printf("%s\n", snapshot.lines[row]);
    }
}

#ifdef NIOS_VGA_CHAR_BUFFER_BASE
#define NIOS_VGA_TOP_MARGIN 2u
#define NIOS_VGA_BOTTOM_MARGIN 2u
#define NIOS_VGA_LEFT_MARGIN 2u
#define NIOS_VGA_RIGHT_MARGIN 2u
#define NIOS_VGA_STATUS_TITLE_ROW NIOS_VGA_TOP_MARGIN
#define NIOS_VGA_LOG_DIVIDER_ROW (NIOS_VGA_STATUS_TITLE_ROW + 2u)
#define NIOS_VGA_LOG_START_ROW (NIOS_VGA_LOG_DIVIDER_ROW + 1u)
#define NIOS_VGA_LOG_INPUT_LEN 512u

#if NIOS_VGA_CHAR_ROWS > (NIOS_VGA_LOG_START_ROW + NIOS_VGA_BOTTOM_MARGIN)
#define NIOS_VGA_LOG_ROWS (NIOS_VGA_CHAR_ROWS - NIOS_VGA_LOG_START_ROW - NIOS_VGA_BOTTOM_MARGIN)
#else
#define NIOS_VGA_LOG_ROWS 1u
#endif

#if NIOS_VGA_CHAR_COLS > (NIOS_VGA_LEFT_MARGIN + NIOS_VGA_RIGHT_MARGIN)
#define NIOS_VGA_VISIBLE_COLS (NIOS_VGA_CHAR_COLS - NIOS_VGA_LEFT_MARGIN - NIOS_VGA_RIGHT_MARGIN)
#else
#define NIOS_VGA_VISIBLE_COLS NIOS_VGA_CHAR_COLS
#endif

static char nios_vga_log[NIOS_VGA_LOG_ROWS][NIOS_VGA_VISIBLE_COLS + 1u];
static char nios_vga_partial[NIOS_VGA_LOG_INPUT_LEN + 1u];
static unsigned int nios_vga_partial_len;
static int nios_vga_ready;

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

static void nios_display_copy_line(char *destination, const char *source)
{
    unsigned int col;

    if (source == NULL) {
        source = "";
    }

    for (col = 0u; col < NIOS_VGA_VISIBLE_COLS && source[col] != '\0'; col++) {
        destination[col] = source[col];
    }

    destination[col] = '\0';
}

static void nios_display_redraw_log(void)
{
    unsigned int row;

    for (row = 0u; row < NIOS_VGA_LOG_ROWS; row++) {
        nios_display_write_line(NIOS_VGA_LOG_START_ROW + row, nios_vga_log[row]);
    }
}

static void nios_display_draw_header(void)
{
    unsigned int row;

    for (row = NIOS_VGA_TOP_MARGIN; row < NIOS_VGA_LOG_START_ROW; row++) {
        nios_display_write_line(row, "");
    }

    nios_display_write_line(NIOS_VGA_STATUS_TITLE_ROW, "Nios II console / VGA mirror");
    nios_display_write_line(NIOS_VGA_LOG_DIVIDER_ROW, "---- console output ----");
}

static void nios_display_append_log_row(const char *text)
{
    unsigned int row;

    for (row = 0u; row + 1u < NIOS_VGA_LOG_ROWS; row++) {
        nios_display_copy_line(nios_vga_log[row], nios_vga_log[row + 1u]);
    }

    nios_display_copy_line(nios_vga_log[NIOS_VGA_LOG_ROWS - 1u], text);
}

static void nios_display_append_wrapped_line(const char *text)
{
    char line[NIOS_VGA_VISIBLE_COLS + 1u];
    unsigned int pos = 0u;

    if (text == NULL) {
        text = "";
    }

    if (text[0] == '\0') {
        nios_display_append_log_row("");
        return;
    }

    while (text[pos] != '\0') {
        unsigned int len = 0u;
        unsigned int copy_len;
        unsigned int last_space = 0u;
        int saw_space = 0;

        while (len < NIOS_VGA_VISIBLE_COLS && text[pos + len] != '\0') {
            if (text[pos + len] == ' ') {
                last_space = len;
                saw_space = 1;
            }
            len++;
        }

        copy_len = len;
        if (text[pos + len] != '\0' && saw_space && last_space > 0u) {
            copy_len = last_space;
        }

        if (copy_len == 0u) {
            copy_len = len;
        }

        for (len = 0u; len < copy_len; len++) {
            line[len] = text[pos + len];
        }
        line[copy_len] = '\0';
        nios_display_append_log_row(line);

        pos += copy_len;
        while (text[pos] == ' ') {
            pos++;
        }
    }
}

static void nios_display_flush_partial(void)
{
    nios_vga_partial[nios_vga_partial_len] = '\0';
    nios_display_log_line(nios_vga_partial);
    nios_vga_partial_len = 0u;
    nios_vga_partial[0] = '\0';
}
#endif

void nios_display_init_vga(void)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    unsigned int row;

    nios_vga_ready = 1;
    nios_vga_partial_len = 0u;
    nios_vga_partial[0] = '\0';

    for (row = 0u; row < NIOS_VGA_LOG_ROWS; row++) {
        nios_vga_log[row][0] = '\0';
    }

    for (row = 0u; row < NIOS_VGA_CHAR_ROWS; row++) {
        nios_display_write_line(row, "");
    }

    nios_display_draw_header();
    nios_display_redraw_log();
#endif
}

void nios_display_clear_console(void)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    unsigned int row;

    if (!nios_vga_ready) {
        nios_display_init_vga();
    }

    nios_vga_partial_len = 0u;
    nios_vga_partial[0] = '\0';

    for (row = 0u; row < NIOS_VGA_LOG_ROWS; row++) {
        nios_vga_log[row][0] = '\0';
    }

    nios_display_draw_header();
    nios_display_redraw_log();
#endif
}

void nios_display_log_line(const char *text)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    if (!nios_vga_ready) {
        nios_display_init_vga();
    }

    nios_display_append_wrapped_line(text);
    nios_display_redraw_log();
#else
    (void)text;
#endif
}

void nios_display_log_text(const char *text)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    char ch;

    if (text == NULL) {
        return;
    }

    if (!nios_vga_ready) {
        nios_display_init_vga();
    }

    while ((ch = *text++) != '\0') {
        if (ch == '\r') {
            continue;
        }

        if (ch == '\n') {
            nios_display_flush_partial();
            continue;
        }

        if (nios_vga_partial_len >= NIOS_VGA_LOG_INPUT_LEN) {
            nios_display_flush_partial();
        }

        nios_vga_partial[nios_vga_partial_len++] = ch;
        nios_vga_partial[nios_vga_partial_len] = '\0';
    }
#else
    (void)text;
#endif
}

int nios_display_write_vga(const nios_command_state_t *state)
{
#ifdef NIOS_VGA_CHAR_BUFFER_BASE
    (void)state;

    if (!nios_vga_ready) {
        nios_display_init_vga();
    }

    nios_display_draw_header();
    nios_display_redraw_log();
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
