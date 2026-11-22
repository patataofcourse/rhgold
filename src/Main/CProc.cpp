#include "Main/CProc.h"

// TODO: Needs some more cleanup probably
BOOL CProc::handleCommands(CTickFlow *tickFlow) {
    mTickFlowCurProc = tickFlow;

    TickFlowCode *tickFlowCode = tickFlow->mCode;
    u32 opInt = tickFlowCode[tickFlow->mNextInstructionPos];
    u32 *args = &tickFlowCode[tickFlow->mNextInstructionPos];
    u32 num_args = (opInt & 0x3c00) >> 10;
    u32 cmd = opInt & 0x3ff;
    tickFlow->mNextInstructionPos += num_args + 1;
    u32 arg0 = opInt >> 14;

    switch (cmd) {
        case TF_022: {
            tickFlow->mUnk0x110 = (TickFlowCode **)args[1];
            break;
        }
        case TF_000: {
            CTickFlow *newFlow = createTickFlow(tickFlow, (TickFlowCode *)args[1], tickFlow->mCurrentRest);
            newFlow->mUnk0xc0 = TRUE;
            mUnk0x68 = TRUE;
            mUnk0x80 = -1;
            break;
        }
        case TF_023: {
            if (tickFlow->mUnk0x110 == NULL) {
                OS_Panic("");
            }
            
            if (tickFlow->mUnk0x110[arg0] != NULL) {
                CTickFlow *newFlow = createTickFlow(tickFlow, tickFlow->mUnk0x110[arg0], tickFlow->mCurrentRest);
                newFlow->mUnk0xc0 = TRUE;
                mUnk0x68 = TRUE;
            }
            mUnk0x80 = -1;
            
            break;
        }
        case TF_02D: {
            mUnk0x80 = arg0;
            break;
        }
        case TF_001: {
            tickFlow->mCurrentRest += INT_TO_FIXED(arg0);
            break;
        }
        case TF_026: {
            tickFlow->mCurrentRest += INT_TO_FIXED(tickFlow->mCondvar);
            break;
        }
        case TF_027: {
            tickFlow->mCurrentRest += INT_TO_FIXED(func_02015c14(arg0)->effects);
            break;
        }
        case TF_002: {
            ((void(*)(u32))(args[1]))(args[2]);
            break;
        }
        case TF_004: {
            tickFlow->mNextInstructionPos = gotoLabel(tickFlow, arg0);
            break;
        }
        case TF_005: {
            tickFlow->mCondvar = args[1];
            break;
        }
        case TF_006: {
            tickFlow->mCondvar += args[1];
            break;
        }
        case TF_007: {
            stackPush(tickFlow);
            break;
        }
        case TF_008: {
            stackPop(tickFlow);
            break;
        }
        case TF_009: {
            s32 condvar = tickFlow->mCondvar;
            s32 value = args[1];

            bool condPass = false;
            switch (arg0) {
                case 0:
                    condPass = condvar == value;
                    break;
                case 1:
                    condPass = condvar != value;
                    break;
                case 2:
                    condPass = condvar < value;
                    break;
                case 3:
                    condPass = condvar <= value;
                    break;
                case 4:
                    condPass = condvar > value;
                    break;
                case 5:
                    condPass = condvar >= value;
                    break;
            }

            if (!condPass) {
                // goto to the next else/end?
                tickFlow->mNextInstructionPos = func_02014d8c(tickFlow, 10, 0, 11, 0, 11, 0, 9, 11, tickFlow->mNextInstructionPos, 1);
            }
            break;
        }
        case TF_00A: {
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow, 11, 0, 11, 0, 11, 0, 9, 11, tickFlow->mNextInstructionPos, 1);
            break;
        }
        case TF_00C: {
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow, 13, tickFlow->mCondvar, 15, 0, 16, 0, 12, 16, tickFlow->mNextInstructionPos, 1);
            break;
        }
        case TF_00E: {
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow, 16, 0, 16, 0, 16, 0, 12, 16, tickFlow->mNextInstructionPos, 1);
            break;
        }
        case TF_011: {
            tickFlow->mExecCodeStack[tickFlow->mExecStackPos] = tickFlow->mCode;
            tickFlow->mExecInstPosStack[tickFlow->mExecStackPos] = tickFlow->mNextInstructionPos;
            tickFlow->mExecStackPos++;
            tickFlow->mCode = (TickFlowCode *)args[1];
            tickFlow->mNextInstructionPos = 0;
            break;
        }
        case TF_024: {
            if (tickFlow->mUnk0x110 == NULL) {
                OS_Panic("");
            }
            if (tickFlow->mUnk0x110[arg0] == NULL) {
                break;
            }

            tickFlow->mExecCodeStack[tickFlow->mExecStackPos] = tickFlow->mCode;
            tickFlow->mExecInstPosStack[tickFlow->mExecStackPos] = tickFlow->mNextInstructionPos;
            tickFlow->mExecStackPos++;
            tickFlow->mCode = tickFlow->mUnk0x110[arg0];
            tickFlow->mNextInstructionPos = 0;
            break;
        }
        case TF_012: {
            tickFlow->mExecStackPos--;
            tickFlow->mCode = tickFlow->mExecCodeStack[tickFlow->mExecStackPos];
            tickFlow->mNextInstructionPos = tickFlow->mExecInstPosStack[tickFlow->mExecStackPos];
            break;
        }
        case TF_013: {
            return TRUE;
        }
        case TF_014: {
            tickFlow->mCondvar = func_02004d48(arg0);
            break;
        }
        case TF_015: {
            mHaltedProcess = TRUE;
            break;
        }
        case TF_016: {
            func_02013fbc(arg0);
            break;
        }
        case TF_017: {
            func_02014454(arg0);
            break;
        }
        case TF_018: {
            s32 tmp4 = args[3];
            s32 tmp = func_020144c0() * args[1];
            if (tmp4 >= FIXED_TO_INT(tmp)) {
                tmp4 = args[2];
                tmp = func_020144c0() * args[1];
                if (tmp4 <= FIXED_TO_INT(tmp)) {
                    tmp4 = FIXED_TO_INT(func_020144c0() * (s32)args[1]);
                }
            }
            func_02014454(tmp4);
            break;
        }
        case TF_028: {
            func_02014454(INT_TO_FIXED(func_02015dd8(args[1], 48)) / (s32)arg0);
            break;
        }
        case TF_019: {
            NNSSndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            switch(arg0) {
                case 0:
                    func_0200c648(args[1], tickFlow->mUnk0xcc);
                    break;
                case 1:
                    func_0200c654(args[1], tickFlow->mUnk0xcc);
                    break;
                case 2:
                    func_0200c660(args[1], tickFlow->mUnk0xcc);
                    break;
                case 3:
                    func_0200c66c(args[1], tickFlow->mUnk0xcc);
                    break;
            }
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case TF_01A: {
            NNSSndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            func_02013fec(arg0);
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case TF_025: {
            s32 tmp2 = func_02013f80(150);
            NNSSndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            func_0200c378(mSndHandle, arg0);
            func_02013fbc(FX_Whole(((INT_TO_FIXED(tmp2) / mSpeedSeq) * 150)));
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case TF_02F: {
            s32 tmp = func_02013f80(150);
            NNSSndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            s32 tmp3 = mUnk0x30;
            if (tmp3 <= 0) {
                tmp3 = 120;
            }
            func_0200c378(mSndHandle, func_02013f3c(arg0, tmp3));
            func_02013fbc(FX_Whole(((INT_TO_FIXED(tmp) / mSpeedSeq) * 150)));
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case TF_01B: {
            func_0201408c(arg0);
            break;
        }
        case TF_01C: {
            func_02013fbc(func_02015dd8(arg0, 48));
            break;
        }
        case TF_02A: {
            func_02014160(arg0);
            break;
        }
        case TF_030: {
            func_02014160(INT_TO_FIXED(arg0) / mGameSpeed);
            break;
        }
        case TF_02B: {
            func_020142ec(arg0, args[1]);
            break;
        }
        case TF_02C: {
            func_02014310(arg0, args[1]);
            break;
        }
        case TF_01D: {
            func_02014320(arg0);
            break;
        }
        case TF_01E: {
            func_02014408(arg0, args[1]);
            break;
        }
        case TF_01F:
        case TF_020: {
            NNSSndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            u32 a0 = (u32)arg0 / 128;
            u32 a2 = arg0 & 0x7f;
            u32 a1 = args[1] & 0xffff;
            s32 a3 = (s32)args[1] >> 16;
            if (cmd == 0x1f) {
                func_02014520(a0, a1, a2, a3);
            } else {
                func_02014588(args[2], a0, a1, a2, a3);
            }
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case TF_021: {
            NNSSndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);

            func_020145f4(arg0, args[1], (s32)args[1] >> 16);

            NNS_SndArcSetCurrent(arc);
            break;
        }
        case TF_029: {
            tickFlow->mCurrentRest -= INT_TO_FIXED(arg0);
            break;
        }
        case TF_02E: {
            func_02014620();
            break;
        }
        
        // non-existent commands
        case TF_003:
        case TF_00B:
        case TF_00D:
        case TF_00F:
        case TF_010: {
            break;
        }

        default: {
            return handleProcCommands(cmd, arg0, &args[1]);
        }
    };
    return FALSE;
}

CProc::CProc(s32 tfID) {
    mTickFlowId = tfID;
    mVBlankCount = func_020014e0();
    mUnk0x88 = NULL;
    mUnk0x8c = 0;
    mTickFlowCurProc = NULL;
    mSndHandle = func_0200c198();
    mCurrentSndHandle = NULL;
    NNS_SndStrmHandleInit(&mStrmHandle);
    init();
}

CProc::~CProc(void) {
    CTickFlow *tickFlow = mTickFlowHead;
    while (tickFlow != NULL) {
        CTickFlow *lastTickFlow = tickFlow->mPrev;
        delete tickFlow;
        tickFlow = lastTickFlow;
    }
    func_0200c1c0(mSndHandle);
    NNS_SndArcStrmStop(&mStrmHandle, 0);

}

BOOL CProc::func_02013b08(void) {
    if (func_02014880()) {
        return TRUE;
    }
    
    if (mGameSpeed1 != 0) {
        mTempo = tempoFromSpeed(mGameSpeed1);
    }

    if (update()) {
        return TRUE;
    }

    func_02014374();
    return FALSE;
}

BOOL CProc::update(void) {
    return TRUE;
}

void CProc::init(void) {
    mTickFlowHead = NULL;
    mHaltedProcess = 0;
    mGameSpeed1 = 0;
    mGameSpeed = 0;
    mState = 0;
    mTempo = mSpeedStrm = 120;
    mVolume = 127;
    mUnk0x6c = 0;
    mUnk0x54 = 0;
    mCurrentStrmId = -1;
    mSpeedSeq = INT_TO_FIXED(1.0);
    mTickFlowIndex = 1;
    mUnk0x80 = -1;
}

bool CProc::findTickFlowIndex(s32 index) {
    CTickFlow *temp = mTickFlowHead;
    while (temp != NULL) {
        if (temp->mTickFlowIndex == index) {
            return true;
        } else {
            temp = temp->mPrev;
        }
    }
    return false;
}

CTickFlow *CProc::createTickFlow(CTickFlow *tickFlow, TickFlowCode *tickFlowCode, s32 initRest) {
    CTickFlow *newTickFlow = new CTickFlow();

    if (tickFlow == NULL) {
        tickFlow = func_020144c8();
    }

    newTickFlow->mCode = tickFlowCode;
    newTickFlow->mNextInstructionPos = 0;
    newTickFlow->mCurrentRest = initRest;
    newTickFlow->mUnk0xb8 = 0;
    newTickFlow->mCondvar = 0;
    newTickFlow->mCondvarStackPos = 0;
    newTickFlow->mExecStackPos = 0;
    newTickFlow->mUnk0xbc = 30000;

    if (tickFlow != NULL) {
        if (mUnk0x80 > 0) {
            newTickFlow->mUnk0xbc = mUnk0x80;
        } else if (tickFlow->mUnk0xbc != 0) {
            newTickFlow->mUnk0xbc = tickFlow->mUnk0xbc + 1;
        }
    }

    mUnk0x80 = -1;
    newTickFlow->mUnk0xc0 = FALSE;
    newTickFlow->mUnk0xc8 = 0;
    newTickFlow->mUnk0xcc = 0;
    newTickFlow->mPrev = mTickFlowHead;
    mTickFlowHead = newTickFlow;

    for (int i = 0; i < 0x10; i++) {
        newTickFlow->mUnk0xd0[i] = 0;
    }

    newTickFlow->mUnk0x110 = NULL;
    newTickFlow->mTickFlowIndex = mTickFlowIndex;

    do {
        mTickFlowIndex++;
        if (mTickFlowIndex == 0) {
            mTickFlowIndex = 1;
        }
    } while (findTickFlowIndex(mTickFlowIndex));

    if (tickFlow != NULL) {
        newTickFlow->mUnk0xc8 = tickFlow->mUnk0xc8;
        newTickFlow->mUnk0xcc = tickFlow->mUnk0xcc;
        newTickFlow->mUnk0x110 = tickFlow->mUnk0x110;

        for (int i = 0; i < 0x10; i++) {
            newTickFlow->mUnk0xd0[i] = tickFlow->mUnk0xd0[i];
        }
    }

    return newTickFlow;
}

// removes the specified CTickFlow from the mPrev chain, replacing it with its parent / mPrev
void CProc::func_02013d6c(CTickFlow *target) {
    if (target == NULL) {
        return;
    }

    CTickFlow **current = &mTickFlowHead;
    while (*current != NULL) {
        if (*current == target) {
            CTickFlow *toDelete = *current;
            *current = (*current)->mPrev;
            delete toDelete;
            break;
        } else {
            current = &(*current)->mPrev;
        }
    }

}

// destroy all tickflow
void CProc::func_02013dcc(void) {
    if (mTickFlowHead != NULL) {
        CTickFlow *tickFlow = mTickFlowHead;
        while (tickFlow != NULL) {
            CTickFlow *prevTickFlow = tickFlow->mPrev;
            delete tickFlow;
            tickFlow = prevTickFlow;
        }
    }
    mTickFlowHead = NULL;
}

CTickFlow *CProc::func_02013e48(TickFlowCode *tickFlowCode) {
    func_02013dcc();

    if (tickFlowCode == NULL) {
        return;
    }

    CTickFlow *out = createTickFlow(NULL, tickFlowCode, 0);

    if (mTickFlowHead != NULL) {
        CTickFlow *tickFlow = mTickFlowHead;
        do {
            if (tickFlow->mUnk0xbc == 0) {
                tickFlow->mUnk0xbc = 10000;
            }
            tickFlow = tickFlow->mPrev;
        } while (tickFlow != NULL);
    }
    out->mUnk0xbc = 0;
    return out;
}

u32 CProc::tempoFromSpeed(s32 speed) {
    return FIXED_TO_INT(((speed * (60 * 60)) / 48) + INT_TO_FIXED(0.5));
}

// Finds a category/priority 0 TickFlow object (?)
CTickFlow *CProc::func_020144c8(void) {
    CTickFlow *temp = mTickFlowHead;
    while (temp != NULL) {
        if (temp->mUnk0xbc == 0) {
            return temp;
        } else {
            temp = temp->mPrev;
        }
    }
    return 0;
}


void CProc::func_020142ec(s32 arg0, s32 arg1) {
    NNS_SndArcStrmSetChannelPan(&mStrmHandle, arg0, arg1);
    mUnk0x50[arg0] = arg1;
}

void CProc::func_02014374(void) {
    if (mUnk0x6c == 0) {
        return;
    }
    
    mUnk0x74 += mGameSpeed;

    s32 tmp;
    if (mUnk0x78 <= FIXED_TO_INT(mUnk0x74)) {
        tmp = mUnk0x72;
        mUnk0x6c = 0;
    } else {
        tmp = mUnk0x70 + (FIXED_TO_INT(mUnk0x74) * (mUnk0x72 - mUnk0x70) / mUnk0x78);
    }

    if (tmp > 127) {
        tmp = 127;
    } else if (tmp < 0) {
        tmp = 0;
    }
    mVolume = tmp;
    
    func_0200c49c(mSndHandle, mVolume);
    NNS_SndArcStrmMoveVolume(&mStrmHandle, mVolume, 0);
}

// THIS MATCHES: objdiff bugs out
BOOL CProc::func_02014880(void) {
    if (mHaltedProcess) {
        return FALSE;
    }

    switch (mState) {
        case 0:
            func_02014980();
            break;
        case 1:
            func_020149a8();
            break;
        case 2:
            func_02014b4c();
            break;
        case 3:
            func_02014c8c();
            break;
    }

    if (mTickFlowHead == NULL) {
        return FALSE;
    }

    for (CTickFlow *tickFlow = mTickFlowHead; tickFlow != NULL; tickFlow = tickFlow->mPrev) {
        tickFlow->mUnk0xc0 = FALSE;
    }

    CTickFlow *nextTickFlow;
    BOOL temp_r9;

    do {
        mUnk0x68 = FALSE;
        temp_r9 = TRUE;
        CTickFlow *tickFlow = mTickFlowHead;
        while (tickFlow != NULL) {
            nextTickFlow = tickFlow->mPrev;
            if (func_02014ca4(tickFlow)) {
                if (tickFlow->mUnk0xbc == 0) {
                    return TRUE;
                }
                func_02013d6c(tickFlow);
            } else {
                temp_r9 = FALSE;
            }
            tickFlow = nextTickFlow;
        }
    } while (mUnk0x68 != FALSE);

    if (temp_r9) {
        return TRUE;
    } else {
        return FALSE;
    }
}

s32 CProc::gotoLabel(CTickFlow *tickFlow, u32 label) {
    u32 i;
    TickFlowCode *tickFlowCode = tickFlow->mCode;
    s32 offset = 0;

    for (i = 0; i < 0x10000; i++) {
        u32 cmd = (tickFlowCode[offset] & 0x3ff);
        u32 num_args = (tickFlowCode[offset] & 0x3c00) >> 10;
        u32 arg0 = (tickFlowCode[offset] >> 14);
        if ((cmd == 3) && (arg0 == label)) {
            return offset;
        }
        offset += num_args + 1;
    }
    OS_Panic("");
    return 0;
}

// goto lookup
u32 CProc::func_02014d8c(CTickFlow *tickFlow, u32 cmd_A, u32 arg0_A, u32 cmd_B, u32 arg0_B, u32 cmd_C, u32 arg0_C, u32 cmd_depth, volatile u32 cmd_undepth, u32 offset, BOOL arg10) {
    u32 i = 0;
    s32 depth = 0;
    
    do {
        u32 opInt = tickFlow->mCode[offset];
        u32 args = (opInt & 0x3c00) >> 10;
        u32 cmd = opInt & 0x3ff;
        u32 arg0 = opInt >> 14;
        if (depth == 0) {
            if ((cmd == cmd_A && arg0 == arg0_A) || (cmd == cmd_B && arg0 == arg0_B) || (cmd == cmd_C && arg0 == arg0_C)) {
                if (arg10) {
                    offset += (args + 1);
                }
                return offset;
            } else {
                if (cmd == cmd_depth) {
                    depth++;
                }
                i++;
                if (cmd == cmd_undepth) {
                    depth--;
                }
                offset += args + 1; 
            }
        }
    } while (i < 0x10000);

    // not found
    OS_Panic("");
    return 0;
}

BOOL CProc::handleProcCommands(u32 cmd, u32 arg0, u32 *args) {
    OS_Panic("");
    return FALSE;
}

void CProc::stackPush(CTickFlow *tickFlow) {
    tickFlow->mCondvarStack[tickFlow->mCondvarStackPos] = tickFlow->mCondvar;
    tickFlow->mCondvarStackPos++;
}

void CProc::stackPop(CTickFlow *tickFlow) {
    tickFlow->mCondvarStackPos--;
    tickFlow->mCondvar = tickFlow->mCondvarStack[tickFlow->mCondvarStackPos];
}

