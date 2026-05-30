# ASP NoC Command Interface

Owner: team agreement document

Purpose: define the packet contract each block accepts or returns on the TDMA-MIN NoC. This is the agreement point between Nios II UART configuration, ReCOP board control, and the ASP pipeline.

## Why This Exists

Zoran's MVP feedback means Nios II should not need a private direct link to PK and should not need to route every command through ReCOP. Instead:

```text
Nios II UART -> NoC config packet -> target ASP
ReCOP switch/button -> NoC control packet -> target ASPs
PK/result packet -> NoC -> Nios II display
```

For this to work, every ASP needs a clear command interface: destination address, accepted command codes, payload tags, and returned packet format.

## Shared Packet Format

Defined by `common/asp_packet_pkg.vhd`:

```text
[31:28] kind
[27:24] code
[23:20] dest
[19:0]  payload
```

For tagged config payloads:

```text
[19:16] tag
[15:0]  value
```

## Shared Addresses

| Block | Address | Owner |
| --- | --- | --- |
| ReCOP/control source | `0x0` | Member A |
| ADC ASP | `0x1` | Team/ASP owner |
| AVG ASP | `0x2` | Solomon |
| COR ASP | `0x3` | Tonny |
| PK ASP | `0x4` | Eric / PD-ASP |
| Nios II bridge | `0x5` | Eric / Member B |
| Idle/debug sink | `0x6` | Team |
| Null/drop sink | `0x7` | Team |

## Shared Command Codes

| Code | Meaning | Typical Sender |
| --- | --- | --- |
| `CMD_CONFIG = 0x1` | Configure a parameter or mode. | Nios II |
| `CMD_START = 0x2` | Start stream/pipeline behavior. | ReCOP |
| `CMD_STOP = 0x3` | Stop stream/pipeline behavior. | ReCOP |
| `CMD_CLEAR = 0x4` | Clear state/reset counters/FIFOs. | ReCOP |

## Shared Tags And Event Codes

| Code/Tag | Value | Meaning | Used By |
| --- | --- | --- |
| `TAG_WINDOW` | `0x0` | COR config window. | COR config |
| `TAG_OFFSET` | `0x1` | COR config offset. | COR config |
| `TAG_DIRECT_DATA` | `0x0` | Direct/sample data packet. | DATA code |
| `TAG_RESULT_LOW` | `0x1` | Low part of COR result. | DATA code |
| `TAG_RESULT_HIGH` | `0x2` | High part of COR result. | DATA code |
| `EVENT_MAX_PEAK` | `0x1` | Maximum peak event. | EVENT code |
| `EVENT_MIN_PEAK` | `0x2` | Minimum peak event. | EVENT code |

ADC, AVG, and PK currently use compact payload bitfields rather than the generic tag/value style. COR uses `TAG_WINDOW` and `TAG_OFFSET`.

## Current Nios Dry-Run Packets

These are the packets currently produced by `nios_support/uart`:

| UART Command | Packet(s) | Intended Receiver |
| --- | --- | --- |
| `adc avg 0 0` | `0x11120000` | ADC outputs to AVG, channel 0, divider 0. |
| `avg cor 4` | `0x11230200` | AVG outputs to COR, window 4. |
| `corwin 64` | `0x11300040` | COR window config. |
| `offset 100` | `0x11310064` | COR offset config. |
| `pk nios 200 0` | `0x1145C800` | PK sends peak events to Nios, spacing 200, threshold 0. |
| `rx 0x41500140` | No TX packet | Mock PK max-peak event to Nios, peak count `320`. |

## Actual ASP Command Payloads

These payload layouts are taken from the current ASP code. ADC/AVG TDMA-MIN wrappers are available on `origin/solomon-tdma-only`; their cores keep the payload layouts below.

| Target | Command | Payload Layout | Example |
| --- | --- | --- | --- |
| ADC `0x1` | `CMD_CONFIG` | `[19:16] output dest`, `[15:14] virtual channel`, `[13:10] sample divider` | `adc avg 0 0 -> 0x11120000` |
| AVG `0x2` | `CMD_CONFIG` | `[19:16] output dest`, `[10:8] log2(window)` where window is `1,2,4,8,16` | `avg cor 4 -> 0x11230200` |
| COR `0x3` | `CMD_CONFIG` + `TAG_WINDOW` | `[19:16] tag=0`, `[8:0] window` | `corwin 64 -> 0x11300040` |
| COR `0x3` | `CMD_CONFIG` + `TAG_OFFSET` | `[19:16] tag=1`, `[15:0] offset` | `offset 100 -> 0x11310064` |
| PK `0x4` | `CMD_CONFIG` | `[19:16] output dest`, `[15:8] min spacing`, `[7:4] threshold` | `pk nios 200 0 -> 0x1145C800` |

## ASP Command Table To Confirm

| Block | Accepts Config? | Required Commands | Payload Tags | Returns To Nios? | Open Questions |
| --- | --- | --- | --- | --- | --- |
| ADC ASP | Yes | `CMD_CONFIG`, `CMD_START/STOP/CLEAR` from ReCOP | bitfield payload, no tag | Maybe status | Confirm channel/divider UI names and whether waveform/LUT upload is stretch. |
| AVG ASP | Yes | `CMD_CONFIG`, `CMD_START/STOP/CLEAR` | bitfield payload, no tag | Maybe status | Window is currently `1,2,4,8,16`; confirm this is enough for MVP. |
| COR ASP | Yes | `CMD_CONFIG`, `CMD_START/STOP/CLEAR` | `TAG_WINDOW = 0x0`, `TAG_OFFSET = 0x1` | Maybe status/result-low/high if debugging | Confirm whether offset is signed or unsigned 16-bit. |
| PK ASP | Yes | `CMD_CONFIG`, `CMD_START/STOP/CLEAR`, status requests | bitfield payload, no tag | Yes, event/status to Nios | Confirm result event payload is peak interval/count and enough for frequency display. |
| ReCOP | Board control source | Sends `CMD_START/STOP/CLEAR/status` | Board mode/status fields if needed | Maybe status via NoC | Confirm exact switch/button mapping. |
| Nios II | UART/display bridge | Sends ASP config, receives PK/result | Uses tags defined above | Receives PK/result/status | Confirm Avalon adapter base and RX packet format. |

## PK Result Requirement

Zoran said PK should not connect directly to Nios. Result information such as time in clock cycles between consecutive peaks must be delivered through NoC:

```text
PK ASP -> NoC packet -> Nios II bridge -> UART/VGA display
```

The team still needs to confirm the exact packet format. Proposed minimum:

| Packet Field | Meaning |
| --- | --- |
| kind | `PKT_KIND_EVENT` or `PKT_KIND_STATUS` |
| code | `EVENT_MAX_PEAK`, `EVENT_MIN_PEAK`, or a new result/status code |
| dest | `NIOS_II_ADDR = 0x5` |
| payload | 20-bit peak interval/count or tagged low/high result |

If more than 20 bits are needed, send low/high packets using the existing `TAG_RESULT_LOW` and `TAG_RESULT_HIGH` pattern.

## Questions For Teammates

1. Solomon: can ADC/AVG provide the accepted config tags and valid ranges?
2. Tonny: can COR confirm `TAG_WINDOW`, `TAG_OFFSET`, and whether offset is signed?
3. Eric/PD: what exact PK packet should Nios receive for display?
4. Member A: what ReCOP switch/button mapping will send START/STOP/CLEAR?
5. Member C: does TDMA-MIN route `dest = 0x5` cleanly to the Nios bridge?

## MVP Boundary

Keep the first demo small:

1. Nios prints/sends config packets.
2. ReCOP sends board-control packets.
3. NoC routes packets to ASPs.
4. PK returns one result/status packet to Nios.
5. Nios prints the result over UART, with VGA as a visual extension.
