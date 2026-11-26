#ifndef _MAIN_CPROC_H_
#define _MAIN_CPROC_H_

#include "global.h"
#include "TickFlow.h"

enum EProcBGMType {
    eProcBGMType_0 = 0,
    eProcBGMType_1,
    eProcBGMType_2,
    eProcBGMType_3,
};

class CProc {
public:
    CProc(s32 tfID);
    virtual ~CProc(void);
    
    BOOL handleCommands(CTickFlow *tickFlow);
    
    BOOL func_02013b08(void);
    void init(void);

    bool findTickFlowIndex(s32 index);
    CTickFlow *createTickFlow(CTickFlow *tickFlow, TickFlowCode *code, s32 initRest);
    s32 func_02013d2c(s32 index, TickFlowCode *code, s32 initRest);
    void func_02013d6c(CTickFlow *tickFlow);
    void func_02013db0(s32 index);
    void func_02013dcc(void);
    void func_02013e00(s32 category);
    CTickFlow *func_02013e48(TickFlowCode *code);
    void func_02013eac(TickFlowCode *code);
    void func_02013f04(BOOL paused);
    BOOL func_02013f0c(void);
    s32 func_02013f14(s32 tempo);
    s32 func_02013f3c(s32, s32);
    u32 getTempoFromTicksPerFrame(s32 ticksPerFrame);
    s32 func_02013f80(s32 tempo);
    s32 func_02013fa0(s32 tempo);
    void func_02013fbc(u16 tempo);
    void func_02013fec(s32 seqNo);
    void func_02014074(u32 track, s32 volume);
    void func_0201408c(s32 strmNo);
    void func_02014160(s32 fadeSpeed);
    BOOL func_020141ac(void);
    void func_020141f4(void);
    void func_02014258(void);
    void func_02014290(void);
    void func_020142ec(s32 channel, s32 panning);
    void func_02014310(s32 channel, s32 volume);
    void func_02014320(s32 volume);
    s32 func_02014354(BOOL notFading);
    void func_02014374(void);
    void func_02014408(s32 volume, s32 time);
    void func_02014454(s32 speed);
    s32 func_020144c0(void);
    CTickFlow *func_020144c8(void);
    CTickFlow *func_020144f4(s32 index);

    void func_02014520(s32 seqArc, s32 seqNo, s32 volume, s32 pitch);
    void func_02014554(void *handle, s32 seqArc, s32 seqNo, s32 volume, s32 pitch);
    void func_02014588(s32 player, s32 seqArc, s32 seqNo, s32 volume, s32 pitch);
    void func_020145bc(void *handle, s32 player, s32 seqArc, s32 seqNo, s32 volume, s32 pitch);
    void func_020145f4(s32 seqArc, u16 seqNo, s32 fadeFrame);
    void func_0201460c(void *handle, s32 fadeFrame);
    void func_02014620(void);
    
    BOOL func_02014880(void);
    void func_02014980(void);
    void func_020149a8(void);
    void func_02014b4c(void);
    void func_02014c8c(void);
    BOOL func_02014ca4(CTickFlow *tickFlow);

    s32 gotoLabel(CTickFlow *tickFlow, u32 label);
    u32 func_02014d8c(CTickFlow *tickFlow,
        u32 elseOp, u32 elseArg0,
        u32 defaultOp, u32 defaultArg0,
        u32 endOp, u32 endArg0,
        u32 beginNestedBlockOp, u32 endNestedBlockOp,
        u32 instrOffs, BOOL skipOneInstr);
    void stackPush(CTickFlow *tickFlow);
    void stackPop(CTickFlow *tickFlow);
    void func_02014e9c(u32 condvar);
    void func_02014ec4(NNSSndArc *arc, void *heap);
    void func_02014ee4(s32 index, s32 value);
    s32 func_02014ef4(s32 index);
    void func_02014f04(s32 index, s32 value);

    CProc *getNext(void) {
        return mNext;
    }
    void setNext(CProc *proc) {
        mNext = proc;
    }
    s32 getIndex(void) {
        return mUnk0x8c;
    }
    void setIndex(s32 index) {
        mUnk0x8c = index;
    }

protected:
    virtual BOOL update(void);
    virtual BOOL handleCommands(u32 opcode, u32 arg0, const s32 *args);

    s32 mTickFlowId;
    u32 mVBlankCount;
    s32 mGameSpeed;
    s32 mGameSpeed1;
    u8 mCurrentBGMType;
    u16 mSpeedStrm;
    u16 mVolume;
    void *mSndHandle;
    u8 pad0x20[0xc];
    u16 mTrackBitMask;
    u16 mTrackVolume;
    s32 mUnk0x30; // some sort of tempo thing?
    u8 pad0x34[4];
    NNSSndStrmHandle mStrmHandle;
    s32 mCurrentStrmId;
    u8 pad0x40[0x10];
    u8 mUnk0x50[4];
    u32 mUnk0x54;
    u16 mSpeedSeq;
    void *mCurrentSndHandle;
    CTickFlow *mTickFlowHead;
    BOOL mExecPaused;
    BOOL mUnk0x68;
    BOOL mUnk0x6c;
    u16 mUnk0x70;
    u16 mUnk0x72;
    s32 mUnk0x74;
    s32 mUnk0x78;
    s32 mTickFlowIndex;
    s32 mUnk0x80;
    CTickFlow *mTickFlowCurProc;
    CProc *mNext;
    s32 mUnk0x8c;
    u32 mTempo;
};

class CProcMan {
public:
    CProcMan(void);
    virtual ~CProcMan(void);
    virtual void _08(void);
    virtual s32 _0C(CProc *proc);
    virtual BOOL _10(s32 index);

protected:
    void func_0201473c(void);
    s32 func_020147a4(CProc *proc);
    BOOL func_020147f4(s32 index);

    s32 mProcCount;
    CProc *mProcHead;
};

#endif
