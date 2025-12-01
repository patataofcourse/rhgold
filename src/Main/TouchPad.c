// will probably need to move to SDK

#include "System/TouchPad.h"

#include "unk_funcs.h"

static volatile struct TouchPad gTouchPadData;

void TPi_TpCallback(u32 arg0, u32 arg1, s32 arg2) {

}

void TP_Init(void) {
    if (gTouchPadData.mUnk0x0 != 0) return;

    gTouchPadData.mUnk0x0 = 1;
    func_020340dc();
    gTouchPadData.mUnk0x10 = 0;
    gTouchPadData.mCallback = NULL;
    gTouchPadData.mUnk0x14 = 0;
    gTouchPadData.mUnk0x36 = 0;
    gTouchPadData.mUnk0x34 = 0;
    gTouchPadData.mBusyFlags = 0;
    gTouchPadData.mErrorFlags = 0;

    // wait for PXI_IsCallbackReady (to be renamed)
    while (!func_02034234(6, 1));

    func_020341e8(6, TPi_TpCallback);

}

void TP_SetCallback(void* callback) {
    OSIntrMode mode = OS_DisableInterrupts();
    gTouchPadData.mCallback = callback;
    OS_RestoreInterrupts(mode);
}

void TP_WaitBusy(u16 bitMask) {
    while (gTouchPadData.mBusyFlags & bitMask);
}

u32 TP_CheckError(u16 bitMask) {
    return gTouchPadData.mErrorFlags & bitMask;
}
