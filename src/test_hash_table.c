#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hash_table.h"

void test_ht_create_and_destroy()
{
	htable_t *table = ht_create_table();
	if (table == NULL || table->count != 0 || table->capacity != INIT_TABLE_CAPACITY)
	{
		printf("test_ht_create_and_destroy: FAILED\n");
		return;
	}
	ht_destroy_table(table);
	printf("test_ht_create_and_destroy: PASSED\n");
}

void test_ht_insert_and_search()
{
	htable_t *table = ht_create_table();
	char *key = "test_key";
	char *value = "test_value";

	ht_insert(table, key, strdup(value));
	char *retrieved_value = (char *)ht_search(table, key);

	if (retrieved_value == NULL || strcmp(retrieved_value, value) != 0)
	{
		printf("test_ht_insert_and_search: FAILED\n");
		ht_destroy_table(table);
		return;
	}

	ht_destroy_table(table);
	printf("test_ht_insert_and_search: PASSED\n");
}

void test_ht_delete()
{
	htable_t *table = ht_create_table();
	char *key = "test_key";
	char *value = "test_value";

	ht_insert(table, key, strdup(value));
	ht_delete(table, key);
	void *retrieved_value = ht_search(table, key);

	if (retrieved_value != NULL)
	{
		printf("test_ht_delete: FAILED\n");
		ht_destroy_table(table);
		return;
	}

	ht_destroy_table(table);
	printf("test_ht_delete: PASSED\n");
}

void test_ht_expand_table()
{
	htable_t *table = ht_create_table();
	int initial_capacity = table->capacity;

	for (int i = 0; i < initial_capacity; i++)
	{
		char key[16];
		snprintf(key, sizeof(key), "key_%d", i);
		printf("%s\n", key);
		ht_insert(table, key, strdup("value"));
	}

	if (table->capacity <= initial_capacity)
	{
		printf("test_ht_expand_table: FAILED\n");
		ht_destroy_table(table);
		return;
	}

	ht_destroy_table(table);
	printf("test_ht_expand_table: PASSED\n");
}

void test_ht_shrink_table()
{
	htable_t *table = ht_create_table();
	int initial_capacity = table->capacity;

	for (int i = 0; i < initial_capacity * 4; i++)
	{
		char key[16];
		snprintf(key, sizeof(key), "key_%d", i);
		printf("%s\n", key);
		ht_insert(table, key, strdup("value"));
	}

	for (int i = 0; i < initial_capacity * 4; i++)
	{
		char key[16];
		snprintf(key, sizeof(key), "key_%d", i);
		ht_delete(table, key);
	}

	printf("capacity: %d\n", table->capacity);
	if (table->capacity == INIT_TABLE_CAPACITY * 2)
	{
		printf("test_ht_shrink_table: PASSED\n");
		ht_destroy_table(table);
		return;
	}

	printf("test_ht_shrink_table: FAILED\n");
	ht_destroy_table(table);
}

void test_ht_module()
{
	test_ht_create_and_destroy();
	test_ht_insert_and_search();
	test_ht_delete();
	test_ht_expand_table();
	test_ht_shrink_table();
}