#ifndef _SYSTEM_CTICKFLOWMANAGER_H_
#define _SYSTEM_CTICKFLOWMANAGER_H_

struct CProcState {
    int *mCurTickFlow;
    int mTickFlowPos;
    u32 mRestVal;
    u32 mCondvar;
    u8 mUnk0x10;
    char pad0x11[0x43];
    u8 mUnk0x54;
    char pad0x55[0x63];
    int mUnk0xb8;
    s32 mUnk0xbc;
    int mUnk0xc0;
    CProcState *mPrev;
    int mUnk0xc8;
    int mUnk0xcc;
    int mUnk0xd0[0x10];
    int **mUnk0x110;
    int mTickFlowIndex;
};

#endif