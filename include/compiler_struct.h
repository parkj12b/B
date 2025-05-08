/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_struct.h                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/04 23:26:15 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/08 21:16:29 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef COMPILER_STRUCT_H
#define COMPILER_STRUCT_H

/* list_t */

typedef struct node_s
{
	struct node_s *next;
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
	size_t value;
} const_t;

/* statement */
// TODO: add statement types
typedef struct statement_s
{
	int type;
	void *data;
} statement_t;

/* expr */
typedef struct expr_s
{
	int type;
	void *data;
} expr_t;

typedef enum
{
	OPT_NONE,
	OPT_VALUE,
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
void print_constant(const_t *constant);

#endif