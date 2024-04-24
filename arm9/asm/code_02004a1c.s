@ code_02004a1c.c (but in asm)

.include "global.s"

.section .text
	arm_func_start func_02004a1c
func_02004a1c: @ 0x02004a1c
	mov r1, #0
	str r1, [r0, #0x28]
	bx lr
	arm_func_end func_02004a1c

	arm_func_start func_02004a28
func_02004a28: @ 0x02004a28
	str r1, [r0, #0x28]
	bx lr
	arm_func_end func_02004a28

	arm_func_start func_02004a30
func_02004a30: @ 0x02004a30
	str r1, [r0, #0x28]
	bx lr
	arm_func_end func_02004a30

	arm_func_start func_02004a38
func_02004a38: @ 0x02004a38
	push {r3, lr}
	sub sp, sp, #0x18
	ldr ip, [sp, #0x20]
	ldr lr, [sp, #0x28]
	stm sp, {r3, ip}
	mov r3, #0
	ldr ip, [sp, #0x24]
	str r3, [sp, #8]
	str ip, [sp, #0xc]
	ldr ip, [sp, #0x2c]
	str lr, [sp, #0x10]
	str ip, [sp, #0x14]
	bl func_02004a74
	add sp, sp, #0x18
	pop {r3, pc}
	arm_func_end func_02004a38

	arm_func_start func_02004a74
func_02004a74: @ 0x02004a74
	push {r4, lr}
	mov r4, r0
	str r1, [r4, #0x10]
	str r2, [r4, #0x14]
	ldr r0, [sp, #0x14]
	str r3, [r4, #0x18]
	str r0, [r4]
	ldr r0, [r4, #0x28]
	ldr lr, [sp, #0xc]
	cmp r0, #0
	ldr r0, [r4]
	beq _02004aac
	sub ip, lr, r2
	b _02004ab0
_02004aac:
	sub ip, r2, lr
_02004ab0:
	cmp r0, ip
	ldr r0, [sp, #8]
	strlt ip, [r4]
	sub r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4, #0x28]
	ldr r1, [r4]
	cmp r0, #0
	subne r2, r2, lr
	subeq r2, lr, r2
	add r1, r1, r2
	ldr r0, [sp, #0x10]
	str r1, [r4, #8]
	sub r0, r0, r3
	str r0, [r4, #0xc]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r1, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldr r1, [r4, #8]
	mov r0, r4
	mov r2, #0xa
	bl func_02004cc8
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x20]
	mov r0, r4
	mov r2, #0xa
	bl func_02004cc8
	str r0, [r4, #0x30]
	ldr r2, [r4, #8]
	ldr r0, [r4, #0x2c]
	ldr r1, _02004b90 @ =0x040002b0
	asr r0, r2, r0
	str r0, [r4, #8]
	ldr r3, [r4]
	ldr r2, [r4, #0x2c]
	mov r0, #0
	asr r3, r3, r2
	str r3, [r4]
	ldr r2, [r4, #8]
	mul r2, r3, r2
	strh r0, [r1]
	lsl r0, r2, #8
	str r0, [r1, #8]
_02004b60:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _02004b60
	ldr r1, _02004b90 @ =0x040002b0
_02004b70:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _02004b70
	ldr r0, _02004b94 @ =0x040002b4
	ldr r0, [r0]
	lsl r0, r0, #4
	str r0, [r4, #0x24]
	pop {r4, pc}
	.align 2, 0
_02004b90: .4byte 0x040002b0
_02004b94: .4byte 0x040002b4
	arm_func_end func_02004a74

	arm_func_start func_02004b98
func_02004b98: @ 0x02004b98
	push {r4, lr}
	mov r4, r0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #4]
	asr r0, r0, r2
	mul r0, r1, r0
	ldr r1, [r4, #0x20]
	asr r1, r1, r2
	bl func_0203b648
	ldr r1, [r4, #0x10]
	add r0, r1, r0
	pop {r4, pc}
	arm_func_end func_02004b98

	arm_func_start func_02004bcc
func_02004bcc: @ 0x02004bcc
	push {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r7, [r8, #0x24]
	ldr r6, [r8, #0x30]
	ldr r3, [r8, #0x1c]
	ldr r4, [r8]
	lsl r0, r7, #1
	ldr r1, [r8, #8]
	add r0, r0, r4, lsl #8
	asr r5, r3, r6
	add r1, r0, r1, lsl #8
	ldr r2, [r8, #0x20]
	mul r0, r1, r5
	asr r6, r2, r6
	mov r1, r6
	bl func_0203b648
	mul r0, r5, r0
	mov r1, r6
	bl func_0203b648
	add r1, r7, r4, lsl #8
	lsl r1, r1, #1
	mov r4, r0
	mul r0, r5, r1
	mov r1, r6
	bl func_0203b648
	ldr r1, [r8, #0x2c]
	sub r2, r4, r0
	cmp r1, #8
	subhs r0, r1, #8
	lslhs r1, r2, r0
	rsblo r0, r1, #8
	asrlo r1, r2, r0
	ldr r0, [r8, #0x28]
	cmp r0, #0
	ldr r0, [r8, #0x14]
	rsbne r1, r1, #0
	add r0, r0, r1
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end func_02004bcc

	arm_func_start func_02004c64
func_02004c64: @ 0x02004c64
	push {r4, lr}
	mov r4, r0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0xc]
	asr r0, r0, r2
	mul r0, r1, r0
	ldr r1, [r4, #0x20]
	asr r1, r1, r2
	bl func_0203b648
	ldr r1, [r4, #0x18]
	add r0, r1, r0
	pop {r4, pc}
	arm_func_end func_02004c64

	arm_func_start func_02004c98
func_02004c98: @ 0x02004c98
	str r1, [r0, #0x1c]
	bx lr
	arm_func_end func_02004c98

	arm_func_start func_02004ca0
func_02004ca0: @ 0x02004ca0
	ldr r2, [r0, #0x1c]
	add r1, r2, r1
	str r1, [r0, #0x1c]
	bx lr
	arm_func_end func_02004ca0

	arm_func_start func_02004cb0
func_02004cb0: @ 0x02004cb0
	ldr r1, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	cmp r1, r0
	movge r0, #1
	movlt r0, #0
	bx lr
	arm_func_end func_02004cb0

	arm_func_start func_02004cc8
func_02004cc8: @ 0x02004cc8
	mov r0, #1
	lsl r0, r0, r2
	cmp r1, #0
	rsblt r1, r1, #0
	sub r0, r0, #1
	cmp r1, r0
	mov r0, #0
	bxls lr
	mov ip, #1
_02004cec:
	add r0, r0, #1
	add r3, r2, r0
	lsl r3, ip, r3
	sub r3, r3, #1
	cmp r1, r3
	bhi _02004cec
	bx lr
	arm_func_end func_02004cc8
