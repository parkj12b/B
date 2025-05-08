/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser_procedure.h                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/07 21:33:28 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/08 22:27:40 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PARSER_PROCEDURE_H
#define PARSER_PROCEDURE_H

#include "compiler_struct.h"

void add_argument_symb(char *name, list_t *list);
void add_auto_symb(list_t *var_decl_list);
void add_extrn_symbol(list_t *ident_list);

#endif