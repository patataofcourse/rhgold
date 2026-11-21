#include "System/CProc.h"

// TODO: figure out compiler stuff: version, flags, etc
// TODO: unfuck the tmp vars
// TODO: fixed point lololol (look at << 8 and >> 8)
// TODO: there is probably more wrong shit
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
        case StoreList:
            tickFlow->mUnk0x110 = (TickFlowCode **)args[1];
            break;
        case Spawn:
            CTickFlow *newFlow = createTickFlow(tickFlow, (TickFlowCode *)args[1], tickFlow->mCurrentRest);
            newFlow->mUnk0xc0 = TRUE;
            mUnk0x68 = TRUE;
            mUnk0x80 = -1;
            break;
        case SpawnList:
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
        case UnkCmd0x2d:
            mUnk0x80 = arg0;
            break;
        case Rest:
            tickFlow->mCurrentRest += INT_TO_FIXED(arg0);
            break;
        case RestCondvar:
            tickFlow->mCurrentRest += INT_TO_FIXED(tickFlow->mCondvar);
            break;
        case 0x27:
            tickFlow->mCurrentRest += INT_TO_FIXED(func_02015c14(arg0)->effects);
            break;
        case CallFunc:
            ((void(*)(u32))(args[1]))(args[2]);
            break;
        case 4:
            tickFlow->mNextInstructionPos = gotoLabel(tickFlow, arg0);
            break;
        case 5:
            tickFlow->mCondvar = args[1];
            break;
        case 6:
            tickFlow->mCondvar += args[1];
            break;
        case 7:
            stackPush(tickFlow);
            break;
        case 8:
            stackPop(tickFlow);
            break;
        case 9:
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
        case 0xa:
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow, 11, 0, 11, 0, 11, 0, 9, 11, tickFlow->mNextInstructionPos, 1);
            break;
        case 0xc:
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow, 13, tickFlow->mCondvar, 15, 0, 16, 0, 12, 16, tickFlow->mNextInstructionPos, 1);
            break;
        case 0xe:
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow, 16, 0, 16, 0, 16, 0, 12, 16, tickFlow->mNextInstructionPos, 1);
            break;
        case 0x11:
            tickFlow->mExecCodeStack[tickFlow->mExecStackPos] = tickFlow->mCode;
            tickFlow->mExecInstPosStack[tickFlow->mExecStackPos] = tickFlow->mNextInstructionPos;
            tickFlow->mExecStackPos++;
            tickFlow->mCode = (TickFlowCode *)args[1];
            tickFlow->mNextInstructionPos = 0;
            break;
        case 0x24:
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
        case 0x12:
            tickFlow->mExecStackPos--;
            tickFlow->mCode = tickFlow->mExecCodeStack[tickFlow->mExecStackPos];
            tickFlow->mNextInstructionPos = tickFlow->mExecInstPosStack[tickFlow->mExecStackPos];
            break;
        case 0x13:
            return TRUE;
        case 0x14:
            tickFlow->mCondvar = func_02004d48(arg0);
            break;
        case 0x15:
            mHaltedProcess = TRUE;
            break;
        case 0x16:
            func_02013fbc(arg0);
            break;
        case 0x17:
            func_02014454(arg0);
            break;
        case 0x18: {
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
        case 0x28:
            func_02014454(INT_TO_FIXED(func_02015dd8(args[1], 48)) / arg0);
            break;
        case 0x19: {
            SndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
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
        case 0x1a: {
            SndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            func_02013fec(arg0);
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case 0x25: {
            s32 tmp2 = func_02013f80(150);
            SndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            func_0200c378(mSndHandle, arg0);
            func_02013fbc(FX_Whole(((INT_TO_FIXED(tmp2) / mSpeedSeq) * 150)));
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case 0x2f: {
            s32 tmp = func_02013f80(150);
            SndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
            s32 tmp3 = mUnk0x30;
            if (tmp3 <= 0) {
                tmp3 = 120;
            }
            func_0200c378(mSndHandle, func_02013f3c(arg0, tmp3));
            func_02013fbc(FX_Whole(((INT_TO_FIXED(tmp) / mSpeedSeq) * 150)));
            NNS_SndArcSetCurrent(arc);
            break;
        }
        case 0x1b:
            func_0201408c(arg0);
            break;
        case 0x1c:
            func_02013fbc(func_02015dd8(arg0, 48));
            break;
        case 0x2a:
            func_02014160(arg0);
            break;
        case 0x30:
            func_02014160(INT_TO_FIXED(arg0) / mGameSpeed);
            break;
        case 0x2b:
            func_020142ec(arg0, args[1]);
            break;
        case 0x2c:
            func_02014310(arg0, args[1]);
            break;
        case 0x1d:
            func_02014320(arg0);
            break;
        case 0x1e:
            func_02014408(arg0, args[1]);
            break;
        case 0x1f:
        case 0x20: {
            SndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);
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
        case 0x21: {
            SndArc *arc = NNS_SndArcSetCurrent(tickFlow->mUnk0xc8);

            func_020145f4(arg0, args[1], (s32)args[1] >> 16);

            NNS_SndArcSetCurrent(arc);
            break;
        }
        case 0x29:
            tickFlow->mCurrentRest -= INT_TO_FIXED(arg0);
            break;
        case 0x2e:
            func_02014620();
            break;
        
        // non-existent commands
        case 3:
        case 0xb:
        case 0xd:
        case 0xf:
        case 0x10:
            break;

        default:    
            return handleProcCommands(cmd, arg0, &args[1]);
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
    func_0202a55c(&mStrmHandle);
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
    func_0202a480(&mStrmHandle, 0);

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
    // does the 0x80 mean there's fixed point here too...?
    return FIXED_TO_INT(((speed * (60 * 60)) / 48) + INT_TO_FIXED(0.5));
}

// finds some tickflow going down the chain somehow?
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
    func_0202a540(&mStrmHandle);
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
    func_0202a4e0(&mStrmHandle, mVolume, 0);
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

