/* header section */

True 1;
False 0;
NULL 0;

/* source code */

/* user defined */
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
	x = *adx;
	adx =+ 4;
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
	adx=-4;
	goto loop;
}

printn(n,b) {
	extrn printn, putchar;
	auto a;

	if(a=n/b) /* assignment, not test for equality */
		printn(a, b); /* recursive */
	putchar(n%b + '0');
}

putchar(c) {
	extrn syscall;
	return (syscall(4, 1, &c, 1));
}

exit(numerr) {
	extrn syscall;
	syscall(1, numerr);
}

assert(a) {
	extrn printf;
	if (a)
		return ;
	printf("assert failure\n");
	exit(1);
}

/* stdlib */

char(s, i) {
	return (*(s + i) & 255);
}

chdir(dir) {
	extrn syscall;
	syscall(12, dir);
}

getcwd(buf, size) {
	extrn syscall;
	syscall(183, buf, size);
}

chown(file, owner) {
	extrn syscall;
	syscall(182, file, owner, -1);
}

close(file) {
	extrn syscall;
	syscall(6, file);
}

creat(s, mode) {
	extrn syscall;
	syscall(8, s, mode);
}

ctime(time, date) {

}

time(timev) {
	extrn syscall;
	syscall(13, timev);
}

execl(string, args) {
	extrn syscall, NULL;
	syscall(11, args, NULL);
}

