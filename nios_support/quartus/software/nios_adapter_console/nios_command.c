#include <stdio.h>
#include <string.h>

#include "nios_command.h"
#include "nios_display.h"
#include "nios_packet.h"

#define printf nios_console_printf

#define NIOS_CAPTURE_EMPTY_LIMIT 5000000u

static const char *nios_dest_name(uint32_t dest);
static const char *nios_status_name(uint32_t code);

static int nios_command_send(nios_command_state_t *state, uint32_t packet)
{
    int rc;

    if (state->adapter != NULL) {
        rc = nios_noc_adapter_send(state->adapter, packet);
        if (rc != 0) {
            printf("ERR: noc tx %d\n", rc);
            fflush(stdout);
            return rc;
        }
    }

    if (nios_packet_kind(packet) == NIOS_PKT_KIND_CMD
        && nios_packet_code(packet) == NIOS_CMD_CONFIG
        && nios_packet_dest(packet) < 32u) {
        state->config_done_mask |= (1u << nios_packet_dest(packet));
    }

    state->last_tx_packet = packet;
    state->has_last_tx = 1;

    printf("TX 0x%08lX\n", (unsigned long)packet);
    fflush(stdout);
    return 0;
}

void nios_command_init(nios_command_state_t *state)
{
    memset(state, 0, sizeof(*state));
    state->adc_dest = NIOS_ADDR_AVE_ASP;
    state->adc_channel = 0u;
    state->adc_divider = 0u;
    state->avg_dest = NIOS_ADDR_COR_ASP;
    state->avg_window = 4u;
    state->cor_window = 64u;
    state->cor_offset = 0u;
    state->pk_dest = NIOS_ADDR_NIOS_II;
    state->pk_spacing = 200u;
    state->pk_threshold = 0u;
}

void nios_command_attach_adapter(
    nios_command_state_t *state,
    nios_noc_adapter_t *adapter
)
{
    state->adapter = adapter;
}

void nios_command_detach_adapter(nios_command_state_t *state)
{
    state->adapter = NULL;
}

int nios_command_config_adc(
    nios_command_state_t *state,
    uint32_t dest,
    uint32_t channel,
    uint32_t divider
)
{
    uint32_t payload;
    uint32_t packet;
    int rc;

    if (dest > 0xFu || channel > 3u || divider > 15u) {
        return -1;
    }

    payload = ((dest & 0xFu) << 16)
            | ((channel & 0x3u) << 14)
            | ((divider & 0xFu) << 10);
    packet = nios_make_packet(
        NIOS_PKT_KIND_CMD,
        NIOS_CMD_CONFIG,
        NIOS_ADDR_ADC_ASP,
        payload
    );

    rc = nios_command_send(state, packet);
    if (rc != 0) {
        return rc;
    }

    state->adc_dest = dest;
    state->adc_channel = channel;
    state->adc_divider = divider;
    return 0;
}

static int nios_window_to_shift(uint32_t window, uint32_t *shift_out)
{
    switch (window) {
        case 1u:
            *shift_out = 0u;
            return 0;
        case 2u:
            *shift_out = 1u;
            return 0;
        case 4u:
            *shift_out = 2u;
            return 0;
        case 8u:
            *shift_out = 3u;
            return 0;
        case 16u:
            *shift_out = 4u;
            return 0;
        default:
            return -1;
    }
}

int nios_command_config_avg(
    nios_command_state_t *state,
    uint32_t dest,
    uint32_t window
)
{
    uint32_t shift;
    uint32_t payload;
    uint32_t packet;
    int rc;

    if (dest > 0xFu || nios_window_to_shift(window, &shift) != 0) {
        return -1;
    }

    payload = ((dest & 0xFu) << 16) | ((shift & 0x7u) << 8);
    packet = nios_make_packet(
        NIOS_PKT_KIND_CMD,
        NIOS_CMD_CONFIG,
        NIOS_ADDR_AVE_ASP,
        payload
    );

    rc = nios_command_send(state, packet);
    if (rc != 0) {
        return rc;
    }

    state->avg_dest = dest;
    state->avg_window = window;
    return 0;
}

int nios_command_config_cor_window(
    nios_command_state_t *state,
    uint32_t window
)
{
    int rc;

    if (window == 0u || window > 511u) {
        return -1;
    }

    rc = nios_command_send(
        state,
        nios_make_config(NIOS_ADDR_COR_ASP, NIOS_TAG_WINDOW, window)
    );
    if (rc != 0) {
        return rc;
    }

    state->cor_window = window;
    return 0;
}

int nios_command_config_cor_offset(
    nios_command_state_t *state,
    uint32_t offset
)
{
    int rc;

    if (offset > NIOS_PAYLOAD_VALUE_MASK) {
        return -1;
    }

    rc = nios_command_send(
        state,
        nios_make_config(NIOS_ADDR_COR_ASP, NIOS_TAG_OFFSET, offset)
    );
    if (rc != 0) {
        return rc;
    }

    state->cor_offset = offset;
    return 0;
}

int nios_command_config_pk(
    nios_command_state_t *state,
    uint32_t dest,
    uint32_t spacing,
    uint32_t threshold
)
{
    uint32_t payload;
    uint32_t packet;
    int rc;

    if (dest > 0xFu || spacing > 255u || threshold > 15u) {
        return -1;
    }

    payload = ((dest & 0xFu) << 16)
            | ((spacing & 0xFFu) << 8)
            | ((threshold & 0xFu) << 4);
    packet = nios_make_packet(
        NIOS_PKT_KIND_CMD,
        NIOS_CMD_CONFIG,
        NIOS_ADDR_PK_ASP,
        payload
    );

    rc = nios_command_send(state, packet);
    if (rc != 0) {
        return rc;
    }

    state->pk_dest = dest;
    state->pk_spacing = spacing;
    state->pk_threshold = threshold;
    return 0;
}

int nios_command_control_asp(
    nios_command_state_t *state,
    uint32_t dest,
    uint32_t command
)
{
    uint32_t packet;

    if (dest > 0xFu
        || (command != NIOS_CMD_START
            && command != NIOS_CMD_STOP
            && command != NIOS_CMD_CLEAR)) {
        return -1;
    }

    packet = nios_make_simple_cmd(dest, command);
    return nios_command_send(state, packet);
}

void nios_command_note_demo(
    nios_command_state_t *state,
    const char *name,
    uint32_t requested,
    int board_armed
)
{
    if (name == NULL) {
        name = "";
    }

    strncpy(state->last_demo_name, name, sizeof(state->last_demo_name) - 1u);
    state->last_demo_name[sizeof(state->last_demo_name) - 1u] = '\0';
    state->last_demo_count = requested;
    state->last_capture_requested = 0u;
    state->last_capture_received = 0u;
    state->last_capture_overflow = 0u;
    state->peak_event_packets = 0u;
    state->has_peak_count = 0;
    state->has_peak_value = 0;
    state->has_last_status = 0;
    state->board_demo_armed = board_armed != 0;
}

void nios_command_record_rx(nios_command_state_t *state, uint32_t packet)
{
    uint32_t kind = nios_packet_kind(packet);
    uint32_t code = nios_packet_code(packet);
    uint32_t source;

    state->last_rx_packet = packet;
    state->has_last_rx = 1;

    if (nios_packet_dest(packet) == NIOS_ADDR_NIOS_II
        && kind == NIOS_PKT_KIND_EVENT) {
        state->peak_event_packets++;
    }

    if (nios_packet_dest(packet) == NIOS_ADDR_NIOS_II
        && kind == NIOS_PKT_KIND_EVENT
        && (code == NIOS_EVENT_MAX_PEAK || code == NIOS_EVENT_MIN_PEAK)) {
        state->latest_peak_count = nios_packet_payload(packet);
        state->has_peak_count = 1;
    }

    if (nios_packet_dest(packet) == NIOS_ADDR_NIOS_II
        && kind == NIOS_PKT_KIND_EVENT
        && code == NIOS_EVENT_PEAK_VALUE) {
        state->latest_peak_value = nios_packet_payload(packet);
        state->has_peak_value = 1;
    }

    if (nios_packet_dest(packet) == NIOS_ADDR_NIOS_II
        && kind == NIOS_PKT_KIND_STATUS) {
        source = nios_status_source(packet);
        state->last_status_source = source;
        state->last_status_code = code;
        state->last_status_detail = nios_status_detail(packet);
        state->has_last_status = 1;

        if (code == NIOS_CMD_CONFIG
            && nios_status_done(packet) != 0u
            && nios_status_error(packet) == 0u
            && source < 32u) {
            state->config_done_mask |= (1u << source);
        }
    }
}

int nios_command_poll_adapter(nios_command_state_t *state)
{
    uint32_t packet;
    int rc;

    if (state->adapter == NULL) {
        printf("ERR: no adapter\n");
        fflush(stdout);
        return -1;
    }

    rc = nios_noc_adapter_try_recv(state->adapter, &packet);
    if (rc < 0) {
        printf("ERR: noc rx %d\n", rc);
        fflush(stdout);
        return rc;
    }

    if (rc == 0) {
        printf("RX none\n");
        fflush(stdout);
        return 0;
    }

    nios_command_record_rx(state, packet);
    nios_command_print_rx(packet);
    if (rc > 1) {
        state->last_capture_overflow = 1u;
        printf("WARN: RX overflow was set; packet shown above was kept, later packet(s) were dropped\n");
    }
    fflush(stdout);
    return 1;
}

int nios_command_capture_adapter(nios_command_state_t *state, uint32_t requested)
{
    uint32_t packet;
    uint32_t received = 0u;
    uint32_t empty_guard = 0u;
    uint32_t progress_guard = 0u;
    uint32_t overflow_seen = 0u;
    int rc;

    if (state->adapter == NULL) {
        printf("ERR: no adapter\n");
        fflush(stdout);
        return -1;
    }

    if (requested == 0u) {
        printf("ERR: capture <count>\n");
        return -1;
    }

    printf("CAPTURE requested=%lu\n", (unsigned long)requested);
    fflush(stdout);

    while (received < requested && empty_guard < NIOS_CAPTURE_EMPTY_LIMIT) {
        rc = nios_noc_adapter_try_recv(state->adapter, &packet);
        if (rc < 0) {
            printf("ERR: noc rx %d\n", rc);
            fflush(stdout);
            return rc;
        }

        if (rc == 0) {
            empty_guard++;
            progress_guard++;
            if (progress_guard >= 1000000u) {
                printf("CAPTURE waiting...\n");
                fflush(stdout);
                progress_guard = 0u;
            }
            continue;
        }

        empty_guard = 0u;
        progress_guard = 0u;
        received++;
        if (rc > 1) {
            overflow_seen = 1u;
        }

        printf("%03lu: ", (unsigned long)received);
        nios_command_record_rx(state, packet);
        nios_command_print_rx(packet);
        fflush(stdout);
    }

    printf("CAPTURE got=%lu requested=%lu",
           (unsigned long)received,
           (unsigned long)requested);
    if (overflow_seen != 0u) {
        printf(" overflow_seen=1");
    }
    if (received < requested) {
        printf(" stopped=empty");
    }
    printf("\n");
    fflush(stdout);

    state->last_capture_requested = requested;
    state->last_capture_received = received;
    state->last_capture_overflow = overflow_seen;
    if (received != 0u) {
        state->board_demo_armed = 0;
    }

    return received == requested ? 0 : 1;
}

int nios_command_print_adapter_status(const nios_command_state_t *state)
{
    uint32_t tx_status;
    uint32_t rx_status;
    uint32_t adapter_status;

    if (state->adapter == NULL) {
        printf("ERR: no adapter\n");
        return -1;
    }

    tx_status = nios_noc_adapter_tx_status(state->adapter);
    rx_status = nios_noc_adapter_rx_status(state->adapter);
    adapter_status = nios_noc_adapter_status(state->adapter);

    printf("HW tx=0x%08lX ready=%lu busy=%lu error=%lu accepted=%lu",
           (unsigned long)tx_status,
           (unsigned long)((tx_status & NIOS_NOC_TX_READY) != 0u),
           (unsigned long)((tx_status & NIOS_NOC_TX_BUSY) != 0u),
           (unsigned long)((tx_status & NIOS_NOC_TX_ERROR) != 0u),
           (unsigned long)((tx_status & NIOS_NOC_TX_LAST_ACCEPTED) != 0u));
    printf(" rx=0x%08lX valid=%lu overflow=%lu error=%lu",
           (unsigned long)rx_status,
           (unsigned long)((rx_status & NIOS_NOC_RX_VALID) != 0u),
           (unsigned long)((rx_status & NIOS_NOC_RX_OVERFLOW) != 0u),
           (unsigned long)((rx_status & NIOS_NOC_RX_ERROR) != 0u));
    printf(" adapter=0x%08lX loopback=%lu\n",
           (unsigned long)adapter_status,
           (unsigned long)((adapter_status & NIOS_NOC_STATUS_LOOPBACK_EN) != 0u));
    fflush(stdout);

    return 0;
}

int nios_command_clear_adapter(nios_command_state_t *state)
{
    if (state->adapter == NULL) {
        printf("ERR: no adapter\n");
        fflush(stdout);
        return -1;
    }

    nios_noc_adapter_clear(state->adapter);
    state->last_capture_overflow = 0u;
    printf("HW cleared\n");
    fflush(stdout);
    return 0;
}

int nios_command_set_loopback(nios_command_state_t *state, int enabled)
{
    if (state->adapter == NULL) {
        printf("ERR: no adapter\n");
        fflush(stdout);
        return -1;
    }

    nios_noc_adapter_set_loopback(state->adapter, enabled);
    printf("HW loopback=%d\n", enabled != 0);
    fflush(stdout);
    return 0;
}

void nios_command_print_status(const nios_command_state_t *state)
{
    uint32_t tx_status;
    uint32_t rx_status;

    printf("link=%s adc=d%lu/c%lu/v%lu avg=d%lu/w%lu cor=w%lu/o%lu pk=d%lu/s%lu/t%lu",
           state->adapter == NULL ? "dry" : "hw",
           (unsigned long)state->adc_dest,
           (unsigned long)state->adc_channel,
           (unsigned long)state->adc_divider,
           (unsigned long)state->avg_dest,
           (unsigned long)state->avg_window,
           (unsigned long)state->cor_window,
           (unsigned long)state->cor_offset,
           (unsigned long)state->pk_dest,
           (unsigned long)state->pk_spacing,
           (unsigned long)state->pk_threshold);

    if (state->has_last_tx) {
        printf(" tx=0x%08lX", (unsigned long)state->last_tx_packet);
    } else {
        printf(" tx=none");
    }

    if (state->has_last_rx) {
        printf(" rx=0x%08lX", (unsigned long)state->last_rx_packet);
    } else {
        printf(" rx=none");
    }

    printf(" cfg=0x%02lX", (unsigned long)state->config_done_mask);

    if (state->has_peak_count) {
        printf(" peak_spacing=%lu", (unsigned long)state->latest_peak_count);
    } else {
        printf(" peak_spacing=none");
    }

    if (state->has_peak_value) {
        printf(" peak_value=%lu", (unsigned long)state->latest_peak_value);
    }

    if (state->has_last_status) {
        printf(" ack=%s/%s",
               nios_status_name(state->last_status_code),
               nios_dest_name(state->last_status_source));
    } else {
        printf(" ack=none");
    }

    if (state->adapter != NULL) {
        tx_status = nios_noc_adapter_tx_status(state->adapter);
        rx_status = nios_noc_adapter_rx_status(state->adapter);
        printf(" txs=0x%08lX rxs=0x%08lX",
               (unsigned long)tx_status,
               (unsigned long)rx_status);
    }

    printf("\n");
    fflush(stdout);
}

static const char *nios_kind_name(uint32_t kind)
{
    switch (kind) {
        case NIOS_PKT_KIND_CMD:
            return "CMD";
        case NIOS_PKT_KIND_DATA:
            return "DATA";
        case NIOS_PKT_KIND_STATUS:
            return "STATUS";
        case NIOS_PKT_KIND_EVENT:
            return "EVENT";
        default:
            return "UNKNOWN";
    }
}

static const char *nios_dest_name(uint32_t dest)
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

static const char *nios_cmd_name(uint32_t code)
{
    switch (code) {
        case NIOS_CMD_NOP:
            return "NOP";
        case NIOS_CMD_CONFIG:
            return "CONFIG";
        case NIOS_CMD_START:
            return "START";
        case NIOS_CMD_STOP:
            return "STOP";
        case NIOS_CMD_CLEAR:
            return "CLEAR";
        default:
            return "CMD?";
    }
}

static const char *nios_data_code_name(uint32_t code)
{
    switch (code) {
        case NIOS_TAG_DIRECT_DATA:
            return "DIRECT";
        case NIOS_TAG_RESULT_LOW:
            return "RESULT_LOW";
        case NIOS_TAG_RESULT_HIGH:
            return "RESULT_HIGH";
        default:
            return "DATA?";
    }
}

static const char *nios_event_name(uint32_t code)
{
    switch (code) {
        case NIOS_EVENT_MAX_PEAK:
            return "MAX_PEAK";
        case NIOS_EVENT_MIN_PEAK:
            return "MIN_PEAK";
        case NIOS_EVENT_PEAK_VALUE:
            return "PEAK_VALUE";
        default:
            return "EVENT?";
    }
}

static const char *nios_status_name(uint32_t code)
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

void nios_command_print_rx(uint32_t packet)
{
    uint32_t kind = nios_packet_kind(packet);
    uint32_t code = nios_packet_code(packet);
    uint32_t dest = nios_packet_dest(packet);
    uint32_t payload = nios_packet_payload(packet);
    int32_t sample16 = (int32_t)(int16_t)nios_packet_value(packet);

    printf("RX 0x%08lX %s code=0x%lX dest=%s payload=0x%05lX",
           (unsigned long)packet,
           nios_kind_name(kind),
           (unsigned long)code,
           nios_dest_name(dest),
           (unsigned long)payload);

    if (kind == NIOS_PKT_KIND_CMD) {
        printf(" cmd=%s tag=0x%lX value=0x%04lX",
               nios_cmd_name(code),
               (unsigned long)nios_packet_tag(packet),
               (unsigned long)nios_packet_value(packet));
    } else if (kind == NIOS_PKT_KIND_DATA) {
        printf(" data=%s sample=%ld",
               nios_data_code_name(code),
               (long)sample16);
    } else if (kind == NIOS_PKT_KIND_EVENT) {
        printf(" event=%s", nios_event_name(code));
        if (code == NIOS_EVENT_PEAK_VALUE) {
            printf(" peak_value=%lu", (unsigned long)payload);
        } else {
            printf(" peak_spacing=%lu", (unsigned long)payload);
        }
    } else if (kind == NIOS_PKT_KIND_STATUS) {
        printf(" status=%s source=%s running=%lu done=%lu error=%lu detail=0x%04lX",
               nios_status_name(code),
               nios_dest_name(nios_status_source(packet)),
               (unsigned long)nios_status_running(packet),
               (unsigned long)nios_status_done(packet),
               (unsigned long)nios_status_error(packet),
               (unsigned long)nios_status_detail(packet));
    }

    printf("\n");
}
