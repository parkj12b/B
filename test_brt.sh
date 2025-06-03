./B examples/e-2.b 2>/dev/null > test.s
make -C libb all
as --32 test.s -o test.o
ld -pie -dynamic-linker /lib/ld-linux.so.2 -m elf_i386 test.o brt0.o -o test -L./libb -lb
#gcc -nostartfiles -g -m32 -mtune=i386 -L./libb -lb test.o brt0.o -o test
./test