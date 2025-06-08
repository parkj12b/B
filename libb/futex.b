/* lock bits */
LOCKED_BIT 1;
WAITER_INC 2;
WAITER_MASK -2;

/* FUT_* flags */
FUTEX_WAIT 0;
FUTEX_WAKE 1;

futex_wait(p_lock, val) {
	extrn syscall;
    extrn SYS_futex, FUTEX_WAIT, NULL;

	return (syscall(SYS_futex, p_lock, FUTEX_WAIT, val, NULL, NULL, 0));
}

futex_wake(p_lock, count) {
	extrn syscall;
    extrn SYS_futex, FUTEX_WAKE, NULL;
	return (syscall(SYS_futex, p_lock, FUTEX_WAKE, count, NULL, NULL, 0));
}

futex_lock(p_lock) {
	extrn compare_and_exchange, futex_wait;

    while (1) {
        /* Attempt to acquire lock if unlocked (0 → 1) */
        if (compare_and_exchange(p_lock, 0, 1) == 0)
            return;

        if (*p_lock != 2)
            compare_and_exchange(p_lock, 1, 2);

        futex_wait(p_lock, 2);
    }
}

futex_unlock(p_lock) {
    extrn sub_and_fetch, futex_wake;
    /* Decrement lock state: 2 → 0 or 1 → 0 */
    if (sub_and_fetch(p_lock, 1) != 0) {
        *p_lock = 0;
        futex_wake(p_lock, 1);
    }
}