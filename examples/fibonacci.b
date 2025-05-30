fib(n) {
  auto a, b, c, i;

  a = 0;
  b = 1;
  i = 0;
  while (i < n) {
    c = a + b;
    a = b;
    b = c;

    i++;
  }

  return (a);
}

main() {
    printf("%d\n", fib(1));
    printf("%d\n", fib(2));
    printf("%d\n", fib(3));
    printf("%d\n", fib(4));
    printf("%d\n", fib(5));
    printf("%d\n", fib(6));
    printf("%d\n", fib(7));
    printf("%d\n", fib(8));
    return (0);
}
