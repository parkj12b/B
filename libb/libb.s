.intel_syntax noprefix
.text
.globl main
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
.LS0:
mov eax, [ebp -16]
mov ecx, eax
mov eax, [ebp -16]
inc eax
mov [ebp -16], eax
mov [ebp -24], ecx
push dword ptr [ebp -24]
push dword ptr [ebp +8]
mov eax, dword ptr [char]
call eax

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
jz .LF0
mov eax, [ebp -12]
mov ecx, 0
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF1
mov eax, 0
jmp _exit
.LF1:
push dword ptr [ebp -12]
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -24], eax
jmp .LS0
.LF0:
mov eax, [ebp -4]
mov [ebp -24], eax
mov eax, [ebp -24]
mov eax, [eax]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -24], eax
mov eax, [ebp -4]
mov ecx, 4
add eax, ecx
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -24], eax
mov eax, [ebp -16]
mov ecx, eax
mov eax, [ebp -16]
inc eax
mov [ebp -16], eax
mov [ebp -24], ecx
push dword ptr [ebp -24]
push dword ptr [ebp +8]
mov eax, dword ptr [char]
call eax

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

mov eax, [ebp -12]
mov ecx, 111
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -28], eax

mov eax, [ebp -24]
mov ecx, [ebp -28]
or eax, ecx
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF2
mov eax, [ebp -8]
mov ecx, 0
cmp eax, ecx
setl al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF3
mov eax, [ebp -8]
neg eax
mov [ebp -24], eax
mov eax, [ebp -24]
mov [ebp -8], eax

mov eax, [ebp -8]
mov [ebp -24], eax
push dword ptr 45
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -24], eax
.LF3:
mov eax, [ebp -12]
mov ecx, 111
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF4
mov eax, 8
mov [ebp -24], eax
jmp .LE4
.LF4:
mov eax, 10
mov [ebp -24], eax
.LE4:
push dword ptr [ebp -24]
push dword ptr [ebp -8]
mov eax, dword ptr [printn]
call eax

add esp, 8

mov [ebp -24], eax
jmp [.loop]
jmp .LE2
.LF2:
mov eax, [ebp -12]
mov ecx, 99
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF5
push dword ptr [ebp -8]
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -24], eax
jmp [.loop]
jmp .LE5
.LF5:
mov eax, [ebp -12]
mov ecx, 115
cmp eax, ecx
sete al
movzx eax, al
mov [ebp -24], eax

mov eax, [ebp -24]
test eax, eax
jz .LF6
mov eax, 0
mov [ebp -20], eax

mov eax, [ebp -20]
mov [ebp -24], eax
.LS7:
mov eax, [ebp -20]
mov ecx, eax
mov eax, [ebp -20]
inc eax
mov [ebp -20], eax
mov [ebp -24], ecx
push dword ptr [ebp -24]
push dword ptr [ebp -8]
mov eax, dword ptr [char]
call eax

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
jz .LF7
push dword ptr [ebp -12]
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -24], eax
jmp .LS7
.LF7:
jmp [.loop]
.LF6:
.LE5:
.LE2:
push dword ptr 37
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -24], eax
mov eax, [ebp -16]
mov ecx, eax
mov eax, [ebp -16]
dec eax
mov [ebp -16], eax
mov [ebp -24], ecx
mov eax, [ebp -4]
mov ecx, 4
sub eax, ecx
mov [ebp -4], eax

mov eax, [ebp -4]
mov [ebp -24], eax
jmp [.loop]
pop ebx
jmp _exit

1:
sub esp, 28
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
jz .LF8
push dword ptr [ebp +12]
push dword ptr [ebp -4]
mov eax, dword ptr [printn]
call eax

add esp, 8

mov [ebp -8], eax
.LF8:
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
mov eax, dword ptr [putchar]
call eax

add esp, 4

mov [ebp -8], eax
pop ebx
jmp _exit

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
push dword ptr [SYS_write]
mov eax, dword ptr [syscall]
call eax

add esp, 16

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

getpid:
.long getpid + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [SYS_getpid]
mov eax, dword ptr [syscall]
call eax

add esp, 4

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

raise:
.long raise + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
mov eax, dword ptr [getpid]
call eax

add esp, 4

mov [ebp -4], eax
push dword ptr [ebp +8]
push dword ptr [ebp -4]
push dword ptr [SYS_kill]
mov eax, dword ptr [syscall]
call eax

add esp, 12

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

assert:
.long assert + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
mov eax, [ebp +8]
test eax, eax
jz .LF9
mov eax, 0
jmp _exit
.LF9:
lea eax, s_0
push eax
mov eax, dword ptr [printf]
call eax

add esp, 4

mov [ebp -4], eax
push dword ptr [SIGABRT]
mov eax, dword ptr [raise]
call eax

add esp, 4

mov [ebp -4], eax
pop ebx
jmp _exit

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
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

chdir:
.long chdir + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +8]
push dword ptr [SYS_chdir]
mov eax, dword ptr [syscall]
call eax

add esp, 8

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

getcwd:
.long getcwd + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +12]
push dword ptr [ebp +8]
push dword ptr [SYS_getcwd]
mov eax, dword ptr [syscall]
call eax

add esp, 12

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

chown:
.long chown + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr -1
push dword ptr [ebp +12]
push dword ptr [ebp +8]
push dword ptr [SYS_chown]
mov eax, dword ptr [syscall]
call eax

add esp, 16

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

open:
.long open + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +12]
push dword ptr [ebp +8]
push dword ptr [SYS_open]
mov eax, dword ptr [syscall]
call eax

add esp, 12

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

close:
.long close + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +8]
push dword ptr [SYS_close]
mov eax, dword ptr [syscall]
call eax

add esp, 8

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

creat:
.long creat + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +12]
push dword ptr [ebp +8]
push dword ptr [SYS_creat]
mov eax, dword ptr [syscall]
call eax

add esp, 12

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

write:
.long write + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +16]
push dword ptr [ebp +12]
push dword ptr [ebp +8]
push dword ptr [SYS_write]
mov eax, dword ptr [syscall]
call eax

add esp, 16

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

ctime:
.long ctime + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
pop ebx
jmp _exit

1:
sub esp, 0
jmp 2b

time:
.long time + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +8]
push dword ptr [SYS_time]
mov eax, dword ptr [syscall]
call eax

add esp, 8

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

execl:
.long execl + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
lea eax, [ebp +12]
mov [ebp -4], eax
push dword ptr [NULL]
push dword ptr [ebp -4]
push dword ptr [ebp +8]
push dword ptr [SYS_execve]
mov eax, dword ptr [syscall]
call eax

add esp, 16

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

execv:
.long execv + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [NULL]
push dword ptr [ebp +12]
push dword ptr [ebp +8]
push dword ptr [SYS_execve]
mov eax, dword ptr [syscall]
call eax

add esp, 16

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

exit:
.long exit + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +8]
push dword ptr [SYS_exit]
mov eax, dword ptr [syscall]
call eax

add esp, 8

mov [ebp -4], eax
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

fork:
.long fork + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [SYS_fork]
mov eax, dword ptr [syscall]
call eax

add esp, 4

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

wait:
.long wait + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr 0
push dword ptr [ebp +8]
push dword ptr -1
push dword ptr [SYS_waitpid]
mov eax, dword ptr [syscall]
call eax

add esp, 16

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

mutex_init:
.long mutex_init + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr 438
push dword ptr [ebp +8]
push dword ptr [SYS_creat]
mov eax, dword ptr [syscall]
call eax

add esp, 12

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

mmap:
.long mmap + 4
push ebp
mov ebp, esp

push ebx
jmp 1f
2:
push dword ptr [ebp +28]
push dword ptr [ebp +24]
push dword ptr [ebp +20]
push dword ptr [ebp +16]
push dword ptr [ebp +12]
push dword ptr [ebp +8]
push dword ptr [SYS_mmap2]
mov eax, dword ptr [syscall]
call eax

add esp, 28

mov [ebp -4], eax
mov eax, [ebp -4]
jmp _exit
pop ebx
jmp _exit

1:
sub esp, 4
jmp 2b

_exit:
leave
ret

.globl getpid
.globl fork
.globl putchar
.globl raise
.globl close
.globl chdir
.globl chown
.globl time
.globl exit
.globl open
.globl printf
.globl creat
.globl wait
.globl mmap
.globl getcwd
.globl execl
.globl printn
.globl ctime
.extern syscall
.globl assert
.globl write
.globl char
.globl execv
.globl mutex_init
.globl SYS_fork
.globl SYS_time
.globl True
.globl SYS_execve
.globl PROT_WRITE
.globl MAP_PRIVATE
.globl SYS_mmap2
.globl SYS_kill
.globl MAP_ANONYMOUS
.globl SYS_open
.globl False
.globl futex_ptr
.globl SYS_waitpid
.globl SYS_write
.globl SYS_chown
.globl SYS_getcwd
.globl SYS_getpid
.globl PROT_READ
.globl NULL
.globl SYS_chdir
.globl SIGABRT
.globl SYS_close
.globl SYS_exit
.globl SYS_creat
.globl MAP_SHARED
.bss
futex_ptr: .zero 4

.data
SYS_chown: .long 182
SYS_getcwd: .long 183
SYS_time: .long 13
SYS_getpid: .long 20
NULL: .long 0
True: .long 1
PROT_READ: .long 1
SYS_execve: .long 11
SYS_chdir: .long 12
SIGABRT: .long 6
SYS_mmap2: .long 192
SYS_kill: .long 37
PROT_WRITE: .long 2
MAP_SHARED: .long 1
MAP_PRIVATE: .long 2
MAP_ANONYMOUS: .long 32
SYS_close: .long 6
SYS_open: .long 5
False: .long 0
SYS_exit: .long 1
SYS_waitpid: .long 7
SYS_creat: .long 8
SYS_write: .long 4
SYS_fork: .long 2

.section .rodata
s_0: .string "assert failure\n"
