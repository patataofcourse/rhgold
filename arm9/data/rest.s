.section .data

.set progress,  0x6014  @ amount of dism'd bytes!
.set total,     0x53560 @ this excludes dtcm + itcm + autoload list

.incbin "../extract/arm9.bin", progress, total - progress

.section .bss

.set bss_progress,  0
.set bss_total,     0x2295c0

.space bss_total - bss_progress
