/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   codegen.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 14:32:54 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/01 15:24:08 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

extern FILE	*out;

#include <stdio.h>
#include <stdarg.h>

void emit(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vfprintf(out, fmt, args);
	fprintf(out, "\n");
	va_end(args);
}

