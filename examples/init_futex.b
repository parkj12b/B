ptr;

main() {
	/* 과제를 똑바로 만들란 말이야 이 멍멍이들아아 */
	
	extrn init_mutex, printf, ptr;

	ptr = init_mutex();

	printf("%d\n", ptr);
	*ptr = 0;
	printf("%d\n", *ptr);
	return ;
}