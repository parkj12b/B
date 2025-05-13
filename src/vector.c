/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   vector.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/01 19:45:28 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/13 15:52:06 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include "vector.h"
#include "xmalloc.h"

var_str_t	*create_vector(size_t capacity)
{
	var_str_t	*vector = (var_str_t *)xmalloc(sizeof(var_str_t));
	if (capacity < 16)
		vector->capacity = 16;
	else
		vector->capacity = capacity;
	vector->str = xmalloc(capacity * sizeof(char));
	vector->str[0] = '\0';
	vector->size = 0;
}

void	append_str(char *str, var_str_t *vector)
{
	size_t	len = strlen(str);
	size_t	new_size = vector->size + len;
	int realloc_flag = 0;

	while (new_size + 1 >= vector->capacity)
	{
		vector->capacity *= 2;
		realloc_flag = 1;
	}
	if (realloc_flag)
	{
		vector->str = xrealloc(vector->str, vector->capacity * sizeof(char));
	}
	strcat(vector->str, str);
	vector->size = new_size;
}

void	free_vector(var_str_t *vector)
{
	free(vector->str);
	free(vector);
}

void append_char(char c, var_str_t *vector)
{
	if (vector->size + 1 >= vector->capacity)
	{
		vector->capacity *= 2;
		vector->str = realloc(vector->str, vector->capacity * sizeof(char));
	}
	vector->str[vector->size] = c;
	vector->str[vector->size + 1] = '\0';
	vector->size++;
	
}