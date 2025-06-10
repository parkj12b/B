/* color code */
RED "\033[1;31m";
GREEN "\033[1;32m";
BLUE "\033[1;34m";
execv_args "ls", "-l", 0;

test_printf() {
    /* test octal */
    extrn BLUE;
    extrn printf, printf_color;

    printf_color(BLUE, "\nTesting printf():\n");
    printf("%o %d\n", 0123, 0123);
    printf("%o %d\n", -0123, -0123);
}

test_char() {
    extrn printf, printf_color, char, putchar;
    extrn BLUE;

    printf_color(BLUE, "\nTesting char():\n");

    auto hello;

    hello = "hello world! :)";
    auto i, c;
    i = 0;

    while((c = char(hello, i)) != '\0') {
        printf("%c", c);
        i++;
    }
    putchar('\n');
    
}

test_time() {
    extrn printf, printf_color, time;
    extrn BLUE;

    printf_color(BLUE, "\nTesting time():\n");

    auto t;
    time(&t);
    /* should be equal to "date +%s" */
    printf("time(): %d\n", t);
}

test_chdir() {
    extrn printf, printf_color;
    extrn BLUE;
    extrn getcwd, chdir;

    auto buf 50, before 50;

    printf_color(BLUE, "\nTesting getcwd()\n");
    getcwd(before, 50);
    printf("before: %s\n", before);
    chdir("/");
    getcwd(buf, 50);
    printf("after: %s\n", buf);
    
    chdir(before);

}

/*
    change uid for different system
*/
test_chown() {
    extrn chown, execl, putchar, printf_color, assert, printf;
    /* added a arbitrary user John with uid 1002 */
    auto code;
    
    printf_color(BLUE, "\nTesting chown():\n");
    code = chown("/home/jacob/B/test_file", 1002);
    printf("chown code: %d\n", code);
    assert(code == 0);
    code = execl("/bin/ls", "ls", "-l", 0);
    chown("/root/B/test_file", 0);
    putchar('\n');
}

test_file_operations() {
    extrn open, close, write, creat, printf, putchar, assert;
    extrn printf_color, unlink;
    auto fd, code;

    printf_color(BLUE, "\nTesting file operations:\n");
    printf_color(BLUE, "Testing creat():\n");
    code = creat("./test_file", 0644); /* O_CREAT | O_WRONLY | 
    O_TRUNC */
    printf("creat code: %d\n", code);

    fd = open("./test_file", 0666);
    printf("fd: %d\n", fd);
    assert(fd >= 0);
    putchar('\n');

    printf_color(BLUE, "Testing write():\n");
    code = write(fd, "test file content\n", 18);
    printf("number of char written or neg error code: [%d]\n", code);
    assert(code >= 0);
    putchar('\n');

    code = close(fd);
    assert(code == 0);

    /* test unlink */
    printf_color(BLUE, "Testing unlink():\n");
    code = unlink("./test_file");
    assert(code == 0);

}

test_execl() {
    auto code;
    extrn execl, printf, printf_color, BLUE;

    printf_color(BLUE, "\nTesting execl():\n");
    code = execl("/bin/ls", "ls", "-l", 0);
    printf("execl returned: %d\n", code);
}

test_execv() {
    auto code;
    extrn execv, printf, printf_color, BLUE, execv_args;

    printf_color(BLUE, "\nTesting execv():\n");
    
    code = execv("/bin/ls", execv_args, 2);
    printf("execv returned: %d\n", code);
}

/* only run either one for testing */

test_exec() {
    extrn test_execl, test_execv, printf_color, BLUE;
    
    printf_color(BLUE, "\nTesting exec functions (only one at a time):\n");
    test_execl();
    test_execv();
}

test_fork() {
    auto pid, status;
    extrn fork, getpid, wait, exit, printf_color, assert;
    extrn printf, execv_args, execv;
    
    printf_color(BLUE, "\nTesting fork():\n");
    pid = fork();

    assert(pid >= 0);
    if (pid == 0) {
        printf("inside child. pid: %d\n", getpid());
        status = execv("/bin/ls", execv_args, 2);
        printf("execv failed in child process\n");
        exit(status);
    } else {
        printf("inside parent. pid: %d\n", getpid());
        printf("child pid: %d\n", pid);
        pid = wait(&status);
        printf("wait returned pid: %d, status: %d\n", pid, status);
    }
}

test_fstat() {
    auto fd, status 20;

    extrn fstat, printf_color, BLUE, printf, assert;
    extrn creat;
    printf_color(BLUE, "\nTesting fstat():\n");

    fd = creat("./test_perm", 0644);
    assert(fd >= 0);

    fstat(fd, status);
    printf("ino_t: %d\n", status[1]);
    printf("mode_t: %o\n", status[2] & 0777);
    assert((status[2] & 0777) == 0644);
}

test_getchar() {
    auto c;
    extrn getchar, printf_color, BLUE, putchar;

    printf_color(BLUE, "\nTesting getchar():\n");

    c = getchar();
    while (c != -1) {
        putchar(c);
        c = getchar();
    }
}

test_getuid() {
    auto uid;
    extrn getuid, printf_color, BLUE, printf, assert;

    printf_color(BLUE, "\nTesting getuid():\n");
    uid = getuid();
    printf("getuid(): %d\n", uid);
    /* assert(uid >= 0); */
}

test_gtty() {
    extrn gtty, printf_color, BLUE, printf, assert, open, O_RDWR;
    auto status 12;

    printf_color(BLUE, "\nTesting gtty():\n");
    /* gtty is a no-op in modern systems */
    assert(gtty(0, status) == 0);
    
    printf_color(BLUE, "Printing stdin tty status:\n");
    printf("input speed: %d\n", status[0]);

    printf("output speed: %d\n", status[1]);

    printf("flags: %d\n", status[2]);

    auto fd;
    fd = open("/dev/tty", O_RDWR);
    assert(fd >= 0);
    gtty(fd, status);
    printf_color(BLUE, "Printing /dev/tty status:\n");
    printf("input speed: %d\n", status[0]);
    printf("output speed: %d\n", status[1]);
    printf("flags: %d\n", status[2]);

}

test_runner(functions) {
    extrn printf, printf_color, BLUE, GREEN;
    extrn assert;

    auto i, func_ptr;
    printf_color(BLUE, "\nRunning tests:\n");

    i = 0;
    func_ptr = functions;
    while ((*(&functions + i * 4)) != 0) {
        (*(&functions + i * 4))();
        printf_color(GREEN, "Test %d: OK\n", i + 1);
        i++;
    }
    
    printf_color(BLUE, "All tests completed successfully.\n");
}

main() {
    extrn printf, putchar, char, assert;
    extrn RED, GREEN, BLUE;

    /* tests */
    extrn test_printf, test_char, test_time, exit, test_exec, test_runner;
    extrn test_chdir, test_file_operations, test_chown, test_fork;
    extrn test_fstat;

    test_runner(
        test_char,
        test_chdir,
        test_file_operations,
        test_printf,
        test_time,
        test_fork,
        test_fstat,
        test_getchar,
        test_getuid,
        test_gtty,
        0
    );
        /* test_exec, */
        /* test_chown, */
        /* exit(1); */

    return ;
}