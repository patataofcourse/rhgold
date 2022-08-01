ifeq ($(strip $(DEVKITPRO)),)
	$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro)
endif

.PHONY: all arm9 arm7 clean

all: arm9 arm7

re: clean all

clean:
	@echo "clean ..."
	@rm -rf build *.diff *.dump
	@$(MAKE) -C arm9 clean --no-print-directory
	@$(MAKE) -C arm7 clean --no-print-directory

arm9:
	@$(MAKE) -C arm9 --no-print-directory
	@mkdir -p build
	@mv arm9/build/arm9.* build/

arm7:
	@$(MAKE) -C arm7 --no-print-directory
	@mkdir -p build
	@mv arm7/build/arm7.* build/