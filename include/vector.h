/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   vector.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/01 19:44:32 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/13 14:37:00 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef VECTOR_H
#define VECTOR_H

#include <stdlib.h>

typedef struct var_str_s
{
	char *str;
	size_t capacity;
	size_t size;
} var_str_t;

var_str_t *create_vector(size_t capacity);
void append_str(char *str, var_str_t *vector);
void append_char(char c, var_str_t *vector);
void free_vector(var_str_t *vector);

#endif