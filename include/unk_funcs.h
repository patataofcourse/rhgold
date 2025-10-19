#ifndef _UNKFUNCS_H_
#define _UNKFUNCS_H_

struct TempoInfo {
    char pad0x0[8];
    int effects; // ?
};

extern "C" {
    void *func_0200c198(void);
    void func_0200c1c0(void*);
    u32 func_020014e0(void);
    TempoInfo* func_02015c14(int);
    void func_0202a480(int*, int);
    void func_0202a55c(int*);
};

#endif