/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   compiler_struct.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/01 17:54:22 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/02 00:11:35 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <string.h>
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
		list->tail = node;
	}
	list->size++;
}

node_t *create_node(void *data)
{
	node_t *node = (node_t *)malloc(sizeof(node_t));
	if (node == NULL)
	{
		perror("Failed to allocate memory for node");
		exit(EXIT_FAILURE);
	}
	node->data = data;
	node->next = NULL;
	return node;
}

symbol_t *create_symbol(char *name, type_t type, int offset, int arg_num)
{
	symbol_t *symbol;

	symbol = (symbol_t *)xmalloc(sizeof(symbol_t));
	symbol->name = strdup(name);
	switch (type) {
		case (ARGUMENT):
			symbol->type = ARGUMENT;
			symbol->arg_num = arg_num;
			break;
		case (EXTRN):
			symbol->type = EXTRN;
			symbol->stack_offset = 0;
			break;
		case (AUTO):
			symbol->type = AUTO;
			symbol->stack_offset = offset;
			break;
	}
	return symbol;
}
