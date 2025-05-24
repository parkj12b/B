/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   string_table.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/06 00:51:52 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/18 14:41:30 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "parser.h"
#include "hash_table.h"

extern htable_t *string_table;

const char *st_get_label(const char *str)
{
	static int num_strings = 0;
	char label[16];
	char *label_ptr = NULL;

	label_ptr = ht_search(string_table, str, 0);
	if (label_ptr == NULL)
	{
		snprintf(label, sizeof(label), "s_%d", num_strings++);
		label_ptr = strdup(label);
		ht_insert(string_table, str, label_ptr);
	}
	return label_ptr;
}

void st_print_table(void)
{
	oprintf("section .rodata\n");
	for (int i = 0; i < string_table->capacity; i++)
	{
		if (string_table->entries[i].status == ACTIVE)
		{
			oprintf("%s db ", (char *)(string_table->entries[i].value));
			oprintf("%s\n", (char *)(string_table->entries[i].key));
		}
	}
}