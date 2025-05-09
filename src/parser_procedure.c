/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser_procedure.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/07 21:08:46 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/10 00:13:09 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "symbol_table.h"
#include "compiler_struct.h"
#include "xmalloc.h"
#include "../B.tab.h"
#include "codegen.h"

extern symbol_table_t *current_table;
extern void yyerror(const char *s);

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

void function_call(list_t *expr_list)
{
	node_t *cur = expr_list->tail;

	while (cur)
	{
		expr_t *expr = (expr_t *)cur->data;
		if (expr->type == LVALUE)
		{
			emit("push %s", expr->identifier);
		}
		else if (expr->type == CONSTANT)
		{
			printf("push ");
			print_constant(&expr->constant);
		}
		else
		{
			emit("push %zu", expr->value);
		}
		cur = cur->prev;
	}
}

void load_value_into_eax(expr_t expr)
{
	if (expr.type == LVALUE)
	{
		symbol_t *symbol = get_symbol(expr.identifier);
		if (symbol->type == LOCAL)
		{
			emit("mov eax, [ebp - %d]", symbol->location.offset);
		}
		else
		{
			emit("mov eax, %s", expr.identifier);
		}
	}
	else if (expr.type == CONSTANT)
	{
		printf("mov eax, ");
		print_constant(&expr.constant);
	}
	else if (expr.type == IVAL_IDENTIFIER)
	{
		symbol_t *symbol = get_symbol(expr.identifier);
		if (symbol->type == LOCAL)
		{
			emit("mov eax, [ebp - %d]", symbol->location.offset);
		}
		else
		{
			emit("mov eax, %s", expr.identifier);
		}
	}
	else
	{
		emit("mov eax, %zu", expr.value);
	}
}

void register_to_rvalue(char *reg, expr_t expr)
{
	symbol_t *symbol_l = get_symbol(expr.identifier);

	if (symbol_l->type == LOCAL)
	{
		emit("mov [ebp - %d], eax", symbol_l->location.offset);
	}
	else
	{
		emit("mov %s, eax", expr.identifier);
	}
}

void perform_assign(expr_t lhs, expr_t rhs, int op)
{
	if (lhs.type != LVALUE)
	{
		yyerror("LHS of assignment must be a Lvalue");
		return;
	}

	// Load the RHS value into EAX
	switch (op)
	{
	case ASSIGN:
		load_value_into_eax(rhs);
		register_to_rvalue("eax", lhs);
		break;
	case ASSIGN_PLUS:
		emit("add eax, %zu", rhs.value);
		break;
	case ASSIGN_MINUS:
		emit("sub eax, %zu", rhs.value);
		break;
	case ASSIGN_MUL:
		emit("imul eax, %zu", rhs.value);
		break;
	case ASSIGN_DIVIDE:
		emit("xor edx, edx");
		emit("idiv eax, %zu", rhs.value);
		break;
	default:
		yyerror("Invalid assignment operator");
		return;
	}
}
