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

push dword [ebp - 8]
lea eax, s_0
push eax
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
