section .text
global main
main:
push ebp
mov ebp, esp

push 0

mov eax, 1
mov [ebp -4], eax

mov eax, [ebp -4]
push eax
pop eax
push 0

lea eax, [ebp -4]
push eax
pop eax
mov [ebp -8], eax

mov eax, [ebp -8]
push eax
pop eax
mov eax, [ebp -8]
push eax
mov ebx, [ebp -12]
mov eax, [ebx]
push eax
push s_0
call printf

add esp, 8

push eax
pop eax
.LS0:
mov eax, [ebp -4]
push eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
pop eax
mov ecx, 10
cmp eax, ecx
setl al
movzx eax, al
push eax

pop eax
test eax, eax
jz .LF0
push 0

mov eax, [ebp -4]
mov [ebp -16], eax

mov eax, [ebp -16]
push eax
pop eax
push dword [ebp -16]
push s_0
call printf

add esp, 8

push eax
pop eax
jmp .LS0
.LF0:
jmp exit

exit:
leave
ret

extern printf
section .rodata
s_0 db "%d", 10, 0
