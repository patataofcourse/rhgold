ifeq ($(strip $(DEVKITPRO)),)
	$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro)
endif

#TODO: regions

BASEROM 		:= baserom.nds
BUILD			:= build
EXTRACT 		:= extract
ROMFILE 		:= $(BUILD)/rhds.nds

# NDS file isn't matching yet (ndstool moment), so for now comparing the NDS file is its
# own, separate option

COMPARE			?= 1
COMPARE_NDS		?= 0
ALWAYS_EXTRACT 	?= 0

.NOTPARALLEL:
.PHONY: all arm9 arm7 checkrom clean cleanall compare fixarm9

ifeq ($(COMPARE), 0)
all: checkrom $(ROMFILE)
else
all: checkrom $(ROMFILE) compare
endif

FORCE:

re: clean all

clean:
	@echo "clean ..."
	@rm -rf build *.diff *.dump
	@$(MAKE) -C arm9 clean --no-print-directory
	@$(MAKE) -C arm7 clean --no-print-directory

cleanall: clean
	@rm -rf extract

arm9:
	@echo "Creating ARM9 binary..."
	@$(MAKE) -C arm9 --no-print-directory -s
	@mkdir -p build
	@cp arm9/build/arm9.* build/

arm7:
	@echo "Creating ARM7 binary..."
	@$(MAKE) -C arm7 --no-print-directory -s
	@mkdir -p build
	@cp arm7/build/arm7.* build/

checkrom: build/baserom.sha1
	@if not sha1sum -c build/baserom.sha1 2>&1 > /dev/null ; then echo "Error: Base ROM supplied is not US Rhythm Heaven"; false; fi

$(BUILD)/baserom.sha1: rhds.sha1
	@mkdir -p $(BUILD)
	@cat rhds.sha1 > $@
	@echo " $(BASEROM)" >> $@

$(BUILD)/rhds.sha1: rhds.sha1
	@mkdir -p $(BUILD)
	@cat rhds.sha1 > $@
	@echo " $(ROMFILE)" >> $@

ifeq ($(ALWAYS_EXTRACT), 0)
$(EXTRACT): $(BASEROM)
else
$(EXTRACT): FORCE
endif
	@echo "Extracting base ROM..."
	@mkdir -p $@
	@ndstool -x $(BASEROM) -9 $@/arm9.bin -7 $@/arm7.bin -y9 $@/y9.bin \
	-d $@/files -y $@/overlay -t $@/banner.bin -h $@/header.bin > /dev/null

ifeq ($(COMPARE_NDS), 0)
compare: $(ROMFILE)
else 
compare: $(ROMFILE) $(BUILD)/rhds.sha1
	@sha1sum -c $(BUILD)/rhds.sha1 2> /dev/null || true
endif
	@diff $(EXTRACT)/arm9.bin $(BUILD)/arm9.bin > /dev/null && echo "arm9.bin: OK" || echo "arm9.bin: FAILED"
	@diff $(EXTRACT)/arm7.bin $(BUILD)/arm7.bin > /dev/null && echo "arm7.bin: OK" || echo "arm7.bin: FAILED"

#TODO: also generate banner, y9.bin and overlay files (maybe some FS files too?)
$(ROMFILE): $(EXTRACT) fixarm9 arm9 arm7
	@echo "Creating target ROM..."
	@ndstool -c $(ROMFILE) -9 $(BUILD)/arm9.bin -7 $(BUILD)/arm7.bin -y9 $(EXTRACT)/y9.bin \
	-d $(EXTRACT)/files -y $(EXTRACT)/overlay -t $(EXTRACT)/banner.bin -h $(EXTRACT)/header.bin > /dev/null

fixarm9: $(EXTRACT)
	@echo "Fixing extracted arm9.bin..."
	@python3 tools/fixarm9.py $(BASEROM) $(EXTRACT)/arm9.bin