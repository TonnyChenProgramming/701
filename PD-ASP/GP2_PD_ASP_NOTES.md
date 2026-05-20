# GP2 Peak Detector ASP Wrapper

Use `PeakDetector_ASP.vhd` as the GP2-facing top level for the peak detector.

The original IP files are intentionally unchanged:

- `pd_core.vhd` remains the peak-detection datapath/FSM.
- `pd_asp.vhd` remains the verified packet wrapper from the IP stage.
- `PeakDetector_ASP.vhd` adapts that wrapper to the Lab 2 TDMA-MIN `send`/`recv` entity style.

## GP2 Entity

```vhdl
entity PeakDetector_ASP is
    port (
        clock : in  bit_1;
        reset : in  bit_1;
        init  : in  bit_1;
        send  : out tdma_min_port;
        recv  : in  tdma_min_port
    );
end entity;
```

## Address Map

Use the shared team address constants from `asp_packet_pkg.vhd`:

| Node | Address |
| --- | --- |
| ReCOP | `0x00` |
| ADC ASP | `0x01` |
| Average ASP | `0x02` |
| Correlation ASP | `0x03` |
| Peak ASP | `0x04` |
| Nios II | `0x05` |
| Idle | `0x06` |
| Null | `0x07` |

## Important Integration Point

The Correlation ASP currently produces a 36-bit correlation value and Tonny's
encoder sends it to the Peak ASP as two packets:

```text
TAG_RESULT_LOW  payload = correlation(19 downto 0)
TAG_RESULT_HIGH payload = "0000" & correlation(35 downto 20)
```

`PeakDetector_ASP.vhd` buffers the low packet and, when the high packet arrives,
feeds one scaled 20-bit sample into the existing PD logic:

```text
pd_sample = correlation(35 downto 16)
          = high_payload(15 downto 0) & low_payload(19 downto 16)
```

This preserves correlation magnitude ordering much better than using only the
low 20 bits.

## TDMA-MIN Type Assumption

The wrapper assumes the Lab 2 package defines:

```vhdl
type tdma_min_port is record
    addr : addr8_t;
    data : std_logic_vector(31 downto 0);
end record;
```

If the actual record uses different field names, update only these lines in
`PeakDetector_ASP.vhd`:

```vhdl
recv.addr
recv.data
send.addr
send.data
```
