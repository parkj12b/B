.intel_syntax noprefix
.text
.globl main
test_printf:
.long test_printf + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, s_5
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -4], eax
push dword ptr 83
push dword ptr 83
lea eax, s_6
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -4], eax
mov eax, 83
neg eax
mov [ebp -4], eax
mov eax, 83
neg eax
mov [ebp -8], eax
push dword ptr [ebp -8]
push dword ptr [ebp -4]
lea eax, s_6
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 8
jmp 2b

test_char:
.long test_char + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, s_7
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -4], eax

lea eax, s_8
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax

mov eax, 0
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -16], eax
.LS0:
push dword ptr [ebp -8]
push dword ptr [ebp -4]
mov eax, dword ptr [char]
call eax

add esp, 8

mov [ebp -16], eax
mov eax, [ebp -16]
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -16], eax
mov eax, [ebp -16]
mov ecx, 0
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -16], eax

mov eax, [ebp -16]
test eax, eax
jz .LE0
push dword ptr [ebp -12]
lea eax, s_9
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -16], eax
mov eax, [ebp -8]
mov ecx, eax
mov eax, [ebp -8]
inc eax
mov [ebp -8], eax
mov [ebp -16], ecx
jmp .LS0
.LE0:
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -16], eax
pop ebx
jmp _exit

1:
sub esp, 16
jmp 2b

test_time:
.long test_time + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, s_10
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -4], eax

lea eax, [ebp -4]
mov [ebp -8], eax
push dword ptr [ebp -8]
mov eax, dword ptr [time]
call eax

add esp, 4

mov [ebp -8], eax
push dword ptr [ebp -4]
lea eax, s_11
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -8], eax
pop ebx
jmp _exit

1:
sub esp, 8
jmp 2b

test_chdir:
.long test_chdir + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, [ebp -200]
mov [ebp -204], eax
lea eax, [ebp -404]
mov [ebp -408], eax

lea eax, s_12
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -412], eax
push dword ptr 50
push dword ptr [ebp -408]
mov eax, dword ptr [getcwd]
call eax

add esp, 8

mov [ebp -412], eax
push dword ptr [ebp -408]
lea eax, s_13
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -412], eax
lea eax, s_14
push eax
mov eax, dword ptr [chdir]
call eax

add esp, 4

mov [ebp -412], eax
push dword ptr 50
push dword ptr [ebp -204]
mov eax, dword ptr [getcwd]
call eax

add esp, 8

mov [ebp -412], eax
push dword ptr [ebp -204]
lea eax, s_15
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -412], eax
push dword ptr [ebp -408]
mov eax, dword ptr [chdir]
call eax

add esp, 4

mov [ebp -412], eax
pop ebx
jmp _exit

1:
sub esp, 412
jmp 2b

test_chown:
.long test_chown + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_16
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -8], eax
push dword ptr 1002
lea eax, s_17
push eax
mov eax, dword ptr [chown]
call eax

add esp, 8

mov [ebp -8], eax
mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr [ebp -4]
lea eax, s_18
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -8], eax
mov eax, [ebp -4]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -8], eax

push dword ptr [ebp -8]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -8], eax
push dword ptr 0
lea eax, s_4
push eax
lea eax, s_3
push eax
lea eax, s_19
push eax
mov eax, dword ptr [execl]
call eax

add esp, 16

mov [ebp -8], eax
mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr 0
lea eax, s_20
push eax
mov eax, dword ptr [chown]
call eax

add esp, 8

mov [ebp -8], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -8], eax
pop ebx
jmp _exit

1:
sub esp, 8
jmp 2b

test_file_operations:
.long test_file_operations + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_21
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -12], eax
lea eax, s_22
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -12], eax
push dword ptr 420
lea eax, s_23
push eax
mov eax, dword ptr [creat]
call eax

add esp, 8

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax
push dword ptr [ebp -8]
lea eax, s_24
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -12], eax
push dword ptr 438
lea eax, s_23
push eax
mov eax, dword ptr [open]
call eax

add esp, 8

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -12], eax
push dword ptr [ebp -4]
lea eax, s_25
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -12], eax
mov eax, [ebp -4]
mov ecx, 0
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -12], eax

push dword ptr [ebp -12]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -12], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -12], eax
lea eax, s_26
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -12], eax
push dword ptr 18
lea eax, s_27
push eax
push dword ptr [ebp -4]
mov eax, dword ptr [write]
call eax

add esp, 12

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax
push dword ptr [ebp -8]
lea eax, s_28
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -12], eax
mov eax, [ebp -8]
mov ecx, 0
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -12], eax

push dword ptr [ebp -12]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -12], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -12], eax
push dword ptr [ebp -4]
mov eax, dword ptr [close]
call eax

add esp, 4

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax
mov eax, [ebp -8]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -12], eax

push dword ptr [ebp -12]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -12], eax
lea eax, s_29
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -12], eax
lea eax, s_23
push eax
mov eax, dword ptr [unlink]
call eax

add esp, 4

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax
mov eax, [ebp -8]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -12], eax

push dword ptr [ebp -12]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -12], eax
pop ebx
jmp _exit

1:
sub esp, 12
jmp 2b

test_execl:
.long test_execl + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_30
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -8], eax
push dword ptr 0
lea eax, s_4
push eax
lea eax, s_3
push eax
lea eax, s_19
push eax
mov eax, dword ptr [execl]
call eax

add esp, 16

mov [ebp -8], eax
mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr [ebp -4]
lea eax, s_31
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -8], eax
pop ebx
jmp _exit

1:
sub esp, 8
jmp 2b

test_execv:
.long test_execv + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_32
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -8], eax
push dword ptr 2
push dword ptr [execv_args]
lea eax, s_19
push eax
mov eax, dword ptr [execv]
call eax

add esp, 12

mov [ebp -8], eax
mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr [ebp -4]
lea eax, s_33
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -8], eax
pop ebx
jmp _exit

1:
sub esp, 8
jmp 2b

test_exec:
.long test_exec + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, s_34
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -4], eax
mov eax, dword ptr [test_execl]
call eax

mov [ebp -4], eax
mov eax, dword ptr [test_execv]
call eax

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

test_fork:
.long test_fork + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_35
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -12], eax
mov eax, dword ptr [fork]
call eax

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -12], eax
mov eax, [ebp -4]
mov ecx, 0
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -12], eax

push dword ptr [ebp -12]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -12], eax
mov eax, [ebp -4]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -12], eax

mov eax, [ebp -12]
test eax, eax
jz .LF1
mov eax, dword ptr [getpid]
call eax

mov [ebp -12], eax
push dword ptr [ebp -12]
lea eax, s_36
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -12], eax
push dword ptr 2
push dword ptr [execv_args]
lea eax, s_19
push eax
mov eax, dword ptr [execv]
call eax

add esp, 12

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax
lea eax, s_37
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -12], eax
push dword ptr [ebp -8]
mov eax, dword ptr [exit]
call eax

add esp, 4

mov [ebp -12], eax
jmp .LE1
.LF1:
mov eax, dword ptr [getpid]
call eax

mov [ebp -12], eax
push dword ptr [ebp -12]
lea eax, s_38
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -12], eax
push dword ptr [ebp -4]
lea eax, s_39
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -12], eax
lea eax, [ebp -8]
mov [ebp -12], eax
push dword ptr [ebp -12]
mov eax, dword ptr [wait]
call eax

add esp, 4

mov [ebp -12], eax
mov eax, [ebp -12]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -12], eax
push dword ptr [ebp -8]
push dword ptr [ebp -4]
lea eax, s_40
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -12], eax
.LE1:
pop ebx
jmp _exit

1:
sub esp, 12
jmp 2b

test_fstat:
.long test_fstat + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, [ebp -84]
mov [ebp -88], eax

lea eax, s_41
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -92], eax
push dword ptr 420
lea eax, s_42
push eax
mov eax, dword ptr [creat]
call eax

add esp, 8

mov [ebp -92], eax
mov eax, [ebp -92]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -92], eax
mov eax, [ebp -4]
mov ecx, 0
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -92], eax

push dword ptr [ebp -92]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -92], eax
push dword ptr [ebp -88]
push dword ptr [ebp -4]
mov eax, dword ptr [fstat]
call eax

add esp, 8

mov [ebp -92], eax
mov eax, [ebp -88]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -92], ebx
mov eax, [ebp -92]
mov eax, [eax]
push eax
lea eax, s_43
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -92], eax
mov eax, [ebp -88]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -92], ebx
mov eax, [ebp -92]
mov eax, [eax]
mov ecx, 511
and eax, ecx
mov [ebp -92], eax

push dword ptr [ebp -92]
lea eax, s_44
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -92], eax
mov eax, [ebp -88]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -92], ebx
mov eax, [ebp -92]
mov eax, [eax]
mov ecx, 511
and eax, ecx
mov [ebp -92], eax

mov eax, [ebp -92]
mov ecx, 420
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -92], eax

push dword ptr [ebp -92]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -92], eax
pop ebx
jmp _exit

1:
sub esp, 92
jmp 2b

test_getchar:
.long test_getchar + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_45
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -8], eax
mov eax, dword ptr [getchar]
call eax

add esp, 8

mov [ebp -8], eax
mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
.LS2:
mov eax, [ebp -4]
mov ecx, -1
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -8], eax

mov eax, [ebp -8]
test eax, eax
jz .LE2
push dword ptr [ebp -4]
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -8], eax
mov eax, dword ptr [getchar]
call eax

mov [ebp -8], eax
mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
jmp .LS2
.LE2:
pop ebx
jmp _exit

1:
sub esp, 8
jmp 2b

test_getuid:
.long test_getuid + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_46
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -8], eax
mov eax, dword ptr [getuid]
call eax

add esp, 8

mov [ebp -8], eax
mov eax, [ebp -8]
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -8], eax
push dword ptr [ebp -4]
lea eax, s_47
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -8], eax
pop ebx
jmp _exit

1:
sub esp, 8
jmp 2b

test_gtty:
.long test_gtty + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, [ebp -48]
mov [ebp -52], eax

lea eax, s_48
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -56], eax
push dword ptr [ebp -52]
push dword ptr 0
mov eax, dword ptr [gtty]
call eax

add esp, 8

mov [ebp -56], eax
mov eax, [ebp -56]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -56], eax

push dword ptr [ebp -56]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -56], eax
lea eax, s_49
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -56], eax
mov eax, [ebp -52]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -56], ebx
mov eax, [ebp -56]
mov eax, [eax]
push eax
lea eax, s_50
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -56], eax
mov eax, [ebp -52]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -56], ebx
mov eax, [ebp -56]
mov eax, [eax]
push eax
lea eax, s_51
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -56], eax
mov eax, [ebp -52]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -56], ebx
mov eax, [ebp -56]
mov eax, [eax]
push eax
lea eax, s_52
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -56], eax

push dword ptr [O_RDWR]
lea eax, s_53
push eax
mov eax, dword ptr [open]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, [ebp -60]
mov [ebp -56], eax

mov eax, [ebp -56]
mov [ebp -60], eax
mov eax, [ebp -56]
mov ecx, 0
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -60], eax

push dword ptr [ebp -60]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -60], eax
push dword ptr [ebp -52]
push dword ptr [ebp -56]
mov eax, dword ptr [gtty]
call eax

add esp, 8

mov [ebp -60], eax
lea eax, s_54
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, [ebp -52]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_50
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, [ebp -52]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_51
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
mov eax, [ebp -52]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -60], ebx
mov eax, [ebp -60]
mov eax, [eax]
push eax
lea eax, s_52
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -60], eax
pop ebx
jmp _exit

1:
sub esp, 60
jmp 2b

test_runner:
.long test_runner + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:

lea eax, s_55
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -12], eax
mov eax, 0
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -12], eax
mov eax, [ebp +8]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax
.LS3:
lea eax, [ebp +8]
mov [ebp -12], eax
mov eax, [ebp -4]
mov ecx, 4
imul eax, ecx
mov [ebp -16], eax

mov eax, [ebp -12]
mov ecx, [ebp -16]
add eax, ecx
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -12], eax
mov eax, [ebp -12]
mov eax, [eax]
mov ecx, 0
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -12], eax

mov eax, [ebp -12]
test eax, eax
jz .LE3
lea eax, [ebp +8]
mov [ebp -12], eax
mov eax, [ebp -4]
mov ecx, 4
imul eax, ecx
mov [ebp -16], eax

mov eax, [ebp -12]
mov ecx, [ebp -16]
add eax, ecx
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -12], eax
mov eax, [ebp -12]
mov eax, [eax]
call eax

mov [ebp -12], eax
mov eax, [ebp -4]
mov ecx, 1
add eax, ecx
mov [ebp -12], eax

push dword ptr [ebp -12]
lea eax, s_56
push eax
push dword ptr [GREEN]
mov eax, dword ptr [printf_color]
call eax

add esp, 12

mov [ebp -12], eax
mov eax, [ebp -4]
mov ecx, eax
mov eax, [ebp -4]
inc eax
mov [ebp -4], eax
mov [ebp -12], ecx
jmp .LS3
.LE3:
lea eax, s_57
push eax
push dword ptr [BLUE]
mov eax, dword ptr [printf_color]
call eax

add esp, 8

mov [ebp -12], eax
pop ebx
jmp _exit

1:
sub esp, 16
jmp 2b

main:
.long main + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr 0
push dword ptr [test_gtty]
push dword ptr [test_getuid]
push dword ptr [test_getchar]
push dword ptr [test_fstat]
push dword ptr [test_fork]
push dword ptr [test_time]
push dword ptr [test_printf]
push dword ptr [test_file_operations]
push dword ptr [test_chdir]
push dword ptr [test_char]
mov eax, dword ptr [test_runner]
call eax

add esp, 44

mov [ebp -4], eax
mov eax, 0
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

_exit:
leave
ret

.extern getpid
.extern fork
.extern putchar
.extern close
.extern time
.extern chdir
.extern chown
.globl test_time
.globl test_execv
.globl main
.extern printf
.globl test_fstat
.extern gtty
.extern getchar
.extern execl
.globl test_chown
.extern assert
.globl test_chdir
.extern fstat
.extern execv
.globl test_getchar
.extern wait
.extern t_304
.globl test_char
.globl test_execl
.extern exit
.globl test_gtty
.globl test_getuid
.extern open
.extern creat
.globl test_exec
.globl test_fork
.globl test_printf
.globl test_runner
.extern getcwd
.extern unlink
.extern getuid
.extern write
.extern char
.extern printf_color
.globl test_file_operations
.globl execv_args
.globl BLUE
.globl RED
.globl GREEN
.data
execv_args_v: .long s_3, s_4, 0
execv_args: .long execv_args_v
RED: .long s_0
GREEN: .long s_1
BLUE: .long s_2

.section .rodata
s_48: .string "\nTesting gtty():\n"
s_25: .string "fd: %d\n"
s_15: .string "after: %s\n"
s_23: .string "./test_file"
s_22: .string "Testing creat():\n"
s_47: .string "getuid(): %d\n"
s_1: .string "\033[1;32m"
s_7: .string "\nTesting char():\n"
s_49: .string "Printing stdin tty status:\n"
s_14: .string "/"
s_45: .string "\nTesting getchar():\n"
s_4: .string "-l"
s_56: .string "Test %d: OK\n"
s_5: .string "\nTesting printf():\n"
s_9: .string "%c"
s_44: .string "mode_t: %o\n"
s_6: .string "%o %d\n"
s_34: .string "\nTesting exec functions (only one at a time):\n"
s_36: .string "inside child. pid: %d\n"
s_43: .string "ino_t: %d\n"
s_17: .string "/home/jacob/B/test_file"
s_29: .string "Testing unlink():\n"
s_53: .string "/dev/tty"
s_8: .string "hello world! :)"
s_19: .string "/bin/ls"
s_12: .string "\nTesting getcwd()\n"
s_54: .string "Printing /dev/tty status:\n"
s_16: .string "\nTesting chown():\n"
s_38: .string "inside parent. pid: %d\n"
s_31: .string "execl returned: %d\n"
s_18: .string "chown code: %d\n"
s_42: .string "./test_perm"
s_46: .string "\nTesting getuid():\n"
s_0: .string "\033[1;31m"
s_10: .string "\nTesting time():\n"
s_2: .string "\033[1;34m"
s_28: .string "number of char written or neg error code: [%d]\n"
s_40: .string "wait returned pid: %d, status: %d\n"
s_52: .string "flags: %d\n"
s_30: .string "\nTesting execl():\n"
s_27: .string "test file content\n"
s_55: .string "\nRunning tests:\n"
s_33: .string "execv returned: %d\n"
s_41: .string "\nTesting fstat():\n"
s_37: .string "execv failed in child process\n"
s_50: .string "input speed: %d\n"
s_26: .string "Testing write():\n"
s_13: .string "before: %s\n"
s_20: .string "/root/B/test_file"
s_51: .string "output speed: %d\n"
s_57: .string "All tests completed successfully.\n"
s_21: .string "\nTesting file operations:\n"
s_24: .string "creat code: %d\n"
s_32: .string "\nTesting execv():\n"
s_11: .string "time(): %d\n"
s_39: .string "child pid: %d\n"
s_3: .string "ls"
s_35: .string "\nTesting fork():\n"
