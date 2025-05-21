#include <stdio.h>

int a[5] = {1, 2, 3, 4, 5};
int c[5] = {2, 3, 4, 5, 6};

int main()
{
	int b = 2;
	printf("%d %d\n", 2[a], a[2]); // (value + addr, addr + value)
	printf("%d %d\n", b[a], a[b]); // (value + addr, addr + value)
	printf("%d %d\n", c[a[0]], a[0][c]);
	printf("%d\n", a);

}