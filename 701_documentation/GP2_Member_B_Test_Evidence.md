# GP2 Member B Test Plan and Evidence Hooks

Owner: Member B

This checklist defines the evidence Member B can collect for the Nios II UART/config/status path. The goal is to prove that PC commands become known 32-bit command packets, and that returned packets can be displayed by Nios II.

## Test Scope

Minimum scope:

```text
UART/JTAG UART command -> Nios parser -> packet word -> adapter TX path
adapter RX path -> Nios decode -> UART/VGA display
```

Out of scope for Member B:

1. Internal ASP algorithm correctness.
2. Full TDMA-MIN routing correctness.
3. ReCOP instruction-memory run-time upload.

Those are either Member C work or optional stretch work.

## Dry-Run Parser Evidence

Before hardware integration, Nios software can run in dry-run mode and print intended packet words.

Expected examples:

| Input Command | Expected Nios Output |
| --- | --- |
| `mode 1` | `TX 0x111F0000` |
| `mode 2` | `TX 0x111F0001` |
| `window 64` | `TX 0x11200040` and `TX 0x11300040` |
| `offset 100` | `TX 0x11310064` |
| `rx 0x41500140` | Decode/display a mock PK/result packet. |
| `status` | Current cached mode/window, TX/RX status, latest RX packet if any. |

Evidence to capture:

1. UART/JTAG UART terminal screenshot or copied output.
2. Short note confirming the packet words match `common/asp_packet_pkg.vhd`.
3. Git commit hash or branch state used for the test.

## Adapter Register Evidence

Once the Avalon-NoC adapter exists, capture a register-level test.

| Step | Action | Expected Result |
| --- | --- | --- |
| 1 | Read `TX_STATUS` after reset | `TX_READY = 1`, `TX_BUSY = 0`, `TX_ERROR = 0`. |
| 2 | Write `TX_PACKET = 0x111F0000` | Packet register holds mode 1 config command for ADC/source. |
| 3 | Pulse `TX_CONTROL.TX_VALID` | Adapter accepts packet. |
| 4 | Read `TX_STATUS` | `TX_LAST_ACCEPTED = 1` or `TX_READY = 1` after send. |
| 5 | Inject/mock RX packet | `RX_STATUS.RX_VALID = 1`. |
| 6 | Read `RX_PACKET` | Nios prints decoded kind/code/dest/payload. |
| 7 | Pulse `RX_CONTROL.RX_ACK` | `RX_VALID` clears. |

Evidence to capture:

1. UART output showing TX/RX sequence.
2. SignalTap/ModelSim waveform for `TX_VALID`, `TX_READY`, `RX_VALID`, and `RX_ACK`.
3. Any error/overflow flags staying clear during the test.

## ASP Config Path Evidence

When the NoC adapter and ASP command decoders are connected, run this simple integration test:

```text
Nios command: mode 1
Expected packet: 0x111F0000
Expected ASP behavior: ADC/source records/selects correlation pipeline mode.

Nios command: window 64
Expected packets: 0x11200040 and 0x11300040
Expected ASP behavior: AVG and COR store window value.

Nios command: offset 100
Expected packet: 0x11310064
Expected ASP behavior: COR stores offset value.
```

Evidence to capture:

1. UART output from Nios.
2. NoC waveform showing received packet fields at the target ASP.
3. If available, a returned status/result packet to Nios.

## ReCOP Board-Control Evidence

ReCOP evidence is still important, but it is separate from the Nios UART config path. For MVP, ReCOP should show board-driven reactive control:

```text
switch/button -> ReCOP -> START/STOP/CLEAR/status packet -> ASPs
```

Evidence to capture:

1. Switch/button event.
2. ReCOP packet output over NoC.
3. LED/status response.

## Status/Result Display Evidence

For returned status/result packets, Nios should decode and print:

```text
RX packet: 0x???????? kind=? code=? dest=? payload=0x?????
mode=<mode> window=<window> latest_result=<value> adapter_status=<flags>
```

For VGA, the first display can be simple:

```text
MODE: 1 CORRELATION
WINDOW: 64
STATUS: RUNNING
RESULT: <latest result>
```

Evidence to capture:

1. UART output with decoded packet.
2. Photo/screenshot of VGA display if available.
3. Note whether the result is mock data or real ASP data.

## Optional Stretch Evidence: Instruction Memory Upload

Instruction-memory upload is optional. Only attempt it after the UART/config/status path works.

To claim this stretch feature, evidence must show:

1. Nios holds ReCOP in reset.
2. Nios writes at least one instruction word into writable ReCOP program memory.
3. Nios releases ReCOP reset/start.
4. ReCOP executes the uploaded instruction.
5. ReCOP sends a known packet or output proving execution.

If these five points are not shown, do not describe instruction-memory upload as complete.

## Final Demo Checklist

| Item | Done |
| --- | --- |
| `Eric_GP2` branch contains Member B documentation. |  |
| Nios UART command set agreed with team. |  |
| Packet words agreed with ASP command decoders. |  |
| Avalon-NoC register map agreed with Member C integration. |  |
| Dry-run UART parser output captured. |  |
| Adapter TX/RX handshake waveform captured. |  |
| ASP receives at least one Nios config packet. |  |
| Nios receives at least one status/result packet. |  |
| VGA or UART displays final status/result. |  |
