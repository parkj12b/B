struct S
{
	int a;
	char b;
};

#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

int main(int argc, char **argv, char **envp)
{
	int a_1;
	char abc;

	printf("%d\n", 1 + 2);

	struct S s;

	s.a = 10;
	int arg[10];

	int file = open("./test_file", O_CREAT);

	arg[0] = 1;
	int *futex_ptr = mmap(NULL, sizeof(int),
						  PROT_READ | PROT_WRITE,
						  MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	*futex_ptr = 0; // initial unlocked state

	// bool __atomic_compare_exchange_n(type * ptr, type * expected, type desired,
	// 								 bool weak, int success_memorder,
	// 								 int failure_memorder);
}
