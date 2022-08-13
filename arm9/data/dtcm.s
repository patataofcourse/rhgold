@ dtcm.s - "I Will Disassemble DTCM Stuff Later tm"

.section .text

.incbin "../extract/arm9.bin", 0x53b20, 0x60

.section .bss

.space 0x20
