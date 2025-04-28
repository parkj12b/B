NAME=a.out

FLEX_SRC = B.l

BISON_SRC = B.y

BISON_FLAG = -d -Wcounterexamples

CC = cc

CFLAGS = -lfl

all: $(NAME)

$(NAME): $(FLEX_SRC) $(BISON_SRC)
	bison $(BISON_FLAG) B.y
	flex B.l
	$(CC) $(CFLAGS) lex.yy.c B.tab.c

nocounter: $(FLEX_SRC) $(BISON_SRC)
	bison -d B.y
	flex B.l
	$(CC) $(CFLAGS) lex.yy.c B.tab.c

clean:
	rm -rf *.tab.*
	rm -rf lex.yy.c

fclean:
	$(MAKE) clean
	rm -rf $(NAME)

.PHONY: all clean fclean no_counter
