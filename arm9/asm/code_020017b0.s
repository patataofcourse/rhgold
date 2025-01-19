@ code_020017b0.c (but in asm)

.include "global.s"

@ TODO: fix IO registers

.section .text

	arm_func_start func_020017b0
func_020017b0: @ 0x020017b0
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov lr, r2
	str r3, [sp]
	ldr ip, [sp, #0x18]
	ldr r0, _020017ec @ =0x04001030
	mov r1, r5
	mov r2, r4
	mov r3, lr
	str ip, [sp, #4]
	bl func_0202e58c
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_020017ec: .4byte 0x04001030
	arm_func_end func_020017b0

	arm_func_start func_020017f0
func_020017f0: @ 0x020017f0
	ldr r2, _02001810 @ =0x000001ff
	ldr ip, _02001814 @ =0x0400101c
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_02001810: .4byte 0x000001ff
_02001814: .4byte 0x0400101c
	arm_func_end func_020017f0

	arm_func_start func_02001818
func_02001818: @ 0x02001818
	ldr r1, _02001840 @ =0x0400100e
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001840: .4byte 0x0400100e
	arm_func_end func_02001818

	arm_func_start func_02001844
func_02001844: @ 0x02001844
	ldr r2, _0200185c @ =0x0400100e
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_0200185c: .4byte 0x0400100e
	arm_func_end func_02001844

	arm_func_start func_02001860
func_02001860: @ 0x02001860
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov lr, r2
	str r3, [sp]
	ldr ip, [sp, #0x18]
	ldr r0, _0200189c @ =0x04001020
	mov r1, r5
	mov r2, r4
	mov r3, lr
	str ip, [sp, #4]
	bl func_0202e58c
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0200189c: .4byte 0x04001020
	arm_func_end func_02001860

	arm_func_start func_020018a0
func_020018a0: @ 0x020018a0
	ldr r2, _020018c0 @ =0x000001ff
	ldr ip, _020018c4 @ =0x04001018
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_020018c0: .4byte 0x000001ff
_020018c4: .4byte 0x04001018
	arm_func_end func_020018a0

	arm_func_start func_020018c8
func_020018c8: @ 0x020018c8
	ldr r1, _020018f0 @ =0x0400100c
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_020018f0: .4byte 0x0400100c
	arm_func_end func_020018c8

	arm_func_start func_020018f4
func_020018f4: @ 0x020018f4
	ldr r2, _0200190c @ =0x0400100c
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_0200190c: .4byte 0x0400100c
	arm_func_end func_020018f4

	arm_func_start func_02001910
func_02001910: @ 0x02001910
	ldr r2, _02001930 @ =0x000001ff
	ldr ip, _02001934 @ =0x04001014
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_02001930: .4byte 0x000001ff
_02001934: .4byte 0x04001014
	arm_func_end func_02001910

	arm_func_start func_02001938
func_02001938: @ 0x02001938
	ldr r1, _02001960 @ =0x0400100a
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001960: .4byte 0x0400100a
	arm_func_end func_02001938

	arm_func_start func_02001964
func_02001964: @ 0x02001964
	ldr r2, _0200197c @ =0x0400100a
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_0200197c: .4byte 0x0400100a
	arm_func_end func_02001964

	arm_func_start func_02001980
func_02001980: @ 0x02001980
	ldr r2, _020019a0 @ =0x000001ff
	ldr ip, _020019a4 @ =0x04001010
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_020019a0: .4byte 0x000001ff
_020019a4: .4byte 0x04001010
	arm_func_end func_02001980

	arm_func_start func_020019a8
func_020019a8: @ 0x020019a8
	ldr r1, _020019d0 @ =0x04001008
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_020019d0: .4byte 0x04001008
	arm_func_end func_020019a8

	arm_func_start func_020019d4
func_020019d4: @ 0x020019d4
	ldr r2, _020019ec @ =0x04001008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020019ec: .4byte 0x04001008
	arm_func_end func_020019d4

	arm_func_start func_020019f0
func_020019f0: @ 0x020019f0
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov lr, r2
	str r3, [sp]
	ldr ip, [sp, #0x18]
	ldr r0, _02001a2c @ =0x04000030
	mov r1, r5
	mov r2, r4
	mov r3, lr
	str ip, [sp, #4]
	bl func_0202e58c
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02001a2c: .4byte 0x04000030
	arm_func_end func_020019f0

	arm_func_start func_02001a30
func_02001a30: @ 0x02001a30
	ldr r2, _02001a50 @ =0x000001ff
	ldr ip, _02001a54 @ =0x0400001c
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_02001a50: .4byte 0x000001ff
_02001a54: .4byte 0x0400001c
	arm_func_end func_02001a30

	arm_func_start func_02001a58
func_02001a58: @ 0x02001a58
	ldr r1, _02001a80 @ =0x0400000e
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001a80: .4byte 0x0400000e
	arm_func_end func_02001a58

	arm_func_start func_02001a84
func_02001a84: @ 0x02001a84
	ldr r2, _02001a9c @ =0x0400000e
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02001a9c: .4byte 0x0400000e
	arm_func_end func_02001a84

	arm_func_start func_02001aa0
func_02001aa0: @ 0x02001aa0
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov lr, r2
	str r3, [sp]
	ldr ip, [sp, #0x18]
	ldr r0, _02001adc @ =0x04000020
	mov r1, r5
	mov r2, r4
	mov r3, lr
	str ip, [sp, #4]
	bl func_0202e58c
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02001adc: .4byte 0x04000020
	arm_func_end func_02001aa0

	arm_func_start func_02001ae0
func_02001ae0: @ 0x02001ae0
	ldr r2, _02001b00 @ =0x000001ff
	ldr ip, _02001b04 @ =0x04000018
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_02001b00: .4byte 0x000001ff
_02001b04: .4byte 0x04000018
	arm_func_end func_02001ae0

	arm_func_start func_02001b08
func_02001b08: @ 0x02001b08
	ldr r1, _02001b30 @ =0x0400000c
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001b30: .4byte 0x0400000c
	arm_func_end func_02001b08

	arm_func_start func_02001b34
func_02001b34: @ 0x02001b34
	ldr r2, _02001b4c @ =0x0400000c
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02001b4c: .4byte 0x0400000c
	arm_func_end func_02001b34

	arm_func_start func_02001b50
func_02001b50: @ 0x02001b50
	ldr r2, _02001b70 @ =0x000001ff
	ldr ip, _02001b74 @ =0x04000014
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_02001b70: .4byte 0x000001ff
_02001b74: .4byte 0x04000014
	arm_func_end func_02001b50

	arm_func_start func_02001b78
func_02001b78: @ 0x02001b78
	ldr r1, _02001ba0 @ =0x0400000a
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001ba0: .4byte 0x0400000a
	arm_func_end func_02001b78

	arm_func_start func_02001ba4
func_02001ba4: @ 0x02001ba4
	ldr r2, _02001bbc @ =0x0400000a
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02001bbc: .4byte 0x0400000a
	arm_func_end func_02001ba4

	arm_func_start func_02001bc0
func_02001bc0: @ 0x02001bc0
	ldr r2, _02001be0 @ =0x000001ff
	ldr ip, _02001be4 @ =0x04000010
	lsl r3, r2, #0x10
	and r2, r0, r2
	and r0, r3, r1, lsl #16
	orr r0, r2, r0
	str r0, [ip]
	bx lr
	.align 2, 0
_02001be0: .4byte 0x000001ff
_02001be4: .4byte 0x04000010
	arm_func_end func_02001bc0

	arm_func_start func_02001be8
func_02001be8: @ 0x02001be8
	ldr r1, _02001c10 @ =0x04000008
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #0x40
	streqh r0, [r1]
	bxeq lr
	ldrh r0, [r1]
	orr r0, r0, #0x40
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001c10: .4byte 0x04000008
	arm_func_end func_02001be8
_02001c14:
	.byte 0x10, 0x20, 0x9f, 0xe5, 0xb0, 0x10, 0xd2, 0xe1, 0x03, 0x10, 0xc1, 0xe3
	.byte 0x00, 0x00, 0x81, 0xe1, 0xb0, 0x00, 0xc2, 0xe1, 0x1e, 0xff, 0x2f, 0xe1, 0x08, 0x00, 0x00, 0x04

	arm_func_start func_02001c30
func_02001c30: @ 0x02001c30
	push {r4, lr}
	mov r4, r0
	ldr r2, [r4]
	and r1, r1, #7
	bic r2, r2, #7
	orr r1, r2, r1
	str r1, [r4]
	bl func_02001c5c
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_02001c30

	arm_func_start func_02001c58
func_02001c58:
	bx lr
	arm_func_end func_02001c58

	arm_func_start func_02001c5c
func_02001c5c: @ 0x02001c5c
	push {r3, r4, r5, lr}
	ldr r1, [r0]
	mov r3, #3
	orr r5, r1, #8
	lsl lr, r5, #0x1d
	ldr r1, _02001cc4 @ =0xaaaaaaab
	lsr r2, lr, #0x1d
	umull r1, r4, r2, r1
	lsr r4, r4, #1
	umull r1, r2, r3, r4
	rsb r4, r1, lr, lsr #29
	bic r2, r5, #0x30
	lsl r1, r4, #0x1e
	orr r1, r2, r1, lsr #26
	bic r1, r1, #0x40
	mov ip, #0
	str r1, [r0]
	strh ip, [r0, #0xa]
	strh ip, [r0, #8]
	ldr r1, [r0]
	bic r1, r1, #0x80
	bic r2, r1, #0x100
	bic r1, r2, #0x200
	bic r1, r1, #0x400
	str r1, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02001cc4: .4byte 0xaaaaaaab
	arm_func_end func_02001c5c

	arm_func_start func_02001cc8
func_02001cc8: @ 0x02001cc8
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r1, [r5]
	lsl r0, r1, #0x1c
	lsrs r0, r0, #0x1f
	popeq {r3, r4, r5, pc}
	lsl r0, r1, #0x1d
	lsr r2, r0, #0x1d
	ldr r3, _02001d60 @ =0x02045d20
	lsl r0, r1, #0x1a
	ldr r1, [r3, r2, lsl #4]
	lsr r0, r0, #0x1e
	add r4, r3, r2, lsl #4
	blx r1
	ldr r0, [r5]
	ldr r1, [r4, #4]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	blx r1
	ldr r0, [r5]
	lsl r0, r0, #0x18
	lsrs r0, r0, #0x1f
	ldrne r0, [r4, #0xc]
	cmpne r0, #0
	popne {r3, r4, r5, pc}
	ldr r1, [r5]
	ldr r2, [r5]
	lsl r1, r1, #0x17
	lsrs r1, r1, #0x1f
	ldrsh r0, [r5, #8]
	ldrsh r1, [r5, #0xa]
	lsl r2, r2, #0x16
	rsbne r0, r0, #0
	lsrs r2, r2, #0x1f
	ldr r2, [r4, #8]
	rsbne r1, r1, #0x40
	blx r2
	pop {r3, r4, r5, pc}
	.align 2, 0
_02001d60: .4byte D_02045d20
	arm_func_end func_02001cc8

	arm_func_start func_02001d64
func_02001d64: @ 0x02001d64
	ldr r2, [r0]
	lsl r1, r1, #0x1f
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	str r1, [r0]
	bx lr
	arm_func_end func_02001d64

	arm_func_start func_02001d7c
func_02001d7c: @ 0x02001d7c
	ldr r2, [r0]
	lsl r1, r1, #0x1e
	bic r2, r2, #0x30
	orr r1, r2, r1, lsr #26
	str r1, [r0]
	bx lr
	arm_func_end func_02001d7c

	arm_func_start func_02001d94
func_02001d94: @ 0x02001d94
	ldr r3, [r0]
	lsl r3, r3, #0x15
	lsrs r3, r3, #0x1f
	streqh r1, [r0, #8]
	streqh r2, [r0, #0xa]
	bxeq lr
	rsb r2, r2, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end func_02001d94

	arm_func_start func_02001dbc
func_02001dbc: @ 0x02001dbc
	ldr r2, [r0]
	lsl r2, r2, #0x15
	lsrs r2, r2, #0x1f
	strneh r1, [r0, #0xa]
	streqh r1, [r0, #8]
	bx lr
	arm_func_end func_02001dbc

	arm_func_start func_02001dd4
func_02001dd4: @ 0x02001dd4
	ldr r2, [r0]
	lsl r1, r1, #0x1f
	bic r2, r2, #0x100
	orr r1, r2, r1, lsr #23
	str r1, [r0]
	bx lr
	arm_func_end func_02001dd4

	arm_func_start func_02001dec
func_02001dec: @ 0x02001dec
	ldr r2, [r0]
	lsl r1, r1, #0x1f
	bic r2, r2, #0x200
	orr r1, r2, r1, lsr #22
	str r1, [r0]
	bx lr
	arm_func_end func_02001dec

	arm_func_start func_02001e04
func_02001e04: @ 0x02001e04
	ldr r2, [r0]
	lsl r1, r1, #0x1f
	bic r2, r2, #0x400
	orr r1, r2, r1, lsr #21
	str r1, [r0]
	bx lr
	arm_func_end func_02001e04
