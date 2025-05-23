.globl main
.text
.type main, @function
main:
  push %rbp
  mov %rsp, %rbp
  sub $8, %rsp
.L.start.0:
  mov $1, %rax
  cmp $0, %rax
  je .L.end.0
  sub $8, %rsp
  sub $8, %rsp
  add $16, %rsp
  jmp .L.start.0
.L.end.0:
  xor %rax, %rax
.L.return.main:
  mov %rbp, %rsp
  pop %rbp
  ret
.section .rodata
