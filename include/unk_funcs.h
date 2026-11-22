#ifndef _UNKFUNCS_H_
#define _UNKFUNCS_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef struct TempoInfo {
    char pad0x0[8];
    int effects; // ?
} TempoInfo;

typedef struct SndArc {} SndArc;
SndArc *NNS_SndArcSetCurrent(SndArc *);

u32 func_02004d48(u32 arg0);
void func_02008aec(int);
void func_02009d98(int, int);
void func_0200b33c(int, int);
void func_0200b3f0(void *);
void func_0200b9a0(int);
void func_0200c378(void *, int);
void func_0200c49c(void *, u16);
void func_0200c648(int, int);
void func_0200c654(int, int);
void func_0200c660(int, int);
void func_0200c66c(int, int);
int func_0200c684(int);
int func_0200c70c(int *);
void func_0200dc44(void *); // unknown struct, touchpad related?
s32 func_02015dd8(int, int);
void *func_0200c198(void);
void func_0200c1c0(void *);
u32 func_020014e0(void);
TempoInfo *func_02015c14(int);
void func_0202a480(int *, int);
void func_0202a4e0(int *, u16, int);
void func_0202a540(int *);
void func_0202a55c(int *);

#ifdef __cplusplus
};

#endif

#endif