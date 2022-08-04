# rhgold
Disassembly/decompilation attempt for Rhythm Heaven (US), AKA Rhythm Tengoku Gold, for the Nintendo DS

Currently produces arm9.bin and arm7.bin files to be inserted into the ROM using ndstool or similar programs, plus ELF files for help with debugging.

## Current progress
* arm9.bin: in the process of disassembling
* arm7.bin: not yet disassembled
* ARM9 overlays: not yet added

In the future, the filesystem, banner, etc. will be extracted from the ROM and a full NDS rom will be built (even if it ends up not being fully matching due to using ndstool rather than the official Nintendo SDK)

The MetroWerks C Compiler for ARM will also be needed for decompilation, whenever it starts being worked on (current best known build: 3.0 build 137), but the Nintendo SDK or any other MetroWerks ARM tools won't be needed for making the ROM.

The main purpose of this disassembly is research for modding purposes, with shiftability being a secondary goal. Full decompilation is likely a goal for the very distant future.

## Installation
You'll need the following dependencies:

* `devKitARM`
* `make`
* `git`
* `build-essentials`/`build-essential` (or whatever dependency has the GNU Compiler Collection)

Extract the `arm9.bin` and `arm7.bin` files from your ROM and place them in `rhgold`.

Run `make` to make both the ARM9 and ARM7 binaries. You can use `make clean` to clean up the build directories and `make re` to "remake" everything, ie, clean up and then make everything from scratch.