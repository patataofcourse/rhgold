.ifndef NDS_REGS_HEADER
.set NDS_REGS_HEADER, 0

.include "nds.s"

@ check gbatek for documentation i cant be bothered

@ 2D engine - main
.set GFX_2D_MAIN_DISPCNT,          ARM9IOBase
.set GFX_2D_DISPSTAT,              ARM9IOBase + 4      @ Shared with Sub engine
.set GFX_2D_VCOUNT,                ARM9IOBase + 6      @ Shared with Sub engine
.set GFX_2D_MAIN_BG0CNT,           ARM9IOBase + 8
.set GFX_2D_MAIN_BG1CNT,           ARM9IOBase + 0xA
.set GFX_2D_MAIN_BG2CNT,           ARM9IOBase + 0xC
.set GFX_2D_MAIN_BG3CNT,           ARM9IOBase + 0xE
.set GFX_2D_MAIN_BG0HOFS,          ARM9IOBase + 0x10
.set GFX_2D_MAIN_BG0VOFS,          ARM9IOBase + 0x12
.set GFX_2D_MAIN_BG1HOFS,          ARM9IOBase + 0x14
.set GFX_2D_MAIN_BG1VOFS,          ARM9IOBase + 0x16
.set GFX_2D_MAIN_BG2HOFS,          ARM9IOBase + 0x18
.set GFX_2D_MAIN_BG2VOFS,          ARM9IOBase + 0x1A
.set GFX_2D_MAIN_BG3HOFS,          ARM9IOBase + 0x1C
.set GFX_2D_MAIN_BG3VOFS,          ARM9IOBase + 0x1E
.set GFX_2D_MAIN_BG2PA,            ARM9IOBase + 0x20
.set GFX_2D_MAIN_BG2PB,            ARM9IOBase + 0x22
.set GFX_2D_MAIN_BG2PC,            ARM9IOBase + 0x24
.set GFX_2D_MAIN_BG2PD,            ARM9IOBase + 0x26
.set GFX_2D_MAIN_BG2X,             ARM9IOBase + 0x28
.set GFX_2D_MAIN_BG2Y,             ARM9IOBase + 0x2C
.set GFX_2D_MAIN_BG3PA,            ARM9IOBase + 0x30
.set GFX_2D_MAIN_BG3PB,            ARM9IOBase + 0x32
.set GFX_2D_MAIN_BG3PC,            ARM9IOBase + 0x34
.set GFX_2D_MAIN_BG3PD,            ARM9IOBase + 0x36
.set GFX_2D_MAIN_BG3X,             ARM9IOBase + 0x38
.set GFX_2D_MAIN_BG3Y,             ARM9IOBase + 0x3C
.set GFX_2D_MAIN_WIN0H,            ARM9IOBase + 0x40
.set GFX_2D_MAIN_WIN1H,            ARM9IOBase + 0x42
.set GFX_2D_MAIN_WIN0V,            ARM9IOBase + 0x44
.set GFX_2D_MAIN_WIN1V,            ARM9IOBase + 0x46
.set GFX_2D_MAIN_WININ,            ARM9IOBase + 0x48
.set GFX_2D_MAIN_WINOUT,           ARM9IOBase + 0x4A
.set GFX_2D_MAIN_MOSAIC,           ARM9IOBase + 0x4C
.set GFX_2D_MAIN_BLDCNT,           ARM9IOBase + 0x50
.set GFX_2D_MAIN_BLDALPHA,         ARM9IOBase + 0x52
.set GFX_2D_MAIN_BLDY,             ARM9IOBase + 0x54
.set GFX_2D_DISP3DCNT,             ARM9IOBase + 0x60
.set GFX_2D_DISPCAPCNT,            ARM9IOBase + 0x64
.set GFX_2D_MAIN_MASTER_BRIGHT,    ARM9IOBase + 0x68

@ 2D engine - sub
.set GFX_2D_SUB_DISPCNT,           ARM9IOBase + 0x1000
.set GFX_2D_SUB_BG0CNT,            ARM9IOBase + 0x1008
.set GFX_2D_SUB_BG1CNT,            ARM9IOBase + 0x100A
.set GFX_2D_SUB_BG2CNT,            ARM9IOBase + 0x100C
.set GFX_2D_SUB_BG3CNT,            ARM9IOBase + 0x100E
.set GFX_2D_SUB_BG0HOFS,           ARM9IOBase + 0x1010
.set GFX_2D_SUB_BG0VOFS,           ARM9IOBase + 0x1012
.set GFX_2D_SUB_BG1HOFS,           ARM9IOBase + 0x1014
.set GFX_2D_SUB_BG1VOFS,           ARM9IOBase + 0x1016
.set GFX_2D_SUB_BG2HOFS,           ARM9IOBase + 0x1018
.set GFX_2D_SUB_BG2VOFS,           ARM9IOBase + 0x101A
.set GFX_2D_SUB_BG3HOFS,           ARM9IOBase + 0x101C
.set GFX_2D_SUB_BG3VOFS,           ARM9IOBase + 0x101E
.set GFX_2D_SUB_BG2PA,             ARM9IOBase + 0x1020
.set GFX_2D_SUB_BG2PB,             ARM9IOBase + 0x1022
.set GFX_2D_SUB_BG2PC,             ARM9IOBase + 0x1024
.set GFX_2D_SUB_BG2PD,             ARM9IOBase + 0x1026
.set GFX_2D_SUB_BG2X,              ARM9IOBase + 0x1028
.set GFX_2D_SUB_BG2Y,              ARM9IOBase + 0x102C
.set GFX_2D_SUB_BG3PA,             ARM9IOBase + 0x1030
.set GFX_2D_SUB_BG3PB,             ARM9IOBase + 0x1032
.set GFX_2D_SUB_BG3PC,             ARM9IOBase + 0x1034
.set GFX_2D_SUB_BG3PD,             ARM9IOBase + 0x1036
.set GFX_2D_SUB_BG3X,              ARM9IOBase + 0x1038
.set GFX_2D_SUB_BG3Y,              ARM9IOBase + 0x103C
.set GFX_2D_SUB_WIN0H,             ARM9IOBase + 0x1040
.set GFX_2D_SUB_WIN1H,             ARM9IOBase + 0x1042
.set GFX_2D_SUB_WIN0V,             ARM9IOBase + 0x1044
.set GFX_2D_SUB_WIN1V,             ARM9IOBase + 0x1046
.set GFX_2D_SUB_WININ,             ARM9IOBase + 0x1048
.set GFX_2D_SUB_WINOUT,            ARM9IOBase + 0x104A
.set GFX_2D_SUB_MOSAIC,            ARM9IOBase + 0x104C
.set GFX_2D_SUB_BLDCNT,            ARM9IOBase + 0x1050
.set GFX_2D_SUB_BLDALPHA,          ARM9IOBase + 0x1052
.set GFX_2D_SUB_BLDY,              ARM9IOBase + 0x1054
.set GFX_2D_SUB_MASTER_BRIGHT,     ARM9IOBase + 0x106C

@ 3D engine
.set GFX_3D_DISP3DCNT,          ARM9IOBase + 0x60
.set GFX_3D_RDLINES_COUNT,      ARM9IOBase + 0x320
.set GFX_3D_EDGE_COLOR,         ARM9IOBase + 0x330
.set GFX_3D_ALPHA_TEST_REF,     ARM9IOBase + 0x340
.set GFX_3D_CLEAR_COLOR,        ARM9IOBase + 0x350
.set GFX_3D_CLEAR_DEPTH,        ARM9IOBase + 0x354
.set GFX_3D_CLRIMAGE_OFFSET,    ARM9IOBase + 0x356
.set GFX_3D_FOG_COLOR,          ARM9IOBase + 0x358
.set GFX_3D_FOG_OFFSET,         ARM9IOBase + 0x35C
.set GFX_3D_FOG_TABLE,          ARM9IOBase + 0x360
.set GFX_3D_TOON_TABLE,         ARM9IOBase + 0x380

@ 3D engine - geometry
.set GFX_3D_GXFIFO,             ARM9IOBase + 0x400
.set GFX_3D_MTX_MODE,           ARM9IOBase + 0x440
.set GFX_3D_MTX_PUSH,           ARM9IOBase + 0x444
.set GFX_3D_MTX_POP,            ARM9IOBase + 0x448
.set GFX_3D_MTX_STORE,          ARM9IOBase + 0x44C
.set GFX_3D_MTX_RESTORE,        ARM9IOBase + 0x450
.set GFX_3D_MTX_IDENTITY,       ARM9IOBase + 0x454
.set GFX_3D_MTX_LOAD_4x4,       ARM9IOBase + 0x458
.set GFX_3D_MTX_LOAD_4x3,       ARM9IOBase + 0x45C
.set GFX_3D_MTX_MULT_4x4,       ARM9IOBase + 0x460
.set GFX_3D_MTX_MULT_4x3,       ARM9IOBase + 0x464
.set GFX_3D_MTX_MULT_3x3,       ARM9IOBase + 0x468
.set GFX_3D_MTX_SCALE,          ARM9IOBase + 0x46C
.set GFX_3D_MTX_TRANS,          ARM9IOBase + 0x470
.set GFX_3D_COLOR,              ARM9IOBase + 0x480
.set GFX_3D_NORMAL,             ARM9IOBase + 0x484
.set GFX_3D_TEXCOORD,           ARM9IOBase + 0x488
.set GFX_3D_VTX_16,             ARM9IOBase + 0x48C
.set GFX_3D_VTX_10,             ARM9IOBase + 0x490
.set GFX_3D_VTX_XY,             ARM9IOBase + 0x494
.set GFX_3D_VTX_XZ,             ARM9IOBase + 0x498
.set GFX_3D_VTX_YZ,             ARM9IOBase + 0x49C
.set GFX_3D_VTX_DIFF,           ARM9IOBase + 0x4A0
.set GFX_3D_POLYGON_ATTR,       ARM9IOBase + 0x4A4
.set GFX_3D_TEXIMAGE_PARAM,     ARM9IOBase + 0x4A8
.set GFX_3D_PLTT_BASE,          ARM9IOBase + 0x4AC
.set GFX_3D_DIF_AMB,            ARM9IOBase + 0x4C0
.set GFX_3D_SPE_EMI,            ARM9IOBase + 0x4C4
.set GFX_3D_LIGHT_VECTOR,       ARM9IOBase + 0x4C8
.set GFX_3D_LIGHT_COLOR,        ARM9IOBase + 0x4CC
.set GFX_3D_SHININESS,          ARM9IOBase + 0x4D0
.set GFX_3D_BEGIN_VTXS,         ARM9IOBase + 0x500
.set GFX_3D_END_VTXS,           ARM9IOBase + 0x504
.set GFX_3D_SWAP_BUFFERS,       ARM9IOBase + 0x540
.set GFX_3D_VIEWPORT,           ARM9IOBase + 0x580
.set GFX_3D_BOX_TEST,           ARM9IOBase + 0x5C0
.set GFX_3D_POS_TEST,           ARM9IOBase + 0x5C4
.set GFX_3D_VEC_TEST,           ARM9IOBase + 0x5C8
.set GFX_3D_GXSTAT,             ARM9IOBase + 0x600
.set GFX_3D_RAM_COUNT,          ARM9IOBase + 0x604
.set GFX_3D_DISP_1DOT_DEPTH,    ARM9IOBase + 0x610
.set GFX_3D_POS_RESULT,         ARM9IOBase + 0x620
.set GFX_3D_VEC_RESULT,         ARM9IOBase + 0x630
.set GFX_3D_CLIPMTX_RESULT,     ARM9IOBase + 0x640
.set GFX_3D_VECMTX_RESULT,      ARM9IOBase + 0x680

@ DMA, timers, keypad
.set DMA_CHANNEL_0,     ARM9IOBase + 0xB0
.set DMA_CHANNEL_1,     ARM9IOBase + 0xBC
.set DMA_CHANNEL_2,     ARM9IOBase + 0xC8
.set DMA_CHANNEL_3,     ARM9IOBase + 0xD4
.set DMA_FILL_0,        ARM9IOBase + 0xE0
.set DMA_FILL_1,        ARM9IOBase + 0xE4
.set DMA_FILL_2,        ARM9IOBase + 0xE8
.set DMA_FILL_3,        ARM9IOBase + 0xEC
.set DMA_TIMER_0,       ARM9IOBase + 0x100
.set DMA_TIMER_1,       ARM9IOBase + 0x104
.set DMA_TIMER_2,       ARM9IOBase + 0x108
.set DMA_TIMER_3,       ARM9IOBase + 0x110
.set KEYINPUT,          ARM9IOBase + 0x130
.set KEYCNT,            ARM9IOBase + 0x132

@ IPC/Cart
.set IPCSYNC,       ARM9IOBase + 0x180
.set IPCFIFOCNT,    ARM9IOBase + 0x184
.set IPCFIFOSEND,   ARM9IOBase + 0x188
.set AUXSPICNT,     ARM9IOBase + 0x1A0
.set AUXSPICDATA,   ARM9IOBase + 0x1A2
.set CART_TIMING,   ARM9IOBase + 0x1A4
.set CART_CMDOUT,   ARM9IOBase + 0x1A8
.set CART_CRYPT0_L, ARM9IOBase + 0x1B0
.set CART_CRYPT1_L, ARM9IOBase + 0x1B4
.set CART_CRYPT0_H, ARM9IOBase + 0x1B8
.set CART_CRYPT1_H, ARM9IOBase + 0x1BA
.set FIFORECV,      ARM9IOBase + 0x100000
.set CART_IN,       ARM9IOBase + 0x100010

@ Memory and IRQ control
.set REG_EXMEMCNT,  ARM9IOBase + 0x204
.set REG_IME,       ARM9IOBase + 0x208
.set REG_IE,        ARM9IOBase + 0x210
.set REG_IF,        ARM9IOBase + 0x214
.set VRAMCNT_A,     ARM9IOBase + 0x240
.set VRAMCNT_B,     ARM9IOBase + 0x241
.set VRAMCNT_C,     ARM9IOBase + 0x242
.set VRAMCNT_D,     ARM9IOBase + 0x243
.set VRAMCNT_E,     ARM9IOBase + 0x244
.set VRAMCNT_F,     ARM9IOBase + 0x245
.set VRAMCNT_G,     ARM9IOBase + 0x246
.set WRAMCNT,       ARM9IOBase + 0x247
.set VRAMCNT_H,     ARM9IOBase + 0x248
.set VRAMCNT_I,     ARM9IOBase + 0x249

@ Math
.set DIVCNT,        ARM9IOBase + 0x280
.set DIV_NUMER,     ARM9IOBase + 0x290
.set DIV_DENOM,     ARM9IOBase + 0x298
.set DIV_RESULT,    ARM9IOBase + 0x2A0
.set DIVREM_RESULT, ARM9IOBase + 0x2A8
.set SQRTCNT,       ARM9IOBase + 0x2B0
.set SQRT_RESULT,   ARM9IOBase + 0x2B4
.set SQRT_PARAM,    ARM9IOBase + 0x2B8
.set POSTFLG,       ARM9IOBase + 0x300
.set POWCNT1,       ARM9IOBase + 0x304

@ Main memory control
.set MEMCTL,    SharedMemoryBase - 2

.endif
