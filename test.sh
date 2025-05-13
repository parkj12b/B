./a.out examples/test1.b 2>/dev/null > test.asm
nasm -f elf32 test.asm -o test.o
gcc -mtune=i386 -m32 -pie test.o -o test
./test