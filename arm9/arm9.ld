OUTPUT_ARCH(arm)

### Undefined symbols ###
#TODO: put all these somewhere else
D_02000930 = 0x02000930;
D_02000b9c = 0x02000b9c;
func_02000954 = 0x02000954;
func_02000970 = 0x02000970;
func_02000a1c = 0x02000a1c;
func_02000ab0 = 0x02000ab0;
func_02001498 = 0x02001498;
func_0203ba38 = 0x0203ba38;
func_0203cf5c = 0x0203cf5c;
#0x027E0000 seems to be beginning of the stack?? check gbatek
#no idea waht 0x027FFF9C is

NitroMain = 0x02000bd8;

ARM9_IO = 0x04000000;
ARM9_Palettes = 0x05000000;
ARM9_OAM = 0x07000000;
ARM9_BIOS = 0xFFFF0000;


SECTIONS {
    __romPos = 0;

    . = 0x02000000;
    .cartrom . : AT(__romPos) {
        build/asm/binary_start.o(.data);
        build/asm/_entry_arm9.o(.text);
        build/asm/rest.o(.data);
    }
}