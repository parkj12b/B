/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   symbol_table.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 21:40:47 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/01 23:36:33 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef SYMBOL_TABLE_H
# define SYMBOL_TABLE_H

# include "hash_table.h"

typedef struct symbol_table_s
{
	htable_t				*table;
	struct symbol_table_s	*parent;
}	symbol_table_t;

extern symbol_table_t	*global_table;
extern symbol_table_t	*current_table;

# define DUPSYM "Symbol already exists"

void init_symbol_table(void);
void enter_scope(symbol_table_t *table);
void add_symbol(char *name, void *value);
void exit_scope(void);

/**
 * @details if the symbol is not found, it returns NULL.
 * 			Since global variables are refered using their names and local
 * 			variables are refered using their offset, need to check if
 * 			offset is 0 for global variables.
 * 
 * 			TLDR: if offset is 0, it is a global variable.
 * 			Otherwise, it is a local variable.
 */
void *get_symbol(char *name);

#endif