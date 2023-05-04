.include "global.s"

.section .text

	arm_func_start func_02003c94
func_02003c94: @ 0x02003c94
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr lr, [sp, #0x10]
	mov ip, #0
	str lr, [sp]
	str ip, [sp, #4]
	str ip, [sp, #8]
	bl func_02003cbc
	add sp, sp, #0xc
	ldm sp!, {pc}
	arm_func_end func_02003c94

	arm_func_start func_02003cbc
func_02003cbc: @ 0x02003cbc
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r8, [sp, #0x2c]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r8, #0
	bne _02003cec
	mov r0, #0
	bl func_0200989c
	str r0, [sp, #0x2c]
_02003cec:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _02003d04
	mov r0, #0
	bl func_020098b0
	str r0, [sp, #0x30]
_02003d04:
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	str r0, [r5, #8]
	str r0, [r5, #0xc]
	ldr r0, [r6]
	cmp r0, #0
	beq _02003d5c
	add r1, sp, #0xc
	bl func_02003910
	add r1, sp, #4
	mov r8, r0
	bl func_02018580
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x28]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	mov r3, r7
	bl func_02019590
	mov r0, r8
	bl func_02003ae0
_02003d5c:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _02003dbc
	cmp r7, #0
	beq _02003d8c
	cmp r7, #1
	cmpne r7, #2
	bne _02003d9c
	add r1, sp, #8
	bl func_020038e8
	mov r8, r0
	b _02003da0
_02003d8c:
	add r1, sp, #8
	bl func_020038fc
	mov r8, r0
	b _02003da0
_02003d9c:
	mov r8, #0
_02003da0:
	ldr r0, [sp, #8]
	ldr r3, [sp, #0x2c]
	mov r1, r4
	mov r2, r7
	bl func_02019364
	mov r0, r8
	bl func_02003ae0
_02003dbc:
	mov r0, #0
	str r0, [r5, #0x10]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	str r0, [r5, #0x1c]
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _02003de8
	mov r1, r5
	bl func_02003898
	str r0, [r5, #0x10]
_02003de8:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _02003e00
	add r1, r5, #4
	bl func_020038ac
	str r0, [r5, #0x14]
_02003e00:
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _02003e18
	add r1, r5, #8
	bl func_020038d4
	str r0, [r5, #0x18]
_02003e18:
	ldr r0, [r6, #0x14]
	cmp r0, #0
	addeq sp, sp, #0x10
	popeq {r4, r5, r6, r7, r8, pc}
	add r1, r5, #0xc
	bl func_020038c0
	str r0, [r5, #0x1c]
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end func_02003cbc
