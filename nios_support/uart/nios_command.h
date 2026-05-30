#ifndef NIOS_COMMAND_H
#define NIOS_COMMAND_H

#include <stdint.h>

#include "nios_noc_adapter.h"

typedef struct {
    uint32_t adc_dest;
    uint32_t adc_channel;
    uint32_t adc_divider;
    uint32_t avg_dest;
    uint32_t avg_window;
    uint32_t cor_window;
    uint32_t cor_offset;
    uint32_t pk_dest;
    uint32_t pk_spacing;
    uint32_t pk_threshold;
    uint32_t last_tx_packet;
    uint32_t last_rx_packet;
    nios_noc_adapter_t *adapter;
    int has_last_tx;
    int has_last_rx;
} nios_command_state_t;

void nios_command_init(nios_command_state_t *state);
void nios_command_attach_adapter(
    nios_command_state_t *state,
    nios_noc_adapter_t *adapter
);
void nios_command_detach_adapter(nios_command_state_t *state);
int nios_command_config_adc(
    nios_command_state_t *state,
    uint32_t dest,
    uint32_t channel,
    uint32_t divider
);
int nios_command_config_avg(
    nios_command_state_t *state,
    uint32_t dest,
    uint32_t window
);
int nios_command_config_cor_window(
    nios_command_state_t *state,
    uint32_t window
);
int nios_command_config_cor_offset(
    nios_command_state_t *state,
    uint32_t offset
);
int nios_command_config_pk(
    nios_command_state_t *state,
    uint32_t dest,
    uint32_t spacing,
    uint32_t threshold
);
void nios_command_record_rx(nios_command_state_t *state, uint32_t packet);
int nios_command_poll_adapter(nios_command_state_t *state);
void nios_command_print_status(const nios_command_state_t *state);
void nios_command_print_rx(uint32_t packet);

#endif
