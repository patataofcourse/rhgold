.section .data

.set progress,  0x39a4  @ amount of dism'd bytes!
.set total,     0x53560 @ this excludes dtcm + itcm + autoload list

.incbin "../extract/arm9.bin", progress, total-progress
