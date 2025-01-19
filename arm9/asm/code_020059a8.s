@ code_020059a8.c (but in asm)

.include "global.s"

    arm_func_start func_020059a8
func_020059a8: @ 0x020059a8
	ldrh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	ldrh r1, [r0]
	cmp r1, #8
	movhs r1, #0
	strhsh r1, [r0]
	bx lr
	arm_func_end func_020059a8

    arm_func_end func_020059a8
func_020059c8: @ 0x020059c8
	push {r3, lr}
	cmp r0, #0x10
	cmpeq r1, #0
	popne {r3, pc}
	ldr r0, _02005a38 @ =0x02263ec8
	ldr r1, [r0, #0x20]
	cmp r1, #0
	beq _020059fc
	strh r2, [r0, #0xa]
	ldrh r3, [r0, #0xa]
	mov r1, #0
	strh r3, [r0, #4]
	str r1, [r0, #0x20]
_020059fc:
	ldr r0, _02005a38 @ =0x02263ec8
	ldrh r0, [r0, #0xa]
	cmp r0, r2
	beq _02005a10
	bl func_02031f14
_02005a10:
	ldr r0, _02005a3c @ =0x02263ed2
	bl func_020059a8
	ldr r0, _02005a38 @ =0x02263ec8
	ldrh r1, [r0, #0xa]
	ldrh r0, [r0, #4]
	cmp r1, r0
	popne {r3, pc}
	ldr r0, _02005a40 @ =0x02263ecc
	bl func_020059a8
	pop {r3, pc}
	.align 2, 0
_02005a38: .4byte D_02263ec8
_02005a3c: .4byte D_02263ed2
_02005a40: .4byte D_02263ecc
	arm_func_end func_020059c8


	arm_func_start func_02005a44
func_02005a44: @ 0x02005a44
	push {r3, lr}
	sub sp, sp, #8
	ldr r0, _02005ad4 @ =0x02263ec8
	mov r1, #1
	str r1, [r0, #0x20]
	mov r1, #0
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #4]
	strh r1, [r0, #0xa]
	bl func_02005ae0
	bl func_02031bec
	bl func_020372ec
	add r0, sp, #0
	bl func_02037364
	cmp r0, #0
	beq _02005a90
	add r0, sp, #0
	bl func_020373f8
_02005a90:
	ldr r0, _02005ad8 @ =func_020059c8
	bl func_02037520
	ldr r2, _02005adc @ =0x02263efc
	mov r0, #0
	mov r1, #4
	mov r3, #8
	bl func_02037540
	mov r0, #2
	bl func_02037950
	mov r0, #2
	bl func_02037968
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r3, pc}
	bl func_02031f14
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02005ad4: .4byte D_02263ec8
_02005ad8: .4byte func_020059c8
_02005adc: .4byte D_02263efc
	arm_func_end func_02005a44

	arm_func_start func_02005ae0
func_02005ae0: @ 0x02005ae0
	ldr r0, _02005b0c @ =0x02263ec8
	mov r1, #0
	strh r1, [r0, #0xe]
	str r1, [r0, #0x18]
	strh r1, [r0, #2]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0x30]
	strh r1, [r0, #0x2e]
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0
_02005b0c: .4byte D_02263ec8
	arm_func_end func_02005ae0

	arm_func_start func_02005b10
func_02005b10: @ 0x02005b10
	push {r4, r5, r6, lr}
	ldr r3, _02005b68 @ =0x02263ec8
	mov r6, r0
	ldr r0, [r3, #0x1c]
	mov r5, r1
	mov r4, r2
	cmp r0, #8
	blt _02005b34
	bl func_02031f14
_02005b34:
	ldr r0, _02005b68 @ =0x02263ec8
	ldr ip, _02005b6c @ =0x02263f7c
	ldr r1, [r0, #0x1c]
	mov r2, #0
	add lr, ip, r1, lsl #3
	strh r6, [lr, #4]
	lsl r3, r1, #3
	strh r5, [ip, r3]
	strh r4, [lr, #2]
	add r1, r1, #1
	strh r2, [lr, #6]
	str r1, [r0, #0x1c]
	pop {r4, r5, r6, pc}
	.align 2, 0
_02005b68: .4byte D_02263ec8
_02005b6c: .4byte D_02263f7c
	arm_func_end func_02005b10


	arm_func_start func_02005b70
func_02005b70: @ 0x02005b70
	push {r3, lr}
	ldr r2, _02005c44 @ =0x02263ec8
	ldrh r1, [r2, #0xe]
	cmp r1, #0
	beq _02005bc8
	sub r1, r1, #1
	strh r1, [r2, #0xe]
	ldr r1, [r2, #0x28]
	cmp r1, #0
	beq _02005ba8
	ldrh r1, [r0, #4]
	cmp r1, #0
	moveq r1, #0x14
	streqh r1, [r2, #0xe]
_02005ba8:
	ldrh ip, [r0, #4]
	ldr r3, _02005c44 @ =0x02263ec8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	str ip, [r3, #0x28]
	bl func_02005b10
	pop {r3, pc}
_02005bc8:
	ldrh r1, [r0, #4]
	cmp r1, #0
	bne _02005be8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl func_02005b10
	pop {r3, pc}
_02005be8:
	ldrh r1, [r0, #6]
	tst r1, #3
	beq _02005c08
	mov r0, #0
	mov r1, r0
	mov r2, r0
	bl func_02005b10
	pop {r3, pc}
_02005c08:
	mov ip, #1
	str ip, [r2, #0x18]
	ldrh r3, [r0]
	mov r1, #0
	strh r3, [r2, #2]
	ldrh r3, [r0, #2]
	mov r0, ip
	strh r3, [r2, #0xc]
	str r1, [r2, #0x10]
	str r1, [r2, #0x24]
	str r1, [r2, #0x14]
	ldrh r1, [r2, #2]
	ldrh r2, [r2, #0xc]
	bl func_02005b10
	pop {r3, pc}
	.align 2, 0
_02005c44: .4byte D_02263ec8
	arm_func_end func_02005b70

	arm_func_start func_02005c48
func_02005c48: @ 0x02005c48
	push {r4, lr}
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _02005e00
	ldrh r1, [r0, #6]
	tst r1, #3
	beq _02005c84
	ldr r1, _02005e30 @ =0x02263ec8
	ldr r2, [r1, #0x14]
	add r2, r2, #1
	str r2, [r1, #0x14]
	cmp r2, #2
	movge r2, #0
	strge r2, [r1, #0x24]
	strge r2, [r1, #0x10]
_02005c84:
	ldrh r3, [r0, #6]
	tst r3, #1
	ldreqh r4, [r0]
	beq _02005ca4
	ldr r1, _02005e30 @ =0x02263ec8
	ldrh r2, [r1, #2]
	ldr r1, [r1, #0x24]
	add r4, r2, r1
_02005ca4:
	tst r3, #2
	ldreqh r2, [r0, #2]
	beq _02005cc0
	ldr r0, _02005e30 @ =0x02263ec8
	ldrh r1, [r0, #0xc]
	ldr r0, [r0, #0x10]
	add r2, r1, r0
_02005cc0:
	ldr r1, _02005e30 @ =0x02263ec8
	ldrh r0, [r1, #2]
	ldr r3, [r1, #0x24]
	sub r4, r4, r0
	str r4, [r1, #0x24]
	cmp r4, #0
	subgt r4, r4, #1
	strgt r4, [r1, #0x24]
	ldr r1, _02005e30 @ =0x02263ec8
	sub ip, r3, #5
	ldr r4, [r1, #0x24]
	add r3, r3, #5
	cmp r4, #0
	addlt r4, r4, #1
	strlt r4, [r1, #0x24]
	ldr r1, _02005e30 @ =0x02263ec8
	ldr r1, [r1, #0x24]
	cmp r1, r3
	bgt _02005d18
	cmp r1, ip
	movge ip, r1
	mov r3, ip
_02005d18:
	cmp r3, #0x14
	movgt r3, #0x14
	bgt _02005d30
	mvn r1, #0x13
	cmp r3, r1
	movlt r3, r1
_02005d30:
	ldr lr, _02005e30 @ =0x02263ec8
	str r3, [lr, #0x24]
	ldrh r1, [lr, #0xc]
	ldr ip, [lr, #0x10]
	sub r4, r2, r1
	str r4, [lr, #0x10]
	cmp r4, #0
	subgt r4, r4, #1
	strgt r4, [lr, #0x10]
	ldr lr, _02005e30 @ =0x02263ec8
	sub r2, ip, #5
	ldr r4, [lr, #0x10]
	add ip, ip, #5
	cmp r4, #0
	addlt r4, r4, #1
	strlt r4, [lr, #0x10]
	ldr lr, _02005e30 @ =0x02263ec8
	ldr lr, [lr, #0x10]
	cmp lr, ip
	bgt _02005d8c
	cmp lr, r2
	movge r2, lr
	mov ip, r2
_02005d8c:
	cmp ip, #0x14
	movgt ip, #0x14
	bgt _02005da4
	mvn r2, #0x13
	cmp ip, r2
	movlt ip, r2
_02005da4:
	ldr r2, _02005e30 @ =0x02263ec8
	add r3, r0, r3
	cmp r3, #0xff
	str ip, [r2, #0x10]
	movgt r3, #0xff
	bgt _02005dc4
	cmp r3, #0
	movlt r3, #0
_02005dc4:
	ldr r0, _02005e30 @ =0x02263ec8
	add r1, r1, ip
	cmp r1, #0xc0
	strh r3, [r0, #2]
	movgt r1, #0xc0
	bgt _02005de4
	cmp r1, #0
	movlt r1, #0
_02005de4:
	ldr r2, _02005e30 @ =0x02263ec8
	mov r0, #1
	strh r1, [r2, #0xc]
	ldrh r1, [r2, #2]
	ldrh r2, [r2, #0xc]
	bl func_02005b10
	pop {r4, pc}
_02005e00:
	mov r0, #0
	ldr r3, _02005e30 @ =0x02263ec8
	mov r1, r0
	mov r2, r0
	str r0, [r3, #0x18]
	bl func_02005b10
	ldr r0, _02005e30 @ =0x02263ec8
	mov r1, #0x14
	strh r1, [r0, #0xe]
	mov r1, #0
	str r1, [r0, #0x28]
	pop {r4, pc}
	.align 2, 0
_02005e30: .4byte D_02263ec8
	arm_func_end func_02005c48


	arm_func_start func_02005e34
func_02005e34: @ 0x02005e34
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02005e94 @ =0x02263ec8
	mov r0, #0
	str r0, [r4, #0x1c]
	ldrh r1, [r4, #6]
	strh r1, [sp]
	ldrh r7, [r4, #8]
	cmp r1, r7
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r6, _02005e98 @ =0x02263f3c
	add r5, sp, #0
_02005e60:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	add r0, r6, r1, lsl #3
	beq _02005e78
	bl func_02005c48
	b _02005e7c
_02005e78:
	bl func_02005b70
_02005e7c:
	mov r0, r5
	bl func_020059a8
	ldrh r1, [sp]
	cmp r1, r7
	bne _02005e60
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02005e94: .4byte D_02263ec8
_02005e98: .4byte D_02263f3c
	arm_func_end func_02005e34

	arm_func_start func_02005e9c
func_02005e9c: @ 0x02005e9c
	ldr r0, _02005ec4 @ =0x02263ec8
	mov r1, #0
	ldr r2, [r0, #0x18]
	strh r2, [r0, #0x30]
	ldrh r2, [r0, #2]
	strh r2, [r0, #0x2c]
	ldrh r2, [r0, #0xc]
	strh r2, [r0, #0x2e]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0
_02005ec4: .4byte D_02263ec8
	arm_func_end func_02005e9c


	arm_func_start func_02005ec8
func_02005ec8: @ 0x02005ec8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _02005f5c @ =0x04000208
	ldr r0, _02005f60 @ =0x02263ec8
	ldrh r2, [r3]
	mov r1, #0
	strh r1, [r3]
	str r2, [sp, #4]
	ldrh r1, [r0, #4]
	strh r1, [r0, #6]
	ldrh r1, [r0, #0xa]
	strh r1, [r0, #8]
	ldrh r1, [r0, #0xa]
	strh r1, [r0, #4]
	ldrh r1, [r3]
	ldr r1, [sp, #4]
	strh r1, [r3]
	ldrh r1, [r0, #6]
	strh r1, [sp]
	ldrh r7, [r0, #8]
	cmp r1, r7
	beq _02005f4c
	ldr r6, _02005f64 @ =0x02263f3c
	ldr r5, _02005f68 @ =0x02263efc
	add r4, sp, #0
_02005f2c:
	add r0, r6, r1, lsl #3
	add r1, r5, r1, lsl #3
	bl func_0203782c
	mov r0, r4
	bl func_020059a8
	ldrh r1, [sp]
	cmp r1, r7
	bne _02005f2c
_02005f4c:
	bl func_02005e34
	bl func_02005e9c
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02005f5c: .4byte REG_IME
_02005f60: .4byte D_02263ec8
_02005f64: .4byte D_02263f3c
_02005f68: .4byte D_02263efc
	arm_func_end func_02005ec8


	arm_func_start func_02005f6c
func_02005f6c: @ 0x02005f6c
	ldr r1, _02005f94 @ =0x02263ec8
	ldrh r2, [r1, #0x2c]
	strh r2, [r0]
	ldrh r2, [r1, #0x2e]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x30]
	strh r2, [r0, #4]
	ldrh r1, [r1, #0x32]
	strh r1, [r0, #6]
	bx lr
	.align 2, 0
_02005f94: .4byte D_02263ec8
	arm_func_end func_02005f6c

	arm_func_start func_02005f98
func_02005f98: @ 0x02005f98
	ldr r1, _02005fac @ =0x02263ec8
	mov r2, #0
	ldr ip, _02005fb0 @ =func_02005fb4
	strh r2, [r1]
	bx ip
	.align 2, 0
_02005fac: .4byte D_02263ec8
_02005fb0: .4byte func_02005fb4
	arm_func_end func_02005f98

	arm_func_start func_02005fb4
func_02005fb4: @ 0x02005fb4
	ldr r1, _0200600c @ =0x02263ec8
	ldrh ip, [r1]
	ldr r2, [r1, #0x1c]
	cmp ip, r2
	movge r0, #1
	bxge lr
	ldr r3, _02006010 @ =0x02263f7c
	lsl r2, ip, #3
	ldrh r2, [r3, r2]
	add r3, r3, ip, lsl #3
	strh r2, [r0]
	ldrh r2, [r3, #2]
	strh r2, [r0, #2]
	ldrh r2, [r3, #4]
	strh r2, [r0, #4]
	ldrh r2, [r3, #6]
	strh r2, [r0, #6]
	ldrh r2, [r1]
	mov r0, #0
	add r2, r2, #1
	strh r2, [r1]
	bx lr
	.align 2, 0
_0200600c: .4byte D_02263ec8
_02006010: .4byte D_02263f7c
	arm_func_end func_02005fb4
