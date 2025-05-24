/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   codegen.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 14:32:54 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/05 01:21:44 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdarg.h>
#include "parser.h"

extern FILE	*tmp;

void emit(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vfprintf(tmp, fmt, args);
	fprintf(tmp, "\n");
	va_end(args);
}

