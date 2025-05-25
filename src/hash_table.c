/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hash_table.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/29 22:48:46 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/25 23:24:22 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <string.h>
#include "xmalloc.h"
#include "hash_table.h"
#include "inttypes.h"
#include "parser.h"

htable_t *ht_create_table(void)
{
	htable_t *table;

	table = (htable_t *)xmalloc(sizeof(htable_t));
	table->count = 0;
	table->capacity = INIT_TABLE_CAPACITY;
	table->entries = (entry_t *)xmalloc(sizeof(entry_t) * table->capacity);
	for (int i = 0; i < table->capacity; i++)
	{
		table->entries[i].key = NULL;
		table->entries[i].value = NULL;
		table->entries[i].status = EMPTY;
	}
	return (table);
}

void ht_destroy_table(htable_t *table)
{
	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status == ACTIVE)
		{
			free((void *)table->entries[i].key);
			free(table->entries[i].value);
		}
	}
	free(table->entries);
	free(table);
}

// Return 64-bit FNV-1a hash for key (NUL-terminated). See description:
// https://en.wikipedia.org/wiki/Fowler–Noll–Vo_hash_function
static uint64_t hash(const char *key)
{
	uint64_t hash = FNV_OFFSET;
	for (const char *p = key; *p; p++)
	{
		hash ^= (uint64_t)(unsigned char)(*p);
		hash *= FNV_PRIME;
	}
	return hash;
}

void ht_insert(htable_t *table, const char *key, void *value)
{
	uint64_t index;
	entry_t *entry;

	if (table->count >= table->capacity * MAX_LOAD_FACTOR)
		ht_expand_table(table);

	index = hash(key) % table->capacity;
	entry = table->entries;
	while (entry[index].status == ACTIVE)
	{
		if (strcmp(entry[index].key, key) == 0)
		{
			free((void *)entry[index].key);
			free(entry[index].value);
			break;
		}
		index = (index + 1) % table->capacity;
	}
	entry[index].key = strdup(key);
	entry[index].value = value;
	entry[index].status = ACTIVE;
	table->count++;
}

void *ht_search(htable_t *table, const char *key, int get_entry)
{
	int index;
	entry_t *entry;

	index = (hash(key) & (table->capacity - 1));
	entry = &table->entries[index];
	while (entry->status != EMPTY)
	{
		if (!(entry->status == ACTIVE && strcmp(entry->key, key) == 0))
		{
			index = ((index + 1) & (table->capacity - 1));
			entry = &table->entries[index];
			continue;
		}
		if (get_entry)
			return entry;
		else
			return entry->value;
	}
	return NULL;
}


#include <stdio.h>

void ht_expand_table(htable_t *table)
{
	int old_capacity;
	entry_t *old_entries;

	eprintf("Expanding table from %d to %d. current count %d\n", table->capacity, table->capacity * 2, table->count);
	old_capacity = table->capacity;
	old_entries = table->entries;
	table->capacity *= 2;

	// no need to initialize new entries since we use calloc
	table->entries = (entry_t *)xcalloc(sizeof(entry_t), table->capacity);
	table->count = 0;

	for (int i = 0; i < old_capacity; i++)
	{
		if (old_entries[i].status == ACTIVE) {
			ht_insert(table, old_entries[i].key, old_entries[i].value);
			free((void *)old_entries[i].key);
		}
	}
	free(old_entries);
}

void ht_delete(htable_t *table, const char *key)
{
	int index;
	entry_t *entry;

	index = (hash(key) & (table->capacity - 1));
	entry = &table->entries[index];
	while (entry->status != EMPTY)
	{
		if (entry->status == ACTIVE && strcmp(entry->key, key) == 0)
		{
			free((void *)entry->key);
			free(entry->value);
			entry->status = DELETED;
			table->count--;
			if (table->count <= table->capacity * MIN_LOAD_FACTOR)
			{
				eprintf("Shrinking table from %d to %d. current count %d\n", table->capacity, table->capacity / 2, table->count);
				ht_shrink_table(table);
			}
			return;
		}
		index = ((index + 1) & (table->capacity - 1));
		entry = &table->entries[index];
	}
}

void ht_shrink_table(htable_t *table)
{
	if (table->capacity <= MIN_TABLE_CAPACITY)
		return;
	int old_capacity;
	entry_t *old_entries;

	old_capacity = table->capacity;
	old_entries = table->entries;
	table->capacity /= 2;
	table->count = 0;

	// no need to initialize new entries since we use calloc
	table->entries = (entry_t *)xcalloc(sizeof(entry_t), table->capacity);

	for (int i = 0; i < old_capacity; i++)
	{
		if (old_entries[i].status == ACTIVE) {
			ht_insert(table, old_entries[i].key, old_entries[i].value);
			free((void *)old_entries[i].key);
		}
	}
	free(old_entries);
}

void print_table(htable_t *table)
{
	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status == ACTIVE)
			eprintf("Key: %s, Value: %p\n", table->entries[i].key, table->entries[i].value);
	}
}