/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_struct.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/06 01:12:29 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/26 22:41:35 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include "parser.h"
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

void	print_constant(const_t *constant, int newline)
{
	switch (constant->type)
	{
	case CONST_INT:
	case CONST_CHAR:
	// case CONST_FLOAT:
	// 	printf("FLOAT: %zu\n", constant->value);
	// 	break;
		oprintf("%zd", constant->value);
		break;
	case CONST_STRING:
		oprintf("%s", (char *)constant->value);
		break;
	// case CONST_BOOL:
	// 	printf("BOOL: %zu\n", constant->value);
	// 	break;
	default:
		oprintf("UNKNOWN TYPE");
		break;
	}
	if (newline)
	{
		oprintf("\n");
	}
}

// void temp_expr(expr_t *expr)
// {
// 	if (expr->type == EXPR_LVALUE)
// 	{
// 		oprintf("dword ptr [ebp %+zd]", expr->value);
// 	}
// 	else if (expr->type == EXPR_CONST)
// 	{
// 		print_constant(&expr->constant, 1);
// 	}
// 	else
// 	{
// 		oprintf("%zu\n", expr->value);
// 	}
// }