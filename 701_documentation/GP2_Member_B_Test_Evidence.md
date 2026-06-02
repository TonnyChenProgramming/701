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
| `adc avg 0 0` | `TX 0x11120000` |
| `avg cor 4` | `TX 0x11230200` |
| `corwin 64` | `TX 0x11300040` |
| `offset 100` | `TX 0x11310064` |
| `pk nios 200 0` | `TX 0x1145C800` |
| `rx 0x41500140` | `RX 0x41500140 EVENT code=0x1 dest=NIOS payload=0x00140 event=MAX_PEAK peak_count=320` |
| `rx 0x31544000` | `RX 0x31544000 STATUS code=0x1 dest=NIOS payload=0x44000 status=CONFIG_DONE source=PK running=0 done=1 error=0 detail=0x0000` |
| `status` | Current cached ASP config, latest RX packet, config acknowledgement mask, and peak count. |

Evidence to capture:

1. UART/JTAG UART terminal screenshot or copied output.
2. Short note confirming the packet words match `common/asp_packet_pkg.vhd`.
3. Git commit hash or branch state used for the test.

After injecting the mock PK event and PK config acknowledgement above, `status` should include:

```text
cfg=0x10 peak=320 ack=CONFIG_DONE/PK
```

The `display` command should show a compact UART snapshot with `PK : cfg=yes`, `RESULT: peak count=320`, and `ACK: CONFIG_DONE from PK`. If `NIOS_VGA_CHAR_BUFFER_BASE` is defined, capture the same text on the VGA character buffer.

## Hardware Hook Evidence

When the Avalon-NoC adapter exists, build the same console with `NIOS_NOC_ADAPTER_BASE` defined.

| Input Command | Expected Hardware Action |
| --- | --- |
| `adc avg 0 0` | Poll `TX_READY`, write `TX_PACKET = 0x11120000`, pulse `TX_VALID`. |
| `pk nios 200 0` | Poll `TX_READY`, write `TX_PACKET = 0x1145C800`, pulse `TX_VALID`. |
| `poll` | If `RX_VALID = 1`, read `RX_PACKET`, print decoded fields, then pulse `RX_ACK`. |

Evidence to capture:

1. SignalTap or simulation waveform showing `TX_PACKET`, `TX_VALID`, and `TX_READY`.
2. UART transcript showing the same packet word printed by Nios.
3. One mocked or real PK result packet received through `poll`.

## Adapter Register Evidence

Once the Avalon-NoC adapter exists, capture a register-level test.

| Step | Action | Expected Result |
| --- | --- | --- |
| 1 | Read `TX_STATUS` after reset | `TX_READY = 1`, `TX_BUSY = 0`, `TX_ERROR = 0`. |
| 2 | Write `TX_PACKET = 0x11120000` | Packet register holds ADC config command. |
| 3 | Pulse `TX_CONTROL.TX_VALID` | Adapter accepts packet. |
| 4 | Read `TX_STATUS` | `TX_LAST_ACCEPTED = 1` or `TX_READY = 1` after send. |
| 5 | Inject/mock RX packet | `RX_STATUS.RX_VALID = 1`. |
| 6 | Read `RX_PACKET` | Nios prints decoded kind/code/dest/payload. |
| 7 | Pulse `RX_CONTROL.RX_ACK` | `RX_VALID` clears. |

Evidence to capture:

1. UART output showing TX/RX sequence.
2. SignalTap/ModelSim waveform for `TX_VALID`, `TX_READY`, `RX_VALID`, and `RX_ACK`.
3. Any error/overflow flags staying clear during the test.

The focused RTL testbench is `nios_support/adapter/avalon_noc_adapter_tb.vhd`. It checks reset-ready state, Nios TX packet routing, RX hold-until-ack behavior, RX overflow reporting, and the adapter-local loopback path used for the first board smoke test.

For the first board smoke test, add the packaged `Avalon NoC Adapter` component to Platform Designer, connect its `avs` slave to the Nios II data master, and export the `noc_send`/`noc_recv` conduits. Capture a screenshot of the Platform Designer connections before Quartus compilation.

Before connecting TDMA-MIN, enable the adapter-local loopback and run:

```text
hwclear
hwloop 1
adc avg 0 0
poll
hwstatus
hwloop 0
```

Expected evidence:

1. TX prints `0x11120000`.
2. `poll` reads the same packet back through the Avalon adapter.
3. `hwstatus` shows `ready=1`, `error=0`, `overflow=0`, and `loopback=1`.

This isolates the Platform Designer base-address and Avalon-MM wiring test from the later TDMA-MIN routing test.

### Completed Member B Board Smoke Test

The standalone Member B board test has passed with the adapter-local loopback enabled:

```text
nios> adc avg 0 0
TX 0x11120000

nios> poll
RX 0x11120000 CMD code=0x1 dest=ADC payload=0x20000 cmd=CONFIG tag=0x2 value=0x0000

nios> hwstatus
HW tx=0x00000009 ready=1 busy=0 error=0 accepted=1 rx=0x00000000 valid=0 overflow=0 error=0 adapter=0x00000010 loopback=1
```

This proves that Nios II can write an Avalon-MM packet into the adapter and read the same packet back through the adapter RX path. It does not yet prove TDMA-MIN routing.

### Completed VGA Build Hook

The optional text-only VGA path has been added to the Platform Designer system. The same cached Nios status snapshot used by UART is written to the Avalon character buffer when `NIOS_VGA_CHAR_BUFFER_BASE` is defined.

Quartus full compilation completed successfully with `0 errors`, and the updated FPGA image was programmed successfully. The final monitor photo is pending because a VGA cable is not currently available.

### TDMA-MIN Integration Handoff

Member C can connect the exported adapter conduits at the Quartus or NoC integration top level:

```text
adapter noc_send_addr[7:0]  -> TDMA-MIN injection address
adapter noc_send_data[31:0] -> TDMA-MIN injection data

TDMA-MIN output address for Nios node 0x5 -> adapter noc_recv_addr[7:0]
TDMA-MIN output packet                    -> adapter noc_recv_data[31:0]
```

After the real NoC path is connected, disable adapter-local loopback with `hwloop 0`, send `adc avg 0 0`, and use `poll` or `status` to observe returned ASP status/result packets.

## ASP Config Path Evidence

When the NoC adapter and ASP command decoders are connected, run this simple integration test:

```text
Nios command: adc avg 0 0
Expected packet: 0x11120000
Expected ASP behavior: ADC outputs channel 0 to AVG with divider 0.

Nios command: avg cor 4
Expected packet: 0x11230200
Expected ASP behavior: AVG outputs to COR and uses 4-sample window.

Nios command: corwin 64
Expected packet: 0x11300040
Expected ASP behavior: COR stores window value.

Nios command: offset 100
Expected packet: 0x11310064
Expected ASP behavior: COR stores offset value.

Nios command: pk nios 200 0
Expected packet: 0x1145C800
Expected ASP behavior: PK sends peak events to Nios.
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

Expected LED behavior:

| Status Packet | LED Meaning |
| --- | --- |
| `START_DONE` from ADC/AVG/COR/PK | Turn that ASP LED on. |
| `STOP_DONE` from ADC/AVG/COR/PK | Turn that ASP LED off. |
| `CLEAR_DONE` from ADC/AVG/COR/PK | Turn that ASP LED off. |

Evidence to capture:

1. Switch/button event.
2. ReCOP packet output over NoC.
3. LED/status response.

## Status/Result Display Evidence

For returned status/result packets, Nios should decode and print:

```text
RX 0x???????? <kind> code=0x? dest=<node> payload=0x?????
link=<dry|hw> adc=d?/c?/v? avg=d?/w? cor=w?/o? pk=d?/s?/t? tx=<packet> rx=<packet>
```

For VGA, the first display can be simple:

```text
ADC: dest AVG
AVG: window 4
COR: window 64 offset 100
RESULT: <latest peak/frequency result>
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
| UART displays final status/result. | Adapter-local loopback passed; real NoC result pending. |
| VGA displays final status/result. | Build hook complete; monitor test pending VGA cable. |
