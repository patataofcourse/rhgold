@ code_02003384.c (but in asm)

.include "global.s"

.section .text

	arm_func_start func_02003384
func_02003384: @ 0x02003384
	ldr r1, _02003390 @ =0x02045dcc
	str r0, [r1]
	bx lr
	.align 2, 0
_02003390: .4byte 0x02045dcc
	arm_func_end func_02003384

	arm_func_start func_02003394
func_02003394: @ 0x02003394
	push {r4, r5, r6, lr}
	mov r4, r2
	mov r5, r1
	mov r1, r4
	mov r6, r0
	bl func_02030fe8
	mov r0, r5
	mov r1, r4
	bl func_02030fe8
	ldr r0, _020033d4 @ =0x02045dcc
	mov r1, r6
	ldr r0, [r0]
	mov r2, r5
	mov r3, r4
	bl func_02031fc0
	pop {r4, r5, r6, pc}
	.align 2, 0
_020033d4: .4byte 0x02045dcc
	arm_func_end func_02003394
_020033d8:
	.byte 0x4c, 0x20, 0x9f, 0xe5, 0x4c, 0x10, 0x9f, 0xe5
	.byte 0xb0, 0x30, 0xd2, 0xe1, 0xb0, 0x20, 0xd1, 0xe1, 0x44, 0x10, 0x9f, 0xe5, 0x00, 0xc0, 0xa0, 0xe3
	.byte 0x02, 0x20, 0x83, 0xe1, 0x01, 0x20, 0x22, 0xe0, 0x01, 0x10, 0x02, 0xe0, 0xb0, 0x10, 0xc0, 0xe1
	.byte 0xb2, 0xc0, 0xc0, 0xe1, 0xb4, 0xc0, 0xc0, 0xe1, 0xb6, 0xc0, 0xc0, 0xe1, 0xb0, 0x30, 0xd0, 0xe1
	.byte 0x0c, 0x20, 0xa0, 0xe3, 0x03, 0x10, 0xa0, 0xe3, 0xbe, 0x30, 0xc0, 0xe1, 0xb8, 0xc0, 0xc0, 0xe1
	.byte 0xba, 0x20, 0xc0, 0xe1, 0xbc, 0x10, 0xc0, 0xe1, 0x1e, 0xff, 0x2f, 0xe1, 0x30, 0x01, 0x00, 0x04
	.byte 0xa8, 0xff, 0x7f, 0x02, 0xff, 0x2f, 0x00, 0x00

	arm_func_start func_02003438
func_02003438: @ 0x02003438
	ldr r2, _020034fc @ =0x04000130
	ldr r1, _02003500 @ =0x027fffa8
	ldrh ip, [r2]
	ldrh r3, [r1]
	ldr r1, _02003504 @ =0x00002fff
	ldrh r2, [r0]
	orr r3, ip, r3
	eor r3, r3, r1
	and r1, r3, r1
	lsl r1, r1, #0x10
	eor r2, r2, r1, lsr #16
	and r2, r2, r1, lsr #16
	strh r2, [r0, #2]
	ldrh r2, [r0]
	lsr r3, r1, #0x10
	eor r1, r2, r1, lsr #16
	and r1, r2, r1
	strh r1, [r0, #4]
	strh r3, [r0]
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _020034a0
	strh r1, [r0, #6]
	mov r1, #0
	strh r1, [r0, #8]
	bx lr
_020034a0:
	mov r3, #0
	strh r3, [r0, #6]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0]
	cmp r2, r1
	bne _020034ec
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	ldrh r3, [r0, #0xa]
	ldrh r1, [r0, #0xc]
	ldrh r2, [r0, #8]
	add r1, r3, r1
	cmp r2, r1
	blt _020034f0
	strh r3, [r0, #8]
	ldrh r1, [r0]
	strh r1, [r0, #6]
	b _020034f0
_020034ec:
	strh r3, [r0, #8]
_020034f0:
	ldrh r1, [r0]
	strh r1, [r0, #0xe]
	bx lr
	.align 2, 0
_020034fc: .4byte 0x04000130
_02003500: .4byte 0x027fffa8
_02003504: .4byte 0x00002fff
	arm_func_end func_02003438

	arm_func_start func_02003508
func_02003508: @ 0x02003508
	ldrh r0, [r0]
	and r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	arm_func_end func_02003508

	arm_func_start func_0200351c
func_0200351c: @ 0x0200351c
	ldrh r0, [r0, #2]
	and r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	arm_func_end func_0200351c

	arm_func_start func_02003530
func_02003530: @ 0x02003530
	ldrh r0, [r0, #4]
	and r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	arm_func_end func_02003530

	arm_func_start func_02003544
func_02003544: @ 0x02003544
	ldrh r0, [r0, #6]
	and r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	arm_func_end func_02003544

	arm_func_start func_02003558
func_02003558: @ 0x02003558
	cmp r0, #0
	ldrne r0, [r0, #4]
	moveq r0, #0
	bx lr
	arm_func_end func_02003558
