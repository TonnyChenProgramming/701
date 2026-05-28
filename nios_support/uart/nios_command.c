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

    packet = nios_make_recop_config(NIOS_HOST_TAG_MODE, mode_value);
    state->mode = mode;
    return nios_command_send(state, packet);
}

int nios_command_set_window(nios_command_state_t *state, uint32_t window)
{
    uint32_t packet;

    if (window == 0u || window > NIOS_PAYLOAD_VALUE_MASK) {
        return -1;
    }

    packet = nios_make_recop_config(NIOS_TAG_WINDOW, window);
    state->window = window;
    return nios_command_send(state, packet);
}

int nios_command_start(nios_command_state_t *state)
{
    return nios_command_send(
        state,
        nios_make_recop_simple_cmd(NIOS_CMD_START)
    );
}

int nios_command_reset(nios_command_state_t *state)
{
    state->has_last_rx = 0;
    return nios_command_send(
        state,
        nios_make_recop_simple_cmd(NIOS_CMD_CLEAR)
    );
}

void nios_command_record_rx(nios_command_state_t *state, uint32_t packet)
{
    state->last_rx_packet = packet;
    state->has_last_rx = 1;
}

void nios_command_print_status(const nios_command_state_t *state)
{
    printf("mode=%u window=%lu",
           state->mode,
           (unsigned long)state->window);

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
