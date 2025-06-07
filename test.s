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
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -12], eax
push dword ptr 83
push dword ptr 83
lea eax, s_1
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -12], eax
mov eax, 83
neg eax
mov [ebp -12], eax
mov eax, 83
neg eax
mov [ebp -16], eax
push dword ptr [ebp -16]
push dword ptr [ebp -12]
lea eax, s_1
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -12], eax
lea eax, s_2
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -12], eax

mov eax, 0
mov [ebp -12], eax

mov eax, [ebp -12]
mov [ebp -20], eax
lea eax, s_3
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
lea eax, s_4
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

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
call eax

add esp, 4

mov [ebp -20], eax
lea eax, s_5
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
lea eax, s_6
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -20], eax
lea eax, [ebp -216]
mov [ebp -220], eax
lea eax, [ebp -420]
mov [ebp -424], eax

push dword ptr 50
push dword ptr [ebp -424]
mov eax, dword ptr [getcwd]
call eax

add esp, 8

mov [ebp -428], eax
push dword ptr [ebp -424]
lea eax, s_7
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -428], eax
lea eax, s_8
push eax
mov eax, dword ptr [chdir]
call eax

add esp, 4

mov [ebp -428], eax
push dword ptr 50
push dword ptr [ebp -220]
mov eax, dword ptr [getcwd]
call eax

add esp, 8

mov [ebp -428], eax
push dword ptr [ebp -220]
lea eax, s_7
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -428], eax
push dword ptr [ebp -424]
mov eax, dword ptr [chdir]
call eax

add esp, 4

mov [ebp -428], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -428], eax

push dword ptr 420
lea eax, s_9
push eax
mov eax, dword ptr [creat]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -436]
mov [ebp -432], eax

mov eax, [ebp -432]
mov [ebp -436], eax
push dword ptr [ebp -432]
lea eax, s_10
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -436], eax
push dword ptr 256
lea eax, s_9
push eax
mov eax, dword ptr [open]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -436]
mov [ebp -428], eax

mov eax, [ebp -428]
mov [ebp -436], eax
push dword ptr [ebp -428]
lea eax, s_11
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -428]
mov ecx, -1
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -436], eax

push dword ptr [ebp -436]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr 18
lea eax, s_12
push eax
push dword ptr [ebp -428]
mov eax, dword ptr [write]
call eax

add esp, 12

mov [ebp -436], eax
mov eax, [ebp -436]
mov [ebp -432], eax

mov eax, [ebp -432]
mov [ebp -436], eax
push dword ptr [ebp -432]
lea eax, s_13
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -432]
mov ecx, -9
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -436], eax

push dword ptr [ebp -436]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr [ebp -428]
mov eax, dword ptr [close]
call eax

add esp, 4

mov [ebp -436], eax
mov eax, [ebp -436]
mov [ebp -432], eax

mov eax, [ebp -432]
mov [ebp -436], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr 438
lea eax, s_9
push eax
mov eax, dword ptr [open]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -436]
mov [ebp -428], eax

mov eax, [ebp -428]
mov [ebp -436], eax
push dword ptr [ebp -428]
lea eax, s_11
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -428]
mov ecx, -1
cmp eax, ecx
setne al
movzx eax, al
mov [ebp -436], eax

push dword ptr [ebp -436]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr 18
lea eax, s_12
push eax
push dword ptr [ebp -428]
mov eax, dword ptr [write]
call eax

add esp, 12

mov [ebp -436], eax
mov eax, [ebp -436]
mov [ebp -432], eax

mov eax, [ebp -432]
mov [ebp -436], eax
push dword ptr [ebp -432]
lea eax, s_13
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -432]
mov ecx, 0
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -436], eax

push dword ptr [ebp -436]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr [ebp -428]
mov eax, dword ptr [close]
call eax

add esp, 4

mov [ebp -436], eax
mov eax, [ebp -436]
mov [ebp -432], eax

mov eax, [ebp -432]
mov [ebp -436], eax
push dword ptr [ebp -432]
lea eax, s_14
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -436], eax
mov eax, [ebp -432]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -436], eax

push dword ptr [ebp -436]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -436], eax
push dword ptr 10
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -436], eax
lea eax, [ebp -472]
mov [ebp -476], eax

mov eax, [ebp -476]
mov ebx, 0
imul ebx, 4
add ebx, eax
mov [ebp -480], ebx
lea eax, s_15
mov ebx, [ebp -480]
mov [ebx], eax

mov eax, [ebp -480]
mov eax, [eax]
mov [ebp -480], eax
mov eax, [ebp -476]
mov ebx, 1
imul ebx, 4
add ebx, eax
mov [ebp -480], ebx
lea eax, s_16
mov ebx, [ebp -480]
mov [ebx], eax

mov eax, [ebp -480]
mov eax, [eax]
mov [ebp -480], eax
mov eax, [ebp -476]
mov ebx, 2
imul ebx, 4
add ebx, eax
mov [ebp -480], ebx
mov eax, 0
mov ebx, [ebp -480]
mov [ebx], eax

mov eax, [ebp -480]
mov eax, [eax]
mov [ebp -480], eax

mov eax, 0
mov [ebp -484], eax

mov eax, [ebp -484]
mov [ebp -488], eax
mov eax, dword ptr [fork]
call eax

mov [ebp -488], eax
mov eax, [ebp -488]
mov [ebp -480], eax

mov eax, [ebp -480]
mov [ebp -488], eax
lea eax, s_17
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -488], eax
mov eax, [ebp -480]
mov ecx, 0
cmp eax, ecx
setge al
movzx eax, al
mov [ebp -488], eax

push dword ptr [ebp -488]
mov eax, dword ptr [assert]
call eax

add esp, 4

mov [ebp -488], eax
mov eax, [ebp -480]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -488], eax

mov eax, [ebp -488]
test eax, eax
jz .LF1
lea eax, [ebp -484]
mov [ebp -488], eax
push dword ptr 1
push dword ptr 0
push dword ptr [ebp -488]
mov eax, dword ptr [compare_and_exchange]
call eax

add esp, 12

mov [ebp -488], eax
mov eax, [ebp -488]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -488], eax

mov eax, [ebp -488]
test eax, eax
jz .LF2
lea eax, s_18
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -488], eax
.LF2:
mov eax, dword ptr [getpid]
call eax

mov [ebp -488], eax
push dword ptr [ebp -488]
lea eax, s_19
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -488], eax
push dword ptr 0
mov eax, dword ptr [exit]
call eax

add esp, 4

mov [ebp -488], eax
jmp .LE1
.LF1:
lea eax, [ebp -484]
mov [ebp -488], eax
push dword ptr 1
push dword ptr 0
push dword ptr [ebp -488]
mov eax, dword ptr [compare_and_exchange]
call eax

add esp, 12

mov [ebp -488], eax
mov eax, [ebp -488]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -488], eax

mov eax, [ebp -488]
test eax, eax
jz .LF3
lea eax, s_20
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -488], eax
.LF3:
mov eax, dword ptr [getpid]
call eax

mov [ebp -488], eax
push dword ptr [ebp -488]
lea eax, s_21
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -488], eax
push dword ptr [ebp -480]
lea eax, s_22
push eax
mov eax, dword ptr [printf]
call eax

add esp, 8

mov [ebp -488], eax

lea eax, [ebp -488]
mov [ebp -492], eax
push dword ptr [ebp -492]
mov eax, dword ptr [wait]
call eax

add esp, 4

mov [ebp -492], eax
mov eax, [ebp -492]
mov [ebp -480], eax

mov eax, [ebp -480]
mov [ebp -492], eax
push dword ptr [ebp -488]
push dword ptr [ebp -480]
lea eax, s_23
push eax
mov eax, dword ptr [printf]
call eax

add esp, 12

mov [ebp -492], eax
.LE1:
pop ebx
jmp _exit

1:
sub esp, 492
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
.extern exit
.extern wait
.globl main
.extern open
.extern printf
.extern creat
.extern getcwd
.extern compare_and_exchange
.extern assert
.extern write
.extern char
.section .rodata
s_4: .string "%c"
s_7: .string "cwd: %s\n"
s_3: .string "\nchar() test\n"
s_18: .string "child changed atomic int\n"
s_1: .string "%o %d\n"
s_20: .string "parent changed atomic int\n"
s_11: .string "fd: %d\n"
s_9: .string "./test_file"
s_13: .string "write code: %d\n"
s_23: .string "wait returned pid: %d, status: %d\n"
s_10: .string "creat code: %d\n"
s_2: .string "hello world! :)"
s_12: .string "test file content\n"
s_8: .string "/"
s_19: .string "child process: %d\n"
s_21: .string "parent process: %d\n"
s_0: .string "test printf octal: \n"
s_6: .string "time(): %d\n"
s_14: .string "close code: %d\n"
s_16: .string "-l"
s_22: .string "child pid: %d\n"
s_5: .string "\ntime() test\n"
s_15: .string "ls"
s_17: .string "fork pid: %d\n"
