# GP2 Member C ASP/NoC Standalone Test

This folder contains the Member C deliverable:

```text
mock ReCOP packet -> TDMA-style NoC harness -> ASP chain -> output packet
```

The standalone chain is:

```text
mock source
  -> ADC ASP
  -> AVG ASP
  -> COR ASP
  -> Peak ASP
  -> mock output sink / Nios address
```

It also contains the final GP2 integration evidence that connects Member B's
Avalon-NoC adapter and Member A's ReCOP control/status path into the same
NoC/ASP chain.

## Frozen NoC Addresses

The test uses the shared constants in `common/asp_packet_pkg.vhd`:

| Block | Address |
| --- | --- |
| ReCOP/control source | `0x0` |
| ADC ASP | `0x1` |
| AVG ASP | `0x2` |
| COR ASP | `0x3` |
| Peak ASP | `0x4` |
| Nios/output sink | `0x5` |
| Idle/debug sink | `0x6` |
| Null/drop sink | `0x7` |

## Run In ModelSim

From this folder:

```tcl
do run_gp2_member_c.do
```

Expected transcript evidence:

```text
Errors: 0, Warnings: 0
First ADC DATA packet observed at cycle ...
First output EVENT packet observed at cycle ...
Measured ASP pipeline latency = ... NoC clock cycles from first ADC DATA to first output EVENT
GP2 Member C ASP/NoC standalone integration test PASSED

# ** Note: First ADC DATA packet observed at cycle 5
#    Time: 1370 ns  Iteration: 0  Instance: /gp2_asp_noc_tb
# ** Note: First output EVENT packet observed at cycle 87
#    Time: 3010 ns  Iteration: 0  Instance: /gp2_asp_noc_tb
# ** Note: Measured ASP pipeline latency = 82 NoC clock cycles from first ADC DATA to first output EVENT
#    Time: 3010 ns  Iteration: 0  Instance: /gp2_asp_noc_tb
# ** Note: GP2 Member C ASP/NoC standalone integration test PASSED
#    Time: 3010 ns  Iteration: 0  Instance: /gp2_asp_noc_tb
```

The `.do` file adds waveform groups for the mock NoC packet, routed packet,
mock output packet, and each ASP `send` port. These are the signals to capture
for the Member C waveform evidence.

## Real ASP Pipeline Test

The smoke test above keeps COR in direct pass-through mode so packet routing is
easy to inspect. For final Member C evidence, also run:

```tcl
do run_gp2_member_c_real_pipeline.do
```

This test configures the actual processing chain:

```text
ADC raw samples
  -> AVG window 4
  -> COR window 4, offset 100, correlation mode
  -> Peak ASP
  -> Nios/output event
```

The ADC is configured as channel 0 with sample divider 4. This keeps the
virtual ADC stream inside the fixed TDMA slot bandwidth of the standalone
harness, so AVG receives consecutive ROM samples:

```text
0, 383, 707, 924, ...
```

Expected transcript evidence:

```text
Errors: 0, Warnings: 0
REAL PIPE: first ADC raw DATA at cycle 2 packet=0x20200000
REAL PIPE: first AVG window-4 DATA at cycle 23 packet=0x203001F7
REAL PIPE: first COR RESULT_LOW at cycle 58 packet=0x21363164
REAL PIPE: first COR RESULT_HIGH at cycle 59 packet=0x22300001
REAL PIPE: first Peak EVENT to Nios at cycle 310 packet=0x41500003
REAL PIPE: ADC raw to first COR result latency = 56 NoC clock cycles
REAL PIPE: ADC raw to first Peak EVENT latency = 308 NoC clock cycles
GP2 Member C REAL ASP pipeline integration test PASSED
```

In the waveform, these packets are short pulses near the start of the data
phase, not values that remain visible at the end of the 20 us run:

```text
1850 ns: debug_adc_send = {02} {20200000}
2270 ns: debug_avg_send = {03} {203001F7}
```

If the wave value column shows `{07} {00000000}`, the cursor is on an idle/null
cycle. Zoom to roughly `1800 ns` through `2320 ns`, or use the updated `.do`
file, which now opens the useful window and adds ADC/AVG internal signals.

Use the smoke test to explain routing. Use the real-pipeline test to claim that
AVG, COR, and Peak are all doing their actual ASP work.

## Final Nios/ReCOP Hwloop-0 Test

For the final integration boundary, run:

```tcl
do run_gp2_final_hwloop0.do
```

This test uses the real `avalon_noc_adapter` and disables adapter-local
loopback, matching the Nios console command:

```text
hwloop 0
```

The simulated full path is:

```text
Nios Avalon write
  -> Avalon-NoC adapter TX
  -> GP2 NoC router
  -> ADC/AVG/COR/Peak ASP chain
  -> Avalon-NoC adapter RX
```

It also pulses the ReCOP KEY/SW control bridge to START AVG, COR, Peak, and ADC.

Expected transcript evidence:

```text
FINAL HWLOOP0: adapter local loopback disabled
FINAL HWLOOP0: ReCOP status LEDs show PK/COR/AVG/ADC running at cycle 1
FINAL HWLOOP0: Nios adapter RX packet=0x41500001
GP2 FINAL Nios/ReCOP/ASP NoC hwloop 0 integration test PASSED
```

`0x41500001` decodes as:

```text
kind = 0x4 EVENT
code = 0x1 EVENT_MAX_PEAK
dest = 0x5 Nios II
payload = 0x00001 peak count
```

That is the important proof that `hwloop 0` is using the actual NoC/ASP return
path, not Member B's adapter-local loopback.

## DE1-SoC Board Integration

Board files are under `nios_support/quartus`:

| File | Purpose |
| --- | --- |
| `gp2_final_board_top.vhd` | Top-level DE1-SoC wrapper connecting Nios, ReCOP control, NoC router, and ASP chain. |
| `gp2_final_board.qpf` | Quartus project for the final GP2 board revision. |
| `gp2_final_board.qsf` | File list and DE1-SoC assignments for the final GP2 board revision. |

The current Nios app includes Eric's VGA character-buffer path. After the ELF is
rebuilt and downloaded, the external monitor shows a compact title/header and a
scrolling console log immediately below it. The log mirrors `TX`, `RX`,
`CAPTURE`, demo, `display`, and error output from the JTAG UART console. It is
drawn with a small top/left/bottom safety margin and wraps long packet lines so
full ADC/AVG/Peak capture information remains visible on monitors that clip the
outer VGA edges. Use `clear console` or `cls` to clear the monitor log.

The old `nios_adapter_test` revision is still useful for Member B adapter-local
loopback. Use `gp2_final_board` for the real GP2 demo.

Before compiling the board revision, generate the Platform Designer system:

```text
Open nios_support/quartus/Nios_System_2A.qsys in Platform Designer
Add ../adapter to the IP search path if the Avalon NoC Adapter is missing
Generate HDL for synthesis
Confirm this file exists:
  nios_support/quartus/Nios_System_2A/synthesis/Nios_System_2A.qip
```

Then compile `gp2_final_board.qpf` in Quartus and program the generated SOF.
If any HDL under the ASP folders changes, rebuild and reprogram the SOF before
trusting the DE1-SoC LEDs; the board keeps running the old logic until then.
Close any running Nios II console, JTAG UART, or SystemConsole session before
programming, otherwise Quartus Programmer may report that the JTAG target is
already in use.

After programming the fixed `gp2_final_board.sof`, run this first:

```text
hwclear
hwloop 0
hwstatus
```

The `hwstatus` line must show `adapter=0xA5...`. That `A5` prefix is a
fingerprint from the fixed Avalon-NoC adapter. If it shows `adapter=0x0000000A`,
`adapter=0x00000000`, or anything not starting with `0xA5`, the FPGA is still
running an older SOF and `poll` can still return the stale `0x00000000` packet.
The FIFO/capture board image built from this revision has SOF checksum
`0x02182885`.

On the board, the intended demo flow is:

```text
hwclear
hwloop 0
adc avg 0 4
avg cor 4
corwin 4
offset 100
pk nios 0 0

Use SW1..SW0 to select ASP:
  00 ADC(LEDR3), 01 AVG (LEDR2), 10 COR(LEDR1), 11 PK(LEDR0)
Press KEY3 once to START each ASP.
poll
status
display
```

For debugging, the Nios console can bypass the physical KEY/SW ReCOP start path
and send the same START commands directly through the NoC:

```text
hwclear
hwloop 0
adc avg 0 4
avg cor 4
corwin 4
offset 100
pk nios 0 0
start avg
start cor
start pk
start adc
poll
```

That direct path should return a Peak EVENT such as `0x41500001`. If direct
START works but KEY3 does not, debug the KEY/SW/ReCOP control path. If direct
START also fails, debug the programmed SOF, NoC routing, or ASP chain.

The board console also supports:

```text
capture <n>
```

This drains up to `n` packets from the Avalon-NoC adapter RX FIFO and prints
them without typing `poll` repeatedly. The FIFO is intentionally small; it is
for demonstration/debug evidence, not high-rate audio streaming.

To prove that the ADC samples are meaningful, temporarily route ADC directly to
Nios and capture the first 16 channel-0 samples:

```text
hwclear
hwloop 0
adc nios 0 15
clear adc
hwclear
start adc
capture 16
stop adc
```

The signed samples should follow the ADC ROM:

```text
0, 383, 707, 924, 1000, 924, 707, 383,
0, -383, -707, -924, -1000, -924, -707, -383
```

The packet words are DATA packets addressed to Nios, for example:

```text
RX 0x20500000 DATA ... sample=0
RX 0x2050017F DATA ... sample=383
RX 0x205002C3 DATA ... sample=707
RX 0x2050039C DATA ... sample=924
...
RX 0x205FFE81 DATA ... sample=-383
```

To prove the AVG stage, tap AVG instead:

```text
hwclear
hwloop 0
adc avg 0 15
avg nios 4
clear adc
clear avg
hwclear
start avg
start adc
capture 8
stop adc
stop avg
```

The first AVG window-4 samples should begin around:

```text
503, 753, 888, 888, 753, 503, 176, -177, ...
```

For the final integrated demo, restore the full processing chain and capture
Peak events. Use `pk nios 0 0` for this board demo. The current COR output
creates accepted Peak edges only about 2 or 3 Peak-input samples apart, so
`pk nios 16 0` filters out the real events and `capture` can return empty:

```text
hwclear
hwloop 0
stop adc
stop avg
stop cor
stop pk
adc avg 0 4
avg cor 4
corwin 4
offset 100
pk nios 0 0
clear adc
clear avg
clear cor
clear pk
hwclear
start avg
start cor
start pk
start adc
capture 8
display
```

`hwclear` only clears the Nios adapter/FIFO. It does not stop ADC, AVG, COR,
or PK if they were already running from a previous test, so the explicit STOP
commands make the demonstration repeatable.

Each accepted peak now emits two Nios events:

```text
EVENT code=0x1 MAX_PEAK    payload = peak_spacing since previous peak
EVENT code=0x3 PEAK_VALUE  payload = local maximum value detected by Peak ASP
```

For the Final demo, focus on `PEAK_VALUE`: this is the detected peak height
from the processed AVG/COR stream. `MAX_PEAK` is supporting timing/debug data;
its payload is not the peak height. It tells how many accepted Peak-input
samples elapsed since the previous accepted peak. The captured spacing payloads
are commonly `2` or `3` for the current test signal, because they are measured
after AVG and COR processing, not from the original ADC sine ROM index.

For a one-command lecture demo, the Nios console can run the same sequence:

```text
demo full
```

To prove the physical ReCOP KEY/SW control path, use the board-armed demo
instead. This configures and clears the full ASP chain, but it does not START
the ASPs from Nios:

```text
demo board
```

Then use the board controls in this order:

```text
SW1..SW0 = 01, press KEY3 -> START AVG, LEDR2 on
SW1..SW0 = 10, press KEY3 -> START COR, LEDR1 on
SW1..SW0 = 11, press KEY3 -> START PK,  LEDR0 on
SW1..SW0 = 00, press KEY3 -> START ADC, LEDR3 on
capture 8
display
```

This is the strongest final demo path: Nios proves configuration and result
capture, while ReCOP proves board-side START/status control through LEDR3..0.

Other one-command demos are:

```text
demo adc
demo avg
```

LED map in `gp2_final_board_top.vhd`:

```text
LEDR0..3 = ReCOP ASP status bits: PK, COR, AVG, ADC
LEDR4..7 = low Nios LED PIO bits
LEDR8    = latched Peak EVENT reached Nios after the ASPs are started
LEDR9    = latched ASP STATUS reached ReCOP
```
