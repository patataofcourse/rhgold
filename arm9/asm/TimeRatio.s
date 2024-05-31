@ TimeRatio.cpp (but in asm)

.include "global.s"

.section .text

	arm_func_start func_02004d98
func_02004d98: @ 0x02004d98
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r7, r1
	mov r5, r2
	mov r4, r3
	bl func_020035f0
	ldr r1, [r6, #0x14]
	lsl r0, r7, #0x1c
	bic r1, r1, #0xf0
	orr r2, r1, r0, lsr #0x18
	bic r1, r2, #0xf00
	lsl r0, r5, #0x1c
	orr r1, r1, r0, lsr #0x14
	str r1, [r6, #0x14]
	mov r3, #0x0
	str r3, [r6, #0x1c]
	ldr r2, [r6, #0x14]
	mov r0, #0x1
	lsl r1, r4, #0x1f
	bic r2, r2, #0x1000
	orr r2, r2, r1, lsr #0x13
	bic r1, r2, #0x2000
	bic r1, r1, #0x4000
	lsl r0, r0, r5
	str r1, [r6, #0x14]
	str r0, [r6, #0x20]
	str r3, [r6, #0x24]
	ldr r3, [r6, #0x20]
	ldr r2, _02004e2c
	mov r0, r6
	smull r1, r4, r2, r3
	add r4, r4, r3, lsr #0x1f
	str r4, [r6, #0x24]
	ldr r1, [r0, #0x0]
	ldr r1, [r1, #0xc]
	blx r1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02004e2c: .4byte 0x55555556
	arm_func_end func_02004d98

	arm_func_start func_02004e30
func_02004e30: @ 0x02004e30
	bx lr
	arm_func_end func_02004e30

	arm_func_start func_02004e34
func_02004e34: @ 0x02004e34
	ldr r3, [r0, #0x14]
	and r1, r1, #0xf
	bic r3, r3, #0xf
	orr r1, r3, r1
	str r1, [r0, #0x14]
	ldr r12, _02004e58
	mov r1, #0x0
	str r2, [r0, #0x1c]
	bx r12
	.align 2, 0
_02004e58: .4byte func_020050f4
	arm_func_end func_02004e34

	arm_func_start func_02004e5c
func_02004e5c: @ 0x02004e5c
	ldr r0, [r0, #0x14]
	cmp r1, #0x0
	lsl r2, r0, #0x18
	rsblt r1, r1, #0x0
	mov r3, #0x0
	lsrs r12, r2, #0x1c
	beq _02004e94
	lsl r0, r0, #0x14
	lsr r2, r0, #0x1c
_02004e80:
	mul r0, r1, r1
	add r3, r3, #0x1
	cmp r3, r12
	asr r1, r0, r2
	bcc _02004e80
_02004e94:
	mov r0, r1
	bx lr
	arm_func_end func_02004e5c

	arm_func_start func_02004e9c
func_02004e9c: @ 0x02004e9c
	ldr r12, [r0, #0x28]
	cmp r12, #0x0
	moveq r0, r1
	bxeq lr
	ldr r3, [r0, #0x20]
	cmp r12, r3
	beq _02004ed0
	sub r2, r2, r1
	mul r2, r12, r2
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1c
	add r2, r1, r2, asr r0
_02004ed0:
	mov r0, r2
	bx lr
	arm_func_end func_02004e9c

	arm_func_start func_02004ed8
func_02004ed8: @ 0x02004ed8
	push {r4, r5, r6, lr}
	mov r6, r0
	ldr r3, [r6, #0x24]
	mov r5, r1
	mul r0, r3, r2
	ldr r4, [r6, #0x20]
	ldr r1, [r6, #0x1c]
	sub r5, r4, r5
	bl func_0203b648
	sub r1, r4, r0
	ldr r0, [r6, #0x14]
	mul r1, r5, r1
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1c
	sub r0, r4, r1, asr r0
	pop {r4, r5, r6, pc}
	arm_func_end func_02004ed8

	arm_func_start func_02004f18
func_02004f18: @ 0x02004f18
	push {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x1c]
	cmp r1, #0x0
	ldrne r2, [r4, #0x18]
	cmpne r2, r1
	bne _02004f50
	ldr r1, [r4, #0x20]
	mov r0, r4
	str r1, [r4, #0x28]
	ldr r1, [r0, #0x0]
	ldr r1, [r1, #0x8]
	blx r1
	pop {r4, pc}
_02004f50:
	cmp r2, #0x0
	bne _02004f70
	mov r1, #0x0
	str r1, [r4, #0x28]
	ldr r1, [r0, #0x0]
	ldr r1, [r1, #0x8]
	blx r1
	pop {r4, pc}
_02004f70:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1c
	lsl r0, r2, r0
	bl func_0203b648
	ldr r2, [r4, #0x14]
	mov r1, r0
	lsl r0, r2, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #0x4
	addls pc, pc, r0, lsl #0x2
	b _020050d8
	b _020050d8
	b _02004fb4
	b _02004fd4
	b _0200503c
	b _02005070
_02004fb4:
	mov r0, r4
	bl func_02004e5c
	mov r1, r0
	ldr r2, [r4, #0x18]
	mov r0, r4
	bl func_02004ed8
	mov r1, r0
	b _020050d8
_02004fd4:
	ldr r2, [r4, #0x20]
	lsl r1, r1, #0x1
	cmp r2, r1
	mov r0, r4
	ble _02005008
	bl func_02004e5c
	ldr r2, [r4, #0x18]
	mov r1, r0
	mov r0, r4
	lsl r2, r2, #0x1
	bl func_02004ed8
	mov r1, r0
	b _02005034
_02005008:
	sub r1, r1, r2, lsl #0x1
	bl func_02004e5c
	mov r1, r0
	ldr r3, [r4, #0x1c]
	ldr r2, [r4, #0x18]
	mov r0, r4
	sub r2, r3, r2
	lsl r2, r2, #0x1
	bl func_02004ed8
	ldr r1, [r4, #0x20]
	rsb r1, r0, r1, lsl #0x1
_02005034:
	asr r1, r1, #0x1
	b _020050d8
_0200503c:
	ldr r2, [r4, #0x20]
	mov r0, r4
	sub r1, r1, r2
	bl func_02004e5c
	mov r1, r0
	ldr r3, [r4, #0x1c]
	ldr r2, [r4, #0x18]
	mov r0, r4
	sub r2, r3, r2
	bl func_02004ed8
	ldr r1, [r4, #0x20]
	sub r1, r1, r0
	b _020050d8
_02005070:
	ldr r2, [r4, #0x20]
	lsl r3, r1, #0x1
	cmp r2, r1, lsl #0x1
	mov r0, r4
	sub r1, r3, r2
	ble _020050b0
	bl func_02004e5c
	mov r1, r0
	ldr r3, [r4, #0x1c]
	ldr r2, [r4, #0x18]
	mov r0, r4
	sub r2, r3, r2, lsl #0x1
	bl func_02004ed8
	ldr r1, [r4, #0x20]
	sub r1, r1, r0
	b _020050d4
_020050b0:
	bl func_02004e5c
	mov r1, r0
	ldr r3, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	mov r0, r4
	rsb r2, r2, r3, lsl #0x1
	bl func_02004ed8
	ldr r1, [r4, #0x20]
	add r1, r0, r1
_020050d4:
	asr r1, r1, #0x1
_020050d8:
	mov r0, r4
	str r1, [r4, #0x28]
	ldr r1, [r0, #0x0]
	ldr r1, [r1, #0x8]
	blx r1
	pop {r4, pc}
	arm_func_end func_02004f18

	arm_func_start func_020050f0
func_020050f0: @ 0x020050f0
	bx lr
	arm_func_end func_020050f0

	arm_func_start func_020050f4
func_020050f4: @ 0x020050f4
	str r1, [r0, #0x18]
	ldr r1, [r0, #0x14]
	ldr r12, _0200510c
	bic r1, r1, #0x2000
	str r1, [r0, #0x14]
	bx r12
	.align 2, 0
_0200510c: .4byte func_02004f18
	arm_func_end func_020050f4

	arm_func_start func_02005110
func_02005110: @ 0x02005110
	push {r3, lr}
	ldr r2, [r0, #0x14]
	lsl r2, r2, #0x12
	lsrs r2, r2, #0x1f
	popne {r3, pc}
	ldr r2, [r0, #0x18]
	add r1, r2, r1
	str r1, [r0, #0x18]
	ldr r1, [r0, #0x14]
	lsl r1, r1, #0x13
	lsrs r1, r1, #0x1f
	beq _02005168
	ldr r2, [r0, #0x1c]
	ldr r1, [r0, #0x18]
	cmp r1, r2
	blt _02005168
	str r2, [r0, #0x18]
	ldr r1, [r0, #0x14]
	lsl r2, r1, #0x11
	lsrs r2, r2, #0x1f
	orrne r1, r1, #0x2000
	strne r1, [r0, #0x14]
_02005168:
	bl func_02004f18
	pop {r3, pc}
	arm_func_end func_02005110

	arm_func_start func_02005170
func_02005170: @ 0x02005170
	ldr r0, [r0, #0x28]
	bx lr
	arm_func_end func_02005170

	arm_func_start func_02005178
func_02005178: @ 0x02005178
	cmp r1, #0x0
	movne r1, #0x1
	ldr r2, [r0, #0x14]
	moveq r1, #0x0
	lsl r1, r1, #0x1f
	bic r2, r2, #0x4000
	orr r1, r2, r1, lsr #0x11
	str r1, [r0, #0x14]
	bx lr
	arm_func_end func_02005178

	arm_func_start func_0200519c
func_0200519c: @ 0x0200519c
	push {r4, lr}
	mov r4, r0
	bl func_020051b0
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_0200519c

	arm_func_start func_020051b0
func_020051b0: @ 0x020051b0
	mov r1, #0x1000
	str r1, [r0, #0x0]
	mov r1, #0x0
	str r1, [r0, #0x4]
	str r1, [r0, #0x8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end func_020051b0

	arm_func_start func_020051d0
func_020051d0: @ 0x020051d0
	str r1, [r0, #0x8]
	mov r1, #0x0
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end func_020051d0

	arm_func_start func_020051e4
func_020051e4: @ 0x020051e4
	push {r3, lr}
	ldr r1, [r0, #0x10]
	cmp r1, #0x0
	beq _02005200
	mov r0, r1
	bl func_020051e4
	pop {r3, pc}
_02005200:
	ldr r1, [r0, #0xc]
	cmp r1, #0x0
	ldrne r2, [r1, #0x0]
	ldr r1, [r0, #0x0]
	ldreq r2, [r0, #0x8]
	cmp r1, #0x1000
	mulne r1, r2, r1
	ldr r0, [r0, #0x4]
	asrne r2, r1, #0xc
	add r0, r2, r0
	pop {r3, pc}
	arm_func_end func_020051e4

	arm_func_start func_0200522c
func_0200522c: @ 0x0200522c
	push {r4, lr}
	mov r4, r0
	bl func_02003568
	ldr r1, _02005268
	add r0, r4, #0x2c
	str r1, [r4, #0x0]
	bl func_0200519c
	add r0, r4, #0x40
	bl func_0200519c
	mov r0, r4
	ldr r1, [r0, #0x0]
	ldr r1, [r1, #0xc]
	blx r1
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_02005268: .4byte D_02045ec0
	arm_func_end func_0200522c

	arm_func_start func_0200526c
func_0200526c: @ 0x0200526c
	push {r4, lr}
	mov r4, r0
	add r0, r4, #0x2c
	bl func_020051b0
	add r0, r4, #0x40
	bl func_020051b0
	mov r0, #0x0
	str r0, [r4, #0x54]
	pop {r4, pc}
	arm_func_end func_0200526c

	arm_func_start func_02005290
func_02005290: @ 0x02005290
	push {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #0x2c
	bl func_020051e4
	mov r4, r0
	add r0, r5, #0x40
	bl func_020051e4
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl func_02004e9c
	str r0, [r5, #0x54]
	mov r0, r5
	ldr r2, [r0, #0x0]
	ldr r1, [r5, #0x54]
	ldr r2, [r2, #0x10]
	blx r2
	pop {r3, r4, r5, pc}
	arm_func_end func_02005290

	arm_func_start func_020052d8
func_020052d8: @ 0x020052d8
	bx lr
	arm_func_end func_020052d8

	arm_func_start func_020052dc
func_020052dc: @ 0x020052dc
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	ldr r1, [r7, #0x54]
	mov r5, r2
	add r0, r7, #0x2c
	mov r4, r3
	bl func_020051d0
	mov r1, r5
	add r0, r7, #0x40
	bl func_020051d0
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl func_02004e34
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end func_020052dc

	arm_func_start func_0200531c
func_0200531c: @ 0x0200531c
	push {r4, lr}
	mov r4, r0
	bl func_02005330
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_0200531c

	arm_func_start func_02005330
func_02005330: @ 0x02005330
	mov r2, #0x1000
	mov r1, #0x0
	str r2, [r0, #0x0]
	str r1, [r0, #0x4]
	str r1, [r0, #0x10]
	str r1, [r0, #0xc]
	str r1, [r0, #0x8]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x18]
	str r1, [r0, #0x14]
	str r1, [r0, #0x28]
	str r1, [r0, #0x24]
	str r1, [r0, #0x20]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	bx lr
	arm_func_end func_02005330

	arm_func_start func_02005370
func_02005370: @ 0x02005370
	str r1, [r0, #0x20]
	str r2, [r0, #0x24]
	str r3, [r0, #0x28]
	mov r1, #0x0
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	bx lr
	arm_func_end func_02005370

	arm_func_start func_0200538c
func_0200538c: @ 0x0200538c
	ldr r3, [r1, #0x0]
	mov r2, #0x0
	str r3, [r0, #0x20]
	ldr r3, [r1, #0x4]
	str r3, [r0, #0x24]
	ldr r1, [r1, #0x8]
	str r1, [r0, #0x28]
	str r2, [r0, #0x2c]
	str r2, [r0, #0x30]
	bx lr
	arm_func_end func_0200538c

	arm_func_start func_020053b4
func_020053b4: @ 0x020053b4
	mov r2, #0x0
	str r2, [r0, #0x28]
	str r2, [r0, #0x24]
	str r2, [r0, #0x20]
	str r1, [r0, #0x2c]
	str r2, [r0, #0x30]
	bx lr
	arm_func_end func_020053b4

	arm_func_start func_020053d0
func_020053d0: @ 0x020053d0
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x9c
	mov r8, r0
	ldr r0, [r8, #0x30]
	mov r7, r1
	cmp r0, #0x0
	beq _020053f8
	add r1, sp, #0x0
	bl func_020053d0
	b _0200541c
_020053f8:
	ldr r1, [r8, #0x2c]
	cmp r1, #0x0
	addeq r1, r8, #0x20
	ldr r0, [r1, #0x0]
	str r0, [sp, #0x0]
	ldr r0, [r1, #0x4]
	str r0, [sp, #0x4]
	ldr r0, [r1, #0x8]
	str r0, [sp, #0x8]
_0200541c:
	ldr r1, [r8, #0x0]
	cmp r1, #0x1000
	beq _02005448
	add r0, sp, #0x78
	mov r2, r1
	mov r3, r1
	blx 0x0202bb9c @ TODO: wrong byte when assembled
	add r0, sp, #0x0
	add r1, sp, #0x78
	mov r2, r0
	bl func_0202bcc0
_02005448:
	ldr r0, [r8, #0x8]
	cmp r0, #0x0
	beq _0200547c
	asr r0, r0, #0x4
	lsl r1, r0, #0x1
	add r0, r1, #0x1
	ldr r2, _020056d4
	lsl r1, r1, #0x1
	lsl r0, r0, #0x1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r0]
	add r0, sp, #0x54
	blx 0x0202bc70 @ TODO: wrong byte when assembled
_0200547c:
	ldr r0, [r8, #0xc]
	cmp r0, #0x0
	beq _020054b0
	asr r0, r0, #0x4
	lsl r1, r0, #0x1
	add r0, r1, #0x1
	ldr r2, _020056d4
	lsl r1, r1, #0x1
	lsl r0, r0, #0x1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r0]
	add r0, sp, #0x30
	blx 0x0202bc8c @ TODO: wrong byte when assembled
_020054b0:
	ldr r0, [r8, #0x10]
	cmp r0, #0x0
	beq _020054e4
	asr r0, r0, #0x4
	lsl r1, r0, #0x1
	add r0, r1, #0x1
	ldr r2, _020056d4
	lsl r1, r1, #0x1
	lsl r0, r0, #0x1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r0]
	add r0, sp, #0xc
	blx 0x0202bca8 @ TODO: wrong byte when assembled
_020054e4:
	ldr r0, [r8, #0x4]
	cmp r0, #0x5
	addls pc, pc, r0, lsl #0x2
	b _02005640
	b _0200550c
	b _02005540
	b _02005574
	b _020055a8
	b _020055dc
	b _02005610
_0200550c:
	ldr r0, [r8, #0x8]
	cmp r0, #0x0
	addne r4, sp, #0x54
	ldr r0, [r8, #0xc]
	moveq r4, #0x0
	cmp r0, #0x0
	addne r5, sp, #0x30
	ldr r0, [r8, #0x10]
	moveq r5, #0x0
	cmp r0, #0x0
	addne r6, sp, #0xc
	moveq r6, #0x0
	b _02005640
_02005540:
	ldr r0, [r8, #0x8]
	cmp r0, #0x0
	addne r4, sp, #0x54
	ldr r0, [r8, #0x10]
	moveq r4, #0x0
	cmp r0, #0x0
	addne r5, sp, #0xc
	ldr r0, [r8, #0xc]
	moveq r5, #0x0
	cmp r0, #0x0
	addne r6, sp, #0x30
	moveq r6, #0x0
	b _02005640
_02005574:
	ldr r0, [r8, #0xc]
	cmp r0, #0x0
	addne r4, sp, #0x30
	ldr r0, [r8, #0x8]
	moveq r4, #0x0
	cmp r0, #0x0
	addne r5, sp, #0x54
	ldr r0, [r8, #0x10]
	moveq r5, #0x0
	cmp r0, #0x0
	addne r6, sp, #0xc
	moveq r6, #0x0
	b _02005640
_020055a8:
	ldr r0, [r8, #0xc]
	cmp r0, #0x0
	addne r4, sp, #0x30
	ldr r0, [r8, #0x10]
	moveq r4, #0x0
	cmp r0, #0x0
	addne r5, sp, #0xc
	ldr r0, [r8, #0x8]
	moveq r5, #0x0
	cmp r0, #0x0
	addne r6, sp, #0x54
	moveq r6, #0x0
	b _02005640
_020055dc:
	ldr r0, [r8, #0x10]
	cmp r0, #0x0
	addne r4, sp, #0xc
	ldr r0, [r8, #0x8]
	moveq r4, #0x0
	cmp r0, #0x0
	addne r5, sp, #0x54
	ldr r0, [r8, #0xc]
	moveq r5, #0x0
	cmp r0, #0x0
	addne r6, sp, #0x30
	moveq r6, #0x0
	b _02005640
_02005610:
	ldr r0, [r8, #0x10]
	cmp r0, #0x0
	addne r4, sp, #0xc
	ldr r0, [r8, #0xc]
	moveq r4, #0x0
	cmp r0, #0x0
	addne r5, sp, #0x30
	ldr r0, [r8, #0x8]
	moveq r5, #0x0
	cmp r0, #0x0
	addne r6, sp, #0x54
	moveq r6, #0x0
_02005640:
	cmp r4, #0x0
	beq _02005658
	add r0, sp, #0x0
	mov r1, r4
	mov r2, r0
	bl func_0202bcc0
_02005658:
	cmp r5, #0x0
	beq _02005670
	add r0, sp, #0x0
	mov r1, r5
	mov r2, r0
	bl func_0202bcc0
_02005670:
	cmp r6, #0x0
	beq _02005688
	add r0, sp, #0x0
	mov r1, r6
	mov r2, r0
	bl func_0202bcc0
_02005688:
	ldr r1, [sp, #0x0]
	ldr r0, [r8, #0x14]
	ldr r2, [sp, #0x4]
	add r3, r1, r0
	str r3, [sp, #0x0]
	ldr r0, [r8, #0x18]
	ldr r1, [sp, #0x8]
	add r0, r2, r0
	str r0, [sp, #0x4]
	ldr r0, [r8, #0x1c]
	add r0, r1, r0
	str r0, [sp, #0x8]
	str r3, [r7, #0x0]
	ldr r0, [sp, #0x4]
	str r0, [r7, #0x4]
	ldr r0, [sp, #0x8]
	str r0, [r7, #0x8]
	add sp, sp, #0x9c
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020056d4: .4byte D_02040fa0
	arm_func_end func_020053d0

	arm_func_start func_020056d8
func_020056d8: @ 0x020056d8
	push {r4, lr}
	mov r4, r0
	bl func_02003568
	ldr r1, _02005714
	add r0, r4, #0x2c
	str r1, [r4, #0x0]
	bl func_0200531c
	add r0, r4, #0x60
	bl func_0200531c
	mov r0, r4
	ldr r1, [r0, #0x0]
	ldr r1, [r1, #0xc]
	blx r1
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_02005714: .4byte D_02045ea4
	arm_func_end func_020056d8

	arm_func_start func_02005718
func_02005718: @ 0x02005718
	push {r4, lr}
	mov r4, r0
	bl func_02003568
	ldr r1, _02005754
	add r0, r4, #0x2c
	str r1, [r4, #0x0]
	bl func_0200531c
	add r0, r4, #0x60
	bl func_0200531c
	mov r0, r4
	ldr r1, [r0, #0x0]
	ldr r1, [r1, #0xc]
	blx r1
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_02005754: .4byte D_02045ea4
	arm_func_end func_02005718

	arm_func_start func_02005758
func_02005758: @ 0x02005758
	push {r4, lr}
	mov r4, r0
	add r0, r4, #0x2c
	bl func_02005330
	add r0, r4, #0x60
	bl func_02005330
	mov r0, #0x0
	str r0, [r4, #0x9c]
	str r0, [r4, #0x98]
	str r0, [r4, #0x94]
	pop {r4, pc}
	arm_func_end func_02005758

	arm_func_start func_02005784
func_02005784: @ 0x02005784
	push {r4, lr}
	sub sp, sp, #0x18
	mov r4, r0
	add r1, sp, #0xc
	add r0, r4, #0x2c
	bl func_020053d0
	add r1, sp, #0x0
	add r0, r4, #0x60
	bl func_020053d0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x0]
	mov r0, r4
	bl func_02004e9c
	str r0, [r4, #0x94]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x4]
	mov r0, r4
	bl func_02004e9c
	str r0, [r4, #0x98]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x8]
	mov r0, r4
	bl func_02004e9c
	str r0, [r4, #0x9c]
	mov r0, r4
	ldr r2, [r0, #0x0]
	add r1, r4, #0x94
	ldr r2, [r2, #0x10]
	blx r2
	add sp, sp, #0x18
	pop {r4, pc}
	arm_func_end func_02005784

	arm_func_start func_02005800
func_02005800: @ 0x02005800
	bx lr
	arm_func_end func_02005800

	arm_func_start func_02005804
func_02005804: @ 0x02005804
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	add r0, r7, #0x2c
	add r1, r7, #0x94
	mov r5, r2
	mov r4, r3
	bl func_0200538c
	ldr r3, [sp, #0x18]
	mov r1, r5
	mov r2, r4
	add r0, r7, #0x60
	bl func_02005370
	ldr r2, [sp, #0x1c]
	mov r0, r7
	mov r1, r6
	bl func_02004e34
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end func_02005804

	arm_func_start func_0200584c
func_0200584c: @ 0x0200584c
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	add r0, r7, #0x2c
	add r1, r7, #0x94
	mov r4, r3
	bl func_0200538c
	mov r1, r5
	add r0, r7, #0x60
	bl func_0200538c
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl func_02004e34
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end func_0200584c

	arm_func_start func_0200588c
func_0200588c: @ 0x0200588c
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	add r0, r7, #0x2c
	add r1, r7, #0x94
	mov r4, r3
	bl func_0200538c
	ldr r1, [r5, #0x0]
	add r0, r5, #0x14
	str r1, [r7, #0x60]
	ldr r1, [r5, #0x4]
	add lr, r7, #0x74
	str r1, [r7, #0x64]
	ldr r1, [r5, #0x8]
	add r12, r5, #0x20
	str r1, [r7, #0x68]
	ldr r1, [r5, #0xc]
	add r3, r7, #0x80
	str r1, [r7, #0x6c]
	ldr r1, [r5, #0x10]
	str r1, [r7, #0x70]
	ldm r0, {r0, r1, r2}
	stm lr, {r0, r1, r2}
	ldm r12, {r0, r1, r2}
	stm r3, {r0, r1, r2}
	mov r1, r6
	mov r2, r4
	ldr r3, [r5, #0x2c]
	mov r0, r7
	str r3, [r7, #0x8c]
	ldr r3, [r5, #0x30]
	str r3, [r7, #0x90]
	bl func_02004e34
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end func_0200588c

	arm_func_start func_02005918
func_02005918: @ 0x02005918
	push {r4, lr}
	mov r4, r0
	bl func_020035d0
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_02005918

	arm_func_start func_02005934
func_02005934: @ 0x02005934
	push {r4, lr}
	mov r4, r0
	bl func_020035d0
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_02005934

	arm_func_start func_02005948
func_02005948: @ 0x02005948
	push {r4, lr}
	mov r4, r0
	bl func_020035d0
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_02005948

	arm_func_start func_0200595c
func_0200595c: @ 0x0200595c
	push {r4, lr}
	mov r4, r0
	bl func_020035d0
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_0200595c

	arm_func_start func_02005978
func_02005978: @ 0x02005978
	push {r4, lr}
	mov r4, r0
	bl func_020035d0
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_02005978

	arm_func_start func_0200598c
func_0200598c: @ 0x0200598c
	push {r4, lr}
	mov r4, r0
	bl func_020035d0
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	pop {r4, pc}
	arm_func_end func_0200598c
