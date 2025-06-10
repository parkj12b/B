/* c_oflag bits */
OPOST	0000001;  /* Post-process output.  */
OLCUC	0000002;  /* Map lowercase characters to uppercase on output.
			    	(not in POSIX).  */
ONLCR	0000004;  /* Map NL to CR-NL on output.  */
OCRNL	0000010;  /* Map CR to NL on output.  */
ONOCR	0000020;  /* No CR output at column 0.  */
ONLRET	0000040;  /* NL performs CR function.  */
OFILL	0000100;  /* Use fill characters for delay.  */
OFDEL	0000200;  /* Fill is DEL.  */

NLDLY	0000400;  /* Select newline delays:  */
NL0		0000000;  /* Newline type 0.  */
NL1		0000400;  /* Newline type 1.  */
CRDLY	0003000;  /* Select carriage-return delays:  */
CR0		0000000;  /* Carriage-return delay type 0.  */
CR1		0001000;  /* Carriage-return delay type 1.  */
CR2		0002000;  /* Carriage-return delay type 2.  */
CR3		0003000;  /* Carriage-return delay type 3.  */
TABDLY	0014000;  /* Select horizontal-tab delays:  */
TAB0	0000000;  /* Horizontal-tab delay type 0.  */
TAB1	0004000;  /* Horizontal-tab delay type 1.  */
TAB2	0010000;  /* Horizontal-tab delay type 2.  */
TAB3	0014000;  /* Expand tabs to spaces.  */
BSDLY	0020000;  /* Select backspace delays:  */
BS0		0000000;  /* Backspace-delay type 0.  */
BS1		0020000;  /* Backspace-delay type 1.  */
FFDLY	0100000;  /* Select form-feed delays:  */
FF0		0000000;  /* Form-feed delay type 0.  */
FF1		0100000;  /* Form-feed delay type 1.  */


VTDLY	0040000;  /* Select vertical-tab delays:  */
VT0		0000000;  /* Vertical-tab delay type 0.  */
VT1		0040000;  /* Vertical-tab delay type 1.  */
