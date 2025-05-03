/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_struct.h                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 19:27:41 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/02 00:12:31 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef COMPILER_STRUCT_H
#define COMPILER_STRUCT_H

#include "B.tab.h"
#include "vector.h"

typedef enum
{
	CONST_INT,
	CONST_CHAR,
	CONST_STRING,
	LABEL,
	VALUE,
	ARGUMENT,
} type_t;

typedef struct
{
	type_t type;
	union
	{
		int int_val;
		char *str_val;
	};
} const_value_t;

/**
 * @param data	Pointer to the data of the optional value.
 * 				This can be NULL if the value is not present.
 */
typedef struct
{
	void *data;
} optional_t;

/* linked list for List types */

typedef struct
{
	node_t *next;
	void *data;
} node_t;

typedef struct
{
	int size;
	node_t *head;
	node_t *tail;
} list_t;

/**
 *
 */
typedef struct
{
	char *place;
	char *code;
	int is_lvalue;
	int is_const;
	int value;
	int type;
} expr_t;

typedef enum
{
	STORAGE_AUTO = AUTO,
	STORAGE_EXTRN = EXTRN
} storage_class_t;

/* IDENTIFIER */
/**
 * @param offset	Offset from stack base pointer (RBP) for local variables.
 *	 				For global variables, this is 0.
 */
typedef struct Symbol
{
	char *name;
	// storage_class_t	storage_class;
	type_t type;
	union
	{
		int stack_offset;
		int arg_num;
	};

} symbol_t;

typedef struct ival
{
	type_t type; // have to know if it's label or value
	union
	{
		size_t int_val;
		char *str_val;
	};
} ival_t;

typedef struct definition
{
	var_str_t *code;
} definition_t;

void add_node(list_t *list, node_t *node);
symbol_t *create_symbol(char *name, type_t type, int offset, int arg_num);
node_t *create_node(void *data);

#endif