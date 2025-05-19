/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   yyfree.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/16 14:51:20 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/16 16:24:41 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "compiler_struct.h"

void yydelete_default(void *ptr)
{
	free(ptr);
}

void yydelete_list(list_t *list)
{
	node_t *cur = list->head;
	node_t *next_node;

	while (cur)
	{
		next_node = cur->next;
		free(cur->data);
		free(cur);
		cur = next_node;
	}
}