/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser_procedure.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/07 21:08:46 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/19 23:49:36 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include "parser_procedure.h"
#include "hash_table.h"
#include "symbol_table.h"
#include "compiler_struct.h"
#include "xmalloc.h"
#include "../B.tab.h"
#include "codegen.h"
#include "parser.h"

extern symbol_table_t *current_table;
extern void yyerror(const char *s);

void add_argument_symb(char *name, list_t *list)
{
	node_t *cur = list->head;
	node_t *prev = NULL;
	size_t arg_num = 0;

	
	while (cur)
	{
		symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
		symb->type = VAR;
		symb->size = 0;
		symb->location.offset = 8 + arg_num * 4; // TODO: define word size for x86
		add_symbol((char *)cur->data, symb);
		arg_num++;
		prev = cur;
		free(cur->data);
		cur = cur->next;
		free(prev);
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
			// emit("sub esp, %zd", symb->size * 4); // TODO: define word size for x86
			free(var_decl->constant);
		}
		else
		{
			symb->size = 1;
			// emit("push 0");
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
	oprintf("\n");
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
		oprintf("dword [ebp %+zd]", symbol->location.offset);
	}
	else
	{
		oprintf("dword [%s]", expr->identifier);
	}
}

void function_call(list_t *expr_list)
{
	node_t *cur = expr_list->tail;
	node_t *prev = NULL;

	while (cur)
	{
		expr_t *expr = (expr_t *)cur->data;
		if (expr->type == CONSTANT)
		{
			const_t *constant = &expr->constant;
			oprintf("push ");
			if (constant->type != CONST_STRING)
				oprintf("dword ");
			print_constant(&expr->constant, 1);
			
			/* free */
			free_expr(expr);
			prev = cur;
			free(cur->data);
			cur = cur->prev;
			free(prev);
			continue;
		}

		symbol_t *symbol = get_symbol(expr->identifier);
		if (symbol->type == PTR)
		{
			deref_to_reg(expr, "eax");
			emit("push eax");
		}
		else
		{
			oprintf("push ");
			print_lvalue(expr);
			oprintf("\n");
		}
		free_expr(expr);
		prev = cur;
		free(cur->data);
		cur = cur->prev;
		free(prev);
	}
}

void load_value_into_reg(expr_t *expr, char *reg)
{
	if (expr->type == LVALUE || expr->type == RVALUE)
	{
		symbol_t *symbol = get_symbol(expr->identifier);
		if (symbol->type == LOCAL || symbol->type == AUTO || symbol->type == TEMP)
		{
			emit("mov %s, [ebp %+zd]", reg, symbol->location.offset);
		}
		else if(symbol->type == TEMP) {
			pop_into_register(reg);
		}
		else
		{
			emit("mov %s, dword [%s]", reg, expr->identifier);
		}
		if (symbol->type == TEMP)
			emit("mov %s, [%s]", reg, reg);
	}
	else if (expr->type == CONSTANT)
	{
		oprintf("mov %s, ", reg);
		print_constant(&(expr->constant), 1);
	}
	else if (expr->type == IVAL_IDENTIFIER)
	{
		symbol_t *symbol = get_symbol(expr->identifier);
		if (symbol->type == LOCAL)
		{
			emit("mov %s, [ebp %+zd]", reg, symbol->location.offset);
		}
		else
		{
			emit("mov %s, %s", reg, expr->identifier);
		}
	}
}

void load_address_reg(expr_t *expr, char *reg)
{
	if (expr->type == LVALUE)
	{
		symbol_t *symbol = get_symbol(expr->identifier);
		if (symbol->type == LOCAL || symbol->type == AUTO || symbol->type == TEMP || symbol->type == PTR)
		{
			emit("lea %s, [ebp %+zd]", reg, symbol->location.offset);
		}
		else
		{
			emit("lea %s, %s", reg, expr->identifier);
		}
	}
	else if (expr->type == RVALUE)
	{
		symbol_t *symbol = get_symbol(expr->identifier);
		if (symbol->type == LOCAL)
			oprintf("lea %s, [ebp - %zd]\n", reg, symbol->location.offset);
		else
			oprintf("lea %s, %s\n", reg, expr->identifier);
	}
}

void register_to_lvalue(expr_t *expr, char *reg)
{
	symbol_t *symbol_l = get_symbol(expr->identifier);

	if (symbol_l->type == LOCAL || symbol_l->type == AUTO || symbol_l->type == TEMP || symbol_l->type == PTR)
	{
		emit("mov [ebp %+zd], %s", symbol_l->location.offset, reg);
	}
	else
	{
		emit("mov dword [%s], %s", expr->identifier, reg);
	}
}

void reg_to_deref(expr_t *expr, char *reg)
{
	symbol_t *symbol = get_symbol(expr->identifier);
	
	if (strcmp(reg, "eax") == 0)
	{
		load_value_into_reg(expr, "ebx");
		// emit("mov ebx, [ebp %+zd]", symbol->location.offset);
		emit("mov [ebx], eax");
	}
	else
	{
		load_value_into_reg(expr, "eax");
		// emit("mov eax, [ebp %+zd]", symbol->location.offset);
		emit("mov [%s], eax", reg);
	}
}

void deref_to_reg(expr_t *expr, char *reg)
{
	symbol_t *symbol = get_symbol(expr->identifier);
	
	if (strcmp(reg, "eax") == 0)
	{
		load_value_into_reg(expr, "ebx");
		emit("mov eax, [ebx]");
	}
	else
	{
		load_value_into_reg(expr, "edx");
		emit("mov %s, [edx]", reg);
	}
}

void perform_assign_op(char *op_command)
{
	if (strcmp(op_command, "shl") == 0 || strcmp(op_command, "shr") == 0)
		emit("%s eax, cl", op_command);
	else
		emit("%s eax, ecx", op_command);
}

void perform_assign_div()
{
	emit("xor edx, edx");
	oprintf("idiv ecx\n");
}

void cmp_binary(int op)
{
	switch (op)
	{
	case EQ:
		emit("sete al");
		break;
	case NEQ:
		emit("setne al");
		break;
	case LT:
		emit("setl al");
		break;
	case LE:
		emit("setle al");
		break;
	case GT:
		emit("setg al");
		break;
	case GE:
		emit("setge al");
		break;
	default:
		yyerror("Invalid comparison operator");
		return;
	}
	emit("movzx eax, al");
}

void perform_binary(int op)
{
	switch (op)
	{
	case ASSIGN:
		break;
	case ASSIGN_OR:
	case OR:
		perform_assign_op("or");
		break;
	case ASSIGN_LSHIFT:
	case LSHIFT:
		perform_assign_op("shl");
		break;
	case ASSIGN_RSHIFT:
	case RSHIFT:
		perform_assign_op("shr");
		break;
	case ASSIGN_PLUS:
	case PLUS:
		perform_assign_op("add");
		break;
	case ASSIGN_MINUS:
	case MINUS:
		perform_assign_op("sub");
		break;
	case ASSIGN_MUL:
	case STAR:
		perform_assign_op("imul");
		break;
	case ASSIGN_DIVIDE:
	case SLASH:
		perform_assign_div();
		break;
	case AMPERSAND:
		perform_assign_op("and");
		break;
	case MOD:
	case ASSIGN_MOD:
		perform_assign_div();
		emit("mov eax, edx");
		break;
	case EQ:
	case NEQ:
	case LT:
	case LE:
	case GT:
	case GE:
		perform_assign_op("cmp");
		cmp_binary(op);
		break;
	default:
		yyerror("Invalid assignment operator");
		return;
	}
}

void	load_lhs_rhs(expr_t *lhs, expr_t *rhs)
{
	if (lhs->type != CONSTANT) {
		symbol_t *l_symb = get_symbol(lhs->identifier);
		if (rhs->type != CONSTANT) {
			symbol_t *r_symb = get_symbol(rhs->identifier);
			if (l_symb->type == TEMP && r_symb->type == TEMP)
			{
				pop_into_register("ecx");
				pop_into_register("eax");
				return ;
			}
		}
	}
	load_value_into_reg(lhs, "eax");
	load_value_into_reg(rhs, "ecx");
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
		load_value_into_reg(rhs, "eax");
	else 
		load_lhs_rhs(lhs, rhs);

	perform_binary(op);

	symbol_t *symbol = get_symbol(lhs->identifier);
	if (symbol->type == PTR)
	{
		reg_to_deref(lhs, "eax");
	}
	else
	{
		register_to_lvalue(lhs, "eax");
	}
	oprintf("\n");
}

void binary_op(expr_t *lhs, int op, expr_t *rhs, expr_t *result)
{
	load_lhs_rhs(lhs, rhs);
	perform_binary(op);
	result->type = RVALUE;
	result->identifier = add_temp_symbol(TEMP, "eax");
	oprintf("\n");
	/* free expr */
	free_expr(lhs);
	free_expr(rhs);
}

void unary(expr_t *expr, char *op)
{
	if (expr->type == LVALUE)
	{
		load_value_into_reg(expr, "eax");
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

void return_post_assign(expr_t *parent, expr_t *lhs)
{
	load_value_into_reg(lhs, "eax");
	parent->type = RVALUE;
	parent->identifier = add_temp_symbol(TEMP, "eax");
	free_expr(lhs);
}

static void emit_global_uninit(void)
{
	emit("section .bss");

	htable_t *table = global_uninit->table;

	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status != ACTIVE)
			continue;
		symbol_t *symbol = table->entries[i].value;
		oprintf("%s resd %zu\n", table->entries[i].key, symbol->size);
		if (symbol->value.data != NULL)
			free(symbol->value.data);
	}
	oprintf("\n");
}

static void emit_global_init(void)
{
	emit("section .data");

	htable_t *table = global_init->table;

	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status != ACTIVE)
			continue;
		symbol_t *symbol = table->entries[i].value;
		list_t *list = symbol->value.data;
		
		oprintf("%s dd ", table->entries[i].key);
		node_t *cur = list->head;
		node_t *prev = NULL;
		while (cur && list->size--)
		{
			symbol->size--;
			ival_t *ival = (ival_t *)(cur->data);
			if (ival->type == IVAL_CONST)
				print_constant(&(ival->value.constant), 0);
			else
				oprintf("%s", ival->value.identifier);
			if (list->size != 0)
				oprintf(", ");
			prev = cur;
			cur = cur->next;
			free(ival);
			free(prev);
		}
		if (symbol->size > 0) {
			oprintf("\ndd %zd dup 0\n", symbol->size);
		}
		else
			oprintf("\n");
		free(symbol->value.data);
	}
	oprintf("\n");

}

void vector_access(expr_t *base, expr_t *offset)
{
	symbol_t *offset_symb;

	if (base->type == LVALUE)
	{
		symbol_t *base_symb = get_symbol(base->identifier);
		if (is_vector(base_symb)) {
			load_address_reg(base, "eax");
			if (offset->type == LVALUE) {
				offset_symb = get_symbol(offset->identifier);
				if (is_vector(offset_symb))
					yyerror("Both base and offset are vector");
			}
			load_value_into_reg(offset, "ebx");
		}
		else {
			load_value_into_reg(base, "ebx");
			if (offset->type != LVALUE) {
				yyerror("No vector in vector access");
			}
			offset_symb = get_symbol(offset->identifier);
			if (!is_vector(offset_symb))
				yyerror("No vector in vector access");
			load_address_reg(offset, "eax");
		}
	}
	else
	{
		load_value_into_reg(base, "ebx");
		if (offset->type != LVALUE)
			yyerror("No vector in vector access");
		offset_symb = get_symbol(offset->identifier);
		if (!is_vector(offset_symb))
			yyerror("No vector in vector access");
		load_address_reg(offset, "eax");
	}
}

void emit_global_var(void)
{
	if (global_uninit->table->count > 0)
		emit_global_uninit();
	if (global_init->table->count > 0)
		emit_global_init();
	free_symbol_table(global_uninit);
	free_symbol_table(global_init);
}
