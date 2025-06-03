B = ../B

NAME = libb.a

SRC = libb.b

ASM = libb.s

OBJ = libb.o

all: $(NAME)

$(ASM): $(SRC)
	$(B) $(SRC) 2> /dev/null > $(ASM)

$(OBJ): $(ASM)
	as --32 -o $(OBJ) $(ASM)

$(NAME): $(OBJ) $(ASM) $(SRC)
	ar rcs $(NAME) $(OBJ)

clean:
	rm -f $(ASM) $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re