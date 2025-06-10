futex_ptr;

printf_flag 0;
printf_mutex_str "printf_mutex";

WHITE "\033[0m";

init_print_mutex() {
    extrn printf_flag, compare_and_exchange, init_mutex, futex_ptr;
    extrn putchar;

    if (!printf_flag) {
		if (compare_and_exchange(&printf_flag, 0, 1) == 0) {
			init_mutex(&futex_ptr);
            *futex_ptr = 0; /* Initialize futex pointer */
		}
	}
}

/*
    make sure to init_print_mutex() before calling any mutex function
    printf_internal should be called with futex_lock/futex_unlock
*/
printf_internal(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
	extrn printn, char, putchar, init_print_mutex, printn_internal;
	auto adx, x, c, i, j;
    
    i= 0;	/* fmt index */
	adx = &x1;	/* argument pointer */
loop :
	while((c=char(fmt,i++)) != '%') {
		if(c == '\0') {
			return ;
		}
		putchar(c);
	}
	x = *adx;
	adx =+ 4;
	c = char(fmt,i++);
	if (c == 'd' | c == 'o') {
		if(x < 0) {
			x = -x ;
			putchar('-');
		}
		printn_internal(x, c=='o'? 8:10);
		goto loop;
	} else {
		if (c == 'c') {
			putchar(x);
			goto loop;
		} else {
			if (c == 's') {
				j = 0;
				while((c=char(x, j++)) != '\0') {
					putchar(c);
				}
				goto loop;
			}
		}
	}
	putchar('%') ;
	i--;
	adx=-4;
	goto loop;
}

/* user defined */
printf(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
	
    extrn futex_lock, futex_unlock, printf_internal;
    extrn futex_ptr;

	init_print_mutex();

    futex_lock(futex_ptr);
    printf_internal(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9);
	futex_unlock(futex_ptr);
    return ;
}

snprintf(buf, size, fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
    extrn char, printn_buf;
    auto adx, x, c, i, j, count;

    i = 0;         
    adx = &x1;     
    count = 0;     

    while (count < size) {
        c = char(fmt, i++);
        if (c == '\0') {
            break;
        }
        if (c != '%') {
            if (count < size - 1) {
                *(buf + count++) = c;
            }
            continue;
        }

        x = *adx;
        adx =+ 4;

        c = char(fmt, i++);
        if (c == 'd' | c == 'o') {
            if (x < 0) {
                if (count < size - 1) {
                    *(buf + count++) = '-';
                }
                x = -x;
            }
            count = printn_buf(buf, size, count, x, c == 'o' ? 8 : 10);
        } else if (c == 'c') {
            if (count < size - 1) {
                *(buf + count++) = x;
            }
        } else if (c == 's') {
            j = 0;
            while ((c = char(x, j++)) != '\0' && count < size - 1) {
                *(buf + count++) = c;
            }
        } else {
            if (count < size - 2) {
                *(buf + count++) = '%';
                i--;
                adx =- 4;
            }
        }
    }

    if (size > 0) {
        /* buf[count < size ? count : size - 1] = '\0'; */
        *(buf + (count < size ? count : size - 1)) = '\0';
    }

    return (count);
}

/* Helper: print number into buffer at buf[count], return new count */
printn_buf(buf, size, count, x, base) {
    extrn char;
    auto digits, n, rev, len, i;

    /* Convert number to digits in reverse */
    digits = 0;
    n = x;
    rev = 0;

    if (n == 0) {
        if (count < size - 1) {
            buf[count++] = '0';
        }
        return (count);
    }

    while (n > 0) {
        digits = n % base;
        n = n / base;
        rev = rev * 10 + digits; /* store digits reversed */
        digits++;
    }

    /* Now print digits in correct order */
    while (rev > 0 && count < size - 1) {
        digits = rev % 10 - 1;
        rev = rev / 10;
        if (digits < 10) {
            buf[count++] = digits + '0';
        } else {
            buf[count++] = digits - 10 + 'a';
        }
    }

    return (count);
}

/* acquire lock in this version */
printn(n,b) {
    extrn printn_internal, init_print_mutex, futex_lock, futex_unlock;
    extrn futex_ptr;

	init_print_mutex();

    futex_lock(futex_ptr); /* acquire lock */
    printn_internal(n, b); /* recursive */
	futex_unlock(futex_ptr); /* release lock */
    return ;
}

printn_internal(n, b) {
    extrn printn_internal, putchar;
	auto a;
    
    if(a=n/b) /* assignment, not test for equality */
		printn_internal(a, b); /* recursive */
	putchar(n%b + '0');
}

printf_color(color, fmt, args) {
    extrn printf_internal, futex_lock, futex_unlock, init_print_mutex;
    extrn futex_ptr, putchar, WHITE;

    init_print_mutex();

    futex_lock(futex_ptr); /* acquire lock */
    printf_internal(color);
    printf_internal(fmt, args);
    printf_internal(WHITE); /* reset color */
    futex_unlock(futex_ptr); /* release lock */
}