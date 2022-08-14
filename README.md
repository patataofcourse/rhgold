# rhgold
Disassembly project for Rhythm Heaven (aka Rhythm Tengoku Gold, Rhythm Paradise, or Rhythm World/Rhythm Sesang), for the Nintendo DS.

Produces individual binaries, a built .nds file (which doesn't yet match the original .nds file), and ELF files for debugging purposes, one per processor.

## Supported versions
Before supporting other languages, full arm9.bin disassembly is a must.

**Currently supported**

* NTR-YLZE-USA (Rhythm Heaven)

**Not supported yet**

* NTR-YLZJ-JPN (Rhythm Tengoku Gold)
* NTR-YLZP-EUR (Rhythm Paradise - EN/FR/DE)
* NTR-YLZX-EUR (Rhythm Paradise - EN/ES/IT)
* NTR-YLZK-KOR (Rhythm World)

All versions of Rhythm Heaven have a single revision (rev0).

## Current progress
* arm9.bin: in the process of disassembling
* arm7.bin: not yet disassembled
* ARM9 overlays: not yet added

The Metrowerks C Compiler (version 3.0 build 137 / v2.0sp2p2) will also be needed for compiling C/C++ files (when they are added to the repository), but no other Metrowerks tool (e.g. the linker or assembler) will be used. No Nintendo SDK tools will be required, either.

The main purpose of this disassembly is research for modding purposes, with shiftability being a secondary goal. Full decompilation is likely for the very distant future.

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