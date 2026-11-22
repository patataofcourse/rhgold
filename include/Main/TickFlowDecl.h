#ifndef _MAIN_TICKFLOWDECL_H_
#define _MAIN_TICKFLOWDECL_H_

#include "global.h"

typedef u32 TickFlowCode;

enum {
    /* TickFlow opcodes (0x000 to 0x030) */

    TF_000 = 0x000,
    TF_001,
    TF_002,
    TF_003,
    TF_004,
    TF_005,
    TF_006,
    TF_007,
    TF_008,
    TF_009,
    TF_00A,
    TF_00B,
    TF_00C,
    TF_00D,
    TF_00E,
    TF_00F,
    TF_010,
    TF_011,
    TF_012,
    TF_013,
    TF_014,
    TF_015,
    TF_016,
    TF_017,
    TF_018,
    TF_019,
    TF_01A,
    TF_01B,
    TF_01C,
    TF_01D,
    TF_01E,
    TF_01F,
    TF_020,
    TF_021,
    TF_022,
    TF_023,
    TF_024,
    TF_025,
    TF_026,
    TF_027,
    TF_028,
    TF_029,
    TF_02A,
    TF_02B,
    TF_02C,
    TF_02D,
    TF_02E,
    TF_02F,
    TF_030,
    
    /* MultisceneProc opcodes (0x100 to 0x147) are found in Common/MsProcDecl.h */
};

// TODO: macros

#endif
