/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rbarkhud <rbarkhud@student.42yerevan.am    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/18 00:24:24 by rbarkhud          #+#    #+#             */
/*   Updated: 2025/04/18 00:24:24 by rbarkhud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H

# define MINITALK_H

# include <unistd.h>
# include <signal.h>
# include <stdlib.h>
# include <stdbool.h>
# include <limits.h>

enum e_status
{
	READY,
	BUSY,
};

/*minitalk utils*/
void	_signal_(int signal, void *func, int sig_info);
void	_kill_(int server_pid, int signal);

/*libft functions*/
void	ft_putstr(char *str);
void	ft_putnbr(long long n, char type);
void	ft_putchar(char c);
int		ft_strlen(char *str);
int		ft_atoi(char *str);

#endif