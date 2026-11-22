#ifndef _GLOBAL_H_
#define _GLOBAL_H_

#include <nitro.h>

#include "unk_funcs.h"

// Convert an int to an fx32
#define TOFX32(n) (fx32)((n) << FX32_SHIFT)

// Q24.8 fixed point types
typedef s32 s24_8;
#define INT_TO_FIXED(x) ((s32)((x) * 256))
#define FIXED_TO_INT(x) ((s32)((x) >> 8))

// Length of array (unsigned/signed)
#define NELEMU(a) ((sizeof((a)) / sizeof(*(a))))
#define NELEMS(a) (s32)((sizeof((a)) / sizeof(*(a))))


#endif
