/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/05 01:19:36 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/19 15:09:00 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PARSER_H
#define PARSER_H

#include "compiler_struct.h"

void init_assembly(void);
void yyerror(const char *msg);
void eprintf(const char *fmt, ...);
void exit_label(void);
void emit_extern(void);
void free_expr(expr_t *expr);
void increase_label();
void pop_into_register(char *reg);
void oprintf(const char *fmt, ...);

extern size_t label_counter;
extern size_t label_index;
extern size_t label_stack[];

#endif