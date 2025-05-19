
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
printf("1 ---------\n");
	/*
	printf("%d\n", b);
	printf("%s\n", d[2]);
	printf("%s\n", e[2]);
	printf("%d\n", f[4]);
	*/
	printf("%d\n", a[0]);

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

printf("4 ---------\n");
	extrn extern;

	printf("%d\n", extern);

}

/* 7.3 */
addition(a, b) {
	return (a + b);
}

subtract(a, b)
	return (a - b);
