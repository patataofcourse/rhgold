@ code_02001e1c.c (but in asm)

.include "global.s"

@ TODO: fix IO registers

.section .text

	arm_func_start func_02001e1c
func_02001e1c: @ 0x02001e1c
	str r1, [r0]
	mov r2, #0
	str r2, [r0, #4]
	mov r1, #0x3f
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	arm_func_end func_02001e1c

	arm_func_start func_02001e38
func_02001e38: @ 0x02001e38
	push {r3, lr}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _02001e94
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02001e70
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x14]
	adds r1, r2, r1
	str r1, [r0, #4]
	movpl r1, #0
	strpl r1, [r0, #0xc]
	b _02001e94
_02001e70:
	ldr r3, [r0, #4]
	ldr r2, [r0, #0x14]
	mov r1, #0x10000
	sub r2, r3, r2
	rsb r1, r1, #0
	cmp r2, r1
	str r2, [r0, #4]
	movlt r1, #0
	strlt r1, [r0, #0xc]
_02001e94:
	ldr r2, [r0, #4]
	cmp r2, #0
	movgt r2, #0
	bgt _02001eb4
	mov r1, #0x10000
	rsb r1, r1, #0
	cmp r2, r1
	movlt r2, r1
_02001eb4:
	str r2, [r0, #4]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	cmp r1, #0
	ldr r1, [r0, #8]
	beq _02001edc
	ldr r0, _02001eec @ =0x04001050
	asr r2, r2, #0xc
	bl func_0202e658
	pop {r3, pc}
_02001edc:
	ldr r0, _02001ef0 @ =0x04000050
	asr r2, r2, #0xc
	bl func_0202e658
	pop {r3, pc}
	.align 2, 0
_02001eec: .4byte 0x04001050
_02001ef0: .4byte 0x04000050
	arm_func_end func_02001e38

	arm_func_start func_02001ef4
func_02001ef4: @ 0x02001ef4
	lsl r1, r1, #0xc
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	arm_func_end func_02001ef4

	arm_func_start func_02001f08
func_02001f08: @ 0x02001f08
	push {r4, lr}
	mov r4, r0
	cmp r1, #0
	bne _02001f24
	mov r1, #0
	bl func_02001ef4
	pop {r4, pc}
_02001f24:
	mov r0, #0x10000
	rsb r0, r0, #0
	str r0, [r4, #4]
	mov r2, #1
	str r2, [r4, #0xc]
	mov r0, #0x10000
	str r2, [r4, #0x10]
	bl func_0203b648
	str r0, [r4, #0x14]
	pop {r4, pc}
	arm_func_end func_02001f08

	arm_func_start func_02001f4c
func_02001f4c: @ 0x02001f4c
	push {r4, lr}
	mov r4, r0
	cmp r1, #0
	bne _02001f68
	mvn r1, #0xf
	bl func_02001ef4
	pop {r4, pc}
_02001f68:
	mov r2, #0
	str r2, [r4, #4]
	mov r0, #1
	str r0, [r4, #0xc]
	mov r0, #0x10000
	str r2, [r4, #0x10]
	bl func_0203b648
	str r0, [r4, #0x14]
	pop {r4, pc}
	arm_func_end func_02001f4c

	arm_func_start func_02001f8c
func_02001f8c: @ 0x02001f8c
	ldr r0, [r0, #0xc]
	bx lr
	arm_func_end func_02001f8c
