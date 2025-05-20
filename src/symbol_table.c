/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   symbol_table.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 21:55:09 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/19 23:37:59 by minsepar         ###   ########.fr       */
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
	global_table->table = ht_create_table();
	global_table->parent = NULL;
	
	
	global_init = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	global_uninit = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	global_init->table = ht_create_table();
	global_uninit->table = ht_create_table();	
	current_table = global_table;
	function_table = ht_create_table();
}

void enter_scope(symbol_table_t *table)
{
	eprintf("Entering scope\n");
	symbol_table_t *new_scope;

	new_scope = (symbol_table_t *)xmalloc(sizeof(symbol_table_t));
	new_scope->table = ht_create_table();
	new_scope->parent = table;
	current_depth++;
	offset_stack[current_depth] = 0;
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
	free_symbol_table(old_table);	
	current_depth--;
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
	if (symb->type == EXTRN)
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

char *add_temp_symbol(int symb_type)
{
	static int temp_count = 0;
	symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
	char name[16];

	symb->type = symb_type;
	symb->size = 1;
	offset_stack[current_depth] -= symb->size * 4; // TODO: define word size for x86
	symb->location.offset = offset_stack[current_depth];
	emit("sub esp, 4"); // TEMP symbols are 4 bytes. At least in my head

	snprintf(name, sizeof(name), "t_%d", temp_count++);
	add_symbol(name, symb);
	temp_count++;
	return strdup(name);
}