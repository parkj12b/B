/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   symbol_table.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 21:55:09 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/08 22:11:08 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include "symbol_table.h"
#include "compiler_struct.h"
#include "xmalloc.h"
#include "parser.h"
#include "hash_table.h"

void init_symbol_table(void)
{
	global_table = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	global_table->table = ht_create_table();
	global_table->parent = NULL;
	current_table = global_table;
}

void enter_scope(symbol_table_t *table)
{
	eprintf("Entering scope\n");
	symbol_table_t *new_scope;

	new_scope = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	new_scope->table = ht_create_table();
	new_scope->parent = table;
	current_depth++;
	offset_stack[current_depth] = 8;
	current_table = new_scope;
}

void exit_scope(void)
{
	eprintf("Exiting scope\n");
	symbol_table_t *old_table = current_table;

	if (old_table->parent == NULL)
	{
		yyerror("Cannot exit global scope");
	}
	current_table = old_table->parent;
	print_table(old_table->table);
	ht_destroy_table(old_table->table);
	free(old_table);
	current_depth--;
}

void add_symbol(char *name, void *value)
{
	void *data = ht_search(current_table->table, name);

	if (data != NULL)
	{
		yyerror(DUPSYM);
	}
	ht_insert(current_table->table, name, value);
}

void *get_symbol(char *name, int *scope)
{
	void *data = ht_search(current_table->table, name);

	if (data != NULL)
	{
		if (scope)
			*scope = LOCAL;
		return data;
	}

	if (current_table->table != global_table->table)
		data = ht_search(global_table->table, name);
	if (data != NULL)
	{
		if (scope)
			*scope = GLOBAL;
		return data;
	}
	return NULL;
}

void print_symbol_table(symbol_table_t *s_table)
{
	htable_t *ht = s_table->table;

	print_table(ht);
}

void free_symbol_table(symbol_table_t *s_table)
{
	ht_destroy_table(s_table->table);
	free(s_table);
}