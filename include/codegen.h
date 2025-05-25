/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   codegen.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: root <root@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/01 15:23:09 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/25 23:00:10 by root             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CODEGEN_H
# define CODEGEN_H

# include <stdlib.h>

extern FILE	*tmp;

void emit(const char *fmt, ...);
void add_patch_position(char *name, long patch_position);
void patch_temp_var(char *name, int local_var_size);

#endif