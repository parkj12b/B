/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_struct.h                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/04 23:26:15 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/26 22:49:55 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef COMPILER_STRUCT_H
#define COMPILER_STRUCT_H

#include <sys/types.h>
/* list_t */

typedef struct node_s
{
	struct node_s *next;
	struct node_s *prev;
	void *data;
} node_t;

typedef struct list_s
{
	size_t size;
	node_t *head;
	node_t *tail;
} list_t;

/* const_t */

typedef enum
{
	CONST_INT,
	CONST_FLOAT,
	CONST_STRING,
	CONST_CHAR,
	CONST_BOOL,
} const_type_t;

typedef struct const_s
{
	const_type_t type;
	ssize_t value;
} const_t;

/* statement */
// TODO: add statement types
typedef struct statement_s
{
	int type;
	void *data;
	size_t label_num;
} statement_t;

typedef enum
{
	EXPR_VAL,
    EXPR_CONST,
	EXPR_DEREF,
} expr_type_t;

typedef enum { EXPR_LVALUE, EXPR_RVALUE } expr_value_kind_t;

typedef enum { 
	EXPR_VAR,       // variable (scalar or vector base)
    EXPR_TEMP,      // temporary value (compiler-generated)
} expr_storage_kind_t;

/* expr */
typedef struct expr_s
{
	expr_storage_kind_t storage_kind;
	expr_value_kind_t val_kind;
	expr_type_t type;
	union {
		const_t constant;
		ssize_t 	value;
		char 	*identifier;
	};
} expr_t;

typedef enum
{
	OPT_NONE,
	OPT_VALUE,
	INIT,
	NOINIT,
} opt_kind_t;

typedef struct opt_s
{
	opt_kind_t kind;
	union
	{
		list_t list;
		expr_t expr;
		const_t constant;
		statement_t statement;
	} value;
} opt_t;

/* ival */

typedef enum
{
	IVAL_CONST,
	IVAL_IDENTIFIER,
} ival_type_t;

/**
 * can be:
 * - const_t
 * - IDENTIFIER
 * @param type		type of the value
 * @param value		contains const_t or identifier
 * 					identifier is a string reference to
 * 					external symbol
 */
typedef struct ival_s
{
	ival_type_t type;
	union
	{
		const_t constant;
		char *identifier;
	} value;
} ival_t;

typedef struct definition_s
{
	int type;
} definition_t;

typedef struct var_decl_s
{
	char *name;
	const_t *constant;
} var_decl_t;

/* compiler_struct.c */
void add_node(list_t *list, node_t *node);
node_t *create_node(void *data);
list_t *create_list(void);
void print_constant(const_t *constant, int newline);

#endif