main() {
	auto a;

	a = 1;

	printf("postfix a: %d expected: 1\n", a++);
	printf("after postfix: %d\n", a);
	printf("!1, expected 0: %d\n", !1);
	printf("!0s, expected 1: %d\n", !0);
}