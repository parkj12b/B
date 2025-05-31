/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   symbol_table.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 21:40:47 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/31 15:32:40 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#include <stdlib.h>
#include <stddef.h>
#include "hash_table.h"
#include "compiler_struct.h"

typedef enum
{
	SYMBOL_LOCAL,
	SYMBOL_GLOBAL,
	SYMBOL_EXTRN,
	SYMBOL_FUNCTION,
} symbol_storage_class_t;

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
	symbol_storage_class_t type;
	ssize_t size; // size for array or function. 0 for variable
	int is_array;
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

extern int offset_stack_value;
extern htable_t *temp_patch_table;
extern htable_t *function_table;
extern htable_t *string_table;
extern htable_t *auto_table;


void init_symbol_table(void);
void enter_scope(symbol_table_t *table);
void add_symbol(char *name, void *value);
void exit_scope();

/**
 * @details if the symbol is not found, it returns NULL.
 * 			Returns scope of where it found the symbol.
 */
void *get_symbol(char *name);
void print_symbol_table(symbol_table_t *s_table);
void free_symbol_table(symbol_table_t *s_table);
void add_symbol_table(symbol_table_t *table, const char *name, void *value);
int is_vector(symbol_t *symb);

#endif