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
    - Code overlays will likely be supported very easily
    - Tickflow overlays will require a compiler that can build tickflow to ELF files
* NitroFS files: support not planned
    - Check out the RHDS section of RHModding's [Resources and Guides](https://rhmodding.github.io/resources-and-guides/) site for information on how to edit these files

The Metrowerks C Compiler (version 3.0 build 137 / v2.0sp2p2) will also be needed for compiling C/C++ files (when they are added to the repository), but no other Metrowerks tool (like the linker or assembler) will be used. No Nintendo SDK tools will be required, either.

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
* `sha1sum`
* Python 3 (for the `fixarm9.py` script - will eventually only be required for extra scripts)

Clone the repo instead of downloading from source, so that you can easily merge future changes into your local copy.

Initializing the `tools/ndsdisasm` submodule is required for running the disassembly script. `tools/ndsbuild` is not public yet.

Rename your US Rhythm Heaven ROM to `baserom.nds` and place it in the root folder of the repo.

Run `make` to make both the ARM9 and ARM7 binaries. You can use `make clean` to clean up the build directories and `make re` as a shortcut for `make clean && make`.

## Contributing

TBD