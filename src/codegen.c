/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   codegen.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/30 14:32:54 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/26 00:44:55 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "symbol_table.h"
#include "parser.h"
#include "codegen.h"
#include "xmalloc.h"


void emit(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vfprintf(tmp, fmt, args);
	fprintf(tmp, "\n");
	va_end(args);
}

void add_patch_position(char *name, long patch_position) {
	list_t *position_list;
	eprintf("entering add patch position\n");
	position_list = (list_t *)ht_search(temp_patch_table, name, 0);
	if (position_list == NULL)
	{
		position_list = (list_t *)xmalloc(sizeof(list_t));
		ht_insert(temp_patch_table, name, position_list);
	}
	
	node_t *new_node = create_node((void *)patch_position);
	add_node(position_list, new_node);
}

void patch_temp_var(char *name, int local_var_size) {
	list_t *pos_list = (list_t *)ht_search(temp_patch_table, name, 0);
	node_t *cur_node = pos_list->head;
	node_t *prev;

	static char buffer[256];
	static char patch[8];

	while (cur_node) {
		long line_start = (long) cur_node->data;
		fflush(tmp);
		fseek(tmp, line_start, SEEK_SET);
		fgets(buffer, sizeof(buffer), tmp);

		char *placeholder = strstr(buffer, "@000000");
		if(!placeholder) {
			yyerror("placeholder not found");
		}

		symbol_t *symb = get_symbol(name);

		long placeholder_offset = line_start + (placeholder - buffer);
		int offset = local_var_size + symb->location.offset;
		
		snprintf(patch, sizeof(patch), "%+07d", local_var_size);
		fflush(tmp);
		fseek(tmp, placeholder_offset, SEEK_SET);
		fwrite(patch, 1, 7, tmp);
		prev = cur_node;
		cur_node = cur_node->next;
		free(prev);
	}
	fseek(tmp, 0, SEEK_END);
}