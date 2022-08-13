@ CDepth2D.cpp but asm

.include "global.s"

.section .text

	arm_func_start _ZN8CDepth2DC1Ev
_ZN8CDepth2DC1Ev: @ 0x02001f94
	ldr r1, _02001fa0 @ =0x02045dbc
	str r1, [r0]
	bx lr
	.align 2, 0
_02001fa0: .4byte 0x02045dbc
	arm_func_end _ZN8CDepth2DC1Ev

	arm_func_start _ZN8CDepth2DD2Ev
_ZN8CDepth2DD2Ev: @ 0x02001fa4
	bx lr
	arm_func_end _ZN8CDepth2DD2Ev

	arm_func_start _ZN8CDepth2DD0Ev
_ZN8CDepth2DD0Ev: @ 0x02001fa8
	push {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	pop {r4, pc}
	arm_func_end _ZN8CDepth2DD0Ev
