#include <stdio.h>
#include <termios.h> // For termios functions and structure
#include <unistd.h>	 // For STDIN_FILENO and other POSIX functions
#include <errno.h>	 // For errno
#include <string.h>	 // For strerror
#include <sys/ioctl.h> // For ioctl functions

int main()
{
	printf("%d\n", TCGETS);
	printf("%d\n", TIOCGWINSZ);
	
	if ((termios_buf.c_oflag & TABDLY) == TAB0) ttystat->sg_flags |= 010000; // no tab delays
	if ((termios_buf.c_iflag & INPCK) &&
		!(termios_buf.c_cflag & PARODD))
		ttystat->sg_flags |= 0200; // even parity
	if ((termios_buf.c_iflag & INPCK) &&
		(termios_buf.c_cflag & PARODD))
		ttystat->sg_flags |= 0100; // odd parity
	if (!(termios_buf.c_lflag & ICANON))
		ttystat->sg_flags |= 040; // raw mode
	if (termios_buf.c_iflag & ICRNL ||
		termios_buf.c_oflag & ONLCR)
		ttystat->sg_flags |= 020; // CR->LF mapping
	if (termios_buf.c_lflag & ECHO)
		ttystat->sg_flags |= 010; // echo
	if (termios_buf.c_iflag & IUCLC)
		ttystat->sg_flags |= 004; // uppercase->lowercase
	if ((termios_buf.c_lflag & ECHO) &&
		(termios_buf.c_oflag & TAB3))
		ttystat->sg_flags |= 002; // echo tabs as spaces
								  // 001 - inhibit function delays (hard to map directly)
	struct termios old_tio, new_tio;
	printf("%d\n", sizeof(struct termios));
	int fd = STDIN_FILENO; // Typically 0 for standard input

	// Get the current terminal settings
	if (tcgetattr(fd, &old_tio) == -1)
	{
		perror("tcgetattr error");
		// Or for more detailed error: fprintf(stderr, "Error: %s\n", strerror(errno));
		return 1;
	}

	// Copy current settings to modify them
	new_tio = old_tio;

	// Example: Disable canonical mode (raw input) and echo
	new_tio.c_lflag &= ~(ICANON | ECHO);

	// Set the new terminal settings immediately
	if (tcsetattr(fd, TCSANOW, &new_tio) == -1)
	{
		perror("tcsetattr error");
		return 1;
	}

	printf("Terminal mode changed to raw. Press any key to see its ASCII value (and restore).\n");
	int c = getchar();
	printf("You pressed character with ASCII value: %d\n", c);

	// Restore original terminal settings
	if (tcsetattr(fd, TCSANOW, &old_tio) == -1)
	{
		perror("tcsetattr error (restore)");
		return 1;
	}

	printf("Terminal mode restored.\n");

	return 0;
}