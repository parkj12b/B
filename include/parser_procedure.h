/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser_procedure.h                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/07 21:33:28 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/18 21:46:10 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PARSER_PROCEDURE_H
#define PARSER_PROCEDURE_H

#include "compiler_struct.h"

void add_argument_symb(char *name, list_t *list);
void add_auto_symb(list_t *var_decl_list);
void add_extrn_symbol(list_t *ident_list);
void function_call(list_t *expr_list);
void load_value_into_reg(expr_t *expr, char *reg);
void perform_assign(expr_t *lhs, int op, expr_t *rhs);
void negate_unary(expr_t *expr);
void unary(expr_t *expr, char *op);
void register_to_lvalue(expr_t *expr, char *reg);
void load_address_reg(expr_t *expr, char *reg);
void reg_to_deref(expr_t *expr, char *reg);
void deref_to_reg(expr_t *expr, char *reg);
void binary_op(expr_t *lhs, int op, expr_t *rhs, expr_t *result);
void return_post_assign(expr_t *parent, expr_t *lhs);
void emit_global_var(void);

#endif