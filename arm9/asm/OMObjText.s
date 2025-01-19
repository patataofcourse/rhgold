@ OMObjectText class

.include "global.s"

@ TODO: fix IO registers

.section .text

	arm_func_start func_02003e3c
func_02003e3c: @ 0x02003e3c
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	ldr r4, _02003fd4 @ =0x02045e14
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	str r4, [r8]
	bl func_02009e7c
	ldr r1, [sp, #0x44]
	cmp r1, #0
	moveq r1, #1
	movne r1, #0
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	eors r2, r1, r0
	ldreq r1, _02003fd8 @ =0x04001000
	ldreq r0, _02003fdc @ =0x00300010
	ldreq r1, [r1]
	beq _02003e9c
	mov r0, #0x4000000
	ldr r1, [r0]
	ldr r0, _02003fdc @ =0x00300010
_02003e9c:
	and r0, r1, r0
	str r7, [r8, #4]
	asr r0, r0, #0x14
	str r6, [r8, #0x38]
	and r4, r0, #3
	cmp r2, #0
	movne ip, #0x6400000
	ldr r1, [sp, #0x40]
	str r5, [r8, #0x3c]
	mov r0, #4
	str r0, [sp]
	lsl r0, r1, r4
	moveq ip, #0x6600000
	add r1, ip, r0, lsl #5
	ldr r2, [r8, #0x38]
	ldr r3, [r8, #0x3c]
	add r0, r8, #8
	bl func_0201e360
	ldr r1, [r8, #4]
	add r0, r8, #8
	str r0, [r8, #0x20]
	str r1, [r8, #0x24]
	mov r0, #1
	str r0, [r8, #0x28]
	str r0, [r8, #0x2c]
	ldr r1, [r8, #0x38]
	ldr r0, [r8, #0x3c]
	lsl r1, r1, #3
	add r2, r1, r1, lsr #31
	lsl r0, r0, #3
	add r3, r0, r0, lsr #31
	ldr r0, [r8, #0xc]
	ldr r1, [r8, #0x10]
	asr r5, r2, #1
	asr r6, r3, #1
	bl func_0201e3e8
	mov r1, #6
	mul r1, r0, r1
	add r0, r1, #8
	bl func_02003a84
	mov r2, r5
	str r0, [r8, #0x30]
	mov r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	mov r0, #0x300
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	str r5, [sp, #0x10]
	str r0, [sp, #0x14]
	str r5, [sp, #0x18]
	str r4, [sp, #0x1c]
	str r5, [sp, #0x20]
	ldr r0, [r8, #0x30]
	mov r3, r6
	add r1, r8, #8
	bl func_0201e73c
	ldr r2, [r8, #0x1c]
	add r0, r8, #8
	ldr r2, [r2, #4]
	mov r1, r5
	blx r2
	ldr r0, [r8, #0x30]
	bl func_0200acfc
	ldr r1, [sp, #0x44]
	str r0, [r8, #0x34]
	bl func_0200aec4
	ldr r0, [r8, #0x34]
	bl func_0200b2f0
	ldr r0, [r8, #0x34]
	mov r1, #1
	bl func_0200b788
	ldr r0, [r8, #0x34]
	bl func_0200b908
	mov r0, r8
	add sp, sp, #0x24
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02003fd4: .4byte 0x02045e14
_02003fd8: .4byte 0x04001000
_02003fdc: .4byte 0x00300010
	arm_func_end func_02003e3c

	arm_func_start func_02003fe0
func_02003fe0: @ 0x02003fe0
	push {r4, lr}
	ldr r1, _02004008 @ =0x02045e14
	mov r4, r0
	str r1, [r4]
	ldr r0, [r4, #0x34]
	bl func_0200ad44
	ldr r0, [r4, #0x30]
	bl func_02003ae0
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_02004008: .4byte 0x02045e14
	arm_func_end func_02003fe0

	arm_func_start func_0200400c
func_0200400c: @ 0x0200400c
	push {r4, lr}
	ldr r1, _0200403c @ =0x02045e14
	mov r4, r0
	str r1, [r4]
	ldr r0, [r4, #0x34]
	bl func_0200ad44
	ldr r0, [r4, #0x30]
	bl func_02003ae0
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_0200403c: .4byte 0x02045e14
	arm_func_end func_0200400c
