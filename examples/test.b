u 1, 2, 3;
v[10] 4, 5, 6;
main() {
	/*
	auto hello;

	hello = "hello world!\n";

	printf(hello);

	printf("I am %d years old\n", 25);
	printf("My name is %s\n", "jacob park");

	*/

	extrn u, v;
	extrn printn, printf;

	printn(u[2], 10);
	printf("[%d] [%d] [%d]\n", u[0], u[1], u[2]);


	return ;
}
