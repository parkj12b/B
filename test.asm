section .text
extern printf
global main
main:
push ebp
mov ebp, esp

push 0

mov eax, 0
mov [ebp -4], eax

sub esp, 4
mov eax, [ebp -4]
mov [ebp -8], eax
sub esp, 4
mov eax, [ebp -4]
test eax, eax
jz .LF1
mov eax, 1
mov [ebp -12], eax
jmp .LE1
.LF1:
mov eax, 0
mov [ebp -12], eax
.LE1:
push dword [ebp -12]
push s_0
call printf

add esp, 8

jmp exit

exit:
leave
ret
section .rodata
s_0 db "%d", 10, 0
