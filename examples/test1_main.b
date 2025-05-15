main() {
	auto a, b;

	a = &b;
	printf("%zu\n", a);
	*a = 5;
	printf("%d\n", b);
}