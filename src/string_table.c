/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   string_table.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/01 00:11:18 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/01 16:43:29 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <inttypes.h>
#include "hash_table.h"

extern htable_t *string_table;

const char *st_get_label(const char *str)
{
	static int num_strings = 0;
	char label[16];

	if (ht_search(string_table, str) == NULL)
	{
		snprintf(label, sizeof(label), "s_%d", num_strings++);
		ht_insert(string_table, str, strdup(label));
	}
	return ht_search(string_table, str);
}
