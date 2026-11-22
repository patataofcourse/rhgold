#ifndef _SYSTEM_CPROC_H_
#define _SYSTEM_CPROC_H_

#include "global.h"
#include "TickFlow.h"

class CProc {
public:
    CProc(s32 tfID);
    virtual ~CProc(void);

    BOOL handleCommands(CTickFlow *tickFlow);

    CTickFlow *createTickFlow(CTickFlow *tickFlow, TickFlowCode *entry, s32 initRest);
    bool findTickFlowIndex(s32 index);
    s32 gotoLabel(CTickFlow *tickFlow, u32 label);
    u32 func_02014d8c(CTickFlow *tickFlow, u32, u32, u32, u32, u32, u32, u32, u32, u32, BOOL); // goto??? prob for ifs
    void stackPush(CTickFlow *tickFlow);
    void stackPop(CTickFlow *tickFlow);

    u32 tempoFromSpeed(s32);

    // unknown functions
    BOOL func_02013b08(void);
    void func_02013dcc(void);
    CTickFlow *func_02013e48(TickFlowCode *);
    s32 func_02013f3c(s32, s32);
    s32 func_02013f80(u32);
    void func_02013fbc(u16);
    void func_02013fec(s32);
    void func_0201408c(s32);
    void func_02014160(s32);
    void func_020142ec(s32, s32);
    void func_02014310(s32, s32);
    void func_02014320(s32);
    void func_02014408(s32, s32);
    void func_02014454(u32);
    void func_02014520(s32, u32, u32, s32);
    void func_02014588(s32, s32, u32, u32, s32);
    void func_020145f4(s32, u16, u32);
    void func_02014620(void);
    BOOL func_02014880(void);
    s32 func_020144c0(void);
    void func_02014374(void);
    CTickFlow *func_020144c8(void);
    void func_02014980(void);
    void func_020149a8(void);
    void func_02014b4c(void);
    void func_02014c8c(void);
    BOOL func_02014ca4(CTickFlow *);
    void func_02013d6c(CTickFlow *);
    

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
    virtual BOOL update(void);
    virtual BOOL handleProcCommands(u32 cmd, u32 arg0, u32 *args);

    s32 mTickFlowId;

private:
    void init(void);

    u32 mVBlankCount;
    s32 mGameSpeed;
    s32 mGameSpeed1;
    u8 mState;
    u16 mSpeedStrm;
    s16 mVolume;
    void *mSndHandle;
    u8 pad0x20[0x10];
    s32 mUnk0x30; // some sort of tempo thing?
    u8 pad0x34[4];
    int mStrmHandle; // TODO
    s32 mCurrentStrmId;
    u8 pad0x40[0x10];
    u8 mUnk0x50[4];
    u32 mUnk0x54;
    u16 mSpeedSeq;
    void *mCurrentSndHandle;
    CTickFlow *mTickFlowHead;
    BOOL mHaltedProcess;
    BOOL mUnk0x68;
    s32 mUnk0x6c;
    u16 mUnk0x70;
    u16 mUnk0x72;
    s32 mUnk0x74;
    s32 mUnk0x78;
    s32 mTickFlowIndex;
    s32 mUnk0x80;
    CTickFlow *mTickFlowCurProc;
    void *mUnk0x88;
    s32 mUnk0x8c;
    u32 mTempo;
};

#endif