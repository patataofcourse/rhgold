@ code_02001fbc.c (but in asm)

.include "global.s"

.section .text

	arm_func_start func_02001fbc
func_02001fbc: @ 0x02001fbc
	push {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r0
	ldr r0, [sp, #0x18]
	mov r4, r2
	str r6, [r5, #4]
	str r4, [r5, #8]
	mov r1, r3
	str r3, [r5, #0xc]
	lsl r0, r0, #0xc
	bl func_0203b648
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, [r5, #0x10]
	sub r0, r6, r0
	lsl r0, r0, #0xc
	rsb r1, r1, #0x1000
	bl func_0203b648
	str r0, [r5, #0x14]
	ldr r0, [sp, #0x14]
	ldr r1, [r5, #0x10]
	sub r0, r4, r0
	lsl r0, r0, #0xc
	rsb r1, r1, #0x1000
	bl func_0203b648
	str r0, [r5, #0x18]
	pop {r4, r5, r6, pc}
	arm_func_end func_02001fbc

	arm_func_start func_02002028
func_02002028: @ 0x02002028
	push {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0x10]
	mov r5, r1
	rsb r0, r4, #0x1000
	mul r1, r0, r3
	lsl r0, r4, #0xc
	add r1, r4, r1, asr #12
	mov r4, r2
	bl func_0203b648
	ldr r3, [r6, #0x14]
	ldr r2, [r6, #4]
	add r1, r3, r5, asr #12
	mul r1, r0, r1
	add r2, r2, r1, asr #12
	ldr r1, [sp, #0x10]
	sub r2, r2, r3
	str r2, [r1]
	ldr r3, [r6, #0x18]
	ldr r2, [r6, #8]
	add r1, r3, r4, asr #12
	mul r1, r0, r1
	add r2, r2, r1, asr #12
	ldr r1, [sp, #0x14]
	sub r2, r2, r3
	str r2, [r1]
	ldr r2, [r6, #0xc]
	ldr r1, [sp, #0x18]
	mul r2, r0, r2
	asr r0, r2, #0xc
	str r0, [r1]
	pop {r4, r5, r6, pc}
	arm_func_end func_02002028

	arm_func_start func_020020a8
func_020020a8: @ 0x020020a8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	ldr r2, [sp, #0x10]
	mov r3, r1
	str r2, [sp, #8]
	ldm r3, {r1, r2, r3}
	bl func_02002028
	add sp, sp, #0xc
	ldm sp!, {pc}
	arm_func_end func_020020a8

	arm_func_start func_020020d4
func_020020d4: @ 0x020020d4
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _020020f8
	ldr r1, [r4, #0x4fc]
	cmp r1, #0
	bne _020020f8
	bl func_02003ae0
_020020f8:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _02002114
	ldr r1, [r4, #0x500]
	cmp r1, #0
	bne _02002114
	bl func_02003ae0
_02002114:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _02002130
	ldr r1, [r4, #0x504]
	cmp r1, #0
	bne _02002130
	bl func_02003ae0
_02002130:
	ldr r0, [r4, #0x45c]
	cmp r0, #0
	beq _0200215c
	add r0, r4, #0x74
	add r0, r0, #0x400
	bl func_02017f20
	add r0, r4, #0x9c
	add r0, r0, #0x400
	bl func_0201810c
	ldr r0, [r4, #0x45c]
	bl func_02003ae0
_0200215c:
	ldr r0, [r4, #0x460]
	cmp r0, #0
	beq _0200216c
	bl func_02003ae0
_0200216c:
	ldr r0, [r4, #0x464]
	cmp r0, #0
	beq _0200217c
	bl func_02003ae0
_0200217c:
	ldr r0, [r4, #0x468]
	cmp r0, #0
	beq _0200218c
	bl func_02003ae0
_0200218c:
	ldr r0, [r4, #0x46c]
	cmp r0, #0
	beq _0200219c
	bl func_02003ae0
_0200219c:
	ldr r0, [r4, #0x470]
	cmp r0, #0
	beq _020021ac
	bl func_02003ae0
_020021ac:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _020021bc
	bl func_02003ae0
_020021bc:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _020021cc
	bl func_02003ae0
_020021cc:
	mov r0, #0
	str r0, [r4, #0x48]
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	str r0, [r4, #0x45c]
	str r0, [r4, #0x460]
	str r0, [r4, #0x464]
	str r0, [r4, #0x468]
	str r0, [r4, #0x46c]
	str r0, [r4, #0x470]
	str r0, [r4, #0x2c]
	str r0, [r4, #0x24]
	str r0, [r4, #0x4fc]
	str r0, [r4, #0x500]
	str r0, [r4, #0x504]
	pop {r4, pc}
	arm_func_end func_020020d4

	arm_func_start func_0200220c
func_0200220c: @ 0x0200220c
	mov r3, #0
	ldr r1, _0200228c @ =0x02045dc4
	str r3, [r0, #4]
	str r1, [r0, #0x54]
	ldr r1, [r0]
	bic r1, r1, #0x7800
	bic r2, r1, #0x78000
	bic r1, r2, #1
	bic r1, r1, #0x3fc
	str r1, [r0]
	str r3, [r0, #0x444]
	str r3, [r0, #0x440]
	str r3, [r0, #0x48]
	str r3, [r0, #0x4c]
	str r3, [r0, #0x50]
	str r3, [r0, #0x2c]
	str r3, [r0, #0x24]
	str r3, [r0, #0x448]
	str r3, [r0, #0x44c]
	str r3, [r0, #0x450]
	str r3, [r0, #0x454]
	str r3, [r0, #0x458]
	str r3, [r0, #0x45c]
	str r3, [r0, #0x460]
	str r3, [r0, #0x464]
	str r3, [r0, #0x468]
	str r3, [r0, #0x46c]
	str r3, [r0, #0x470]
	str r3, [r0, #0x4fc]
	str r3, [r0, #0x500]
	str r3, [r0, #0x504]
	bx lr
	.align 2, 0
_0200228c: .4byte D_02045dc4
	arm_func_end func_0200220c

	arm_func_start func_02002290
func_02002290: @ 0x02002290
	push {r4, lr}
	mov r4, r0
	bl func_020020d4
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_02002290

	arm_func_start func_020022a4
func_020022a4: @ 0x020022a4
	push {r4, lr}
	mov r4, r0
	ldr r2, _020022e0 @ =0x02045dc4
	str r1, [r4, #4]
	str r2, [r4, #0x54]
	ldr r1, [r4]
	bic r1, r1, #1
	bic r1, r1, #0x3fc
	str r1, [r4]
	bl func_020020d4
	mov r0, r4
	bl func_020022f8
	mov r0, #1
	str r0, [r4, #0x4f4]
	pop {r4, pc}
	.align 2, 0
_020022e0: .4byte D_02045dc4
	arm_func_end func_020022a4
_020022e4:
	.byte 0x08, 0xc0, 0x9f, 0xe5, 0x00, 0x10, 0xa0, 0xe3, 0x04, 0x10, 0x80, 0xe5
	.byte 0x1c, 0xff, 0x2f, 0xe1, 0xd4, 0x20, 0x00, 0x02

	arm_func_start func_020022f8
func_020022f8: @ 0x020022f8
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x3c
	mov sb, r0
	ldr r0, [sb]
	mov r8, #0
	bic r0, r0, #0x7800
	bic r0, r0, #0x78000
	str r0, [sb]
	str r8, [sp, #0x24]
	str r8, [sp, #0x28]
	ldr r1, [sb, #4]
	ldr r0, [r1]
	cmp r0, #0
	beq _0200245c
	add r6, sp, #4
	mov r5, r8
	add r4, sp, #0x24
_0200233c:
	ldr r0, [r1, r8, lsl #2]
	ldrh r1, [r0]
	cmp r1, #1
	bgt _02002354
	beq _0200237c
	b _02002448
_02002354:
	cmp r1, #0xb
	bgt _02002448
	cmp r1, #8
	blt _02002448
	beq _02002408
	cmp r1, #0xa
	beq _02002414
	cmp r1, #0xb
	beq _02002430
	b _02002448
_0200237c:
	ldr r1, [r0, #0xc]
	mov r2, r6
	str r1, [sp, #0x2c]
	ldr r1, [r0, #0x10]
	str r1, [sp, #0x30]
	ldr r1, [r0, #0x14]
	str r1, [sp, #0x34]
	ldr r1, [r0, #0x18]
	str r1, [sp, #0x38]
	ldr r1, [sb, #0x448]
	ldrsb r7, [r0, #2]
	cmp r1, #0
	beq _020023b8
	cmp r7, #0
	addge r2, r1, r7, lsl #5
_020023b8:
	str r5, [sp]
	ldr r0, [r0, #0x24]
	mov r1, r4
	mov r3, r5
	bl func_02003c94
	ldr r1, [sb, #0x44c]
	cmp r1, #0
	beq _020023e8
	ldr r0, [sb]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1c
	strb r0, [r1, r7]
_020023e8:
	ldr r1, [sb, #0x450]
	cmp r1, #0
	beq _02002448
	ldr r0, [sb]
	lsl r0, r0, #0xd
	lsr r0, r0, #0x1c
	strb r0, [r1, r7]
	b _02002448
_02002408:
	ldr r0, [r0, #4]
	bl func_02035e44
	b _02002448
_02002414:
	ldrh r0, [r0, #2]
	ldr r1, [sb]
	bic r1, r1, #0x7800
	lsl r0, r0, #0x1c
	orr r0, r1, r0, lsr #17
	str r0, [sb]
	b _02002448
_02002430:
	ldrh r0, [r0, #2]
	ldr r1, [sb]
	bic r1, r1, #0x78000
	lsl r0, r0, #0x1c
	orr r0, r1, r0, lsr #13
	str r0, [sb]
_02002448:
	ldr r1, [sb, #4]
	add r8, r8, #1
	ldr r0, [r1, r8, lsl #2]
	cmp r0, #0
	bne _0200233c
_0200245c:
	ldr r0, [sb]
	bic r0, r0, #0x7800
	bic r0, r0, #0x78000
	str r0, [sb]
	add sp, sp, #0x3c
	pop {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end func_020022f8

	arm_func_start func_02002474
func_02002474: @ 0x02002474
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	ldr r0, [r4, #0x4f4]
	cmp r0, #0
	beq _020024a8
	sub r0, r0, #1
	str r0, [r4, #0x4f4]
	mov r0, #0
	pop {r4, pc}
_020024a8:
	movs r0, #1
	str r0, [r4, #0x508]
	beq _02002744
_020024b4:
	ldr r0, [r4]
	lsl r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	beq _020024e0
	mov r0, r4
	bl func_02002ae8
	cmp r0, #0
	beq _02002738
	mov r0, r4
	bl func_02002b94
	b _02002738
_020024e0:
	lsl r0, r0, #0x16
	lsr r0, r0, #0x18
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02002734
_020024f4: @ jump table
	b _0200250c @ case 0
	b _02002734 @ case 1
	b _020026f8 @ case 2
	b _0200270c @ case 3
	b _02002734 @ case 4
	b _02002720 @ case 5
_0200250c:
	ldr r0, [r4, #4]
	ldr r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r0, r0, #4
	str r0, [r4, #4]
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _02002540
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
_02002540:
	ldrh r0, [r1]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _020026f0
_02002550: @ jump table
	b _02002580 @ case 0
	b _020025a4 @ case 1
	b _020025c8 @ case 2
	b _020025ec @ case 3
	b _02002610 @ case 4
	b _02002634 @ case 5
	b _02002658 @ case 6
	b _0200267c @ case 7
	b _020026a0 @ case 8
	b _020026ac @ case 9
	b _020026b8 @ case 10
	b _020026d4 @ case 11
_02002580:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #4
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #8]
	bl func_02002840
	b _02002738
_020025a4:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #0x10
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	bl func_02002840
	b _02002738
_020025c8:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #0x18
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	bl func_02002840
	b _02002738
_020025ec:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #0x1c
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	bl func_02002840
	b _02002738
_02002610:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #0x20
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	bl func_02002840
	b _02002738
_02002634:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #0x24
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	bl func_02002840
	b _02002738
_02002658:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #0x28
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	bl func_02002840
	b _02002738
_0200267c:
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	orr r1, r1, #0x2c
	str r1, [r4]
	ldr r1, [r4, #8]
	ldr r1, [r1, #4]
	bl func_02002840
	b _02002738
_020026a0:
	ldr r0, [r1, #4]
	str r0, [r4, #0x54]
	b _02002738
_020026ac:
	ldrh r0, [r1, #2]
	str r0, [r4, #0x458]
	b _02002738
_020026b8:
	ldrh r0, [r1, #2]
	ldr r1, [r4]
	bic r1, r1, #0x7800
	lsl r0, r0, #0x1c
	orr r0, r1, r0, lsr #17
	str r0, [r4]
	b _02002738
_020026d4:
	ldrh r0, [r1, #2]
	ldr r1, [r4]
	bic r1, r1, #0x78000
	lsl r0, r0, #0x1c
	orr r0, r1, r0, lsr #13
	str r0, [r4]
	b _02002738
_020026f0:
	bl func_02031f14
	b _02002738
_020026f8:
	ldr r1, [r4, #8]
	mov r0, r4
	ldr r1, [r1, #0xc]
	bl func_02002840
	b _02002738
_0200270c:
	ldr r1, [r4, #8]
	mov r0, r4
	ldr r1, [r1, #0x10]
	bl func_02002840
	b _02002738
_02002720:
	ldr r1, [r4, #8]
	mov r0, r4
	ldr r1, [r1, #8]
	bl func_02002840
	b _02002738
_02002734:
	bl func_02031f14
_02002738:
	ldr r0, [r4, #0x508]
	cmp r0, #0
	bne _020024b4
_02002744:
	mov r0, #0
	pop {r4, pc}
	arm_func_end func_02002474

	arm_func_start func_0200274c
func_0200274c: @ 0x0200274c
	push {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x508]
	add r0, r4, #0xa4
	ldr r2, [r4, #0x2c]
	ldr r1, [r4, #0x4f0]
	add r0, r0, #0x400
	add r1, r2, r1
	mov r2, #0x4000
	bl func_02035dc8
	ldr r1, [r4, #0x4f0]
	add r1, r1, r0
	str r1, [r4, #0x4f0]
	ldr r0, [r4, #0x4ec]
	cmp r1, r0
	popne {r4, pc}
	add r0, r4, #0xa4
	add r0, r0, #0x400
	bl func_02035c74
	ldr r1, [r4]
	add r0, r4, #0x58
	bic r1, r1, #0x400
	str r1, [r4]
	bl func_0203b1dc
	add r2, r4, #0x55
	ldr r1, _0200283c @ =0x02045dc8
	add r0, r2, r0
	bl func_0203b2f0
	cmp r0, #0
	bne _0200281c
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x4ec]
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	lsr r0, r0, #8
	str r0, [r4, #0x28]
	bl func_02003a84
	str r0, [r4, #0x24]
	mov r1, r0
	ldr r2, [r4, #0x30]
	add r0, r4, #0xc
	bl func_02032c4c
	ldr r0, [r4, #0x30]
	add r0, r0, #4
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x34]
	sub r0, r0, #4
	str r0, [r4, #0x34]
	pop {r4, pc}
_0200281c:
	ldr r1, [r4, #0x2c]
	mov r0, #0
	str r1, [r4, #0x24]
	ldr r1, [r4]
	orr r1, r1, #2
	str r1, [r4]
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.align 2, 0
_0200283c: .4byte D_02045dc8
	arm_func_end func_0200274c

	arm_func_start func_02002840
func_02002840: @ 0x02002840
	push {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5]
	movs r4, r1
	bic r0, r0, #1
	orr r0, r0, #1
	str r0, [r5]
	bne _02002878
	ldr r1, [r5]
	mov r0, #0
	orr r1, r1, #2
	str r1, [r5]
	str r0, [r5, #0x24]
	pop {r4, r5, r6, pc}
_02002878:
	ldr r0, [r5]
	bic r0, r0, #2
	str r0, [r5]
	ldrsb r0, [r4]
	cmp r0, #0x2f
	bne _0200289c
	add r0, r5, #0x58
	bl SDK_strcpy
	b _020028b4
_0200289c:
	ldr r1, [r5, #0x54]
	add r0, r5, #0x58
	bl SDK_strcpy
	mov r1, r4
	add r0, r5, #0x58
	bl func_0203b2c0
_020028b4:
	ldr r0, _02002ae4 @ =0x02270240
	ldr r0, [r0]
	cmp r0, #0
	bne _020028e0
	mov r0, #0xc
	bl func_020039a4
	cmp r0, #0
	beq _020028d8
	bl func_0200e694
_020028d8:
	ldr r1, _02002ae4 @ =0x02270240
	str r0, [r1]
_020028e0:
	ldr r0, _02002ae4 @ =0x02270240
	mov r1, #0xff
	ldr r0, [r0]
	bl func_0200e9e0
	cmp r0, #0
	bne _02002a78
	ldr r0, _02002ae4 @ =0x02270240
	ldr r0, [r0]
	cmp r0, #0
	bne _02002924
	mov r0, #0xc
	bl func_020039a4
	cmp r0, #0
	beq _0200291c
	bl func_0200e694
_0200291c:
	ldr r1, _02002ae4 @ =0x02270240
	str r0, [r1]
_02002924:
	ldr r0, _02002ae4 @ =0x02270240
	add r1, r5, #0x58
	ldr r0, [r0]
	bl func_0200eb98
	movs r4, r0
	beq _02002a78
	ldr r1, [r5]
	orr r2, r1, #2
	lsl r1, r2, #0x16
	lsr r1, r1, #0x18
	str r2, [r5]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _02002a40
_0200295c: @ jump table
	b _02002a40 @ case 0
	b _02002974 @ case 1
	b _02002974 @ case 2
	b _02002974 @ case 3
	b _02002974 @ case 4
	b _02002974 @ case 5
_02002974:
	bl func_0200e4b0
	str r0, [r5, #0x24]
	ldr r0, [r5]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _0200299c
	mov r0, r4
	bl func_0200e4c0
	str r0, [r5, #0x38]
_0200299c:
	ldr r0, [r5]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x18
	cmp r0, #2
	bne _020029bc
	mov r0, r4
	bl func_0200e4f0
	str r0, [r5, #0x3c]
_020029bc:
	ldr r0, [r5]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x18
	cmp r0, #3
	bne _020029e8
	mov r0, r4
	bl func_0200e520
	str r0, [r5, #0x40]
	mov r0, r4
	bl func_0200e550
	str r0, [r5, #0x44]
_020029e8:
	ldr r0, [r5]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x18
	cmp r0, #4
	bne _02002a08
	mov r0, r4
	bl func_0200e4f0
	str r0, [r5, #0x3c]
_02002a08:
	ldr r0, [r5]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x18
	cmp r0, #5
	bne _02002a34
	mov r0, r4
	bl func_0200e520
	str r0, [r5, #0x40]
	mov r0, r4
	bl func_0200e550
	str r0, [r5, #0x44]
_02002a34:
	mov r0, #1
	str r0, [r5, #0x4f8]
	pop {r4, r5, r6, pc}
_02002a40:
	mov r0, r4
	bl func_0200e4b8
	mov r1, #4
	mov r6, r0
	bl func_02003ab0
	str r0, [r5, #0x24]
	mov r1, #0
	mov r0, r4
	str r1, [r5, #0x4f8]
	bl func_0200e4b0
	ldr r1, [r5, #0x24]
	mov r2, r6
	bl func_02003394
	pop {r4, r5, r6, pc}
_02002a78:
	add r0, r5, #0xa4
	mov r1, #0
	add r0, r0, #0x400
	str r1, [r5, #0x4f8]
	bl func_0203594c
	add r0, r5, #0xa4
	add r0, r0, #0x400
	add r1, r5, #0x58
	bl func_02035c2c
	cmp r0, #0
	bne _02002aa8
	bl func_02031f14
_02002aa8:
	ldr r2, [r5, #0x4cc]
	ldr r1, [r5, #0x4c8]
	mov r0, #0
	sub r1, r2, r1
	str r1, [r5, #0x4ec]
	str r0, [r5, #0x4f0]
	ldr r0, [r5, #0x4ec]
	bl func_02003a84
	ldr r1, [r5]
	orr r1, r1, #0x400
	str r1, [r5]
	str r0, [r5, #0x2c]
	mov r0, r5
	bl func_0200274c
	pop {r4, r5, r6, pc}
	.align 2, 0
_02002ae4: .4byte D_02270240
	arm_func_end func_02002840

	arm_func_start func_02002ae8
func_02002ae8: @ 0x02002ae8
	push {r3, r4, r5, lr}
	mov r4, r0
	ldr r1, [r4]
	lsl r2, r1, #0x1e
	lsrs r2, r2, #0x1f
	beq _02002b10
	bic r0, r1, #1
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02002b10:
	lsl r1, r1, #0x15
	lsrs r1, r1, #0x1f
	beq _02002b28
	bl func_0200274c
	mov r0, #0
	pop {r3, r4, r5, pc}
_02002b28:
	mov r0, #0
	str r0, [r4, #0x508]
	ldr r5, [r4, #0x34]
	ldr r1, [r4, #0x30]
	cmp r5, #0x1000
	movhs r5, #0x1000
	mov r2, r5
	add r0, r4, #0xc
	bl func_02032c94
	cmp r0, #0
	beq _02002b70
	ldr r0, [r4, #0x30]
	add r0, r0, r5
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x34]
	sub r0, r0, r5
	str r0, [r4, #0x34]
	b _02002b8c
_02002b70:
	ldr r0, [r4, #0x2c]
	bl func_02003ae0
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r0, [r4]
	orr r0, r0, #2
	str r0, [r4]
_02002b8c:
	mov r0, #0
	pop {r3, r4, r5, pc}
	arm_func_end func_02002ae8

	arm_func_start func_02002b94
func_02002b94: @ 0x02002b94
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x18
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	pop {r4, pc}
_02002bb4: @ jump table
	pop {r4, pc} @ case 0
	b _02002be4 @ case 1
	b _02002c3c @ case 2
	b _02002c94 @ case 3
	b _02002cfc @ case 4
	b _02002d54 @ case 5
	b _02002dbc @ case 6
	b _02002e1c @ case 7
	b _02002e3c @ case 8
	b _02002e5c @ case 9
	b _02002e7c @ case 10
	b _02002e9c @ case 11
_02002be4:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02002c08
	ldr r1, [r4, #0x4f8]
	cmp r1, #0
	bne _02002c10
	add r1, r4, #0x38
	bl func_020185dc
	b _02002c10
_02002c08:
	mov r0, #0
	str r0, [r4, #0x38]
_02002c10:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x48]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	orr r0, r0, #8
	str r0, [r4]
	ldr r0, [r4, #0x4f8]
	str r0, [r4, #0x4fc]
	pop {r4, pc}
_02002c3c:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02002c60
	ldr r1, [r4, #0x4f8]
	cmp r1, #0
	bne _02002c68
	add r1, r4, #0x3c
	bl func_020184f8
	b _02002c68
_02002c60:
	mov r0, #0
	str r0, [r4, #0x3c]
_02002c68:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x4c]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	orr r0, r0, #0xc
	str r0, [r4]
	ldr r0, [r4, #0x4f8]
	str r0, [r4, #0x500]
	pop {r4, pc}
_02002c94:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02002cc4
	ldr r1, [r4, #0x4f8]
	cmp r1, #0
	bne _02002ccc
	add r1, r4, #0x40
	bl func_02018544
	ldr r0, [r4, #0x24]
	add r1, r4, #0x44
	bl func_02018580
	b _02002ccc
_02002cc4:
	mov r0, #0
	str r0, [r4, #0x40]
_02002ccc:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x50]
	str r0, [r4, #0x24]
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	str r1, [r4]
	ldr r1, [r4, #0x4f8]
	str r1, [r4, #0x504]
	bl func_02002ebc
	pop {r4, pc}
_02002cfc:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02002d20
	ldr r1, [r4, #0x4f8]
	cmp r1, #0
	bne _02002d28
	add r1, r4, #0x3c
	bl func_020184f8
	b _02002d28
_02002d20:
	mov r0, #0
	str r0, [r4, #0x3c]
_02002d28:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x4c]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	orr r0, r0, #0x14
	str r0, [r4]
	ldr r0, [r4, #0x4f8]
	str r0, [r4, #0x500]
	pop {r4, pc}
_02002d54:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02002d84
	ldr r1, [r4, #0x4f8]
	cmp r1, #0
	bne _02002d8c
	add r1, r4, #0x40
	bl func_02018544
	ldr r0, [r4, #0x24]
	add r1, r4, #0x44
	bl func_02018580
	b _02002d8c
_02002d84:
	mov r0, #0
	str r0, [r4, #0x40]
_02002d8c:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x50]
	str r0, [r4, #0x24]
	ldr r1, [r4]
	mov r0, r4
	bic r1, r1, #0x3fc
	str r1, [r4]
	ldr r1, [r4, #0x4f8]
	str r1, [r4, #0x504]
	bl func_0200309c
	pop {r4, pc}
_02002dbc:
	ldr r0, [r4, #0x45c]
	cmp r0, #0
	beq _02002dcc
	bl func_02031f14
_02002dcc:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x45c]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	str r0, [r4]
	ldr r0, [r4, #0x45c]
	cmp r0, #0
	popeq {r4, pc}
	add r0, r4, #0x74
	add r0, r0, #0x400
	bl func_02017ee0
	add r0, r4, #0x9c
	add r0, r0, #0x400
	bl func_020180f0
	bl func_02030f7c
	ldr r0, [r4, #0x45c]
	bl func_02022ea0
	pop {r4, pc}
_02002e1c:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x460]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	str r0, [r4]
	pop {r4, pc}
_02002e3c:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x464]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	str r0, [r4]
	pop {r4, pc}
_02002e5c:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x468]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	str r0, [r4]
	pop {r4, pc}
_02002e7c:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x46c]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	str r0, [r4]
	pop {r4, pc}
_02002e9c:
	ldr r1, [r4, #0x24]
	mov r0, #0
	str r1, [r4, #0x470]
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bic r0, r0, #0x3fc
	str r0, [r4]
	pop {r4, pc}
	arm_func_end func_02002b94

	arm_func_start func_02002ebc
func_02002ebc: @ 0x02002ebc
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r0, [r5, #8]
	ldr r0, [r0, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _02002ef4
_02002edc: @ jump table
	b _02002eec @ case 0
	b _02002eec @ case 1
	b _02002eec @ case 2
	b _02002eec @ case 3
_02002eec:
	mov r0, #1
	b _02002ef8
_02002ef4:
	mov r0, #0
_02002ef8:
	cmp r0, #0
	ldrne r4, [r5, #0x440]
	ldreq r4, [r5, #0x444]
	cmp r4, #0
	ldrne r2, [r5, #0x40]
	cmpne r2, #0
	beq _02002f84
	ldr r1, [r5, #0x44]
	cmp r1, #0
	beq _02002f70
	ldrh r0, [r1]
	ldr r7, [r1, #4]
	ldr r8, [r2, #0xc]
	cmp r0, #0
	mov sb, #0
	ble _02002f84
	mov r6, #0x20
_02002f3c:
	lsl r0, sb, #1
	ldrh r2, [r7, r0]
	mov r0, r4
	mov r3, r6
	add r1, r8, sb, lsl #5
	lsl r2, r2, #5
	bl func_02006148
	ldr r0, [r5, #0x44]
	add sb, sb, #1
	ldrh r0, [r0]
	cmp sb, r0
	blt _02002f3c
	b _02002f84
_02002f70:
	ldr r1, [r2, #0xc]
	ldr r3, [r2, #8]
	mov r0, r4
	mov r2, #0
	bl func_02006148
_02002f84:
	ldr r6, [r5, #0x38]
	cmp r6, #0
	beq _02003024
	ldr r0, [r5, #0x454]
	mov r7, #0
	cmp r0, #0
	beq _02002fd0
	ldr r7, [r6, #8]
	add r0, r7, #0x10
	bl func_02003a84
	mov r6, r0
	ldr r0, [r5, #0x38]
	mov r1, r6
	add r2, r7, #0x10
	mov r7, #1
	bl func_02003394
	mov r0, r5
	mov r1, r6
	bl func_02003290
_02002fd0:
	cmp r4, #0
	movne r1, #0
	ldreq r1, [r5, #0x44]
	cmp r4, #0
	movne r3, #0
	ldreq r3, [r5, #0x40]
	ldr r2, [r5, #8]
	mov r0, #0
	stm sp, {r0, r1}
	ldr r0, [r2, #0x14]
	mov r1, r6
	str r0, [sp, #8]
	ldr r0, [r2, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r2, #4]
	ldr r2, [r5, #0x3c]
	bl func_0201bfc0
	cmp r7, #0
	beq _02003024
	mov r0, r6
	bl func_02003ae0
_02003024:
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _02003040
	ldr r1, [r5, #0x4fc]
	cmp r1, #0
	bne _02003040
	bl func_02003ae0
_02003040:
	ldr r0, [r5, #0x4c]
	cmp r0, #0
	beq _0200305c
	ldr r1, [r5, #0x500]
	cmp r1, #0
	bne _0200305c
	bl func_02003ae0
_0200305c:
	ldr r0, [r5, #0x50]
	cmp r0, #0
	beq _02003078
	ldr r1, [r5, #0x504]
	cmp r1, #0
	bne _02003078
	bl func_02003ae0
_02003078:
	mov r0, #0
	str r0, [r5, #0x48]
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4fc]
	str r0, [r5, #0x500]
	str r0, [r5, #0x504]
	add sp, sp, #0x10
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end func_02002ebc

	arm_func_start func_0200309c
func_0200309c: @ 0x0200309c
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #0x3c
	mov r4, r0
	ldr r0, [r4, #8]
	ldrsb r0, [r0, #2]
	cmp r0, #0
	bge _020030d4
	add r0, sp, #0x18
	bl func_020192cc
	add r0, sp, #4
	bl func_02019310
	add r5, sp, #0x18
	add r6, sp, #4
	b _020030fc
_020030d4:
	ldr r0, [r4]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1c
	bl func_0200989c
	ldr r1, [r4]
	mov r5, r0
	lsl r0, r1, #0xd
	lsr r0, r0, #0x1c
	bl func_020098b0
	mov r6, r0
_020030fc:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0200311c
	ldr r2, [r4, #8]
	mov r3, r5
	ldr r1, [r2, #0x1c]
	ldr r2, [r2, #0x24]
	bl func_02019364
_0200311c:
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq _02003140
	ldr r3, [r4, #8]
	str r6, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r3, #0x20]
	ldr r3, [r3, #0x24]
	bl func_02019590
_02003140:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0200315c
	ldr r1, [r4, #0x500]
	cmp r1, #0
	bne _0200315c
	bl func_02003ae0
_0200315c:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _02003178
	ldr r1, [r4, #0x504]
	cmp r1, #0
	bne _02003178
	bl func_02003ae0
_02003178:
	mov r0, #0
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	str r0, [r4, #0x500]
	str r0, [r4, #0x504]
	add sp, sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	arm_func_end func_0200309c

	arm_func_start func_02003194
func_02003194: @ 0x02003194
	str r1, [r0, #0x440]
	bx lr
	arm_func_end func_02003194

	arm_func_start func_0200319c
func_0200319c: @ 0x0200319c
	str r1, [r0, #0x444]
	bx lr
	arm_func_end func_0200319c

	arm_func_start func_020031a4
func_020031a4: @ 0x020031a4
	str r1, [r0, #0x448]
	str r2, [r0, #0x44c]
	str r3, [r0, #0x450]
	bx lr
	arm_func_end func_020031a4

	arm_func_start func_020031b4
func_020031b4: @ 0x020031b4
	push {r3, r4, r5, lr}
	mov r4, #0
	mov lr, r4
_020031c0:
	mov r5, lr
_020031c4:
	rsb r1, r5, #0x1f
	lsl r2, r1, #1
	lsl ip, r5, #1
	ldrh r1, [r0, r2]
	ldrh r3, [r0, ip]
	add r5, r5, #1
	eor r1, r1, #0x400
	strh r1, [r0, ip]
	eor r1, r3, #0x400
	strh r1, [r0, r2]
	cmp r5, #0x10
	blt _020031c4
	add r4, r4, #1
	cmp r4, #0x20
	add r0, r0, #0x40
	blt _020031c0
	pop {r3, r4, r5, pc}
	arm_func_end func_020031b4

	arm_func_start func_02003208
func_02003208: @ 0x02003208
	push {r3, r4, r5, lr}
	mov r4, #0
	add lr, r0, #0x7c0
	mov ip, r4
_02003218:
	mov r5, ip
_0200321c:
	lsl r3, r5, #1
	ldrh r1, [lr, r3]
	ldrh r2, [r0, r3]
	add r5, r5, #1
	eor r1, r1, #0x800
	strh r1, [r0, r3]
	eor r1, r2, #0x800
	strh r1, [lr, r3]
	cmp r5, #0x20
	blt _0200321c
	add r4, r4, #1
	cmp r4, #0x10
	add r0, r0, #0x40
	sub lr, lr, #0x40
	blt _02003218
	pop {r3, r4, r5, pc}
	arm_func_end func_02003208

	arm_func_start func_0200325c
func_0200325c: @ 0x0200325c
	add r1, r0, #0xfe
	add r3, r1, #0x700
	mov ip, #0
_02003268:
	ldrh r1, [r3]
	ldrh r2, [r0]
	add ip, ip, #1
	eor r1, r1, #0xc00
	strh r1, [r0], #2
	eor r1, r2, #0xc00
	cmp ip, #0x200
	strh r1, [r3], #-2
	blt _02003268
	bx lr
	arm_func_end func_0200325c

	arm_func_start func_02003290
func_02003290: @ 0x02003290
	push {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r0, [r4, #0x458]
	cmp r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r1, #2]
	ldrh r2, [r1]
	add r5, r1, #0xc
	lsr r0, r0, #8
	lsr r1, r2, #8
	mul r7, r1, r0
	mov r6, #0
	cmp r7, #0
	pople {r3, r4, r5, r6, r7, pc}
_020032c8:
	ldr r0, [r4, #0x458]
	cmp r0, #1
	beq _020032e8
	cmp r0, #2
	beq _020032f4
	cmp r0, #3
	beq _02003300
	b _02003308
_020032e8:
	mov r0, r5
	bl func_020031b4
	b _02003308
_020032f4:
	mov r0, r5
	bl func_02003208
	b _02003308
_02003300:
	mov r0, r5
	bl func_0200325c
_02003308:
	add r6, r6, #1
	cmp r6, r7
	add r5, r5, #0x800
	blt _020032c8
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end func_02003290

	arm_func_start func_0200331c
func_0200331c: @ 0x0200331c
	str r1, [r0, #0x458]
	bx lr
	arm_func_end func_0200331c

	arm_func_start func_02003324
func_02003324: @ 0x02003324
	push {r3, lr}
	ldr r0, [r0, #0x45c]
	cmp r0, #0
	moveq r0, #0
	popeq {r3, pc}
	bl func_02023598
	pop {r3, pc}
	arm_func_end func_02003324

	arm_func_start func_02003340
func_02003340: @ 0x02003340
	push {r3, lr}
	ldr r0, [r0, #0x45c]
	cmp r0, #0
	moveq r0, #0
	popeq {r3, pc}
	bl func_020235a8
	pop {r3, pc}
	arm_func_end func_02003340

	arm_func_start func_0200335c
func_0200335c: @ 0x0200335c
	ldr r0, [r0, #0x460]
	bx lr
	arm_func_end func_0200335c

	arm_func_start func_02003364
func_02003364: @ 0x02003364
	ldr r0, [r0, #0x464]
	bx lr
	arm_func_end func_02003364

	arm_func_start func_0200336c
func_0200336c: @ 0x0200336c
	ldr r0, [r0, #0x468]
	bx lr
	arm_func_end func_0200336c

	arm_func_start func_02003374
func_02003374: @ 0x02003374
	ldr r0, [r0, #0x46c]
	bx lr
	arm_func_end func_02003374

	arm_func_start func_0200337c
func_0200337c: @ 0x0200337c
	ldr r0, [r0, #0x470]
	bx lr
	arm_func_end func_0200337c
