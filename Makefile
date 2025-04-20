CC					= cc
CFLAGS				= -Wall -Wextra -Werror

NAME				= mandatory

SERVER				= server
CLIENT				= client

SERVER_BONUS		= server_bonus
CLIENT_BONUS		= client_bonus

# Source files
SRCS_CLIENT			= minitalk_utils.c client.c libft_functions.c
SRCS_SERVER			= minitalk_utils.c server.c libft_functions.c
SRCS_CLIENT_BONUS	= minitalk_utils.c client_bonus.c libft_functions.c
SRCS_SERVER_BONUS	= minitalk_utils.c server_bonus.c libft_functions.c

# Object files
OBJS_CLIENT			= $(SRCS_CLIENT:.c=.o)
OBJS_SERVER			= $(SRCS_SERVER:.c=.o)
OBJS_CLIENT_BONUS	= $(SRCS_CLIENT_BONUS:.c=.o)
OBJS_SERVER_BONUS	= $(SRCS_SERVER_BONUS:.c=.o)

all: $(NAME)

$(NAME): $(SERVER) $(CLIENT)

bonus: $(SERVER_BONUS) $(CLIENT_BONUS)

$(CLIENT): $(OBJS_CLIENT)
	$(CC) $(CFLAGS) $^ -o $@

$(SERVER): $(OBJS_SERVER)
	$(CC) $(CFLAGS) $^ -o $@

$(CLIENT_BONUS): $(OBJS_CLIENT_BONUS)
	$(CC) $(CFLAGS) $^ -o $@

$(SERVER_BONUS): $(OBJS_SERVER_BONUS)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS_CLIENT) $(OBJS_SERVER) $(OBJS_CLIENT_BONUS) $(OBJS_SERVER_BONUS)

fclean: clean
	rm -f $(SERVER) $(CLIENT) $(SERVER_BONUS) $(CLIENT_BONUS)

re: fclean all

.PHONY: all clean fclean re bonus
