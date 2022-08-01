.global _entry_arm9
.global _start

.section .text

_start:
_entry_arm9:
    mov r12, #0x04000000
    str r12, [r12, #0x208]
_02000808:
    ldrh r0, [r12, #6]
    cmp r0, #0
    bne _02000808
    bl func_02000ab0
    mov r0, #0x13
    msr cpsr_c, r0
    ldr r0, _02000930
    add r0, r0, #0x3fc0
    mov sp, r0
    mov r0, #0x12
    msr cpsr_c, r0
    ldr r0, _02000930
    add r0, r0, #0x3fc0
    sub r0, r0, #0x40
    sub sp, r0, #0x4
    tst sp, #0x4
    beq _02000850
    b _02000854
_02000850:
    sub sp, sp, #0x4
_02000854:
    ldr r1, _02000934
    sub r1, r0, r1
    mov r0, #0x1f
    msr cpsr_cxsf, r0
    sub sp, r1, #0x4
    mov r0, #0
    ldr r1, _02000930
    mov r2, #0x4000
    bl func_02000954
    mov r0, #0
    ldr r1, _02000938
    mov r2, #0x400
    bl func_02000954
    mov r0, #0x200
    ldr r1, _0200093c
    mov r2, #0x400
    bl func_02000954
    ldr r1, _02000940
    ldr r0, [r1, #0x14]
    bl func_02000970
    bl func_02000a1c
    ldr r0, _02000940
    ldr r1, [r0, #0xc]
    ldr r2, [r0, #0x10]
    mov r3, r1
    mov r0, #0
_020008bc:
    cmp r1, r2
    bcc _020008c8
    b _020008cc
_020008c8:
    str r0, [r1], #0x4
_020008cc:
    bcc _020008bc
    bic r1, r3, #0x1f
_020008d4:
    mcr p15, #0, r0, cr7, cr10, #4
    mcr p15, #0, r1, cr7, cr5, #1
    mcr p15, #0, r1, cr7, cr14, #1
    add r1, r1, #0x20
    cmp r1, r2
    blt _020008d4
    ldr r1, _02000944
    str r0, [r1]
    ldr r1, _02000930
    add r1, r1, #0x3fc0
    add r1, r1, #0x3c
    ldr r0, _02000948
    str r0, [r1]
    bl func_0203ba38
    bl func_02001498
    bl func_0203cf5c
    ldr r1, _0200094c
    ldr lr, _02000950
    tst sp, #0x4
    bne _02000928
    b _0200092c
_02000928:
    sub sp, sp, #4
_0200092c:
    bx r1

@i have to manually put these because gnu-as hates me
_02000930: .word 0x027E0000
_02000934: .word 0x800
_02000938: .word ARM9_Palettes
_0200093c: .word ARM9_OAM
_02000940: .word D_02000b9c
_02000944: .word 0x027fff9c
_02000948: .word 0x01ff8000
_0200094c: .word NitroMain
_02000950: .word ARM9_BIOS
