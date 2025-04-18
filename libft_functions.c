/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft_functions.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rbarkhud <rbarkhud@student.42yerevan.am    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/18 20:54:46 by rbarkhud          #+#    #+#             */
/*   Updated: 2025/04/18 21:47:27 by rbarkhud         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"



int	ft_atoi(char *str)
{
	int	res;
	int	ind;

	ind = 0;
	res = 0;

	while ()
}

void	ft_putnbr(long long n, char type)
{
	if (n < 0)
	{
		ft_putchar('-');
		n = -n;
	}
	if (n >= 10)
		ft_putnbr(n / 10, type);
	ft_putchar((n % 10) + '0');
}

void	ft_putchar(char c)
{
	write(1, &c, 1);
}

void	ft_putstr(char *str)
{
	if (!str)
		return ;
	write(1, str, ft_strlen(str));
}