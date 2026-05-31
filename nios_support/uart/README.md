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
| `rx <hex>` | Mock/decode a received NoC packet for display testing, including PK peak events | No TX packet |
| `status` | Print cached Nios state | No TX packet |
| `display` | Print the compact display snapshot and refresh VGA when enabled | No TX packet |
| `help` | Print command list | No TX packet |

## Files

| File | Purpose |
| --- | --- |
| `nios_command.h/.c` | Command helpers that build/send packets and track cached TX/RX state. |
| `nios_display.h/.c` | Lightweight UART/VGA status snapshot formatter. |
| `nios_packet.h` | Shared packet constants and helper functions for Nios C code. |
| `nios_noc_adapter.h/.c` | Avalon-MM register offsets, bit masks, and simple polling TX/RX helpers for the Nios-to-NoC adapter. |
| `nios_uart_console.c` | UART/JTAG UART command parser skeleton. |

## Nios II Usage

Create or open a Nios II application project and add these source/header files to the application source folder. The standard Nios II BSP routes `printf()` and `fgets()` through the configured console, normally JTAG UART.

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

The command state caches `latest_peak_count`, a `config_done_mask`, and the latest STATUS acknowledgement. `nios_display.c` renders those fields for UART and can also write a simple 80-column Avalon character buffer. Define `NIOS_VGA_CHAR_BUFFER_BASE` to enable VGA writes. The older C723 VGA code is a useful reference, but its FreeRTOS graph task is intentionally not copied into this MVP path.

Destination names accepted by the console are `recop`, `adc`, `avg`, `ave`, `cor`, `pk`, `nios`, `idle`, `null`, or numeric `0..7`.
