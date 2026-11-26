#include "Main/CProc.h"

#define BYTECODE_GET_OPCODE(instruction) (((u32)(instruction) >> 0) & 0x3FF)
#define BYTECODE_GET_ARGC(instruction)   (((u32)(instruction) & 0x3C00) >> 10)
#define BYTECODE_GET_ARG0(instruction)   (((u32)(instruction) >> 14))

BOOL CProc::handleCommands(CTickFlow *tickFlow) {
    mTickFlowCurProc = tickFlow;

    TickFlowCode *code = tickFlow->mCode;
    const s32 *args = (const s32 *)&code[tickFlow->mNextInstructionPos];
    u32 cmd = BYTECODE_GET_OPCODE(code[tickFlow->mNextInstructionPos]);
    u32 argc = BYTECODE_GET_ARGC(code[tickFlow->mNextInstructionPos]);
    u32 arg0 = BYTECODE_GET_ARG0(code[tickFlow->mNextInstructionPos]);

    tickFlow->mNextInstructionPos += argc + 1;

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
                tickFlow->mNextInstructionPos = func_02014d8c(tickFlow,
                    TF_00A, 0,
                    TF_00B, 0,
                    TF_00B, 0,
                    TF_009, TF_00B,
                    tickFlow->mNextInstructionPos, TRUE);
            }
            break;
        }
        case TF_00A: {
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow,
                TF_00B, 0,
                TF_00B, 0,
                TF_00B, 0,
                TF_009, TF_00B,
                tickFlow->mNextInstructionPos, TRUE);
            break;
        }
        case TF_00C: {
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow,
                TF_00D, tickFlow->mCondvar,
                TF_00F, 0,
                TF_010, 0,
                TF_00C, TF_010,
                tickFlow->mNextInstructionPos, TRUE);
            break;
        }
        case TF_00E: {
            tickFlow->mNextInstructionPos = func_02014d8c(tickFlow,
                TF_010, 0,
                TF_010, 0,
                TF_010, 0,
                TF_00C, TF_010,
                tickFlow->mNextInstructionPos, TRUE);
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
            mExecPaused = TRUE;
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
            return handleCommands(cmd, arg0, &args[1]);
        }
    };
    return FALSE;
}

CProc::CProc(s32 tfID) {
    mTickFlowId = tfID;
    mVBlankCount = func_020014e0();
    mNext = NULL;
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
        CTickFlow *lastTickFlow = tickFlow->mNext;
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
        mTempo = getTempoFromTicksPerFrame(mGameSpeed1);
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
    mExecPaused = FALSE;
    mGameSpeed1 = 0;
    mGameSpeed = 0;
    mCurrentBGMType = eProcBGMType_0;
    mTempo = mSpeedStrm = 120;
    mVolume = 127;
    mUnk0x6c = FALSE;
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
            temp = temp->mNext;
        }
    }
    return false;
}

CTickFlow *CProc::createTickFlow(CTickFlow *tickFlow, TickFlowCode *tickFlowCode, s32 initRest) {
    CTickFlow *newTickFlow = new CTickFlow;

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
    newTickFlow->mUnk0xbc = TICKFLOW_CATEGORY_DEFAULT;

    if (tickFlow != NULL) {
        if (mUnk0x80 > 0) {
            newTickFlow->mUnk0xbc = mUnk0x80;
        } else if (tickFlow->mUnk0xbc != TICKFLOW_CATEGORY_ROOT) {
            newTickFlow->mUnk0xbc = tickFlow->mUnk0xbc + 1;
        }
    }

    mUnk0x80 = -1;
    newTickFlow->mUnk0xc0 = FALSE;
    newTickFlow->mUnk0xc8 = NULL;
    newTickFlow->mUnk0xcc = NULL;
    newTickFlow->mNext = mTickFlowHead;
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

s32 CProc::func_02013d2c(s32 index, TickFlowCode *code, s32 initRest) {
    return createTickFlow((index != 0) ? func_020144f4(index) : func_020144c8(), code, initRest)->mTickFlowIndex;
}

// Destroy the target CTickFlow
void CProc::func_02013d6c(CTickFlow *target) {
    if (target == NULL) {
        return;
    }

    CTickFlow **current = &mTickFlowHead;
    while (*current != NULL) {
        if (*current == target) {
            CTickFlow *toDelete = *current;
            *current = (*current)->mNext;
            delete toDelete;
            break;
        } else {
            current = &(*current)->mNext;
        }
    }
}

void CProc::func_02013db0(s32 index) {
    func_02013d6c(func_020144f4(index));
}

// Destroy all CTickFlow instances
void CProc::func_02013dcc(void) {
    if (mTickFlowHead != NULL) {
        CTickFlow *tickFlow = mTickFlowHead;
        while (tickFlow != NULL) {
            CTickFlow *nextTickFlow = tickFlow->mNext;
            delete tickFlow;
            tickFlow = nextTickFlow;
        }
    }
    mTickFlowHead = NULL;
}

void CProc::func_02013e00(s32 category) {
    if (category < 0) {
        OS_Panic("");
    }

    CTickFlow *current, *next;
    for (current = mTickFlowHead; current != NULL; current = next) {
        next = current->mNext;
        if (current->mUnk0xbc > category) {
            func_02013d6c(current);
        }
    }
}

CTickFlow *CProc::func_02013e48(TickFlowCode *tickFlowCode) {
    func_02013dcc();

    if (tickFlowCode == NULL) {
        return;
    }

    CTickFlow *tickFlow = createTickFlow(NULL, tickFlowCode, 0);

    for (CTickFlow *current = mTickFlowHead; current != NULL; current = current->mNext) {
        if (current->mUnk0xbc == TICKFLOW_CATEGORY_ROOT) {
            current->mUnk0xbc = TICKFLOW_CATEGORY_PREV_ROOT;
        }
    }
    tickFlow->mUnk0xbc = TICKFLOW_CATEGORY_ROOT;
    return tickFlow;
}

void CProc::func_02013eac(TickFlowCode *code) {
    CTickFlow *current, *root;

    current = mTickFlowHead;
    root = NULL;
    while (current != NULL) {
        if (current->mUnk0xbc == TICKFLOW_CATEGORY_ROOT) {
            root = current;
            break;
        }
        current = current->mNext;
    }
    if (root == NULL) {
        return;
    }
    
    root->mCode = code;
    root->mNextInstructionPos = 0;
    root->mCurrentRest = INT_TO_FIXED(0.0);
    root->mUnk0xb8 = 0;
    root->mCondvar = 0;
    root->mCondvarStackPos = 0;
    root->mExecStackPos = 0;
}

void CProc::func_02013f04(BOOL paused) {
    mExecPaused = paused;
}

BOOL CProc::func_02013f0c(void) {
    return mExecPaused;
}

s32 CProc::func_02013f14(s32 tempo) {
    return (INT_TO_FIXED_1(tempo * 48)) / (60 * 60);
}

s32 CProc::func_02013f3c(s32 arg0, s32 arg1) {
    return (arg0 * (60 * 60)) / (arg1 * 48);
}

u32 CProc::getTempoFromTicksPerFrame(s32 ticksPerFrame) {
    return FIXED_TO_INT(((ticksPerFrame * (60 * 60)) / 48) + INT_TO_FIXED(0.5));
}

s32 CProc::func_02013f80(s32 tempo) {
    return TOFX32(mGameSpeed1) / func_02013f14(tempo);
}

s32 CProc::func_02013fa0(s32 tempo) {
    return TOFX32(func_02013f14(tempo)) / mGameSpeed1;
}

void CProc::func_02013fbc(u16 tempo) {
    mCurrentBGMType = eProcBGMType_0;
    mSpeedStrm = tempo;
    mGameSpeed = func_02013f14(FIXED_TO_INT(mSpeedStrm * mSpeedSeq));
}

void CProc::func_02013fec(s32 seqNo) {

}

void CProc::func_02014074(u32 track, s32 volume) {
    mTrackBitMask = track;
    mTrackVolume = volume;
    func_0200c4a8(mSndHandle, track, volume);
}

void CProc::func_0201408c(s32 strmNo) {

}

void CProc::func_02014160(s32 fadeSpeed) {

}

BOOL CProc::func_020141ac(void) {

}

void CProc::func_020141f4(void) {

}

void CProc::func_02014258(void) {

}

void CProc::func_02014290(void) {

}

void CProc::func_020142ec(s32 arg0, s32 arg1) {
    NNS_SndArcStrmSetChannelPan(&mStrmHandle, arg0, arg1);
    mUnk0x50[arg0] = arg1;
}

void CProc::func_02014310(s32 channel, s32 volume) {
    NNS_SndArcStrmSetChannelVolume(&mStrmHandle, channel, volume);
}

void CProc::func_02014320(s32 volume) {

}

s32 CProc::func_02014354(BOOL notFading) {
    if (mUnk0x6c && !notFading) {
        return mUnk0x72;
    }
    return mVolume;
}

void CProc::func_02014374(void) {
    if (mUnk0x6c == FALSE) {
        return;
    }
    
    mUnk0x74 += mGameSpeed;

    s32 tmp;
    if (mUnk0x78 <= FIXED_TO_INT(mUnk0x74)) {
        tmp = mUnk0x72;
        mUnk0x6c = FALSE;
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

void CProc::func_02014408(s32 volume, s32 time) {

}

void CProc::func_02014454(s32 speed) {

}

s32 CProc::func_020144c0(void) {
    return mSpeedSeq;
}

CTickFlow *CProc::func_020144c8(void) {
    CTickFlow *current = mTickFlowHead;
    while (current != NULL) {
        if (current->mUnk0xbc == TICKFLOW_CATEGORY_ROOT) {
            return current;
        }
        current = current->mNext;
    }
    return NULL;
}

CTickFlow *CProc::func_020144f4(s32 index) {
    for (CTickFlow *current = mTickFlowHead; current != NULL; current = current->mNext) {
        if (current->mTickFlowIndex == index) {
            return current;
        }
    }
    return NULL;
}

void CProc::func_02014520(s32 seqArc, s32 seqNo, s32 volume, s32 pitch) {

}

void CProc::func_02014554(void *handle, s32 seqArc, s32 seqNo, s32 volume, s32 pitch) {

}

void CProc::func_02014588(s32 player, s32 seqArc, s32 seqNo, s32 volume, s32 pitch) {

}

void CProc::func_020145bc(void *handle, s32 player, s32 seqArc, s32 seqNo, s32 volume, s32 pitch) {

}

void CProc::func_020145f4(s32 seqArc, u16 seqNo, s32 fadeFrame) {

}

void CProc::func_0201460c(void *handle, s32 fadeFrame) {

}

void CProc::func_02014620(void) {

}


// Proc Manager
CProcMan::CProcMan(void) {
    mProcCount = 0;
    mProcHead = NULL;
}

CProcMan::~CProcMan(void) {
    CProc *current, *next;

    current = mProcHead;
    while (current != NULL) {
        next = current->getNext();
        delete current;
        current = next;
    }
}

void CProcMan::func_0201473c(void) {
    CProc *current, *next, *t;

    current = mProcHead;
    t = NULL;
    while (current != NULL) {
        next = current->getNext();
        if (current->func_02013b08() == TRUE) {
            if (t != NULL) {
                t->setNext(next);
            } else {
                mProcHead = next;
            }
            delete current;
        } else {
            t = current;
        }
        current = next;
    }
}

s32 CProcMan::func_020147a4(CProc *proc) {
    CProc *current, *next;

    if (mProcHead != NULL) {
        current = mProcHead;
        for (next = current->getNext(); next != NULL; next = next->getNext()) {
            current = next;
        }
        current->setNext(proc);
    } else {
        mProcHead = proc;
    }
    proc->setIndex(mProcCount);
    mProcCount++;
    return proc->getIndex();
}

BOOL CProcMan::func_020147f4(s32 index) {
    CProc *current, *next, *t;
    s32 currentIndex;

    current = mProcHead;
    t = NULL;
    while (current != NULL) {
        next = current->getNext();
        
        currentIndex = current->getIndex();
        if (currentIndex == index) {
            if (t != NULL) {
                t->setNext(next);
            } else {
                mProcHead = next;
            }
            delete current;
            return FALSE;
        }
        
        t = current;
        current = next;
    }
    return TRUE;
}

void CProcMan::_08(void) {
    func_0201473c();
}

s32 CProcMan::_0C(CProc *proc) {
    return func_020147a4(proc);
}

BOOL CProcMan::_10(s32 index) {
    return func_020147f4(index);
}


// THIS MATCHES: objdiff bugs out
BOOL CProc::func_02014880(void) {
    if (mExecPaused) {
        return FALSE;
    }

    switch (mCurrentBGMType) {
        case eProcBGMType_0:
            func_02014980();
            break;
        case eProcBGMType_1:
            func_020149a8();
            break;
        case eProcBGMType_2:
            func_02014b4c();
            break;
        case eProcBGMType_3:
            func_02014c8c();
            break;
    }

    if (mTickFlowHead == NULL) {
        return FALSE;
    }

    for (CTickFlow *tickFlow = mTickFlowHead; tickFlow != NULL; tickFlow = tickFlow->mNext) {
        tickFlow->mUnk0xc0 = FALSE;
    }

    CTickFlow *nextTickFlow;
    BOOL temp_r9;

    do {
        mUnk0x68 = FALSE;
        temp_r9 = TRUE;
        CTickFlow *tickFlow = mTickFlowHead;
        while (tickFlow != NULL) {
            nextTickFlow = tickFlow->mNext;
            if (func_02014ca4(tickFlow)) {
                if (tickFlow->mUnk0xbc == TICKFLOW_CATEGORY_ROOT) {
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

void CProc::func_02014980(void) {

}

void CProc::func_020149a8(void) {

}

void CProc::func_02014b4c(void) {

}

void CProc::func_02014c8c(void) {

}

BOOL CProc::func_02014ca4(CTickFlow *tickFlow) {

}

s32 CProc::gotoLabel(CTickFlow *tickFlow, u32 label) {
    u32 i;
    TickFlowCode *code = tickFlow->mCode;
    s32 offset = 0;

    for (i = 0; i < 0x10000; i++) {
        u32 op = BYTECODE_GET_OPCODE(code[offset]);
        u32 argc = BYTECODE_GET_ARGC(code[offset]);
        u32 arg0 = BYTECODE_GET_ARG0(code[offset]);
        if ((op == TF_003) && (arg0 == label)) {
            return offset;
        }
        offset += argc + 1;
    }
    OS_Panic("");
    return 0;
}

u32 CProc::func_02014d8c(CTickFlow *tickFlow,
        u32 elseOp, u32 elseArg0,
        u32 defaultOp, u32 defaultArg0,
        u32 endOp, u32 endArg0,
        u32 beginNestedBlockOp, u32 endNestedBlockOp,
        u32 instrOffs, BOOL skipOneInstr) {
    u32 op;
    u32 argc;
    u32 arg0;
    u32 i;
    s32 nestDepth = 0;
    
    for (i = 0; i < 0x10000; i++) {
        // u32 op, argc, arg0;
        op   = BYTECODE_GET_OPCODE(tickFlow->mCode[instrOffs]);
        argc = BYTECODE_GET_ARGC(tickFlow->mCode[instrOffs]);
        arg0 = BYTECODE_GET_ARG0(tickFlow->mCode[instrOffs]);

        if ((nestDepth == 0) && (
            (op == elseOp && arg0 == elseArg0) || 
            (op == defaultOp && arg0 == defaultArg0) || 
            (op == endOp && arg0 == endArg0))) {
            if (skipOneInstr) {
                instrOffs += 1 + argc;
            }
            return instrOffs;
        } else {
            if (op == beginNestedBlockOp) {
                nestDepth++;
            }
            if (op == endNestedBlockOp) {
                nestDepth--;
            }
            instrOffs += 1 + argc;
        }
    }

    // not found
    OS_Panic("");
    return 0;
}

BOOL CProc::handleCommands(u32 opcode, u32 arg0, const s32 *args) {
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

void CProc::func_02014e9c(u32 condvar) {
    CTickFlow *tickFlow = mTickFlowCurProc;
    
    if (tickFlow == NULL) {
        tickFlow = func_020144c8();
    }
    if (tickFlow != NULL) {
        tickFlow->mCondvar = condvar;
    }
}

void CProc::func_02014ec4(NNSSndArc *arc, void *heap) {
    CTickFlow *tickFlow = func_020144c8();

    if (tickFlow != NULL) {
        tickFlow->mUnk0xc8 = arc;
        tickFlow->mUnk0xcc = heap;
    }
}

void CProc::func_02014ee4(s32 index, s32 value) {
    mTickFlowCurProc->mUnk0xd0[index] = value;
}

s32 CProc::func_02014ef4(s32 index) {
    return mTickFlowCurProc->mUnk0xd0[index];
}

void CProc::func_02014f04(s32 index, s32 value) {
    CTickFlow *temp = mTickFlowCurProc;

    mTickFlowCurProc = func_020144c8();
    func_02014ee4(index, value);
    
    mTickFlowCurProc = temp;
}
