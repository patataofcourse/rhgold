#ifndef _SYSTEM_CPROC_H_
#define _SYSTEM_CPROC_H_

#include "global.h"
#include "CProcState.h"

class CProc {
public:
    CProc(int tfID);
    virtual ~CProc(void);

    int handleCommands(CProcState *state);

    CProcState *createTickFlow(CProcState *state,int *entry, u32 initRest);
    bool findTickFlowIndex(int index);

    u32 tempoFromSpeed(s32);

    // unknown functions
    int func_02013b08(void);
    int func_02014880(void);
    void func_02014374(void);
    CProcState* func_020144c8(void);
    int func_02014d34(CProcState*, u32);
    int func_02014d8c(CProcState*, int, int, int, int, int, int, int, int, int, int); // goto
    void func_02014e5c(CProcState*);
    void func_02014e7c(CProcState*);
    

    enum Commands {
        Spawn = 0,
        Rest = 1,
        CallFunc = 2,
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
    u32 mTempo;
};

#endif