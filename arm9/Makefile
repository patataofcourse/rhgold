CC 			:= #mwcc
LD 			:= $(DEVKITARM)/bin/arm-none-eabi-ld
AS 			:= $(DEVKITARM)/bin/arm-none-eabi-as
OBJCOPY 	:= $(DEVKITARM)/bin/arm-none-eabi-objcopy

BUILD 		:= build
SOURCE 		:= src
ASM			:= asm
INCLUDE 	:= include
DATA		:= data
BUILD_DIRS 	:= $(BUILD)/$(SOURCE) $(BUILD)/$(ASM) $(BUILD)/$(DATA)

CC_FLAGS	:=
LD_FLAGS	:= -g -A armv5t
AS_FLAGS	:= -march=armv5t -g -I $(INCLUDE)

CFILES 		:= $(foreach dir,$(SOURCE),$(wildcard $(dir)/*.c))
CPPFILES 	:= $(foreach dir,$(SOURCE),$(wildcard $(dir)/*.cpp))
ASMFILES	:= $(foreach dir,$(ASM),$(wildcard $(dir)/*.s))
DATAFILES	:= $(foreach dir,$(DATA),$(wildcard $(dir)/*.s))
LINKSCRIPT	:= arm9.ld

OFILES		:=	$(addprefix $(BUILD)/,$(ASMFILES:.s=.o)) $(addprefix $(BUILD)/,$(CFILES:.c=.o))
OFILES		+=  $(addprefix $(BUILD)/,$(CPPFILES:.cpp=.o)) $(addprefix $(BUILD)/,$(DATAFILES:.s=.o))

.PHONY: all clean

all: $(BUILD)/arm9.bin

$(BUILD)/arm9.bin: $(OFILES) | $(LINKSCRIPT)
	@$(LD) $(LD_FLAGS) $< -T $(LINKSCRIPT) -T undefined.ld -o $(BUILD)/arm9.elf
	@$(OBJCOPY) -O binary $(BUILD)/arm9.elf -j .arm9 $(BUILD)/arm9.main.bin
	@$(OBJCOPY) -O binary $(BUILD)/arm9.elf -j .itcm $(BUILD)/arm9.itcm.bin
	@$(OBJCOPY) -O binary $(BUILD)/arm9.elf -j .dtcm $(BUILD)/arm9.dtcm.bin
	@$(OBJCOPY) -O binary $(BUILD)/arm9.elf -j .autoload_list $(BUILD)/arm9.auto.bin
	@cat $(BUILD)/arm9.main.bin > $(BUILD)/arm9.bin
	@cat $(BUILD)/arm9.itcm.bin >> $(BUILD)/arm9.bin
	@cat $(BUILD)/arm9.dtcm.bin >> $(BUILD)/arm9.bin
	@cat $(BUILD)/arm9.auto.bin >> $(BUILD)/arm9.bin

clean:
	@rm -rf $(BUILD)

$(BUILD_DIRS):
	@mkdir -p $@

$(OFILES): | $(BUILD_DIRS)

$(BUILD)/%.o: %.c #TODO

$(BUILD)/%.o: %.cpp #TODO

$(BUILD)/%.o: %.s
	@$(AS) $(AS_FLAGS) $< -o $@
