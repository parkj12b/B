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

mov eax, 0
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -20], eax
mov eax, [ebp -20]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -20], eax
push dword ptr [n]
lea eax, s_0
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -20], eax
.LS0:
mov eax, [ebp -4]
mov ecx, dword ptr [n]
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -20], eax

mov eax, [ebp -20]
test eax, eax
jz .LF0
mov eax, [ebp -4]
mov ecx, eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
mov [ebp -20], ecx
mov eax, dword ptr [v]
mov ebx, [ebp -20]
imul ebx, 4
add ebx, eax
mov [ebp -20], ebx
mov eax, 1
mov ebx, [ebp -20]
mov [ebx], eax

mov eax, [ebp -20]
mov eax, [eax]
mov [ebp -20], eax
jmp .LS0
.LF0:
.LS1:
mov eax, 2
mov ecx, dword ptr [n]
imul eax, ecx
mov [ebp -20], eax

mov eax, [ebp -12]
mov ecx, [ebp -20]
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -20], eax

mov eax, [ebp -20]
test eax, eax
jz .LF1
mov eax, dword ptr [n]
mov ecx, 1
add eax, ecx
mov [ebp -20], eax

mov eax, [ebp -20]
mov [ebp -16], eax

mov eax, [ebp -16]
mov [ebp -20], eax
mov eax, 0
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -20], eax
mov eax, [ebp -20]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -20], eax
.LS2:
mov eax, [ebp -4]
mov ecx, dword ptr [n]
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -20], eax

mov eax, [ebp -20]
test eax, eax
jz .LF2
mov eax, dword ptr [v]
mov ebx, [ebp -4]
imul ebx, 4
add ebx, eax
mov [ebp -20], ebx
mov eax, [ebp -20]
mov eax, [eax]
mov ecx, 10
imul eax, ecx
mov [ebp -20], eax

mov eax, [ebp -8]
mov ecx, [ebp -20]
add eax, ecx
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -20], eax
mov eax, [ebp -4]
mov ecx, eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
mov [ebp -20], ecx
mov eax, dword ptr [v]
mov ebx, [ebp -20]
imul ebx, 4
add ebx, eax
mov [ebp -20], ebx
mov eax, [ebp -8]
mov ecx, [ebp -16]
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -24], eax

mov eax, [ebp -24]
mov ebx, [ebp -20]
mov [ebx], eax

mov eax, [ebp -20]
mov eax, [eax]
mov [ebp -20], eax
mov eax, [ebp -16]
mov ecx, eax
mov eax, [ebp -16]
dec eax
mov [ebp -16], eax
mov [ebp -20], ecx
mov eax, [ebp -8]
mov ecx, [ebp -20]
xor edx, edx
idiv ecx
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -20], eax
jmp .LS2
.LF2:
mov eax, [ebp -8]
mov ecx, 48
add eax, ecx
mov [ebp -20], eax

push dword ptr [ebp -20]
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -20], eax
mov eax, [ebp -12]
inc eax
mov [ebp -12], eax
mov eax, [ebp -12]
mov ecx, 5
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -20], eax

mov eax, [ebp -20]
test eax, eax
setz al
movzx eax, al
mov [ebp -20], eax
mov eax, [ebp -20]
test eax, eax
jz .LF3
mov eax, [ebp -12]
mov ecx, 50
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -20], eax

mov eax, [ebp -20]
test eax, eax
jz .LF4
mov eax, 32
mov [ebp -20], eax
jmp .LE4
.LF4:
mov eax, 10
mov [ebp -20], eax
.LE4:
push dword ptr [ebp -20]
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -20], eax
.LF3:
jmp .LS1
.LF1:
pop ebx
jmp _exit

1:
sub esp, 24
jmp 2b

_exit:
leave
ret

.extern putchar
.globl main
.extern printf
.globl n
.globl v
.bss
v_v: .zero 8004

.data
n: .long 2000

v: .long v_v
.section .rodata
s_0: .string "n: %d\n"
