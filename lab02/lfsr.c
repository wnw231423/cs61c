#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

unsigned get_bit(unsigned int x, unsigned int n) {
	return (x >> n) & 1;
}

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
	unsigned res = *reg;
	unsigned b0 = get_bit(res, 0);
	unsigned b2 = get_bit(res, 2);
	unsigned b3 = get_bit(res, 3);
	unsigned b5 = get_bit(res, 5);
	unsigned msb = (b0 ^ b2 ^ b3 ^ b5) & 1;
	res = res >> 1;
	res = res | (msb << 15);
	*reg = res;
}

