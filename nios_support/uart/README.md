# Member B Nios UART Command Skeleton

This folder contains the first Nios II support code for Member B. It is a dry-run command parser: it accepts UART/JTAG UART text commands, builds the 32-bit packet words agreed in `common/asp_packet_pkg.vhd`, and prints the packet that would be sent to ReCOP.

No Avalon/NoC hardware adapter is required for this step.

## Commands

| Command | Meaning | Expected Packet |
| --- | --- | --- |
| `mode 1` | Select AVG/COR/PK correlation pipeline | `0x110F0000` |
| `mode 2` | Select direct pass-through mode | `0x110F0001` |
| `window <n>` | Configure window value | `0x11000000 \| n` |
| `start` | Start stream/pipeline | `0x12000000` |
| `reset` | Clear/reset command path | `0x14000000` |
| `status` | Print cached Nios state | No TX packet |
| `help` | Print command list | No TX packet |

## Files

| File | Purpose |
| --- | --- |
| `nios_packet.h` | Shared packet constants and helper functions for Nios C code. |
| `nios_noc_adapter.h` | Avalon-MM register offsets and bit masks for the Nios-to-NoC adapter. |
| `nios_uart_console.c` | UART/JTAG UART command parser skeleton. |

## Nios II Usage

Create or open a Nios II application project and add these two files to the application source folder. The standard Nios II BSP routes `printf()` and `fgets()` through the configured console, normally JTAG UART.

The first version intentionally prints packets instead of touching registers:

```text
nios> mode 1
TX 0x110F0000
```

When the Avalon-NoC adapter exists, replace the body of `nios_send_packet()` in `nios_uart_console.c` with register writes using `nios_noc_adapter.h`.

## Packet Format

```text
[31:28] kind
[27:24] code
[23:20] dest
[19:0]  payload
```

For the current Member B path, Nios sends command packets to ReCOP address `0x0`.

The mode tag `0xF` is a host-control proposal. Confirm it with Member A before adding it permanently to `common/asp_packet_pkg.vhd`.
