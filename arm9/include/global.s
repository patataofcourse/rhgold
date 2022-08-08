.ifndef GLOBAL_HEADER
.set GLOBAL_HEADER, 0

.macro arm_func_start func
    .arm
    .global \func
.endm

.macro thumb_func_start func
    .thumb
    .global \func
    .balign 4
.endm

.macro non_word_aligned_thumb_func_start func
    .thumb
    .global \func
.endm

.macro arm_func_end func
.endm

.macro thumb_func_end func
.endm

.endif
