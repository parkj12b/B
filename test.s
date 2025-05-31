.intel_syntax noprefix
.text
.globl main
main:
.long main + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_0
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr 104
call [putchar]

add esp, 4

mov [ebp -8], eax
push dword ptr 10
call [putchar]

add esp, 4

mov [ebp -8], eax
mov eax, 0
pop ebx
jmp exit

1:
sub esp, 8
jmp 2b

exit:
leave
ret

.extern putchar
.globl main
.section .rodata
s_0: .string "hello world!\n"
