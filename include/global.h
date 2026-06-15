#ifndef _GLOBAL_H_
#define _GLOBAL_H_

#include <nitro.h>

#include "unk_funcs.h"

// Length of array (unsigned/signed)
#define NELEMU(a) ((sizeof((a)) / sizeof(*(a))))
#define NELEMS(a) (s32)((sizeof((a)) / sizeof(*(a))))

#endif
