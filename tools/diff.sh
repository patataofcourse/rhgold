xxd extract/$1.bin > in.dump
xxd build/$1.bin > out.dump
diff in.dump out.dump > $1.diff