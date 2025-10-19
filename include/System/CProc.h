#ifndef _SYSTEM_CPROC_H_
#define _SYSTEM_CPROC_H_

#include "global.h"
#include "CProcState.h"

class CProc {
public:
    CProc(int tfID);
    virtual ~CProc(void);

    int handleCommands(CProcState *state);

    u32 tempoFromSpeed(s32);

    int func_02013b08(int);
    int func_02014880(void);
    void func_02014374(void);

protected:
    virtual int update(void);
    virtual int handleProcCommands();

private:
    void init(void);

    int mTickflowId;
    u32 mVBlankCount;
    s32 mGameSpeed;
    s32 mGameSpeed1;
    u8 mState;
    u16 mSpeedStrm;
    s16 mVolume;
    void *mSndHandle;
    char pad0x20[0x18];
    int mStrmHandle;
    s32 mCurrentStrmId;
    char pad0x40[0x14];
    u32 mUnk0x54;
    u16 mSpeedSeq;
    void *mCurrentSndHandle;
    CProcState *mLastProcState;
    int mHaltedProcess;
    char pad0x68[0x4];
    int mUnk0x6c;
    char pad0x70[0xc];
    int mTickflowIndex;
    s32 mUnk0x80;
    CProcState *mProcState;
    void *mUnk0x88;
    int mUnk0x8c;
    u32 mUnk0x90;
};

#endif