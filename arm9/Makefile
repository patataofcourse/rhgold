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

CFILES 		:= $(foreach dir,$(SOURCE),$(wildcard $(dir)/*.c))
CPPFILES 	:= $(foreach dir,$(SOURCE),$(wildcard $(dir)/*.cpp))
ASMFILES	:= $(foreach dir,$(ASM),$(wildcard $(dir)/*.s))
DATAFILES	:= $(foreach dir,$(DATA),$(wildcard $(dir)/*.s))

OFILES		:=	$(addprefix $(BUILD)/,$(ASMFILES:.s=.o)) $(addprefix $(BUILD)/,$(CFILES:.c=.o))
OFILES		+=  $(addprefix $(BUILD)/,$(CPPFILES:.cpp=.o)) $(addprefix $(BUILD)/,$(DATAFILES:.bin=.o))

bin: $(OFILES)
	@$(LD) -e 0 $< -o $(BUILD)/arm9.elf
	@$(OBJCOPY) -O binary $(BUILD)/arm9.elf $(BUILD)/arm9.bin
	@ diff ../arm9.bin $(BUILD)/arm9.bin > /dev/null && echo "arm9.bin: OK" || "arm9.bin: Non-matching"

clean:
	@rm -rf build

$(BUILD_DIRS):
	@mkdir -p $@

$(OFILES): $(BUILD_DIRS)

$(BUILD)/%.o: %.c #TODO

$(BUILD)/%.o: %.cpp #TODO

$(BUILD)/%.o: %.s
	@$(AS) $< -o $@