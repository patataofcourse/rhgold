#ifndef _SYSTEM_TOUCHPAD_H_
#define _SYSTEM_TOUCHPAD_H_

#include "global.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct TouchPad {
    u16 mUnk0x0; // initialized state?
    void* mCallback; // TODO: figure out type of callback
    u8 pad0x8[8];
    u16 mUnk0x10;
    u32 mUnk0x14;
    u8 pad0x18[0x1c];
    u16 mUnk0x34;
    u16 mUnk0x36;
    u16 mErrorFlags;
    u16 mBusyFlags;
} TouchPad;

void TP_Init(void);
void TP_WaitBusy(u16 bitMask);
u32 TP_CheckError(u16 bitMask);

#ifdef __cplusplus
};
#endif

#endif
