main() {
	auto a;
	a = 1;

	auto b;
	b = &a;

	printf("%d\n", *b);

	while (a++ < 10) {
		auto d;
		d = a;
		printf("%d\n", d);
	}
	/*while (1) {
		auto c;
		d;
	}*/
}
