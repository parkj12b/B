/* header section */

True 1;
False 0;
NULL 0;

/* x86_32 syscalls */
SYS_exit 		1;		/* exit */
SYS_fork 		2;		/* fork */
SYS_write 		4;		/* write */
SYS_open 		5;		/* open */
SYS_close 		6;		/* close */
SYS_waitpid		7;		/* waitpid */
SYS_creat 		8;		/* creat */
SYS_execve 		11;		/* execve */
SYS_chdir 		12;		/* chdir */
SYS_time 		13;		/* time */
SYS_getpid 		20;		/* getpid */
SYS_kill 		37; 	/* kill */
SYS_ftruncate	93;		/* ftruncate */
SYS_getcwd 		183;	/* getcwd */
SYS_chown 		182;	/* chown */
SYS_mmap2 		192;	/* mmap2 */

/* SIGNALS */
SIGABRT 6;	/* abort */

/* mutex */
PROT_READ 1;		/* read permission */
PROT_WRITE 2;		/* write permission */
MAP_SHARED 1;		/* shared mapping */
MAP_PRIVATE 2;		/* private mapping */
MAP_ANONYMOUS 32;	/* anonymous mapping */

/* source code */
futex_ptr;

/* assembly prototypes */

/* compare_and_exchange(ptr, oldval, newval); */

printf_flag 0;
printf_mutex_str "printf_mutex";

init_mutex() {
	extrn open, snprintf, ftruncate, printf_mutex_str, PROT_READ, PROT_WRITE;
	auto name 50, fd;

	snprintf(name, 50, "%s%d", "/dev/shm/", printf_mutex_str);
	fd = open(name, PROT_READ | PROT_WRITE, 0666);
	if (fd == -1) {
		return -1; // Error creating futex
	}

	if (ftruncate(fd, 4) == -1) {
		printf("ftruncate failed\n");
		exit(1);
	}
	*futex_ptr = mmap(NULL, 4, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (futex_ptr == -1) {
		printf("mmap failed\n");
		exit(1);
	}
	close(fd);

}

putchar(c) {
	extrn syscall, SYS_write;
	return (syscall(SYS_write, 1, &c, 1));
}

getpid() {
	extrn syscall, SYS_getpid;
	return (syscall(SYS_getpid));
}

raise(sig) {
	extrn syscall, getpid, SYS_kill;
	syscall(SYS_kill, getpid(), sig);
}

assert(a) {
	extrn printf, SIGABRT, raise;
	if (a)
		return ;
	printf("assert failure\n");
	raise(SIGABRT); /* SIGABRT */
}

/* stdlib */

char(s, i) {
	return (*(s + i) & 255);
}

chdir(dir) {
	extrn syscall, SYS_chdir;
	syscall(SYS_chdir, dir);
}

getcwd(buf, size) {
	extrn syscall, SYS_getcwd;
	syscall(SYS_getcwd, buf, size);
}

chown(file, owner) {
	extrn syscall, SYS_chown;
	syscall(SYS_chown, file, owner, -1);
}

/* file operations */
open(file, mode) {
	extrn syscall, SYS_open;
	return (syscall(SYS_open, file, mode));
}

close(file) {
	extrn syscall, SYS_open;
	syscall(SYS_close, file);
}

creat(s, mode) {
	extrn syscall, SYS_creat;
	syscall(SYS_creat, s, mode);
}

write(file, buf, size) {
	extrn syscall, SYS_write;
	return (syscall(SYS_write, file, buf, size));
}

ctime(time, date) {

}

time(timev) {
	extrn syscall, SYS_time;
	syscall(SYS_time, timev);
}

execl(string, args) {
	extrn syscall, NULL, SYS_execve;
	syscall(SYS_execve, string, &args, NULL);
}


execv(string, args, count) {
	extrn syscall, SYS_execve;
	syscall(SYS_execve, string, args, NULL);
}

exit(numerr) {
	extrn syscall, SYS_exit;
	syscall(SYS_exit, numerr);
}

fork() {
	extrn syscall, SYS_fork;
	return (syscall(SYS_fork));
}

wait(status) {
	extrn syscall, SYS_waitpid;
	return (syscall(SYS_waitpid, -1, status, 0));
}

mmap(addr, length, prot, flags, fd, offset) {
	extrn syscall, SYS_mmap2;
	return (syscall(SYS_mmap2, addr, length, prot, flags, fd, offset));
}

ftruncate(fd, length) {
	extrn syscall, SYS_ftruncate;
	return (syscall(SYS_ftruncate, fd, length));
}