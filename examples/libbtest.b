main() {
    auto a;
    extrn time, printf, exit, putchar, char;
    extrn chdir;

    /*
        char() test
    */
    auto hello;

    hello = "hello world! :)";
    auto i, c;
    i = 0;

    printf("\nchar() test\n");
    while((c = char(hello, i)) != '\0') {
        printf("%c", c);
        i++;
    }
    putchar('\n');
    

    /*
    exit(1);
    */

    printf("\ntime() test\n");
    time(&a);
    /* should be equal to "date +%s" */
    printf("time(): %d\n", a);

    auto buf 50;
    extrn getcwd;

    chdir("/");
    getcwd(buf, 50);
    printf("cwd: %s\n", buf);
    
    extrn chown;
    /* added a arbitrary user John with uid 1001 */
    /*
    chown("/root/B/test_file", 0);
    */


}