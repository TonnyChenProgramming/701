/*
 * pd_reference_nios.c
 *
 * Standalone Nios II benchmark for the PD-ASP software comparison.
 *
 * This does NOT connect to the PD-ASP hardware or NoC. It runs the same peak
 * detection algorithm in software on Nios II and measures cycles/sample using
 * the HAL timestamp timer. That is the IP-level hardware-vs-software comparison;
 * Nios-to-NoC hardware integration is GP2 scope.
 */

#include <stdint.h>
#include <stdio.h>

#include "system.h"
#include "sys/alt_timestamp.h"

#define SAMPLE_RATE_HZ      16000u
#define SAMPLES_PER_CYCLE   320u
#define N_CYCLES            5u
#define TOTAL_SAMPLES       (SAMPLES_PER_CYCLE * N_CYCLES)

#define MIN_PEAK_SPACING    200u
#define THRESHOLD_MSB       0u

typedef enum {
    POS_SLOPE = 0,
    NEG_SLOPE = 1
} slope_state_t;

typedef struct {
    slope_state_t state;
    uint32_t      last_corr;
    uint32_t      counter;
    uint32_t      peak_count;
    uint32_t      total_peaks;
    uint32_t      missed_peaks;
    uint32_t      min_peak_spacing;
    uint32_t      threshold_msb;
    int           peak_valid;
    int           first_seen;
    int           first_peak_done;
} pd_state_t;

static uint32_t samples[TOTAL_SAMPLES];

static void pd_reset(pd_state_t *s)
{
    s->state = POS_SLOPE;
    s->last_corr = 0;
    s->counter = 0;
    s->peak_count = 0;
    s->total_peaks = 0;
    s->missed_peaks = 0;
    s->min_peak_spacing = MIN_PEAK_SPACING;
    s->threshold_msb = THRESHOLD_MSB;
    s->peak_valid = 0;
    s->first_seen = 0;
    s->first_peak_done = 0;
}

static int pd_step(pd_state_t *s, uint32_t corr_in)
{
    s->peak_valid = 0;

    if (s->first_seen) {
        s->counter++;

        if (s->state == POS_SLOPE && corr_in < s->last_corr) {
            s->state = NEG_SLOPE;

            if (!s->first_peak_done) {
                s->first_peak_done = 1;
                s->counter = 0;
            } else {
                int passes_spacing = (s->counter >= s->min_peak_spacing);
                int passes_threshold = (s->threshold_msb == 0u) ||
                    ((corr_in >> 16) > s->threshold_msb);

                if (passes_spacing && passes_threshold) {
                    s->peak_count = s->counter & 0xFFFFFu;
                    s->peak_valid = 1;
                    s->total_peaks++;
                } else {
                    s->missed_peaks++;
                }
                s->counter = 0;
            }
        } else if (s->state == NEG_SLOPE && corr_in > s->last_corr) {
            s->state = POS_SLOPE;
        }
    }

    s->last_corr = corr_in;
    s->first_seen = 1;
    return s->peak_valid;
}

/*
 * Integer-only synthetic correlation-like waveform.
 * It has one smooth peak every 320 samples, so the expected accepted peak_count
 * after first-peak suppression is approximately 320.
 */
static uint32_t corr_sample(unsigned idx)
{
    unsigned phase = idx % SAMPLES_PER_CYCLE;
    unsigned dist = (phase <= (SAMPLES_PER_CYCLE / 2u))
                  ? phase
                  : (SAMPLES_PER_CYCLE - phase);
    int noise = (int)((idx * 137u) & 0x3fu) - 32;
    int value = 100000 + (int)(dist * 4500u) + noise;

    if (value < 0) {
        value = 0;
    } else if (value > 1048575) {
        value = 1048575;
    }

    return (uint32_t)value;
}

static void build_samples(void)
{
    unsigned i;

    for (i = 0; i < TOTAL_SAMPLES; i++) {
        samples[i] = corr_sample(i);
    }
}

static void print_hz_x100(const char *label, uint32_t hz_x100)
{
    printf("%s%lu.%02lu Hz\n",
           label,
           (unsigned long)(hz_x100 / 100u),
           (unsigned long)(hz_x100 % 100u));
}

int main(void)
{
    pd_state_t s;
    unsigned i;
    unsigned peaks_emitted = 0;
    alt_timestamp_type t_start;
    alt_timestamp_type t_end;
    alt_timestamp_type elapsed;
    alt_u32 timer_freq;
    uint32_t cycles_per_sample_x100;
    uint32_t freq_x100;

    printf("=== PD software benchmark on Nios II ===\n");

    build_samples();
    pd_reset(&s);

    if (alt_timestamp_start() < 0) {
        printf("ERROR: timestamp timer not available.\n");
        printf("In BSP settings, set hal.timestamp_timer to your interval timer.\n");
        return 1;
    }

    t_start = alt_timestamp();

    for (i = 0; i < TOTAL_SAMPLES; i++) {
        if (pd_step(&s, samples[i])) {
            peaks_emitted++;
        }
    }

    t_end = alt_timestamp();
    elapsed = t_end - t_start;
    timer_freq = alt_timestamp_freq();

    cycles_per_sample_x100 =
        (uint32_t)(((uint64_t)elapsed * 100u) / TOTAL_SAMPLES);

    printf("Samples processed:       %lu\n", (unsigned long)TOTAL_SAMPLES);
    printf("Peaks emitted:           %lu\n", (unsigned long)peaks_emitted);
    printf("Total peaks counter:     %lu\n", (unsigned long)s.total_peaks);
    printf("Missed peaks counter:    %lu\n", (unsigned long)s.missed_peaks);
    printf("Last peak_count:         %lu\n", (unsigned long)s.peak_count);

    if (s.peak_count != 0u) {
        freq_x100 = (SAMPLE_RATE_HZ * 100u) / s.peak_count;
        print_hz_x100("Estimated frequency:    ", freq_x100);
    }

    printf("\n=== Timing ===\n");
    printf("Timestamp frequency:     %lu Hz\n", (unsigned long)timer_freq);
    printf("Elapsed timer ticks:     %lu\n", (unsigned long)elapsed);
    printf("Cycles/sample:           %lu.%02lu\n",
           (unsigned long)(cycles_per_sample_x100 / 100u),
           (unsigned long)(cycles_per_sample_x100 % 100u));
    printf("Hardware PD-ASP target:  1.00 cycle/sample\n");

    if (timer_freq != 0u) {
        uint32_t elapsed_us =
            (uint32_t)(((uint64_t)elapsed * 1000000u) / timer_freq);
        printf("Elapsed time:            %lu us\n",
               (unsigned long)elapsed_us);
    }

    printf("=== Benchmark complete ===\n");
    return 0;
}
