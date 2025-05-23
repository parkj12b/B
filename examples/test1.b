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
	extrn b, e, c;
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
	/*
	loop:
		b--;
		printf("b: %d\n", b);
		if (b > 0)
			goto loop;
	*/
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

	b = -2;
	while (++b) {
		printf("b: %d\n", b);
	}

	printf("0 expected: %d\n", b);

	b = 2 ;
	while (--b) {
		printf("b = %d\n", b);
	}

	printf("0 expected: %d\n", b);


	b = 2 ;
	while (b--) {
		printf("b = %d\n", b);
	}

	printf("-1 expected: %d\n", b);

		b = 6 ;
	while (b =- 2) {
		printf("b = %d\n", b);
	}

	printf("0 expected: %d\n", b);
	
/* 4.11 */
	b = 2;
	printf("ASSIGN\nexpect: 2, result: %d\n", b);

	b =| 8;
	printf("ASSIGN_OR\n2 | 8\nexpect: 10, result: %d\n", b);

	b = 3;
	b =<< 2;
	printf("ASSIGN_LSHIFT\n3 << 2\nexpect: 12, result %d\n", b);

	b = 12;
	b =>> 2;
	printf("ASSIGN_RSHIFT\n12 >> 2\nexpect: 3, result %d\n", b);
	
	b = 10;
	b =- 7;
	printf("ASSIGN_MINUS\n10 - 7\nexpect: 3, result %d\n", b);


	b = 10;
	b =+ 10;
	printf("ASSIGN_PLUS\n10 + 10\nexpect: 20, result %d\n", b);

	b = 10;
	b =% 3;
	printf("ASSIGN_MOD\n10 %% 3\nexpect: 1, result %d\n", b);
/*
	b = 2;
	b =* 4;
	printf("ASSIGN_MUL\n2 * 4\nexpect: 8, result: %d\n", b);
*/
	b = 10;
	b =/ 3;
	printf("ASSIGN_DIVIDE\n10 / 3\nexpect: 3, result: %d\n", b);
	
	b = 10;
	b =/ 2;
	printf("ASSIGN_DIVIDE\n10 / 2\nexpect: 5, result: %d\n", b);

/* 4.1 */
	printf("expected: 10, %d\n", 10);
	printf("expected: c, %c\n", 'c');
	printf("expected: Hello world, %s\n", "Hello world");

	b;
	b = (2 * (3 + 4));
	printf("expected 14: %d\n", b);

	printf("expected 14: %d\n", (2 * (3 +4)));
	b = 1;
/* vector access */
	printf("expected 2: %d\n", a[1]);
	printf("expected 2: %d\n", 1[a]);

	printf("expected: 2, %d\n", a[1]);
	printf("expected: 2, %d\n", 1[a]);
	printf("expected: 3, %d\n", a[2]);
	printf("expected: 3, %d\n", 2[a]);

	b = 1;
	printf("expected: 2, %d\n", a[b]);
	printf("expected: 2, %d\n", b[a]);
	/* printf("%d\n", a[e]); */
	printf("expected: 2, %d\n", a[e[0]]);
	/*
	printf("%d\n", b[b]);
	printf("%d\n", 1[1]);
	*/

	b = addition(2, 3);
	printf("expected: 5, %d\n", b);
	b = subtract(2, 3);
	printf("expected: -1, %d\n", b);

/* 4.3 ~ 4.9 */
	printf("expected: 13, 12 | 9 = %d\n", 12 | 9);
	printf("expected: 108, 12 * 9 = %d\n", 12 * 9);
	printf("expected: 8, 12 & 9 = %d\n", 12 & 9);
	printf("expected: 0, 12 == 9 %d\n", 12 == 9);
	printf("expected: 1, 12 == 12%d\n", 12 == 12);
	printf("expected: 1, 12 != 11%d\n", 12 != 11);
	printf("expected: 0, 12 != 12 %d\n", 12 != 12);
	printf("expected: 1, 1 < 12 %d\n", 1 < 12);
	printf("expected: 0, 14 < 12 %d\n", 14 < 12);
	printf("expected: 0, 14 <= 12 %d\n", 14 <= 12);
	printf("expected: 1, 14 > 12 %d\n", 14 > 12);
	printf("expected: 0, 11 > 12 %d\n", 11 > 12);
	printf("expected: 0, 11 >= 12 %d\n", 11 >= 12);
	printf("expected: 12, 3 << 2 = %d\n", 3 << 2);
	printf("expected: 3, 12 >> 2 = %d\n", 12 >> 2);
	printf("expected: 2, 5 - 3 = %d\n", 5 - 3);
	printf("expected: 8, 5 + 3 = %d\n", 5 + 3);
	printf("expected: 1, 2147483647 %% 2147483646 %d\n", 2147483647 % 2147483646);
	printf("expected: 1, 2 / 2 = %d\n", 2 / 2);

}

/* 7.3 */
addition(a, b) {
	printf("%d, %d\n", a, b);
	label:
	return ((a)+(b));
}

subtract(a, b)
	return ((a + 1) - (b + 1));
