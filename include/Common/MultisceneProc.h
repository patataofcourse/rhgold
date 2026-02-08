#ifndef _COMMON_MULTISCENEPROC_H_
#define _COMMON_MULTISCENEPROC_H_

#include "System/CProc.h"

class CMultisceneProc : public CProc {
public:
    CMultisceneProc(int);

    void func_ov000_02280630(void);

    // TODO: move to its own TU
    class CSub0xa4 {
    public:
        CSub0xa4(CMultisceneProc*);
    private:
        char pad[0x680];
    };

private:
    // CProc up to 0x94
    int mTickFlowId_;
    int mUnk0x98;
    int mUnk0x9c;
    int mUnk0xa0;
    CSub0xa4 *mUnk0xa4;
    char pad0xa8[0x10c - 0xa8];
    int mUnk0x10c;
    char pad0x110[0x128 - 0x110];
    int mUnk0x128;
    char pad0x12c[0x178 - 0x12c];
    int mUnk0x178; // probably a substruct
    char pad0x17c[0x8d4 - 0x17c];
    int mUnk0x8d4;
    char mUnkStruct0x8d8[2][0x90c - 0x8d8]; // definitely a substruct
};

#endif