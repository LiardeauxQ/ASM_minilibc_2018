##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Makefile
##

PATHSRC =	src/

SRC	=	strlen.asm	\
			strchr.asm	\
			memset.asm	\
			memcpy.asm	\
			strcmp.asm	\
			strncmp.asm	\
			rindex.asm	\
			strstr.asm	\
			strcasecmp.asm	\
			strpbrk.asm	\
			strcspn.asm	\
			memmove.asm


SRCDIR	=	$(addprefix $(PATHSRC), $(SRC))
OBJ		=	$(SRCDIR:.asm=.o)

LIB_NAME	=	libasm.so

RED			=	\033[0;31m
GREEN		=	\033[0;32m
NC			=	\033[0m
GREY		=	\033[90m
BG_COLOR	=	\033[46m

all:    $(LIB_NAME)

$(LIB_NAME): $(OBJ)
	@ld -shared $(OBJ) -o $(LIB_NAME)

%.o:	%.asm
	@printf '${GREEN} [ OK ]${NC} Building : $<\n'
	@nasm -o $@ -f elf64 $< $(LDFLAGS) $(CFLAGS)

clean:
	@rm -f $(OBJ)
	@printf '${RED}Clean${NC} : OK\n'

fclean: clean
	@rm -f $(LIB_NAME)
	@printf '${RED}Fclean${NC}: ./$(NAME) $(LIB_NAME) removed\n'

re: fclean all

.PHONY: re fclean clean all
