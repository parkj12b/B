/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   xmalloc.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/29 22:53:28 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/13 13:57:57 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef XMALLOC_H
# define XMALLOC_H

#include <stdlib.h>

void	*xmalloc(size_t size);
void	*xcalloc(size_t count, size_t size);
void 	*xrealloc(void *ptr, size_t size);

#endif