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
SYS_link 		9;		/* link */
SYS_unlink		10;		/* unlink */
SYS_execve 		11;		/* execve */
SYS_chdir 		12;		/* chdir */
SYS_time 		13;		/* time */
SYS_chmod 		15;		/* chmod */
SYS_lseek 		19;		/* lseek */
SYS_getpid 		20;		/* getpid */
SYS_gtty 		31;		/* gtty */
SYS_stty 		32;		/* stty */
SYS_kill 		37; 	/* kill */
SYS_mkdir		39;		/* mkdir */
SYS_rmdir		40;		/* rmdir */
SYS_ioctl 		54;		/* ioctl */
SYS_ftruncate	93;		/* ftruncate */
SYS_stat 		106;	/* stat */
SYS_oldfstat	108;	/* oldfstat */
SYS_getcwd 		183;	/* getcwd */
SYS_mmap 		192;	/* mmap2 */
SYS_getuid32 	199;	/* getuid32 */
SYS_chown32 	212;	/* chown32 */
SYS_setuid32	213;		/* setuid */
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
TCSETS 21506;
TIOCGWINSZ 21523;	/* get window size */

/* seek options */
SEEK_SET 	0;		/* set position to offset */
SEEK_CUR 	1;		/* set position to current plus offset */
SEEK_END 	2;		/* set position to end of file plus offset */
SEEK_DATA 	3;	/* set position to next data byte */
SEEK_HOLE 	4;	/* set position to next hole in file */


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
	extrn convert_speed_to_baud, printf;
	auto v 15, iflag, oflag, cflag, lflag;
	/* This is a no-op in modern systems, but we can use oldfstat */	if (syscall(SYS_ioctl, fd, TCGETS, v) == -1) {
		return (-1);
	}		/* Debug: print raw values before conversion - disabled for clean output */
	/* printf("DEBUG: fd=%d, raw speeds: v[13]=%d, v[14]=%d\n", fd, v[13], v[14]); */

	/* Convert speed constants to actual baud rates */
	ttystat[0] = convert_speed_to_baud(v[13]); /* input speed */
	ttystat[1] = convert_speed_to_baud(v[14]); /* output speed */
	
	/* Debug: print converted values - disabled for clean output */
	/* printf("DEBUG: converted speeds: input=%d, output=%d\n", ttystat[0], ttystat[1]); */
	
	ttystat[2] = 0;  /* flags - will be set below */
	
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

/* Convert termios speed constant to actual baud rate */
convert_speed_to_baud(speed_const) {	/* Handle negative values (unsigned speeds that appear negative in B) */
	if (speed_const < 0) {
		/* Negative speed constant indicates unsigned overflow, default to 38400 */
		return (38400);
	}
	
	/* Bounds checking for safety - handle unreasonably large speed constants */
	if (speed_const > 1000000) {
		/* Clearly invalid speed constant, default to 38400 */
		return (38400);
	}
	
	/* Standard termios speed constants to baud rates */
	if (speed_const == 0) return (0);        /* B0 - hang up */
	if (speed_const == 1) return (50);       /* B50 */
	if (speed_const == 2) return (75);       /* B75 */
	if (speed_const == 3) return (110);      /* B110 */
	if (speed_const == 4) return (134);      /* B134 */
	if (speed_const == 5) return (150);      /* B150 */
	if (speed_const == 6) return (200);      /* B200 */
	if (speed_const == 7) return (300);      /* B300 */
	if (speed_const == 8) return (600);      /* B600 */
	if (speed_const == 9) return (1200);     /* B1200 */
	if (speed_const == 10) return (1800);    /* B1800 */
	if (speed_const == 11) return (2400);    /* B2400 */
	if (speed_const == 12) return (4800);    /* B4800 */
	if (speed_const == 13) return (9600);    /* B9600 */
	if (speed_const == 14) return (19200);   /* B19200 */
	if (speed_const == 15) return (38400);   /* B38400 */
	if (speed_const == 4097) return (57600); /* B57600 */
	if (speed_const == 4098) return (115200); /* B115200 */
		/* For unknown but reasonable constants, default to 38400 */
	return (38400);
}

/* Convert baud rate back to termios speed constant */
convert_baud_to_speed(baud_rate) {
	/* Standard baud rates to termios speed constants */
	if (baud_rate == 0) return (0);        /* B0 - hang up */
	if (baud_rate == 50) return (1);       /* B50 */
	if (baud_rate == 75) return (2);       /* B75 */
	if (baud_rate == 110) return (3);      /* B110 */
	if (baud_rate == 134) return (4);      /* B134 */
	if (baud_rate == 150) return (5);      /* B150 */
	if (baud_rate == 200) return (6);      /* B200 */
	if (baud_rate == 300) return (7);      /* B300 */
	if (baud_rate == 600) return (8);      /* B600 */
	if (baud_rate == 1200) return (9);     /* B1200 */
	if (baud_rate == 1800) return (10);    /* B1800 */
	if (baud_rate == 2400) return (11);    /* B2400 */
	if (baud_rate == 4800) return (12);    /* B4800 */
	if (baud_rate == 9600) return (13);    /* B9600 */
	if (baud_rate == 19200) return (14);   /* B19200 */
	if (baud_rate == 38400) return (15);   /* B38400 */
	if (baud_rate == 57600) return (4097); /* B57600 */
	if (baud_rate == 115200) return (4098); /* B115200 */
	
	/* For unknown baud rates, default to 9600 */
	return (13); /* B9600 */
}

lchar(string, i, char) {
	*(string + i) =& ~255;
	*(string + i) =| (char & 255);
}

link(oldpath, newpath) {
	extrn syscall, SYS_link;
	return (syscall(SYS_link, oldpath, newpath));
}

mkdir(pathname, mode) {
	extrn syscall, SYS_mkdir;
	/* mode is ignored in modern systems */
	return (syscall(SYS_mkdir, pathname, 0777));
}

read(fd, buffer, count) {
	extrn syscall, SYS_read;
	return (syscall(SYS_read, fd, buffer, count));
}

seek(fd, offset, ptr) {
	extrn syscall, SYS_lseek;
	return (syscall(SYS_lseek, fd, offset, ptr));
}

/* only changes uid for the duration of the process */
setuid(uid) {
	extrn syscall, SYS_setuid32;
	return (syscall(SYS_setuid32, uid));
}

stat(pathname, statbuf) {
	extrn syscall, SYS_stat;
	return (syscall(SYS_stat, pathname, statbuf));
}

stty(fd, ttystat) {
	extrn syscall, SYS_ioctl, TCGETS, TCSETS;
	extrn TABDLY, INPCK, ICANON, ICRNL, ONLCR, ECHO, IUCLC, PARODD, TAB3, TAB0;
	extrn convert_baud_to_speed;
	auto v 15, iflag, oflag, cflag, lflag, flags;
	
	/* First get current terminal settings */
	if (syscall(SYS_ioctl, fd, TCGETS, v) == -1) {
		return (-1);
	}
	
	/* Extract the flag bits from ttystat[2] (the old-style flags) */
	flags = ttystat[2];
	
	/* Get current flag values */
	iflag = v[0]; /* c_iflag */
	oflag = v[1]; /* c_oflag */
	cflag = v[2]; /* c_cflag */
	lflag = v[3]; /* c_lflag */
	
	/* Clear the flags we're going to set based on old-style format */
	iflag =& ~(INPCK | ICRNL | IUCLC);
	oflag =& ~(TABDLY | ONLCR);
	cflag =& ~(PARODD);
	lflag =& ~(ICANON | ECHO);
	
	/* Convert old-style flags back to modern termios flags */
	if (flags & 010000) /* TAB0 mode */
		oflag =| TAB0;
	else
		oflag =| TAB3; /* default to TAB3 (expand tabs) */
		
	if (flags & 0200) /* even parity */
		iflag =| INPCK;
		
	if (flags & 0100) /* odd parity */ {
		iflag =| INPCK;
		cflag =| PARODD;
	}
		
	if (!(flags & 040)) /* canonical mode (opposite of raw) */
		lflag =| ICANON;
		
	if (flags & 020) { /* CR/LF mapping */
		iflag =| ICRNL;
		oflag =| ONLCR;
	}
		
	if (flags & 010) /* echo */
		lflag =| ECHO;
		
	if (flags & 004) /* uppercase/lowercase mapping */
		iflag =| IUCLC;
		
	if (flags & 002) { /* tab echo (requires both echo and TAB3) */
		lflag =| ECHO;
		oflag =| TAB3;
	}
	/* Set the speeds from ttystat[0] and ttystat[1] 
	   Convert baud rates back to speed constants */
	v[13] = convert_baud_to_speed(ttystat[0]); /* input speed */
	v[14] = convert_baud_to_speed(ttystat[1]); /* output speed */
	
	/* Update the flag values */
	v[0] = iflag;
	v[1] = oflag;
	v[2] = cflag;
	v[3] = lflag;
	
	/* Apply the new settings */
	return (syscall(SYS_ioctl, fd, TCSETS, v));
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
