/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_struct.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/06 01:12:29 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/13 20:05:02 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include "compiler_struct.h"
#include "xmalloc.h"

void add_node(list_t *list, node_t *node)
{
	if (list->head == NULL)
	{
		list->head = node;
		list->tail = node;
	}
	else
	{
		list->tail->next = node;
		node->prev = list->tail;
		list->tail = node;
	}
	list->size++;
}

node_t *create_node(void *data)
{
	node_t *node = (node_t *)xmalloc(sizeof(node_t));
	if (node == NULL)
	{
		perror("Failed to allocate memory for node");
		exit(EXIT_FAILURE);
	}
	node->data = data;
	node->next = NULL;
	node->prev = NULL;
	return node;
}

list_t *create_list(void)
{
	list_t *list = (list_t *)xmalloc(sizeof(list_t));
	if (list == NULL)
	{
		perror("Failed to allocate memory for list");
		exit(EXIT_FAILURE);
	}
	list->size = 0;
	list->head = NULL;
	list->tail = NULL;
	return list;
}

void	print_constant(const_t *constant)
{
	if (constant == NULL)
	{
		printf("NULL\n");
		return;
	}
	switch (constant->type)
	{
	case CONST_INT:
	case CONST_CHAR:
	// case CONST_FLOAT:
	// 	printf("FLOAT: %zu\n", constant->value);
	// 	break;
		printf("%zd\n", constant->value);
		break;
	case CONST_STRING:
		printf("%s\n", (char *)constant->value);
		break;
	// case CONST_BOOL:
	// 	printf("BOOL: %zu\n", constant->value);
	// 	break;
	default:
		printf("UNKNOWN TYPE\n");
		break;
	}
}

void temp_expr(expr_t *expr)
{
	if (expr->type == LVALUE)
	{
		printf("dword [ebp %+zd]", expr->value);
	}
	else if (expr->type == CONSTANT)
	{
		print_constant(&expr->constant);
	}
	else
	{
		printf("%zu\n", expr->value);
	}
}