#ifndef _UNKFUNCS_H_
#define _UNKFUNCS_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "System/TouchPad.h"

class CProc;

typedef struct TempoInfo {
    char pad0x0[8];
    int effects; // ?
} TempoInfo;

// TODO: figure out args
typedef void(*FifoRecvCallback)(u32, u32, s32);

u32 NNS_SndArcSetCurrent(u32);

u32 func_02004d48(u32 arg0);
void func_02008aec(int);
void func_02009d98(int, int);
void func_0200b33c(int, int);
void func_0200b3f0(CProc*); // could be CMultisceneProc
void func_0200b9a0(int);
void func_0200c378(void*, int);
void func_0200c49c(void*, u16);
void func_0200c648(int, int);
void func_0200c654(int, int);
void func_0200c660(int, int);
void func_0200c66c(int, int);
int func_0200c684(int);
int func_0200c70c(int*);
void func_0200dc44(void*); // unknown struct, touchpad related?
s32 func_02015dd8(int, int);
void func_020340dc(void);
void func_020341e8(int, FifoRecvCallback);
BOOL func_02034234(int, int);
void *func_0200c198(void);
void func_0200c1c0(void*);
u32 func_020014e0(void);
TempoInfo* func_02015c14(int);
void func_0202a480(int*, int);
void func_0202a4e0(int*, u16, int);
void func_0202a55c(int*);
void func_0202e658(vu16*, int, int);
void func_0202eff0(u16*, int, int);
void func_0202f044(u16*, int, int);

#ifdef __cplusplus
};

#endif

#endif