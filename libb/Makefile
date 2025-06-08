B = ../B

NAME = libb.a

SRC = libb.b futex.b printf.b

ASM = $(SRC:.b=.s)

ASM_STATIC = mutex.s

ASM_OBJ = $(ASM:.s=.o)

ASM_STATIC_OBJ = $(ASM_STATIC:.s=.o)

all: $(NAME)

%.s: %.b
	$(B) $< 2>/dev/null > $@

%.o: %.s
	as --32 -o $@ $<

$(NAME): $(ASM_OBJ) $(ASM_STATIC_OBJ) $(SRC)
	ar rcs $(NAME) $(ASM_OBJ) $(ASM_STATIC_OBJ)

clean:
	rm -f *.o $(ASM)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re