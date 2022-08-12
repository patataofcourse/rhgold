OUTPUT_ARCH(arm)

SECTIONS {
    . = 0x02380000;
    .arm7 . : {
        build/data/arm7.o(.data);
    }
}