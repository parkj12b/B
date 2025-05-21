section .text
global main
main:
push ebp
mov ebp, esp

push s_1
call printf

add esp, 4

sub esp, 4
mov [ebp -4], eax
lea eax, e
mov ebx, 2
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -8], ebx
mov ebx, [ebp -8]
mov eax, [ebx]
push eax
push s_2
call printf

add esp, 8

sub esp, 4
mov [ebp -12], eax
push dword [b]
push s_3
call printf

add esp, 8

sub esp, 4
mov [ebp -16], eax
push s_4
call printf

add esp, 4

sub esp, 4
mov [ebp -20], eax
push 0

mov eax, 99
mov [ebp -24], eax

sub esp, 4
mov eax, [ebp -24]
mov [ebp -28], eax
push dword [ebp -24]
push s_5
call printf

add esp, 8

sub esp, 4
mov [ebp -32], eax
push s_6
call printf

add esp, 4

sub esp, 4
mov [ebp -36], eax
push s_7
call printf

add esp, 4

sub esp, 4
mov [ebp -40], eax
push 0
sub esp, 40
push 0

lea eax, [ebp -84]
mov ebx, 0
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -92], ebx
mov eax, 0
mov ebx, [ebp -92]
mov [ebx], eax

sub esp, 4
mov eax, [ebp -92]
mov eax, [eax]
mov [ebp -96], eax
lea eax, [ebp -84]
mov ebx, 7
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -100], ebx
mov eax, 7
mov ebx, [ebp -100]
mov [ebx], eax

sub esp, 4
mov eax, [ebp -100]
mov eax, [eax]
mov [ebp -104], eax
lea eax, [ebp -84]
mov ebx, 0
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -108], ebx
lea eax, [ebp -84]
mov ebx, 7
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -112], ebx
mov ebx, [ebp -112]
mov eax, [ebx]
push eax
mov ebx, [ebp -108]
mov eax, [ebx]
push eax
push s_8
call printf

add esp, 12

sub esp, 4
mov [ebp -116], eax
push s_9
call printf

add esp, 4

sub esp, 4
mov [ebp -120], eax
push s_10
call printf

add esp, 4

sub esp, 4
mov [ebp -124], eax
mov eax, 5
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -128], eax
push s_11
call printf

add esp, 4

sub esp, 4
mov [ebp -132], eax
push s_12
call printf

add esp, 4

sub esp, 4
mov [ebp -136], eax
mov eax, 1
test eax, eax
jz .LF1
push s_13
call printf

add esp, 4

sub esp, 4
mov [ebp -140], eax
.LF1:
mov eax, 1
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -144], eax
sub esp, 4
mov eax, dword [b]
mov [ebp -148], eax
mov eax, dword [b]
inc eax
mov dword [b], eax
mov eax, [ebp -148]
test eax, eax
jz .LF2
mov eax, 1
test eax, eax
jz .LF2
push s_14
call printf

add esp, 4

sub esp, 4
mov [ebp -152], eax
jmp .LE2
.LF2:
push s_15
call printf

add esp, 4

sub esp, 4
mov [ebp -156], eax
.LE2:
.LF3:
push dword [b]
push s_16
call printf

add esp, 8

sub esp, 4
mov [ebp -160], eax
mov eax, -5
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -164], eax
.LS4:
sub esp, 4
mov eax, dword [b]
mov [ebp -168], eax
mov eax, dword [b]
inc eax
mov dword [b], eax
mov eax, [ebp -168]
test eax, eax
jz .LF4
push dword [b]
push s_3
call printf

add esp, 8

sub esp, 4
mov [ebp -172], eax
jmp .LS4
.LF4:
push dword [b]
push s_17
call printf

add esp, 8

sub esp, 4
mov [ebp -176], eax
mov eax, 2
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -180], eax
push dword [b]
push s_18
call printf

add esp, 8

sub esp, 4
mov [ebp -184], eax
mov eax, dword [b]
or eax, 8
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -188], eax
push dword [b]
push s_19
call printf

add esp, 8

sub esp, 4
mov [ebp -192], eax
mov eax, 3
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -196], eax
mov eax, dword [b]
shl eax, 2
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -200], eax
push dword [b]
push s_20
call printf

add esp, 8

sub esp, 4
mov [ebp -204], eax
mov eax, 12
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -208], eax
mov eax, dword [b]
shr eax, 2
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -212], eax
push dword [b]
push s_21
call printf

add esp, 8

sub esp, 4
mov [ebp -216], eax
mov eax, 10
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -220], eax
mov eax, dword [b]
sub eax, 7
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -224], eax
push dword [b]
push s_22
call printf

add esp, 8

sub esp, 4
mov [ebp -228], eax
mov eax, 10
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -232], eax
mov eax, dword [b]
add eax, 10
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -236], eax
push dword [b]
push s_23
call printf

add esp, 8

sub esp, 4
mov [ebp -240], eax
mov eax, 10
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -244], eax
mov eax, dword [b]
xor edx, edx
mov ebx, 3

idiv ebx
mov eax, edx
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -248], eax
push dword [b]
push s_24
call printf

add esp, 8

sub esp, 4
mov [ebp -252], eax
mov eax, 10
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -256], eax
mov eax, dword [b]
xor edx, edx
mov ebx, 3

idiv ebx
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -260], eax
push dword [b]
push s_25
call printf

add esp, 8

sub esp, 4
mov [ebp -264], eax
mov eax, 10
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -268], eax
mov eax, dword [b]
xor edx, edx
mov ebx, 2

idiv ebx
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -272], eax
push dword [b]
push s_26
call printf

add esp, 8

sub esp, 4
mov [ebp -276], eax
push dword 10
push s_27
call printf

add esp, 8

sub esp, 4
mov [ebp -280], eax
push dword 99
push s_28
call printf

add esp, 8

sub esp, 4
mov [ebp -284], eax
push s_30
push s_29
call printf

add esp, 8

sub esp, 4
mov [ebp -288], eax
sub esp, 4
mov eax, 3
add eax, 4
mov [ebp -292], eax

sub esp, 4
mov eax, 2
mov ebx, [ebp -292]
imul eax, ebx
mov [ebp -296], eax

mov eax, [ebp -296]
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -300], eax
push dword [b]
push s_31
call printf

add esp, 8

sub esp, 4
mov [ebp -304], eax
sub esp, 4
mov eax, 3
add eax, 4
mov [ebp -308], eax

sub esp, 4
mov eax, 2
mov ebx, [ebp -308]
imul eax, ebx
mov [ebp -312], eax

push dword [ebp -312]
push s_31
call printf

add esp, 8

sub esp, 4
mov [ebp -316], eax
mov eax, 1
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -320], eax
lea eax, a
mov ebx, 1
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -324], ebx
mov ebx, [ebp -324]
mov eax, [ebx]
push eax
push s_32
call printf

add esp, 8

sub esp, 4
mov [ebp -328], eax
mov ebx, 1
lea eax, a
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -332], ebx
mov ebx, [ebp -332]
mov eax, [ebx]
push eax
push s_32
call printf

add esp, 8

sub esp, 4
mov [ebp -336], eax
lea eax, a
mov ebx, 1
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -340], ebx
mov ebx, [ebp -340]
mov eax, [ebx]
push eax
push s_33
call printf

add esp, 8

sub esp, 4
mov [ebp -344], eax
mov ebx, 1
lea eax, a
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -348], ebx
mov ebx, [ebp -348]
mov eax, [ebx]
push eax
push s_33
call printf

add esp, 8

sub esp, 4
mov [ebp -352], eax
lea eax, a
mov ebx, 2
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -356], ebx
mov ebx, [ebp -356]
mov eax, [ebx]
push eax
push s_34
call printf

add esp, 8

sub esp, 4
mov [ebp -360], eax
mov ebx, 2
lea eax, a
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -364], ebx
mov ebx, [ebp -364]
mov eax, [ebx]
push eax
push s_34
call printf

add esp, 8

sub esp, 4
mov [ebp -368], eax
mov eax, 1
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -372], eax
lea eax, a
mov ebx, dword [b]
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -376], ebx
mov ebx, [ebp -376]
mov eax, [ebx]
push eax
push s_33
call printf

add esp, 8

sub esp, 4
mov [ebp -380], eax
mov ebx, dword [b]
lea eax, a
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -384], ebx
mov ebx, [ebp -384]
mov eax, [ebx]
push eax
push s_33
call printf

add esp, 8

sub esp, 4
mov [ebp -388], eax
lea eax, e
mov ebx, 0
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -392], ebx
lea eax, a
mov ebx, [ebp -392]
mov ebx, [ebx]
imul ebx, 4
add ebx, eax
sub esp, 4
mov [ebp -396], ebx
mov ebx, [ebp -396]
mov eax, [ebx]
push eax
push s_33
call printf

add esp, 8

sub esp, 4
mov [ebp -400], eax
push dword 3
push dword 2
call addition

add esp, 8

sub esp, 4
mov [ebp -404], eax
mov eax, [ebp -404]
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -408], eax
push dword [b]
push s_35
call printf

add esp, 8

sub esp, 4
mov [ebp -412], eax
push dword 3
push dword 2
call subtract

add esp, 8

sub esp, 4
mov [ebp -416], eax
mov eax, [ebp -416]
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -420], eax
push dword [b]
push s_36
call printf

add esp, 8

sub esp, 4
mov [ebp -424], eax
sub esp, 4
mov eax, 12
or eax, 9
mov [ebp -428], eax

push dword [ebp -428]
push s_37
call printf

add esp, 8

sub esp, 4
mov [ebp -432], eax
sub esp, 4
mov eax, 12
imul eax, 9
mov [ebp -436], eax

push dword [ebp -436]
push s_38
call printf

add esp, 8

sub esp, 4
mov [ebp -440], eax
sub esp, 4
mov eax, 12
and eax, 9
mov [ebp -444], eax

push dword [ebp -444]
push s_39
call printf

add esp, 8

sub esp, 4
mov [ebp -448], eax
sub esp, 4
mov eax, 12
cmp eax, 9
sete al
movzx eax, al
mov [ebp -452], eax

push dword [ebp -452]
push s_40
call printf

add esp, 8

sub esp, 4
mov [ebp -456], eax
sub esp, 4
mov eax, 12
cmp eax, 12
sete al
movzx eax, al
mov [ebp -460], eax

push dword [ebp -460]
push s_41
call printf

add esp, 8

sub esp, 4
mov [ebp -464], eax
sub esp, 4
mov eax, 12
cmp eax, 11
setne al
movzx eax, al
mov [ebp -468], eax

push dword [ebp -468]
push s_42
call printf

add esp, 8

sub esp, 4
mov [ebp -472], eax
sub esp, 4
mov eax, 12
cmp eax, 12
setne al
movzx eax, al
mov [ebp -476], eax

push dword [ebp -476]
push s_43
call printf

add esp, 8

sub esp, 4
mov [ebp -480], eax
sub esp, 4
mov eax, 1
cmp eax, 12
setl al
movzx eax, al
mov [ebp -484], eax

push dword [ebp -484]
push s_44
call printf

add esp, 8

sub esp, 4
mov [ebp -488], eax
sub esp, 4
mov eax, 14
cmp eax, 12
setl al
movzx eax, al
mov [ebp -492], eax

push dword [ebp -492]
push s_45
call printf

add esp, 8

sub esp, 4
mov [ebp -496], eax
sub esp, 4
mov eax, 14
cmp eax, 12
setle al
movzx eax, al
mov [ebp -500], eax

push dword [ebp -500]
push s_46
call printf

add esp, 8

sub esp, 4
mov [ebp -504], eax
sub esp, 4
mov eax, 14
cmp eax, 12
setg al
movzx eax, al
mov [ebp -508], eax

push dword [ebp -508]
push s_47
call printf

add esp, 8

sub esp, 4
mov [ebp -512], eax
sub esp, 4
mov eax, 11
cmp eax, 12
setg al
movzx eax, al
mov [ebp -516], eax

push dword [ebp -516]
push s_48
call printf

add esp, 8

sub esp, 4
mov [ebp -520], eax
sub esp, 4
mov eax, 11
cmp eax, 12
setge al
movzx eax, al
mov [ebp -524], eax

push dword [ebp -524]
push s_49
call printf

add esp, 8

sub esp, 4
mov [ebp -528], eax
sub esp, 4
mov eax, 3
shl eax, 2
mov [ebp -532], eax

push dword [ebp -532]
push s_50
call printf

add esp, 8

sub esp, 4
mov [ebp -536], eax
sub esp, 4
mov eax, 12
shr eax, 2
mov [ebp -540], eax

push dword [ebp -540]
push s_51
call printf

add esp, 8

sub esp, 4
mov [ebp -544], eax
sub esp, 4
mov eax, 5
sub eax, 3
mov [ebp -548], eax

push dword [ebp -548]
push s_52
call printf

add esp, 8

sub esp, 4
mov [ebp -552], eax
sub esp, 4
mov eax, 5
add eax, 3
mov [ebp -556], eax

push dword [ebp -556]
push s_53
call printf

add esp, 8

sub esp, 4
mov [ebp -560], eax
sub esp, 4
mov eax, 2147483647
xor edx, edx
mov ebx, 2147483646

idiv ebx
mov eax, edx
mov [ebp -564], eax

push dword [ebp -564]
push s_54
call printf

add esp, 8

sub esp, 4
mov [ebp -568], eax
sub esp, 4
mov eax, 2
xor edx, edx
mov ebx, 2

idiv ebx
mov [ebp -572], eax

push dword [ebp -572]
push s_55
call printf

add esp, 8

sub esp, 4
mov [ebp -576], eax
jmp exit

addition:
push ebp
mov ebp, esp

.label:
sub esp, 4
mov eax, [ebp +8]
mov ebx, [ebp +12]
add eax, ebx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp exit

subtract:
push ebp
mov ebp, esp

sub esp, 4
mov eax, [ebp +8]
mov ebx, [ebp +12]
sub eax, ebx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp exit

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
s_23 db "ASSIGN_PLUS", 10, "10 + 10", 10, "expect: 20, result %d", 10, 0
s_26 db "ASSIGN_DIVIDE", 10, "10 / 2", 10, "expect: 5, result: %d", 10, 0
s_34 db "expected: 3, %d", 10, 0
s_43 db "expected: 0, 12 != 12 %d", 10, 0
s_47 db "expected: 1, 14 > 12 %d", 10, 0
s_7 db "3 ---------", 10, 0
s_19 db "ASSIGN_OR", 10, "2 | 8", 10, "expect: 10, result: %d", 10, 0
s_53 db "expected: 8, 5 + 3 = %d", 10, 0
s_55 db "expected: 1, 2 / 2 = %d", 10, 0
s_27 db "expected: 10, %d", 10, 0
s_8 db "%d %d", 10, 0
s_18 db "ASSIGN", 10, "expect: 2, result: %d", 10, 0
s_3 db "b: %d", 10, 0
s_15 db "else else else", 10, 0
s_13 db "braces work", 10, 0
s_33 db "expected: 2, %d", 10, 0
s_52 db "expected: 2, 5 - 3 = %d", 10, 0
s_2 db "%s", 10, 0
s_44 db "expected: 1, 1 < 12 %d", 10, 0
s_49 db "expected: 0, 11 >= 12 %d", 10, 0
s_17 db "1 expected: %d", 10, 0
s_48 db "expected: 0, 11 > 12 %d", 10, 0
s_6 db "123", 10, 0
s_41 db "expected: 1, 12 == 12%d", 10, 0
s_36 db "expected: -1, %d", 10, 0
s_14 db "no dangling else", 10, 0
s_20 db "ASSIGN_LSHIFT", 10, "3 << 2", 10, "expect: 12, result %d", 10, 0
s_54 db "expected: 1, 2147483647 % 2147483646 %d", 10, 0
s_0 db "hello", 0
s_51 db "expected: 3, 12 >> 2 = %d", 10, 0
s_30 db "Hello world", 0
s_38 db "expected: 108, 12 * 9 = %d", 10, 0
s_45 db "expected: 0, 14 < 12 %d", 10, 0
s_39 db "expected: 8, 12 & 9 = %d", 10, 0
s_1 db "1 ---------", 10, 0
s_42 db "expected: 1, 12 != 11%d", 10, 0
s_35 db "expected: 5, %d", 10, 0
s_31 db "expected 14: %d", 10, 0
s_37 db "expected: 13, 12 | 9 = %d", 10, 0
s_46 db "expected: 0, 14 <= 12 %d", 10, 0
s_22 db "ASSIGN_MINUS", 10, "10 - 7", 10, "expect: 3, result %d", 10, 0
s_5 db "%c", 10, 0
s_9 db "4 ---------", 10, 0
s_12 db "5 ---------", 10, 0
s_29 db "expected: Hello world, %s", 10, 0
s_25 db "ASSIGN_DIVIDE", 10, "10 / 3", 10, "expect: 3, result: %d", 10, 0
s_10 db "loop start", 10, 0
s_4 db "2 ---------", 10, 0
s_21 db "ASSIGN_RSHIFT", 10, "12 >> 2", 10, "expect: 3, result %d", 10, 0
s_40 db "expected: 0, 12 == 9 %d", 10, 0
s_28 db "expected: c, %c", 10, 0
s_32 db "expected 2: %d", 10, 0
s_50 db "expected: 12, 3 << 2 = %d", 10, 0
s_24 db "ASSIGN_MOD", 10, "10 % 3", 10, "expect: 1, result %d", 10, 0
s_16 db "expect 2 b: %d", 10, 0
s_11 db "loop finish", 10, 0
