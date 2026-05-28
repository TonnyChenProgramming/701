# GP2 Member B Nios II Support Plan

Owner: Eric / Member B

Branch: `Eric_GP2`

## Purpose

Member B owns the non-critical Nios II support path for GP2. The minimum target is not to upload ReCOP instruction memory at run time. The minimum target is to let a PC user send UART/JTAG UART commands to Nios II, let Nios II package those commands for ReCOP, and let Nios II report status/results back to the PC and VGA display path.

## Agreed System Flow

```text
PC UART command
    -> Nios II command parser
    -> Avalon-MM / NoC adapter registers
    -> ReCOP command/config packet
    -> ReCOP controls ASP pipeline
    -> ASP result/status packet returns to ReCOP
    -> ReCOP reports status/result to Nios II
    -> UART debug output and VGA result display
```

This keeps Nios II as the debug/config/display support processor. ReCOP remains the real-time controller for ASP configuration and pipeline control.

## Responsibility Split

| Member | Area | Main Responsibility |
| --- | --- | --- |
| A | ReCOP + board input controller | Decode ReCOP-side commands, read switches/buttons, send ASP configuration/start/reset packets. |
| B | Nios II support subsystem | UART command parser, Nios-to-NoC register contract, packet helper code, status/result display path. |
| C | TDMA-MIN + ASP pipeline | NoC routing, ASP address map, ADC/AVG/COR/PK/output data movement, waveform evidence. |

Member B does not need to implement ASP algorithms or ReCOP internal instruction behavior. Member B only needs a clean support interface that can drive known command packets and display returned status/results.

## GP2 Operating Modes

| Mode | Name | Intended Data Path |
| --- | --- | --- |
| `mode 1` | Correlation pipeline | `ADC -> AVG -> COR -> PK -> ReCOP -> Nios` |
| `mode 2` | Direct pass-through | `ADC -> ReCOP/Nios/output`, bypassing `AVG/COR/PK` where possible |

The exact NoC route for mode 2 should be confirmed by Member C because it depends on how the TDMA-MIN ports are connected.

## Minimum Member B Deliverables

1. Nios II UART/JTAG UART command parser.
2. Packet helper definitions matching `common/asp_packet_pkg.vhd`.
3. Avalon-MM register contract for the Nios-to-NoC adapter.
4. Dry-run command output showing the 32-bit packet words Nios would send.
5. Evidence checklist for hardware/simulation testing.

The first implementation can print intended packet words before the hardware adapter is finished. This lets the team agree on command format early.

## UART Command Set

| Command | Meaning | Initial Nios Action |
| --- | --- | --- |
| `mode 1` | Select AVG/COR/PK pipeline | Build and send/print a ReCOP config packet for correlation mode. |
| `mode 2` | Select direct pass-through | Build and send/print a ReCOP config packet for pass-through mode. |
| `window <n>` | Set averaging/correlation window | Build and send/print a ReCOP config packet with window value `n`. |
| `start` | Start stream/pipeline | Build and send/print a ReCOP start packet. |
| `reset` | Clear/reset command path | Clear local Nios state and send/print a ReCOP clear/reset packet. |
| `status` | Show current system status | Print cached mode/window, adapter status, and latest received packet/result. |

## Packet Format

The shared packet format is defined in `common/asp_packet_pkg.vhd`:

```text
[31:28] kind
[27:24] code
[23:20] dest
[19:0]  payload
```

Current shared node map:

| Node | Address |
| --- | --- |
| ReCOP/control source | `0x0` |
| ADC ASP | `0x1` |
| AVG ASP | `0x2` |
| Correlation ASP | `0x3` |
| Peak ASP | `0x4` |
| Nios II bridge | `0x5` |
| Idle/debug sink | `0x6` |
| Null/drop sink | `0x7` |

For Nios-to-ReCOP commands, `dest` should normally be `0x0`.

## Proposed Nios-to-ReCOP Command Packets

These packet words follow the shared packet layout. The mode tag is a Member B proposal and should be confirmed before adding it to `asp_packet_pkg.vhd`.

| UART Command | Packet Meaning | Example Word |
| --- | --- | --- |
| `mode 1` | `CMD_CONFIG`, host tag `MODE`, value `0` for correlation pipeline | `0x110F0000` |
| `mode 2` | `CMD_CONFIG`, host tag `MODE`, value `1` for pass-through | `0x110F0001` |
| `window 64` | `CMD_CONFIG`, `TAG_WINDOW`, value `64` | `0x11000040` |
| `start` | `CMD_START` to ReCOP | `0x12000000` |
| `reset` | `CMD_CLEAR` to ReCOP | `0x14000000` |

Suggested host-only config tags:

| Tag | Meaning |
| --- | --- |
| `0xF` | Host mode select, value `0` = mode 1, value `1` = mode 2. |
| `0x0` | Existing `TAG_WINDOW`, value = window size. |

## Instruction Memory Upload Note

Instruction-memory upload is optional/stretch for GP2. The current ReCOP program memory is ROM/MIF based, so run-time upload would require a larger hardware change: writable program memory, an Avalon loader interface, reset/start control, and evidence that ReCOP fetches uploaded instructions.

For the minimum GP2 path, Nios II should not block on instruction-memory upload. The practical Member B path is:

```text
Nios II UART command -> packet/config path -> ReCOP already-running control program
```

Instruction-memory upload can be revisited only if the team finishes the UART/config/status path early.

## Teammate Update Message

```text
I am working on Member B on branch Eric_GP2. We agreed Nios II is mainly for UART debug/config and status/VGA display, not mandatory ReCOP instruction-memory upload. My flow is PC UART command -> Nios II -> ReCOP command/config -> ReCOP controls ASP pipeline -> ASP result returns to ReCOP -> ReCOP reports to Nios -> UART/VGA display. I am adding the Nios command/config documentation and Avalon-NoC register contract first so Member A and Member C can match their ReCOP and NoC work to the same packet flow.
```

## Open Team Decisions

1. Confirm the final mode-control payload tag. This document proposes host tag `0xF` for mode select.
2. Confirm whether mode 2 sends ADC data directly to Nios/output or still passes through ReCOP first.
3. Confirm the Avalon adapter base address/name once Platform Designer integration exists.
4. Confirm whether `status` is only a Nios local readout or also a ReCOP query packet.
