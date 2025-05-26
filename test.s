.intel_syntax noprefix
.text
.globl main
main:
push ebp
mov ebp, esp

jmp 1f
2:

mov eax, 0
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -20], eax
mov eax, [ebp -20]
mov [ebp -4], eax

t_0
mov eax, [ebp -4]
mov [ebp -20], eax
t_2
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
t_4
mov eax, [ebp -4]
mov [ebp -20], eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
lea eax, v
mov ebx, [ebp -20]
imul ebx, 4
add ebx, eax
mov [ebp -24], ebx
t_6
mov eax, 1
mov ebx, [ebp -24]
mov [ebx], eax

mov eax, [ebp -24]
mov eax, [eax]
mov [ebp -24], eax
t_8
t_10
push dword ptr [ebp -4]
lea eax, [s_0]
push eax
call printf

add esp, 8

mov [ebp -20], eax
t_12
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
mov [ebp -24], eax

t_14
mov eax, [ebp -24]
test eax, eax
jz .LF1
t_16
push dword ptr [ebp -12]
lea eax, [s_0]
push eax
call printf

add esp, 8

mov [ebp -20], eax
t_18
mov eax, dword ptr [n]
mov ecx, 1
add eax, ecx
mov [ebp -20], eax

mov eax, [ebp -20]
mov [ebp -16], eax

t_20
mov eax, [ebp -16]
mov [ebp -20], eax
t_22
mov eax, 0
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -20], eax
mov eax, [ebp -20]
mov [ebp -8], eax

t_24
mov eax, [ebp -8]
mov [ebp -20], eax
t_26
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
t_28
lea eax, v
mov ebx, [ebp -4]
imul ebx, 4
add ebx, eax
mov [ebp -20], ebx
mov eax, [ebp -20]
mov eax, [eax]
mov ecx, 10
imul eax, ecx
mov [ebp -24], eax

t_30
mov eax, [ebp -8]
mov ecx, [ebp -24]
add eax, ecx
mov [ebp -8], eax

t_32
mov eax, [ebp -8]
mov [ebp -20], eax
t_34
mov eax, [ebp -4]
mov [ebp -20], eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
lea eax, v
mov ebx, [ebp -20]
imul ebx, 4
add ebx, eax
mov [ebp -24], ebx
t_36
mov eax, [ebp -8]
mov ecx, [ebp -16]
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -24], eax

mov eax, [ebp -24]
mov ebx, [ebp -24]
mov [ebx], eax

t_40
mov eax, [ebp -24]
mov eax, [eax]
mov [ebp -24], eax
t_38
t_42
push dword ptr [ebp -4]
lea eax, [s_1]
push eax
call printf

add esp, 8

mov [ebp -20], eax
t_44
mov eax, [ebp -16]
mov [ebp -20], eax
mov eax, [ebp -16]
dec eax
mov [ebp -16], eax
mov eax, [ebp -8]
mov ecx, [ebp -20]
xor edx, edx
idiv ecx
mov [ebp -8], eax

t_46
mov eax, [ebp -8]
mov [ebp -20], eax
t_48
jmp .LS2
.LF2:
mov eax, [ebp -8]
mov ecx, 48
add eax, ecx
mov [ebp -20], eax

push dword ptr [ebp -20]
t_50
call putchar

add esp, 4

mov [ebp -20], eax
t_52
mov eax, [ebp -12]
inc eax
mov [ebp -12], eax
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
mov [ebp -24], eax
t_54
mov eax, [ebp -24]
test eax, eax
jz .LF3
t_56
mov eax, [ebp -12]
mov ecx, 50
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -20], eax

mov eax, [ebp -20]
test eax, eax
jz .LF4
t_58
mov eax, 32
jmp .LE4
.LF4:
mov eax, 110
mov [ebp -24], eax
.LE4:
push dword ptr [ebp -24]
t_60
call putchar

add esp, 4

mov [ebp -20], eax
t_62
.LF3:
jmp .LS1
.LF1:
jmp exit

1:
sub esp, 24
jmp 2b

exit:
leave
ret

.extern putchar
.extern printf
.bss
v: .zero 8000

.data
n: .long 2000

.section .rodata
s_1: .string "i: %d\n"
s_0: .string "%d\n"
