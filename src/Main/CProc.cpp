#include "System/CProc.h"

#include "unk_funcs.h"

int CProc::handleCommands(CProcState *state) {
    mProcState = state;
}

CProc::CProc(int tfID) {
    mTickflowId = tfID;
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

int CProc::func_02013b08(int) {
    if (func_02014880() != 0) {
        return 1;
    }
    
    if (mGameSpeed1 != 0) {
        mUnk0x90 = tempoFromSpeed(mGameSpeed1);
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
    mUnk0x90 = mSpeedStrm = 120;
    mVolume = 0x7f;
    mUnk0x6c = 0;
    mUnk0x54 = 0;
    mCurrentStrmId = -1;
    mSpeedSeq = 0x100; // 100%?
    mTickflowIndex = 1;
    mUnk0x80 = -1;
}

u32 CProc::tempoFromSpeed(s32 speed) {
    // does the 0x80 mean there's fixed point here too...?
    return (speed * 3600 / 48 + 0x80) >> 8;
}

int CProc::handleProcCommands() {
    OS_Panic("");
    return 0;
}