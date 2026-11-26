#ifndef _MAIN_TICKFLOW_H_
#define _MAIN_TICKFLOW_H_

#include "global.h"
#include "TickFlowDecl.h"

#define TICKFLOW_CATEGORY_ROOT 0
#define TICKFLOW_CATEGORY_PREV_ROOT 10000
#define TICKFLOW_CATEGORY_DEFAULT 30000

class CTickFlow {
public:
    TickFlowCode *mCode;
    s32 mNextInstructionPos;
    s24_8 mCurrentRest;

    u32 mCondvar;
    u8 mCondvarStackPos;
    u32 mCondvarStack[16];
    
    u8 mExecStackPos;
    u16 mExecInstPosStack[16]; // Reduces the 32-bit-sized mNextInstructionPos to 16 bits!!
    TickFlowCode *mExecCodeStack[16];

    s32 mUnk0xb8;
    s32 mUnk0xbc;
    BOOL mUnk0xc0;
    CTickFlow *mNext;
    NNSSndArc *mUnk0xc8;
    void *mUnk0xcc;
    s32 mUnk0xd0[0x10];
    TickFlowCode **mUnk0x110;
    s32 mTickFlowIndex;
};

TickFlowCode *func_02011098(s32 id);

#endif