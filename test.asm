section .text
extern printf
global main
main:
push ebp
mov ebp, esp

push 0

mov eax, 1
mov [ebp -4], eax

sub esp, 4
mov eax, [ebp -4]
mov [ebp -8], eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
push dword [ebp -8]
push s_0
call printf

add esp, 8

push dword [ebp -4]
push s_1
call printf

add esp, 8

sub esp, 4
mov eax, 1
test eax, eax
setz al
movzx eax, al
mov [ebp -12], eax
push dword [ebp -12]
push s_2
call printf

add esp, 8

sub esp, 4
mov eax, 0
test eax, eax
setz al
movzx eax, al
mov [ebp -16], eax
push dword [ebp -16]
push s_3
call printf

add esp, 8

jmp exit

exit:
leave
ret
section .rodata
s_0 db "postfix a: %d expected: 1", 10, 0
s_1 db "after postfix: %d", 10, 0
s_3 db "!0s, expected 1: %d", 10, 0
s_2 db "!1, expected 0: %d", 10, 0
