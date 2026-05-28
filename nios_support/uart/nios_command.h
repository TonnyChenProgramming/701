#ifndef NIOS_COMMAND_H
#define NIOS_COMMAND_H

#include <stdint.h>

typedef struct {
    unsigned mode;
    uint32_t window;
    uint32_t last_tx_packet;
    uint32_t last_rx_packet;
    int has_last_tx;
    int has_last_rx;
} nios_command_state_t;

void nios_command_init(nios_command_state_t *state);
int nios_command_set_mode(nios_command_state_t *state, unsigned mode);
int nios_command_set_window(nios_command_state_t *state, uint32_t window);
int nios_command_start(nios_command_state_t *state);
int nios_command_reset(nios_command_state_t *state);
void nios_command_record_rx(nios_command_state_t *state, uint32_t packet);
void nios_command_print_status(const nios_command_state_t *state);
void nios_command_print_rx(uint32_t packet);

#endif
