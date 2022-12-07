@ CList.cpp but asm

.include "global.s"

.section .text

	arm_func_start func_02003568
func_02003568: @ 0x02003568
	push {r4, lr}
	ldr r1, _02003584 @ =_02045dec
	mov r4, r0
	str r1, [r4]
	bl func_020035f0
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_02003584: .4byte D_02045dec
	arm_func_end func_02003568

	arm_func_start func_02003588
func_02003588: @ 0x02003588
	push {r4, lr}
	ldr r1, _020035a4 @ =_02045dec
	mov r4, r0
	str r1, [r4]
	bl func_020036a4
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_020035a4: .4byte D_02045dec
	arm_func_end func_02003588

	arm_func_start func_020035a8
func_020035a8: @ 0x020035a8
	push {r4, lr}
	ldr r1, _020035cc @ =D_02045dec
	mov r4, r0
	str r1, [r4]
	bl func_020036a4
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_020035cc: .4byte D_02045dec
	arm_func_end func_020035a8
_020035d0:
	.byte 0x10, 0x40, 0x2d, 0xe9, 0x10, 0x10, 0x9f, 0xe5, 0x00, 0x40, 0xa0, 0xe1, 0x00, 0x10, 0x84, 0xe5
	.byte 0x2f, 0x00, 0x00, 0xeb, 0x04, 0x00, 0xa0, 0xe1, 0x10, 0x80, 0xbd, 0xe8, 0xec, 0x5d, 0x04, 0x02

	arm_func_start func_020035f0
func_020035f0: @ 0x020035f0
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end func_020035f0

	arm_func_start func_02003608
func_02003608: @ 0x02003608
	push {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	bne _0200361c
	bl func_02031f14
_0200361c:
	str r4, [r5, #4]
	ldr r1, [r4]
	mov r2, #0
	cmp r1, #0
	beq _02003650
	ldr r3, [r5, #0x10]
_02003634:
	ldr r0, [r1, #0x10]
	mov r2, r1
	cmp r3, r0
	bge _02003650
	ldr r1, [r1, #0xc]
	cmp r1, #0
	bne _02003634
_02003650:
	cmp r1, #0
	beq _0200367c
	ldr r0, [r1, #8]
	str r0, [r5, #8]
	str r1, [r5, #0xc]
	str r5, [r1, #8]
	ldr r0, [r5, #8]
	cmp r0, #0
	strne r5, [r0, #0xc]
	streq r5, [r4]
	pop {r3, r4, r5, pc}
_0200367c:
	cmp r2, #0
	mov r0, #0
	streq r5, [r4]
	streq r0, [r5, #8]
	streq r0, [r5, #0xc]
	popeq {r3, r4, r5, pc}
	str r5, [r2, #0xc]
	str r2, [r5, #8]
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	arm_func_end func_02003608

	arm_func_start func_020036a4
func_020036a4: @ 0x020036a4
	ldr r3, [r0, #4]
	cmp r3, #0
	bxeq lr
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	cmp r2, #0
	strne r1, [r2, #0xc]
	streq r1, [r3]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	ldrne r1, [r0, #8]
	strne r1, [r2, #8]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	bx lr
	arm_func_end func_020036a4
