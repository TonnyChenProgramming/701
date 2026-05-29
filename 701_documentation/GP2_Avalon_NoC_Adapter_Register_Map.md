# GP2 Avalon-NoC Adapter Register Map

Owner: Member B

This document defines the proposed memory-mapped register contract between Nios II and the GP2 NoC command/status path. It is intended to let Nios II write one 32-bit packet at a time into the TDMA-MIN ASP configuration path and read returned 32-bit status/result packets.

## Packet Word

The adapter passes the same 32-bit packet word used by `common/asp_packet_pkg.vhd`:

```text
[31:28] kind
[27:24] code
[23:20] dest
[19:0]  payload
```

The adapter should not reinterpret ASP algorithm data. It only moves packet words between Avalon-MM and the NoC-facing logic.

## Proposed Register Offsets

Base address is assigned later in Platform Designer. All registers are 32-bit, word-aligned.

| Offset | Name | Access | Description |
| --- | --- | --- | --- |
| `0x00` | `TX_PACKET` | W | Packet word written by Nios II. |
| `0x04` | `TX_CONTROL` | W | TX command bits: valid, clear, interrupt enable. |
| `0x08` | `TX_STATUS` | R | TX ready/busy/error state. |
| `0x0C` | `RX_PACKET` | R | Latest received packet word for Nios II. |
| `0x10` | `RX_CONTROL` | W | RX acknowledge/clear/interrupt enable bits. |
| `0x14` | `RX_STATUS` | R | RX valid/overflow/error state. |
| `0x18` | `ADAPTER_STATUS` | R | Combined adapter state/debug counters or flags. |
| `0x1C` | `ADAPTER_CONTROL` | W | Soft reset and debug control. |

## TX Control Bits

| Bit | Name | Meaning |
| --- | --- | --- |
| `0` | `TX_VALID` | Nios has written `TX_PACKET` and requests transmission. |
| `1` | `TX_CLEAR` | Clear TX error/busy state. |
| `2` | `TX_IRQ_EN` | Enable TX-ready interrupt, optional. |
| `31:3` | Reserved | Write as zero. |

## TX Status Bits

| Bit | Name | Meaning |
| --- | --- | --- |
| `0` | `TX_READY` | Adapter can accept a new packet. |
| `1` | `TX_BUSY` | Adapter is holding or sending a packet. |
| `2` | `TX_ERROR` | TX protocol error or dropped packet. |
| `3` | `TX_LAST_ACCEPTED` | Last `TX_VALID` pulse was accepted. |
| `31:4` | Reserved | Read as zero where possible. |

## RX Control Bits

| Bit | Name | Meaning |
| --- | --- | --- |
| `0` | `RX_ACK` | Nios has consumed `RX_PACKET`; adapter may clear valid. |
| `1` | `RX_CLEAR` | Clear RX overflow/error state. |
| `2` | `RX_IRQ_EN` | Enable RX-valid interrupt, optional. |
| `31:3` | Reserved | Write as zero. |

## RX Status Bits

| Bit | Name | Meaning |
| --- | --- | --- |
| `0` | `RX_VALID` | `RX_PACKET` contains a packet not yet acknowledged. |
| `1` | `RX_OVERFLOW` | A packet arrived before the previous one was acknowledged. |
| `2` | `RX_ERROR` | RX protocol error. |
| `3` | `RX_SOURCE_FLAG` | Optional source/debug flag if the adapter tracks packet origin. |
| `31:4` | Reserved | Read as zero where possible. |

## Adapter Control Bits

| Bit | Name | Meaning |
| --- | --- | --- |
| `0` | `SOFT_RESET` | Reset adapter internal state. |
| `1` | `LOOPBACK_EN` | Optional simulation/debug loopback. |
| `31:2` | Reserved | Write as zero. |

## Nios TX Sequence

```text
1. Poll TX_STATUS.TX_READY until it is 1.
2. Write the packet word to TX_PACKET.
3. Write TX_CONTROL.TX_VALID = 1 for one Avalon write.
4. Poll TX_STATUS.TX_LAST_ACCEPTED or TX_READY for confirmation.
5. If TX_ERROR is set, write TX_CONTROL.TX_CLEAR = 1 and report the error on UART.
```

## Nios RX Sequence

```text
1. Poll RX_STATUS.RX_VALID.
2. Read RX_PACKET.
3. Decode packet kind/code/dest/payload for UART/VGA display.
4. Write RX_CONTROL.RX_ACK = 1.
5. If RX_OVERFLOW or RX_ERROR is set, write RX_CONTROL.RX_CLEAR = 1 and report the error.
```

## Minimum Hardware Behavior

The first adapter version only needs single-entry TX and RX holding registers. FIFOs are useful later, but are not required for the first Member B evidence.

Minimum expected behavior:

1. Do not accept a new TX packet unless `TX_READY = 1`.
2. Keep `RX_VALID = 1` until Nios writes `RX_ACK`.
3. Set overflow/error flags instead of silently losing state.
4. Keep all unused bits stable and documented as reserved.

## Example Command Packets

These examples use the shared constants from `asp_packet_pkg.vhd`:

| Command | Word | Meaning |
| --- | --- | --- |
| `mode 1` | `0x111F0000` | `CMD_CONFIG` to ADC/source, host mode tag, correlation pipeline. |
| `mode 2` | `0x111F0001` | `CMD_CONFIG` to ADC/source, host mode tag, pass-through path. |
| `window 64` | `0x11200040` | `CMD_CONFIG` to AVG, `TAG_WINDOW = 0`, value `64`. |
| `window 64` | `0x11300040` | `CMD_CONFIG` to COR, `TAG_WINDOW = 0`, value `64`. |
| `offset 100` | `0x11310064` | `CMD_CONFIG` to COR, `TAG_OFFSET = 1`, value `100`. |

The host mode tag `0xF` is a proposal for Nios/source-mode control. The team should confirm it before adding a permanent constant to the shared packet package.

## Integration Notes

1. The adapter should expose only packet-level control to Nios II. ASPs should keep algorithm-specific interpretation.
2. The Nios software can begin in dry-run mode by printing packet words before the adapter exists.
3. When Platform Designer assigns the base address, Nios code should define one project macro such as `GP2_NOC_ADAPTER_BASE`.
4. If interrupts take too long to integrate, polling is acceptable for the first GP2 demo.
