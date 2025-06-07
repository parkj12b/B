
/* user defined */
printf(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
	extrn printn, char, putchar;
	auto adx, x, c, i, j;

	if (!printf_flag) {
		if (compare_and_exchange(&printf_flag, 0, 1) == 0) {
			init_mutex();
		}
	}

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
		printn(x, c=='o'? 8:10);
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

snprintf(buf, size, fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
    extrn char;
    auto adx, x, c, i, j, count;

    i = 0;          /* index in fmt */
    adx = &x1;      /* pointer to args */
    count = 0;      /* chars written */

    while (count < size) {
        c = char(fmt, i++);
        if (c == '\0') {
            break;
        }
        if (c != '%') {
            if (count < size - 1) {
                buf[count++] = c;
            }
            continue;
        }

        x = *adx;
        adx =+ 4;

        c = char(fmt, i++);
        if (c == 'd' | c == 'o') {
            if (x < 0) {
                if (count < size - 1) {
                    buf[count++] = '-';
                }
                x = -x;
            }
            count = printn_buf(buf, size, count, x, c == 'o' ? 8 : 10);
        } else if (c == 'c') {
            if (count < size - 1) {
                buf[count++] = x;
            }
        } else if (c == 's') {
            j = 0;
            while ((c = char(x, j++)) != '\0' && count < size - 1) {
                buf[count++] = c;
            }
        } else {
            /* Unknown specifier: print it literally */
            if (count < size - 2) {
                buf[count++] = '%';
                i--;
                adx =- 4;
            }
        }
    }

    /* Null terminate */
    if (size > 0) {
        buf[count < size ? count : size - 1] = '\0';
    }

    return count; /* number of chars written, excluding null */
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
        return count;
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

    return count;
}


printn(n,b) {
	extrn printn, putchar;
	auto a;

	if(a=n/b) /* assignment, not test for equality */
		printn(a, b); /* recursive */
	putchar(n%b + '0');
}
