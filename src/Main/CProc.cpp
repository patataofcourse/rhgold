#include "System/CProc.h"

#include "unk_funcs.h"

// TODO: figure out compiler stuff: version, flags, etc
// TODO: unfuck the tmp vars
// TODO: fixed point lololol (look at << 8 and >> 8)
// TODO: there is probably more wrong shit
int CProc::handleCommands(CProcState *state) {
    mProcState = state;
    u32 opInt = state->mCurTickFlow[state->mTickFlowPos];
    int* args = &state->mCurTickFlow[state->mTickFlowPos]; // offset by 1
    u32 num_args = (opInt & 0x3c00) >> 10;
    state->mTickFlowPos += num_args + 1;
    u32 cmd = opInt & 0x3ff;
    s32 arg0 = opInt >> 14;
    switch (cmd) {
        case StoreList:
            state->mUnk0x110 = (int**)args[1];
            break;
        case Spawn:
            CProcState* newFlow = createTickFlow(state, (int*)args[1], state->mRestVal);
            newFlow->mUnk0xc0 = 1;
            mUnk0x68 = 1;
            mUnk0x80 = -1;
            break;
        case SpawnList:
            if (state->mUnk0x110 == NULL) 
                OS_Panic("");
            
            if (state->mUnk0x110[arg0] != NULL) {
                CProcState* newFlow = createTickFlow(state, state->mUnk0x110[arg0], state->mRestVal);
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
            state->mTickFlowPos = func_02014d34(state, arg0);
            break;
        case 5:
            state->mCondvar = args[1];
            break;
        case 6:
            state->mCondvar += args[1];
            break;
        case 7:
            func_02014e5c(state);
            break;
        case 8:
            func_02014e7c(state);
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
            state->mStackPtrs[state->mUnk0x54] = state->mCurTickFlow;
            state->mStackPos[state->mUnk0x54] = state->mTickFlowPos;
            state->mUnk0x54++;
            state->mCurTickFlow = (int*)args[1];
            state->mTickFlowPos = 0;
            break;
        case 0x24:
            if (state->mUnk0x110 == NULL) OS_Panic("");
            if (state->mUnk0x110[arg0] == NULL) break;

            state->mStackPtrs[state->mUnk0x54] = state->mCurTickFlow;
            state->mStackPos[state->mUnk0x54] = state->mTickFlowPos;
            state->mUnk0x54++;
            state->mCurTickFlow = state->mUnk0x110[arg0];
            state->mTickFlowPos = 0;
            break;
        case 0x12:
            int unk0x54 = state->mUnk0x54--;
            state->mCurTickFlow = state->mStackPtrs[state->mUnk0x54];
            state->mTickFlowPos = state->mStackPos[state->mUnk0x54 * 2];
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
        case 0x18:
            s32 tmp4 = args[3];
            s32 tmp = func_020144c0() * args[1];
            if (tmp4 >= tmp >> 8) {
                tmp4 = args[2];
                tmp = func_020144c0() * args[1];
                if (tmp4 <= tmp >> 8) {
                    tmp4 = (func_020144c0() * args[1]) >> 8;
                }
            }
            func_02014454(tmp4);
            break;
        case 0x28:
            func_02014454((func_02015dd8(mTickFlowId, 48) << 8) / arg0);
            break;
        case 0x19:
            tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);
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
        case 0x1a:
            tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);
            func_02013fec(arg0);
            NNS_SndArcSetCurrent(tmp);
            break;
        case 0x25:
            s32 tmp2 = func_02013f80(150);
            tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);
            func_0200c378(mSndHandle, arg0);
            func_02013fbc((((tmp2 << 8) / mSpeedSeq) * 150) >> 0xc);
            NNS_SndArcSetCurrent(tmp);
            break;
        case 0x2f:
            tmp = func_02013f80(150);
            tmp2 = NNS_SndArcSetCurrent(state->mUnk0xc8);
            s32 tmp3 = mUnk0x30;
            if (tmp3 <= 0)
                tmp3 = 120;
            func_0200c378(mSndHandle, func_02013f3c(arg0, tmp3));
            func_02013fbc((((tmp << 8) / mSpeedSeq) * 150) >> 0xc);
            NNS_SndArcSetCurrent(tmp2);
            break;
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
        case 0x20:
            tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);

            u32 tmp10 = (u32) arg0 >> 7;
            u8 tmp12 = arg0 & 0x7f;
            u16 tmp11 = args[1];
            int tmp13 = args[1] >> 16;
            if (cmd == 0x1f) {
                func_02014520(tmp10, tmp11, tmp12, tmp13);
            } else {
                func_02014588(args[2], tmp10, tmp11, tmp12, tmp13);
            }
            NNS_SndArcSetCurrent(tmp);
            break;
        case 0x21:
            tmp = NNS_SndArcSetCurrent(state->mUnk0xc8);

            func_020145f4(arg0, args[1], args[1] >> 16);

            NNS_SndArcSetCurrent(tmp);
            break;
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

int CProc::func_02013b08(void) {
    if (func_02014880() != 0) {
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
    CProcState* temp = mLastProcState;
    while (temp != NULL) {
        if (temp->mTickFlowIndex == index)
            return true;
        else
            temp = temp->mPrev;
    }
    return false;
}

CProcState *CProc::createTickFlow(CProcState *state, int *entry, u32 initRest) {
    CProcState* newState = new CProcState();

    if (state == NULL) {
        state = func_020144c8();
    }

    newState->mCurTickFlow = entry;
    newState->mTickFlowPos = 0;
    newState->mRestVal = initRest;
    newState->mUnk0xb8 = 0;
    newState->mCondvar = 0;
    newState->mUnk0x10 = 0;
    newState->mUnk0x54 = 0;
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

u32 CProc::tempoFromSpeed(s32 speed) {
    // does the 0x80 mean there's fixed point here too...?
    return (speed * 3600 / 48 + 0x80) >> 8;
}

// finds some proc state going down the chain somehow?
CProcState* CProc::func_020144c8(void) {
    CProcState* temp = mLastProcState;
    while (temp != NULL) {
        if (temp->mUnk0xbc == 0)
            return temp;
        else
            temp = temp->mPrev;
    }
    return 0;
}

int CProc::handleProcCommands(u32 cmd, s32 arg0, int *args) {
    OS_Panic("");
    return 0;
}

void a();


// goto lookup
int CProc::func_02014d8c(CProcState* state, fun cmds, u32 offset, bool arg10) {
    // arg8 = arg8;
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
