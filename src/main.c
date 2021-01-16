/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tdontos- <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/01/14 19:36:56 by tdontos-          #+#    #+#             */
/*   Updated: 2021/01/14 19:46:07 by tdontos-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
# include <fcntl.h>

void	parse_file(char *file_name) {
	char	*line;
	int		fd;
	fd = open(file_name, O_RDONLY);
	while (get_next_line(fd, &line)) {
		ft_putendl(line);
	}
}

int		main(int argc, char **argv) {
	if (argc < 2)
		return (0);
	parse_file(argv[1]);
	return (1);
}
