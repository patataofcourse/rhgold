# progress.py
#   Current rhgold disassembly progress

import subprocess
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("-d", "--decimal", action="store_true", help="Display as decimal rather than hexadecimal")
parser.add_argument("-r", "--raw", action="store_true", help=argparse.SUPPRESS)

args = parser.parse_args()

objdump_non_dism = subprocess.check_output(["arm-none-eabi-objdump", "-h", "arm9/build/data/rest.o"]).decode("ascii")
objdump_all = subprocess.check_output(["arm-none-eabi-objdump", "-h", "arm9/build/arm9.elf"]).decode("ascii")

non_dism_size = int(objdump_non_dism.split(".data")[1].strip().split(" ")[0], 16)
all_size = int(objdump_all.split(".arm9")[1].strip().split(" ")[0], 16)
dism_size = all_size - non_dism_size

percent = 100 * dism_size/all_size

#TODO: whenever data/rodata is done, count that as well
text_size = 0x3daf4
text_percent = 100 * dism_size/text_size

if args.raw:
    print(dism_size, all_size, percent)
else:
    print("rhgold disassembly progress")
    if not args.decimal:
        print(f"arm9: {hex(dism_size)} / {hex(all_size)} bytes disassembled ({round(percent, 2)}%)")
    else:
        print(f"arm9: {dism_size} / {all_size} bytes disassembled ({round(percent, 2)}%)")
    print(f"    this is {round(text_percent, 2)}% of the main .text section")
    print("arm7 and overlays not started")