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
| `rx <hex>` | Mock/decode a received NoC packet for display testing | No TX packet |
| `status` | Print cached Nios state | No TX packet |
| `help` | Print command list | No TX packet |

## Files

| File | Purpose |
| --- | --- |
| `nios_command.h/.c` | Command helpers that build/send packets and track cached TX/RX state. |
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

Destination names accepted by the console are `recop`, `adc`, `avg`, `ave`, `cor`, `pk`, `nios`, `idle`, `null`, or numeric `0..7`.
