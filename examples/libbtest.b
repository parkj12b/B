main() {
    auto a;
    extrn assert;
    extrn printf, putchar, char;

    /*
        char() test
    */
    auto hello;

    printf("test printf octal: \n");
    printf("%o %d\n", 0123, 0123);
    printf("%o %d\n", -0123, -0123);

    hello = "hello world! :)";
    auto i, c;
    i = 0;

    printf("\nchar() test\n");
    while((c = char(hello, i)) != '\0') {
        printf("%c", c);
        i++;
    }
    putchar('\n');
    

    extrn exit;

    /*
    exit(1);
    */

    extrn time;

    printf("\ntime() test\n");
    time(&a);
    /* should be equal to "date +%s" */
    printf("time(): %d\n", a);
    extrn getcwd, chdir;

    auto buf 50, before 50;

    getcwd(before, 50);
    printf("cwd: %s\n", before);
    chdir("/");
    getcwd(buf, 50);
    printf("cwd: %s\n", buf);
    
    chdir(before);

    extrn chown;
    /* added a arbitrary user John with uid 1001 */
    /*
    chown("/root/B/test_file", 0);
    */
    putchar('\n');

    extrn open, close, write, creat;
    auto fd, code;

    code = creat("./test_file", 0644); /* O_CREAT | O_WRONLY | 
    O_TRUNC */
    printf("creat code: %d\n", code);

    fd = open("./test_file", 0400); /* O_RDONLY */
    printf("fd: %d\n", fd);
    assert(fd != -1);
    putchar('\n');


    /* read only should be error */
    code = write(fd, "test file content\n", 18);
    printf("write code: %d\n", code);
    assert(code == -9);
    code = close(fd);
    putchar('\n');

    fd = open("./test_file", 0666);
    printf("fd: %d\n", fd);
    assert(fd != -1);
    putchar('\n');

    code = write(fd, "test file content\n", 18);
    printf("write code: %d\n", code);
    assert(code >= 0);
    putchar('\n');

    code = close(fd);
    printf("close code: %d\n", code);
    assert(code == 0);
    putchar('\n');

    extrn execl, execv;
    /* code = execl("/bin/ls", "ls", "-l", 0);
    printf("execl returned: %d\n", code); */

    auto execv_args 10;
    execv_args[0] = "ls";
    execv_args[1] = "-l";
    execv_args[2] = 0; 
    /* code = execv("/bin/ls", execv_args, 2);
    printf("execv returned: %d\n", code); */

    auto pid, atomic_int;
    atomic_int = 0;

    extrn fork, getpid, compare_and_exchange;
    pid = fork();

    printf("fork pid: %d\n");
    assert(pid >= 0);

    if (pid == 0) {
        printf("child process: %d\n", getpid());
        /* execv("/bin/ls", execv_args, 2); */
        /* printf("execv failed in child process\n"); */
        exit(0);
    } else {
        printf("parent process: %d\n", getpid());
        printf("child pid: %d\n", pid);
        extrn wait;
        auto status;
        pid = wait(&status);
        printf("wait returned pid: %d, status: %d\n", pid, status);
    }
}