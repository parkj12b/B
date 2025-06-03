main() {
    extrn addition, printf;
    auto a;

    a = addition;
    printf("%d\n", addition);
    printf("%d\n", a(1, 2));
}

addition(a, b) {
    return (a + b);
}