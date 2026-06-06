#include "nios_noc_adapter.h"

static uint32_t nios_noc_read32(uintptr_t base, uint32_t offset)
{
    volatile uint32_t *reg = (volatile uint32_t *)nios_noc_reg_addr(base, offset);
    return *reg;
}

static void nios_noc_write32(uintptr_t base, uint32_t offset, uint32_t value)
{
    volatile uint32_t *reg = (volatile uint32_t *)nios_noc_reg_addr(base, offset);
    *reg = value;
}

void nios_noc_adapter_init(
    nios_noc_adapter_t *adapter,
    uintptr_t base,
    uint32_t timeout
)
{
    adapter->base = base;
    adapter->timeout = timeout == 0u ? NIOS_NOC_DEFAULT_TIMEOUT : timeout;
}

uint32_t nios_noc_adapter_tx_status(const nios_noc_adapter_t *adapter)
{
    return nios_noc_read32(adapter->base, NIOS_NOC_TX_STATUS_OFFSET);
}

uint32_t nios_noc_adapter_rx_status(const nios_noc_adapter_t *adapter)
{
    return nios_noc_read32(adapter->base, NIOS_NOC_RX_STATUS_OFFSET);
}

uint32_t nios_noc_adapter_status(const nios_noc_adapter_t *adapter)
{
    return nios_noc_read32(adapter->base, NIOS_NOC_ADAPTER_STATUS_OFFSET);
}

int nios_noc_adapter_send(nios_noc_adapter_t *adapter, uint32_t packet)
{
    uint32_t status;
    uint32_t guard;

    for (guard = adapter->timeout; guard > 0u; guard--) {
        status = nios_noc_adapter_tx_status(adapter);
        if ((status & NIOS_NOC_TX_ERROR) != 0u) {
            return -2;
        }
        if ((status & NIOS_NOC_TX_READY) != 0u) {
            nios_noc_write32(adapter->base, NIOS_NOC_TX_PACKET_OFFSET, packet);
            nios_noc_write32(adapter->base, NIOS_NOC_TX_CONTROL_OFFSET, NIOS_NOC_TX_VALID);
            return 0;
        }
    }

    return -1;
}

int nios_noc_adapter_try_recv(nios_noc_adapter_t *adapter, uint32_t *packet)
{
    uint32_t status = nios_noc_adapter_rx_status(adapter);
    uint32_t clear_mask;

    if ((status & NIOS_NOC_RX_ERROR) != 0u) {
        return -2;
    }

    if ((status & NIOS_NOC_RX_VALID) == 0u) {
        if ((status & NIOS_NOC_RX_OVERFLOW) != 0u) {
            nios_noc_write32(adapter->base, NIOS_NOC_RX_CONTROL_OFFSET, NIOS_NOC_RX_CLEAR);
            return -2;
        }

        return 0;
    }

    *packet = nios_noc_read32(adapter->base, NIOS_NOC_RX_PACKET_OFFSET);
    clear_mask = NIOS_NOC_RX_ACK;
    if ((status & NIOS_NOC_RX_OVERFLOW) != 0u) {
        clear_mask |= NIOS_NOC_RX_CLEAR;
    }
    nios_noc_write32(adapter->base, NIOS_NOC_RX_CONTROL_OFFSET, clear_mask);
    return (status & NIOS_NOC_RX_OVERFLOW) != 0u ? 2 : 1;
}

void nios_noc_adapter_clear(nios_noc_adapter_t *adapter)
{
    uint32_t control = NIOS_NOC_SOFT_RESET;

    if ((nios_noc_adapter_status(adapter) & NIOS_NOC_STATUS_LOOPBACK_EN) != 0u) {
        control |= NIOS_NOC_LOOPBACK_EN;
    }

    nios_noc_write32(adapter->base, NIOS_NOC_ADAPTER_CONTROL_OFFSET, control);
}

void nios_noc_adapter_set_loopback(
    nios_noc_adapter_t *adapter,
    int enabled
)
{
    nios_noc_write32(
        adapter->base,
        NIOS_NOC_ADAPTER_CONTROL_OFFSET,
        enabled ? NIOS_NOC_LOOPBACK_EN : 0u
    );
}
