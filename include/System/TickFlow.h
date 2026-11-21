#ifndef _SYSTEM_TICKFLOW_H_
#define _SYSTEM_TICKFLOW_H_

#include "global.h"
#include "TickFlowDecl.h"

typedef u32 TickFlowCode;

struct CTickFlow {
    TickFlowCode *mCode;
    s32 mNextInstructionPos;
    s24_8 mCurrentRest;

    u32 mCondvar;
    u8 mCondvarStackPos;
    u32 mCondvarStack[16];
    
    u8 mExecStackPos;
    u16 mExecInstPosStack[16];
    TickFlowCode *mExecCodeStack[16];

    s32 mUnk0xb8;
    s32 mUnk0xbc;
    BOOL mUnk0xc0;
    CTickFlow *mPrev;
    SndArc *mUnk0xc8;
    s32 mUnk0xcc;
    s32 mUnk0xd0[0x10];
    TickFlowCode **mUnk0x110;
    s32 mTickFlowIndex;
};

#endif