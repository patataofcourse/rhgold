OUTPUT_ARCH(arm)

SECTIONS {
    __romPos = 0;

    . = 0x02380000;
    .arm7 . : AT(__romPos) {
        build/asm/arm7.o(.data);
    }
}