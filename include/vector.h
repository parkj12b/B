/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   vector.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/01 19:44:32 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/01 19:58:37 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef VECTOR_H
# define VECTOR_H

# include <stdlib.h>

typedef struct var_str_s
{
	char 	*str;
	size_t	capacity;
	size_t	size;
} var_str_t;

var_str_t	*create_vector(size_t capacity);
void 		append_string(char *str, var_str_t *vector);

#endif