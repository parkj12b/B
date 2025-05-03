/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   xmalloc.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/29 22:53:58 by minsepar          #+#    #+#             */
/*   Updated: 2025/04/29 23:11:58 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include "xmalloc.h"
#include "fterror.h"

void *xmalloc(size_t size)
{
	void *ptr;

	ptr = malloc(size);
	if (!ptr)
	{
		perror(MSG_ENOMEM);
		exit(EXIT_FAILURE);
	}
	return (ptr);
}

void *xcalloc(size_t count, size_t size)
{
	void *ptr;

	ptr = calloc(count, size);
	if (!ptr)
	{
		perror(MSG_ENOMEM);
		exit(EXIT_FAILURE);
	}
	return (ptr);
}