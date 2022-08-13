import argparse

parser = argparse.ArgumentParser(description="Removes the ARM9 footer from arm9.bin files extracted by ndstool",)

parser.add_argument("rom", help="The ROM the arm9.bin was extracted from")
parser.add_argument("binary", help="The arm9.bin extracted")

args = parser.parse_args()

try:
    rom = open(args.rom, "rb")
except FileNotFoundError:
    print(f"File {args.rom} not found")
try:
    binary = open(args.binary, "rb")
except FileNotFoundError:
    print(f"File {args.binary} not found")

# Get size of arm9.bin
rom.seek(0x2c)
arm9_size = int.from_bytes(rom.read(4), "little")

# Read the part of arm9.bin that doesn't include the header
arm9 = binary.read(arm9_size)
binary.close()

# Write correct arm9.bin to file
binary = open(args.binary, "wb")
binary.write(arm9)
binary.close()