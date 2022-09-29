OUTPUT_ARCH(arm)

_start = _entry_arm9;

MEMORY {
    main        (RWX) : ORIGIN = 0x02000000,    LENGTH = 4M
    itcm        (RWX) : ORIGIN = 0x01ff8000,    LENGTH = 32K
    dtcm        (RWX) : ORIGIN = 0x027e0000,    LENGTH = 16K
    autoload    (R)   : ORIGIN = 0,             LENGTH = 0x18
}

SECTIONS {
    . = ORIGIN(main);
    .arm9 : {
        # libsyscall / crt0
        build/asm/_secure.o(.text);
        build/asm/entry.o(.text);
        build/asm/entry.o(.rodata);
        . = ALIGN(4);

        # .text
        build/asm/main.o(.text);
        build/asm/string.o(.text);
        build/asm/code_020017b0.o(.text);
        build/asm/code_02001e1c.o(.text);
        build/asm/CDepth2D.o(.text);
        build/asm/code_02001fbc.o(.text);
        build/asm/code_02003384.o(.text);
        build/asm/CList.o(.text);
        . = ALIGN(4);
        
        # non-disassembled
        build/data/rest.o(.data);
        . = ALIGN(4);

    } > main

    SDK_AUTOLOAD_START = .;

    .itcm : {
        build/data/itcm.o(.text);
        build/data/itcm.o(.rodata);
        build/data/itcm.o(.data);
    } > itcm
    .itcm_bss : {
        build/data/itcm.o(.bss);
    } > itcm
    
    .dtcm : {
        build/data/dtcm.o(.text);
        build/data/dtcm.o(.rodata);
        build/data/dtcm.o(.data);
    } > dtcm
    .dtcm_bss : {
        build/data/dtcm.o(.bss);
    } > dtcm

    SDK_AUTOLOAD_ITCM_ADDR = ADDR(.itcm);
    SDK_AUTOLOAD_ITCM_SIZE = SIZEOF(.itcm);
    SDK_AUTOLOAD_ITCM_BSS_SIZE = SIZEOF(.itcm_bss);
    SDK_AUTOLOAD_DTCM_ADDR = ADDR(.dtcm);
    SDK_AUTOLOAD_DTCM_SIZE = SIZEOF(.dtcm);
    SDK_AUTOLOAD_DTCM_BSS_SIZE = SIZEOF(.dtcm_bss);

    SDK_AUTOLOAD_LIST = ADDR(.arm9) + SIZEOF(.arm9) + SIZEOF(.itcm) + SIZEOF(.dtcm);
    .autoload_list : {
        build/data/autoload.o(.data);
        . = ALIGN(4);
    } > autoload
    SDK_AUTOLOAD_LIST_END = SDK_AUTOLOAD_LIST + SIZEOF(.autoload_list);

    .bss : {
        SDK_STATIC_BSS_START = .;
        . = 0x27cb20 - SIZEOF(.arm9); # Remove after BSS is done
        . = ALIGN(4);

        SDK_STATIC_BSS_END = .;
    } > main
}