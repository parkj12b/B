/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser_procedure.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/07 21:08:46 by minsepar          #+#    #+#             */
/*   Updated: 2025/06/04 00:16:05 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdbool.h>
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
		symb->type = SYMBOL_LOCAL;
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

void add_auto_symb(list_t *var_decl_list)
{
	node_t *cur = var_decl_list->head;
	node_t *prev = NULL;

	while (cur)
	{
		var_decl_t *var_decl = cur->data;
		symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
		symb->type = SYMBOL_LOCAL;
		if (var_decl->constant != NULL)
		{
			symb->size = var_decl->constant->value;
			symb->is_array = true;
			free(var_decl->constant);
		}
		else
		{
			symb->is_array = false;
			symb->size = 1;
		}
		if (symb->size <= 0)
			yyerror("Variable size must be greater than 0");
		offset_stack_value -= (symb->size + symb->is_array) * 4; // TODO: define word size for x86
		symb->location.offset = offset_stack_value;
		if (var_decl->constant != NULL)
		{
			emit("lea eax, [ebp %+zd]", symb->location.offset + 4);
			emit("mov [ebp %+zd], eax", symb->location.offset);
		}
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
		symb->type = SYMBOL_EXTRN;
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

	if (symbol->type == SYMBOL_LOCAL || symbol->type == AUTO 
		|| expr->storage_kind == EXPR_TEMP)
	{
		oprintf("dword ptr [ebp %+zd]", symbol->location.offset);
	}
	else
	{
		oprintf("dword ptr [%s]", expr->identifier);
	}
}

void function_call(list_t *expr_list)
{
	node_t *cur = expr_list->tail;
	node_t *prev = NULL;

	while (cur)
	{
		expr_t *expr = (expr_t *)cur->data;
		if (expr->type == EXPR_CONST)
		{
			const_t *constant = &expr->constant;
			if (constant->type != CONST_STRING) {
				oprintf("push dword ptr ");
				print_constant(&expr->constant, 1);
			} else {
				load_value_into_reg(expr, "eax");
				emit("push eax");
			}
			
			/* free */
			free_expr(expr);
			prev = cur;
			free(cur->data);
			cur = cur->prev;
			free(prev);
			continue;
		}

		if (expr->type == EXPR_DEREF)
		{
			load_value_into_reg(expr, "eax");
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

static void load_const_into_reg(const_t *constant, char *reg) {
	if (constant->type == CONST_STRING)
		oprintf("lea %s, ", reg);	
	else
		oprintf("mov %s, ", reg);
	print_constant(constant, 1);
}

void load_value_into_reg(expr_t *expr, char *reg)
{
	if (expr->type == EXPR_CONST) {
		const_t *constant = &expr->constant;
		load_const_into_reg(constant, reg);
	} else {
		symbol_t *symbol = get_symbol(expr->identifier);
		
		if (symbol->type == SYMBOL_LOCAL 
			|| expr->storage_kind == EXPR_TEMP || expr->type == EXPR_DEREF)
		{
			emit("mov %s, [ebp %+zd]", reg, symbol->location.offset);
		}
		else
		{
			emit("mov %s, dword ptr [%s]", reg, expr->identifier);
		}
		if (expr->type == EXPR_DEREF)
			emit("mov %s, [%s]", reg, reg);
	}
}

void load_address_reg(expr_t *expr, char *reg)
{
	symbol_t *symbol = get_symbol(expr->identifier);
	if (expr->type == EXPR_DEREF) {
		oprintf("mov %s, ", reg);
	} else {
		oprintf("lea %s, ", reg);
	}
	if (symbol->type == SYMBOL_EXTRN) {
		emit("%s", expr->identifier);
	}
	else if (expr->val_kind == EXPR_LVALUE)
	{
		if (symbol->type == SYMBOL_LOCAL || symbol->type == AUTO 
			 || expr->storage_kind == EXPR_TEMP)
		{
			emit("[ebp %+zd]", symbol->location.offset);
		}
		else
		{
			emit("%s", expr->identifier);
		}
	}
	else if (expr->val_kind == EXPR_RVALUE)
	{
		if (symbol->type == SYMBOL_LOCAL)
			oprintf("[ebp - %zd]\n", symbol->location.offset);
		else
			oprintf("%s\n", expr->identifier);
	}
}

void load_value_reg_to_lvalue(expr_t *expr, char *reg){
	symbol_t *symbol_l = get_symbol(expr->identifier);

	
	if (symbol_l->type == SYMBOL_LOCAL || symbol_l->type == AUTO 
		|| expr->type == EXPR_DEREF || expr->storage_kind == EXPR_TEMP)
	{
		emit("mov [ebp %+zd], %s", symbol_l->location.offset, reg);
	}
	else
	{
		emit("mov dword ptr [%s], %s", expr->identifier, reg);
	}
}

void register_to_lvalue(expr_t *expr, char *reg)
{
	symbol_t *symbol_l = get_symbol(expr->identifier);

	if (expr->type == EXPR_DEREF) {
		reg_to_deref(expr, reg);
	}
	else if (symbol_l->type == SYMBOL_LOCAL || symbol_l->type == AUTO 
		|| expr->storage_kind == EXPR_TEMP)
	{
		emit("mov [ebp %+zd], %s", symbol_l->location.offset, reg);
	}
	else
	{
		emit("mov dword ptr [%s], %s", expr->identifier, reg);
	}
}

void reg_to_deref(expr_t *expr, char *reg)
{
	symbol_t *symbol = get_symbol(expr->identifier);
	
	if (strcmp(reg, "eax") == 0)
	{
		load_address_reg(expr, "ebx");
		// emit("mov ebx, [ebp %+zd]", symbol->location.offset);
		emit("mov [ebx], eax");
	}
	else
	{
		load_address_reg(expr, "eax");
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
	case ASSIGN_AMPERSAND:
		perform_assign_op("and");
		break;
	case NEQ:
	case LT:
	case LE:
	case GT:
	case GE:
	case EQ:
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
	load_value_into_reg(lhs, "eax");
	load_value_into_reg(rhs, "ecx");
}

void perform_assign(expr_t *lhs, int op, expr_t *rhs)
{
	if (lhs->val_kind != EXPR_LVALUE)
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
	register_to_lvalue(lhs, "eax");
	oprintf("\n");
}

void binary_op(expr_t *lhs, int op, expr_t *rhs, expr_t *result)
{
	load_lhs_rhs(lhs, rhs);
	free_expr(lhs);
	free_expr(rhs);
	perform_binary(op);
	result->val_kind = EXPR_RVALUE;
	result->type = EXPR_VAL;
	add_temp_symbol(result);
	register_to_lvalue(result, "eax");
	oprintf("\n");
}

void unary(expr_t *expr, char *op)
{
	if (expr->val_kind == EXPR_LVALUE)
	{
		load_value_into_reg(expr, "eax");
		emit("%s eax", op);
		register_to_lvalue(expr, "eax");
	}
	else if (expr->type == EXPR_CONST)
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
	free_expr(lhs);
	parent->val_kind = EXPR_RVALUE;
	parent->type = EXPR_VAL;
	add_temp_symbol(parent);
	register_to_lvalue(parent, "eax");
}

static void emit_global_uninit(void)
{
	emit(".bss");

	htable_t *table = global_uninit->table;

	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status != ACTIVE)
			continue;
		symbol_t *symbol = table->entries[i].value;
		if (symbol->is_array)
			oprintf("%s_v: .zero %zu\n", table->entries[i].key, (symbol->size + 1) * 4);
		else
			oprintf("%s: .zero %zu\n", table->entries[i].key, symbol->size * 4);
		if (symbol->value.data != NULL)
			free(symbol->value.data);
	}
	oprintf("\n");
}

static void emit_global_uninit_ptr(void)
{
	htable_t *table = global_uninit->table;

	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status != ACTIVE)
			continue;
		symbol_t *symbol = table->entries[i].value;
		if (symbol->is_array)
			oprintf("%1$s: .long %1$s_v\n", table->entries[i].key);
		if (symbol->value.data != NULL)
			free(symbol->value.data);
	}
}

static void emit_global_init(void)
{
	emit(".data");

	htable_t *table = global_init->table;

	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status != ACTIVE)
			continue;
		symbol_t *symbol = table->entries[i].value;
		list_t *list = symbol->value.data;
		
		
		if (!symbol->is_array)
			oprintf("%s: .long ", table->entries[i].key);
		else
			oprintf("%s_v: .long ", table->entries[i].key);
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
			// oprintf("\ndd %zd dup 0\n", symbol->size);
			oprintf("\n.rept %zd\n.long 0\n.endr\n", symbol->size);
		}
		else
			oprintf("\n");

		if (symbol->is_array)
			emit("%1$s: .long %1$s_v", table->entries[i].key);
			
		free(symbol->value.data);
	}
	oprintf("\n");

	
}

void vector_access(expr_t *base, expr_t *offset)
{
	if (base->type != EXPR_CONST)
	{
		load_value_into_reg(base, "eax");
		free_expr(base);
		load_value_into_reg(offset, "ebx");
		free_expr(offset);
	}
	else
	{
		load_value_into_reg(base, "ebx");
		free_expr(base);
		load_value_into_reg(offset, "eax");
		free_expr(offset);
	}
}

void emit_global_var(void)
{
	if (global_uninit->table->count > 0)
		emit_global_uninit();
	if (global_init->table->count > 0)
		emit_global_init();
	emit_global_uninit_ptr();
	free_symbol_table(global_uninit);
	free_symbol_table(global_init);
}

char *add_temp_symbol(expr_t *expr)
{
	static int temp_count = 0;
	symbol_t *symb = (symbol_t *)xmalloc(sizeof(symbol_t));
	char name[16];

	symb->size = 1;
	expr->storage_kind = EXPR_TEMP;
	offset_stack_value -= 4; // TODO: define word size for x86
	if (offset_stack_value < max_stack_value)
		max_stack_value = offset_stack_value;
	symb->location.offset = offset_stack_value;
	snprintf(name, sizeof(name), "t_%d", temp_count++);
	add_symbol(name, symb);
	expr->identifier = strdup(name);
	temp_count++;
}
