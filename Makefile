##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Makefile
##

SRCS	=	memcpy.s	\
			memset.s	\
			strchr.s	\
			strlen.s

OBJ	=	$(SRCS:.s=.o)

LIB_NAME	=	libasm.so

RED			=	\033[0;31m
GREEN		=	\033[0;32m
NC			=	\033[0m
GREY		=	\033[90m
BG_COLOR	=	\033[46m

all:    $(LIB_NAME)

$(LIB_NAME): $(OBJ)
	@gcc -shared $(OBJ) -o $(LIB_NAME)

%.o:	%.c
	@printf '${GREEN} [ OK ]${NC} Building : $<\n'
	@gcc -o $@ -fPIC -c $< $(LDFLAGS) $(CFLAGS)

clean:
	@rm -f $(OBJ)
	@printf '${RED}Clean${NC} : OK\n'

fclean: clean
	@rm -f $(LIB_NAME)
	@find . -name *.dSYM -type d -exec rm -rf "{}" \;
	@printf '${RED}Fclean${NC}: ./$(NAME) $(LIB_NAME) removed\n'

re: fclean all

.PHONY: re fclean clean all
