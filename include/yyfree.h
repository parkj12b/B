/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   yyfree.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/16 14:51:31 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/16 17:20:02 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef YYFREE_H
# define YYFREE_H

# include "compiler_struct.h"

void yydelete_default(void *ptr);
void yydelete_list(list_t *list);

#endif