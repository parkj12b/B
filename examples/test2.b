a 1, 2, 3, 4, 5;

main() {
	extrn a;
	auto b, c 2;

	printf("expected: 2, %d\n", a[1]);
	printf("expected: 2, %d\n", 1[a]);
	printf("expected: 3, %d\n", a[2]);
	printf("expected: 3, %d\n", 2[a]);

	b = 1;
	printf("expected: 2, %d\n", a[b]);
	printf("expected: 2, %d\n", b[a]);
	c[0] = 1;
	/* printf("%d\n", a[c]); */
	printf("expected: 2, %d\n", a[c[0]]);

}