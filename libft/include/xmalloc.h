/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   xmalloc.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/29 22:53:28 by minsepar          #+#    #+#             */
/*   Updated: 2025/04/29 23:10:22 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef XMALLOC_H
# define XMALLOC_H

#include <stdlib.h>

void	*xmalloc(size_t size);
void	*xcalloc(size_t count, size_t size);

#endif