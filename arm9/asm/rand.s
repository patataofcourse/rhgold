@ rand.cpp (but in asm)

.include "global.s"

.section .text

	arm_func_start func_02004d08
func_02004d08: @ 0x02004d08
	ldr r0, _02004d38
	mov r3, #0x0
	str r3, [r0, #0x0]
	ldr r1, _02004d3c
	str r3, [r0, #0x4]
	ldr r2, _02004d40
	str r1, [r0, #0x8]
	ldr r1, _02004d44
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	str r3, [r0, #0x14]
	bx lr
	.align 2, 0
_02004d38: .4byte D_02263eb0
_02004d3c: .4byte 0x6c078965
_02004d40: .4byte 0x5d588b65
_02004d44: .4byte 0x00269ec3
	arm_func_end func_02004d08

	arm_func_start func_02004d48
func_02004d48: @ 0x02004d48
	push {r4, lr}
	ldr r1, _02004d94
	ldr r3, [r1, #0x0]
	ldmib r1, {r2, r12}
	umull r4, lr, r12, r3
	mla lr, r12, r2, lr
	ldr r2, [r1, #0xc]
	ldr r12, [r1, #0x10]
	mla lr, r2, r3, lr
	ldr r2, [r1, #0x14]
	adds r3, r12, r4
	adc r2, r2, lr
	str r3, [r1, #0x0]
	str r2, [r1, #0x4]
	cmp r0, #0x0
	umullne r1, r0, r2, r0
	movne r2, r0
	mov r0, r2
	pop {r4, pc}
	.align 2, 0
_02004d94: .4byte D_02263eb0
	arm_func_end func_02004d48
