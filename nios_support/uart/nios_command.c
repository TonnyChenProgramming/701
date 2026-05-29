#include <stdio.h>
#include <string.h>

#include "nios_command.h"
#include "nios_packet.h"

static int nios_command_send(nios_command_state_t *state, uint32_t packet)
{
    state->last_tx_packet = packet;
    state->has_last_tx = 1;

    /*
     * Dry-run hook. Replace this print with Avalon-MM writes when the
     * Nios-to-NoC adapter registers are connected.
     */
    printf("TX 0x%08lX\n", (unsigned long)packet);
    return 0;
}

void nios_command_init(nios_command_state_t *state)
{
    memset(state, 0, sizeof(*state));
    state->mode = 1u;
    state->window = 64u;
    state->offset = 0u;
}

int nios_command_set_mode(nios_command_state_t *state, unsigned mode)
{
    uint32_t mode_value;
    uint32_t packet;

    if (mode == 1u) {
        mode_value = NIOS_MODE_CORRELATION;
    } else if (mode == 2u) {
        mode_value = NIOS_MODE_PASS_THROUGH;
    } else {
        return -1;
    }

    packet = nios_make_config(
        NIOS_ADDR_ADC_ASP,
        NIOS_HOST_TAG_MODE,
        mode_value
    );
    state->mode = mode;
    return nios_command_send(state, packet);
}

int nios_command_set_window(nios_command_state_t *state, uint32_t window)
{
    int rc;

    if (window == 0u || window > NIOS_PAYLOAD_VALUE_MASK) {
        return -1;
    }

    state->window = window;

    rc = nios_command_send(
        state,
        nios_make_config(NIOS_ADDR_AVE_ASP, NIOS_TAG_WINDOW, window)
    );

    if (rc != 0) {
        return rc;
    }

    return nios_command_send(
        state,
        nios_make_config(NIOS_ADDR_COR_ASP, NIOS_TAG_WINDOW, window)
    );
}

int nios_command_set_offset(nios_command_state_t *state, uint32_t offset)
{
    if (offset > NIOS_PAYLOAD_VALUE_MASK) {
        return -1;
    }

    state->offset = offset;
    return nios_command_send(
        state,
        nios_make_config(NIOS_ADDR_COR_ASP, NIOS_TAG_OFFSET, offset)
    );
}

void nios_command_record_rx(nios_command_state_t *state, uint32_t packet)
{
    state->last_rx_packet = packet;
    state->has_last_rx = 1;
}

void nios_command_print_status(const nios_command_state_t *state)
{
    printf("mode=%u window=%lu offset=%lu",
           state->mode,
           (unsigned long)state->window,
           (unsigned long)state->offset);

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
