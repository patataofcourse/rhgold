OUTPUT_ARCH(arm)

SECTIONS {
    _start = _entry_arm9;
    __romPos = 0;

    . = 0x02000000;
    .text . : AT(__romPos) {
        build/asm/_secure.o(.text);
        build/asm/entry.o(.text);
        build/asm/main.o(.text);
        build/asm/string.o(.text);
        build/asm/code_020017b0.o(.text);
    }
    .non_dism . : {
        build/asm/rest.o(.data);
    }
}