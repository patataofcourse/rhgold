@ memory.cpp but asm

.include "global.s"

.section .text

	arm_func_start _ZnwPv
_ZnwPv: @ 0x020039a4
	ldr r2, _020039bc @ =D_02263ce0
	ldr ip, _020039c0 @ =func_020178b4
	mov r1, r0
	ldr r0, [r2, #8]
	mov r2, #4
	bx ip
	.align 2, 0
_020039bc: .4byte D_02263ce0
_020039c0: .4byte malloc
	arm_func_end _ZnwPv

	arm_func_start _ZnaPv
_ZnaPv: @ 0x020039c4
	ldr r2, _020039dc @ =D_02263ce0
	ldr ip, _020039e0 @ =func_020178b4
	mov r1, r0
	ldr r0, [r2, #8]
	mov r2, #4
	bx ip
	.align 2, 0
_020039dc: .4byte D_02263ce0
_020039e0: .4byte malloc
	arm_func_end _ZnaPv

	arm_func_start _ZdlPv
_ZdlPv: @ 0x020039e4
	push {r3, lr}
	movs r1, r0
	popeq {r3, pc}
	ldr r0, _02003a00 @ =D_02263ce0
	ldr r0, [r0, #8]
	bl free
	pop {r3, pc}
	.align 2, 0
_02003a00: .4byte D_02263ce0
	arm_func_end _ZdlPv

	arm_func_start _ZdaPv
_ZdaPv: @ 0x02003a04
	push {r3, lr}
	movs r1, r0
	popeq {r3, pc}
	ldr r0, _02003a20 @ =D_02263ce0
	ldr r0, [r0, #8]
	bl free
	pop {r3, pc}
	.align 2, 0
_02003a20: .4byte D_02263ce0
	arm_func_end _ZdaPv

	arm_func_start func_02003a24
func_02003a24: @ 0x02003a24
	push {r4, lr}
	mov r0, #0
	bl func_0203122c
	mov r4, r0
	mov r0, #0
	bl func_02031218
	add r1, r4, #0xf
	bic r2, r0, #0xf
	bic r0, r1, #0xf
	sub r4, r2, r0
	mov r1, r4
	mov r0, #0
	mov r2, #0x10
	bl func_020313f4
	mov r1, r4
	mov r2, #0
	bl func_0201787c
	ldr r1, _02003a80 @ =D_02263ce0
	str r0, [r1, #8]
	mov r0, #0
	strb r0, [r1]
	bl func_02003b30
	pop {r4, pc}
	.align 2, 0
_02003a80: .4byte D_02263ce0
	arm_func_end func_02003a24

	arm_func_start func_02003a84
func_02003a84: @ 0x02003a84
	push {r4, lr}
	movs r4, r0
	bne _02003a94
	bl func_02031f14
_02003a94:
	ldr r0, _02003aac @ =D_02263ce0
	mov r1, r4
	ldr r0, [r0, #8]
	mov r2, #4
	bl malloc
	pop {r4, pc}
	.align 2, 0
_02003aac: .4byte D_02263ce0
	arm_func_end func_02003a84

	arm_func_start func_02003ab0
func_02003ab0: @ 0x02003ab0
	push {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02003ac4
	bl func_02031f14
_02003ac4:
	ldr r0, _02003adc @ =D_02263ce0
	mov r1, r5
	ldr r0, [r0, #8]
	mov r2, r4
	bl malloc
	pop {r3, r4, r5, pc}
	.align 2, 0
_02003adc: .4byte D_02263ce0
	arm_func_end func_02003ab0

	arm_func_start func_02003ae0
func_02003ae0: @ 0x02003ae0
	push {r4, lr}
	mov r4, r0
	bl func_0201736c
	ldr r1, _02003b14 @ =D_02263ce0
	ldr r1, [r1, #8]
	cmp r0, r1
	beq _02003b00
	bl func_02031f14
_02003b00:
	ldr r0, _02003b14 @ =D_02263ce0
	mov r1, r4
	ldr r0, [r0, #8]
	bl free
	pop {r4, pc}
	.align 2, 0
_02003b14: .4byte D_02263ce0
	arm_func_end func_02003ae0

	arm_func_start func_02003b18
func_02003b18: @ 0x02003b18
	ldr r0, _02003b28 @ =D_02263ce0
	ldr ip, _02003b2c @ =func_02017930
	ldr r0, [r0, #8]
	bx ip
	.align 2, 0
_02003b28: .4byte D_02263ce0
_02003b2c: .4byte func_02017930
	arm_func_end func_02003b18

	arm_func_start func_02003b30
func_02003b30: @ 0x02003b30
	ldr r2, _02003b44 @ =D_02263ce0
	ldr ip, _02003b48 @ =func_02017920
	mov r1, r0
	ldr r0, [r2, #8]
	bx ip
	.align 2, 0
_02003b44: .4byte D_02263ce0
_02003b48: .4byte func_02017920
	arm_func_end func_02003b30

	arm_func_start func_02003b4c
func_02003b4c: @ 0x02003b4c
	push {r3, lr}
	bl func_02003b18
	ldr r1, _02003b70 @ =D_02263ce0
	ldr r2, _02003b74 @ =D_02263e80
	ldrb ip, [r1]
	add r3, ip, #1
	strb r3, [r1]
	strb r0, [r2, ip]
	pop {r3, pc}
	.align 2, 0
_02003b70: .4byte D_02263ce0
_02003b74: .4byte D_02263e80
	arm_func_end func_02003b4c

	arm_func_start func_02003b78
func_02003b78: @ 0x02003b78
	push {r4, lr}
	mov r4, r0
	bl func_02003b4c
	mov r0, r4
	bl func_02003b30
	pop {r4, pc}
	arm_func_end func_02003b78

	arm_func_start func_02003b90
func_02003b90: @ 0x02003b90
	ldr r1, _02003bb4 @ =D_02263ce0
	ldr r0, _02003bb8 @ =D_02263e80
	ldrb r2, [r1]
	ldr ip, _02003bbc @ =func_02003b30
	sub r3, r2, #1
	and r2, r3, #0xff
	ldrb r0, [r0, r2]
	strb r3, [r1]
	bx ip
	.align 2, 0
_02003bb4: .4byte D_02263ce0
_02003bb8: .4byte D_02263e80
_02003bbc: .4byte func_02003b30
	arm_func_end func_02003b90

	arm_func_start func_02003bc0
func_02003bc0: @ 0x02003bc0
	push {r3, r4, r5, lr}
	ldr r1, _02003c14 @ =D_02263ce0
	mov r4, r0
	ldr r1, [r1, #4]
	mov r5, r2
	cmp r1, #0
	popne {r3, r4, r5, pc}
	bl func_02017978
	cmp r0, r5
	popne {r3, r4, r5, pc}
	ldr r0, _02003c14 @ =D_02263ce0
	ldr r3, [r0, #0xc]
	cmp r3, #0x64
	movge r1, #1
	strge r1, [r0, #4]
	popge {r3, r4, r5, pc}
	ldr r2, _02003c18 @ =D_02263cf0
	add r1, r3, #1
	str r4, [r2, r3, lsl #2]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02003c14: .4byte D_02263ce0
_02003c18: .4byte D_02263cf0
	arm_func_end func_02003bc0

	arm_func_start func_02003c1c
func_02003c1c: @ 0x02003c1c
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r7, #0
	ldr r4, _02003c88 @ =D_02263cf0
	ldr r6, _02003c8c @ =func_02003bc0
	ldr sl, _02003c90 @ =D_02263ce0
	mov sb, r0
	mov r5, r7
_02003c38:
	str r7, [sl, #0xc]
	str r7, [sl, #4]
	ldr r0, [sl, #8]
	mov r1, r6
	mov r2, sb
	bl func_02017938
	ldr r0, [sl, #0xc]
	mov r8, r5
	cmp r0, #0
	ble _02003c78
_02003c60:
	ldr r0, [r4, r8, lsl #2]
	bl func_02003ae0
	ldr r0, [sl, #0xc]
	add r8, r8, #1
	cmp r8, r0
	blt _02003c60
_02003c78:
	ldr r0, [sl, #4]
	cmp r0, #0
	bne _02003c38
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02003c88: .4byte D_02263cf0
_02003c8c: .4byte func_02003bc0
_02003c90: .4byte D_02263ce0
	arm_func_end func_02003c1c
