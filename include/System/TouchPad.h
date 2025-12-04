#ifndef _SYSTEM_TOUCHPAD_H_
#define _SYSTEM_TOUCHPAD_H_

#include "global.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*TouchPadCallback)(u16, u8, u8);

typedef struct TouchPad_Sub {
    u16 mUnk0x0;
    u16 mUnk0x2;
    u16 mUnk0x4;
    u16 mUnk0x6;
} TouchPad_Sub;

typedef struct TouchPad {
    u16 mUnk0x0; // initialized state?
    TouchPadCallback mCallback; // TODO: figure out type of callback
    TouchPad_Sub mUnk0x8;
    u16 mUnk0x10;
    TouchPad_Sub* mUnk0x14;
    u16 mUnk0x18; // maximum for mUnk0x10?
    u8 pad0x1a[0x1a];
    u16 mUnk0x34;
    u16 mUnk0x36;
    u16 mErrorFlags;
    u16 mBusyFlags;
} TouchPad;

void TP_Init(void);
void TP_SetCallback(void* callback);
void TP_WaitBusy(u16 bitMask);
u32 TP_CheckError(u16 bitMask);

#ifdef __cplusplus
};
#endif

#endif
