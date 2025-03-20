# TODO please turn me into an actual build system (yoink from ph or ooe)

rm -rf orig
rm -rf build

./dsd rom extract -r YLZE01.nds -o ./orig -7 bios/bios7.bin
./dsd delink -c config/arm9/config.yaml
./dsd lcf -c config/arm9/config.yaml -l build/linker_script.lcf -o build/objects.txt
wine tools/mwccarm/2.0/sp1p2/mwldarm.exe -proc arm946e -nostdlib -interworking -m Entry -map closure,unused -msgstyle gcc -nodead @build/objects.txt build/linker_script.lcf -o build/arm9.o
./dsd rom config -e build/arm9.o -c config/arm9/config.yaml
./dsd rom build -c orig/config.yaml -o build/YLZE01.nds -7 bios/bios7.bin
echo -e "\n\n\n\n"
sha1sum YLZE01.nds
sha1sum build/YLZE01.nds

