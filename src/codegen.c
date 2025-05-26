/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   codegen.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 14:32:54 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/26 14:19:53 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "symbol_table.h"
#include "parser.h"
#include "codegen.h"
#include "xmalloc.h"


void emit(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vfprintf(tmp, fmt, args);
	fprintf(tmp, "\n");
	va_end(args);
}
