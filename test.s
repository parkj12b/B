.intel_syntax noprefix
.text
.globl main
printn:
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

mov eax, [ebp +8]
mov ecx, [ebp +12]
xor edx, edx
idiv ecx
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
mov eax, [ebp -8]
test eax, eax
jz .LF0
push dword ptr [ebp +12]
push dword ptr [ebp -4]
call printn

add esp, 8

mov [ebp -8], eax
.LF0:
mov eax, [ebp +8]
mov ecx, [ebp +12]
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -8], eax

mov eax, [ebp -8]
mov ecx, 48
add eax, ecx
mov [ebp -8], eax

push dword ptr [ebp -8]
call putchar

add esp, 4

mov [ebp -8], eax
pop ebx
jmp exit

1:
sub esp, 8
jmp 2b

main:
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr 2
push dword ptr 10
call printn

add esp, 8

mov [ebp -4], eax
push dword ptr 10
call putchar

add esp, 4

mov [ebp -4], eax
pop ebx
jmp exit

1:
sub esp, 4
jmp 2b

exit:
leave
ret

.extern putchar
.section .rodata
