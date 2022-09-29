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
