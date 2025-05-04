/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   codegen.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/01 15:23:09 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/04 23:12:47 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CODEGEN_H
# define CODEGEN_H

# include <stdlib.h>

typedef struct
{
	char *data;
	size_t length;
	size_t capacity;
} CodeBuffer;

void emit(const char *fmt, ...);

#endif