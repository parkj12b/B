section .text
global main
main:
push ebp
mov ebp, esp

push dword [b]
push s_1
call printf

add esp, 8

sub esp, 4
mov [ebp -4], eax
lea eax, d
mov ebx, 2
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -8], ebx
mov ebx, [ebp -8]
mov eax, [ebx]
push eax
push s_2
call printf

add esp, 8

sub esp, 4
mov [ebp -12], eax
lea eax, e
mov ebx, 2
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -16], ebx
mov ebx, [ebp -16]
mov eax, [ebx]
push eax
push s_2
call printf

add esp, 8

sub esp, 4
mov [ebp -20], eax
lea eax, f
mov ebx, 4
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -24], ebx
mov ebx, [ebp -24]
mov eax, [ebx]
push eax
push s_1
call printf

add esp, 8

sub esp, 4
mov [ebp -28], eax
push 0

mov eax, 99
mov [ebp -32], eax

sub esp, 4
mov eax, [ebp -32]
mov [ebp -36], eax
push dword [ebp -32]
push s_3
call printf

add esp, 8

sub esp, 4
mov [ebp -40], eax
jmp exit

addition:
push ebp
mov ebp, esp

sub esp, 4
mov eax, [ebp +8]
mov ebx, dword [ebp +12]
add eax, ebx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp exit

subtract:
push ebp
mov ebp, esp

sub esp, 4
mov eax, [ebp +8]
mov ebx, dword [ebp +12]
sub eax, ebx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp exit

exit:
leave
ret

extern printf
section .bss
c resd 1
d resd 5

section .data
e dd 1, 2, s_0
dd 2 dup 0
b dd 1
f dd 1, 2, 3, 4, 5
a dd 1, 2, 3, 4, 5

section .rodata
s_1 db "%d", 10, 0
s_2 db "%s", 10, 0
s_3 db "%c", 10, 0
s_0 db "hello", 0
