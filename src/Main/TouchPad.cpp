#include "System/TouchPad.h"

struct TPManager {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    s32 unk10;
    s32 unk14;
    u32 unk18;
    s32 unk1C;
    u32 unk20;
    s32 unk24;
    u32 unk28;
    u16 unk2C;
    u16 unk2E;
    u16 unk30;
    u16 unk32;
};


static TPManager sTPManager;
static TPData sTPDataRaw[8];
static TPData sTPDataDisp[8];
static TPInfo sTPInfo[8];

void func_020059a8(u16 &i) {
    i++;
    if (i >= 8) {
        i = 0;
    }
}

// typedef void (*TPRecvCallback)(TPRequestCommand command, TPRequestResult result, u16 index);
void func_020059c8(TPRequestCommand command, TPRequestResult result, u16 index) {
    if ((command != TP_REQUEST_COMMAND_AUTO_SAMPLING) || (result != TP_RESULT_SUCCESS)) {
        return;
    }

    if (sTPManager.unk20) {
        sTPManager.unkA = index;
        sTPManager.unk4 = sTPManager.unkA;
        sTPManager.unk20 = 0;
    }
    if (sTPManager.unkA != index) {
        OS_Panic("");
    }
    func_020059a8(sTPManager.unkA);
    if (sTPManager.unkA == sTPManager.unk4) {
        func_020059a8(sTPManager.unk4);
    }
}

void func_02005a44(void) {
    TPCalibrateParam calibrate;

    sTPManager.unk20 = 1;
    sTPManager.unk6 = 0;
    sTPManager.unk8 = 0;
    sTPManager.unk4 = 0;
    sTPManager.unkA = 0;
    func_02005ae0();
    OS_InitVAlarm();
    TP_Init();
    if (TP_GetUserInfo(&calibrate)) {
        TP_SetCalibrateParam(&calibrate);
    }
    TP_SetCallback(func_020059c8);
    TP_RequestAutoSamplingStart(0, 4, sTPDataRaw, NELEMU(sTPDataRaw));
    TP_WaitBusy(2);
    if (TP_CheckError(2)) { 
        OS_Panic(""); 
    };
}

void func_02005ae0(void) {
    sTPManager.unkE = 0;
    sTPManager.unk18 = 0;
    sTPManager.unk2 = 0;
    sTPManager.unkC = 0;
    sTPManager.unk30 = 0;
    sTPManager.unk2E = 0;
    sTPManager.unk2C = 0;
    sTPManager.unk32 = 0;
}


void func_02005b10(u16 valid, u16 x, u16 y) {
    if (sTPManager.unk1C >= 8) {
        OS_Panic("");
    }
    
    u32 tmp = sTPManager.unk1C;
    TPInfo &info = sTPInfo[tmp];

    // non matching here
    info.valid = valid;
    info.x = x;
    info.y = y;
    info.unk6 = 0;

    sTPManager.unk1C = tmp + 1;
}

void func_02005b70(TPData *data) {
    if (sTPManager.unkE) {
        sTPManager.unkE--;
        if (sTPManager.unk28 && !data->touch) {
            sTPManager.unkE = 20;
        }
        sTPManager.unk28 = data->touch;
        func_02005b10(FALSE, 0, 0);
        return;
    }
    if (!data->touch) {
        func_02005b10(FALSE, 0, 0);
        return;
    }
    if (data->validity & TP_VALIDITY_INVALID_XY) {
        func_02005b10(FALSE, 0, 0);
        return;
    }
    sTPManager.unk18 = TRUE;
    sTPManager.unk2 = data->x;
    sTPManager.unkC = data->y;
    sTPManager.unk10 = 0;
    sTPManager.unk24 = 0;
    sTPManager.unk14 = 0;
    func_02005b10(TRUE, sTPManager.unk2, sTPManager.unkC);
}

// non matching
void func_02005c48(TPData *data) {
    if (data->touch) {
        if (data->validity & TP_VALIDITY_INVALID_XY) {
            sTPManager.unk14++;
            if (sTPManager.unk14 >= 2) {
                sTPManager.unk24 = 0;
                sTPManager.unk10 = 0;
            }
        }
        u32 temp_r4;
        u32 temp_r2;
        s32 temp_r3;
        u16 temp_unk2;
        u16 temp_unkC;

        temp_r4 = (!(data->validity & TP_VALIDITY_INVALID_X)) ? data->x : sTPManager.unk2 + sTPManager.unk24;
        temp_r2 = (!(data->validity & TP_VALIDITY_INVALID_Y)) ? data->y : sTPManager.unkC + sTPManager.unk10;

        temp_r3 = sTPManager.unk24;
        temp_unk2 = sTPManager.unk2;
        temp_r4 -= sTPManager.unk2;
        sTPManager.unk24 = temp_r4;
        if (sTPManager.unk24 > 0) {
            sTPManager.unk24--;
        }

        s32 temp_r12 = temp_r3 - 5;
        temp_r3 += 5;

        if (sTPManager.unk24 < 0) {
            sTPManager.unk24++;
        }

        if (sTPManager.unk24 <= temp_r3) {
            if (sTPManager.unk24 >= temp_r12) {
                temp_r12 = sTPManager.unk24;
            }
            temp_r3 = temp_r12;
        }

        temp_r3 = MATH_CLAMP(temp_r3, -20, 20);
        sTPManager.unk24 = temp_r3;

        temp_r12 = sTPManager.unk10;
        temp_unkC = sTPManager.unkC;
        temp_r2 -= sTPManager.unkC;
        sTPManager.unk10 = temp_r2;
        if (sTPManager.unk10 > 0) {
            sTPManager.unk10--;
        }

        s32 temp_r2_1 = temp_r12 - 5;
        temp_r12 += 5;

        if (sTPManager.unk10 < 0) {
            sTPManager.unk10++;
        }

        if (sTPManager.unk10 <= temp_r12) {
            if (sTPManager.unk10 >= temp_r2_1) {
                temp_r2_1 = sTPManager.unk10;
            }
            temp_r12 = temp_r2_1;
        }

        temp_r12 = MATH_CLAMP(temp_r12, -20, 20);
        sTPManager.unk10 = temp_r12;
        sTPManager.unk2 = MATH_CLAMP(temp_unk2 + temp_r3, 0, 255);
        sTPManager.unkC = MATH_CLAMP(temp_unkC + temp_r12, 0, 192);
        func_02005b10(TRUE, sTPManager.unk2, sTPManager.unkC);
    } else {
        sTPManager.unk18 = FALSE;
        func_02005b10(FALSE, 0, 0);
        sTPManager.unkE = 20;
        sTPManager.unk28 = 0;
    }
}

void func_02005e34(void) {
    sTPManager.unk1C = 0;

    // non matching here
    u16 temp_r1 = sTPManager.unk6;
    u16 temp_r7 = sTPManager.unk8;
    for (u16 sp0 = temp_r1; sp0 != temp_r7; func_020059a8(sp0)) {
        if (sTPManager.unk18) {
            func_02005c48(&sTPDataDisp[sp0]);
        } else {
            func_02005b70(&sTPDataDisp[sp0]);
        }
    }
}

void func_02005e9c(void) {
    sTPManager.unk30 = sTPManager.unk18;
    sTPManager.unk2C = sTPManager.unk2;
    sTPManager.unk2E = sTPManager.unkC;
    sTPManager.unk32 = 0;
}

void func_02005ec8(void) {
    volatile BOOL irq = OS_DisableIrq();

    sTPManager.unk6 = sTPManager.unk4;
    sTPManager.unk8 = sTPManager.unkA;
    sTPManager.unk4 = sTPManager.unkA;

    OS_RestoreIrq(irq);

    u16 sp0 = sTPManager.unk6;
    u16 temp_r7 = sTPManager.unk8;

    while (sp0 != temp_r7) {
        TP_GetCalibratedPoint(&sTPDataDisp[sp0], &sTPDataRaw[sp0]);
        func_020059a8(sp0);
    }

    func_02005e34();
    func_02005e9c();
}

void func_02005f6c(TPInfo *info) {
    info->x = sTPManager.unk2C;
    info->y = sTPManager.unk2E;
    info->valid = sTPManager.unk30;
    info->unk6 = sTPManager.unk32;
}

u32 func_02005f98(TPInfo *info) {
    sTPManager.unk0 = 0;
    return func_02005fb4(info);
}

u32 func_02005fb4(TPInfo *info) {
    if (sTPManager.unk0 >= sTPManager.unk1C) {
        return 1;
    }
    TPInfo &dinfo = sTPInfo[sTPManager.unk0];
    info->x = dinfo.x;
    info->y = dinfo.y;
    info->valid = dinfo.valid;
    info->unk6 = dinfo.unk6;
    sTPManager.unk0++;
    return 0;
}
