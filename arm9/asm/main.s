@ main.cpp (but in asm)

.include "global.s"

.section .text

	arm_func_start NitroMain
NitroMain: @ 0x02000bd8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x198
	sub sp, sp, #0x400
	bl func_020012cc
	bl func_02001240
	bl func_020012a0
	ldr r0, _0200105c @ =0x02053568
	mov r1, #0
	str r1, [r0]
	mov r0, #3
	bl func_02003384
	bl func_02004d08
	mov r0, #1
	mov r1, r0
	bl func_02009d98
	mov r0, #1
	mov r1, #0x8000
	bl func_02008784
	bl func_0200c5ac
	mov r0, #0x100000
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _02001060 @ =0x02045ce4
	ldr r1, _02001064 @ =0x02053b18
	ldr r2, _02001068 @ =0x0205357c
	ldr r3, _0200106c @ =0x02053cd4
	bl func_0200c5bc
	ldr sb, _02001070 @ =0x0205359c
	mov r7, #0
	ldr r8, _02001074 @ =0x02153cd4
	ldr sl, _02001078 @ =0x02053bac
	ldr fp, _0200107c @ =0x02053594
	mov r4, sb
	mov r6, #0x88000
	mov r5, r7
_02000c68:
	str r6, [sp]
	ldr r0, _02001060 @ =0x02045ce4
	mov r1, sl
	mov r2, sb
	mov r3, r8
	str r5, [sp, #4]
	bl func_0200c5bc
	ldr r0, [r4, r7, lsl #2]
	bl func_0200c684
	str r0, [fp, r7, lsl #2]
	mov r0, sl
	bl func_02028b54
	mov r0, #0x2000
	bl func_02029018
	add r7, r7, #1
	cmp r7, #2
	add r8, r8, #0x88000
	add sb, sb, #4
	add sl, sl, #0x94
	blt _02000c68
	ldr r0, _02001064 @ =0x02053b18
	bl func_02028b54
	add r0, sp, #0x10
	bl func_0200c70c
	ldr r2, _02001080 @ =0x0203db0c
	ldr r0, _02001068 @ =0x0205357c
	ldrh r4, [r2]
	ldrh r3, [r2, #2]
	ldr r1, [r0]
	strh r4, [sp, #8]
	strh r3, [sp, #0xa]
	ldrh r3, [r2, #4]
	ldrh r2, [r2, #6]
	add r0, sp, #0x10
	strh r3, [sp, #0xc]
	strh r2, [sp, #0xe]
	bl func_0200c768
	add r0, sp, #0x10
	add r1, sp, #8
	bl func_0200c770
	add r0, sp, #0x10
	bl func_0200c79c
	add r0, sp, #0x10
	bl func_0200c748
	mov r0, #8
	bl func_02003a84
	mov r1, r0
	ldr r2, _02001084 @ =0x02053570
	ldr r0, _02001088 @ =0x02045cf8
	str r1, [r2]
	bl func_02003924
	ldr r1, _0200108c @ =0x02053584
	str r0, [r1]
	bl func_02005a44
	ldr r0, _02001090 @ =0x0205356c
	mov r1, #0
	str r1, [r0]
	bl func_02031cc4
	bl func_0202d72c
	ldr r3, _02001094 @ =0x04001000
	ldr r0, _02001098 @ =0x02053574
	ldr r2, [r3]
	mov r1, #0
	orr r2, r2, #0x10000
	str r2, [r3]
	str r1, [r0]
	ldr r0, _0200109c @ =0x02053b00
	bl func_02001e1c
	ldr r0, _020010a0 @ =0x02053ae8
	mov r1, #1
	bl func_02001e1c
	ldr r0, _020010a4 @ =0x0205358c
	mov r1, #0x100
	mov r2, #0xc0
	bl func_02015e70
	ldr r0, _020010a8 @ =0x02270240
	ldr r0, [r0]
	cmp r0, #0
	bne _02000dc0
	mov r0, #0xc
	bl func_020039a4
	cmp r0, #0
	beq _02000db8
	bl func_0200e694
_02000db8:
	ldr r1, _020010a8 @ =0x02270240
	str r0, [r1]
_02000dc0:
	ldr r0, _020010a8 @ =0x02270240
	ldr r0, [r0]
	bl func_0200e770
	mov r0, #0x410
	bl func_020039a4
	cmp r0, #0
	beq _02000de0
	bl func_0200ec00
_02000de0:
	ldr r1, _020010ac @ =0x02270344
	str r0, [r1]
	ldr r0, _020010b0 @ =0x0227034c
	bl func_020115e8
	ldr r0, _020010ac @ =0x02270344
	ldr r4, _020010b4 @ =0x02053564
	mov r6, #1
	ldr r2, _020010b8 @ =0x02053588
	ldr r0, [r0]
	ldr r3, _020010bc @ =0x02053560
	mov r5, #0
	ldr r1, _020010c0 @ =0x02053580
	str r6, [r4]
	str r5, [r3]
	str r6, [r2]
	str r5, [r1]
	bl func_0200f0e0
	cmp r0, #0
	beq _02000e40
	ldr r0, _020010c4 @ =0x02053748
	mov r1, r5
	mov r2, #9
	bl func_0200fa78
	b _02000ed8
_02000e40:
	ldr r0, _020010c8 @ =0x027ffc20
	ldr r0, [r0]
	cmp r0, #0
	beq _02000e64
	cmp r0, #1
	beq _02000e84
	cmp r0, #2
	beq _02000ec0
	b _02000ed4
_02000e64:
	ldr r0, _020010c4 @ =0x02053748
	mov r1, r5
	mov r2, #0x22
	bl func_0200fa78
	ldr r0, _020010b8 @ =0x02053588
	mov r1, r5
	str r1, [r0]
	b _02000ed8
_02000e84:
	ldr r5, _020010cc @ =0x02053610
	mov r4, #0x30c
_02000e8c:
	mov r0, r5
	bl func_02003438
	bl func_020014f0
	mov r0, r5
	mov r1, r4
	bl func_02003508
	cmp r0, #0x30c
	beq _02000e8c
	ldr r0, _020010c4 @ =0x02053748
	mov r1, #0
	mov r2, #0x54
	bl func_0200fa78
	b _02000ed8
_02000ec0:
	ldr r0, _020010c4 @ =0x02053748
	mov r1, r5
	mov r2, #9
	bl func_0200fa78
	b _02000ed8
_02000ed4:
	bl func_02031f14
_02000ed8:
	ldr fp, _020010d0 @ =0x04000540
	ldr sl, _020010cc @ =0x02053610
	ldr r8, _020010a8 @ =0x02270240
	ldr r7, _020010bc @ =0x02053560
	ldr r6, _020010ac @ =0x02270344
	ldr r5, _020010c0 @ =0x02053580
	ldr r4, _0200105c @ =0x02053568
	sub sb, fp, #0x23c
_02000ef8:
	mov r0, sl
	bl func_02003438
	bl func_02005ec8
	ldr r0, _020010a4 @ =0x0205358c
	bl func_02005f6c
	ldr r0, _020010d4 @ =0x020537ec
	mov r1, sl
	bl func_020063d4
	bl func_02015ee8
	ldr r0, _020010c4 @ =0x02053748
	bl func_0200fb10
	bl func_0200c634
	bl func_020087e4
	bl func_0200a760
	ldr r0, [r8]
	cmp r0, #0
	bne _02000f54
	mov r0, #0xc
	bl func_020039a4
	cmp r0, #0
	beq _02000f50
	bl func_0200e694
_02000f50:
	str r0, [r8]
_02000f54:
	ldr r0, [r8]
	bl func_0200e798
	ldr r0, _02001098 @ =0x02053574
	ldr r0, [r0]
	lsl r0, r0, #1
	str r0, [fp]
	ldr r0, [r7]
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r7]
	bne _02000fcc
	ldr r0, _020010b4 @ =0x02053564
	ldr r0, [r0]
	cmp r0, #0
	beq _02000fcc
	ldr r0, _020010d8 @ =0x027fffa8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	asrs r0, r0, #0xf
	beq _02000fcc
	ldr r0, [r6]
	bl func_0200f0d8
	cmp r0, #0
	bne _02000fcc
	mov r1, #0
	mov r0, #0xc
	mov r2, r1
	bl func_02038064
	mov r0, #0x64
	str r0, [r7]
_02000fcc:
	ldr r0, [r5]
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r5]
	bne _0200103c
	ldr r0, _020010b8 @ =0x02053588
	ldr r0, [r0]
	cmp r0, #0
	beq _0200103c
	mov r0, sl
	mov r1, #0x30c
	bl func_02003508
	cmp r0, #0x30c
	bne _0200103c
	ldr r0, [r6]
	bl func_0200f0d8
	cmp r0, #0
	bne _0200103c
	ldrh r2, [sb]
	ldr r1, _020010dc @ =0xfffffdf1
	mov r0, #0
	and r2, r2, r1
	orr r1, r2, #0xe
	orr r1, r1, #0x200
	strh r1, [sb]
	bl func_0203839c
	mov r0, #1
	bl func_02031d94
_0200103c:
	mov r0, #1
	bl func_02004d48
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	bl func_020014f0
	bl func_020013fc
	b _02000ef8
	.align 2, 0
_0200105c: .4byte 0x02053568
_02001060: .4byte 0x02045ce4
_02001064: .4byte 0x02053b18
_02001068: .4byte 0x0205357c
_0200106c: .4byte 0x02053cd4
_02001070: .4byte 0x0205359c
_02001074: .4byte 0x02153cd4
_02001078: .4byte 0x02053bac
_0200107c: .4byte 0x02053594
_02001080: .4byte 0x0203db0c
_02001084: .4byte 0x02053570
_02001088: .4byte 0x02045cf8
_0200108c: .4byte 0x02053584
_02001090: .4byte 0x0205356c
_02001094: .4byte 0x04001000
_02001098: .4byte 0x02053574
_0200109c: .4byte 0x02053b00
_020010a0: .4byte 0x02053ae8
_020010a4: .4byte 0x0205358c
_020010a8: .4byte 0x02270240
_020010ac: .4byte 0x02270344
_020010b0: .4byte 0x0227034c
_020010b4: .4byte 0x02053564
_020010b8: .4byte 0x02053588
_020010bc: .4byte 0x02053560
_020010c0: .4byte 0x02053580
_020010c4: .4byte 0x02053748
_020010c8: .4byte 0x027ffc20
_020010cc: .4byte 0x02053610
_020010d0: .4byte 0x04000540
_020010d4: .4byte 0x020537ec
_020010d8: .4byte 0x027fffa8
_020010dc: .4byte 0xfffffdf1
	arm_func_end NitroMain
_020010e0:
	.byte 0x04, 0x10, 0x9f, 0xe5, 0x00, 0x01, 0x91, 0xe7, 0x1e, 0xff, 0x2f, 0xe1, 0xc4, 0x5c, 0x04, 0x02

	arm_func_start func_020010f0
func_020010f0: @ 0x020010f0
	push {r3, r4, lr}
	sub sp, sp, #4
	bl func_0202e94c
	bl func_0202eaec
	mov r0, #6
	bl func_0202de9c
	mov r0, #1
	bl func_0202dba0
	mov r0, #0x10
	bl func_0202d910
	mov r0, #0x60
	bl func_0202e074
	mov r0, #1
	mov r1, #4
	mov r2, r0
	bl func_0202d774
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _02001228 @ =0xffcfffef
	mov r0, #8
	and r1, r2, r1
	orr r1, r1, #0x10
	orr r1, r1, #0x200000
	str r1, [r3]
	ldr r1, [r3]
	bic r1, r1, #0x1f00
	orr r1, r1, #0x1100
	str r1, [r3]
	bl func_0202e224
	mov r0, #0x80
	bl func_0202e17c
	mov r0, #0
	bl func_0202d7dc
	ldr r2, _0200122c @ =0x04001000
	ldr r0, _02001228 @ =0xffcfffef
	ldr r1, [r2]
	ldr ip, _02001230 @ =0x04000008
	and r0, r1, r0
	orr r0, r0, #0x10
	orr r0, r0, #0x200000
	str r0, [r2]
	ldr r0, [r2]
	ldr lr, _02001234 @ =0xffffcffd
	bic r0, r0, #0x1f00
	orr r0, r0, #0x1000
	str r0, [r2]
	ldrh r1, [ip]
	mov r3, #0
	add r0, ip, #0x48
	bic r1, r1, #3
	orr r1, r1, #1
	strh r1, [ip]
	ldrh r4, [ip, #0x58]
	mov r1, #1
	mov r2, #0x20
	and r4, r4, lr
	strh r4, [ip, #0x58]
	ldrh lr, [ip, #0x58]
	bic lr, lr, #0x3000
	orr lr, lr, #0x10
	strh lr, [ip, #0x58]
	ldrh lr, [ip, #0x58]
	bic lr, lr, #0x3000
	orr lr, lr, #8
	strh lr, [ip, #0x58]
	str r3, [sp]
	bl func_0202e63c
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	ldr r2, _02001238 @ =0x00007fff
	mov r3, r0
	bl func_0202eca4
	ldr r0, _0200123c @ =0x04000540
	mov r1, #0
	str r1, [r0]
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02001228: .4byte 0xffcfffef
_0200122c: .4byte 0x04001000
_02001230: .4byte 0x04000008
_02001234: .4byte 0xffffcffd
_02001238: .4byte 0x00007fff
_0200123c: .4byte 0x04000540
	arm_func_end func_020010f0

	arm_func_start func_02001240
func_02001240: @ 0x02001240
	push {r3, lr}
	sub sp, sp, #0x28
	ldr r0, _02001298 @ =0x0203daf4
	ldr ip, _0200129c @ =0x0203db00
	add lr, sp, #0x10
	ldm r0, {r0, r1, r2}
	stm lr, {r0, r1, r2}
	ldm ip, {r0, r1, r2}
	add r3, sp, #4
	stm r3, {r0, r1, r2}
	mov r2, r3
	add r0, sp, #0x1c
	mov ip, #0
	mov r1, lr
	str ip, [r0]
	str ip, [r0, #4]
	str ip, [r0, #8]
	mov r3, #1
	str ip, [sp]
	bl func_0202eef0
	add sp, sp, #0x28
	pop {r3, pc}
	.align 2, 0
_02001298: .4byte 0x0203daf4
_0200129c: .4byte 0x0203db00
	arm_func_end func_02001240

	arm_func_start func_020012a0
func_020012a0: @ 0x020012a0
	ldr r0, _020012c0 @ =0x4210ffff
	ldr r2, _020012c4 @ =0x040004c0
	lsr r1, r0, #0x10
	str r0, [r2]
	ldr r0, _020012c8 @ =0x001f00c0
	str r1, [r2, #4]
	str r0, [r2, #-0x1c]
	bx lr
	.align 2, 0
_020012c0: .4byte 0x4210ffff
_020012c4: .4byte 0x040004c0
_020012c8: .4byte 0x001f00c0
	arm_func_end func_020012a0

	arm_func_start func_020012cc
func_020012cc: @ 0x020012cc
	push {r4, lr}
	bl func_0202d56c
	ldr r0, _020013dc @ =0x02053280
	mov r1, #2
	str r1, [r0]
	bl func_0202d570
	bl func_0202d6f0
	ldr r3, _020013e0 @ =0x04001000
	ldr r1, _020013e4 @ =func_020014a8
	ldr r2, [r3]
	mov r0, #1
	bic r2, r2, #0x10000
	str r2, [r3]
	bl func_0202fbe0
	mov r0, #1
	bl func_0202fdb0
	ldr r2, _020013e8 @ =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl func_0202d6bc
	ldr r0, _020013ec @ =0x000001ff
	bl func_0202e15c
	mov r0, #0
	mov r1, #0x6800000
	mov r2, #0xa4000
	bl func_02032764
	bl func_0202e568
	mov r0, #0xc0
	mov r1, #0x7000000
	mov r2, #0x400
	bl func_02032764
	mov r0, #0
	mov r1, #0x5000000
	mov r2, #0x400
	bl func_02032764
	mov r0, #0xc0
	ldr r1, _020013f0 @ =0x07000400
	mov r2, #0x400
	bl func_02032764
	mov r0, #0
	ldr r1, _020013f4 @ =0x05000400
	mov r2, #0x400
	bl func_02032764
	bl func_020010f0
	bl func_020186a0
	ldr r1, _020013f8 @ =0x00003def
	mov r0, #0x5000000
	strh r1, [r0]
	add r0, r0, #0x400
	strh r1, [r0]
	bl func_020316e8
	bl func_02031904
	bl func_020304c8
	mov r0, #0x40000
	bl func_0202fdb0
	mov r0, #1
	bl func_02035924
	mov r0, #1
	bl func_020360d4
	mov r0, #0
	mov r1, r0
	bl func_02036124
	mov r4, r0
	bl func_02003a84
	mov r1, r4
	bl func_02036124
	pop {r4, pc}
	.align 2, 0
_020013dc: .4byte 0x02053280
_020013e0: .4byte 0x04001000
_020013e4: .4byte func_020014a8
_020013e8: .4byte 0x04000208
_020013ec: .4byte 0x000001ff
_020013f0: .4byte 0x07000400
_020013f4: .4byte 0x05000400
_020013f8: .4byte 0x00003def
	arm_func_end func_020012cc

	arm_func_start func_020013fc
func_020013fc: @ 0x020013fc
	push {r3, lr}
	bl func_0200b39c
	ldr r0, _02001468 @ =0x02053620
	bl func_0200604c
	ldr r0, _0200146c @ =0x02053634
	bl func_0200604c
	ldr r0, _02001470 @ =0x02053728
	bl func_02001cc8
	ldr r0, _02001474 @ =0x02053648
	bl func_02001cc8
	ldr r0, _02001478 @ =0x02053668
	bl func_02001cc8
	ldr r0, _0200147c @ =0x02053688
	bl func_02001cc8
	ldr r0, _02001480 @ =0x020536a8
	bl func_02001cc8
	ldr r0, _02001484 @ =0x020536c8
	bl func_02001cc8
	ldr r0, _02001488 @ =0x020536e8
	bl func_02001cc8
	ldr r0, _0200148c @ =0x02053708
	bl func_02001cc8
	ldr r0, _02001490 @ =0x02053b00
	bl func_02001e38
	ldr r0, _02001494 @ =0x02053ae8
	bl func_02001e38
	pop {r3, pc}
	.align 2, 0
_02001468: .4byte 0x02053620
_0200146c: .4byte 0x02053634
_02001470: .4byte 0x02053728
_02001474: .4byte 0x02053648
_02001478: .4byte 0x02053668
_0200147c: .4byte 0x02053688
_02001480: .4byte 0x020536a8
_02001484: .4byte 0x020536c8
_02001488: .4byte 0x020536e8
_0200148c: .4byte 0x02053708
_02001490: .4byte 0x02053b00
_02001494: .4byte 0x02053ae8
	arm_func_end func_020013fc

	arm_func_start func_02001498
func_02001498: @ 0x02001498
	push {r3, lr}
	bl func_02031060
	bl func_02003a24
	pop {r3, pc}
	arm_func_end func_02001498

	arm_func_start func_020014a8
func_020014a8: @ 0x020014a8
	ldr r0, _020014d8 @ =0x02263cd4
	mov r1, #1
	str r1, [r0, #8]
	ldr r2, [r0, #4]
	ldr r1, _020014dc @ =0x027e0000
	add r2, r2, #1
	str r2, [r0, #4]
	add r0, r1, #0x3000
	ldr r1, [r0, #0xff8]
	orr r1, r1, #1
	str r1, [r0, #0xff8]
	bx lr
	.align 2, 0
_020014d8: .4byte 0x02263cd4
_020014dc: .4byte 0x027e0000
	arm_func_end func_020014a8

	arm_func_start func_0x020014e0
func_0x020014e0: @ 0x020014e0
	ldr r0, _020014ec @ =0x02263cd4
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_020014ec: .4byte 0x02263cd4
	arm_func_end func_0x020014e0

	arm_func_start func_020014f0
func_020014f0: @ 0x020014f0
	push {r3, lr}
	bl func_02031cc4
	ldr r1, _0200151c @ =0x02263cd4
	ldr r0, _02001520 @ =0x02045d18
	ldr ip, [r1, #4]
	ldr r3, [r1]
	ldr r2, [r1, #4]
	sub r3, ip, r3
	str r3, [r0]
	str r2, [r1]
	pop {r3, pc}
	.align 2, 0
_0200151c: .4byte 0x02263cd4
_02001520: .4byte 0x02045d18
	arm_func_end func_020014f0
