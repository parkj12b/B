/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser_procedure.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/07 21:08:46 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/13 23:11:10 by minsepar         ###   ########.fr       */
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
	node_t *cur = list->head;
	size_t arg_num = 0;

	while (cur)
	{
		symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
		symb->type = VAR;
		symb->size = 0;
		symb->location.offset = 8 + arg_num * 4; // TODO: define word size for x86
		add_symbol((char *)cur->data, symb);
		arg_num++;
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
			printf("here\n");
			emit("sub esp %zd", symb->size * 4); // TODO: define word size for x86
		}
		else
		{
			symb->size = 1;
			emit("push 0");
		}

		offset_stack[current_depth] -= symb->size * 4; // TODO: define word size for x86
		symb->location.offset = offset_stack[current_depth];

		/* emit code */
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

void print_lvalue(expr_t *expr)
{
	symbol_t *symbol = get_symbol(expr->identifier);
	if (symbol->type == LOCAL || symbol->type == AUTO || symbol->type == TEMP)
	{
		printf("dword [ebp %+zd]", symbol->location.offset);
	}
	else
	{
		printf("%s", expr->identifier);
	}
}

void function_call(list_t *expr_list)
{
	node_t *cur = expr_list->tail;

	while (cur)
	{
		expr_t *expr = (expr_t *)cur->data;
		if (expr->type == LVALUE || expr->type == TEMP || expr->type == RVALUE)
		{
			printf("push ");
			print_lvalue(expr);
			printf("\n");
		}
		else if (expr->type == CONSTANT)
		{
			const_t *constant = &expr->constant;
			printf("push ");
			if (constant->type != CONST_STRING)
				printf("dword ");
			print_constant(&expr->constant);
		}
		cur = cur->prev;
	}
}

void load_value_into_eax(expr_t *expr)
{
	if (expr->type == LVALUE)
	{
		symbol_t *symbol = get_symbol(expr->identifier);
		if (symbol->type == LOCAL || symbol->type == AUTO || symbol->type == TEMP)
		{
			emit("mov eax, [ebp %+zd]", symbol->location.offset);
		}
		else
		{
			emit("mov eax, %s", expr->identifier);
		}
	}
	else if (expr->type == CONSTANT)
	{
		printf("mov eax, ");
		print_constant(&(expr->constant));
	}
	else if (expr->type == IVAL_IDENTIFIER)
	{
		symbol_t *symbol = get_symbol(expr->identifier);
		if (symbol->type == LOCAL)
		{
			emit("mov eax, [ebp - %d]", symbol->location.offset);
		}
		else
		{
			emit("mov eax, %s", expr->identifier);
		}
	}
	else
	{
		emit("mov eax, %zu", expr->value);
	}
}

void register_to_lvalue(expr_t *expr, char *reg)
{
	symbol_t *symbol_l = get_symbol(expr->identifier);

	if (symbol_l->type == LOCAL || symbol_l->type == AUTO 
		|| symbol_l->type == TEMP)
	{
		emit("mov [ebp %+d], %s", symbol_l->location.offset, reg);
	}
	else
	{
		emit("mov %s, %s", expr->identifier, reg);
	}
}

void perform_assign_op(expr_t *rhs, char *op_command)
{
	if (rhs->type == LVALUE)
	{
		printf("mov ebx, ");
		print_lvalue(rhs);
		printf("\n");
		emit("%s eax, ebx", op_command);
	}
	else if (rhs->type == CONSTANT)
	{
		printf("%s eax, ", op_command);
		print_constant(&rhs->constant);
	}
	else
	{
		emit("%s eax, %zd", rhs->value, op_command);
	}
}

void perform_assign_div(expr_t *rhs)
{
	emit("xor edx, edx");
	if (rhs->type == LVALUE)
	{
		printf("mov ebx, ");
		print_lvalue(rhs);
		printf("\n");
	}
	else if (rhs->type == CONSTANT)
	{
		printf("mov ebx, ");
		print_constant(&rhs->constant);
		printf("\n");
	}
	printf("idiv ebx\n");
}

void perform_assign(expr_t *lhs, int op, expr_t *rhs)
{
	if (lhs->type != LVALUE)
	{
		yyerror("LHS of assignment must be a Lvalue");
		return;
	}

	// Load the RHS value into EAX
	if (op == ASSIGN)
		load_value_into_eax(rhs);
	else
		load_value_into_eax(lhs);

	switch (op)
	{
	case ASSIGN:
		break;
	case ASSIGN_OR:
		perform_assign_op(rhs, "or");
		break;
	case ASSIGN_LSHIFT:
		perform_assign_op(rhs, "shl");
		break;
	case ASSIGN_RSHIFT:
		perform_assign_op(rhs, "shr");
		break;
	case ASSIGN_PLUS:
		perform_assign_op(rhs, "add");
		break;
	case ASSIGN_MINUS:
		perform_assign_op(rhs, "sub");
		break;
	case ASSIGN_MUL:
		perform_assign_op(rhs, "imul");
		break;
	case ASSIGN_DIVIDE:
		perform_assign_div(rhs);
		break;
	default:
		yyerror("Invalid assignment operator");
		return;
	}
	register_to_lvalue(lhs, "eax");
	printf("\n");
}

void negate_unary(expr_t *expr)
{
	if (expr->type == LVALUE)
	{
		load_value_into_eax(expr);
		emit("neg eax");
		register_to_lvalue(expr, "eax");
	}
	else if (expr->type == CONSTANT)
	{
		expr->constant.value = -expr->constant.value;
	}
	else
	{
		expr->value = -expr->value;
	}
}

void unary(expr_t *expr, char *op)
{
	if (expr->type == LVALUE)
	{
		load_value_into_eax(expr);
		emit("%s eax", op);
		register_to_lvalue(expr, "eax");
	}
	else if (expr->type == CONSTANT)
	{
		expr->constant.value++;
	}
	else
	{
		expr->value++;
	}
}