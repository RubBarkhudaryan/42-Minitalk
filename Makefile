CC       = cc
CFLAGS   = -Wall -Wextra -Werror

NAME     = mandatory

ARCHIVE  = libftprintf.a
AR       = ar
ARFLAGS  = -rcs

SERVER   = server
CLIENT   = client

SERVER_BONUS   = server_bonus
CLIENT_BONUS   = client_bonus

# Source files
SRCS_CLIENT     = minitalk_utils.c client.c
SRCS_SERVER     = minitalk_utils.c server.c
SRCS_CLIENT_BONUS = minitalk_utils.c client_bonus.c
SRCS_SERVER_BONUS = minitalk_utils.c server_bonus.c

# Object files
OBJS_CLIENT     = $(SRCS_CLIENT:.c=.o)
OBJS_SERVER     = $(SRCS_SERVER:.c=.o)
OBJS_CLIENT_BONUS = $(SRCS_CLIENT_BONUS:.c=.o)
OBJS_SERVER_BONUS = $(SRCS_SERVER_BONUS:.c=.o)

all: $(NAME)

$(NAME): $(ARCHIVE) $(SERVER) $(CLIENT)

bonus: $(ARCHIVE) $(SERVER_BONUS) $(CLIENT_BONUS)

$(ARCHIVE):
	make -C ./printf
	cp ./printf/libftprintf.a $(ARCHIVE)
	make -C ./printf clean

$(CLIENT): $(OBJS_CLIENT)
	$(CC) $(CFLAGS) $^ $(ARCHIVE) -o $@

$(SERVER): $(OBJS_SERVER)
	$(CC) $(CFLAGS) $^ $(ARCHIVE) -o $@

$(CLIENT_BONUS): $(OBJS_CLIENT_BONUS)
	$(CC) $(CFLAGS) $^ $(ARCHIVE) -o $@

$(SERVER_BONUS): $(OBJS_SERVER_BONUS)
	$(CC) $(CFLAGS) $^ $(ARCHIVE) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS_CLIENT) $(OBJS_SERVER) $(OBJS_CLIENT_BONUS) $(OBJS_SERVER_BONUS)

fclean: clean
	rm -f $(SERVER) $(CLIENT) $(ARCHIVE) $(SERVER_BONUS) $(CLIENT_BONUS)
	rm -f ./printf/libftprintf.a
	rm -f ./printf/libft/libft.a

re: fclean all

.PHONY: all clean fclean re bonus
