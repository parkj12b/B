section .text
global main
main:
push ebp
mov ebp, esp

push s_1
call printf

add esp, 4

sub esp, 4
mov [ebp -4], eax
push dword [b]
push s_2
call printf

add esp, 8

sub esp, 4
mov [ebp -8], eax
lea eax, d
mov ebx, 2
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -12], ebx
mov ebx, [ebp -12]
mov eax, [ebx]
push eax
push s_3
call printf

add esp, 8

sub esp, 4
mov [ebp -16], eax
lea eax, e
mov ebx, 2
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -20], ebx
mov ebx, [ebp -20]
mov eax, [ebx]
push eax
push s_3
call printf

add esp, 8

sub esp, 4
mov [ebp -24], eax
lea eax, f
mov ebx, 4
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -28], ebx
mov ebx, [ebp -28]
mov eax, [ebx]
push eax
push s_2
call printf

add esp, 8

sub esp, 4
mov [ebp -32], eax
push s_4
call printf

add esp, 4

sub esp, 4
mov [ebp -36], eax
push 0

mov eax, 99
mov [ebp -40], eax

sub esp, 4
mov eax, [ebp -40]
mov [ebp -44], eax
push dword [ebp -40]
push s_5
call printf

add esp, 8

sub esp, 4
mov [ebp -48], eax
push s_6
call printf

add esp, 4

sub esp, 4
mov [ebp -52], eax
push s_7
call printf

add esp, 4

sub esp, 4
mov [ebp -56], eax
push 0
sub esp, 40
push 0

lea eax, [ebp -100]
mov ebx, 0
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -108], ebx
mov eax, 0
mov ebx, [ebp -108]
mov [ebx], eax

sub esp, 4
mov eax, [ebp -108]
mov eax, [eax]
mov [ebp -112], eax
lea eax, [ebp -100]
mov ebx, 7
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -116], ebx
mov eax, 7
mov ebx, [ebp -116]
mov [ebx], eax

sub esp, 4
mov eax, [ebp -116]
mov eax, [eax]
mov [ebp -120], eax
lea eax, [ebp -100]
mov ebx, 0
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -124], ebx
lea eax, [ebp -100]
mov ebx, 7
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -128], ebx
mov ebx, [ebp -128]
mov eax, [ebx]
push eax
mov ebx, [ebp -124]
mov eax, [ebx]
push eax
push s_8
call printf

add esp, 12

sub esp, 4
mov [ebp -132], eax
push s_9
call printf

add esp, 4

sub esp, 4
mov [ebp -136], eax
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
s_2 db "%d", 10, 0
s_8 db "%d %d", 10, 0
s_6 db "123", 10, 0
s_3 db "%s", 10, 0
s_5 db "%c", 10, 0
s_7 db "3 ---------", 10, 0
s_9 db "4 ---------", 10, 0
s_0 db "hello", 0
s_1 db "1 ---------", 10, 0
s_4 db "2 ---------", 10, 0
