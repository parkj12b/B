.intel_syntax noprefix
.text
.globl main
main:
push ebp
mov ebp, esp

jmp 1f
2:
lea eax, [s_1]
push eax
call printf

add esp, 4

mov [ebp -4], eax
lea eax, e
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -4], ebx
mov eax, [ebp -4]
mov eax, [eax]
push eax
lea eax, [s_2]
push eax
call printf

add esp, 8

mov [ebp -8], eax
push dword ptr [b]
lea eax, [s_3]
push eax
call printf

add esp, 8

mov [ebp -8], eax
lea eax, [s_4]
push eax
call printf

add esp, 4

mov [ebp -8], eax

mov eax, 99
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax
push dword ptr [ebp -8]
lea eax, [s_5]
push eax
call printf

add esp, 8

mov [ebp -12], eax
lea eax, [s_6]
push eax
call printf

add esp, 4

mov [ebp -12], eax
lea eax, [s_7]
push eax
call printf

add esp, 4

mov [ebp -12], eax

lea eax, [ebp -52]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, 0
mov ebx, [ebp -60]
mov [ebx], eax

mov eax, [ebp -60]
mov eax, [eax]
mov [ebp -64], eax
lea eax, [ebp -52]
mov ebx, 7
imul ebx, 4
add ebx, eax
mov [ebp -64], ebx
mov eax, 7
mov ebx, [ebp -64]
mov [ebx], eax

mov eax, [ebp -64]
mov eax, [eax]
mov [ebp -68], eax
lea eax, [ebp -52]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -68], ebx
lea eax, [ebp -52]
mov ebx, 7
imul ebx, 4
add ebx, eax
mov [ebp -72], ebx
mov eax, [ebp -72]
mov eax, [eax]
push eax
mov eax, [ebp -68]
mov eax, [eax]
push eax
lea eax, [s_8]
push eax
call printf

add esp, 12

mov [ebp -76], eax
lea eax, [s_9]
push eax
call printf

add esp, 4

mov [ebp -76], eax
lea eax, [s_10]
push eax
call printf

add esp, 4

mov [ebp -76], eax
mov eax, 5
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -76], eax
lea eax, [s_11]
push eax
call printf

add esp, 4

mov [ebp -76], eax
lea eax, [s_12]
push eax
call printf

add esp, 4

mov [ebp -76], eax
mov eax, 1
test eax, eax
jz .LF0
lea eax, [s_13]
push eax
call printf

add esp, 4

mov [ebp -76], eax
.LF0:
mov eax, 1
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -76], eax
mov eax, dword ptr [b]
mov [ebp -76], eax
mov eax, dword ptr [b]
inc eax
mov dword ptr [b], eax
mov eax, [ebp -76]
test eax, eax
jz .LF1
mov eax, 1
test eax, eax
jz .LF2
lea eax, [s_14]
push eax
call printf

add esp, 4

mov [ebp -80], eax
jmp .LE2
.LF2:
lea eax, [s_15]
push eax
call printf

add esp, 4

mov [ebp -80], eax
.LE2:
.LF1:
push dword ptr [b]
lea eax, [s_16]
push eax
call printf

add esp, 8

mov [ebp -80], eax
mov eax, 5
neg eax
mov [ebp -80], eax
mov eax, [ebp -80]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -84], eax
.LS3:
mov eax, dword ptr [b]
mov [ebp -84], eax
mov eax, dword ptr [b]
inc eax
mov dword ptr [b], eax
mov eax, [ebp -84]
test eax, eax
jz .LF3
push dword ptr [b]
lea eax, [s_3]
push eax
call printf

add esp, 8

mov [ebp -88], eax
jmp .LS3
.LF3:
push dword ptr [b]
lea eax, [s_17]
push eax
call printf

add esp, 8

mov [ebp -88], eax
mov eax, 2
neg eax
mov [ebp -88], eax
mov eax, [ebp -88]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -92], eax
.LS4:
mov eax, dword ptr [b]
inc eax
mov dword ptr [b], eax
mov dword ptr [b], eax
mov eax, dword ptr [b]
test eax, eax
jz .LF4
push dword ptr [b]
lea eax, [s_3]
push eax
call printf

add esp, 8

mov [ebp -92], eax
jmp .LS4
.LF4:
push dword ptr [b]
lea eax, [s_18]
push eax
call printf

add esp, 8

mov [ebp -92], eax
mov eax, 2
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -92], eax
.LS5:
mov eax, dword ptr [b]
dec eax
mov dword ptr [b], eax
mov dword ptr [b], eax
mov eax, dword ptr [b]
test eax, eax
jz .LF5
push dword ptr [b]
lea eax, [s_19]
push eax
call printf

add esp, 8

mov [ebp -92], eax
jmp .LS5
.LF5:
push dword ptr [b]
lea eax, [s_18]
push eax
call printf

add esp, 8

mov [ebp -92], eax
mov eax, 2
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -92], eax
.LS6:
mov eax, dword ptr [b]
mov [ebp -92], eax
mov eax, dword ptr [b]
dec eax
mov dword ptr [b], eax
mov eax, [ebp -92]
test eax, eax
jz .LF6
push dword ptr [b]
lea eax, [s_19]
push eax
call printf

add esp, 8

mov [ebp -96], eax
jmp .LS6
.LF6:
push dword ptr [b]
lea eax, [s_20]
push eax
call printf

add esp, 8

mov [ebp -96], eax
mov eax, 100
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -96], eax
.LS7:
mov eax, dword ptr [b]
mov ecx, 2
sub eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -96], eax
mov eax, [ebp -96]
test eax, eax
jz .LF7
push dword ptr [b]
lea eax, [s_19]
push eax
call printf

add esp, 8

mov [ebp -100], eax
jmp .LS7
.LF7:
push dword ptr [b]
lea eax, [s_18]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 2
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_21]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 8
or eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_22]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 3
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 2
shl eax, cl
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_23]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 12
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 2
shr eax, cl
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_24]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 7
sub eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_25]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 10
add eax, ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_26]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 3
xor edx, edx
idiv ecx
mov eax, edx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_27]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 3
xor edx, edx
idiv ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_28]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 10
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
mov eax, dword ptr [b]
mov ecx, 2
xor edx, edx
idiv ecx
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -100], eax
push dword ptr [b]
lea eax, [s_29]
push eax
call printf

add esp, 8

mov [ebp -100], eax
push dword ptr 10
lea eax, [s_30]
push eax
call printf

add esp, 8

mov [ebp -100], eax
push dword ptr 99
lea eax, [s_31]
push eax
call printf

add esp, 8

mov [ebp -100], eax
lea eax, [s_33]
push eax
lea eax, [s_32]
push eax
call printf

add esp, 8

mov [ebp -100], eax
mov eax, 3
mov ecx, 4
add eax, ecx
mov [ebp -100], eax

mov eax, 2
mov ecx, [ebp -100]
imul eax, ecx
mov [ebp -104], eax

mov eax, [ebp -104]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -108], eax
push dword ptr [b]
lea eax, [s_34]
push eax
call printf

add esp, 8

mov [ebp -108], eax
mov eax, 3
mov ecx, 4
add eax, ecx
mov [ebp -108], eax

mov eax, 2
mov ecx, [ebp -108]
imul eax, ecx
mov [ebp -112], eax

push dword ptr [ebp -112]
lea eax, [s_34]
push eax
call printf

add esp, 8

mov [ebp -116], eax
mov eax, 1
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -116], eax
lea eax, a
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -116], ebx
mov eax, [ebp -116]
mov eax, [eax]
push eax
lea eax, [s_35]
push eax
call printf

add esp, 8

mov [ebp -120], eax
mov ebx, 1
lea eax, a
imul ebx, 4
add ebx, eax
mov [ebp -120], ebx
mov eax, [ebp -120]
mov eax, [eax]
push eax
lea eax, [s_35]
push eax
call printf

add esp, 8

mov [ebp -124], eax
lea eax, a
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -124], ebx
mov eax, [ebp -124]
mov eax, [eax]
push eax
lea eax, [s_36]
push eax
call printf

add esp, 8

mov [ebp -128], eax
mov ebx, 1
lea eax, a
imul ebx, 4
add ebx, eax
mov [ebp -128], ebx
mov eax, [ebp -128]
mov eax, [eax]
push eax
lea eax, [s_36]
push eax
call printf

add esp, 8

mov [ebp -132], eax
lea eax, a
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -132], ebx
mov eax, [ebp -132]
mov eax, [eax]
push eax
lea eax, [s_37]
push eax
call printf

add esp, 8

mov [ebp -136], eax
mov ebx, 2
lea eax, a
imul ebx, 4
add ebx, eax
mov [ebp -136], ebx
mov eax, [ebp -136]
mov eax, [eax]
push eax
lea eax, [s_37]
push eax
call printf

add esp, 8

mov [ebp -140], eax
mov eax, 1
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -140], eax
lea eax, a
mov ebx, dword ptr [b]
imul ebx, 4
add ebx, eax
mov [ebp -140], ebx
mov eax, [ebp -140]
mov eax, [eax]
push eax
lea eax, [s_36]
push eax
call printf

add esp, 8

mov [ebp -144], eax
mov ebx, dword ptr [b]
lea eax, a
imul ebx, 4
add ebx, eax
mov [ebp -144], ebx
mov eax, [ebp -144]
mov eax, [eax]
push eax
lea eax, [s_36]
push eax
call printf

add esp, 8

mov [ebp -148], eax
lea eax, e
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -148], ebx
mov eax, [ebp -148]
mov eax, [eax]
push eax
lea eax, [s_38]
push eax
call printf

add esp, 8

mov [ebp -152], eax
lea eax, e
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -152], ebx
lea eax, a
mov ebx, [ebp -152]
mov ebx, [ebx]
imul ebx, 4
add ebx, eax
mov [ebp -156], ebx
mov eax, [ebp -156]
mov eax, [eax]
push eax
lea eax, [s_36]
push eax
call printf

add esp, 8

mov [ebp -160], eax
push dword ptr 3
push dword ptr 2
call addition

add esp, 8

mov [ebp -160], eax
mov eax, [ebp -160]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -164], eax
push dword ptr [b]
lea eax, [s_39]
push eax
call printf

add esp, 8

mov [ebp -164], eax
push dword ptr 3
push dword ptr 2
call subtract

add esp, 8

mov [ebp -164], eax
mov eax, [ebp -164]
mov dword ptr [b], eax

mov eax, dword ptr [b]
mov [ebp -168], eax
push dword ptr [b]
lea eax, [s_40]
push eax
call printf

add esp, 8

mov [ebp -168], eax
mov eax, 12
mov ecx, 9
or eax, ecx
mov [ebp -168], eax

push dword ptr [ebp -168]
lea eax, [s_41]
push eax
call printf

add esp, 8

mov [ebp -172], eax
mov eax, 12
mov ecx, 9
imul eax, ecx
mov [ebp -172], eax

push dword ptr [ebp -172]
lea eax, [s_42]
push eax
call printf

add esp, 8

mov [ebp -176], eax
mov eax, 12
mov ecx, 9
and eax, ecx
mov [ebp -176], eax

push dword ptr [ebp -176]
lea eax, [s_43]
push eax
call printf

add esp, 8

mov [ebp -180], eax
mov eax, 12
mov ecx, 9
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -180], eax

push dword ptr [ebp -180]
lea eax, [s_44]
push eax
call printf

add esp, 8

mov [ebp -184], eax
mov eax, 12
mov ecx, 12
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -184], eax

push dword ptr [ebp -184]
lea eax, [s_45]
push eax
call printf

add esp, 8

mov [ebp -188], eax
mov eax, 12
mov ecx, 11
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -188], eax

push dword ptr [ebp -188]
lea eax, [s_46]
push eax
call printf

add esp, 8

mov [ebp -192], eax
mov eax, 12
mov ecx, 12
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -192], eax

push dword ptr [ebp -192]
lea eax, [s_47]
push eax
call printf

add esp, 8

mov [ebp -196], eax
mov eax, 1
mov ecx, 12
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -196], eax

push dword ptr [ebp -196]
lea eax, [s_48]
push eax
call printf

add esp, 8

mov [ebp -200], eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -200], eax

push dword ptr [ebp -200]
lea eax, [s_49]
push eax
call printf

add esp, 8

mov [ebp -204], eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setle al
movzx eax, al
mov [ebp -204], eax

push dword ptr [ebp -204]
lea eax, [s_50]
push eax
call printf

add esp, 8

mov [ebp -208], eax
mov eax, 14
mov ecx, 12
cmp eax, ecx
setg al
movzx eax, al
mov [ebp -208], eax

push dword ptr [ebp -208]
lea eax, [s_51]
push eax
call printf

add esp, 8

mov [ebp -212], eax
mov eax, 11
mov ecx, 12
cmp eax, ecx
setg al
movzx eax, al
mov [ebp -212], eax

push dword ptr [ebp -212]
lea eax, [s_52]
push eax
call printf

add esp, 8

mov [ebp -216], eax
mov eax, 11
mov ecx, 12
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -216], eax

push dword ptr [ebp -216]
lea eax, [s_53]
push eax
call printf

add esp, 8

mov [ebp -220], eax
mov eax, 3
mov ecx, 2
shl eax, cl
mov [ebp -220], eax

push dword ptr [ebp -220]
lea eax, [s_54]
push eax
call printf

add esp, 8

mov [ebp -224], eax
mov eax, 12
mov ecx, 2
shr eax, cl
mov [ebp -224], eax

push dword ptr [ebp -224]
lea eax, [s_55]
push eax
call printf

add esp, 8

mov [ebp -228], eax
mov eax, 5
mov ecx, 3
sub eax, ecx
mov [ebp -228], eax

push dword ptr [ebp -228]
lea eax, [s_56]
push eax
call printf

add esp, 8

mov [ebp -232], eax
mov eax, 5
mov ecx, 3
add eax, ecx
mov [ebp -232], eax

push dword ptr [ebp -232]
lea eax, [s_57]
push eax
call printf

add esp, 8

mov [ebp -236], eax
mov eax, 2147483647
mov ecx, 2147483646
xor edx, edx
idiv ecx
mov eax, edx
mov [ebp -236], eax

push dword ptr [ebp -236]
lea eax, [s_58]
push eax
call printf

add esp, 8

mov [ebp -240], eax
mov eax, 2
mov ecx, 2
xor edx, edx
idiv ecx
mov [ebp -240], eax

push dword ptr [ebp -240]
lea eax, [s_59]
push eax
call printf

add esp, 8

mov [ebp -244], eax
jmp exit

1:
sub esp, 244
jmp 2b

addition:
push ebp
mov ebp, esp

jmp 1f
2:
push dword ptr [ebp +12]
push dword ptr [ebp +8]
lea eax, [s_60]
push eax
call printf

add esp, 12

mov [ebp -4], eax
.label:
mov eax, [ebp +8]
mov ecx, [ebp +12]
add eax, ecx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp exit

1:
sub esp, 4
jmp 2b

subtract:
push ebp
mov ebp, esp

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
mov [ebp -12], eax

mov eax, [ebp -12]
jmp exit

1:
sub esp, 12
jmp 2b

exit:
leave
ret

.extern printf
.bss
c: .zero 1
d: .zero 5

.data
e: .long 1, 2, s_0
.rept 2
.long 0
.endr
b: .long 1
f: .long 1, 2, 3, 4, 5
a: .long 1, 2, 3, 4, 5

.section .rodata
s_19: .string "b = %d\n"
s_56: .string "expected: 2, 5 - 3 = %d\n"
s_22: .string "ASSIGN_OR\n2 | 8\nexpect: 10, result: %d\n"
s_52: .string "expected: 0, 11 > 12 %d\n"
s_44: .string "expected: 0, 12 == 9 %d\n"
s_6: .string "123\n"
s_13: .string "braces work\n"
s_23: .string "ASSIGN_LSHIFT\n3 << 2\nexpect: 12, result %d\n"
s_36: .string "expected: 2, %d\n"
s_57: .string "expected: 8, 5 + 3 = %d\n"
s_3: .string "b: %d\n"
s_27: .string "ASSIGN_MOD\n10 %% 3\nexpect: 1, result %d\n"
s_39: .string "expected: 5, %d\n"
s_21: .string "ASSIGN\nexpect: 2, result: %d\n"
s_15: .string "else else else\n"
s_47: .string "expected: 0, 12 != 12 %d\n"
s_8: .string "%d %d\n"
s_46: .string "expected: 1, 12 != 11%d\n"
s_18: .string "0 expected: %d\n"
s_26: .string "ASSIGN_PLUS\n10 + 10\nexpect: 20, result %d\n"
s_11: .string "loop finish\n"
s_1: .string "1 ---------\n"
s_54: .string "expected: 12, 3 << 2 = %d\n"
s_42: .string "expected: 108, 12 * 9 = %d\n"
s_49: .string "expected: 0, 14 < 12 %d\n"
s_59: .string "expected: 1, 2 / 2 = %d\n"
s_17: .string "1 expected: %d\n"
s_9: .string "4 ---------\n"
s_16: .string "expect 2 b: %d\n"
s_2: .string "%s\n"
s_24: .string "ASSIGN_RSHIFT\n12 >> 2\nexpect: 3, result %d\n"
s_48: .string "expected: 1, 1 < 12 %d\n"
s_55: .string "expected: 3, 12 >> 2 = %d\n"
s_58: .string "expected: 1, 2147483647 %% 2147483646 %d\n"
s_4: .string "2 ---------\n"
s_5: .string "%c\n"
s_32: .string "expected: Hello world, %s\n"
s_12: .string "5 ---------\n"
s_29: .string "ASSIGN_DIVIDE\n10 / 2\nexpect: 5, result: %d\n"
s_30: .string "expected: 10, %d\n"
s_20: .string "-1 expected: %d\n"
s_25: .string "ASSIGN_MINUS\n10 - 7\nexpect: 3, result %d\n"
s_28: .string "ASSIGN_DIVIDE\n10 / 3\nexpect: 3, result: %d\n"
s_10: .string "loop start\n"
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
s_14: .string "no dangling else\n"
s_35: .string "expected 2: %d\n"
s_37: .string "expected: 3, %d\n"
s_51: .string "expected: 1, 14 > 12 %d\n"
