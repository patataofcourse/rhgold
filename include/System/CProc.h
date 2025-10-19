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
    CProcState *createTickFlow(CProcState *state,int *entry, u32 initRest);

    int func_02013b08(int);
    int func_02013bc0(int);
    int func_02014880(void);
    void func_02014374(void);
    CProcState* func_020144c8(void);

    enum Commands {
        Spawn = 0,
        Rest = 1,
        StoreList = 0x22,
        SpawnList = 0x23,
        RestCondvar = 0x26,
        UnkCmd0x2d = 0x2d,
    };

protected:
    virtual int update(void);
    virtual int handleProcCommands();

private:
    void init(void);

    int mTickFlowId;
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
    int mUnk0x68;
    int mUnk0x6c;
    char pad0x70[0xc];
    int mTickFlowIndex;
    s32 mUnk0x80;
    CProcState *mProcState;
    void *mUnk0x88;
    int mUnk0x8c;
    u32 mUnk0x90;
};

#endif