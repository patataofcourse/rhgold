@ string.cpp (but in asm)

.include "global.s"

.section .text

	arm_func_start strcpy
strcpy: @ 0x02001524
	ldrsb r2, [r1]
	mov r3, r0
	cmp r2, #0
	beq _02001548
_02001534:
	ldrsb r2, [r1]
	strb r2, [r0], #1
	ldrsb r2, [r1, #1]!
	cmp r2, #0
	bne _02001534
_02001548:
	mov r1, #0
	strb r1, [r0]
	mov r0, r3
	bx lr
	arm_func_end strcpy

	arm_func_start strncpy
strncpy: @ 0x02001558
	ldrsb r3, [r1]
	mov ip, r0
	cmp r3, #0
	beq _02001588
_02001568:
	ldrsb r3, [r1], #1
	sub r2, r2, #1
	cmp r2, #0
	strb r3, [r0], #1
	ble _02001588
	ldrsb r3, [r1]
	cmp r3, #0
	bne _02001568
_02001588:
	mov r1, #0
	strb r1, [r0]
	mov r0, ip
	bx lr
	arm_func_end strncpy

	arm_func_start strcat
strcat: @ 0x02001598
	ldrsb r2, [r0]
	mov r3, r0
	cmp r2, #0
	beq _020015b4
_020015a8:
	ldrsb r2, [r0, #1]!
	cmp r2, #0
	bne _020015a8
_020015b4:
	ldrsb r2, [r1]
	cmp r2, #0
	beq _020015d4
_020015c0:
	ldrsb r2, [r1]
	strb r2, [r0], #1
	ldrsb r2, [r1, #1]!
	cmp r2, #0
	bne _020015c0
_020015d4:
	mov r1, #0
	strb r1, [r0]
	mov r0, r3
	bx lr
	arm_func_end strcat

	arm_func_start thunk_SDK_strcpy
thunk_SDK_strcpy: @ 0x020015e4
	ldr ip, _020015ec @ SDK_strcpy
	bx ip
	.align 2, 0
_020015ec: .4byte SDK_strcpy
	arm_func_end thunk_SDK_strcpy

	arm_func_start func_020015f0
func_020015f0: @ 0x020015f0
	push {r3, r4, lr}
	sub sp, sp, #0x64
	ldr r2, _02001624 @ =0x02045d1c
	mov r4, r0
	mov r3, r1
	add r0, sp, #0
	mov r1, #0x64
	bl func_020301dc
	add r1, sp, #0
	mov r0, r4
	bl thunk_SDK_strcpy
	add sp, sp, #0x64
	pop {r3, r4, pc}
	.align 2, 0
_02001624: .4byte D_02045d1c
	arm_func_end func_020015f0

	arm_func_start strlen
strlen: @ 0x02001628
	mov r2, #0
	cmp r0, #0
	moveq r0, r2
	bxeq lr
	ldrsb r1, [r0]
	cmp r1, #0
	beq _02001654
_02001644:
	add r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _02001644
_02001654:
	mov r0, r2
	bx lr
	arm_func_end strlen

	arm_func_start strncmp
strncmp: @ 0x0200165c
	ldrsb ip, [r1]
	ldrsb r3, [r0]
	cmp r3, ip
	bne _02001698
_0200166c:
	subs r2, r2, #1
	moveq r0, #0
	bxeq lr
	cmp r3, #0
	cmpeq ip, #0
	moveq r0, #0
	bxeq lr
	ldrsb ip, [r1, #1]!
	ldrsb r3, [r0, #1]!
	cmp r3, ip
	beq _0200166c
_02001698:
	mov r0, #1
	bx lr
	arm_func_end strncmp

	arm_func_start func_020016a0
func_020016a0: @ 0x020016a0
	push {r4, r5, r6, lr}
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl strlen
	ldrsb r1, [r6]
	mov r4, r0
	cmp r1, #0
	beq _020016ec
_020016c4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl strncmp
	cmp r0, #0
	moveq r0, r6
	popeq {r4, r5, r6, pc}
	ldrsb r0, [r6, #1]!
	cmp r0, #0
	bne _020016c4
_020016ec:
	mov r0, #0
	pop {r4, r5, r6, pc}
	arm_func_end func_020016a0

	arm_func_start func_020016f4
func_020016f4: @ 0x020016f4
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, r2
	mov sl, r0
	mov r7, r3
	mov r0, r8
	mov sb, r1
	ldr r6, [sp, #0x28]
	bl strlen
	mov r5, r0
	mov r0, r7
	bl strlen
	ldrsb r1, [sb]
	mov r4, r0
	sub r6, r6, #1
	cmp r1, #0
	beq _020017a4
	mov fp, #0
_02001738:
	mov r0, sb
	mov r1, r8
	mov r2, r5
	bl strncmp
	cmp r0, #0
	beq _02001760
	ldrsb r0, [sb], #1
	sub r6, r6, #1
	strb r0, [sl], #1
	b _0200178c
_02001760:
	mov r1, fp
	cmp r4, #0
	ble _02001780
_0200176c:
	ldrsb r0, [r7, r1]
	strb r0, [sl, r1]
	add r1, r1, #1
	cmp r1, r4
	blt _0200176c
_02001780:
	add sl, sl, r4
	add sb, sb, r5
	sub r6, r6, r4
_0200178c:
	cmp r6, #0
	bge _02001798
	bl func_02031f14
_02001798:
	ldrsb r0, [sb]
	cmp r0, #0
	bne _02001738
_020017a4:
	mov r0, #0
	strb r0, [sl]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end func_020016f4
