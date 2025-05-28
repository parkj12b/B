/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   symbol_table.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 21:55:09 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/29 01:31:42 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "codegen.h"
#include "symbol_table.h"
#include "compiler_struct.h"
#include "xmalloc.h"
#include "parser.h"
#include "hash_table.h"
#include "../B.tab.h"

void init_symbol_table(void)
{
	/* global table*/
	global_table = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	global_table->table = ht_create_table(VALUE_STR);
	global_table->parent = NULL;
	
	
	global_init = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	global_uninit = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	global_init->table = ht_create_table(VALUE_STR);
	global_uninit->table = ht_create_table(VALUE_STR);	
	current_table = global_table;
	function_table = ht_create_table(VALUE_STR);
    string_table = ht_create_table(VALUE_STR);
	// auto_table = ht_create_table(VALUE_INT);
}

void enter_scope(symbol_table_t *table)
{
	eprintf("Entering scope\n");
	symbol_table_t *new_scope;

	new_scope = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	new_scope->table = ht_create_table(VALUE_STR);
	new_scope->parent = table;
	offset_stack_value = 0;
	max_stack_value = 0;
	current_table = new_scope;
}

void exit_scope()
{
	eprintf("Exiting scope\n");
	symbol_table_t *old_table = current_table;

	if (old_table->parent == NULL)
	{
		yyerror("Cannot exit global scope");
	}
	htable_t *table = old_table->table;
	current_table = old_table->parent;
	// print_table(old_table->table);
	free_symbol_table(old_table);

	// reset auto table
	// if (auto_table->capacity > 32) {
	// 	free(auto_table->entries);
	// 	auto_table->entries = xmalloc(32);
	// }
	// for (int i = 0; i < auto_table->capacity; i++)
	// {
	// 	auto_table->entries[i].status = EMPTY;
	// }
	// auto_table->capacity = 32;
	// auto_table->count = 0;
}

void add_symbol_table(symbol_table_t *table, const char *name, void *value)
{
	void *data = ht_search(table->table, name, 0);
	if (data != NULL)
	{
		yyerror(DUPSYM);
	}
	ht_insert(table->table, name, value);
}

void add_symbol(char *name, void *value)
{
	add_symbol_table(current_table, name, value);
	
	if (current_table == global_table)
		return ;
	symbol_t *symb_arg = (symbol_t *)value;
	if (symb_arg->type != EXTRN)
		return ;
	if (ht_search(global_table->table, name, 0) != NULL)
		return ;
	
	symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
	memcpy(symb, value, sizeof(symbol_t));
	symb->type = EXTRN;
	add_symbol_table(global_table, name, symb);
}

void *get_symbol_table(symbol_table_t *table, char *name)
{
	void *data = ht_search(table->table, name, 0);

	if (data != NULL)
	{
		return data;
	}
	return data;
}


void *get_symbol(char *name)
{
	symbol_t	*symb = get_symbol_table(current_table, name);
	if (!symb)
		yyerror("No such symbol found\n");
	if (symb->type == SYMBOL_EXTRN)
	{
		symb = get_symbol_table(global_table, name);
		if (!symb)
			yyerror("No such symbol found\n");
	}
	return symb;
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

int is_vector(symbol_t *symb)
{
	eprintf("size: %zd\n", symb->size);

	if (symb->size > 1)
		return 1;
	return 0;
}