
v[10];
u[10] 1, 2, 3;
w[10];
main() {
	extrn printf;
	extrn u, v, w;
    auto i;
    i = 0;

	printf("before:                 u: [%d] v: [%d]\n", u, v);

	v = u;
	printf("after v = u:            u: [%d] v: [%d]\n", u, v);
	printf("working! u[index]:      [%d] [%d] [%d]\n", u[0], u[1], u[2]);
	printf("working! v[index]:      [%d] [%d] [%d]\n", v[0], v[1], v[2]);
	printf("working! *(v + index):  [%d] [%d] [%d]\n", *(v), *(v + 4), *(v + 8));
	printf("address u:              [%d]\n", &u);
	printf("address addr->deref:    [%d] == [%d]\n", *(&u), u);
	printf("address addr[0]->deref: [%d] == [1]\n", *&(u[0]));
    
    /* using variable offset */
    printf("i = %d\n", i);

	i = 0;
	printf("\n.bss section:\n");
	while (i < 10) {
		printf("w[%d]", i);
    	printf(" == [%d]\n", w[i++]);
	}
    
    return (0);
}
