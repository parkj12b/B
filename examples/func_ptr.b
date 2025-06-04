main() {
    extrn addition, printf;
    auto a;

    a = addition;
    printf("%d\n", addition);
    printf("%d\n", a(1, 2));
    addition(1 + 2, 3 + 4);
}

addition(a, b) {
    return (a + b);
    abc:
        goto abc;
}