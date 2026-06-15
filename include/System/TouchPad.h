#ifndef _SYSTEM_TOUCHPAD_H_
#define _SYSTEM_TOUCHPAD_H_

#include <nitro/spi/tp.h>

#include "global.h"

struct TPInfo {
    u16 x;
    u16 y;
    u16 valid;
    u16 unk6;
};

void func_02005a44(void);
void func_02005ae0(void);

u32 func_02005f98(TPInfo *info);
u32 func_02005fb4(TPInfo *info);

#endif
