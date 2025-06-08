main() {
	extrn printf;

	auto i;

	i = 0;

	while (i < 10) {
		printf("Hello, world! %d\n", i);
		if (i % 2 == 0) {
			printf("Even number: %d\n", i);
			i =+ 1;
			continue;
			printf("This lien won't print\n");
		}
		if (i == 5) {
			printf("Reached halfway point!\n");
			break; 
		}
		i =+ 1;
	}
}