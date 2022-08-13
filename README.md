# rhgold
Disassembly/decompilation attempt for Rhythm Heaven (US), AKA Rhythm Tengoku Gold, for the Nintendo DS.

[ARM9 currently false-negatives]

Produces individual binaries, a built .nds rom (non-matching due to using ndstool), and ELF files for debugging.

## Current progress
* arm9.bin: in the process of disassembling
* arm7.bin: not yet disassembled
* ARM9 overlays: not yet added

The MetroWerks C Compiler for ARM will also be needed for compilation, whenever decomp starts being worked on (current best known build: 3.0 build 137), but the Nintendo SDK and other MetroWerks ARM tools won't be needed for compiling and making the ROM.

The main purpose of this disassembly is research for modding purposes, with shiftability being a secondary goal. Full decompilation is likely a goal for the very distant future.

In the future, when the disassembly and decompilation are far more mature, other language versions or revisions of the ROM (if they exist) will be supported.

## Installation
### Windows / Mac
Instructions coming in the future.

### Linux
You'll need the following dependencies:

* `devKitARM`
* `ndstool`
* `make`
* `git`
* `build-essentials`/`build-essential`/`base-devel` (depends on distro)
* Python 3 (for the `fixarm9.py` script)

Rename your US Rhythm Heaven ROM to `baserom.nds` and place it in the root folder of the repo.

Run `make` to make both the ARM9 and ARM7 binaries. You can use `make clean` to clean up the build directories and `make re` to "remake" everything, ie, clean up and then make everything from scratch.