#ifndef NIOS_PACKET_H
#define NIOS_PACKET_H

#include <stdint.h>

#define NIOS_PKT_KIND_CMD     0x1u
#define NIOS_PKT_KIND_DATA    0x2u
#define NIOS_PKT_KIND_STATUS  0x3u
#define NIOS_PKT_KIND_EVENT   0x4u

#define NIOS_CMD_NOP          0x0u
#define NIOS_CMD_CONFIG       0x1u
#define NIOS_CMD_START        0x2u
#define NIOS_CMD_STOP         0x3u
#define NIOS_CMD_CLEAR        0x4u

#define NIOS_ADDR_RECOP       0x0u
#define NIOS_ADDR_ADC_ASP     0x1u
#define NIOS_ADDR_AVE_ASP     0x2u
#define NIOS_ADDR_COR_ASP     0x3u
#define NIOS_ADDR_PK_ASP      0x4u
#define NIOS_ADDR_NIOS_II     0x5u
#define NIOS_ADDR_IDLE        0x6u
#define NIOS_ADDR_NULL        0x7u

#define NIOS_TAG_WINDOW       0x0u
#define NIOS_TAG_OFFSET       0x1u

#define NIOS_HOST_TAG_MODE    0xFu
#define NIOS_MODE_CORRELATION 0x0u
#define NIOS_MODE_PASS_THROUGH 0x1u

#define NIOS_PAYLOAD_VALUE_MASK 0xFFFFu

static inline uint32_t nios_make_packet(
    uint32_t kind,
    uint32_t code,
    uint32_t dest,
    uint32_t payload
)
{
    return ((kind & 0xFu) << 28)
         | ((code & 0xFu) << 24)
         | ((dest & 0xFu) << 20)
         | (payload & 0xFFFFFu);
}

static inline uint32_t nios_make_tagged_payload(uint32_t tag, uint32_t value)
{
    return ((tag & 0xFu) << 16) | (value & NIOS_PAYLOAD_VALUE_MASK);
}

static inline uint32_t nios_make_recop_config(uint32_t tag, uint32_t value)
{
    return nios_make_packet(
        NIOS_PKT_KIND_CMD,
        NIOS_CMD_CONFIG,
        NIOS_ADDR_RECOP,
        nios_make_tagged_payload(tag, value)
    );
}

static inline uint32_t nios_make_recop_simple_cmd(uint32_t code)
{
    return nios_make_packet(
        NIOS_PKT_KIND_CMD,
        code,
        NIOS_ADDR_RECOP,
        0u
    );
}

static inline uint32_t nios_packet_kind(uint32_t packet)
{
    return (packet >> 28) & 0xFu;
}

static inline uint32_t nios_packet_code(uint32_t packet)
{
    return (packet >> 24) & 0xFu;
}

static inline uint32_t nios_packet_dest(uint32_t packet)
{
    return (packet >> 20) & 0xFu;
}

static inline uint32_t nios_packet_tag(uint32_t packet)
{
    return (packet >> 16) & 0xFu;
}

static inline uint32_t nios_packet_value(uint32_t packet)
{
    return packet & NIOS_PAYLOAD_VALUE_MASK;
}

#endif
