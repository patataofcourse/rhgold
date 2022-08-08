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
LD_FLAGS	:= -e 0 -g -A armv5t
AS_FLAGS	:= -march=armv5t -g3 -I $(INCLUDE)

CFILES 		:= $(foreach dir,$(SOURCE),$(wildcard $(dir)/*.c))
CPPFILES 	:= $(foreach dir,$(SOURCE),$(wildcard $(dir)/*.cpp))
ASMFILES	:= $(foreach dir,$(ASM),$(wildcard $(dir)/*.s))
DATAFILES	:= $(foreach dir,$(DATA),$(wildcard $(dir)/*.s))

OFILES		:=	$(addprefix $(BUILD)/,$(ASMFILES:.s=.o)) $(addprefix $(BUILD)/,$(CFILES:.c=.o))
OFILES		+=  $(addprefix $(BUILD)/,$(CPPFILES:.cpp=.o)) $(addprefix $(BUILD)/,$(DATAFILES:.bin=.o))

.PHONY: all clean

all: $(BUILD)/arm9.bin

$(BUILD)/arm9.bin: $(OFILES)
	@$(LD) $(LD_FLAGS) $< -T arm9.ld -T undefined.ld -o $(BUILD)/arm9.elf
	@$(OBJCOPY) -O binary $(BUILD)/arm9.elf $(BUILD)/arm9.bin

clean:
	@rm -rf $(BUILD)

$(BUILD_DIRS):
	@mkdir -p $@

$(OFILES): | $(BUILD_DIRS)

$(BUILD)/%.o: %.c #TODO

$(BUILD)/%.o: %.cpp #TODO

$(BUILD)/%.o: %.s
	@$(AS) $(AS_FLAGS) $< -o $@
