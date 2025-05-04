/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   symbol_table.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 21:40:47 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/04 01:06:45 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#include "hash_table.h"

typedef enum
{
	GLOBAL,
	LOCAL,
} scope_t;

typedef struct symbol_table_s
{
	htable_t *table;
	struct symbol_table_s *parent;
} symbol_table_t;

extern symbol_table_t *global_table;
extern symbol_table_t *current_table;

#define DUPSYM "Symbol already exists"

extern int offset_stack[512];
extern int current_depth;

void init_symbol_table(void);
void enter_scope(symbol_table_t *table);
void add_symbol(char *name, void *value);
void exit_scope(void);

/**
 * @details if the symbol is not found, it returns NULL.
 * 			Returns scope of where it found the symbol.
 */
void *get_symbol(char *name, int *scope);

#endif