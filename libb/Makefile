B = ../B

NAME = libb.a

SRC = libb.b

ASM = libb.s

ASM_STATIC = mutex.s

ASM_OBJ = $(ASM:.s=.o)

ASM_STATIC_OBJ = $(ASM_STATIC:.s=.o)

OBJ = $(ASM_OBJ) $(ASM_STATIC_OBJ)

all: $(NAME)

$(ASM): $(SRC)
	$(B) $(SRC) 2> /dev/null > $(ASM)

%.o: %.s
	as --32 -o $@ $<

$(NAME): $(OBJ) $(ASM) $(ASM_STATIC) $(SRC)
	ar rcs $(NAME) $(OBJ)

clean:
	rm -f $(ASM) $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re