/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_B_TAB_H_INCLUDED
# define YY_YY_B_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 48 "src/B.y"

    #include "compiler_struct.h"

#line 53 "B.tab.h"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    NUMBER = 258,                  /* NUMBER  */
    CHARCONST = 259,               /* CHARCONST  */
    IDENTIFIER = 260,              /* IDENTIFIER  */
    STRING = 261,                  /* STRING  */
    AUTO = 262,                    /* AUTO  */
    EXTRN = 263,                   /* EXTRN  */
    IF = 264,                      /* IF  */
    ELSE = 265,                    /* ELSE  */
    WHILE = 266,                   /* WHILE  */
    SWITCH = 267,                  /* SWITCH  */
    GOTO = 268,                    /* GOTO  */
    RETURN = 269,                  /* RETURN  */
    CASE = 270,                    /* CASE  */
    NOT = 271,                     /* NOT  */
    ASM = 272,                     /* ASM  */
    ASSIGN = 273,                  /* ASSIGN  */
    INC = 274,                     /* INC  */
    DEC = 275,                     /* DEC  */
    OR = 276,                      /* OR  */
    EQ = 277,                      /* EQ  */
    NEQ = 278,                     /* NEQ  */
    LT = 279,                      /* LT  */
    LE = 280,                      /* LE  */
    GT = 281,                      /* GT  */
    GE = 282,                      /* GE  */
    LSHIFT = 283,                  /* LSHIFT  */
    RSHIFT = 284,                  /* RSHIFT  */
    STAR = 285,                    /* STAR  */
    SLASH = 286,                   /* SLASH  */
    MOD = 287,                     /* MOD  */
    PLUS = 288,                    /* PLUS  */
    MINUS = 289,                   /* MINUS  */
    LPAREN = 290,                  /* LPAREN  */
    RPAREN = 291,                  /* RPAREN  */
    LBRACE = 292,                  /* LBRACE  */
    RBRACE = 293,                  /* RBRACE  */
    LBRACKET = 294,                /* LBRACKET  */
    RBRACKET = 295,                /* RBRACKET  */
    SEMICOLON = 296,               /* SEMICOLON  */
    COMMA = 297,                   /* COMMA  */
    COLON = 298,                   /* COLON  */
    QUESTION = 299,                /* QUESTION  */
    AMPERSAND = 300,               /* AMPERSAND  */
    ASSIGN_OR = 301,               /* ASSIGN_OR  */
    ASSIGN_LSHIFT = 302,           /* ASSIGN_LSHIFT  */
    ASSIGN_RSHIFT = 303,           /* ASSIGN_RSHIFT  */
    ASSIGN_MINUS = 304,            /* ASSIGN_MINUS  */
    ASSIGN_PLUS = 305,             /* ASSIGN_PLUS  */
    ASSIGN_MOD = 306,              /* ASSIGN_MOD  */
    ASSIGN_MUL = 307,              /* ASSIGN_MUL  */
    ASSIGN_DIVIDE = 308,           /* ASSIGN_DIVIDE  */
    ERROR = 309,                   /* ERROR  */
    TERNARY = 310,                 /* TERNARY  */
    UNARY = 311,                   /* UNARY  */
    DEREF = 312,                   /* DEREF  */
    ADDR_OF = 313,                 /* ADDR_OF  */
    THEN = 314                     /* THEN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 54 "src/B.y"

    /* primitive constants */
    size_t          ival;
    char            *sval;

    opt_t           opt;    // for optional values
    list_t          list;   // for list values
    const_t         constant; // for constant types
    statement_t     statement; // for statement types
    expr_t          expr;   // for expression types
    ival_t          ival_s;   // for ival types
    definition_t    definition; // for definition types
    var_decl_t      var_decl; // for variable declaration types

#line 144 "B.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_B_TAB_H_INCLUDED  */
