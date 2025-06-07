LOCKED_BIT 1;
WAITER_INC 2;
WAITER_MASK -2;

futex_wait(p_lock, val) {
	extrn syscall, SYS_futex;
	return syscall(SYS_futex, p_lock, FUTEX_WAIT, val, NULL, NULL, 0);
}

futex_wake(p_lock, count) {
	extrn syscall, SYS_futex;
	return syscall(SYS_futex, p_lock, FUTEX_WAKE, count, NULL, NULL, 0);
}

futex_lock(p_lock) {
	extrn compare_and_exchange;

    while (1) {
        /* Attempt to acquire lock if unlocked (0 → 1) */
        if (compare_and_exchange(lock, 0, 1) == 0)
            return;

        if (*lock != 2)
            compare_and_exchange(lock, 1, 2);

        futex_wait(lock, 2);
    }
}

futex_unlock(p_lock) {
    /* Decrement lock state: 2 → 0 or 1 → 0 */
    if (__sync_sub_and_fetch(lock, 1) != 0) {
        // If there are waiters, set to 0 and wake them
        *lock = 0;
        futex_wake(lock, 1);
    }
}