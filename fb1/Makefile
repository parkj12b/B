
fb1-5: src/fb1-5.l src/fb1-5.y
	bison -d src/fb1-5.y
	flex src/fb1-5.l
	cc -o $@ fb1-5.tab.c lex.yy.c -lfl

clean:
	rm -rf fb*.tab* lex.yy.c

fclean:
	$(MAKE) clean
	rm -rf fb1-5
