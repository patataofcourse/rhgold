#include "System/CProc.h"

#include "unk_funcs.h"

// TODO: finish
int CProc::handleCommands(CProcState *state) {
    mProcState = state;
    u32 opInt = state->mCurTickFlow[state->mTickFlowPos];
    int* args = &state->mCurTickFlow[state->mTickFlowPos + 1];
    u32 num_args = (opInt & 0x3c00) >> 10;
    u32 cmd = opInt & 0x3ff;
    state->mTickFlowPos += num_args + 1;
    u32 arg0 = opInt >> 14;
    switch (cmd) {
        case StoreList:
            state->mUnk0x110 = (int**)args[0];
            break;
        case Spawn:
            CProcState* newFlow = createTickFlow(state, (int*)args[0], state->mRestVal);
            newFlow->mUnk0xc0 = 1;
            mUnk0x68 = 1;
            mUnk0x80 = -1;
            break;
        case SpawnList:
            if (state->mUnk0x110 == 0) 
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
        case 2:
            return 0x69;
        case 3:
            return 0x69;
        case 4:
            return 0x69;
        case 5:
            return 0x69;
        case 6:
            return 0x69;
        case 7:
            return 0x69;
        case 8:
            return 0x39;
        case 9:
            return 0x99;
        case 0x10:
            return 0x39;
        case 0x11:
            return 0x2;
        case 0x12:
            return 0x39;
        case 0x13:
            return 0x39;
        case 0x14:
            return 0x39;
        case 0x15:
            return 0x39;
        case 0x16:
            return 0x39;
        case 0x17:
            return 0x39;
        case 0x18:
            return 0x39;
        case 0x19:
            return 0x39;
        case 0x1a:
            return 0x39;
        case 0x30:
            return 0x39;
        default:
            return 0x45;
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

int CProc::handleProcCommands() {
    OS_Panic("");
    return 0;
}