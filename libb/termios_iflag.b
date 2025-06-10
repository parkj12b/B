
/* c_iflag bits */
IGNBRK	0000001;  /* Ignore break condition.  */
BRKINT	0000002;  /* Signal interrupt on break.  */
IGNPAR	0000004;  /* Ignore characters with parity errors.  */
PARMRK	0000010;  /* Mark parity and framing errors.  */
INPCK	0000020;  /* Enable input parity check.  */
ISTRIP	0000040;  /* Strip 8th bit off characters.  */
INLCR	0000100;  /* Map NL to CR on input.  */
IGNCR	0000200;  /* Ignore CR.  */
ICRNL	0000400;  /* Map CR to NL on input.  */
IUCLC	0001000;  /* Map uppercase characters to lowercase on input
			    	(not in POSIX).  */
IXON	0002000;  /* Enable start/stop output control.  */
IXANY	0004000;  /* Enable any character to restart output.  */
IXOFF	0010000;  /* Enable start/stop input control.  */
IMAXBEL	0020000;  /* Ring bell when input queue is full
			    	(not in POSIX).  */
IUTF8	0040000;  /* Input is UTF8 (not in POSIX).  */
