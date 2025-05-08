/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser_procedure.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/07 21:08:46 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/08 23:36:58 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "symbol_table.h"
#include "compiler_struct.h"
#include "xmalloc.h"
#include "../B.tab.h"
#include "codegen.h"

extern symbol_table_t *current_table;

void add_argument_symb(char *name, list_t *list)
{
	offset_stack[current_depth] += list->size * 4; // TODO: define word size for x86
	node_t *cur = list->head;
	size_t arg_num = list->size - 1;

	while (cur)
	{
		symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
		symb->type = VAR;
		symb->size = 0;
		symb->location.offset = 8 + arg_num * 4; // TODO: define word size for x86
		add_symbol((char *)cur->data, symb);
		arg_num--;
		cur = cur->next;
	}
}

#include <stdio.h>

void add_auto_symb(list_t *var_decl_list)
{
	node_t *cur = var_decl_list->head;
	node_t *prev = NULL;

	while (cur)
	{
		var_decl_t *var_decl = cur->data;
		symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
		symb->type = AUTO;
		if (var_decl->constant != NULL)
		{
			symb->size = var_decl->constant->value;
			emit("sub esp %zu", symb->size * 4);
		}
		else
		{
			symb->size = 1;
			emit("push 0");
		}
		symb->location.offset = offset_stack[current_depth];

		/* emit code */

		offset_stack[current_depth] += symb->size * 4; // TODO: define word size for x86
		add_symbol(var_decl->name, symb);
		free(var_decl->name);
		free(var_decl);
		prev = cur;
		cur = cur->next;
		free(prev);
	}
	printf("\n");
}

void add_extrn_symbol(list_t *ident_list)
{
	node_t *cur = ident_list->head;
	node_t *prev = NULL;

	while (cur)
	{
		symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
		symb->type = EXTRN;
		symb->size = 0;
		symb->location.label = cur->data;
		add_symbol(cur->data, symb);
		free(cur->data);
		prev = cur;
		cur = cur->next;
		free(prev);
	}
}