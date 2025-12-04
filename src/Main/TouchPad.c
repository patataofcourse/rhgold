// will probably need to move to SDK

#include "System/TouchPad.h"

#include "unk_funcs.h"

static volatile struct TouchPad gTouchPadData;

#define DTCM_FUCKERY ((volatile u16*)0x027fffaa)

void TPi_TpCallback(u32 arg0, u32 arg1, s32 arg2) {
    u16 temp = ((u16)arg1 & 0x7f00) >> 8; // seems to indicate flag position(s)?
    union {
        u16 halves[2];
        u32 full;
    } temp2[2];
    TouchPadCallback callback;
    u32 temp3, temp4, temp5, temp6, temp7;

    if (arg2 != 0) {
        gTouchPadData.mErrorFlags |= 1 << temp;

        callback = gTouchPadData.mCallback;
        if (callback != NULL) {
            callback(temp, 4, 0);
        }
    } else if (temp == 0x10) {
        gTouchPadData.mUnk0x10 += 1;
        if (gTouchPadData.mUnk0x10 >= gTouchPadData.mUnk0x18) {
            gTouchPadData.mUnk0x10 = 0;
        }
        temp2[1].halves[0] = DTCM_FUCKERY[0];
        temp2[1].halves[1] = DTCM_FUCKERY[1];

        // TODO: all of this just gets optimized away
        temp3 = temp2[1].full << 7 >> 0x1f;
        temp4 = temp2[1].full << 8;
        temp6 = temp2[1].full << 5;
        temp5 = temp2[1].full << 0x14;
        gTouchPadData.mUnk0x14[temp7 = gTouchPadData.mUnk0x10].mUnk0x0 = temp5 >> 0x14;
        gTouchPadData.mUnk0x14[temp7].mUnk0x2 = temp4 >> 0x14; // how to make this not optimize to & 0xfff?
        gTouchPadData.mUnk0x14[temp7].mUnk0x4 = temp3 & 0xff;
        gTouchPadData.mUnk0x14[temp7].mUnk0x6 = temp6 >> 0x1e;

        callback = gTouchPadData.mCallback;
        if (callback != NULL) {
            callback(temp, 0, gTouchPadData.mUnk0x10);
        }
    } else {
        if ((arg1 & 0x01000000) == 0) return;
        switch((u16)arg1 & 0xff) {
            u32 temp1;
            case 0:
                switch (temp) {
                    case 0:
                        temp2[0].halves[0] = DTCM_FUCKERY[0];
                        temp2[0].halves[1] = DTCM_FUCKERY[1];
                        
                        // TODO: all of this just gets optimized away
                        temp3 = temp2[0].full << 7 >> 0x1f;
                        temp4 = temp2[0].full << 8;
                        temp6 = temp2[0].full << 5;
                        temp5 = temp2[0].full << 0x14;
                        gTouchPadData.mUnk0x8.mUnk0x0 = temp5 >> 0x14;
                        gTouchPadData.mUnk0x8.mUnk0x2 = temp4 >> 0x14; // how to make this not optimize to & 0xfff?
                        gTouchPadData.mUnk0x8.mUnk0x6 = temp6 >> 0x1e;
                        gTouchPadData.mUnk0x8.mUnk0x4 = temp3 & 0xff;
                        gTouchPadData.mUnk0x36 = 0;
                        break;
                    case 1:
                        gTouchPadData.mUnk0x36 = 2;
                        break;
                    case 2:
                        gTouchPadData.mUnk0x36 = 0;
                        break;
                };

                gTouchPadData.mBusyFlags &= ~(1 << temp);


                callback = gTouchPadData.mCallback;
                if (callback != NULL) {
                    callback(temp, 0, 0);
                }
                break;

            // this can't be right - ...right?
            case 4:
                temp1 = 3;
                goto test;
            case 2:
                temp1 = 1;
                goto test;
            case 3:
                temp1 = 2;

            test:
                gTouchPadData.mErrorFlags |= ~(1 << temp);
                gTouchPadData.mBusyFlags &= ~(1 << temp);
                callback = gTouchPadData.mCallback;
                if (callback != NULL) {
                    callback(temp, temp1, 0);
                }
                break;
            
            default:
                OS_Terminate();
                return;
        }
    }
}

void TP_Init(void) {
    if (gTouchPadData.mUnk0x0 != 0) return;

    gTouchPadData.mUnk0x0 = 1;
    func_020340dc();
    gTouchPadData.mUnk0x10 = 0;
    gTouchPadData.mCallback = NULL;
    gTouchPadData.mUnk0x14 = NULL;
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
