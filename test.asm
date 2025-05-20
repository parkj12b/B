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
.loop:
sub esp, 4
mov eax, dword [b]
mov [ebp -132], eax
mov eax, dword [b]
dec eax
mov dword [b], eax
push dword [b]
push s_3
call printf

add esp, 8

sub esp, 4
mov [ebp -136], eax
sub esp, 4
mov eax, dword [b]
cmp eax, 0
setg al
movzx eax, al
mov [ebp -140], eax

mov eax, [ebp -140]
test eax, eax
jz .LF1
jmp .loop
.LF1:
push s_11
call printf

add esp, 4

sub esp, 4
mov [ebp -144], eax
push s_12
call printf

add esp, 4

sub esp, 4
mov [ebp -148], eax
mov eax, 1
test eax, eax
jz .LF2
push s_13
call printf

add esp, 4

sub esp, 4
mov [ebp -152], eax
.LF2:
mov eax, 1
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -156], eax
sub esp, 4
mov eax, dword [b]
mov [ebp -160], eax
mov eax, dword [b]
inc eax
mov dword [b], eax
test eax, eax
jz .LF3
mov eax, 1
test eax, eax
jz .LF3
push s_14
call printf

add esp, 4

sub esp, 4
mov [ebp -164], eax
jmp .LE3
.LF3:
push s_15
call printf

add esp, 4

sub esp, 4
mov [ebp -168], eax
.LE3:
.LF4:
push dword [b]
push s_16
call printf

add esp, 8

sub esp, 4
mov [ebp -172], eax
mov eax, -5
mov dword [b], eax

sub esp, 4
mov eax, dword [b]
mov [ebp -176], eax
.LS5:
sub esp, 4
mov eax, dword [b]
mov [ebp -180], eax
mov eax, dword [b]
inc eax
mov dword [b], eax
test eax, eax
jz .LF5
push dword [b]
push s_3
call printf

add esp, 8

sub esp, 4
mov [ebp -184], eax
jmp .LS5
.LF5:
push dword [b]
push s_17
call printf

add esp, 8

sub esp, 4
mov [ebp -188], eax
jmp exit

addition:
push ebp
mov ebp, esp

.label:
sub esp, 4
mov eax, [ebp +8]
mov ebx, dword [ebp +12]
add eax, ebx
mov [ebp -4], eax

mov eax, [ebp -4]
jmp exit

subtract:
push ebp
mov ebp, esp

sub esp, 4
mov eax, [ebp +8]
mov ebx, dword [ebp +12]
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
s_4 db "2 ---------", 10, 0
s_13 db "braces work", 10, 0
s_16 db "expect 2 b: %d", 10, 0
s_2 db "%s", 10, 0
s_7 db "3 ---------", 10, 0
s_1 db "1 ---------", 10, 0
s_17 db "1 expected: %d", 10, 0
s_8 db "%d %d", 10, 0
s_6 db "123", 10, 0
s_3 db "b: %d", 10, 0
s_5 db "%c", 10, 0
s_9 db "4 ---------", 10, 0
s_12 db "5 ---------", 10, 0
s_14 db "no dangling else", 10, 0
s_15 db "else else else", 10, 0
s_0 db "hello", 0
s_10 db "loop start", 10, 0
s_11 db "loop finish", 10, 0
