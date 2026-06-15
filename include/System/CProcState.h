#ifndef _SYSTEM_CTICKFLOWMANAGER_H_
#define _SYSTEM_CTICKFLOWMANAGER_H_

typedef u32 TickFlow;

struct CProcState {
    TickFlow *mCurTickFlow;
    int mTickFlowPos;
    u32 mRestVal;
    u32 mCondvar;
    u8 mStackPos;
    char pad0x11[3];
    int mStack[16];
    u8 mUnk0x54;
    u16 mCallStackPos[16];
    TickFlow *mCallStackPtrs[16];
    int mUnk0xb8;
    s32 mUnk0xbc;
    int mUnk0xc0;
    CProcState *mPrev;
    int mUnk0xc8;
    int mUnk0xcc;
    int mUnk0xd0[0x10];
    TickFlow **mUnk0x110;
    int mTickFlowIndex;
};

#endif