CC       = cc
CFLAGS   = -Wall -Wextra -Werror

ARCHIVE  = libftprintf.a
AR       = ar
ARFLAGS  = -rcs

SERVER   = server
CLIENT   = client

SRCS     = minitalk_utils.c
OBJS     = $(SRCS:%.c=%.o)

all: $(ARCHIVE) $(SERVER) $(CLIENT)

$(ARCHIVE):
	make -C ./printf
	cp ./printf/libftprintf.a $(ARCHIVE)
	make -C ./printf clean

$(SERVER): $(OBJS)
	$(CC) $(CFLAGS) server.c $(SRCS) $(ARCHIVE) -o $(SERVER)

$(CLIENT): $(OBJS)
	$(CC) $(CFLAGS) client.c $(SRCS) $(ARCHIVE) -o $(CLIENT)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(SERVER) $(CLIENT) $(ARCHIVE) $(OBJS)
	rm -f ./printf/libftprintf.a
	rm -f ./printf/libft/libft.a

re: fclean all

.PHONY: all clean fclean re
