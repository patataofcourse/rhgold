
.include "global.s"

.section .text

	arm_func_start func_02004040
func_02004040: @ 0x02004040
	push {r3, lr}
	ldr r1, [r0, #0x1c]
	add r0, r0, #8
	ldr r2, [r1, #4]
	mov r1, #0
	blx r2
	pop {r3, pc}
	arm_func_end func_02004040

	arm_func_start func_0200405c
func_0200405c: @ 0x0200405c
	ldr r0, [r0, #0x38]
	lsl r0, r0, #3
	bx lr
	arm_func_end func_0200405c

	arm_func_start func_02004068
func_02004068: @ 0x02004068
	ldr r0, [r0, #0x3c]
	lsl r0, r0, #3
	bx lr
	arm_func_end func_02004068

	arm_func_start func_02004074
func_02004074: @ 0x02004074
	ldr ip, _02004080 @ =func_0200ae8c
	ldr r0, [r0, #0x34]
	bx ip
	.align 2, 0
_02004080: .4byte func_0200ae8c
	arm_func_end func_02004074

	arm_func_start func_02004084
func_02004084: @ 0x02004084
	ldr ip, _02004090 @ =func_0200ae98
	ldr r0, [r0, #0x34]
	bx ip
	.align 2, 0
_02004090: .4byte func_0200ae98
	arm_func_end func_02004084

	arm_func_start func_02004094
func_02004094: @ 0x02004094
	str r1, [r0, #0x2c]
	bx lr
	arm_func_end func_02004094

	arm_func_start func_0200409c
func_0200409c: @ 0x0200409c
	push {r3, lr}
	mov r3, #0
	str r3, [sp]
	bl func_020040c8
	pop {r3, pc}
	arm_func_end func_0200409c

	arm_func_start func_020040b0
func_020040b0: @ 0x020040b0
	push {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl func_020040c8
	pop {r3, pc}
	arm_func_end func_020040b0

	arm_func_start func_020040c8
func_020040c8: @ 0x020040c8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xb0
	str r1, [sp, #0xc]
	ldr r1, [sp, #0xd8]
	mov sb, r0
	mov r8, r2
	cmp r3, #4
	str r1, [sp, #0xd8]
	mov sl, #0
	bne _02004618
	ldr r1, [sb, #0x24]
	ldr r0, [sb, #0x28]
	ldr r1, [r1]
	str r0, [sp, #0x10]
	ldrsb r1, [r1, #1]
	ldr r0, [sb, #0x2c]
	ldr fp, [sp, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x18]
_02004114:
	ldr r0, _02004754 @ =0x02263e90
	mov r1, #0
	mov r2, #0x20
	str r8, [sp, #0x14]
	bl func_0203afe8
	ldr r4, _02004754 @ =0x02263e90
	ldr r0, [sp, #0x10]
	str r4, [sp, #0x2c]
	add r0, r0, #2
	str r0, [sp, #0x24]
	mvn r0, #0
	str r0, [sp, #0x28]
	ldr r0, _02004758 @ =0x00008142
	str r4, [sp, #0x1c]
	sub r0, r0, #1
	str r0, [sp, #0x30]
	ldr r0, _02004758 @ =0x00008142
	str r4, [sp, #0x20]
	add r0, r0, #2
	str r0, [sp, #0x34]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #1
	str r0, [sp, #0x38]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #7
	str r0, [sp, #0x3c]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #6
	str r0, [sp, #0x40]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #3
	str r0, [sp, #0x44]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #0x19
	str r0, [sp, #0x48]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #0x1a
	str r0, [sp, #0x4c]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #0x1e
	str r0, [sp, #0x50]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #0x34
	str r0, [sp, #0x54]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #0x28
	str r0, [sp, #0x58]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #2
	str r0, [sp, #0x5c]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #4
	str r0, [sp, #0x60]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #6
	str r0, [sp, #0x64]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #8
	str r0, [sp, #0x68]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0x22
	str r0, [sp, #0x6c]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0x42
	str r0, [sp, #0x70]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0x44
	str r0, [sp, #0x74]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0x46
	str r0, [sp, #0x78]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xa1
	str r0, [sp, #0x7c]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xa3
	str r0, [sp, #0x80]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xa5
	str r0, [sp, #0x84]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xa7
	str r0, [sp, #0x88]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xa9
	str r0, [sp, #0x8c]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xc3
	str r0, [sp, #0x90]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xe4
	str r0, [sp, #0x94]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xe6
	str r0, [sp, #0x98]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xe8
	str r0, [sp, #0x9c]
	ldr r0, _0200475c @ =0x0000829f
	add r0, r0, #0xf7
	str r0, [sp, #0xa0]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #0x33
	str r0, [sp, #0xa4]
	ldr r0, _02004758 @ =0x00008142
	add r0, r0, #0x27
	str r0, [sp, #0xa8]
_020042c0:
	ldrsb r0, [r8]
	mov r5, #0
	mov r6, r5
	cmp r0, #0xa
	moveq r6, #1
	strb r0, [r4], #1
	cmp r0, #0
	mov r7, r5
	ldr r0, [sp, #0x1c]
	sub r1, r4, #1
	moveq r7, #1
	cmp r1, r0
	ldreqsb r0, [r4, #-1]
	ldr r1, [sb, #0x28]
	ldr r2, [sp, #0x20]
	cmpeq r0, #0x20
	ldr r0, [sb, #0x24]
	mov r3, #0
	add r8, r8, #1
	subeq r4, r4, #1
	bl func_0201d15c
	ldr r1, [sp, #0xd8]
	cmp r0, r1
	ble _02004330
	mov r0, #0
	strb r0, [r4, #-1]
	sub r8, r8, #1
	mov r5, #1
_02004330:
	cmp r5, #0
	cmpeq r6, #0
	cmpeq r7, #0
	beq _020042c0
	cmp r6, #0
	cmpeq r7, #0
	bne _02004530
	ldrsb r0, [r8]
	ldr r1, _02004758 @ =0x00008142
	cmp r0, r1
	ldrne r1, [sp, #0x30]
	cmpne r0, r1
	cmpne r0, #0x2e
	cmpne r0, #0x2c
	ldrne r1, [sp, #0x34]
	cmpne r0, r1
	ldrne r1, [sp, #0x38]
	cmpne r0, r1
	ldrne r1, [sp, #0x3c]
	cmpne r0, r1
	ldrne r1, [sp, #0x40]
	cmpne r0, r1
	ldrne r1, [sp, #0x44]
	cmpne r0, r1
	ldrne r1, [sp, #0x48]
	cmpne r0, r1
	ldrne r1, [sp, #0x4c]
	cmpne r0, r1
	ldrne r1, [sp, #0x50]
	cmpne r0, r1
	ldrne r1, [sp, #0x54]
	cmpne r0, r1
	ldrne r1, [sp, #0x58]
	cmpne r0, r1
	ldrne r1, _0200475c @ =0x0000829f
	cmpne r0, r1
	ldrne r1, [sp, #0x5c]
	cmpne r0, r1
	ldrne r1, [sp, #0x60]
	cmpne r0, r1
	ldrne r1, [sp, #0x64]
	cmpne r0, r1
	ldrne r1, [sp, #0x68]
	cmpne r0, r1
	ldrne r1, [sp, #0x6c]
	cmpne r0, r1
	ldrne r1, [sp, #0x70]
	cmpne r0, r1
	ldrne r1, [sp, #0x74]
	cmpne r0, r1
	ldrne r1, [sp, #0x78]
	cmpne r0, r1
	ldrne r1, [sp, #0x7c]
	cmpne r0, r1
	ldrne r1, [sp, #0x80]
	cmpne r0, r1
	ldrne r1, [sp, #0x84]
	cmpne r0, r1
	ldrne r1, [sp, #0x88]
	cmpne r0, r1
	ldrne r1, [sp, #0x8c]
	cmpne r0, r1
	ldrne r1, [sp, #0x90]
	cmpne r0, r1
	ldrne r1, [sp, #0x94]
	cmpne r0, r1
	ldrne r1, [sp, #0x98]
	cmpne r0, r1
	ldrne r1, [sp, #0x9c]
	cmpne r0, r1
	ldrne r1, [sp, #0xa0]
	cmpne r0, r1
	bne _02004464
	add fp, fp, #1
	ldr r8, [sp, #0x14]
	str fp, [sb, #0x28]
	b _02004114
_02004464:
	ldrsb r2, [r8, #-1]
	ldr r1, [sp, #0xa4]
	cmp r2, r1
	ldrne r1, [sp, #0xa8]
	cmpne r2, r1
	cmpne r2, #0x5b
	cmpne r2, #0x28
	bne _02004494
	add fp, fp, #1
	ldr r8, [sp, #0x14]
	str fp, [sb, #0x28]
	b _02004114
_02004494:
	cmp r2, #0x61
	blt _020044a4
	cmp r2, #0x7a
	ble _020044b4
_020044a4:
	cmp r2, #0x41
	blt _020044f8
	cmp r2, #0x5a
	bgt _020044f8
_020044b4:
	cmp r0, #0x61
	blt _020044c4
	cmp r0, #0x7a
	ble _020044d4
_020044c4:
	cmp r0, #0x41
	blt _020044f8
	cmp r0, #0x5a
	bgt _020044f8
_020044d4:
	cmp r2, #0x20
	beq _020044f0
_020044dc:
	sub r8, r8, #1
	sub r4, r4, #1
	ldrsb r0, [r8, #-1]
	cmp r0, #0x20
	bne _020044dc
_020044f0:
	mov r0, #0
	strb r0, [r4, #-1]
_020044f8:
	ldrsb r0, [r8, #-1]
	cmp r0, #0x30
	blt _02004530
	cmp r0, #0x39
	bgt _02004530
	ldrsb r0, [r8]
	cmp r0, #0x30
	blt _02004530
	cmp r0, #0x39
	bgt _02004530
	add fp, fp, #1
	ldr r8, [sp, #0x14]
	str fp, [sb, #0x28]
	b _02004114
_02004530:
	ldr r0, [sp, #0x24]
	mov r1, #0
	cmp fp, r0
	strgt r0, [sb, #0x28]
	ldr r2, [sb, #0x24]
	add r0, sp, #0xae
	strb r1, [r0]
	strb r1, [r0, #1]
	ldr r0, [r2]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #7]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020045b4
_02004568: @ jump table
	b _02004588 @ case 0
	b _02004594 @ case 1
	b _02004594 @ case 2
	b _020045a0 @ case 3
	b _020045a0 @ case 4
	b _020045ac @ case 5
	b _020045ac @ case 6
	b _02004588 @ case 7
_02004588:
	mov r0, #1
	strb r0, [sp, #0xae]
	b _020045b4
_02004594:
	mov r0, #1
	strb r0, [sp, #0xaf]
	b _020045b4
_020045a0:
	ldr r0, [sp, #0x28]
	strb r0, [sp, #0xae]
	b _020045b4
_020045ac:
	ldr r0, [sp, #0x28]
	strb r0, [sp, #0xaf]
_020045b4:
	ldr r0, [sp, #0x2c]
	mov r1, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r3, [sp, #0xae]
	ldrb r2, [sp, #0xaf]
	add r0, sb, #0x20
	strb r3, [sp, #8]
	strb r2, [sp, #9]
	ldr r3, [sp, #0xc]
	mov r2, sl
	bl func_0201e828
	ldr r0, [sp, #0x10]
	cmp r6, #0
	str r0, [sb, #0x28]
	mov fp, r0
	ldr r0, [sp, #0x18]
	cmpeq r5, #0
	add sl, sl, r0
	bne _02004114
	cmp r7, #0
	beq _020042c0
	add sp, sp, #0xb0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02004618:
	cmp r3, #3
	addls pc, pc, r3, lsl #2
	b _020046a4
_02004624: @ jump table
	b _02004634 @ case 0
	b _02004658 @ case 1
	b _0200467c @ case 2
	b _02004694 @ case 3
_02004634:
	bl func_0200405c
	add r1, r0, r0, lsr #31
	mov r0, sb
	asr r4, r1, #1
	bl func_02004068
	add r0, r0, r0, lsr #31
	asr r5, r0, #1
	ldr sl, _02004760 @ =0x00000412
	b _020046a8
_02004658:
	bl func_0200405c
	add r1, r0, r0, lsr #31
	mov r0, sb
	asr r4, r1, #1
	bl func_02004068
	add r0, r0, r0, lsr #31
	asr r5, r0, #1
	ldr sl, _02004764 @ =0x00000212
	b _020046a8
_0200467c:
	mov r4, sl
	bl func_02004068
	add r0, r0, r0, lsr #31
	asr r5, r0, #1
	ldr sl, _02004768 @ =0x0000020a
	b _020046a8
_02004694:
	mov r4, sl
	mov r5, sl
	ldr sl, _0200476c @ =0x00000209
	b _020046a8
_020046a4:
	bl func_02031f14
_020046a8:
	ldr r2, [sb, #0x24]
	add r0, sp, #0xac
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	ldr r0, [r2]
	ldr r0, [r0, #8]
	ldrb r0, [r0, #7]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _02004720
_020046d4: @ jump table
	b _020046f4 @ case 0
	b _02004700 @ case 1
	b _02004700 @ case 2
	b _0200470c @ case 3
	b _0200470c @ case 4
	b _02004718 @ case 5
	b _02004718 @ case 6
	b _020046f4 @ case 7
_020046f4:
	mov r0, #1
	strb r0, [sp, #0xac]
	b _02004720
_02004700:
	mov r0, #1
	strb r0, [sp, #0xad]
	b _02004720
_0200470c:
	sub r0, r1, #1
	strb r0, [sp, #0xac]
	b _02004720
_02004718:
	sub r0, r1, #1
	strb r0, [sp, #0xad]
_02004720:
	str sl, [sp]
	str r8, [sp, #4]
	ldrb r0, [sp, #0xac]
	ldrb r6, [sp, #0xad]
	ldr r3, [sp, #0xc]
	mov r1, r4
	strb r0, [sp, #8]
	mov r2, r5
	add r0, sb, #0x20
	strb r6, [sp, #9]
	bl func_0201ea44
	add sp, sp, #0xb0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02004754: .4byte 0x02263e90
_02004758: .4byte 0x00008142
_0200475c: .4byte 0x0000829f
_02004760: .4byte 0x00000412
_02004764: .4byte 0x00000212
_02004768: .4byte 0x0000020a
_0200476c: .4byte 0x00000209
	arm_func_end func_020040c8

	arm_func_start func_02004770
func_02004770: @ 0x02004770
	ldr ip, _0200478c @ =func_0201d15c
	mov r3, r0
	mov r2, r1
	ldr r0, [r3, #4]
	ldr r1, [r3, #0x28]
	mov r3, #0
	bx ip
	.align 2, 0
_0200478c: .4byte func_0201d15c
	arm_func_end func_02004770
