./B examples/e-2.b 2>/dev/null > test.s
as --32 test.s -o test.o
gcc -pie -g -m32 -mtune=i386 test.o -o test
./test