// will probably need to move to SDK

#include "System/TouchPad.h"

#include "unk_funcs.h"

#include <nitro/hw/io_reg.h>

static volatile struct TouchPad gTouchPadData;

typedef struct FuckeryStruct {
    u8 pad0x0[0x58];
    u16 mUnk0x58;
    u16 mUnk0x5a;
    u8 mUnk0x5c;
    u8 mUnk0x5d;
    u16 mUnk0x5e;
    u16 mUnk0x60;
    u8 mUnk0x62;
    u8 mUnk0x63;
} FuckeryStruct;

#define MORE_DTCM_FUCKERY ((volatile FuckeryStruct*)0x027ffc80)
#define DTCM_FUCKERY ((volatile u16*)0x027fffaa)

void TPi_TpCallback(u32 arg0, u32 arg1, s32 arg2) {
    u16 temp = ((u16)arg1 & 0x7f00) >> 8; // seems to indicate flag position(s)?
    union {
        u16 halves[2];
        struct {
            u32 mUnk0x0_bf0:0xc;
            u32 mUnk0x0_bf1:0xc;
            u32 mUnk0x0_bf2:0x1;
            u32 mUnk0x0_bf3:0x2;
        } full;
    } temp2[2];
    TouchPadCallback callback;
    u32 temp3, temp4, temp5, temp6;
    TouchPad_Sub* temp7;

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

        temp6 = gTouchPadData.mUnk0x10;
        temp7 = &gTouchPadData.mUnk0x14[temp6];
        temp7->mUnk0x0 = temp2[1].full.mUnk0x0_bf0;
        temp7->mUnk0x2 = temp2[1].full.mUnk0x0_bf1;
        temp7->mUnk0x4 = temp2[1].full.mUnk0x0_bf2 & 0xff;
        temp7->mUnk0x6 = temp2[1].full.mUnk0x0_bf3 & 0xff;

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
                        
                        gTouchPadData.mUnk0x8.mUnk0x0 = temp2[0].full.mUnk0x0_bf0;
                        gTouchPadData.mUnk0x8.mUnk0x2 = temp2[0].full.mUnk0x0_bf1;
                        gTouchPadData.mUnk0x8.mUnk0x4 = temp2[0].full.mUnk0x0_bf2 & 0xff;
                        gTouchPadData.mUnk0x8.mUnk0x6 = temp2[0].full.mUnk0x0_bf3 & 0xff;

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
                gTouchPadData.mErrorFlags |= (1 << temp);
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

//TODO: finish
int TP_CalcCalibrateParam(s16* arg0, u16 arg1, u16 arg2, u16 arg3, u16 arg4, u16 arg5, u16 arg6, u16 arg7, u16 arg8) {
    u32 tmp;
    u16 result;
    s32 tmp2;
    if (arg1 >= 0x1000 || arg2 >= 0x1000 || arg5 >= 0x1000 || arg6 >= 0x1000) {
        return 1;
    }
    if (arg3 >= 0x100 || arg7 >= 0x100 || arg4 >= 0xc0 || arg8 >= 0xc0 ) {
        return 1;
    }
    if (arg3 == arg7 || arg4 == arg8 || arg1 == arg5 || arg2 == arg6) {
        return 1;
    }

    OS_DisableInterrupts();
    reg_CP_DIVCNT = 0;
    reg_CP_DIV_NUMER_L = (arg1 - arg5) << 8;
    reg_CP_DIV_DENOM_L = (arg3 - arg7);
    tmp = arg4 - arg8;

    while (reg_CP_DIVCNT & 0x8000) {}

    result = reg_CP_DIV_RESULT_L;

    reg_CP_DIVCNT = 0;
    reg_CP_DIV_NUMER_L = (arg1 - arg5) << 8;
    reg_CP_DIV_DENOM_L = tmp;
    
    if (result >= 0x8000 || result < -0x8000 ) {
        OS_RestoreInterrupts(arg8);
        return 1;
    }

    arg0[2] = result;

    if (result >= 0x8000 || result < -0x8000 ) {
        OS_RestoreInterrupts(arg8);
        return 1;
    }

    while (reg_CP_DIVCNT & 0x8000) {}

    OS_RestoreInterrupts(arg8);

    result = reg_CP_DIV_RESULT_L;

    if (result >= 0x8000 || result < -0x8000 ) {
        return 1;
    }
    arg0[3] = result;

    tmp2 = (((arg2 + arg6) << 8) - arg0[3] * (arg4 + arg8)) << 9 >> 16;

    if (tmp2 >= 0x8000 || tmp2 < -0x8000 ) {
        return 1;
    }
    arg0[1] = tmp2;
    
    return 0;
}

BOOL TP_GetUserInfo(u16* arg0) {
    volatile FuckeryStruct* stru = MORE_DTCM_FUCKERY;
    u16 temp1 = stru->mUnk0x58, temp2 = stru->mUnk0x5a, temp3 = stru->mUnk0x5e, temp4 = stru->mUnk0x60;
    u8 temp5 = stru->mUnk0x5c, temp6 = stru->mUnk0x5d, temp7 = stru->mUnk0x62, temp8 = stru->mUnk0x63;
    if ( temp1 != 0 || temp3 != 0 || temp2 != 0 || temp4 != 0 ) {
        int res = TP_CalcCalibrateParam(arg0,
            temp1, temp2, temp5, temp6,
            temp3, temp4, temp7, temp8);

        if (res == 0) goto out;
    }

    arg0[0] = 0;
    arg0[1] = 0;
    arg0[2] = 0;
    arg0[3] = 0;
    return TRUE;

    out: return TRUE;
}

// TODO: arg0 is probably an array of two structs consisting of two s16s each
void TP_SetCalibrateParam(s16* arg0) {
    OSIntrMode mode;
    s16 temp;
    
    if (arg0 == NULL) {
        gTouchPadData.mUnk0x34 = 0;
        return;
    }

    mode = OS_DisableInterrupts();

    temp = arg0[2];
    if (temp != 0) {
        reg_CP_DIVCNT = 0;
        reg_CP_DIV_NUMER_L = 0x10000000;
        reg_CP_DIV_DENOM = (u32)temp;
        gTouchPadData.mUnk0x1c = arg0[0];
        gTouchPadData.mUnk0x20 = arg0[2];

        while ((reg_CP_DIVCNT & 0x8000)) {}

        gTouchPadData.mUnk0x24 = reg_CP_DIV_RESULT_L;

    } else {
        gTouchPadData.mUnk0x1c = 0;
        gTouchPadData.mUnk0x20 = 0;
        gTouchPadData.mUnk0x24 = 0;
    }

    temp = arg0[3];
    if (arg0[3] != 0) {
        reg_CP_DIVCNT = 0;
        reg_CP_DIV_NUMER_L = 0x10000000;
        reg_CP_DIV_DENOM = (u32)temp;
        gTouchPadData.mUnk0x28 = arg0[1];
        gTouchPadData.mUnk0x2c = arg0[3];

        while ((reg_CP_DIVCNT & 0x8000)) {}

        gTouchPadData.mUnk0x30 = reg_CP_DIV_RESULT_L;

    } else {
        gTouchPadData.mUnk0x28 = 0;
        gTouchPadData.mUnk0x2c = 0;
        gTouchPadData.mUnk0x30 = 0;
    }

    OS_RestoreInterrupts(mode);
    gTouchPadData.mUnk0x34 = 1;
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
