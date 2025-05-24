/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/05 23:31:25 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/19 23:12:58 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <sys/errno.h>
#include <stdarg.h>
#include <stdio.h>
#include "codegen.h"
#include "symbol_table.h"
#include "compiler_struct.h"
#include "../B.tab.h"
#include "parser.h"

extern FILE *tmp;

void init_assembly(void)
{
	emit("section .text");
	emit("global main");
}

void exit_label(void)
{
	emit("exit:");
	emit("leave");
	emit("ret");
	oprintf("\n");
}

void eprintf(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vfprintf(stderr, fmt, args);
	va_end(args);
}

void oprintf(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vfprintf(tmp, fmt, args);
	va_end(args);
}

void emit_extern(void)
{
	for (int i = 0; i < function_table->capacity; i++)
	{
		if (function_table->entries[i].status != ACTIVE)
			continue;
		if ((size_t)function_table->entries[i].value == REFERENCED)
		{
			oprintf("extern %s\n", function_table->entries[i].key);
		}
	}
	htable_t *gtable = global_table->table;
	for (int i = 0; i < gtable->capacity; i++)
	{
		if (gtable->entries[i].status != ACTIVE)
			continue;
		symbol_t *symbol = gtable->entries[i].value;
		if (symbol->type == EXTRN)
		{
			oprintf("extern %s\n", gtable->entries[i].key);
		}
	}
}

void free_expr(expr_t *expr)
{
	if (expr->type != CONSTANT)
	{
		free(expr->identifier);
		return ;
	}
}

void increase_label()
{
	label_index++;
	label_counter++;
}

void pop_into_register(char *reg)
{
	emit("pop %s", reg);
}