/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hash_table.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/29 22:48:46 by minsepar          #+#    #+#             */
/*   Updated: 2025/06/01 15:36:29 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <string.h>
#include "xmalloc.h"
#include "hash_table.h"
#include "inttypes.h"
#include "parser.h"

htable_t *ht_create_table(htable_type_t type)
{
	htable_t *table;

	table = (htable_t *)xmalloc(sizeof(htable_t));
	table->count = 0;
	table->capacity = INIT_TABLE_CAPACITY;
	table->entries = (entry_t *)xmalloc(sizeof(entry_t) * table->capacity);
	table->type = type;
	for (int i = 0; i < table->capacity; i++)
	{
		table->entries[i].status = EMPTY;
	}
	return (table);
}

void ht_destroy_table_int(htable_t *table) {
	for (int i = 0; i < table->capacity; i++)
	{
		if (table->entries[i].status == ACTIVE)
		{
			free(table->entries[i].value);
		}
	}
	free(table->entries);
	free(table);
}
#include <stdio.h>
void ht_destroy_table_str(htable_t *table, int free_entries) {
	if (free_entries) {
		for (int i = 0; i < table->capacity; i++)
		{
			if (table->entries[i].status == ACTIVE)
			{
				free((void *)table->entries[i].key);
				free(table->entries[i].value);
			}
		}
	} else {
		for (int i = 0; i < table->capacity; i++)
		{
			if (table->entries[i].status == ACTIVE)
			{
				free((void *)table->entries[i].key);
			}
		}
	}
	free(table->entries);
	free(table);
}

void ht_destroy_table(htable_t *table, int free_entries)
{
	if (table->type == VALUE_INT) {
		if (!free_entries)
			ht_destroy_table_int(table);
	}
	else
		ht_destroy_table_str(table, free_entries);
}

// Return 64-bit FNV-1a hash for key (NUL-terminated). See description:
// https://en.wikipedia.org/wiki/Fowler–Noll–Vo_hash_function
uint64_t hash_str(const void *key)
{
	uint64_t hash = FNV_OFFSET;
	const char *str = (const char *) key;
	for (const char *p = str; *p; p++)
	{
		hash ^= (uint64_t)(unsigned char)(*p);
		hash *= FNV_PRIME;
	}
	return hash;
}

uint64_t hash_int(const void *num) {
	uint64_t x = (uint64_t)num;
    x = (x ^ (x >> 30)) * UINT64_C(0xbf58476d1ce4e5b9);
    x = (x ^ (x >> 27)) * UINT64_C(0x94d049bb133111eb);
    x = x ^ (x >> 31);
    return x;
}

uint64_t hash(const void *key, htable_type_t type) {
	if (type == VALUE_INT)
		return hash_int(key);
	else
		return hash_str(key);
}

void ht_insert(htable_t *table, const void *key, void *value)
{
	uint64_t index;
	entry_t *entry;

	if (table->count >= table->capacity * MAX_LOAD_FACTOR)
		ht_expand_table(table);

	index = hash(key, table->type) % table->capacity;
	entry = table->entries;
	while (entry[index].status == ACTIVE)
	{
		if ((table->type == VALUE_STR && strcmp(entry[index].key, key) == 0)
			|| (table->type == VALUE_INT && entry[index].key == key))
		{
			free((void *)entry[index].key);
			free(entry[index].value);
			break;
		}
		index = (index + 1) % table->capacity;
	}
	if (table->type == VALUE_STR)
		entry[index].key = strdup(key);
	else
		entry[index].key = key;
	entry[index].value = value;
	entry[index].status = ACTIVE;
	table->count++;
}

void *ht_search(htable_t *table, const void *key, int get_entry)
{
	int index;
	entry_t *entry;

	index = (hash(key, table->type) & (table->capacity - 1));
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

void ht_delete_str(htable_t *table, const void *key) {
	entry_t *entry;
	int index;

	index = (hash(key, table->type) & (table->capacity - 1));
	entry = &table->entries[index];
	
	while (entry->status != EMPTY)
	{
		if (entry->status == ACTIVE && (strcmp(entry->key, key) == 0))
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

void ht_delete_int(htable_t *table, const void *key) {
	int index;
	entry_t *entry;

	index = (hash(key, table->type) & (table->capacity - 1));
	entry = &table->entries[index];

	uint64_t entry_key;
	uint64_t int_key = (uint64_t) key;

	while (entry->status != EMPTY)
	{
		entry_key = (uint64_t) key;
		if (entry->status == ACTIVE && entry_key == int_key)
		{
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

void ht_delete(htable_t *table, const void *key)
{
	if (table->type == VALUE_STR)
		ht_delete_str(table, key);
	else
		ht_delete_int(table, key);
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