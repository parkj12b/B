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

.globl sub_and_fetch
sub_and_fetch:
    .long sub_and_fetch + 4
    push    ebp
    mov     ebp, esp

    mov     eax, [ebp + 12]    # eax = val (second argument)
    neg     eax                # eax = -val
    mov     edx, eax           # edx = -val (keep for adding later)

    mov     ecx, [ebp + 8]     # ecx = ptr (first argument)

    lock xadd dword ptr [ecx], eax  # atomic add -val to *ptr; eax = old *ptr

    add     eax, edx           # eax = old_val - val (new value)

    leave
    ret
