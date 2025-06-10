/* header section */

True 1;
False 0;
NULL 0;

/* x86_32 syscalls */
SYS_exit 		1;		/* exit */
SYS_fork 		2;		/* fork */
SYS_read 		3;		/* read */
SYS_write 		4;		/* write */
SYS_open 		5;		/* open */
SYS_close 		6;		/* close */
SYS_waitpid		7;		/* waitpid */
SYS_creat 		8;		/* creat */
SYS_unlink		10;		/* unlink */
SYS_execve 		11;		/* execve */
SYS_chdir 		12;		/* chdir */
SYS_time 		13;		/* time */
SYS_chmod 		15;		/* chmod */
SYS_getpid 		20;		/* getpid */
SYS_kill 		37; 	/* kill */
SYS_ioctl 		54;		/* ioctl */
SYS_ftruncate	93;		/* ftruncate */
SYS_oldfstat	108;	/* oldfstat */
SYS_getcwd 		183;	/* getcwd */
SYS_mmap 		192;	/* mmap2 */
SYS_getuid32 	199;	/* getuid32 */
SYS_chown32 	212;	/* chown32 */
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

/* ioctl commands */
TCGETS 21505;
TIOCGWINSZ 21523;	/* get window size */

/* assembly prototypes */
/* compare_and_exchange(ptr, oldval, newval); */

init_mutex(ptr) {
	extrn open, ftruncate, close, mmap, creat, printf_internal, assert;
	extrn chmod; 
	extrn O_RDWR, O_CREAT, O_TRUNC, PROT_READ, PROT_WRITE, MAP_SHARED;
	auto fd, mmap_result;

	fd = creat("mutex_file", 0666);
	assert(fd >= 0); /* Ensure file was created successfully */
	close(fd);
	chmod("mutex_file", 0666);
	fd = open("mutex_file", O_RDWR);

	/* Set file size */
	if (ftruncate(fd, 4096) < 0) {
		close(fd);
		return (-1);
	}
		/* Map the file into memory - ensure offset is explicitly 0 */
	mmap_result = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	close(fd);
	
	assert(mmap_result != -1); /* Ensure mmap was successful */
	*ptr = mmap_result;
	return ;
}


/* stdlib */

putchar(c) {
	extrn syscall, SYS_write;
	return (syscall(SYS_write, 1, &c, 1));
}

char(s, i) {
	return (*(s + i) & 255);
}

chdir(dir) {
	extrn syscall, SYS_chdir;
	syscall(SYS_chdir, dir);
}

chmod(file, mode) {
	extrn syscall, SYS_chmod;
	syscall(SYS_chmod, file, mode);
}

chown(file, owner) {
	extrn syscall, SYS_chown;
	syscall(SYS_chown32, file, owner, -1);
}

/* file operations */
open(file, mode) {
	extrn syscall, SYS_open;
	return (syscall(SYS_open, file, mode));
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

unlink(pathname) {
	extrn syscall, SYS_unlink;
	return (syscall(SYS_unlink, pathname));
}

fstat(fd, status) {
	extrn syscall, SYS_oldfstat;
	return (syscall(SYS_oldfstat, fd, status));
}

getchar() {
	extrn syscall, SYS_read;
	auto c;
	c = 0;
	syscall(SYS_read, 0, &c, 1);
	if (c == 0)
		return (-1);
	return (c & 255);
}

/* always successful */
getuid() {
	extrn syscall, SYS_getuid32;
	return (syscall(SYS_getuid32));
}

/* 3 word = originally 3 byte */
gtty(fd, ttystat) {
	extrn syscall, SYS_ioctl, TCGETS;
	extrn TABDLY, INPCK, ICANON, ICRNL, ONLCR, ECHO, IUCLC, PARODD, TAB3, TAB0;
	auto v 15, iflag, oflag, cflag, lflag;
	/* This is a no-op in modern systems, but we can use oldfstat */
	if (syscall(SYS_ioctl, fd, TCGETS, v) == -1) {
		return (-1);
	}

	ttystat[0] = v[13]; /* input speed */
	ttystat[1] = v[14]; /* output speed */
	ttystat[2] = 0;  /* c_iflag */
	
	iflag = v[0]; /* c_iflag */
	oflag = v[1]; /* c_oflag */
	cflag = v[2]; /* c_cflag */
	lflag = v[3]; /* c_lflag */

	if ((oflag & TABDLY) == TAB0)
		ttystat[2] =| 010000;
    if ((iflag & INPCK) & !(cflag & PARODD))
		ttystat[2] =| 0200;
    if ((iflag & INPCK) & (cflag & PARODD))
		ttystat[2] =| 0100;
    if (!(lflag & ICANON))    
		ttystat[2] =| 040;
    if ((iflag & ICRNL) | (oflag & ONLCR))
		ttystat[2] =| 020;
    if (lflag & ECHO)
		ttystat[2] =| 010;
    if (iflag & IUCLC)
		ttystat[2] =| 004;
    if ((lflag & ECHO) & (oflag & TAB3))
		ttystat[2] =| 002;
}

/* helpers */

ftruncate(fd, length) {
	extrn syscall, SYS_ftruncate;
	return (syscall(SYS_ftruncate, fd, length));
}

mmap(addr, length, prot, flags, fd, offset) {
	extrn syscall, SYS_mmap;
	/* For mmap2 syscall, offset must be in page units (4096 bytes) */
	/* Since we always pass 0, this should be safe */
	return (syscall(SYS_mmap, addr, length, prot, flags, fd, offset / 4096));
}

getcwd(buf, size) {
	extrn syscall, SYS_getcwd;
	syscall(SYS_getcwd, buf, size);
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
