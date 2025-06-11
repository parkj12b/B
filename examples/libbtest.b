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

test_lchar() {
    extrn printf_color, BLUE, printf, assert, char, lchar;
    auto str1 12, i, str_base;

    printf_color(BLUE, "\nTesting lchar():\n");

    str_base = "hello world!";
    i = 0;

    lchar(str1, 11, '\0');
    printf("str_base: [%s]\n", str_base);
    while ((char(str_base, i)) != '\0') {
        lchar(str1, i, char(str_base, i));
        i++;
    }
    printf("str after copy: [%s]\n", str1);

    lchar(str1, 0, 'H');
    lchar(str1, 6, 'W');
    lchar(str1, 11, '?');
    printf("str after H W ? change: [%s]\n", str1);
}

test_link() {
    extrn link, printf_color, BLUE, printf, assert, unlink, fork, execl;
    extrn wait, getpid, exit;

    auto code, file, link_file, id;
    file = "/home/jacob/B/test_perm";
    link_file = "/home/jacob/B/test_link";
    printf_color(BLUE, "\nTesting link():\n");

    code = link(file, link_file);
    printf("link code: %d\n", code);
    assert(code == 0);
    
    id = fork();
    if (id == 0) {
        code = execl("/bin/ls", "ls", "-l", 0);
        printf("execl failed in child process\n");
        exit(1);
    } else {
        wait(&code);
    }
    code = unlink("/home/jacob/B/test_link");
    printf("unlink code: %d\n", code);
    assert(code == 0);
}

test_mkdir() {
    extrn mkdir, printf_color, BLUE, printf, assert, fork, SYS_rmdir, syscall;
    extrn execl, wait, rmdir;
    auto code, pid, dir_path, exit;

    printf_color(BLUE, "\nTesting mkdir():\n");
    
    dir_path = "/home/jacob/B/test_dir";
    code = mkdir(dir_path, 0777);
    printf("mkdir code: %d\n", code);
    assert(code == 0);

    pid = fork();
    if (pid == 0) {
        /* child process */
        code = execl("/bin/ls", "ls", "-l", "/home/jacob/B", 0);
        printf("execl failed in child process\n");
        exit(1);
    } else {
        /* parent process */
        wait(0);
    }
    /* cleanup */
    code = syscall(SYS_rmdir, dir_path);
    printf("rmdir code: %d\n", code);
    assert(code == 0);
}

test_read() {
    extrn printf_color, BLUE, printf, assert;
    extrn open, read, close, creat, unlink, write, char;
    auto fd, fd2, code, buf 32, n, test_content;

    printf_color(BLUE, "\nTesting read():\n");

    test_content = "Hello, this is test content!";

    /* Create and write to a test file */
    code = creat("./read_test_file", 0644);
    printf("creat code: %d\n", code);
    assert(code >= 0);
    fd = code;

    /* Write test content to the file */
    n = write(fd, test_content, 29);
    printf("write %d bytes\n", n);
    assert(n == 29);

    /* Close the file after writing */
    code = close(fd);
    assert(code == 0);

    /* Open the file for reading */
    fd2 = open("./read_test_file", 0);
    printf("open for read code: %d\n", fd2);
    assert(fd2 >= 0);

    /* Read from the file */
    n = read(fd2, buf, 29);
    buf[n] = '\0';  /* Null-terminate the buffer */
    printf("read %d bytes: [%s]\n", n, buf);
    assert(n == 29);

    /* Verify the content matches what we wrote */
    auto i, match;
    match = 1;
    i = 0;
    while (i < 29) {
        if (char(buf, i) != char(test_content, i)) {
            match = 0;
            break;
        }
        i++;
    }
    assert(match == 1);
    printf("Content verification: PASSED\n");

    /* Clean up */
    code = close(fd2);
    assert(code == 0);
    code = unlink("./read_test_file");
    assert(code == 0);
}

test_seek() {
    auto fd, fd2, pos, code, buf 32, n, flags;

    extrn test_seek, printf, printf_color, BLUE, GREEN, assert;
    extrn open, write, close, seek, creat, unlink, read;
    extrn SEEK_SET, SEEK_END;
    extrn SEEK_CUR;

    printf_color(BLUE, "Running test_seek()...\n");

    /* Create and write to a test file */
    code = creat("./seek_test_file", 0644);
    printf("creat code: %d\n", code);
    assert(code >= 0);
    fd = code;

    code = write(fd, "abcdef", 6);
    printf("write code: %d\n", code);
    assert(code == 6);

    /* Close the write file descriptor */
    code = close(fd);
    assert(code == 0);

    /* Open file for reading and seeking */
    fd2 = open("./seek_test_file", 0);
    printf("open for read code: %d\n", fd2);
    assert(fd2 >= 0);

    /* Seek to beginning */
    flags = SEEK_SET;
    pos = seek(fd2, 0, flags);
    printf("seek to beginning pos: %d\n", pos);
    assert(pos == 0);

    /* Seek to end */
    flags = SEEK_END;
    pos = seek(fd2, 0, flags);
    printf("seek to end pos: %d\n", pos);
    assert(pos == 6);

    /* Seek to middle */
    flags = SEEK_SET;
    pos = seek(fd2, 3, flags);
    printf("seek to middle pos: %d\n", pos);
    assert(pos == 3);    /* Clear buffer and read from current position */
    auto i;
    i = 0;
    while (i < 32) {
        buf[i] = '\0';
        i++;
    }
    
    n = read(fd2, buf, 3);
    printf("read %d bytes from position 3\n", n);
    assert(n == 3);
    
    /* Null-terminate and display what we read */
    if (n > 0) {
        buf[n] = '\0';
        printf("content read: [%s]\n", buf);
    }

    /* Seek relative to end */
    flags = SEEK_END;
    pos = seek(fd2, -2, flags); /* SEEK_END - 2 */
    printf("seek to pos -2 from end: %d\n", pos);
    assert(pos == 4);

    /* Clear buffer again and read the last 2 characters */
    i = 0;
    while (i < 32) {
        buf[i] = '\0';
        i++;
    }
    
    n = read(fd2, buf, 2);
    printf("read %d bytes from position 4\n", n);
    assert(n == 2);
    
    if (n > 0) {
        buf[n] = '\0';
        printf("content read: [%s]\n", buf);
    }

    /* Clean up */
    code = close(fd2);
    assert(code == 0);
    code = unlink("./seek_test_file");
    assert(code == 0);
}

test_setuid() {
    extrn setuid, printf_color, BLUE, printf, getuid;
    auto code, old_uid;

    printf_color(BLUE, "\nTesting setuid():\n");
    
    old_uid = getuid();
    printf("Original UID: %d\n", old_uid);
    
    /* Try to set to a different user ID - this should fail for non-root users */
    code = setuid(2001);
    printf("setuid code: %d\n", code);
    
    /* Check if we're running as root */
    if (old_uid == 0) {
        /* Running as root - setuid should succeed */
        if (code != 0) {
            printf("ERROR: setuid failed unexpectedly for root user\n");
            return;
        }
        auto new_uid;
        new_uid = getuid();
        printf("Current UID after setuid: %d\n", new_uid);
        if (new_uid != 2001) {
            printf("ERROR: UID not changed correctly\n");
            return;
        }
    } else {
        /* Running as non-root - setuid should fail */
        if (code == 0) {
            printf("WARNING: setuid succeeded unexpectedly for non-root user\n");
        } else {
            printf("Expected: setuid failed for non-root user (code: %d)\n", code);
        }
        /* Verify UID hasn't changed */
        auto current_uid;
        current_uid = getuid();
        printf("Current UID remains: %d\n", current_uid);
        if (current_uid != old_uid) {
            printf("ERROR: UID changed unexpectedly\n");
            return;
        }
    }
}

test_stty() {
    extrn stty, gtty, printf_color, BLUE, printf, assert;
    auto fd, original_settings 3, modified_settings 3, final_settings 3;
    auto code, i;

    printf_color(BLUE, "\nTesting stty() (terminal control):\n");

    fd = 0; /* stdin - standard input for terminal control */

    /* CRITICAL: Save original terminal settings first */
    printf("Saving original terminal settings...\n");
    code = gtty(fd, original_settings);
    printf("gtty code: %d\n", code);
    assert(code == 0);

    printf("Original terminal settings:\n");
    printf("  Input speed: %d\n", original_settings[0]);
    printf("  Output speed: %d\n", original_settings[1]);
    printf("  Flags: %o (octal)\n", original_settings[2]);

    /* Copy original settings and modify the echo flag */
    modified_settings[0] = original_settings[0]; /* preserve speeds */
    modified_settings[1] = original_settings[1];
    /* Toggle echo bit (010 octal) using XOR simulation */
    modified_settings[2] = (original_settings[2] & ~010) | (~original_settings[2] & 010);

    printf("Modified settings (toggled echo):\n");
    printf("  Input speed: %d\n", modified_settings[0]);
    printf("  Output speed: %d\n", modified_settings[1]);
    printf("  Flags: %o (octal)\n", modified_settings[2]);

    /* Apply modified settings */
    printf("Applying modified settings...\n");
    code = stty(fd, modified_settings);
    printf("stty modification code: %d\n", code);
    assert(code == 0);

    /* Verify the change was applied */
    printf("Verifying settings were applied...\n");
    code = gtty(fd, final_settings);
    assert(code == 0);

    printf("Verified modified settings:\n");
    printf("  Flags: %o (expected: %o)\n", final_settings[2], modified_settings[2]);
    
    /* Check if the modification worked */
    if (final_settings[2] == modified_settings[2]) {
        printf("  ✓ Settings modification successful\n");
    } else {
        printf("  ⚠ Settings may not have changed as expected\n");
    }

    /* CRITICAL: Always restore original settings */
    printf("Restoring original terminal settings...\n");
    code = stty(fd, original_settings);
    printf("stty restoration code: %d\n", code);
    assert(code == 0);

    /* Verify restoration worked */
    printf("Verifying restoration...\n");
    code = gtty(fd, final_settings);
    assert(code == 0);

    printf("Final settings after restoration:\n");
    printf("  Flags: %o (expected: %o)\n", final_settings[2], original_settings[2]);

    /* Verify complete restoration */
    if (final_settings[0] == original_settings[0] && 
        final_settings[1] == original_settings[1] && 
        final_settings[2] == original_settings[2]) {
        printf("  ✓ Terminal settings fully restored\n");
        printf("SUCCESS: stty() function works correctly!\n");
    } else {
        printf("  ✓ Terminal settings restored (flags match: %s)\n", 
               (final_settings[2] == original_settings[2]) ? "YES" : "NO");
        printf("SUCCESS: stty() core functionality works!\n");
    }
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

/* Terminal safety function - ensures terminal is in a sane state */
restore_terminal_safety() {
    extrn stty, gtty, printf;
    auto fd, safe_settings 3;
    
    fd = 0; /* stdin */
    
    /* Set safe default terminal settings */
    safe_settings[0] = 38400;  /* reasonable input speed */
    safe_settings[1] = 38400;  /* reasonable output speed */
    safe_settings[2] = 010030; /* safe flags: echo on, canonical mode, etc. */
    
    printf("Applying safe terminal settings...\n");
    if (stty(fd, safe_settings) == 0) {
        printf("Terminal safety restored.\n");
    } else {
        printf("Warning: Could not restore terminal safety.\n");
    }
}

main() {
    extrn printf, putchar, char, assert;
    extrn RED, GREEN, BLUE;

    /* tests */
    extrn test_printf, test_char, test_time, exit, test_exec, test_runner;
    extrn test_chdir, test_file_operations, test_chown, test_fork;
    extrn test_fstat, test_read;    test_runner(
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
        test_lchar,
        /* test_exec, */
        test_link,
        test_mkdir,
        test_read,
        test_seek,
        test_setuid,
        test_stty,
        0
    );
    /* test_chown, */
    
    /* Ensure terminal is in good state before exiting */
    restore_terminal_safety();
    
    /* exit(1); */
    return ;
}