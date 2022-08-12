OUTPUT_ARCH(arm)

_start = _entry_arm9;

SECTIONS {
    . = 0x02000000;
    .rom_start . : {
        build/asm/_secure.o(.text);
        build/asm/entry.o(.text);
        build/asm/entry.o(.rodata);
    }
    .text . : {
        build/asm/main.o(.text);
        build/asm/string.o(.text);
        build/asm/code_020017b0.o(.text);
    }
    .non_dism . : {
        build/data/rest.o(.data);
    }
    SDK_STATIC_BSS_START = .;
    SDK_AUTOLOAD_START = .;
    .sbss . : {
        build/data/sbss.o(.sbss);
    }
    SDK_AUTOLOAD_LIST = .;
    .sbss . : {
        build/data/autoload.o(.data);
    }
    SDK_AUTOLOAD_LIST_END = .;
    .bss . : {

    }
    . = 0x0227cb20; # Remove after BSS is done
    SDK_STATIC_BSS_END = .;
}