/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rbarkhud <rbarkhud@student.42yerevan.am    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/21 19:45:18 by rbarkhud          #+#    #+#             */
/*   Updated: 2025/04/21 19:45:18 by rbarkhud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static void	handler(int signo, siginfo_t *info)
{
	static char	c;
	static int	bit;
	static int	client;

	if (info->si_pid)
		client = info->si_pid;
	if (SIGUSR1 == signo)
		c |= (0b10000000 >> bit);
	else if (SIGUSR2 == signo)
		c &= ~(0b10000000 >> bit);
	++bit;
	if (bit == CHAR_BIT)
	{
		bit = 0;
		if (c == '\0')
		{
			ft_putchar('\n');
			_kill_(client, SIGUSR1);
			return ;
		}
		ft_putchar(c);
	}
	_kill_(client, SIGUSR1);
}

int	main(void)
{
	int	server_pid;

	server_pid = getpid();
	ft_putstr("Server pid: ");
	ft_putnbr(server_pid, 'i');
	ft_putchar('\n');
	_signal_(SIGUSR1, handler, 1);
	_signal_(SIGUSR2, handler, 1);
	while (true)
		pause();
	return (0);
}
