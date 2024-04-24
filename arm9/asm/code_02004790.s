@ code_02004790.c (but in asm)

.include "global.s"

.section .text
	arm_func_start func_02004790
func_02004790: @ 0x02004790
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	ldr r3, _02004928 @ =0x02045e38
	mov r8, r0
	ldr r0, _0200492c @ =0x0203db2c
	str r3, [r8]
	ldrb r4, [r0]
	ldrb r3, [r0, #1]
	movs r6, r2
	strb r4, [sp]
	strb r3, [sp, #1]
	ldrb r2, [r0, #3]
	ldrb r3, [r0, #2]
	mov r7, r1
	strb r2, [sp, #3]
	strb r3, [sp, #2]
	ldrb r1, [r0, #4]
	ldrb r0, [r0, #5]
	add r2, sp, #0
	moveq r6, r2
	strb r0, [sp, #5]
	mov r0, r6
	strb r1, [sp, #4]
	bl strlen
	mov r4, #0
	str r4, [r8, #4]
	ldrsb r1, [r7]
	mov r5, r0
	mov sl, r7
	cmp r1, #0
	beq _02004888
	add sb, sp, #8
	mov fp, r4
_02004814:
	mov r0, sl
	mov r1, r6
	mov r2, r5
	bl strncmp
	cmp r0, #0
	addne r4, r4, #1
	addne sl, sl, #1
	bne _0200487c
	add r0, r4, #1
	bl func_02003a84
	mov r1, r7
	mov r2, r4
	mov sl, r0
	bl strncpy
	ldr r0, [r8, #4]
	mov r1, r0
	add r0, r0, #1
	str sl, [sb, r1, lsl #2]
	str r0, [r8, #4]
	cmp r0, #0x20
	blt _0200486c
	bl func_02031f14
_0200486c:
	add r0, r4, r5
	add r7, r7, r0
	mov sl, r7
	mov r4, fp
_0200487c:
	ldrsb r0, [sl]
	cmp r0, #0
	bne _02004814
_02004888:
	cmp r4, #0
	beq _020048c8
	add r0, r4, #1
	bl func_02003a84
	mov r2, r4
	mov r1, r7
	mov r4, r0
	bl strncpy
	ldr r2, [r8, #4]
	add r1, sp, #8
	add r0, r2, #1
	str r4, [r1, r2, lsl #2]
	str r0, [r8, #4]
	cmp r0, #0x20
	blt _020048c8
	bl func_02031f14
_020048c8:
	ldr r0, [r8, #4]
	cmp r0, #0
	beq _02004914
	lsl r0, r0, #2
	bl func_02003a84
	str r0, [r8, #8]
	ldr r0, [r8, #4]
	mov r3, #0
	cmp r0, #0
	ble _0200491c
	add r2, sp, #8
_020048f4:
	ldr r1, [r2, r3, lsl #2]
	ldr r0, [r8, #8]
	str r1, [r0, r3, lsl #2]
	ldr r0, [r8, #4]
	add r3, r3, #1
	cmp r3, r0
	blt _020048f4
	b _0200491c
_02004914:
	mov r0, #0
	str r0, [r8, #8]
_0200491c:
	mov r0, r8
	add sp, sp, #0x88
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02004928: .4byte 0x02045e38
_0200492c: .4byte 0x0203db2c
	arm_func_end func_02004790

	arm_func_start func_02004930
func_02004930: @ 0x02004930
	push {r3, r4, r5, lr}
	ldr r1, _02004984 @ =0x02045e38
	mov r5, r0
	str r1, [r5]
	ldr r0, [r5, #4]
	mov r4, #0
	cmp r0, #0
	ble _0200496c
_02004950:
	ldr r0, [r5, #8]
	ldr r0, [r0, r4, lsl #2]
	bl func_02003ae0
	ldr r0, [r5, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _02004950
_0200496c:
	cmp r0, #0
	beq _0200497c
	ldr r0, [r5, #8]
	bl func_02003ae0
_0200497c:
	mov r0, r5
	pop {r3, r4, r5, pc}
	.align 2, 0
_02004984: .4byte 0x02045e38
	arm_func_end func_02004930

	arm_func_start func_02004988
func_02004988: @ 0x02004988
	push {r3, r4, r5, lr}
	ldr r1, _020049e4 @ =0x02045e38
	mov r5, r0
	str r1, [r5]
	ldr r0, [r5, #4]
	mov r4, #0
	cmp r0, #0
	ble _020049c4
_020049a8:
	ldr r0, [r5, #8]
	ldr r0, [r0, r4, lsl #2]
	bl func_02003ae0
	ldr r0, [r5, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _020049a8
_020049c4:
	cmp r0, #0
	beq _020049d4
	ldr r0, [r5, #8]
	bl func_02003ae0
_020049d4:
	mov r0, r5
	bl _ZdlPv
	mov r0, r5
	pop {r3, r4, r5, pc}
	.align 2, 0
_020049e4: .4byte 0x02045e38
	arm_func_end func_02004988

	arm_func_start func_020049e8
func_020049e8: @ 0x020049e8
	ldr r0, [r0, #4]
	bx lr
	arm_func_end func_020049e8

	arm_func_start func_020049f0
func_020049f0: @ 0x020049f0
	push {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bmi _02004a0c
	ldr r0, [r5, #4]
	cmp r4, r0
	blt _02004a10
_02004a0c:
	bl func_02031f14
_02004a10:
	ldr r0, [r5, #8]
	ldr r0, [r0, r4, lsl #2]
	pop {r3, r4, r5, pc}
	arm_func_end func_020049f0
