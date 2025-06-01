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

lea eax, s_0
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr [ebp -4]
call [printf]

add esp, 4

mov [ebp -8], eax
mov eax, 37
mov ecx, 37
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -8], eax

mov eax, [ebp -8]
test eax, eax
jz .LF0
lea eax, s_1
push eax
call [printf]

add esp, 4

mov [ebp -8], eax
.LF0:
push dword ptr 25
lea eax, s_2
push eax
call [printf]

add esp, 8

mov [ebp -8], eax
lea eax, s_4
push eax
lea eax, s_3
push eax
call [printf]

add esp, 8

mov [ebp -8], eax
mov eax, 0
jmp exit
pop ebx
jmp exit

1:
sub esp, 8
jmp 2b

printf:
.long printf + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

mov eax, 0
mov [ebp -16], eax

mov eax, [ebp -16]
mov [ebp -24], eax
lea eax, [ebp +12]
mov [ebp -24], eax
mov eax, [ebp -24]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -24], eax
jmp [.loop]
.loop:
.long .loop + 4
.LS1:
mov eax, [ebp -16]
mov ecx, eax
mov eax, [ebp -16]
inc eax
mov [ebp -16], eax
mov [ebp -24], ecx
push dword ptr [ebp -24]
push dword ptr [ebp +8]
call [char]

add esp, 8

mov [ebp -24], eax
mov eax, [ebp -24]
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -24], eax
mov eax, [ebp -24]
mov ecx, 37
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF1
mov eax, [ebp -12]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF2
mov eax, 0
jmp exit
.LF2:
push dword ptr [ebp -12]
call [putchar]

add esp, 4

mov [ebp -24], eax
jmp .LS1
.LF1:
mov eax, [ebp -4]
mov ecx, eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
mov [ebp -24], ecx
mov eax, [ebp -24]
mov [ebp -24], eax
mov eax, [ebp -24]
mov eax, [eax]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -24], eax
mov eax, [ebp -16]
mov ecx, eax
mov eax, [ebp -16]
inc eax
mov [ebp -16], eax
mov [ebp -24], ecx
push dword ptr [ebp -24]
push dword ptr [ebp +8]
call [char]

add esp, 8

mov [ebp -24], eax
mov eax, [ebp -24]
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -24], eax
mov eax, [ebp -12]
mov ecx, 100
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF3
mov eax, [ebp -8]
mov ecx, 0
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF4
mov eax, [ebp -8]
neg eax
mov [ebp -24], eax
mov eax, [ebp -24]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -24], eax
push dword ptr 45
call [putchar]

add esp, 4

mov [ebp -24], eax
.LF4:
mov eax, [ebp -12]
mov ecx, 111
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF5
mov eax, 8
mov [ebp -24], eax
jmp .LE5
.LF5:
mov eax, 10
mov [ebp -24], eax
.LE5:
push dword ptr [ebp -24]
push dword ptr [ebp -8]
call [printn]

add esp, 8

mov [ebp -24], eax
jmp [.loop]
jmp .LE3
.LF3:
mov eax, [ebp -12]
mov ecx, 99
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF6
push dword ptr [ebp -8]
call [putchar]

add esp, 4

mov [ebp -24], eax
jmp [.loop]
jmp .LE6
.LF6:
mov eax, [ebp -12]
mov ecx, 115
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF7
mov eax, 0
mov [ebp -20], eax

mov eax, [ebp -20]
mov [ebp -24], eax
.LS8:
mov eax, [ebp -20]
mov ecx, eax
mov eax, [ebp -20]
inc eax
mov [ebp -20], eax
mov [ebp -24], ecx
push dword ptr [ebp -24]
push dword ptr [ebp -8]
call [char]

add esp, 8

mov [ebp -24], eax
mov eax, [ebp -24]
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -24], eax
mov eax, [ebp -24]
mov ecx, 0
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF8
push dword ptr [ebp -12]
call [putchar]

add esp, 4

mov [ebp -24], eax
jmp .LS8
.LF8:
jmp [.loop]
.LF7:
.LE6:
.LE3:
push dword ptr 37
call [putchar]

add esp, 4

mov [ebp -24], eax
mov eax, [ebp -16]
mov ecx, eax
mov eax, [ebp -16]
dec eax
mov [ebp -16], eax
mov [ebp -24], ecx
mov eax, [ebp -4]
mov ecx, eax
mov eax, [ebp -4]
dec eax
mov [ebp -4], eax
mov [ebp -24], ecx
jmp [.loop]
pop ebx
jmp exit

1:
sub esp, 24
jmp 2b

printn:
.long printn + 4
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
jz .LF9
push dword ptr [ebp +12]
push dword ptr [ebp -4]
call [printn]

add esp, 8

mov [ebp -8], eax
.LF9:
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
call [putchar]

add esp, 4

mov [ebp -8], eax
pop ebx
jmp exit

1:
sub esp, 8
jmp 2b

putchar:
.long putchar + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, [ebp +8]
mov [ebp -4], eax
push dword ptr 1
push dword ptr [ebp -4]
push dword ptr 1
push dword ptr 4
call [syscall]

add esp, 16

mov [ebp -4], eax
mov eax, [ebp -4]
jmp exit
pop ebx
jmp exit

1:
sub esp, 4
jmp 2b

char:
.long char + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
mov eax, [ebp +8]
mov ecx, [ebp +12]
add eax, ecx
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -4], eax
mov eax, [ebp -4]
mov eax, [eax]
mov ecx, 255
and eax, ecx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp exit
pop ebx
jmp exit

1:
sub esp, 4
jmp 2b

printstr:
.long printstr + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
.LS10:
mov eax, [ebp +8]
mov [ebp -4], eax
mov eax, [ebp -4]
mov eax, [eax]
mov ecx, 0
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -4], eax

mov eax, [ebp -4]
test eax, eax
jz .LF10
mov eax, [ebp +8]
mov [ebp -4], eax
mov eax, [ebp -4]
mov eax, [eax]
push eax
call [putchar]

add esp, 4

mov [ebp -4], eax
mov eax, [ebp +8]
mov ecx, eax
mov eax, [ebp +8]
inc eax
mov [ebp +8], eax
mov [ebp -4], ecx
jmp .LS10
.LF10:
pop ebx
jmp exit

1:
sub esp, 4
jmp 2b

exit:
leave
ret

.globl putchar
.globl printn
.globl printstr
.globl main
.globl printf
.extern syscall
.globl char
.section .rodata
s_4: .string "jacob park"
s_1: .string "equal\n"
s_3: .string "My name is %s\n"
s_2: .string "I am %d years old\n"
s_0: .string "hello world!\n"
