# Avalon-NoC Adapter RTL

This folder contains the minimal hardware bridge between Nios II Avalon-MM register writes and the TDMA-MIN NoC.

## Files

| File | Purpose |
| --- | --- |
| `avalon_noc_adapter.vhd` | One-entry Avalon-MM TX/RX bridge with TDMA-MIN `send` and `recv` ports. |
| `avalon_noc_adapter_tb.vhd` | Focused simulation for reset, TX, RX acknowledge, and RX overflow behavior. |

Compile with the shared packages first:

```text
common/asp_packet_pkg.vhd
common/TdmaMinTypes.vhd
nios_support/adapter/avalon_noc_adapter.vhd
nios_support/adapter/avalon_noc_adapter_tb.vhd
```

The Avalon slave uses a 3-bit word address. Platform Designer maps those words to the documented byte offsets `0x00` through `0x1C`.

## Minimum Integration

```text
Nios II Avalon master
    -> avalon_noc_adapter
    -> TDMA-MIN send/recv ports
```

The first version deliberately uses one TX holding register and one RX holding register. It is enough for the MVP configuration/status path and waveform evidence. FIFOs can be added later if traffic measurements show they are needed.

## Simulation Evidence

The focused testbench checks:

1. `TX_READY = 1` after reset.
2. An Avalon TX write routes `0x11120000` to `ADC_ADDR`.
3. A NoC packet for `NIOS_II_ADDR` remains available until `RX_ACK`.
4. A second unacknowledged RX packet sets the overflow flag.
5. `RX_CLEAR` clears valid and overflow state.

With ModelSim, compile the four files listed above and run `avalon_noc_adapter_tb` for `300 ns`. A completed run leaves `test_done = '1'`.
