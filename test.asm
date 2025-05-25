.intel_syntax noprefix
.text
.globl main
main:
push ebp
mov ebp, esp

jmp .main.init
.start:
mov eax, 1
mov ecx, 2
add eax, ecx
push eax

push eax
push s_0
call printf

add esp, 8

push eax
pop eax
jmp exit

.main.init:
jmp .start

exit:
leave
ret

.extern printf
.section .rodata
s_0: .string "%d\n"
