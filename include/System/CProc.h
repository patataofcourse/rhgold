#ifndef _SYSTEM_CPROC_H_
#define _SYSTEM_CPROC_H_

#include "global.h"
#include "CProcState.h"

struct fun {
    int cmd_A;
    int arg0_A;
    int cmd_B;
    int arg0_B;
    int cmd_C;
    int arg0_C;
    int cmd_depth;
    int cmd_undepth;
};
class CProc {
public:
    CProc(int tfID);
    virtual ~CProc(void);

    int handleCommands(CProcState *state);

    CProcState *createTickFlow(CProcState *state,int *entry, u32 initRest);
    bool findTickFlowIndex(int index);
    int func_02014d8c(CProcState*, int, int, int, int, int, int, int, int, int, int); // goto
    int func_02014d8c(CProcState*, fun, u32, bool); // goto

    u32 tempoFromSpeed(s32);

    // unknown functions
    int func_02013b08(void);
    int func_02013f3c(s32, s32);
    int func_02013f80(u32);
    void func_02013fbc(u16);
    void func_02013fec(int);
    void func_0201408c(int);
    void func_02014160(int);
    void func_020142ec(int, int);
    void func_02014310(int, int);
    void func_02014320(int);
    void func_02014408(int, int);
    void func_02014454(u32);
    void func_02014520(int, u16, u8, u32);
    void func_02014588(int, int, u16, u8, u32);
    void func_020145f4(int, u16, u32);
    void func_02014620(void);
    int func_02014880(void);
    s32 func_020144c0(void);
    void func_02014374(void);
    CProcState* func_020144c8(void);
    int func_02014d34(CProcState*, u32);
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
    virtual int handleProcCommands(u32 cmd, s32 arg0, int *args);

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
    char pad0x20[0x10];
    s32 mUnk0x30; // some sort of tempo thing?
    char pad0x34[4];
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