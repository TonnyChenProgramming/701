#include <stdio.h>
#include <stdint.h>
#include "system.h"
#include "sys/alt_timestamp.h"

#define RAM_DEPTH       512
#define ADDR_MASK       0x1FFu
#define LOW20_MASK      0xFFFFFu

static uint16_t ram[RAM_DEPTH];
static unsigned int next_write_addr = 0;

static unsigned int write_sample(uint16_t sample)
{
    unsigned int latest_addr = next_write_addr & ADDR_MASK;

    ram[latest_addr] = sample;

    next_write_addr = (next_write_addr + 1u) & ADDR_MASK;

    return latest_addr;
}

static uint64_t correlation_compute(
    unsigned int latest_written_addr,
    unsigned int window,
    uint16_t offset_h
)
{
    unsigned int origin;
    uint64_t correlation = 0;

    /*
     * Match current address_generator behaviour:
     *
     * if new_ave_data_addr_ff > correlation_window_n_ff:
     *     origin = new_ave_data_addr_ff - 1 - correlation_window_n_ff
     * else:
     *     origin = 0
     */
    if ((latest_written_addr & ADDR_MASK) > (window & ADDR_MASK)) {
        origin = (latest_written_addr - 1u - window) & ADDR_MASK;
    } else {
        origin = 0;
    }

    for (unsigned int counter = 0; counter < window; counter++) {
        unsigned int addr_left;
        unsigned int addr_right;

        /*
         * Match current safe-left-address behaviour:
         *
         * if current_corr_origin_ff > counter_ff:
         *     addr_left = origin - counter - 1
         * else:
         *     addr_left = 0
         */
        if (origin > counter) {
            addr_left = (origin - counter - 1u) & ADDR_MASK;
        } else {
            addr_left = 0;
        }

        addr_right = (origin + counter) & ADDR_MASK;

        uint32_t value_a = (uint32_t)ram[addr_left]  + (uint32_t)offset_h;
        uint32_t value_b = (uint32_t)ram[addr_right] + (uint32_t)offset_h;

        correlation += (uint64_t)value_a * (uint64_t)value_b;
    }

    /*
     * Hardware result is 36-bit.
     */
    correlation &= ((1ULL << 36) - 1ULL);

    return correlation;
}

static void split_correlation_result(
    uint64_t correlation,
    uint32_t *low20,
    uint32_t *high20
)
{
    *low20  = (uint32_t)(correlation & LOW20_MASK);
    *high20 = (uint32_t)((correlation >> 20) & LOW20_MASK);
}

static void print_result(
    const char *round_name,
    uint64_t correlation,
    uint32_t expected_low20,
    uint32_t expected_high20,
    alt_u32 cycles
)
{
    uint32_t low20;
    uint32_t high20;

    split_correlation_result(correlation, &low20, &high20);

    float time_ms = ((float)cycles / (float)alt_timestamp_freq()) * 1000.0f;

    printf("\n--- %s ---\n", round_name);
    printf("Correlation result: %llu\n", (unsigned long long)correlation);
    printf("LOW20:  actual = %u, expected = %u\n",
           (unsigned int)low20,
           (unsigned int)expected_low20);
    printf("HIGH20: actual = %u, expected = %u\n",
           (unsigned int)high20,
           (unsigned int)expected_high20);

    if (low20 == expected_low20 && high20 == expected_high20) {
        printf("Result check: PASS\n");
    } else {
        printf("Result check: FAIL\n");
    }

    printf("Clock cycles: %u cycles\n", (unsigned int)cycles);
    printf("Time taken:   %.6f ms\n", time_ms);
}

static uint64_t timed_correlation(
    unsigned int latest_written_addr,
    unsigned int window,
    uint16_t offset_h,
    alt_u32 *cycles_out
)
{
    alt_u32 start_cycles;
    alt_u32 end_cycles;
    uint64_t result;

    start_cycles = alt_timestamp();

    result = correlation_compute(
        latest_written_addr,
        window,
        offset_h
    );

    end_cycles = alt_timestamp();

    *cycles_out = end_cycles - start_cycles;

    return result;
}

int main(void)
{
    alt_u32 cycles;
    uint64_t result;
    unsigned int latest_addr;

    printf("C correlation benchmark started.\n");

    if (alt_timestamp_start() < 0) {
        printf("Error: No timestamp timer found. Check BSP settings.\n");
        return 1;
    }

    /*
     * Clear RAM and write pointer.
     */
    for (unsigned int i = 0; i < RAM_DEPTH; i++) {
        ram[i] = 0;
    }

    next_write_addr = 0;

    /*
     * Preload:
     *   RAM[0]  = 1
     *   RAM[1]  = 2
     *   ...
     *   RAM[39] = 40
     */
    printf("Preloading RAM[0..39] with values 1..40.\n");

    for (uint16_t sample = 1; sample <= 40; sample++) {
        write_sample(sample);
    }

    /*
     * ROUND 1
     *
     * DATA 41 -> RAM[40] = 41
     * latest_written_addr = 40
     *
     * window = 4
     * offset = 100
     *
     * Expected:
     *   LOW20  = 73420
     *   HIGH20 = 0
     */
    latest_addr = write_sample(41);

    result = timed_correlation(
        latest_addr,
        4,
        100,
        &cycles
    );

    print_result(
        "ROUND 1: window=4, offset=100",
        result,
        73420,
        0,
        cycles
    );

    /*
     * ROUND 2
     *
     * DATA 42 -> RAM[41] = 42
     * latest_written_addr = 41
     *
     * window = 6
     * offset = 200
     *
     * Expected:
     *   LOW20  = 329870
     *   HIGH20 = 0
     */
    latest_addr = write_sample(42);

    result = timed_correlation(
        latest_addr,
        6,
        200,
        &cycles
    );

    print_result(
        "ROUND 2: window=6, offset=200",
        result,
        329870,
        0,
        cycles
    );

    /*
     * ROUND 3
     *
     * DATA 43 -> RAM[42] = 43
     * latest_written_addr = 42
     *
     * window = 8
     * offset = 1000
     *
     * Expected:
     *   total  = 8,544,808
     *   LOW20  = 156200
     *   HIGH20 = 8
     */
    latest_addr = write_sample(43);

    result = timed_correlation(
        latest_addr,
        8,
        1000,
        &cycles
    );

    print_result(
        "ROUND 3: window=8, offset=1000",
        result,
        156200,
        8,
        cycles
    );

    printf("\nC correlation benchmark finished.\n");

    return 0;
}
