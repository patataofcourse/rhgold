OUTPUT_ARCH(arm)

### Undefined symbols ###
#TODO: put all these somewhere else
NitroMain = 0x02000bd8;
func_02000954 = 0x02000954;
func_02000970 = 0x02000970;
func_02000a1c = 0x02000a1c;
func_02000ab0 = 0x02000ab0;
func_02001498 = 0x02001498;
func_0203ba38 = 0x0203ba38;
func_0203cf5c = 0x0203cf5c;
#0x027E0000 seems to be beginning of the stack?? check gbatek
#no idea waht 0x027FFF9C is


SECTIONS {
    _start = _entry_arm9;
    __romPos = 0;

    . = 0x02000000;
    .arm9 . : AT(__romPos) {
        build/asm/_secure.o(.text);
        build/asm/entry.o(.text);
        build/asm/rest.o(.data);
    }
}