./B examples/test.b 2>/dev/null > test.s
as --32 test.s -o test.o
make -C test_lib all
gcc -nostartfiles -g -m32 -mtune=i386 -L./test_lib -lb test.o brt0.o ./test_lib/libb.a -o test
./test