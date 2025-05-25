./B examples/test2.b 2>/dev/null > test.s
as --32 test.s -o test.o
gcc -pie -m32 test.o -o test
./test