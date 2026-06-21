#include "System/CProc.h"

#include "unk_funcs.h"

// TODO: figure out compiler stuff: version, flags, etc
// TODO: unfuck the tmp vars
// TODO: fixed point lololol (look at << 8 and >> 8)
// TODO: there is probably more wrong shit
int CProc::handleCommands(CProcState *state) {
    mProcState = state;
    TickFlow *flow = state->mCurTickFlow;            
    u32 opInt = flow[state->mTickFlowPos];           
    u32 *args = &flow[state->mTickFlowPos]; 
    u32 num_args = (opInt & 0x3c00) >> 10;
    u32 cmd = opInt & 0x3ff;
    state->mTickFlowPos += num_args + 1;
    s32 arg0 = opInt >> 14;
    switch (cmd) {
        case StoreList:
            state->mUnk0x110 = (TickFlow**)args[1];
            break;
        case Spawn:
            CProcState *newFlow = createTickFlow(state, (TickFlow*)args[1], state->mRestVal);
            newFlow->mUnk0xc0 = 1;
            mUnk0x68 = 1;
            mUnk0x80 = -1;
            break;
        case SpawnList:
            if (state->mUnk0x110 == NULL) 
                OS_Panic("");
            
            if (state->mUnk0x110[arg0] != NULL) {
                CProcState *newFlow = createTickFlow(state, state->mUnk0x110[arg0], state->mRestVal);
                newFlow->mUnk0xc0 = 1;
                mUnk0x68 = 1;
            }
            mUnk0x80 = -1;
            
            break;
        case UnkCmd0x2d:
            mUnk0x80 = arg0;
            break;
        case Rest:
            // fixed point?
            state->mRestVal += arg0 << 8;
            break;
        case RestCondvar:
            // fixed point?
            state->mRestVal += state->mCondvar << 8;
            break;
        case 0x27:
            // fixed point?
            state->mRestVal += func_02015c14(arg0)->effects << 8;
            break;
        case CallFunc:
            ((void(*)(int))(args[1]))(args[2]);
            break;
        case 4:
            state->mTickFlowPos = gotoLabel(state, arg0);
            break;
        case 5:
            state->mCondvar = args[1];
            break;
        case 6:
            state->mCondvar += args[1];
            break;
        case 7:
            stackPush(state);
            break;
        case 8:
            stackPop(state);
            break;
        case 9:
            int condVar = state->mCondvar;
            int arg = args[1];
            bool is_true = false;
            switch (arg0) {
                case 0:
                    is_true = condVar == arg;
                    break;
                case 1:
                    is_true = condVar != arg;
                    break;
                case 2:
                    is_true = condVar < arg;
                    break;
                case 3:
                    is_true = condVar <= arg;
                    break;
                case 4:
                    is_true = condVar > arg;
                    break;
                case 5:
                    is_true = condVar >= arg;
                    break;
            }

            if (is_true) break;

            // goto to the next else/end?
            state->mTickFlowPos = func_02014d8c(state, 10, 0, 11, 0, 11, 0, 9, 11, state->mTickFlowPos, 1);
            break;
        case 0xa:
            state->mTickFlowPos = func_02014d8c(state, 11, 0, 11, 0, 11, 0, 9, 11, state->mTickFlowPos, 1);
            break;
        case 0xc:
            state->mTickFlowPos = func_02014d8c(state, 13, state->mCondvar, 15, 0, 16, 0, 12, 16, state->mTickFlowPos, 1);
            break;
        case 0xe:
            state->mTickFlowPos = func_02014d8c(state, 16, 0, 16, 0, 16, 0, 12, 16, state->mTickFlowPos, 1);
            break;
        case 0x11:
            state->mCallStackPtrs[state->mCallDepth] = state->mCurTickFlow;
            state->mCallStackPos[state->mCallDepth] = state->mTickFlowPos;
            state->mCallDepth++;
            state->mCurTickFlow = (TickFlow*)args[1];
            state->mTickFlowPos = 0;
            break;
        case 0x24:
            if (state->mUnk0x110 == NULL) OS_Panic("");
            if (state->mUnk0x110[arg0] == NULL) break;

            state->mCallStackPtrs[state->mCallDepth] = state->mCurTickFlow;
            state->mCallStackPos[state->mCallDepth] = state->mTickFlowPos;
            state->mCallDepth++;
            state->mCurTickFlow = state->mUnk0x110[arg0];
            state->mTickFlowPos = 0;
            break;
        case 0x12:
            int depth = state->mCallDepth--;
            state->mCurTickFlow = state->mCallStackPtrs[state->mCallDepth];
            state->mTickFlowPos = state->mCallStackPos[state->mCallDepth];
            break;
        case 0x13:
            return 1;
        case 0x14:
            state->mCondvar = func_02004d48(arg0);
            break;
        case 0x15:
            mHaltedProcess = 1;
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
            if (tmp4 >= tmp >> 8) {
                tmp4 = args[2];
                tmp = func_020144c0() * args[1];
                if (tmp4 <= tmp >> 8) {
                    tmp4 = (func_020144c0() * (s32)args[1]) >> 8;
                }
            }
            func_02014454(tmp4);
            break;
        }
        case 0x28:
            func_02014454((func_02015dd8(args[1], 48) << 8) / arg0);
            break;
        case 0x19: {
            SndArc* tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);
            switch(arg0) {
                case 0:
                    func_0200c648(args[1], state->mUnk0xcc);
                    break;
                case 1:
                    func_0200c654(args[1], state->mUnk0xcc);
                    break;
                case 2:
                    func_0200c660(args[1], state->mUnk0xcc);
                    break;
                case 3:
                    func_0200c66c(args[1], state->mUnk0xcc);
                    break;
            }
            NNS_SndArcSetCurrent(tmp);
            break;
        }
        case 0x1a: {
            SndArc* tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);
            func_02013fec(arg0);
            NNS_SndArcSetCurrent(tmp);
            break;
        }
        case 0x25: {
            s32 tmp2 = func_02013f80(150);
            SndArc* tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);
            func_0200c378(mSndHandle, arg0);
            func_02013fbc((((tmp2 << 8) / mSpeedSeq) * 150) >> 0xc);
            NNS_SndArcSetCurrent(tmp);
            break;
        }
        case 0x2f: {
            s32 tmp = func_02013f80(150);
            SndArc* tmp2 = NNS_SndArcSetCurrent(state->mUnk0xc8);
            s32 tmp3 = mUnk0x30;
            if (tmp3 <= 0)
                tmp3 = 120;
            func_0200c378(mSndHandle, func_02013f3c(arg0, tmp3));
            func_02013fbc((((tmp << 8) / mSpeedSeq) * 150) >> 0xc);
            NNS_SndArcSetCurrent(tmp2);
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
            func_02014160((arg0 << 8)/mGameSpeed);
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
            SndArc* tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);
            u32 a0 = (u32)arg0 / 128;
            u32 a2 = arg0 & 0x7f;
            u32 a1 = args[1] & 0xffff;
            s32 a3 = (s32)args[1] >> 16;
            if (cmd == 0x1f) {
                func_02014520(a0, a1, a2, a3);
            } else {
                func_02014588(args[2], a0, a1, a2, a3);
            }
            NNS_SndArcSetCurrent(tmp);
            break;
        }
        case 0x21: {
            SndArc* tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);

            func_020145f4(arg0, args[1], (s32)args[1] >> 16);

            NNS_SndArcSetCurrent(tmp);
            break;
        }
        case 0x29:
            state->mRestVal -= arg0 << 8;
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
    return 0;
}

CProc::CProc(int tfID) {
    mTickFlowId = tfID;
    mVBlankCount = func_020014e0();
    mUnk0x88 = NULL;
    mUnk0x8c = 0;
    mProcState = NULL;
    mSndHandle = func_0200c198();
    mCurrentSndHandle = 0;
    func_0202a55c(&mStrmHandle);
    init();
}

CProc::~CProc(void) {
    CProcState *state = mLastProcState;
    while (state != NULL) {
        CProcState *lastState = state->mPrev;
        delete state;
        state = lastState;
    }
    func_0200c1c0(mSndHandle);
    func_0202a480(&mStrmHandle, 0);

}

int CProc::func_02013b08(int arg0) {
    if (func_02014880(arg0) != 0) {
        return 1;
    }
    
    if (mGameSpeed1 != 0) {
        mTempo = tempoFromSpeed(mGameSpeed1);
    }

    if (update() != 0) {
        return 1;
    }

    func_02014374();
    return 0;
}

int CProc::update(void) {
    return 1;
}

void CProc::init(void) {
    mLastProcState = NULL;
    mHaltedProcess = 0;
    mGameSpeed1 = 0;
    mGameSpeed = 0;
    mState = 0;
    mTempo = mSpeedStrm = 120;
    mVolume = 0x7f;
    mUnk0x6c = 0;
    mUnk0x54 = 0;
    mCurrentStrmId = -1;
    mSpeedSeq = 0x100; // 100%?
    mTickFlowIndex = 1;
    mUnk0x80 = -1;
}

bool CProc::findTickFlowIndex(int index) {
    CProcState *temp = mLastProcState;
    while (temp != NULL) {
        if (temp->mTickFlowIndex == index)
            return true;
        else
            temp = temp->mPrev;
    }
    return false;
}

CProcState *CProc::createTickFlow(CProcState *state, TickFlow *entry, u32 initRest) {
    CProcState *newState = new CProcState();

    if (state == NULL) {
        state = func_020144c8();
    }

    newState->mCurTickFlow = entry;
    newState->mTickFlowPos = 0;
    newState->mRestVal = initRest;
    newState->mUnk0xb8 = 0;
    newState->mCondvar = 0;
    newState->mStackPos = 0;
    newState->mCallDepth = 0;
    newState->mUnk0xbc = 30000;

    if (state != NULL) {
        if (mUnk0x80 > 0) {
            newState->mUnk0xbc = mUnk0x80;
        } else if (state->mUnk0xbc != 0) {
            newState->mUnk0xbc = state->mUnk0xbc + 1;
        }
    }

    mUnk0x80 = -1;
    newState->mUnk0xc0 = 0;
    newState->mUnk0xc8 = 0;
    newState->mUnk0xcc = 0;
    newState->mPrev = mLastProcState;
    mLastProcState = newState;

    for (int i = 0; i < 0x10; i++) {
        newState->mUnk0xd0[i] = 0;
    }

    newState->mUnk0x110 = NULL;
    newState->mTickFlowIndex = mTickFlowIndex;

    do {
        mTickFlowIndex += 1;
        if (mTickFlowIndex == 0) {
            mTickFlowIndex = 1;
        }
    } while (findTickFlowIndex(mTickFlowIndex));

    if (state != NULL) {
        newState->mUnk0xc8 = state->mUnk0xc8;
        newState->mUnk0xcc = state->mUnk0xcc;
        newState->mUnk0x110 = state->mUnk0x110;

        for (int i = 0; i < 0x10; i++) {
            newState->mUnk0xd0[i] = state->mUnk0xd0[i];
        }
    }

    return newState;
}

// removes the specified CProcState from the mPrev chain, replacing it with its parent / mPrev
void CProc::func_02013d6c(CProcState *target) {
    if (target == NULL) {
        return;
    }

    CProcState **current = &mLastProcState;
    while (*current != NULL) {
        if (*current == target) {
            CProcState *toDelete = *current;
            *current = (*current)->mPrev;
            delete(toDelete);
            break;
        } else {
            current = &(*current)->mPrev;
        }
    }

}

// clean up entire LastProcState tree
void CProc::func_02013dcc(TickFlow *arg0) {
    if (mLastProcState != NULL) {
        CProcState *state = mLastProcState;
        while (state != NULL) {
            CProcState *prevState = state->mPrev;
            delete state;
            state = prevState;
        }
    }
    mLastProcState = NULL;
}

CProcState *CProc::func_02013e48(TickFlow *arg0) {
    func_02013dcc(arg0);

    if (arg0 == NULL) {
        return;
    }

    CProcState *out = createTickFlow(0, arg0, 0);

    if (mLastProcState != NULL) {
        CProcState *curState = mLastProcState;
        do {
            if (curState->mUnk0xbc == 0) {
                curState->mUnk0xbc = 10000;
            }
            curState = curState->mPrev;
        } while (curState != 0);
    }
    out->mUnk0xbc = 0;
    return out;
}

u32 CProc::tempoFromSpeed(s32 speed) {
    // does the 0x80 mean there's fixed point here too...?
    return (speed * 3600 / 48 + 0x80) >> 8;
}

// finds some proc state going down the chain somehow?
CProcState *CProc::func_020144c8(void) {
    CProcState *temp = mLastProcState;
    while (temp != NULL) {
        if (temp->mUnk0xbc == 0)
            return temp;
        else
            temp = temp->mPrev;
    }
    return 0;
}


void CProc::func_020142ec(int arg0, int arg1) {
    func_0202a540(&mStrmHandle);
    mUnk0x50[arg0] = arg1;
}

void CProc::func_02014374() {
    if (mUnk0x6c == 0) return;
    
    mUnk0x74 += mGameSpeed;

    s32 tmp;
    if (mUnk0x78 <= (mUnk0x74 >> 8)) {
        tmp = mUnk0x72;
        mUnk0x6c = 0;
    } else {
        tmp = mUnk0x70 + ((mUnk0x74 >> 8) * (mUnk0x72 - mUnk0x70) / mUnk0x78);
    }

    if (tmp > 0x7f) {
        tmp = 0x7f;
    } else if (tmp < 0) {
        tmp = 0;
    }
    mVolume = tmp;
    
    func_0200c49c(mSndHandle, mVolume);
    func_0202a4e0(&mStrmHandle, mVolume, 0);
}

// THIS MATCHES: objdiff bugs out
int CProc::func_02014880(int) {
    if (mHaltedProcess)
        return 0;

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

    if (mLastProcState == NULL) {
        return 0;
    }

    for (CProcState *state = mLastProcState; state != NULL; state = state->mPrev) {
        state->mUnk0xc0 = 0;
    }

    CProcState *nextState;
    int temp_r9;
    do {
        mUnk0x68 = 0;
        temp_r9 = 1;
        CProcState *state = mLastProcState;
        while (state != NULL) {
            nextState = state->mPrev;
            if (func_02014ca4(state) != 0) {
                if (state->mUnk0xbc == 0)
                    return 1;
                func_02013d6c(state);
            } else {
                temp_r9 = 0;
            }
            state = nextState;
        }
    } while (mUnk0x68 != 0);

    if (temp_r9) {
        return 1;
    } else {
        return 0;
    }
}

int CProc::gotoLabel(CProcState *state, u32 label) {
    u32 i;
    u32 *tickFlow = (u32*)state->mCurTickFlow;
    int offset = 0;

    for (i = 0; i < 0x10000; i++) {
        u32 cmd = (tickFlow[offset] & 0x3ff);
        u32 num_args = (tickFlow[offset] & 0x3c00) >> 10;
        u32 arg0 = (tickFlow[offset] >> 14);
        if (cmd == 3 && arg0 == label) {
            return offset;
        }
        offset += num_args + 1;
    }
    OS_Panic("");
    return 0;
}

// goto lookup
int CProc::func_02014d8c(CProcState *state, int cmd_A, int arg0_A, int cmd_B, int arg0_B, int cmd_C, int arg0_C, int cmd_depth, volatile int cmd_undepth, int offset, int arg10) {
    u32 i = 0;
    int depth = 0;
    
    do {
        u32 opInt = state->mCurTickFlow[offset];
        u32 args = (opInt & 0x3c00) >> 10;
        u32 cmd = opInt & 0x3ff;
        u32 arg0 = opInt >> 14;
        if (depth == 0) {
            if ((cmd == cmd_A && arg0 == arg0_A) || (cmd == cmd_B && arg0 == arg0_B) || (cmd == cmd_C && arg0 == arg0_C)) {
                if (arg10 != 0) {
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

int CProc::handleProcCommands(u32 cmd, u32 arg0, u32 *args) {
    OS_Panic("");
    return 0;
}

void CProc::stackPush(CProcState *state) {
    state->mStack[state->mStackPos] = state->mCondvar;
    state->mStackPos += 1;
}

void CProc::stackPop(CProcState *state) {
    state->mStackPos -= 1;
    state->mCondvar = state->mStack[state->mStackPos];
}

