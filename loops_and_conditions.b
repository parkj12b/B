main()
{
	auto i;
	auto c, c2;
	extrn syscall;

	c = 'a';
	while (i < 10)
	{
		if (i % 2)
			syscall(4, 1, &c, 1);
		else
		{
			c2 = c - 32;
			syscall(4, 1, &c2, 1);
		}
		i++;
		++c;
	}
}
