main() {
	extrn printf, char, putchar, syscall, printstr;
	auto hello;

	hello = "hello world!\n";

	printf(hello);
	if ('%' == '%')
		printf("equal\n");

	printf("I am %d years old\n", 25);
	printf("My name is %s\n", "jacob park");

	return ;
}

/* The following function is a general formatting, printing, and
   conversion subroutine.  The first argument is a format string.
   Character sequences of the form `%x' are interpreted and cause
   conversion of type 'x' of the next argument, other character
   sequences are printed verbatim.   Thus

    printf("delta is %d*n", delta);

    will convert the variable delta to decimal (%d) and print the
    string with the converted form of delta in place of %d.   The
    conversions %d-decimal, %o-octal, *s-string and %c-character
    are allowed.

    This program calls upon the function `printn'. (see section
    9.1) */

printf(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
	extrn printn, char, putchar;
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
	x = *adx++;
	c = char(fmt,i++); 
	if (c == 'd') {
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
	adx--;
	goto loop;
}

printn(n,b) {
	extrn putchar, printn;
	auto a;

	if(a=n/b) /* assignment, not test for equality */
		printn(a, b); /* recursive */
	putchar(n%b + '0');
}

putchar(c) {
	extrn syscall;
	return (syscall(4, 1, &c, 1));
}

char(s, i) {
	return (*(s + i) & 255);
}

printstr(str) {
	extrn putchar;

	while (*str != '\0') {
		putchar(*str);
		str++;
	}
}