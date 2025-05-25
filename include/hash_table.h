/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hash_table.h                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/29 22:26:22 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/25 22:56:00 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef HASH_TABLE_H
#define HASH_TABLE_H

/* table attribute */
#define INIT_TABLE_CAPACITY 16
#define MIN_TABLE_CAPACITY 32
#define MAX_LOAD_FACTOR 0.75
#define MIN_LOAD_FACTOR 0.25

/* hash function */
#define FNV_OFFSET 14695981039346656037UL
#define FNV_PRIME 1099511628211UL

typedef enum
{
	EMPTY,
	ACTIVE,
	DELETED
} entry_status_t;

typedef struct
{
	const char *key;
	void *value;
	entry_status_t status;
} entry_t;

typedef struct
{
	int count;
	int capacity;
	entry_t *entries;
} htable_t;

/* hash table functions */

/**
 * * @brief Create a new hash table.
 */
htable_t *ht_create_table(void);

/**
 * * @brief Destroy the hash table and free all memory.
 * * @param table The hash table to destroy.
 */
void ht_destroy_table(htable_t *table);

/**
 * * @brief 	Insert a key-value pair into the hash table.
 * * @details 	If the key already exists, the value is updated.
 * 				If the table is over MAX_LOAD_FACTOR, it will be expanded.
 */
void ht_insert(htable_t *table, const char *key, void *value);

/**
 * * @brief Search for a value in the hash table by key.
 */
void *ht_search(htable_t *table, const char *key, int get_entry);

/**
 * * @brief Expand the hash table to accommodate more entries.
 */
void ht_expand_table(htable_t *table);

/**
 * * @brief 	Delete a key-value pair from the hash table.
 * * @details 	If the key does not exist, nothing happens.
 * 				If the table is under MIN_LOAD_FACTOR, it will be shrunk.
 */
void ht_delete(htable_t *table, const char *key);

/**
 * * @brief Shrink the hash table to save memory.
 */
void ht_shrink_table(htable_t *table);

/* string_table.c */
const char *st_get_label(const char *str);
void print_table(htable_t *table);
void st_print_table(void);

#endif