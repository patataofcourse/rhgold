.ifndef NDS_REGS_HEADER
.set NDS_REGS_HEADER, 0

.include "nds.s"

@ check gbatek for documentation i cant be bothered

@ TODO: 3D engine, mem/irq control, math

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

@ Math

@ Main memory control
.set MEMCTL,    SharedMemoryBase - 2

.endif
