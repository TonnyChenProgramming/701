# GP2 Member B Nios II Support Plan

Owner: Eric / Member B

Branch: `Eric_GP2`

## Purpose

Member B owns the non-critical Nios II support path for GP2. After Zoran's MVP feedback, the minimum target is not to upload ReCOP instruction memory and not to force all Nios commands through ReCOP. The minimum target is to let a PC user send UART/JTAG UART configuration commands to Nios II, let Nios II package those commands as NoC packets for the relevant ASPs, and let Nios II display returned peak/frequency results from the NoC.

## Agreed System Flow

```text
PC UART command
    -> Nios II command parser
    -> Avalon-MM / NoC adapter registers
    -> ASP configuration packet over NoC
    -> ASP pipeline updates parameters
    -> Peak/result packet returns over NoC
    -> UART debug output and VGA result display
```

ReCOP remains useful, but its MVP role is the board-driven reactive controller: switches/buttons trigger START/STOP/CLEAR/status control packets to ASPs and LEDs show the result. Nios II is the UART/config/display processor.

## Responsibility Split

| Member | Area | Main Responsibility |
| --- | --- | --- |
| A | ReCOP + board input controller | Read switches/buttons, send START/STOP/CLEAR/status packets to ASPs, drive LEDs/status response. |
| B | Nios II support subsystem | UART command parser, Nios-to-NoC register contract, ASP configuration packets, PK/result display path. |
| C | TDMA-MIN + ASP pipeline | NoC routing, ASP address map, ADC/AVG/COR/PK/output data movement, waveform evidence. |

Member B does not need to implement ASP algorithms or ReCOP internal instruction behavior. Member B only needs a clean support interface that can drive known ASP configuration packets and display returned status/results.

## GP2 Operating Modes

| Mode | Name | Intended Data Path |
| --- | --- | --- |
| `mode 1` | Correlation pipeline | `ADC -> AVG -> COR -> PK -> NoC -> Nios display` |
| `mode 2` | Direct pass-through | `ADC/source -> NoC/output`, bypassing `AVG/COR/PK` where possible |

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
| `mode 1` | Select AVG/COR/PK pipeline | Build and send/print an ADC/source config packet for correlation mode. |
| `mode 2` | Select direct pass-through | Build and send/print an ADC/source config packet for pass-through mode. |
| `window <n>` | Set averaging/correlation window | Build and send/print AVG and COR config packets with window value `n`. |
| `offset <n>` | Set correlation offset | Build and send/print a COR config packet with offset value `n`. |
| `rx <hex>` | Mock/decode one received packet | Dry-run display hook for PK/result packets before hardware RX exists. |
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

For Nios configuration commands, `dest` should be the target ASP address. ReCOP address `0x0` is mainly for ReCOP-originated board-control/status behavior, not the default Nios MVP path.

## Proposed Nios-to-ASP Command Packets

These packet words follow the shared packet layout. The mode tag is a Member B proposal and should be confirmed before adding it to `asp_packet_pkg.vhd`.

| UART Command | Packet Meaning | Example Word |
| --- | --- | --- |
| `mode 1` | `CMD_CONFIG` to ADC/source, host tag `MODE`, value `0` for correlation pipeline | `0x111F0000` |
| `mode 2` | `CMD_CONFIG` to ADC/source, host tag `MODE`, value `1` for pass-through | `0x111F0001` |
| `window 64` | `CMD_CONFIG` to AVG, `TAG_WINDOW`, value `64` | `0x11200040` |
| `window 64` | `CMD_CONFIG` to COR, `TAG_WINDOW`, value `64` | `0x11300040` |
| `offset 100` | `CMD_CONFIG` to COR, `TAG_OFFSET`, value `100` | `0x11310064` |

Suggested host-only config tags:

| Tag | Meaning |
| --- | --- |
| `0xF` | Host mode select, value `0` = mode 1, value `1` = mode 2. |
| `0x0` | Existing `TAG_WINDOW`, value = window size. |

## Instruction Memory Upload Note

Instruction-memory upload is optional/stretch for GP2. The current ReCOP program memory is ROM/MIF based, so run-time upload would require a larger hardware change: writable program memory, an Avalon loader interface, reset/start control, and evidence that ReCOP fetches uploaded instructions.

For the minimum GP2 path, Nios II should not block on instruction-memory upload. The practical Member B path is:

```text
Nios II UART command -> NoC adapter -> ASP configuration packet
```

Instruction-memory upload can be revisited only if the team finishes the UART/config/status path early.

## Teammate Update Message

```text
I am working on Member B on branch Eric_GP2. After Zoran's MVP feedback, Nios II is mainly for UART configuration and UART/VGA display. It should not need ReCOP instruction-memory upload, and PK should not connect directly to Nios. My MVP flow is PC UART command -> Nios II -> NoC config packet -> target ASP, and PK/result packet -> NoC -> Nios II -> UART/VGA display. ReCOP stays useful as the board-driven reactive controller for START/STOP/CLEAR/status using switches/buttons/LEDs.
```

## Open Team Decisions

1. Confirm the final mode-control payload tag. This document proposes host tag `0xF` for mode select.
2. Confirm which ASP owns mode routing. Current Nios code sends mode config to ADC/source address `0x1`.
3. Confirm the Avalon adapter base address/name once Platform Designer integration exists.
4. Confirm PK/result packet format for Nios display.
