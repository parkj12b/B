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
lea eax, s_1
push eax
mov eax, dword ptr [printf]
call eax

<<<<<<< Updated upstream
add esp, 4

mov [ebp -4], eax
mov eax, dword ptr [e]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -4], ebx
mov eax, [ebp -4]
mov eax, [eax]
push eax
=======

lea eax, s_0
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax

mov eax, 0
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -20], eax
lea eax, s_1
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -20], eax
.LS0:
push dword ptr [ebp -12]
push dword ptr [ebp -8]
mov eax, dword ptr [char]
call eax

add esp, 8

mov [ebp -20], eax
mov eax, [ebp -20]
mov [ebp -16], eax

mov eax, [ebp -16]
mov [ebp -20], eax
mov eax, [ebp -20]
mov ecx, 0
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -20], eax

mov eax, [ebp -20]
test eax, eax
jz .LF0
push dword ptr [ebp -16]
>>>>>>> Stashed changes
lea eax, s_2
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

<<<<<<< Updated upstream
mov [ebp -4], eax
push dword ptr [b]
lea eax, s_3
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -4], eax
lea eax, s_4
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -4], eax

mov eax, 99
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr [ebp -4]
lea eax, s_5
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -8], eax
lea eax, s_6
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -8], eax
lea eax, s_7
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -8], eax
lea eax, [ebp -48]
mov [ebp -52], eax

mov eax, [ebp -52]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, 0
mov ebx, [ebp -60]
mov [ebx], eax

mov eax, [ebp -60]
mov eax, [eax]
mov [ebp -60], eax
mov eax, [ebp -52]
mov ebx, 7
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, 7
mov ebx, [ebp -60]
mov [ebx], eax

mov eax, [ebp -60]
mov eax, [eax]
mov [ebp -60], eax
mov eax, [ebp -52]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -52]
mov ebx, 7
imul ebx, 4
add ebx, eax
mov [ebp -64], ebx
mov eax, [ebp -64]
mov eax, [eax]
push eax
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_8
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -60], eax
mov eax, 0
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -60], eax
mov eax, [ebp -4]
mov ecx, eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
mov [ebp -60], ecx
mov eax, dword ptr [a]
mov ebx, [ebp -60]
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_9
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 1
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -60], eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
mov eax, dword ptr [a]
mov ebx, [ebp -4]
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_10
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
lea eax, s_11
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -60], eax
lea eax, s_12
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -60], eax
mov eax, 5
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
lea eax, s_13
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -60], eax
lea eax, s_14
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -60], eax
mov eax, 1
test eax, eax
jz .LF0
lea eax, s_15
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -60], eax
.LF0:
mov eax, 1
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [False]
test eax, eax
jz .LF1
mov eax, dword ptr [False]
test eax, eax
jz .LF2
push dword ptr [False]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -60], eax
jmp .LE2
.LF2:
push dword ptr [False]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -60], eax
.LE2:
.LF1:
push dword ptr [b]
lea eax, s_16
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, -5
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
.LS3:
mov eax, dword ptr [b]
mov ecx, eax
mov eax, dword ptr [b]
inc eax
mov dword ptr [b], eax
mov [ebp -60], ecx
mov eax, [ebp -60]
test eax, eax
jz .LF3
push dword ptr [b]
lea eax, s_3
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
jmp .LS3
.LF3:
push dword ptr [b]
lea eax, s_17
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, -2
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
.LS4:
mov eax, dword ptr [b]
inc eax
mov dword ptr [b], eax
mov eax, dword ptr [b]
test eax, eax
jz .LF4
push dword ptr [b]
lea eax, s_3
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
jmp .LS4
.LF4:
push dword ptr [b]
lea eax, s_18
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 2
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
.LS5:
mov eax, dword ptr [b]
dec eax
mov dword ptr [b], eax
mov eax, dword ptr [b]
test eax, eax
jz .LF5
push dword ptr [b]
lea eax, s_19
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
jmp .LS5
.LF5:
push dword ptr [b]
lea eax, s_18
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 2
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
.LS6:
mov eax, dword ptr [b]
mov ecx, eax
mov eax, dword ptr [b]
dec eax
mov dword ptr [b], eax
mov [ebp -60], ecx
mov eax, [ebp -60]
test eax, eax
jz .LF6
push dword ptr [b]
lea eax, s_19
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
jmp .LS6
.LF6:
push dword ptr [b]
lea eax, s_20
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 100
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
.LS7:
mov eax, dword ptr [b]
mov ecx, 2
sub eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, [ebp -60]
test eax, eax
jz .LF7
push dword ptr [b]
lea eax, s_19
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
jmp .LS7
.LF7:
push dword ptr [b]
lea eax, s_18
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 2
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_21
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 8
or eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_22
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 3
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 2
shl eax, cl
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_23
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 2
shr eax, cl
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_24
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 7
sub eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_25
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 10
add eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_26
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 3
xor edx, edx
idiv ecx
mov eax, edx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_27
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 3
xor edx, edx
idiv ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_28
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [b]
mov ecx, 2
xor edx, edx
idiv ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_29
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
push dword ptr 10
lea eax, s_30
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
push dword ptr 99
lea eax, s_31
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
lea eax, s_33
push eax
lea eax, s_32
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 3
mov ecx, 4
add eax, ecx
mov [ebp -60], eax

mov eax, 2
mov ecx, [ebp -60]
imul eax, ecx
mov [ebp -60], eax

mov eax, [ebp -60]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_34
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 3
mov ecx, 4
add eax, ecx
mov [ebp -60], eax

mov eax, 2
mov ecx, [ebp -60]
imul eax, ecx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_34
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 1
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [a]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_35
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov ebx, 1
mov eax, dword ptr [a]
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_35
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, dword ptr [a]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_36
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov ebx, 1
mov eax, dword ptr [a]
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_36
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, dword ptr [a]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_10
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov ebx, 2
mov eax, dword ptr [a]
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_10
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 1
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
mov eax, dword ptr [a]
mov ebx, dword ptr [b]
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_37
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, dword ptr [e]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_38
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, dword ptr [e]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, dword ptr [a]
mov ebx, [ebp -60]
mov ebx, [ebx]
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_36
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
push dword ptr 3
push dword ptr 2
mov eax, dword ptr [addition]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, [ebp -60]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_39
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
push dword ptr 3
push dword ptr 2
mov eax, dword ptr [subtract]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, [ebp -60]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -60], eax
push dword ptr [b]
lea eax, s_40
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 9
or eax, ecx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_41
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 9
imul eax, ecx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_42
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 9
and eax, ecx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_43
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 9
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_44
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 12
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_45
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 11
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_46
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 12
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_47
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 1
mov ecx, 12
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_48
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_49
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setle al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_50
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setg al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_51
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 11
mov ecx, 12
cmp eax, ecx
setg al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_52
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 11
mov ecx, 12
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_53
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 3
mov ecx, 2
shl eax, cl
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_54
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 12
mov ecx, 2
shr eax, cl
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_55
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 5
mov ecx, 3
sub eax, ecx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_56
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 5
mov ecx, 3
add eax, ecx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_57
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 2147483647
mov ecx, 2147483646
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_58
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, 2
mov ecx, 2
xor edx, edx
idiv ecx
mov [ebp -60], eax

push dword ptr [ebp -60]
lea eax, s_59
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
push dword ptr 1
mov eax, dword ptr [assert]
=======
mov [ebp -20], eax
mov eax, [ebp -12]
mov ecx, eax
mov eax, [ebp -12]
inc eax
mov [ebp -12], eax
mov [ebp -20], ecx
jmp .LS0
.LF0:
push dword ptr 10
mov eax, dword ptr [putchar]
>>>>>>> Stashed changes
call eax

add esp, 4

<<<<<<< Updated upstream
mov [ebp -60], eax
=======
mov [ebp -20], eax
lea eax, s_3
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -20], eax
lea eax, [ebp -4]
mov [ebp -20], eax
push dword ptr [ebp -20]
mov eax, dword ptr [time]
call eax

add esp, 4

mov [ebp -20], eax
push dword ptr [ebp -4]
lea eax, s_4
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -20], eax
lea eax, [ebp -216]
mov [ebp -220], eax

lea eax, s_5
push eax
mov eax, dword ptr [chdir]
call eax

add esp, 4

mov [ebp -224], eax
push dword ptr 50
push dword ptr [ebp -220]
mov eax, dword ptr [getcwd]
call eax

add esp, 8

mov [ebp -224], eax
push dword ptr [ebp -220]
lea eax, s_6
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -224], eax
push dword ptr 0
lea eax, s_7
push eax
mov eax, dword ptr [chown]
call eax

add esp, 8

mov [ebp -224], eax
>>>>>>> Stashed changes
pop ebx
jmp _exit

1:
<<<<<<< Updated upstream
sub esp, 64
jmp 2b

addition:
.long addition + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +12]
push dword ptr [ebp +8]
lea eax, s_60
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -4], eax
jmp [.label]
.label:
.long .label + 4
mov eax, [ebp +8]
mov ecx, [ebp +12]
add eax, ecx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

subtract:
.long subtract + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
mov eax, [ebp +8]
mov ecx, 1
add eax, ecx
mov [ebp -4], eax

mov eax, [ebp +12]
mov ecx, 1
add eax, ecx
mov [ebp -8], eax

mov eax, [ebp -4]
mov ecx, [ebp -8]
sub eax, ecx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 8
=======
sub esp, 224
>>>>>>> Stashed changes
jmp 2b

_exit:
leave
ret

<<<<<<< Updated upstream
.globl subtract
=======
.extern putchar
.extern time
.extern chdir
.extern chown
>>>>>>> Stashed changes
.globl main
.globl addition
.extern printf
<<<<<<< Updated upstream
.extern assert
.globl e
.globl c
.globl d
.globl b
.globl f
.globl k
.globl a
.bss
c: .zero 4
d_v: .zero 24
k_v: .zero 18085043209519168252

.data
e_v: .long 1, 2, s_0
.rept 2
.long 0
.endr
e: .long e_v
b: .long 1
f_v: .long 1, 2, 3, 4, 5
f: .long f_v
a_v: .long 1, 2, 3, 4, 5
a: .long a_v

d: .long d_v
k: .long k_v
.section .rodata
s_19: .string "b = %d\n"
s_56: .string "expected: 2, 5 - 3 = %d\n"
s_22: .string "ASSIGN_OR\n2 | 8\nexpect: 10, result: %d\n"
s_52: .string "expected: 0, 11 > 12 %d\n"
s_44: .string "expected: 0, 12 == 9 %d\n"
s_6: .string "123\n"
s_37: .string "a[b]: expected: 2, %d\n"
s_15: .string "braces work\n"
s_23: .string "ASSIGN_LSHIFT\n3 << 2\nexpect: 12, result %d\n"
s_36: .string "expected: 2, %d\n"
s_9: .string "expected: 1, %d\n"
s_57: .string "expected: 8, 5 + 3 = %d\n"
s_3: .string "b: %d\n"
s_27: .string "ASSIGN_MOD\n10 %% 3\nexpect: 1, result %d\n"
s_39: .string "expected: 5, %d\n"
s_21: .string "ASSIGN\nexpect: 2, result: %d\n"
s_47: .string "expected: 0, 12 != 12 %d\n"
s_8: .string "%d %d\n"
s_46: .string "expected: 1, 12 != 11%d\n"
s_18: .string "0 expected: %d\n"
s_26: .string "ASSIGN_PLUS\n10 + 10\nexpect: 20, result %d\n"
s_13: .string "loop finish\n"
s_1: .string "1 ---------\n"
s_54: .string "expected: 12, 3 << 2 = %d\n"
s_42: .string "expected: 108, 12 * 9 = %d\n"
s_49: .string "expected: 0, 14 < 12 %d\n"
s_59: .string "expected: 1, 2 / 2 = %d\n"
s_17: .string "1 expected: %d\n"
s_11: .string "4 ---------\n"
s_16: .string "expect 2 b: %d\n"
s_2: .string "%s\n"
s_24: .string "ASSIGN_RSHIFT\n12 >> 2\nexpect: 3, result %d\n"
s_48: .string "expected: 1, 1 < 12 %d\n"
s_55: .string "expected: 3, 12 >> 2 = %d\n"
s_4: .string "2 ---------\n"
s_5: .string "%c\n"
s_32: .string "expected: Hello world, %s\n"
s_14: .string "5 ---------\n"
s_29: .string "ASSIGN_DIVIDE\n10 / 2\nexpect: 5, result: %d\n"
s_30: .string "expected: 10, %d\n"
s_20: .string "-1 expected: %d\n"
s_25: .string "ASSIGN_MINUS\n10 - 7\nexpect: 3, result %d\n"
s_28: .string "ASSIGN_DIVIDE\n10 / 3\nexpect: 3, result: %d\n"
s_12: .string "loop start\n"
s_33: .string "Hello world"
s_7: .string "3 ---------\n"
s_38: .string "e[0], expected: 1, %d\n"
s_40: .string "expected: -1, %d\n"
s_34: .string "expected 14: %d\n"
s_41: .string "expected: 13, 12 | 9 = %d\n"
s_50: .string "expected: 0, 14 <= 12 %d\n"
s_0: .string "hello"
s_60: .string "%d, %d\n"
s_43: .string "expected: 8, 12 & 9 = %d\n"
s_53: .string "expected: 0, 11 >= 12 %d\n"
s_45: .string "expected: 1, 12 == 12%d\n"
s_31: .string "expected: c, %c\n"
s_35: .string "expected 2: %d\n"
s_58: .string "expected: 1, 2147483647 % 2147483646 %d\n"
s_10: .string "expected: 3, %d\n"
s_51: .string "expected: 1, 14 > 12 %d\n"
=======
.extern char
.extern getcwd
.section .rodata
s_7: .string "/root/B"
s_2: .string "%c"
s_6: .string "cwd: %s\n"
s_1: .string "\nchar() test\n"
s_5: .string "/"
s_4: .string "time(): %d\n"
s_3: .string "\ntime() test\n"
s_0: .string "hello world! :)"
>>>>>>> Stashed changes
