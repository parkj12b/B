.intel_syntax noprefix
.text
.globl main
main:
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [v]
push dword ptr [u]
lea eax, [s_0]
push eax
call printf

add esp, 12

mov [ebp -4], eax
mov eax, dword ptr [u]
mov dword ptr [v], eax

mov eax, dword ptr [v]
mov [ebp -4], eax
push dword ptr [v]
push dword ptr [u]
lea eax, [s_1]
push eax
call printf

add esp, 12

mov [ebp -4], eax
mov eax, dword ptr [u]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -4], ebx
mov eax, dword ptr [u]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -8], ebx
mov eax, dword ptr [u]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -12], ebx
mov eax, [ebp -12]
mov eax, [eax]
push eax
mov eax, [ebp -8]
mov eax, [eax]
push eax
mov eax, [ebp -4]
mov eax, [eax]
push eax
lea eax, [s_2]
push eax
call printf

add esp, 16

mov [ebp -4], eax
mov eax, dword ptr [v]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -4], ebx
mov eax, dword ptr [v]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -8], ebx
mov eax, dword ptr [v]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -12], ebx
mov eax, [ebp -12]
mov eax, [eax]
push eax
mov eax, [ebp -8]
mov eax, [eax]
push eax
mov eax, [ebp -4]
mov eax, [eax]
push eax
lea eax, [s_3]
push eax
call printf

add esp, 16

mov [ebp -4], eax
mov eax, dword ptr [v]
mov [ebp -4], eax
mov eax, dword ptr [v]
mov ecx, 4
add eax, ecx
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -8], eax
mov eax, dword ptr [v]
mov ecx, 8
add eax, ecx
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -12], eax
mov eax, [ebp -12]
mov eax, [eax]
push eax
mov eax, [ebp -8]
mov eax, [eax]
push eax
mov eax, [ebp -4]
mov eax, [eax]
push eax
lea eax, [s_4]
push eax
call printf

add esp, 16

mov [ebp -4], eax
lea eax, u
mov [ebp -4], eax
push dword ptr [ebp -4]
lea eax, [s_5]
push eax
call printf

add esp, 8

mov [ebp -4], eax
lea eax, u
mov [ebp -4], eax
mov eax, [ebp -4]
mov [ebp -4], eax
push dword ptr [u]
mov eax, [ebp -4]
mov eax, [eax]
push eax
lea eax, [s_6]
push eax
call printf

add esp, 12

mov [ebp -4], eax
mov eax, dword ptr [u]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -4], ebx
mov eax, [ebp -4]
mov [ebp -4], eax
mov eax, [ebp -4]
mov [ebp -4], eax
mov eax, [ebp -4]
mov eax, [eax]
push eax
lea eax, [s_7]
push eax
call printf

add esp, 8

mov [ebp -4], eax
mov eax, 0
pop ebx
jmp exit

1:
sub esp, 12
jmp 2b

exit:
leave
ret

.extern printf
.bss
v_v: .zero 44

.data
u_v: .long 1, 2, 3
.rept 7
.long 0
.endr
u: .long u_v

v: .long v_v
.section .rodata
s_6: .string "address addr->deref:    [%d] == [%d]\n"
s_1: .string "after v = u:            u: [%d] v: [%d]\n"
s_3: .string "working! v[index]:      [%d] [%d] [%d]\n"
s_0: .string "before:                 u: [%d] v: [%d]\n"
s_2: .string "working! u[index]:      [%d] [%d] [%d]\n"
s_4: .string "working! *(v + index):  [%d] [%d] [%d]\n"
s_7: .string "address addr[0]->deref: [%d] == [1]\n"
s_5: .string "address u:              [%d]\n"
