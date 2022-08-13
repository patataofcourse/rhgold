@ entry.s
@   Stuff related to _start aka _entry_arm9

.include "global.s"
.include "nds.s"

.section .text

arm_func_start _entry_arm9
_entry_arm9:
    mov r12, #ARM9IOBase
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
    ldr r1, _02000940	@ ModuleParams
    ldr r0, [r1, #0x14] @ SDK_COMPRESSED_STATIC_END
    bl func_02000970
    bl func_02000a1c
    ldr r0, _02000940	@ ModuleParams
    ldr r1, [r0, #0xc]	@ SDK_STATIC_BSS_START
    ldr r2, [r0, #0x10] @ SDK_STATIC_BSS_END
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
_02000930: .word 0x027E0000
_02000934: .word 0x800
_02000938: .word PaletteMemoryBase
_0200093c: .word OAMBase
_02000940: .word ModuleParams
_02000944: .word 0x027fff9c
_02000948: .word 0x01ff8000
_0200094c: .word NitroMain
_02000950: .word ExceptionVectors
arm_func_end _entry_arm9

arm_func_start func_02000954
func_02000954: @ 0x02000954
	add ip, r1, r2
_02000958:
	cmp r1, ip
	blt _02000964
	b _02000968
_02000964:
	stm r1!, {r0}
_02000968:
	blt _02000958
	bx lr
arm_func_end func_02000954

arm_func_start func_02000970
func_02000970: @ 0x02000970
	cmp r0, #0
	beq _02000a18
	push {r4, r5, r6, r7}
	ldmdb r0, {r1, r2}
	add r2, r0, r2
	sub r3, r0, r1, lsr #24
	bic r1, r1, #0xff000000
	sub r1, r0, r1
	mov r4, r2
_02000994:
	cmp r3, r1
	ble _020009f4
	ldrb r5, [r3, #-1]!
	mov r6, #8
_020009a4:
	subs r6, r6, #1
	blt _02000994
	tst r5, #0x80
	bne _020009c0
	ldrb r0, [r3, #-1]!
	strb r0, [r2, #-1]!
	b _020009e8
_020009c0:
	ldrb ip, [r3, #-1]!
	ldrb r7, [r3, #-1]!
	orr r7, r7, ip, lsl #8
	bic r7, r7, #0xf000
	add r7, r7, #2
	add ip, ip, #0x20
_020009d8:
	ldrb r0, [r2, r7]
	strb r0, [r2, #-1]!
	subs ip, ip, #0x10
	bge _020009d8
_020009e8:
	cmp r3, r1
	lsl r5, r5, #1
	bgt _020009a4
_020009f4:
	mov r0, #0
	bic r3, r1, #0x1f
_020009fc:
	mcr p15, #0, r0, c7, c10, #4
	mcr p15, #0, r3, c7, c5, #1
	mcr p15, #0, r3, c7, c14, #1
	add r3, r3, #0x20
	cmp r3, r4
	blt _020009fc
	pop {r4, r5, r6, r7}
_02000a18:
	bx lr
arm_func_end func_02000970

arm_func_start func_02000a1c
func_02000a1c: @ 0x02000a1c
	ldr r0, _02000aa8 @ =ModuleParams
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_02000a2c:
	cmp r1, r2
	beq _02000aa4
	ldr r5, [r1], #4
	ldr r7, [r1], #4
	add r6, r5, r7
	mov r4, r5
_02000a44:
	cmp r4, r6
	bmi _02000a50
	b _02000a54
_02000a50:
	ldr r7, [r3], #4
_02000a54:
	bmi _02000a5c
	b _02000a60
_02000a5c:
	str r7, [r4], #4
_02000a60:
	bmi _02000a44
	ldr r7, [r1], #4
	add r6, r4, r7
	mov r7, #0
_02000a70:
	cmp r4, r6
	blo _02000a7c
	b _02000a80
_02000a7c:
	str r7, [r4], #4
_02000a80:
	blo _02000a70
	bic r4, r5, #0x1f
_02000a88:
	mcr p15, #0, r7, c7, c10, #4
	mcr p15, #0, r4, c7, c5, #1
	mcr p15, #0, r4, c7, c14, #1
	add r4, r4, #0x20
	cmp r4, r6
	blt _02000a88
	b _02000a2c
_02000aa4:
	b func_02000aac
	.align 2, 0
_02000aa8: .4byte ModuleParams
arm_func_end func_02000a1c

arm_func_start func_02000aac
func_02000aac:
	bx lr
arm_func_end func_02000aac

arm_func_start func_02000ab0
func_02000ab0: @ 0x02000ab0
	mrc p15, #0, r0, c1, c0, #0
	ldr r1, _02000b68 @ =0x000f9005
	bic r0, r0, r1
	mcr p15, #0, r0, c1, c0, #0
	mov r0, #0
	mcr p15, #0, r0, c7, c5, #0
	mcr p15, #0, r0, c7, c6, #0
	mcr p15, #0, r0, c7, c10, #4
	ldr r0, _02000b6c @ =0x04000033
	mcr p15, #0, r0, c6, c0, #0
	ldr r0, _02000b70 @ =0x0200002d
	mcr p15, #0, r0, c6, c1, #0
	ldr r0, _02000b74 @ =0x027e0021
	mcr p15, #0, r0, c6, c2, #0
	ldr r0, _02000b78 @ =0x08000035
	mcr p15, #0, r0, c6, c3, #0
	ldr r0, _02000b7c @ =0x027e0000
	orr r0, r0, #0x1a
	orr r0, r0, #1
	mcr p15, #0, r0, c6, c4, #0
	ldr r0, _02000b80 @ =0x0100002f
	mcr p15, #0, r0, c6, c5, #0
	ldr r0, _02000b84 @ =0xffff001d
	mcr p15, #0, r0, c6, c6, #0
	ldr r0, _02000b88 @ =0x027ff017
	mcr p15, #0, r0, c6, c7, #0
	mov r0, #0x20
	mcr p15, #0, r0, c9, c1, #1
	ldr r0, _02000b7c @ =0x027e0000
	orr r0, r0, #0xa
	mcr p15, #0, r0, c9, c1, #0
	mov r0, #0x42
	mcr p15, #0, r0, c2, c0, #1
	mov r0, #0x42
	mcr p15, #0, r0, c2, c0, #0
	mov r0, #2
	mcr p15, #0, r0, c3, c0, #0
	ldr r0, _02000b8c @ =0x05100011
	mcr p15, #0, r0, c5, c0, #3
	ldr r0, _02000b90 @ =0x15111011
	mcr p15, #0, r0, c5, c0, #2
	mrc p15, #0, r0, c1, c0, #0
	ldr r1, _02000b94 @ =0x0005707d
	orr r0, r0, r1
	mcr p15, #0, r0, c1, c0, #0
	bx lr
	.align 2, 0
_02000b68: .4byte 0x000f9005
_02000b6c: .4byte 0x04000033
_02000b70: .4byte D_0200002d
_02000b74: .4byte 0x027e0021
_02000b78: .4byte 0x08000035
_02000b7c: .4byte 0x027e0000
_02000b80: .4byte 0x0100002f
_02000b84: .4byte 0xffff001d
_02000b88: .4byte 0x027ff017
_02000b8c: .4byte 0x05100011
_02000b90: .4byte 0x15111011
_02000b94: .4byte 0x0005707d
arm_func_end func_02000ab0

arm_func_start stub_02000b98
stub_02000b98:
	bx lr
arm_func_end stub_02000b98

.section .rodata
ModuleParams:
	.word SDK_AUTOLOAD_LIST
	.word SDK_AUTOLOAD_LIST_END
	.word SDK_AUTOLOAD_START
	.word SDK_STATIC_BSS_START
	.word SDK_STATIC_BSS_END
	.word 0				@ SDK_COMPRESSED_STATIC_END
	.word 0x04027531	@ SDK_VERSION_ID
	.word 0xdec00621	@ SDK_NITROCODE_BE
	.word 0x2106c0de	@ SDK_NITROCODE_LE
	.asciz "[SDK+NINTENDO:BACKUP]"
