ifeq ($(strip $(DEVKITPRO)),)
	$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro)
endif

BASEROM := baserom.nds #TODO: regions
BUILD	:= build
EXTRACT := extract

COMPARE	?= 1

.PHONY: all arm9 arm7 checkrom clean cleanall compare

ifeq (compare, 0)
all: checkrom $(EXTRACT) arm9 arm7
else
all: checkrom $(EXTRACT) arm9 arm7 compare
endif

re: clean all

clean:
	@echo "clean ..."
	@rm -rf build *.diff *.dump
	@$(MAKE) -C arm9 clean --no-print-directory
	@$(MAKE) -C arm7 clean --no-print-directory

cleanall: clean
	@rm -rf extract

arm9:
	@$(MAKE) -C arm9 --no-print-directory
	@mkdir -p build
	@mv arm9/build/arm9.* build/

arm7:
	@$(MAKE) -C arm7 --no-print-directory
	@mkdir -p build
	@mv arm7/build/arm7.* build/

checkrom: build/baserom.sha1
	@if not sha1sum -c build/baserom.sha1 2>&1 > /dev/null ; then echo "Error: Base ROM supplied is not US Rhythm Heaven"; false; fi

$(BUILD)/baserom.sha1: rhds.sha1
	@mkdir -p $(BUILD)
	@cat rhds.sha1 > $@
	@echo " baserom.nds" >> $@

$(EXTRACT): baserom.nds
	@echo "Extracting base ROM..."
	@mkdir -p extract
	@ndstool -x baserom.nds -9 extract/arm9.bin -7 extract/arm7.bin -y9 extract/y9.bin -y7 extract/y7.bin \
	-d extract/files -y extract/overlay -t extract/banner.bin -h extract/header.bin

compare:
	@diff $(EXTRACT)/arm9.bin $(BUILD)/arm9.bin > /dev/null && echo "arm9.bin: OK" || echo "arm9.bin: FAILED"
	@diff $(EXTRACT)/arm7.bin $(BUILD)/arm7.bin > /dev/null && echo "arm7.bin: OK" || echo "arm7.bin: FAILED"