@ itcm.s - "I Will Disassemble ITCM Stuff Later tm"

.include "global.s"

    arm_func_start OS_irqHandler
OS_irqHandler:
    stmdb sp!, {lr}
    mov r12, #0x04000000
    add r12, r12, #0x210
    ldr r1, [r12, #-8]
    cmp r1, #0
    beq _01ff801c
    b _01ff8020
_01ff801c:
    ldmia sp!, {pc}
_01ff8020:
    ldmia r12, {r1, r2}
    ands r1, r1, r2
    beq _01ff8030
    b _01ff8034
_01ff8030:
    ldmia sp!, {pc}
_01ff8034:
    mov r3, #0x80000000
_01ff8038:
    clz r0, r1
    bics r1, r1, r3, lsr r0
    bne _01ff8038
    mov r1, r3, lsr r0
    str r1, [r12, #4]
    rsbs r0, r0, #0x1f
    ldr r1, _01ff8060
    ldr r0, [r1, r0, lsl #2]
    ldr lr, _01ff8064
    bx r0
_01ff8060: .word D_027e0000
_01ff8064: .word func_01ff8068

func_01ff8068:

.incbin "../extract/arm9.bin", 0x535c8, 0x558
