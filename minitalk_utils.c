/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk_utils.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rbarkhud <rbarkhud@student.42yerevan.am    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/18 00:45:15 by rbarkhud          #+#    #+#             */
/*   Updated: 2025/04/18 00:45:15 by rbarkhud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	_kill_(int server_pid, int sig)
{
	if (kill(server_pid, sig) < 0)
	{
		ft_printf("Kill failed.\n");
		exit(EXIT_FAILURE);
	}
}

void	_signal_(int sig, void *func, int sig_info)
{
	struct sigaction	sa;

	sa.sa_flags = 0;
	if (sig_info)
	{
		sa.sa_flags = SA_SIGINFO;
		sa.sa_sigaction = func;
	}
	else
		sa.sa_handler = func;
	sigemptyset(&sa.sa_mask);
	sigaddset(&sa.sa_mask, SIGUSR1);
	sigaddset(&sa.sa_mask, SIGUSR2);
	if (sigaction(sig, &sa, NULL) < 0)
	{
		ft_printf("Sigaction failed.\n");
		exit(EXIT_FAILURE);
	}
}
