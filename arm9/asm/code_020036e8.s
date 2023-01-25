@ code_020036e8.cpp (but in asm)

.include "global.s"

.section .text

	arm_func_start func_020036e8
func_020036e8: @ 0x020036e8
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x48
	ldr r2, _020037f8 @ =0x02270240
	mov r6, r0
	ldr r0, [r2]
	mov r5, r1
	cmp r0, #0
	mov r8, #0
	bne _02003728
	mov r0, #0xc
	bl _ZnwPv
	cmp r0, #0
	beq _02003720
	bl func_0200e694
_02003720:
	ldr r1, _020037f8 @ =0x02270240
	str r0, [r1]
_02003728:
	ldr r0, _020037f8 @ =0x02270240
	mov r1, r6
	ldr r0, [r0]
	bl func_0200eb98
	movs r7, r0
	beq _0200377c
	bl func_0200e4b8
	mov r1, #4
	mov r6, r0
	bl func_02003ab0
	mov r4, r0
	cmp r5, #0
	mov r0, r7
	strne r6, [r5]
	bl func_0200e4b0
	mov r1, r4
	mov r2, r6
	bl func_02003394
	add sp, sp, #0x48
	mov r0, r4
	pop {r4, r5, r6, r7, r8, pc}
_0200377c:
	add r0, sp, #0
	bl func_0203594c
	add r0, sp, #0
	mov r1, r6
	bl func_02035c2c
	cmp r0, #0
	beq _020037e0
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r4, r1, r0
	mov r0, r4
	bl func_02003a84
	mov r8, r0
	add r0, sp, #0
	mov r1, r8
	mov r2, r4
	bl func_02035dc8
	cmp r4, r0
	beq _020037d4
	mov r0, r8
	bl func_02003ae0
	mov r8, #0
_020037d4:
	add r0, sp, #0
	bl func_02035c74
	b _020037e4
_020037e0:
	bl func_02031f14
_020037e4:
	cmp r5, #0
	strne r4, [r5]
	mov r0, r8
	add sp, sp, #0x48
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020037f8: .4byte D_02270240
	arm_func_end func_020036e8

	arm_func_start func_020037fc
func_020037fc: @ 0x020037fc
	ldr ip, _02003808 @ =func_020036e8
	mov r1, #0
	bx ip
	.align 2, 0
_02003808: .4byte func_020036e8
	arm_func_end func_020037fc

	arm_func_start func_0200380c
func_0200380c: @ 0x0200380c
	push {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r7, r1
	mov r6, r2
	bl func_020037fc
	movs r5, r0
	beq _0200388c
	mov r0, r4
	bl func_0203b1dc
	add r0, r4, r0
	ldr r1, _02003894 @ =0x02045df4
	sub r0, r0, #3
	bl func_0203b2f0
	cmp r0, #0
	bne _02003870
	ldr r0, [r5]
	lsr r0, r0, #8
	bl func_02003a84
	mov r4, r0
	mov r0, r5
	mov r1, r4
	bl func_02032ad8
	mov r0, r5
	bl func_02003ae0
	mov r5, r4
_02003870:
	mov r0, r5
	mov r1, r7
	blx r6
	cmp r0, #0
	mov r0, r5
	popne {r3, r4, r5, r6, r7, pc}
	bl func_02003ae0
_0200388c:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02003894: .4byte D_02045df4
	arm_func_end func_0200380c

	arm_func_start func_02003898
func_02003898: @ 0x02003898
	ldr ip, _020038a4 @ =func_0200380c
	ldr r2, _020038a8 @ =0x02018330
	bx ip
	.align 2, 0
_020038a4: .4byte func_0200380c
_020038a8: .4byte func_02018330
	arm_func_end func_02003898

	arm_func_start func_020038ac
func_020038ac: @ 0x020038ac
	ldr ip, _020038b8 @ =func_0200380c
	ldr r2, _020038bc @ =0x02018180
	bx ip
	.align 2, 0
_020038b8: .4byte func_0200380c
_020038bc: .4byte func_02018180
	arm_func_end func_020038ac

	arm_func_start func_020038c0
func_020038c0: @ 0x020038c0
	ldr ip, _020038cc @ =func_0200380c
	ldr r2, _020038d0 @ =0x0201818c
	bx ip
	.align 2, 0
_020038cc: .4byte func_0200380c
_020038d0: .4byte func_0201818c
	arm_func_end func_020038c0

	arm_func_start func_020038d4
func_020038d4: @ 0x020038d4
	ldr ip, _020038e0 @ =func_0200380c
	ldr r2, _020038e4 @ =0x02018430
	bx ip
	.align 2, 0
_020038e0: .4byte func_0200380c
_020038e4: .4byte func_02018430
	arm_func_end func_020038d4

	arm_func_start func_020038e8
func_020038e8: @ 0x020038e8
	ldr ip, _020038f4 @ =func_0200380c
	ldr r2, _020038f8 @ =func_020184f8
	bx ip
	.align 2, 0
_020038f4: .4byte func_0200380c
_020038f8: .4byte func_020184f8
	arm_func_end func_020038e8

	arm_func_start func_020038fc
func_020038fc: @ 0x020038fc
	ldr ip, _02003908 @ =func_0200380c
	ldr r2, _0200390c @ =func_020184f8
	bx ip
	.align 2, 0
_02003908: .4byte func_0200380c
_0200390c: .4byte func_020184f8
	arm_func_end func_020038fc

	arm_func_start func_02003910
func_02003910: @ 0x02003910
	ldr ip, _0200391c @ =func_0200380c
	ldr r2, _02003920 @ =func_02018544
	bx ip
	.align 2, 0
_0200391c: .4byte func_0200380c
_02003920: .4byte func_02018544
	arm_func_end func_02003910

	arm_func_start func_02003924
func_02003924: @ 0x02003924
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	bl func_020037fc
	movs r5, r0
	beq _02003998
	mov r0, r4
	bl func_0203b1dc
	add r0, r4, r0
	ldr r1, _020039a0 @ =0x02045df4
	sub r0, r0, #3
	bl func_0203b2f0
	cmp r0, #0
	bne _02003984
	ldr r0, [r5]
	lsr r0, r0, #8
	bl func_02003a84
	mov r4, r0
	mov r0, r5
	mov r1, r4
	bl func_02032ad8
	mov r0, r5
	bl func_02003ae0
	mov r5, r4
_02003984:
	mov r0, r6
	mov r1, r5
	bl func_0201d098
	mov r0, r5
	pop {r4, r5, r6, pc}
_02003998:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_020039a0: .4byte D_02045df4
	arm_func_end func_02003924
