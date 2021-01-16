# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: -tdontos <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/01/02 12:58:40 by tdontos-          #+#    #+#              #
#    Updated: 2021/01/14 19:45:52 by tdontos-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= expert_system

SRCDIR	= ./src
OBJDIR	= ./obj

# src / obj files
SRC		= main.c

OBJ		= $(addprefix $(OBJDIR)/,$(SRC:.c=.o))

# compiler
CC		= gcc
CFLAGS	= -Wall -Wextra -Werror

# ft library
FTDIR	= libft
FT_LIB	= $(addprefix $(FTDIR)/,libft.a)
FT_INC	= -I $(FTDIR)
H_INC	= -I inc
FT_LNK	= -L $(FTDIR) -lft

all: obj $(NAME)

obj:
	@make -C $(FTDIR)
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o:$(SRCDIR)/%.c
	$(CC) $(CFLAGS) $(H_INC) $(FT_INC) -o $@ -c $<

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(FT_LNK) -o $(NAME)

clean:
	rm -rf $(OBJDIR)
	make -C $(FTDIR) clean

fclean: clean
	rm -f $(NAME)
	make -C $(FTDIR) fclean

re: fclean all
