make -C tools/ndsdisasm || exit 1
tools/ndsdisasm/ndsdisasm "baserom.nds" -c tools/rhgold.cfg -d > tools/arm9.s
