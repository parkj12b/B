.intel_syntax noprefix
.text
.globl compare_and_exchange
compare_and_exchange:
	.long compare_and_exchange + 4
    push ebp
    mov ebp, esp

    mov eax, [ebp + 12]     # expected
    mov ecx, [ebp + 16]     # new_val
    mov edx, [ebp + 8]      # ptr

    lock cmpxchg [edx], ecx # atomically compare and exchange

    # EAX now contains the old value at *ptr
    # So we just return it
    leave
    ret
