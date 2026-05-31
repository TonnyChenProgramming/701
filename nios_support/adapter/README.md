# Avalon-NoC Adapter RTL

This folder contains the minimal hardware bridge between Nios II Avalon-MM register writes and the TDMA-MIN NoC.

## Files

| File | Purpose |
| --- | --- |
| `avalon_noc_adapter.vhd` | One-entry Avalon-MM TX/RX bridge with TDMA-MIN `send` and `recv` ports. |
| `avalon_noc_adapter_tb.vhd` | Focused simulation for reset, TX, RX acknowledge, and RX overflow behavior. |
| `avalon_noc_adapter_pd.vhd` | Flat-port wrapper for Platform Designer conduit signals. |
| `avalon_noc_adapter_pd_hw.tcl` | Platform Designer custom-component descriptor. |

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

## Platform Designer Component

Add `nios_support/adapter` to the Platform Designer IP search path. The component appears as:

```text
COMPSYS 701 -> Avalon NoC Adapter
```

Connect:

```text
clock       -> system clock
reset       -> system reset
avs         -> Nios II data master
irq         -> Nios II interrupt receiver, optional for MVP
noc_send    -> TDMA-MIN input path
noc_recv    <- TDMA-MIN output path for Nios address 0x5
```

Export `noc_send` and `noc_recv` from the Platform Designer system if TDMA-MIN is integrated in the Quartus top level. The wrapper exposes flat `addr[7:0]` and `data[31:0]` signals, while the adapter core keeps the shared `tdma_min_port` record internally.

The descriptor includes `common/asp_packet_pkg.vhd` and `common/TdmaMinTypes.vhd`. Do not add duplicate copies of those packages to the same Quartus compilation library.

## Simulation Evidence

The focused testbench checks:

1. `TX_READY = 1` after reset.
2. An Avalon TX write routes `0x11120000` to `ADC_ADDR`.
3. A NoC packet for `NIOS_II_ADDR` remains available until `RX_ACK`.
4. A second unacknowledged RX packet sets the overflow flag.
5. `RX_CLEAR` clears valid and overflow state.

With ModelSim, compile the four files listed above and run `avalon_noc_adapter_tb` for `300 ns`. A completed run leaves `test_done = '1'`.
