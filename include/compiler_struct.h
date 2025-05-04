/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_struct.h                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/04 23:26:15 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/04 23:50:23 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef COMPILER_STRUCT_H
#define COMPILER_STRUCT_H

typedef struct opt_s
{
	void *data;
} opt_t;

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
	int type;
	void *value;
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

#endif