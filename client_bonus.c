/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rbarkhud <rbarkhud@student.42yerevan.am    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/08 23:08:31 by rbarkhud          #+#    #+#             */
/*   Updated: 2025/04/08 23:08:31 by rbarkhud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

volatile sig_atomic_t	g_server = BUSY;

static void	ack_handler(int signal)
{
	g_server = READY;
	signal = (int)signal;
}

static void	end_handler(int signal)
{
	ft_putstr("OK!\n");
	exit(EXIT_SUCCESS);
	signal = (int)signal;
}

static void	send_char(char c, int server_pid)
{
	int	bit;

	bit = 0;
	while (bit < CHAR_BIT)
	{
		if (c & (0x80 >> bit))
			_kill_(server_pid, SIGUSR1);
		else
			_kill_(server_pid, SIGUSR2);
		++bit;
		while (g_server == BUSY)
			usleep(42);
		g_server = BUSY;
	}
}

int	main(int argc, char **argv)
{
	int		server;
	char	*message;

	if (argc != 3)
	{
		ft_putstr("Usage: ./client <pid> \"message\"\n");
		exit(EXIT_FAILURE);
	}
	server = atoi(argv[1]);
	message = argv[2];
	_signal_(SIGUSR1, ack_handler, 0);
	_signal_(SIGUSR2, end_handler, 0);
	while (*message)
		send_char(*message++, server);
	send_char('\0', server);
	return (0);
}
