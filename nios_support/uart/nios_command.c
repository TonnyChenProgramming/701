#include <stdio.h>
#include <string.h>

#include "nios_command.h"
#include "nios_packet.h"

static int nios_command_send(nios_command_state_t *state, uint32_t packet)
{
    int rc;

    if (state->adapter != NULL) {
        rc = nios_noc_adapter_send(state->adapter, packet);
        if (rc != 0) {
            printf("ERR: noc tx %d\n", rc);
            return rc;
        }
    }

    state->last_tx_packet = packet;
    state->has_last_tx = 1;

    printf("TX 0x%08lX\n", (unsigned long)packet);
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

void nios_command_record_rx(nios_command_state_t *state, uint32_t packet)
{
    state->last_rx_packet = packet;
    state->has_last_rx = 1;
}

int nios_command_poll_adapter(nios_command_state_t *state)
{
    uint32_t packet;
    int rc;

    if (state->adapter == NULL) {
        printf("ERR: no adapter\n");
        return -1;
    }

    rc = nios_noc_adapter_try_recv(state->adapter, &packet);
    if (rc < 0) {
        printf("ERR: noc rx %d\n", rc);
        return rc;
    }

    if (rc == 0) {
        printf("RX none\n");
        return 0;
    }

    nios_command_record_rx(state, packet);
    nios_command_print_rx(packet);
    return 1;
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

    if (state->adapter != NULL) {
        tx_status = nios_noc_adapter_tx_status(state->adapter);
        rx_status = nios_noc_adapter_rx_status(state->adapter);
        printf(" txs=0x%08lX rxs=0x%08lX",
               (unsigned long)tx_status,
               (unsigned long)rx_status);
    }

    printf("\n");
}

void nios_command_print_rx(uint32_t packet)
{
    printf("RX 0x%08lX k=%lu c=%lu d=%lu tag=%lu val=0x%04lX\n",
           (unsigned long)packet,
           (unsigned long)nios_packet_kind(packet),
           (unsigned long)nios_packet_code(packet),
           (unsigned long)nios_packet_dest(packet),
           (unsigned long)nios_packet_tag(packet),
           (unsigned long)nios_packet_value(packet));
}
