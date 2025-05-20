
/* 7.1 */
a 1, 2, 3, 4, 5;
b 1;
c;

/* 7.2 */
d[5];
e[5] 1, 2, "hello";
f[2] 1, 2, 3, 4, 5;

/* 7.3 */
main(argc, argv, envp) {
	extrn a;
	extrn b, e;
	/* extrn; syntax error */
printf("1 ---------\n");
	/* Symbol not found
	printf("%d\n", b);
	printf("%s\n", d[2]);
	printf("%s\n", e[2]);
	printf("%d\n", f[4]);
	*/
	printf("%s\n", e[2]);
	printf("b: %d\n", b);
/* 4.1 TODO: octal constant */
printf("2 ---------\n");

	auto g;
	g = 'c';
	printf("%c\n", g);
	printf("123\n");

printf("3 ---------\n");
	auto h_1, h_2 10, h_3;
	h_2[0] = 0;
	h_2[7] = 7;
	printf("%d %d\n", h_2[0], h_2[7]);

/* 6.3 */
printf("4 ---------\n");
	printf("loop start\n");
	b = 5;
	loop:
		b--;
		printf("b: %d\n", b);
		if (b > 0)
			goto loop;
	printf("loop finish\n");
	/* error */
	/* goto label; */

/* 5.1 */
printf("5 ---------\n");
if (1) {
	{{{printf("braces work\n");}}}
}

/* 5.2 */
	b = 1;
	if (b++)
		if (1)
			printf("no dangling else\n");
	else
		printf("else else else\n");
	printf("expect 2 b: %d\n", b);
	b = -5;
/* 5.3 */
	while (b++)
	{
		printf("b: %d\n", b);
	}
	printf("1 expected: %d\n", b);
	

}

/* 7.3 */
addition(a, b) {
	label:
	return (a + b);
}

subtract(a, b)
	return (a - b);
