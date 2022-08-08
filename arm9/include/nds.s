.ifndef NDS_HEADER
.set NDS_HEADER, 0

.include "nds_regs.s"

.set ARM9MemoryBase,    0x02000000
.set SharedMemoryBase,  0x03000000
.set ARM9IOBase,        0x04000000
.set PaletteMemoryBase, 0x05000000
.set VRAMBase,          0x06000000
.set OAMBase,           0x07000000
.set GBAROM,            0x08000000
.set GBARAM,            0x0A000000
.set ExceptionVectors,  0xFFFF0000

.set VRAMMainBg,    VRAMBase
.set VRAMSubBg,     VRAMBase + 0x00200000
.set VRAMMainObj,   VRAMBase + 0x00400000
.set VRAMSubObj,    VRAMBase + 0x00600000
.set VRAMLCDC,      VRAMBase + 0x00800000

.endif
