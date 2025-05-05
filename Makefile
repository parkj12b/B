

NAME=a.out

LIBFT = libft/libft.a

FLEX_SRC = B.l

FLEX_SRCS = $(addprefix src/, $(FLEX_SRC))

BISON_SRC = B.y

BISON_SRCS = $(addprefix src/, $(BISON_SRC))

BISON_FLAG = -d -Wcounterexamples

TEST_SRC = test_hash_table.c test_main.c hash_table.c

TEST_SRCS = $(addprefix src/, $(TEST_SRC))

SRC = 	codegen.c hash_table.c symbol_table.c vector.c parser.c \
		string_table.c compiler_struct.c

SRCS = $(addprefix src/, $(SRC))

CC = cc

CFLAGS = -lfl -g

INCLUDES = -Iinclude -Ilibft/include

all: $(NAME)

$(NAME): $(FLEX_SRCS) $(BISON_SRCS)
	bison $(BISON_FLAG) $(BISON_SRCS)
	flex $(FLEX_SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) lex.yy.c B.tab.c $(SRCS) $(LIBFT) -o $(NAME)

nocounter: $(FLEX_SRCS) $(BISON_SRCS)
	bison -d $(BISON_SRCS)
	flex $(FLEX_SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) lex.yy.c B.tab.c

clean:
	rm -rf *.tab.*
	rm -rf lex.yy.c

fclean:
	$(MAKE) clean
	rm -rf $(NAME)

re:
	$(MAKE) fclean
	$(MAKE) all

test: 
	$(CC) -g -Iinclude -Ilibft/include $(TEST_SRCS) libft/libft.a -o a.out

.PHONY: all clean fclean no_counter
