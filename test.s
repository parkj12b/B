.intel_syntax noprefix
.text
.globl main
main:
push ebp
mov ebp, esp

jmp 1f
2:

mov eax, 110
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -12], eax
push dword ptr [ebp -4]
lea eax, [s_1]
push eax
call printf

add esp, 8

mov [ebp -16], eax
jmp exit

1:
sub esp, 16
jmp 2b

exit:
leave
ret

.extern printf
.bss
c: .zero 4
d: .zero 20

.data
e: .long 1, 2, s_0
.rept 2
.long 0
.endr
b: .long 1
f: .long 1, 2, 3, 4, 5
a: .long 1, 2, 3, 4, 5

.section .rodata
s_1: .string "%d\n"
s_0: .string "hello"
