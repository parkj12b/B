section .text
global main
main:
push ebp
mov ebp, esp

jmp .main.init
.start:
push s_1
call printf

add esp, 4

push eax
pop eax
lea eax, e
mov ebx, 2
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_2
call printf

add esp, 8

push eax
pop eax
push dword [ebp +0]
push s_3
call printf

add esp, 8

push eax
pop eax
push s_4
call printf

add esp, 4

push eax
pop eax

mov eax, 99
mov [ebp -4], eax

mov eax, [ebp -4]
push eax
pop eax
push dword [ebp -4]
push s_5
call printf

add esp, 8

push eax
pop eax
push s_6
call printf

add esp, 4

push eax
pop eax
push s_7
call printf

add esp, 4

push eax
pop eax

lea eax, [ebp -48]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
mov eax, 0
mov [ebp +0], eax

pop eax
push eax
pop eax
lea eax, [ebp -48]
mov ebx, 7
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
mov eax, 7
mov [ebp +0], eax

pop eax
push eax
pop eax
lea eax, [ebp -48]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
lea eax, [ebp -48]
mov ebx, 7
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push dword [ebp +0]
push s_8
call printf

add esp, 12

push eax
pop eax
push s_9
call printf

add esp, 4

push eax
pop eax
push s_10
call printf

add esp, 4

push eax
pop eax
mov eax, 5
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push s_11
call printf

add esp, 4

push eax
pop eax
push s_12
call printf

add esp, 4

push eax
pop eax
mov eax, 1
test eax, eax
jz .LF0
push s_13
call printf

add esp, 4

push eax
pop eax
.LF0:
mov eax, 1
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
push eax
mov eax, [ebp +0]
inc eax
mov [ebp +0], eax
pop eax
test eax, eax
jz .LF1
mov eax, 1
test eax, eax
jz .LF2
push s_14
call printf

add esp, 4

push eax
pop eax
jmp .LE2
.LF2:
push s_15
call printf

add esp, 4

push eax
pop eax
.LE2:
.LF1:
push dword [ebp +0]
push s_16
call printf

add esp, 8

push eax
pop eax
mov eax, 5
neg eax
push eax
pop eax
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
.LS3:
mov eax, [ebp +0]
push eax
mov eax, [ebp +0]
inc eax
mov [ebp +0], eax
pop eax
test eax, eax
jz .LF3
push dword [ebp +0]
push s_3
call printf

add esp, 8

push eax
pop eax
jmp .LS3
.LF3:
push dword [ebp +0]
push s_17
call printf

add esp, 8

push eax
pop eax
mov eax, 2
neg eax
push eax
pop eax
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
.LS4:
mov eax, [ebp +0]
inc eax
mov [ebp +0], eax
mov eax, [ebp +0]
test eax, eax
jz .LF4
push dword [ebp +0]
push s_3
call printf

add esp, 8

push eax
pop eax
jmp .LS4
.LF4:
push dword [ebp +0]
push s_18
call printf

add esp, 8

push eax
pop eax
mov eax, 2
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
.LS5:
mov eax, [ebp +0]
dec eax
mov [ebp +0], eax
mov eax, [ebp +0]
test eax, eax
jz .LF5
push dword [ebp +0]
push s_19
call printf

add esp, 8

push eax
pop eax
jmp .LS5
.LF5:
push dword [ebp +0]
push s_18
call printf

add esp, 8

push eax
pop eax
mov eax, 2
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
.LS6:
mov eax, [ebp +0]
push eax
mov eax, [ebp +0]
dec eax
mov [ebp +0], eax
pop eax
test eax, eax
jz .LF6
push dword [ebp +0]
push s_19
call printf

add esp, 8

push eax
pop eax
jmp .LS6
.LF6:
push dword [ebp +0]
push s_20
call printf

add esp, 8

push eax
pop eax
mov eax, 6
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
.LS7:
mov eax, [ebp +0]
mov ecx, 2
sub eax, ecx
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
test eax, eax
jz .LF7
push dword [ebp +0]
push s_19
call printf

add esp, 8

push eax
pop eax
jmp .LS7
.LF7:
push dword [ebp +0]
push s_18
call printf

add esp, 8

push eax
pop eax
mov eax, 2
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_21
call printf

add esp, 8

push eax
pop eax
mov eax, [ebp +0]
mov ecx, 8
or eax, ecx
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_22
call printf

add esp, 8

push eax
pop eax
mov eax, 3
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
mov ecx, 2
shl eax, cl
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_23
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
mov ecx, 2
shr eax, cl
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_24
call printf

add esp, 8

push eax
pop eax
mov eax, 10
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
mov ecx, 7
sub eax, ecx
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_25
call printf

add esp, 8

push eax
pop eax
mov eax, 10
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
mov ecx, 10
add eax, ecx
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_26
call printf

add esp, 8

push eax
pop eax
mov eax, 10
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
mov ecx, 3
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_27
call printf

add esp, 8

push eax
pop eax
mov eax, 10
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
mov ecx, 3
xor edx, edx
idiv ecx
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_28
call printf

add esp, 8

push eax
pop eax
mov eax, 10
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
mov eax, [ebp +0]
mov ecx, 2
xor edx, edx
idiv ecx
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_29
call printf

add esp, 8

push eax
pop eax
push dword 10
push s_30
call printf

add esp, 8

push eax
pop eax
push dword 99
push s_31
call printf

add esp, 8

push eax
pop eax
push s_33
push s_32
call printf

add esp, 8

push eax
pop eax
mov eax, 3
mov ecx, 4
add eax, ecx
push eax

mov eax, 2
pop ecx
imul eax, ecx
push eax

pop eax
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_34
call printf

add esp, 8

push eax
pop eax
mov eax, 3
mov ecx, 4
add eax, ecx
push eax

mov eax, 2
pop ecx
imul eax, ecx
push eax

push dword [ebp +0]
push s_34
call printf

add esp, 8

push eax
pop eax
mov eax, 1
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
lea eax, [ebp +0]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_35
call printf

add esp, 8

push eax
pop eax
mov ebx, 1
lea eax, [ebp +0]
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_35
call printf

add esp, 8

push eax
pop eax
lea eax, [ebp +0]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_36
call printf

add esp, 8

push eax
pop eax
mov ebx, 1
lea eax, [ebp +0]
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_36
call printf

add esp, 8

push eax
pop eax
lea eax, [ebp +0]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_37
call printf

add esp, 8

push eax
pop eax
mov ebx, 2
lea eax, [ebp +0]
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_37
call printf

add esp, 8

push eax
pop eax
mov eax, 1
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
lea eax, [ebp +0]
mov ebx, [ebp +0]
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_36
call printf

add esp, 8

push eax
pop eax
mov ebx, [ebp +0]
lea eax, [ebp +0]
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_36
call printf

add esp, 8

push eax
pop eax
lea eax, e
mov ebx, 0
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
lea eax, [ebp +0]
pop ebx
imul ebx, 4
add ebx, eax
mov ebx, [ebx]
push ebx
push dword [ebp +0]
push s_36
call printf

add esp, 8

push eax
pop eax
push dword 3
push dword 2
call addition

add esp, 8

push eax
pop eax
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_38
call printf

add esp, 8

push eax
pop eax
push dword 3
push dword 2
call subtract

add esp, 8

push eax
pop eax
mov [ebp +0], eax

mov eax, [ebp +0]
push eax
pop eax
push dword [ebp +0]
push s_39
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 9
or eax, ecx
push eax

push dword [ebp +3184098950800106533]
push s_40
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 9
imul eax, ecx
push eax

push dword [ebp +3472592161607001376]
push s_41
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 9
and eax, ecx
push eax

push dword [ebp +2318280895740256868]
push s_42
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 9
cmp eax, ecx
sete al
movzx eax, al
push eax

push dword [ebp +3467820298569526306]
push s_43
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 12
cmp eax, ecx
sete al
movzx eax, al
push eax

push dword [ebp +3467820298569526306]
push s_44
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 11
cmp eax, ecx
setne al
movzx eax, al
push eax

push dword [ebp +3467820298569526306]
push s_45
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 12
cmp eax, ecx
setne al
movzx eax, al
push eax

push dword [ebp +2318280895740256868]
push s_46
call printf

add esp, 8

push eax
pop eax
mov eax, 1
mov ecx, 12
cmp eax, ecx
setl al
movzx eax, al
push eax

push dword [ebp +13546173041287212]
push s_47
call printf

add esp, 8

push eax
pop eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setl al
movzx eax, al
push eax

push dword [ebp +3467820298569526306]
push s_48
call printf

add esp, 8

push eax
pop eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setle al
movzx eax, al
push eax

push dword [ebp +2318280895740256868]
push s_49
call printf

add esp, 8

push eax
pop eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setg al
movzx eax, al
push eax

push dword [ebp +3467820298569526306]
push s_50
call printf

add esp, 8

push eax
pop eax
mov eax, 11
mov ecx, 12
cmp eax, ecx
setg al
movzx eax, al
push eax

push dword [ebp +3467820298569526306]
push s_51
call printf

add esp, 8

push eax
pop eax
mov eax, 11
mov ecx, 12
cmp eax, ecx
setge al
movzx eax, al
push eax

push dword [ebp +2318280895740256868]
push s_52
call printf

add esp, 8

push eax
pop eax
mov eax, 3
mov ecx, 2
shl eax, cl
push eax

push dword [ebp +3184098950800106533]
push s_53
call printf

add esp, 8

push eax
pop eax
mov eax, 12
mov ecx, 2
shr eax, cl
push eax

push dword [ebp +3184098950800106533]
push s_54
call printf

add esp, 8

push eax
pop eax
mov eax, 5
mov ecx, 3
sub eax, ecx
push eax

push dword [ebp +3467820298569526306]
push s_55
call printf

add esp, 8

push eax
pop eax
mov eax, 5
mov ecx, 3
add eax, ecx
push eax

push dword [ebp +3467820298569526306]
push s_56
call printf

add esp, 8

push eax
pop eax
mov eax, 2147483647
mov ecx, 2147483646
xor edx, edx
idiv ecx
mov eax, edx
push eax

push dword [ebp +0]
push s_57
call printf

add esp, 8

push eax
pop eax
mov eax, 2
mov ecx, 2
xor edx, edx
idiv ecx
push eax

push dword [ebp +3467820298569526306]
push s_58
call printf

add esp, 8

push eax
pop eax
jmp exit

.main.init:
sub esp, 52
jmp .start

addition:
push ebp
mov ebp, esp

jmp .addition.init
.start:
push dword [ebp +12]
push dword [ebp +8]
push s_59
call printf

add esp, 12

push eax
pop eax
.label:
mov eax, [ebp +8]
mov ecx, [ebp +12]
add eax, ecx
push eax

pop eax
jmp exit

.addition.init:
sub esp, 0
jmp .start

subtract:
push ebp
mov ebp, esp

jmp .subtract.init
.start:
mov eax, [ebp +8]
mov ecx, 1
add eax, ecx
push eax

mov eax, [ebp +12]
mov ecx, 1
add eax, ecx
push eax

pop ecx
pop eax
sub eax, ecx
push eax

pop eax
jmp exit

.subtract.init:
sub esp, 0
jmp .start

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
s_26 db "ASSIGN_PLUS", 10, "10 + 10", 10, "expect: 20, result %d", 10, 0
s_29 db "ASSIGN_DIVIDE", 10, "10 / 2", 10, "expect: 5, result: %d", 10, 0
s_37 db "expected: 3, %d", 10, 0
s_46 db "expected: 0, 12 != 12 %d", 10, 0
s_50 db "expected: 1, 14 > 12 %d", 10, 0
s_7 db "3 ---------", 10, 0
s_22 db "ASSIGN_OR", 10, "2 | 8", 10, "expect: 10, result: %d", 10, 0
s_56 db "expected: 8, 5 + 3 = %d", 10, 0
s_20 db "-1 expected: %d", 10, 0
s_58 db "expected: 1, 2 / 2 = %d", 10, 0
s_30 db "expected: 10, %d", 10, 0
s_8 db "%d %d", 10, 0
s_21 db "ASSIGN", 10, "expect: 2, result: %d", 10, 0
s_3 db "b: %d", 10, 0
s_15 db "else else else", 10, 0
s_13 db "braces work", 10, 0
s_36 db "expected: 2, %d", 10, 0
s_59 db "%d, %d", 10, 0
s_27 db "ASSIGN_MOD", 10, "10 %% 3", 10, "expect: 1, result %d", 10, 0
s_55 db "expected: 2, 5 - 3 = %d", 10, 0
s_2 db "%s", 10, 0
s_47 db "expected: 1, 1 < 12 %d", 10, 0
s_52 db "expected: 0, 11 >= 12 %d", 10, 0
s_17 db "1 expected: %d", 10, 0
s_51 db "expected: 0, 11 > 12 %d", 10, 0
s_6 db "123", 10, 0
s_44 db "expected: 1, 12 == 12%d", 10, 0
s_39 db "expected: -1, %d", 10, 0
s_14 db "no dangling else", 10, 0
s_23 db "ASSIGN_LSHIFT", 10, "3 << 2", 10, "expect: 12, result %d", 10, 0
s_0 db "hello", 0
s_19 db "b = %d", 10, 0
s_54 db "expected: 3, 12 >> 2 = %d", 10, 0
s_33 db "Hello world", 0
s_41 db "expected: 108, 12 * 9 = %d", 10, 0
s_48 db "expected: 0, 14 < 12 %d", 10, 0
s_42 db "expected: 8, 12 & 9 = %d", 10, 0
s_1 db "1 ---------", 10, 0
s_45 db "expected: 1, 12 != 11%d", 10, 0
s_38 db "expected: 5, %d", 10, 0
s_18 db "0 expected: %d", 10, 0
s_34 db "expected 14: %d", 10, 0
s_40 db "expected: 13, 12 | 9 = %d", 10, 0
s_49 db "expected: 0, 14 <= 12 %d", 10, 0
s_25 db "ASSIGN_MINUS", 10, "10 - 7", 10, "expect: 3, result %d", 10, 0
s_5 db "%c", 10, 0
s_9 db "4 ---------", 10, 0
s_12 db "5 ---------", 10, 0
s_32 db "expected: Hello world, %s", 10, 0
s_28 db "ASSIGN_DIVIDE", 10, "10 / 3", 10, "expect: 3, result: %d", 10, 0
s_10 db "loop start", 10, 0
s_4 db "2 ---------", 10, 0
s_24 db "ASSIGN_RSHIFT", 10, "12 >> 2", 10, "expect: 3, result %d", 10, 0
s_43 db "expected: 0, 12 == 9 %d", 10, 0
s_31 db "expected: c, %c", 10, 0
s_35 db "expected 2: %d", 10, 0
s_53 db "expected: 12, 3 << 2 = %d", 10, 0
s_57 db "expected: 1, 2147483647 %% 2147483646 %d", 10, 0
s_16 db "expect 2 b: %d", 10, 0
s_11 db "loop finish", 10, 0
