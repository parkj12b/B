
/* c_lflag bits */
ISIG	0000001;   /* Enable signals.  */
ICANON	0000002;   /* Canonical input (erase and kill processing).  */
XCASE	0000004;

ECHO	0000010;   /* Enable echo.  */
ECHOE	0000020;   /* Echo erase character as error-correcting
			     backspace.  */
ECHOK	0000040;   /* Echo KILL.  */
ECHONL	0000100;   /* Echo NL.  */
NOFLSH	0000200;   /* Disable flush after interrupt or quit.  */
TOSTOP	0000400;   /* Send SIGTTOU for background output.  */
ECHOCTL 0001000;  /* If ECHO is also set, terminal special characters
			     other than TAB, NL, START, and STOP are echoed as
			     ^X, where X is the character with ASCII code 0x40
			     greater than the special character
			     (not in POSIX).  */
ECHOPRT 0002000;  /* If ICANON and ECHO are also set, characters are
			     printed as they are being erased
			     (not in POSIX).  */
ECHOKE	0004000;  /* If ICANON is also set, KILL is echoed by erasing
			     each character on the line, as specified by ECHOE
			     and ECHOPRT (not in POSIX).  */
FLUSHO	0010000;  /* Output is being flushed.  This flag is toggled by
			     typing the DISCARD character (not in POSIX).  */
PENDIN	0040000;  /* All characters in the input queue are reprinted
			     when the next character is read
			     (not in POSIX).  */
IEXTEN	0100000;   /* Enable implementation-defined input
			     processing.  */
EXTPROC 0200000;
