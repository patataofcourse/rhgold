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
	@$(LD) -e 0 $< -T arm7.ld -o $(BUILD)/arm7.elf -g -A armv4t
	@$(OBJCOPY) -O binary $(BUILD)/arm7.elf $(BUILD)/arm7.bin

clean:
	@rm -rf build

$(BUILD_DIRS):
	@mkdir -p $@

$(OFILES): $(BUILD_DIRS)

$(BUILD)/%.o: %.c #TODO

$(BUILD)/%.o: %.cpp #TODO

$(BUILD)/%.o: %.s
	@$(AS) $< -o $@ -march=armv4t -g3
