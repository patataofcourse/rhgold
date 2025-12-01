#ifndef _UNKFUNCS_H_
#define _UNKFUNCS_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "System/TouchPad.h"

typedef struct TempoInfo {
    char pad0x0[8];
    int effects; // ?
} TempoInfo;

// TODO: figure out args
typedef void(*FifoRecvCallback)(u32, u32, s32);

void func_020340dc();
void func_020341e8(int, FifoRecvCallback);
BOOL func_02034234(int, int);
void *func_0200c198(void);
void func_0200c1c0(void*);
u32 func_020014e0(void);
TempoInfo* func_02015c14(int);
void func_0202a480(int*, int);
void func_0202a55c(int*);

#ifdef __cplusplus
};
#endif

#endif