
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
	printf("%d\n", b);
	printf("%s\n", d[2]);
	printf("%s\n", e[2]);
	printf("%d\n", f[4]);

	auto g;
	g = 'c';
	printf("%c\n", g);

}

/* 7.3 */
addition(a, b) {
	return (a + b);
}

subtract(a, b)
	return (a - b);