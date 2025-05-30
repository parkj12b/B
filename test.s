.intel_syntax noprefix
.text
.globl main
main:
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

mov eax, 0
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
mov eax, dword ptr [v]
mov ebx, [ebp -4]
imul ebx, 4
add ebx, eax
mov [ebp -8], ebx
mov eax, [ebp -8]
mov eax, [eax]
push eax
lea eax, [s_0]
push eax
call printf

add esp, 8

mov [ebp -8], eax
pop ebx
jmp exit

1:
sub esp, 8
jmp 2b

exit:
leave
ret

.extern printf
.data
v_v: .long 1, 2, 3
.rept 7
.long 0
.endr
v: .long v_v

.section .rodata
s_0: .string "%d\n"
