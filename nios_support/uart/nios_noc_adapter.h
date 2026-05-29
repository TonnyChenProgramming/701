#ifndef NIOS_NOC_ADAPTER_H
#define NIOS_NOC_ADAPTER_H

#include <stdint.h>

/*
 * Nios-to-NoC Avalon-MM register contract.
 *
 * Platform Designer will assign the base address later. Keep that base address
 * outside this header, for example:
 *
 *   #define NIOS_NOC_ADAPTER_BASE <generated_system_macro>
 */

#define NIOS_NOC_TX_PACKET_OFFSET       0x00u
#define NIOS_NOC_TX_CONTROL_OFFSET      0x04u
#define NIOS_NOC_TX_STATUS_OFFSET       0x08u
#define NIOS_NOC_RX_PACKET_OFFSET       0x0Cu
#define NIOS_NOC_RX_CONTROL_OFFSET      0x10u
#define NIOS_NOC_RX_STATUS_OFFSET       0x14u
#define NIOS_NOC_ADAPTER_STATUS_OFFSET  0x18u
#define NIOS_NOC_ADAPTER_CONTROL_OFFSET 0x1Cu

#define NIOS_NOC_TX_VALID               (1u << 0)
#define NIOS_NOC_TX_CLEAR               (1u << 1)
#define NIOS_NOC_TX_IRQ_EN              (1u << 2)

#define NIOS_NOC_TX_READY               (1u << 0)
#define NIOS_NOC_TX_BUSY                (1u << 1)
#define NIOS_NOC_TX_ERROR               (1u << 2)
#define NIOS_NOC_TX_LAST_ACCEPTED       (1u << 3)

#define NIOS_NOC_RX_ACK                 (1u << 0)
#define NIOS_NOC_RX_CLEAR               (1u << 1)
#define NIOS_NOC_RX_IRQ_EN              (1u << 2)

#define NIOS_NOC_RX_VALID               (1u << 0)
#define NIOS_NOC_RX_OVERFLOW            (1u << 1)
#define NIOS_NOC_RX_ERROR               (1u << 2)
#define NIOS_NOC_RX_SOURCE_FLAG         (1u << 3)

#define NIOS_NOC_SOFT_RESET             (1u << 0)
#define NIOS_NOC_LOOPBACK_EN            (1u << 1)

static inline uintptr_t nios_noc_reg_addr(uintptr_t base, uint32_t offset)
{
    return base + (uintptr_t)offset;
}

#endif
