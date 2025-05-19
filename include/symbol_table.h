/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   symbol_table.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 21:40:47 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/19 16:23:47 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#include <stdlib.h>
#include <stddef.h>
#include "hash_table.h"

typedef enum
{
	LOCAL,
	GLOBAL,
	// AUTO,
	// EXTRN,
} scope_t;

typedef enum
{
	VAR,   // word
	FUNC,  // word
	ARRAY, // word * size
} symbol_type_t;

typedef enum
{
	DECLARED,
	REFERENCED,	
} func_state_t;

/**
 * size and array size in linked list can be different
 * if allocate size is bigger than initialization, allocate more
 * space at end. else allocate for initialization.
 */
typedef struct symbol_s
{
	scope_t type;
	ssize_t size; // size for array or function. 0 for variable
	union
	{
		void *data; // data is null if not initialized
		size_t constant;
	} value;
	union
	{
		const char *label;
		ssize_t offset;
	} location;
} symbol_t;

typedef struct symbol_table_s
{
	htable_t *table;
	struct symbol_table_s *parent;
} symbol_table_t;

#define DUPSYM "Symbol already exists"

extern symbol_table_t *global_table;
extern symbol_table_t *current_table;
extern symbol_table_t *global_init;
extern symbol_table_t *global_uninit;
extern int offset_stack[512];
extern int current_depth;
extern htable_t *function_table;

void init_symbol_table(void);
void enter_scope(symbol_table_t *table);
void add_symbol(char *name, void *value);
void exit_scope(void);

/**
 * @details if the symbol is not found, it returns NULL.
 * 			Returns scope of where it found the symbol.
 */
void *get_symbol(char *name);
void print_symbol_table(symbol_table_t *s_table);
void free_symbol_table(symbol_table_t *s_table);
char *add_temp_symbol(int symb_type);
void add_symbol_table(symbol_table_t *table, const char *name, void *value);

#endif