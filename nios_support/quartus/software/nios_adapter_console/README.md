# Member B Nios UART Command Skeleton

This folder contains the first Nios II support code for Member B. It accepts UART/JTAG UART text commands, builds the 32-bit packet words agreed in `common/asp_packet_pkg.vhd`, and either prints them in dry-run mode or writes them into the Avalon-NoC adapter.

No Avalon/NoC hardware adapter is required for dry-run mode.

## Commands

| Command | Meaning | Expected Packet |
| --- | --- | --- |
| `adc <dest> <ch> <div>` | Configure ADC output destination, channel, and sample divider. | Example: `0x11120000` |
| `avg <dest> <win>` | Configure AVG output destination and window `1,2,4,8,16`. | Example: `0x11230200` |
| `corwin <n>` | Configure COR window value `1..511`. | Example: `0x11300040` |
| `offset <n>` | Configure COR offset value. | Example: `0x11310064` |
| `pk <dest> <sp> <th>` | Configure PK output destination, min spacing, and threshold. | Example: `0x1145C800` |
| `poll` | Poll the hardware adapter for one received packet | No TX packet |
| `capture <n>` | Drain and print up to `n` received packets from the hardware adapter FIFO. | No TX packet |
| `demo <adc|avg|full|board> [n]` | Run a canned board demo. `board` arms the chain for SW/KEY3 starts. | No TX packet |
| `hwstatus` | Print decoded Avalon-NoC adapter register flags. | No TX packet |
| `hwclear` | Clear adapter TX/RX error and overflow flags. | No TX packet |
| `hwloop <0|1>` | Enable or disable adapter-local loopback for board smoke testing. | No TX packet |
| `rx <hex>` | Mock/decode a received NoC packet for display testing, including PK peak events | No TX packet |
| `status` | Print cached Nios state | No TX packet |
| `display` | Print the compact display snapshot to UART/VGA console output | No TX packet |
| `clear console` / `cls` | Clear the VGA console output area | No TX packet |
| `help` | Print command list | No TX packet |

## Files

| File | Purpose |
| --- | --- |
| `nios_command.h/.c` | Command helpers that build/send packets and track cached TX/RX state. |
| `nios_display.h/.c` | Lightweight UART/VGA status snapshot formatter and VGA console mirror. |
| `nios_packet.h` | Shared packet constants and helper functions for Nios C code. |
| `nios_noc_adapter.h/.c` | Avalon-MM register offsets, bit masks, and simple polling TX/RX helpers for the Nios-to-NoC adapter. |
| `nios_uart_console.c` | UART/JTAG UART command parser skeleton. |

## Nios II Usage

Create or open a Nios II application project and add these source/header files to the application source folder. The standard Nios II BSP routes `printf()` and `fgets()` through the configured console, normally JTAG UART.

For the DE1-SoC `Nios_System_2A` board app, the Makefile already defines `NIOS_NOC_ADAPTER_BASE=0x08011000u` and `NIOS_VGA_CHAR_BUFFER_BASE=0x08012000u`. On startup the software clears the VGA character buffer, draws a compact title/header, and mirrors console output immediately below it. The VGA writer adds a small top/left/bottom margin and wraps long packet lines so monitor overscan does not hide the first row, first columns, or the right side of `RX` capture lines. Use `clear console` or `cls` to clear the VGA output area. Rebuild and download the ELF after changing this software; the SOF only needs to be rebuilt/reprogrammed when the Qsys/VHDL hardware changes.

Without `NIOS_NOC_ADAPTER_BASE`, the console prints packets without touching registers:

```text
nios> adc avg 0 0
TX 0x11120000

nios> avg cor 4
TX 0x11230200

nios> corwin 64
TX 0x11300040

nios> pk nios 200 0
TX 0x1145C800

nios> rx 0x41500140
RX 0x41500140 EVENT code=0x1 dest=NIOS payload=0x00140 event=MAX_PEAK peak_count=320

nios> rx 0x31544000
RX 0x31544000 STATUS code=0x1 dest=NIOS payload=0x44000 status=CONFIG_DONE source=PK running=0 done=1 error=0 detail=0x0000

nios> status
link=dry adc=d2/c0/v0 avg=d3/w4 cor=w64/o0 pk=d5/s200/t0 tx=0x1145C800 rx=0x31544000 cfg=0x10 peak=320 ack=CONFIG_DONE/PK

nios> display
NIOS ASP STATUS
LINK: DRY RUN
ADC: cfg=no dest=AVG ch=0 div=0
AVG: cfg=no dest=COR window=4
COR: cfg=no window=64 offset=0
PK : cfg=yes dest=NIOS spacing=200 threshold=0
RESULT: peak count=320
ACK: CONFIG_DONE from PK detail=0x0000
```

When the Avalon-NoC adapter exists, define `NIOS_NOC_ADAPTER_BASE` to the generated Platform Designer base address and add `nios_noc_adapter.c` to the Nios application. The same console commands will then write `TX_PACKET`/`TX_CONTROL`, and `poll` will read `RX_PACKET` when `RX_VALID` is set.

Before TDMA-MIN integration, use the adapter-local loopback mode for a board smoke test:

```text
nios> hwclear
HW cleared

nios> hwloop 1
HW loopback=1

nios> adc avg 0 0
TX 0x11120000

nios> poll
RX 0x11120000 CMD code=0x1 dest=ADC payload=0x20000 cmd=CONFIG tag=0x2 value=0x0000

nios> hwstatus
HW tx=0x00000009 ready=1 busy=0 error=0 accepted=1 rx=0x00000000 valid=0 overflow=0 error=0 adapter=0x00000010 loopback=1

nios> hwloop 0
HW loopback=0
```

This proves the Nios Avalon-MM connection, register base address, TX write path, RX read path, and acknowledgement path before the external NoC conduits are connected.

After TDMA-MIN/ASP integration, keep loopback disabled for the real demo:

```text
nios> hwclear
HW cleared

nios> hwloop 0
HW loopback=0

nios> adc avg 0 0
TX 0x11120000

nios> avg cor 4
TX 0x11230200

nios> corwin 4
TX 0x11300004

nios> offset 100
TX 0x11310064

nios> pk nios 0 0
TX 0x11450000
```

Then use the ReCOP board controls to START the ASPs and poll until a peak event
arrives:

```text
nios> poll
RX 0x41500001 EVENT code=0x1 dest=NIOS payload=0x00001 event=MAX_PEAK peak_count=1
```

For the provided `gp2_final_board_top.vhd` wrapper, `SW1..SW0` selects the ASP
address (`00` ADC, `01` AVG, `10` COR, `11` PK) and `KEY3` sends START through
the ReCOP control encoder.

For a lecturer demo that keeps LEDR3..0 tied to the physical ReCOP controls,
run:

```text
nios> demo board
```

Then use `SW1..SW0` plus `KEY3` in this order:

```text
01 AVG  -> LEDR2
10 COR  -> LEDR1
11 PK   -> LEDR0
00 ADC  -> LEDR3
```

After the LEDs are on, run `capture 8` and `display`.

## Packet Format

```text
[31:28] kind
[27:24] code
[23:20] dest
[19:0]  payload
```

For the current Member B path, Nios sends configuration packets directly to ASP addresses. ReCOP keeps the board-driven reactive role for START/STOP/CLEAR.

For MVP status acknowledgements, the proposed rule is:

```text
CONFIG done        -> Nios, for UART/VGA confirmation
START/STOP/CLEAR done -> ReCOP, for four ASP LEDs
PK peak EVENT      -> Nios, for result display
```

The command state caches `latest_peak_count`, `latest_peak_value`, a `config_done_mask`, and the latest STATUS acknowledgement. `nios_display.c` renders those fields for UART and mirrors the JTAG UART output to the VGA console log. Define `NIOS_VGA_CHAR_BUFFER_BASE` to enable VGA writes. The older C723 VGA code is a useful reference, but its FreeRTOS graph task is intentionally not copied into this MVP path.

Destination names accepted by the console are `recop`, `adc`, `avg`, `ave`, `cor`, `pk`, `nios`, `idle`, `null`, or numeric `0..7`.
