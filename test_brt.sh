./B examples/test.b 2>/dev/null > test.s
as --32 test.s -o test.o
gcc -nostartfiles -g -m32 -mtune=i386 test.o brt0.o -o test
./test