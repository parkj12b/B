/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parser.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minsepar <minsepar@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/05 23:31:25 by minsepar          #+#    #+#             */
/*   Updated: 2025/05/10 00:02:31 by minsepar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdarg.h>
#include <stdio.h>
#include "codegen.h"

void init_assembly(void)
{
	emit(".intel_syntax noprefix");
	emit("section .text");
}

void exit_label(void)
{
	emit(".exit:");
	emit("leave");
	emit("ret");
}

void eprintf(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vfprintf(stderr, fmt, args);
	va_end(args);
}