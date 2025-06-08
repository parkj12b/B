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
SYS_unlink		10;		/* unlink */
SYS_ftruncate	93;		/* ftruncate */
SYS_chown 		182;	/* chown */
SYS_getcwd 		183;	/* getcwd */
SYS_mmap 		192;	/* mmap2 - try the newer mmap2 syscall */
SYS_futex 		240;	/* futex */

/* SIGNALS */
SIGABRT 6;	/* abort */

/* file open flags */
O_RDONLY 0;		/* read only */
O_WRONLY 1;		/* write only */
O_RDWR 2;		/* read/write */
O_CREAT 64;		/* create if not exists (0100 octal = 64 decimal) */
O_TRUNC 512;	/* truncate file to zero length (01000 octal = 512 decimal) */

/* mutex */
PROT_READ 1;		/* read permission */
PROT_WRITE 2;		/* write permission */
MAP_SHARED 1;		/* shared mapping */
MAP_PRIVATE 2;		/* private mapping */
MAP_ANONYMOUS 32;	/* anonymous mapping */

/* source code */

/* assembly prototypes */

/* compare_and_exchange(ptr, oldval, newval); */

init_mutex(ptr) {
	extrn open, ftruncate, close, mmap, O_RDWR, O_CREAT, O_TRUNC;
	extrn PROT_READ, PROT_WRITE, MAP_SHARED;
	auto fd, mmap_result;

	/* Create shared memory file in /dev/shm for strace comparison */
	fd = open("/dev/shm/b_mutex", O_RDWR | O_CREAT | O_TRUNC, 0666);
	if (fd < 0) {
		return (-1);
	}
	
	/* Set file size */
	if (ftruncate(fd, 4096) < 0) {
		close(fd);
		return (-1);
	}
		/* Map the file into memory - ensure offset is explicitly 0 */
	mmap_result = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	close(fd);
	
	if (mmap_result == -1) {
		return (-1);
	}
	*ptr = mmap_result;
	return ;
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
open(file, mode, perms) {
	extrn syscall, SYS_open;
	return (syscall(SYS_open, file, mode, perms));
}

close(file) {
	extrn syscall, SYS_close;
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
	extrn syscall, SYS_mmap;
	/* For mmap2 syscall, offset must be in page units (4096 bytes) */
	/* Since we always pass 0, this should be safe */
	return (syscall(SYS_mmap, addr, length, prot, flags, fd, offset / 4096));
}

ftruncate(fd, length) {
	extrn syscall, SYS_ftruncate;
	return (syscall(SYS_ftruncate, fd, length));
}

unlink(pathname) {
	extrn syscall, SYS_unlink;
	return (syscall(SYS_unlink, pathname));
}