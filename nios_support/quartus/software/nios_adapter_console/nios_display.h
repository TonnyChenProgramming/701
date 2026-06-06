#ifndef NIOS_DISPLAY_H
#define NIOS_DISPLAY_H

#include "nios_command.h"
#include "nios_packet.h"

#define NIOS_DISPLAY_LINE_COUNT 9
#define NIOS_DISPLAY_LINE_LEN   80

#define NIOS_DISPLAY_CFG_ADC (1u << NIOS_ADDR_ADC_ASP)
#define NIOS_DISPLAY_CFG_AVG (1u << NIOS_ADDR_AVE_ASP)
#define NIOS_DISPLAY_CFG_COR (1u << NIOS_ADDR_COR_ASP)
#define NIOS_DISPLAY_CFG_PK  (1u << NIOS_ADDR_PK_ASP)

#ifndef NIOS_VGA_CHAR_COLS
#define NIOS_VGA_CHAR_COLS 80u
#endif

#ifndef NIOS_VGA_CHAR_ROWS
#define NIOS_VGA_CHAR_ROWS 60u
#endif

#ifndef NIOS_VGA_CHAR_ROW_STRIDE
#define NIOS_VGA_CHAR_ROW_STRIDE 128u
#endif

typedef struct {
    char lines[NIOS_DISPLAY_LINE_COUNT][NIOS_DISPLAY_LINE_LEN + 1];
} nios_display_snapshot_t;

void nios_display_format(
    const nios_command_state_t *state,
    nios_display_snapshot_t *snapshot
);
void nios_display_print_uart(const nios_command_state_t *state);
int nios_display_write_vga(const nios_command_state_t *state);

#endif
