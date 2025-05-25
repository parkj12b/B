./B examples/test2.b 2>/dev/null > test.asm
gcc -m32 -c test.asm -o test.o
gcc -m32 test.o -o test
./test