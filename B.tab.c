/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "src/B.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <assert.h>
#include <stdbool.h>
#include "hash_table.h"
#include "symbol_table.h"
#include "vector.h"
#include "xmalloc.h"
#include "codegen.h"
#include "parser.h"
#include "parser_procedure.h"
#include "compiler_struct.h"
#include "yyfree.h"

int yylex(void);
extern int  yylineno;
extern FILE *yyin;
FILE        *out = NULL;
void yyerror(const char *msg);

/* Memory management functions */

/**
 * Since all table data is needed till the end of the program,
 * there is no need to free the symbol table.
*/
symbol_table_t  *global_table;
symbol_table_t  *current_table;
symbol_table_t  *global_init;
symbol_table_t  *global_uninit;
htable_t        *function_table;
htable_t        *string_table;
htable_t        *auto_table;

size_t          label_counter = 0;
size_t          label_index = 0;
size_t          label_stack[128];
size_t          loop_label_index = 0;
size_t          loop_label_stack[128];

/* offset stack */
int offset_stack_value;
int max_stack_value;
int temp_depth = 0;

#line 120 "B.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "B.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_NUMBER = 3,                     /* NUMBER  */
  YYSYMBOL_CHARCONST = 4,                  /* CHARCONST  */
  YYSYMBOL_IDENTIFIER = 5,                 /* IDENTIFIER  */
  YYSYMBOL_STRING = 6,                     /* STRING  */
  YYSYMBOL_AUTO = 7,                       /* AUTO  */
  YYSYMBOL_EXTRN = 8,                      /* EXTRN  */
  YYSYMBOL_IF = 9,                         /* IF  */
  YYSYMBOL_ELSE = 10,                      /* ELSE  */
  YYSYMBOL_WHILE = 11,                     /* WHILE  */
  YYSYMBOL_SWITCH = 12,                    /* SWITCH  */
  YYSYMBOL_GOTO = 13,                      /* GOTO  */
  YYSYMBOL_RETURN = 14,                    /* RETURN  */
  YYSYMBOL_CASE = 15,                      /* CASE  */
  YYSYMBOL_NOT = 16,                       /* NOT  */
  YYSYMBOL_BREAK = 17,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 18,                  /* CONTINUE  */
  YYSYMBOL_ASSIGN = 19,                    /* ASSIGN  */
  YYSYMBOL_INC = 20,                       /* INC  */
  YYSYMBOL_DEC = 21,                       /* DEC  */
  YYSYMBOL_OR = 22,                        /* OR  */
  YYSYMBOL_EQ = 23,                        /* EQ  */
  YYSYMBOL_NEQ = 24,                       /* NEQ  */
  YYSYMBOL_LT = 25,                        /* LT  */
  YYSYMBOL_LE = 26,                        /* LE  */
  YYSYMBOL_GT = 27,                        /* GT  */
  YYSYMBOL_GE = 28,                        /* GE  */
  YYSYMBOL_LSHIFT = 29,                    /* LSHIFT  */
  YYSYMBOL_RSHIFT = 30,                    /* RSHIFT  */
  YYSYMBOL_STAR = 31,                      /* STAR  */
  YYSYMBOL_SLASH = 32,                     /* SLASH  */
  YYSYMBOL_MOD = 33,                       /* MOD  */
  YYSYMBOL_PLUS = 34,                      /* PLUS  */
  YYSYMBOL_MINUS = 35,                     /* MINUS  */
  YYSYMBOL_LPAREN = 36,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 37,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 38,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 39,                    /* RBRACE  */
  YYSYMBOL_LBRACKET = 40,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 41,                  /* RBRACKET  */
  YYSYMBOL_SEMICOLON = 42,                 /* SEMICOLON  */
  YYSYMBOL_COMMA = 43,                     /* COMMA  */
  YYSYMBOL_COLON = 44,                     /* COLON  */
  YYSYMBOL_QUESTION = 45,                  /* QUESTION  */
  YYSYMBOL_AMPERSAND = 46,                 /* AMPERSAND  */
  YYSYMBOL_ASSIGN_OR = 47,                 /* ASSIGN_OR  */
  YYSYMBOL_ASSIGN_LSHIFT = 48,             /* ASSIGN_LSHIFT  */
  YYSYMBOL_ASSIGN_RSHIFT = 49,             /* ASSIGN_RSHIFT  */
  YYSYMBOL_ASSIGN_MINUS = 50,              /* ASSIGN_MINUS  */
  YYSYMBOL_ASSIGN_PLUS = 51,               /* ASSIGN_PLUS  */
  YYSYMBOL_ASSIGN_MOD = 52,                /* ASSIGN_MOD  */
  YYSYMBOL_ASSIGN_MUL = 53,                /* ASSIGN_MUL  */
  YYSYMBOL_ASSIGN_DIVIDE = 54,             /* ASSIGN_DIVIDE  */
  YYSYMBOL_ERROR = 55,                     /* ERROR  */
  YYSYMBOL_TERNARY = 56,                   /* TERNARY  */
  YYSYMBOL_UNARY = 57,                     /* UNARY  */
  YYSYMBOL_DEREF = 58,                     /* DEREF  */
  YYSYMBOL_ADDR_OF = 59,                   /* ADDR_OF  */
  YYSYMBOL_THEN = 60,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 61,                  /* $accept  */
  YYSYMBOL_program = 62,                   /* program  */
  YYSYMBOL_definition = 63,                /* definition  */
  YYSYMBOL_64_1 = 64,                      /* $@1  */
  YYSYMBOL_opt_ident_list = 65,            /* opt_ident_list  */
  YYSYMBOL_ident_list = 66,                /* ident_list  */
  YYSYMBOL_opt_ival_list = 67,             /* opt_ival_list  */
  YYSYMBOL_ival_list = 68,                 /* ival_list  */
  YYSYMBOL_ival = 69,                      /* ival  */
  YYSYMBOL_opt_const = 70,                 /* opt_const  */
  YYSYMBOL_constant = 71,                  /* constant  */
  YYSYMBOL_var_decl = 72,                  /* var_decl  */
  YYSYMBOL_var_decl_list = 73,             /* var_decl_list  */
  YYSYMBOL_opt_statement = 74,             /* opt_statement  */
  YYSYMBOL_opt_paren_expr = 75,            /* opt_paren_expr  */
  YYSYMBOL_opt_expr = 76,                  /* opt_expr  */
  YYSYMBOL_statement = 77,                 /* statement  */
  YYSYMBOL_simple_statement = 78,          /* simple_statement  */
  YYSYMBOL_auto = 79,                      /* auto  */
  YYSYMBOL_extrn = 80,                     /* extrn  */
  YYSYMBOL_colon = 81,                     /* colon  */
  YYSYMBOL_statement_prefix = 82,          /* statement_prefix  */
  YYSYMBOL_if_expr = 83,                   /* if_expr  */
  YYSYMBOL_if_closed = 84,                 /* if_closed  */
  YYSYMBOL_while_expr = 85,                /* while_expr  */
  YYSYMBOL_86_2 = 86,                      /* $@2  */
  YYSYMBOL_open_statement = 87,            /* open_statement  */
  YYSYMBOL_closed_statement = 88,          /* closed_statement  */
  YYSYMBOL_assign = 89,                    /* assign  */
  YYSYMBOL_opt_expr_list = 90,             /* opt_expr_list  */
  YYSYMBOL_expr_list = 91,                 /* expr_list  */
  YYSYMBOL_expr = 92,                      /* expr  */
  YYSYMBOL_93_3 = 93,                      /* @3  */
  YYSYMBOL_94_4 = 94,                      /* @4  */
  YYSYMBOL_binary = 95                     /* binary  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   623

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  61
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  35
/* YYNRULES -- Number of rules.  */
#define YYNRULES  103
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  177

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   315


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   113,   113,   115,   124,   153,   185,   185,   242,   245,
     253,   261,   269,   272,   279,   289,   300,   305,   312,   315,
     323,   327,   333,   345,   360,   369,   381,   384,   391,   394,
     401,   404,   411,   412,   416,   420,   429,   439,   446,   458,
     465,   472,   483,   484,   485,   489,   500,   506,   506,   521,
     525,   528,   534,   538,   539,   542,   548,   549,   553,   559,
     564,   569,   574,   579,   584,   589,   594,   602,   605,   612,
     622,   632,   637,   642,   646,   678,   681,   685,   694,   703,
     717,   730,   739,   750,   758,   768,   778,   785,   778,   806,
     809,   812,   815,   818,   821,   824,   827,   830,   833,   836,
     839,   842,   845,   848
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "NUMBER", "CHARCONST",
  "IDENTIFIER", "STRING", "AUTO", "EXTRN", "IF", "ELSE", "WHILE", "SWITCH",
  "GOTO", "RETURN", "CASE", "NOT", "BREAK", "CONTINUE", "ASSIGN", "INC",
  "DEC", "OR", "EQ", "NEQ", "LT", "LE", "GT", "GE", "LSHIFT", "RSHIFT",
  "STAR", "SLASH", "MOD", "PLUS", "MINUS", "LPAREN", "RPAREN", "LBRACE",
  "RBRACE", "LBRACKET", "RBRACKET", "SEMICOLON", "COMMA", "COLON",
  "QUESTION", "AMPERSAND", "ASSIGN_OR", "ASSIGN_LSHIFT", "ASSIGN_RSHIFT",
  "ASSIGN_MINUS", "ASSIGN_PLUS", "ASSIGN_MOD", "ASSIGN_MUL",
  "ASSIGN_DIVIDE", "ERROR", "TERNARY", "UNARY", "DEREF", "ADDR_OF", "THEN",
  "$accept", "program", "definition", "$@1", "opt_ident_list",
  "ident_list", "opt_ival_list", "ival_list", "ival", "opt_const",
  "constant", "var_decl", "var_decl_list", "opt_statement",
  "opt_paren_expr", "opt_expr", "statement", "simple_statement", "auto",
  "extrn", "colon", "statement_prefix", "if_expr", "if_closed",
  "while_expr", "$@2", "open_statement", "closed_statement", "assign",
  "opt_expr_list", "expr_list", "expr", "@3", "@4", "binary", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-53)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-47)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -53,    18,   -53,     9,   -53,   -53,   -53,   -53,   -53,     5,
      47,   -20,   -11,   -53,   -53,   -53,   -53,    -8,    -2,   -53,
     -53,    24,     6,    41,    24,   -53,   139,   -53,    12,     4,
      50,     5,    20,   -53,   160,    21,   160,    17,    35,   160,
     160,   160,   160,   160,   -53,   160,   -53,    46,   -53,   -53,
     -53,   -53,   -53,   139,   139,    79,   139,   -53,   -53,   -53,
     440,   -53,   -53,   -53,    47,   -53,   -18,    -1,   160,    54,
     -53,   188,   160,    49,     0,   -53,   -53,     0,     0,     0,
       0,   224,    90,     0,   -53,   -53,   -53,   -53,    92,   139,
     -53,   -53,   160,   -53,   -53,   160,   160,   160,   160,   160,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   -53,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   -53,   -53,    50,   -53,   260,   160,   -53,   296,   -53,
     -53,   -53,   -53,   -53,   -53,   440,   502,   543,   543,   560,
     560,   560,   560,   577,   577,     0,     0,     0,   583,   583,
      63,    62,   440,   332,   160,   526,   440,   440,   440,   440,
     440,   440,   440,   440,   -53,   -53,   368,   -53,   -53,   160,
     -53,   404,   -53,   440,   -53,   160,   475
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,     0,     1,    12,     3,    22,    20,    17,    21,     8,
      18,     0,    13,    14,    16,    10,     6,     9,     0,    19,
       4,     0,     0,     0,    12,    15,    30,    11,     0,    72,
       0,     0,     0,    47,     0,    28,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,    71,     0,     7,    53,
      42,    43,    44,    30,    30,     0,    30,    32,    33,    75,
      31,    76,     5,    41,    18,    24,     0,     0,     0,     0,
      72,     0,     0,     0,    82,    37,    38,    77,    78,    83,
      81,     0,    30,    84,    36,    52,    56,    49,    33,    30,
      51,    55,     0,    79,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    67,
       0,    86,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    23,    39,     0,    40,     0,     0,    34,     0,    35,
      73,    57,    27,    50,    54,    58,    89,    92,    93,    94,
      95,    96,    97,    98,    99,    90,   103,   102,   101,   100,
       0,    68,    69,     0,     0,    91,    59,    60,    61,    62,
      63,    64,    65,    66,    25,    45,     0,    29,    74,     0,
      85,     0,    48,    70,    87,     0,    88
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -53,   -53,   -53,   -53,   -53,    29,    85,   -53,    91,    51,
      23,   -10,   -53,   -53,   -53,   -53,   -51,   -53,   -53,   -53,
     -53,   -53,   -53,   -53,   -53,   -53,   -52,   -37,   -53,   -53,
     -53,   -34,   -53,   -53,   -53
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     1,     4,    22,    16,    17,    11,    12,    13,    18,
      46,    65,    66,    82,    73,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    69,    57,    58,    59,   150,
     151,    60,   154,   175,    61
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      71,    85,    74,    87,    90,    77,    78,    79,    80,    81,
      15,    83,     5,     6,     7,     8,    86,    88,     2,    91,
      93,    94,    20,     3,   122,   123,    14,     5,     6,     7,
       8,   132,    21,    19,   125,    23,   109,   133,   128,    24,
     110,   124,    23,    26,    14,     9,    27,    14,    63,    10,
       5,     6,   134,     8,    62,    64,    68,    72,   135,    75,
      67,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   148,   149,   152,   153,    76,   155,   156,
     157,   158,   159,   160,   161,   162,   163,    19,    84,    89,
     126,   129,   166,     5,     6,    29,     8,    30,    31,    32,
     168,    33,   -46,    34,    35,   169,    36,    37,    38,    28,
      39,    40,    25,   164,     0,   121,     0,     0,     0,     0,
     171,    41,     0,     0,     0,    42,    43,     0,    44,   131,
       0,     0,     0,     0,     0,   173,    45,     0,     0,     0,
       0,   176,     5,     6,    29,     8,    30,    31,    32,     0,
      33,     0,    34,    35,     0,    36,    37,    38,     0,    39,
      40,     0,     0,     5,     6,    70,     8,     0,     0,     0,
      41,     0,     0,     0,    42,    43,    36,    44,     0,     0,
      39,    40,     0,     0,     0,    45,     0,     0,     0,     0,
       0,    41,     0,     0,     0,    42,    43,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    45,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,     0,     0,     0,   110,     0,
     127,     0,     0,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,    92,    93,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,   130,     0,     0,   110,     0,     0,     0,     0,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,   109,   165,     0,     0,
     110,     0,     0,     0,     0,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,    92,    93,    94,    95,    96,
      97,    98,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,   109,   167,     0,     0,   110,     0,     0,     0,
       0,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,    92,    93,    94,    95,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,     0,
       0,     0,   110,   170,     0,     0,     0,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   172,     0,     0,   110,     0,
       0,     0,     0,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,    92,    93,    94,    95,    96,    97,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,     0,     0,     0,   110,     0,     0,     0,   174,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   101,   102,
     103,   104,   105,   106,   107,   108,   109,     0,     0,     0,
     110,     0,     0,     0,     0,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,    93,    94,    95,    96,    97,
      98,    99,   100,   101,   102,   103,   104,   105,   106,   107,
     108,   109,     0,     0,     0,   110,     0,     0,     0,     0,
     111,   112,    93,    94,     0,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,   108,   109,     0,
       0,     0,   110,     0,     0,     0,    93,    94,   112,    96,
      97,    98,    99,   100,   101,   102,   103,   104,   105,   106,
     107,   108,   109,    93,    94,     0,   110,     0,    98,    99,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
      93,    94,     0,   110,     0,     0,     0,     0,     0,   102,
     103,   104,   105,   106,   107,   108,   109,    93,    94,     0,
     110,     0,     0,    93,    94,     0,     0,     0,   104,   105,
     106,   107,   108,   109,   104,   105,   106,   110,     0,   109,
       0,     0,     0,   110
};

static const yytype_int16 yycheck[] =
{
      34,    53,    36,    54,    56,    39,    40,    41,    42,    43,
       5,    45,     3,     4,     5,     6,    53,    54,     0,    56,
      20,    21,    42,     5,    42,    43,     3,     3,     4,     5,
       6,    82,    43,    10,    68,    43,    36,    89,    72,    41,
      40,    42,    43,    37,    21,    36,     5,    24,    44,    40,
       3,     4,    89,     6,    42,     5,    36,    36,    92,    42,
      31,    95,    96,    97,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,    42,   112,   113,
     114,   115,   116,   117,   118,   119,   120,    64,    42,    10,
      36,    42,   126,     3,     4,     5,     6,     7,     8,     9,
      37,    11,    10,    13,    14,    43,    16,    17,    18,    24,
      20,    21,    21,   123,    -1,    64,    -1,    -1,    -1,    -1,
     154,    31,    -1,    -1,    -1,    35,    36,    -1,    38,    39,
      -1,    -1,    -1,    -1,    -1,   169,    46,    -1,    -1,    -1,
      -1,   175,     3,     4,     5,     6,     7,     8,     9,    -1,
      11,    -1,    13,    14,    -1,    16,    17,    18,    -1,    20,
      21,    -1,    -1,     3,     4,     5,     6,    -1,    -1,    -1,
      31,    -1,    -1,    -1,    35,    36,    16,    38,    -1,    -1,
      20,    21,    -1,    -1,    -1,    46,    -1,    -1,    -1,    -1,
      -1,    31,    -1,    -1,    -1,    35,    36,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    46,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    -1,    -1,    -1,    40,    -1,
      42,    -1,    -1,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    -1,    -1,    40,    -1,    -1,    -1,    -1,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    -1,    -1,
      40,    -1,    -1,    -1,    -1,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    -1,    -1,    40,    -1,    -1,    -1,
      -1,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    -1,
      -1,    -1,    40,    41,    -1,    -1,    -1,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    -1,    -1,    40,    -1,
      -1,    -1,    -1,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    -1,    -1,    -1,    40,    -1,    -1,    -1,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    -1,    -1,    -1,
      40,    -1,    -1,    -1,    -1,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    -1,    -1,    -1,    40,    -1,    -1,    -1,    -1,
      45,    46,    20,    21,    -1,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    -1,
      -1,    -1,    40,    -1,    -1,    -1,    20,    21,    46,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    20,    21,    -1,    40,    -1,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      20,    21,    -1,    40,    -1,    -1,    -1,    -1,    -1,    29,
      30,    31,    32,    33,    34,    35,    36,    20,    21,    -1,
      40,    -1,    -1,    20,    21,    -1,    -1,    -1,    31,    32,
      33,    34,    35,    36,    31,    32,    33,    40,    -1,    36,
      -1,    -1,    -1,    40
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    62,     0,     5,    63,     3,     4,     5,     6,    36,
      40,    67,    68,    69,    71,     5,    65,    66,    70,    71,
      42,    43,    64,    43,    41,    69,    37,     5,    67,     5,
       7,     8,     9,    11,    13,    14,    16,    17,    18,    20,
      21,    31,    35,    36,    38,    46,    71,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    87,    88,    89,
      92,    95,    42,    44,     5,    72,    73,    66,    36,    86,
       5,    92,    36,    75,    92,    42,    42,    92,    92,    92,
      92,    92,    74,    92,    42,    87,    88,    77,    88,    10,
      87,    88,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      40,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    70,    42,    43,    42,    92,    36,    42,    92,    42,
      37,    39,    77,    87,    88,    92,    92,    92,    92,    92,
      92,    92,    92,    92,    92,    92,    92,    92,    92,    92,
      90,    91,    92,    92,    93,    92,    92,    92,    92,    92,
      92,    92,    92,    92,    72,    37,    92,    37,    37,    43,
      41,    92,    37,    92,    44,    94,    92
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    61,    62,    62,    63,    63,    64,    63,    65,    65,
      66,    66,    67,    67,    68,    68,    69,    69,    70,    70,
      71,    71,    71,    72,    73,    73,    74,    74,    75,    75,
      76,    76,    77,    77,    78,    78,    78,    78,    78,    79,
      80,    81,    82,    82,    82,    83,    84,    86,    85,    87,
      87,    87,    87,    88,    88,    88,    88,    88,    89,    89,
      89,    89,    89,    89,    89,    89,    89,    90,    90,    91,
      91,    92,    92,    92,    92,    92,    92,    92,    92,    92,
      92,    92,    92,    92,    92,    92,    93,    94,    92,    95,
      95,    95,    95,    95,    95,    95,    95,    95,    95,    95,
      95,    95,    95,    95
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     2,     3,     6,     0,     6,     0,     1,
       1,     3,     0,     1,     1,     3,     1,     1,     0,     1,
       1,     1,     1,     2,     1,     3,     0,     2,     0,     3,
       0,     1,     1,     1,     3,     3,     2,     2,     2,     3,
       3,     2,     1,     1,     1,     4,     2,     0,     5,     2,
       3,     2,     2,     1,     3,     2,     2,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     0,     1,     1,
       3,     1,     1,     3,     4,     1,     1,     2,     2,     2,
       2,     2,     2,     2,     2,     4,     0,     0,     7,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 3: /* program: program definition  */
#line 115 "src/B.y"
                         {
        
    }
#line 1421 "B.tab.c"
    break;

  case 4: /* definition: IDENTIFIER opt_ival_list SEMICOLON  */
#line 124 "src/B.y"
                                       {
        symbol_t *symbol = (symbol_t *)xmalloc(sizeof(symbol_t));
        symbol_t *symbol_cpy = (symbol_t *)xmalloc(sizeof(symbol_t));
        
        if ((yyvsp[-1].opt).kind == OPT_NONE) {
            symbol->size = 1;
            symbol->value.data = NULL;
            symbol->type = SYMBOL_GLOBAL;
            symbol->is_array = false;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_uninit, (yyvsp[-2].sval), symbol);
            add_symbol((yyvsp[-2].sval), symbol_cpy);
        } else {
            list_t *list = (list_t *)xmalloc(sizeof(list_t));
            memcpy(list, &(yyvsp[-1].opt).value.list, sizeof(list_t));
            symbol->value.data = list;
            symbol->size = list->size;
            symbol->type = SYMBOL_GLOBAL;
            if (symbol->size > 1)
                symbol->is_array = true;
            else
                symbol->is_array = false;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_init, (yyvsp[-2].sval), symbol);
            add_symbol((yyvsp[-2].sval), symbol_cpy);
        }
        free((yyvsp[-2].sval));
    }
#line 1454 "B.tab.c"
    break;

  case 5: /* definition: IDENTIFIER LBRACKET opt_const RBRACKET opt_ival_list SEMICOLON  */
#line 153 "src/B.y"
                                                                     {
        symbol_t *symbol = (symbol_t *)xmalloc(sizeof(symbol_t));
        symbol_t *symbol_cpy = (symbol_t *)xmalloc(sizeof(symbol_t));
        
        symbol->type = SYMBOL_GLOBAL;
        if ((yyvsp[-3].opt).kind != OPT_NONE) {
            const_t *constant = &((yyvsp[-3].opt).value.constant);
            if (constant->type != CONST_INT) {
                yyerror("Array size must be an integer");
            }
            symbol->size = constant->value;
        } else {
            symbol->size = 1; // default size is 1
        }

        if ((yyvsp[-1].opt).kind == OPT_NONE) {
            symbol->value.data = NULL;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_uninit, (yyvsp[-5].sval), symbol);
            add_symbol((yyvsp[-5].sval), symbol_cpy);
        } else {
            list_t *list = (list_t *)xmalloc(sizeof(list_t));
            memcpy(list, &(yyvsp[-1].opt).value.list, sizeof(list_t));
            symbol->value.data = list;
            symbol->is_array = true;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_init, (yyvsp[-5].sval), symbol);
            add_symbol((yyvsp[-5].sval), symbol_cpy);
        }
        free((yyvsp[-5].sval));
    }
#line 1490 "B.tab.c"
    break;

  case 6: /* $@1: %empty  */
#line 185 "src/B.y"
                                       {
        symbol_t *symbol = (symbol_t *)xmalloc(sizeof(symbol_t));

        /* function table */
        entry_t *entry = ht_search(function_table, (yyvsp[-2].sval), 1);
        if (entry == NULL) {
            ht_insert(function_table, (yyvsp[-2].sval), DECLARED);
        } else {
            entry->value = DECLARED;
        }

        if ((yyvsp[0].opt).kind == OPT_NONE) {
            symbol->size = 0;
        } else {
            symbol->size = (yyvsp[0].opt).value.list.size;
        }
        symbol->type = SYMBOL_FUNCTION;
        add_symbol_table(global_table, (yyvsp[-2].sval), symbol);
        emit("%s:", (yyvsp[-2].sval));
        emit(".long %s + 4", (yyvsp[-2].sval));
        emit("push ebp");
        emit("mov ebp, esp\n");
        emit("push ebx");
        offset_stack_value -= 4;
        
        /* jump reserve */

        // emit("jmp .%s.init", $1);
        emit("jmp 1f");
        emit("2:");

        enter_scope(current_table);
        assert(current_table != global_table);
        if ((yyvsp[0].opt).kind != OPT_NONE) {
            add_argument_symb((yyvsp[-2].sval), &((yyvsp[0].opt).value.list));
        }
        print_symbol_table(current_table);
    }
#line 1533 "B.tab.c"
    break;

  case 7: /* definition: IDENTIFIER LPAREN opt_ident_list $@1 RPAREN statement  */
#line 222 "src/B.y"
                       {
        emit("pop ebx");
        pop_register();
        emit("jmp _exit\n");

        /* jump reserve */

        // emit(".%s.init:", $1);
        emit("1:");
        emit("sub esp, %d", -max_stack_value);
        emit("jmp 2b\n");

        exit_scope();
        assert(current_table == global_table);
        free((yyvsp[-5].sval));
        
    }
#line 1555 "B.tab.c"
    break;

  case 8: /* opt_ident_list: %empty  */
#line 242 "src/B.y"
                {
        (yyval.opt).kind = OPT_NONE;
    }
#line 1563 "B.tab.c"
    break;

  case 9: /* opt_ident_list: ident_list  */
#line 245 "src/B.y"
                 {
        (yyval.opt).value.list = (yyvsp[0].list);
        (yyval.opt).kind = OPT_VALUE;
    }
#line 1572 "B.tab.c"
    break;

  case 10: /* ident_list: IDENTIFIER  */
#line 253 "src/B.y"
               {
        node_t *node = create_node((yyvsp[0].sval));

        (yyval.list).size = 0;
        (yyval.list).head = NULL;
        (yyval.list).tail = NULL;
        add_node(&((yyval.list)), node);
    }
#line 1585 "B.tab.c"
    break;

  case 11: /* ident_list: ident_list COMMA IDENTIFIER  */
#line 261 "src/B.y"
                                  {
        node_t *node = create_node((yyvsp[0].sval));
        add_node(&((yyvsp[-2].list)), node);
        (yyval.list) = (yyvsp[-2].list);
    }
#line 1595 "B.tab.c"
    break;

  case 12: /* opt_ival_list: %empty  */
#line 269 "src/B.y"
                {
        (yyval.opt).kind = OPT_NONE;
    }
#line 1603 "B.tab.c"
    break;

  case 13: /* opt_ival_list: ival_list  */
#line 272 "src/B.y"
                {
        (yyval.opt).value.list = (yyvsp[0].list);
        (yyval.opt).kind = OPT_VALUE;
    }
#line 1612 "B.tab.c"
    break;

  case 14: /* ival_list: ival  */
#line 279 "src/B.y"
         {
        ival_t *ival = (ival_t *)xmalloc(sizeof(ival_t));
        memcpy(ival, &(yyvsp[0].ival_s), sizeof(ival_t));
        node_t *node = create_node(ival);

        (yyval.list).size = 0;
        (yyval.list).head = NULL;
        (yyval.list).tail = NULL;
        add_node(&((yyval.list)), node);
    }
#line 1627 "B.tab.c"
    break;

  case 15: /* ival_list: ival_list COMMA ival  */
#line 289 "src/B.y"
                           {
        ival_t *ival = (ival_t *)xmalloc(sizeof(ival_t));
        memcpy(ival, &(yyvsp[0].ival_s), sizeof(ival_t));
        node_t *node = create_node(ival);

        add_node(&((yyvsp[-2].list)), node);
        (yyval.list) = (yyvsp[-2].list);
    }
#line 1640 "B.tab.c"
    break;

  case 16: /* ival: constant  */
#line 300 "src/B.y"
             {
        (yyval.ival_s).type = IVAL_CONST;
        memcpy(&((yyval.ival_s).value.constant), &(yyvsp[0].constant), sizeof(const_t));
    }
#line 1649 "B.tab.c"
    break;

  case 17: /* ival: IDENTIFIER  */
#line 305 "src/B.y"
                 {
        (yyval.ival_s).type = IVAL_IDENTIFIER;
        (yyval.ival_s).value.identifier = (yyvsp[0].sval);
    }
#line 1658 "B.tab.c"
    break;

  case 18: /* opt_const: %empty  */
#line 312 "src/B.y"
                {
        (yyval.opt).kind = OPT_NONE;
    }
#line 1666 "B.tab.c"
    break;

  case 19: /* opt_const: constant  */
#line 315 "src/B.y"
               { 
        (yyval.opt).value.constant = (yyvsp[0].constant);
        (yyval.opt).kind = OPT_VALUE;;
    }
#line 1675 "B.tab.c"
    break;

  case 20: /* constant: CHARCONST  */
#line 323 "src/B.y"
              {
        (yyval.constant).type = CONST_CHAR;
        (yyval.constant).value = (yyvsp[0].ival);
    }
#line 1684 "B.tab.c"
    break;

  case 21: /* constant: STRING  */
#line 327 "src/B.y"
             {
        (yyval.constant).type = CONST_STRING;
        const char *label = st_get_label((yyvsp[0].sval));
        (yyval.constant).value = (size_t)label;
        free((yyvsp[0].sval));
    }
#line 1695 "B.tab.c"
    break;

  case 22: /* constant: NUMBER  */
#line 333 "src/B.y"
             {
        (yyval.constant).type = CONST_INT;
        (yyval.constant).value = (yyvsp[0].ival);
    }
#line 1704 "B.tab.c"
    break;

  case 23: /* var_decl: IDENTIFIER opt_const  */
#line 345 "src/B.y"
                         {
        if ((yyvsp[0].opt).kind != OPT_NONE) {
            const_t *constant = (const_t *)xmalloc(sizeof(const_t));
            memcpy(constant, &(yyvsp[0].opt).value.constant, sizeof(const_t));
            
            (yyval.var_decl).constant = constant;
        } else {
            (yyval.var_decl).constant = NULL;
        }
        (yyval.var_decl).name = (yyvsp[-1].sval);
    }
#line 1720 "B.tab.c"
    break;

  case 24: /* var_decl_list: var_decl  */
#line 360 "src/B.y"
             {
        var_decl_t *var_decl = (var_decl_t *)xmalloc(sizeof(var_decl_t));
        memcpy(var_decl, &(yyvsp[0].var_decl), sizeof(var_decl_t));
        node_t *node = create_node(var_decl);
        (yyval.list).size = 0;
        (yyval.list).head = NULL;
        (yyval.list).tail = NULL;
        add_node(&((yyval.list)), node);
    }
#line 1734 "B.tab.c"
    break;

  case 25: /* var_decl_list: var_decl_list COMMA var_decl  */
#line 369 "src/B.y"
                                   {
        var_decl_t *var_decl = (var_decl_t *)xmalloc(sizeof(var_decl_t));
        memcpy(var_decl, &(yyvsp[0].var_decl), sizeof(var_decl_t));
        node_t *node = create_node(var_decl);

        add_node(&((yyvsp[-2].list)), node);
        (yyval.list) = (yyvsp[-2].list);

    }
#line 1748 "B.tab.c"
    break;

  case 26: /* opt_statement: %empty  */
#line 381 "src/B.y"
                {
        (yyval.opt).kind = OPT_NONE;
    }
#line 1756 "B.tab.c"
    break;

  case 27: /* opt_statement: opt_statement statement  */
#line 384 "src/B.y"
                              {
        (yyval.opt).kind = OPT_VALUE;
    }
#line 1764 "B.tab.c"
    break;

  case 28: /* opt_paren_expr: %empty  */
#line 391 "src/B.y"
                {
        (yyval.opt).kind = OPT_NONE;
    }
#line 1772 "B.tab.c"
    break;

  case 29: /* opt_paren_expr: LPAREN expr RPAREN  */
#line 394 "src/B.y"
                         {
        (yyval.opt).value.expr = (yyvsp[-1].expr);
        (yyval.opt).kind = OPT_VALUE;
    }
#line 1781 "B.tab.c"
    break;

  case 30: /* opt_expr: %empty  */
#line 401 "src/B.y"
                {
        (yyval.opt).kind = OPT_NONE;
    }
#line 1789 "B.tab.c"
    break;

  case 31: /* opt_expr: expr  */
#line 404 "src/B.y"
           {
        (yyval.opt).value.expr = (yyvsp[0].expr);
        (yyval.opt).kind = OPT_VALUE;
    }
#line 1798 "B.tab.c"
    break;

  case 34: /* simple_statement: GOTO expr SEMICOLON  */
#line 416 "src/B.y"
                        { //TODO: check if expr is a label and local
        emit("jmp [.%s]", (yyvsp[-1].expr).identifier);
        free_expr(&(yyvsp[-1].expr));
    }
#line 1807 "B.tab.c"
    break;

  case 35: /* simple_statement: RETURN opt_paren_expr SEMICOLON  */
#line 420 "src/B.y"
                                      {
        if ((yyvsp[-1].opt).kind != OPT_NONE) {
            load_value_into_reg(&((yyvsp[-1].opt).value.expr), "eax");
            free_expr(&(yyvsp[-1].opt).value.expr);
        } else {
            emit("mov eax, 0");
        }
        emit ("jmp _exit");
    }
#line 1821 "B.tab.c"
    break;

  case 36: /* simple_statement: opt_expr SEMICOLON  */
#line 429 "src/B.y"
                         {

        if ((yyvsp[-1].opt).kind != OPT_NONE) {
            expr_t *expr = &(yyvsp[-1].opt).value.expr;
            if (expr->type != EXPR_CONST) {
                get_symbol(expr->identifier);
            }
            free_expr(&(yyvsp[-1].opt).value.expr);
        }
    }
#line 1836 "B.tab.c"
    break;

  case 37: /* simple_statement: BREAK SEMICOLON  */
#line 439 "src/B.y"
                      {
        if (loop_label_index == 0) {
            yyerror("break statement not within a loop");
        } else {
            emit("jmp .LE%zu", loop_label_stack[loop_label_index - 1]);
        }
    }
#line 1848 "B.tab.c"
    break;

  case 38: /* simple_statement: CONTINUE SEMICOLON  */
#line 446 "src/B.y"
                         {
        if (loop_label_index == 0) {
            yyerror("continue statement not within a loop");
        } else {
            emit("jmp .LS%zu", loop_label_stack[loop_label_index - 1]);
        }
    }
#line 1860 "B.tab.c"
    break;

  case 39: /* auto: AUTO var_decl_list SEMICOLON  */
#line 458 "src/B.y"
                                 {
        add_auto_symb(&((yyvsp[-1].list)));
    }
#line 1868 "B.tab.c"
    break;

  case 40: /* extrn: EXTRN ident_list SEMICOLON  */
#line 465 "src/B.y"
                               {
        add_extrn_symbol(&((yyvsp[-1].list)));
    }
#line 1876 "B.tab.c"
    break;

  case 41: /* colon: IDENTIFIER COLON  */
#line 472 "src/B.y"
                     {
        /* labels are local */
        emit("jmp [.%s]", (yyvsp[-1].sval));
        emit(".%s:", (yyvsp[-1].sval));
        emit(".long .%s + 4", (yyvsp[-1].sval));
        add_symbol((yyvsp[-1].sval), NULL);
        free((yyvsp[-1].sval));
    }
#line 1889 "B.tab.c"
    break;

  case 45: /* if_expr: IF LPAREN expr RPAREN  */
#line 489 "src/B.y"
                          {
        load_value_into_reg(&(yyvsp[-1].expr), "eax");
        emit("test eax, eax");
        label_stack[label_index] = label_counter;
        emit("jz .LF%zu", label_stack[label_index]);
        free_expr(&(yyvsp[-1].expr));
        increase_label();
    }
#line 1902 "B.tab.c"
    break;

  case 46: /* if_closed: if_expr closed_statement  */
#line 500 "src/B.y"
                             {
        emit("jmp .LE%zu", label_stack[label_index - 1]);
        emit(".LF%zu:", label_stack[label_index - 1]);
    }
#line 1911 "B.tab.c"
    break;

  case 47: /* $@2: %empty  */
#line 506 "src/B.y"
          {
        label_stack[label_index] = label_counter; 
        loop_label_stack[loop_label_index] = label_counter;
        emit(".LS%zu:", label_stack[label_index]);
    }
#line 1921 "B.tab.c"
    break;

  case 48: /* while_expr: WHILE $@2 LPAREN expr RPAREN  */
#line 510 "src/B.y"
                         {
        load_value_into_reg(&(yyvsp[-1].expr), "eax");
        emit("test eax, eax");
        emit("jz .LE%zu", label_stack[label_index]);
        increase_label();
        loop_label_index++;
        free_expr(&(yyvsp[-1].expr));
    }
#line 1934 "B.tab.c"
    break;

  case 49: /* open_statement: if_expr statement  */
#line 521 "src/B.y"
                      {
        label_index--;
        emit(".LF%zu:", label_stack[label_index]);
    }
#line 1943 "B.tab.c"
    break;

  case 50: /* open_statement: if_closed ELSE open_statement  */
#line 525 "src/B.y"
                                    {
        label_index--;
        emit(".LE%zu:", label_stack[label_index]);
    }
#line 1952 "B.tab.c"
    break;

  case 51: /* open_statement: while_expr open_statement  */
#line 528 "src/B.y"
                                     {
        label_index--;
        loop_label_index--;
        emit("jmp .LS%zu", label_stack[label_index]);
        emit(".LE%zu:", label_stack[label_index]);
    }
#line 1963 "B.tab.c"
    break;

  case 54: /* closed_statement: if_closed ELSE closed_statement  */
#line 539 "src/B.y"
                                      {
        label_index--;
        emit(".LE%zu:", label_stack[label_index]);
    }
#line 1972 "B.tab.c"
    break;

  case 55: /* closed_statement: while_expr closed_statement  */
#line 542 "src/B.y"
                                       {
        label_index--;
        loop_label_index--;
        emit("jmp .LS%zu", label_stack[label_index]);
        emit(".LE%zu:", label_stack[label_index]);
    }
#line 1983 "B.tab.c"
    break;

  case 58: /* assign: expr ASSIGN expr  */
#line 553 "src/B.y"
                                  {
        perform_assign(&(yyvsp[-2].expr), ASSIGN, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));

    }
#line 1994 "B.tab.c"
    break;

  case 59: /* assign: expr ASSIGN_OR expr  */
#line 559 "src/B.y"
                                          {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_OR, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2004 "B.tab.c"
    break;

  case 60: /* assign: expr ASSIGN_LSHIFT expr  */
#line 564 "src/B.y"
                                                  {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_LSHIFT, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2014 "B.tab.c"
    break;

  case 61: /* assign: expr ASSIGN_RSHIFT expr  */
#line 569 "src/B.y"
                                                  {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_RSHIFT, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2024 "B.tab.c"
    break;

  case 62: /* assign: expr ASSIGN_MINUS expr  */
#line 574 "src/B.y"
                                                {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_MINUS, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2034 "B.tab.c"
    break;

  case 63: /* assign: expr ASSIGN_PLUS expr  */
#line 579 "src/B.y"
                                              {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_PLUS, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2044 "B.tab.c"
    break;

  case 64: /* assign: expr ASSIGN_MOD expr  */
#line 584 "src/B.y"
                                            {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_MOD, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2054 "B.tab.c"
    break;

  case 65: /* assign: expr ASSIGN_MUL expr  */
#line 589 "src/B.y"
                                            {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_MUL, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2064 "B.tab.c"
    break;

  case 66: /* assign: expr ASSIGN_DIVIDE expr  */
#line 594 "src/B.y"
                                                  {
        perform_assign(&(yyvsp[-2].expr), ASSIGN_DIVIDE, &(yyvsp[0].expr));
        free_expr(&(yyvsp[0].expr));
        return_post_assign(&(yyval.expr), &(yyvsp[-2].expr));
    }
#line 2074 "B.tab.c"
    break;

  case 67: /* opt_expr_list: %empty  */
#line 602 "src/B.y"
                {
        (yyval.opt).kind = OPT_NONE;
    }
#line 2082 "B.tab.c"
    break;

  case 68: /* opt_expr_list: expr_list  */
#line 605 "src/B.y"
                {
        (yyval.opt).value.list = (yyvsp[0].list);
        (yyval.opt).kind = OPT_VALUE;
    }
#line 2091 "B.tab.c"
    break;

  case 69: /* expr_list: expr  */
#line 612 "src/B.y"
         {
        expr_t *expr = (expr_t *)xmalloc(sizeof(expr_t));
        memcpy(expr, &(yyvsp[0].expr), sizeof(expr_t));
        node_t *node = create_node(expr);

        (yyval.list).size = 0;
        (yyval.list).head = NULL;
        (yyval.list).tail = NULL;
        add_node(&((yyval.list)), node);
    }
#line 2106 "B.tab.c"
    break;

  case 70: /* expr_list: expr_list COMMA expr  */
#line 622 "src/B.y"
                           {
        expr_t *expr = (expr_t *)xmalloc(sizeof(expr_t));
        memcpy(expr, &(yyvsp[0].expr), sizeof(expr_t));
        node_t *node = create_node(expr);
        add_node(&((yyvsp[-2].list)), node);
        (yyval.list) = (yyvsp[-2].list);
    }
#line 2118 "B.tab.c"
    break;

  case 71: /* expr: constant  */
#line 632 "src/B.y"
             {
        (yyval.expr).type = EXPR_CONST;
        (yyval.expr).val_kind = EXPR_RVALUE;
        (yyval.expr).constant = (yyvsp[0].constant);
    }
#line 2128 "B.tab.c"
    break;

  case 72: /* expr: IDENTIFIER  */
#line 637 "src/B.y"
                 {
        (yyval.expr).val_kind = EXPR_LVALUE;
        (yyval.expr).type = EXPR_VAL;
        (yyval.expr).identifier = (yyvsp[0].sval);
    }
#line 2138 "B.tab.c"
    break;

  case 73: /* expr: LPAREN expr RPAREN  */
#line 642 "src/B.y"
                                      {
        (yyval.expr) = (yyvsp[-1].expr);
    }
#line 2146 "B.tab.c"
    break;

  case 74: /* expr: expr LPAREN opt_expr_list RPAREN  */
#line 646 "src/B.y"
                                       {

         /* check if function exist */
        entry_t *entry = ht_search(function_table, (yyvsp[-3].expr).identifier, 1);
        if (entry == NULL) {
            ht_insert(function_table, (yyvsp[-3].expr).identifier, (void *)REFERENCED);
        }

        if ((yyvsp[-3].expr).val_kind != EXPR_LVALUE) {
            yyerror("LHS of function call must be a Lvalue");
        }

        if ((yyvsp[-1].opt).kind != OPT_NONE) {
            function_call(&((yyvsp[-1].opt).value.list));
        }
        if ((yyvsp[-3].expr).val_kind == EXPR_LVALUE) {
            load_value_into_reg(&(yyvsp[-3].expr), "eax");
            emit("call eax\n");
        } else {
            emit("call %zu\n", (yyvsp[-3].expr).value); //TODO: fix it so function ptr can work
        }
        /* clean up passed arguments */
        size_t arg_resb = (yyvsp[-1].opt).value.list.size * 4;
        if (arg_resb > 0) {
            emit("add esp, %zu\n", arg_resb);
        }
        (yyval.expr).val_kind = EXPR_RVALUE;
        (yyval.expr).type = EXPR_VAL;
        free_expr(&(yyvsp[-3].expr));
        add_temp_symbol(&(yyval.expr));
        register_to_lvalue(&(yyval.expr), "eax");
    }
#line 2183 "B.tab.c"
    break;

  case 75: /* expr: assign  */
#line 678 "src/B.y"
             {
        (yyval.expr) = (yyvsp[0].expr);
    }
#line 2191 "B.tab.c"
    break;

  case 76: /* expr: binary  */
#line 681 "src/B.y"
             {
        (yyval.expr) = (yyvsp[0].expr);
        (yyval.expr).type == EXPR_VAL;
    }
#line 2200 "B.tab.c"
    break;

  case 77: /* expr: INC expr  */
#line 685 "src/B.y"
                         {
        if ((yyvsp[0].expr).val_kind != EXPR_LVALUE) {
            yyerror("LHS of increment must be a Lvalue");
        }
        unary(&(yyvsp[0].expr), "inc");
        (yyval.expr) = (yyvsp[0].expr);
        (yyval.expr).type = EXPR_VAL;
        (yyval.expr).val_kind = EXPR_RVALUE;
    }
#line 2214 "B.tab.c"
    break;

  case 78: /* expr: DEC expr  */
#line 694 "src/B.y"
                         {
        if ((yyvsp[0].expr).val_kind != EXPR_LVALUE) {
            yyerror("LHS of decrement must be a Lvalue");
        }
        unary(&(yyvsp[0].expr), "dec");
        (yyval.expr) = (yyvsp[0].expr);
        (yyval.expr).type = EXPR_VAL;
        (yyval.expr).val_kind = EXPR_RVALUE;
    }
#line 2228 "B.tab.c"
    break;

  case 79: /* expr: expr INC  */
#line 703 "src/B.y"
               {
        if ((yyvsp[-1].expr).val_kind != EXPR_LVALUE) {
            yyerror("LHS of increment must be a Lvalue");
        }

        load_value_into_reg(&(yyvsp[-1].expr), "eax");
        emit("mov ecx, eax");
        unary(&(yyvsp[-1].expr), "inc");
        free_expr(&(yyvsp[-1].expr));
        add_temp_symbol(&(yyval.expr));
        (yyval.expr).val_kind = EXPR_RVALUE;
        (yyval.expr).type = EXPR_VAL;
        register_to_lvalue(&(yyval.expr), "ecx");
    }
#line 2247 "B.tab.c"
    break;

  case 80: /* expr: expr DEC  */
#line 717 "src/B.y"
               {
        if ((yyvsp[-1].expr).val_kind != EXPR_LVALUE) {
            yyerror("LHS of decrement must be a Lvalue");
        }
        load_value_into_reg(&(yyvsp[-1].expr), "eax");
        emit("mov ecx, eax");
        unary(&(yyvsp[-1].expr), "dec");
        free_expr(&(yyvsp[-1].expr));
        add_temp_symbol(&(yyval.expr));
        (yyval.expr).val_kind = EXPR_RVALUE;
        (yyval.expr).type = EXPR_VAL;
        register_to_lvalue(&(yyval.expr), "ecx");
    }
#line 2265 "B.tab.c"
    break;

  case 81: /* expr: MINUS expr  */
#line 730 "src/B.y"
                             {
        load_value_into_reg(&(yyvsp[0].expr), "eax");
        free_expr(&(yyvsp[0].expr));
        emit("neg eax");
        (yyval.expr).type = EXPR_VAL;
        (yyval.expr).val_kind = EXPR_RVALUE;
        add_temp_symbol(&(yyval.expr));
        register_to_lvalue(&(yyval.expr), "eax");
    }
#line 2279 "B.tab.c"
    break;

  case 82: /* expr: NOT expr  */
#line 739 "src/B.y"
                           {
        load_value_into_reg(&(yyvsp[0].expr), "eax");
        free_expr(&(yyvsp[0].expr));
        emit("test eax, eax");
        emit("setz al");
        emit("movzx eax, al");
        (yyval.expr).type = EXPR_VAL;
        (yyval.expr).val_kind = EXPR_RVALUE;
        add_temp_symbol(&(yyval.expr));
        register_to_lvalue(&(yyval.expr), "eax");
    }
#line 2295 "B.tab.c"
    break;

  case 83: /* expr: STAR expr  */
#line 750 "src/B.y"
                            {
        load_value_into_reg(&(yyvsp[0].expr), "eax");
        free_expr(&(yyvsp[0].expr));
        add_temp_symbol(&(yyval.expr));
        (yyval.expr).type = EXPR_DEREF;
        (yyval.expr).val_kind = EXPR_LVALUE;
        load_value_reg_to_lvalue(&(yyval.expr), "eax");
    }
#line 2308 "B.tab.c"
    break;

  case 84: /* expr: AMPERSAND expr  */
#line 758 "src/B.y"
                                   {
        if ((yyvsp[0].expr).val_kind == EXPR_RVALUE)
            yyerror("L-Value required for taking the address of.");
        (yyval.expr).type = EXPR_VAL;
        (yyval.expr).val_kind = EXPR_RVALUE;
        load_address_reg(&(yyvsp[0].expr), "eax");
        free_expr(&(yyvsp[0].expr));
        add_temp_symbol(&(yyval.expr));
        register_to_lvalue(&(yyval.expr), "eax");
    }
#line 2323 "B.tab.c"
    break;

  case 85: /* expr: expr LBRACKET expr RBRACKET  */
#line 768 "src/B.y"
                                  { //TODO: decide what to do with vector_access. EXPR_LVALUE
        vector_access(&(yyvsp[-3].expr), &(yyvsp[-1].expr));
        emit("imul ebx, 4");
        emit("add ebx, eax");
        add_temp_symbol(&(yyval.expr));
        (yyval.expr).val_kind = EXPR_LVALUE;
        (yyval.expr).type = EXPR_DEREF;
        (yyval.expr).storage_kind = EXPR_TEMP;
        load_value_reg_to_lvalue(&(yyval.expr), "ebx");
    }
#line 2338 "B.tab.c"
    break;

  case 86: /* @3: %empty  */
#line 778 "src/B.y"
                    {
        load_value_into_reg(&(yyvsp[-1].expr), "eax");
        free_expr(&(yyvsp[-1].expr));
        (yyval.expr).val_kind = EXPR_RVALUE;
        add_temp_symbol(&(yyval.expr));
        emit("test eax, eax");
        emit("jz .LF%zu", label_counter);
    }
#line 2351 "B.tab.c"
    break;

  case 87: /* @4: %empty  */
#line 785 "src/B.y"
                 {
        load_value_into_reg(&(yyvsp[-1].expr), "eax");
        free_expr(&(yyvsp[-1].expr));
        register_to_lvalue(&(yyvsp[-2].expr), "eax");
        (yyval.expr) = (yyvsp[-2].expr);
        emit("jmp .LE%zu", label_counter);
        emit(".LF%zu:", label_counter);
    }
#line 2364 "B.tab.c"
    break;

  case 88: /* expr: expr QUESTION @3 expr COLON @4 expr  */
#line 792 "src/B.y"
                         {
        (yyval.expr).type = EXPR_VAL;
        (yyval.expr).storage_kind = EXPR_TEMP;
        load_value_into_reg(&(yyvsp[0].expr), "eax");
        free_expr(&(yyvsp[0].expr));
        register_to_lvalue(&(yyvsp[-1].expr), "eax");
        (yyval.expr) = (yyvsp[-1].expr);
        emit(".LE%zu:", label_counter);
        (yyval.expr).type = EXPR_VAL;
        label_counter++;
    }
#line 2380 "B.tab.c"
    break;

  case 89: /* binary: expr OR expr  */
#line 806 "src/B.y"
                          {
        binary_op(&(yyvsp[-2].expr), OR, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2388 "B.tab.c"
    break;

  case 90: /* binary: expr STAR expr  */
#line 809 "src/B.y"
                                {
        binary_op(&(yyvsp[-2].expr), STAR, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2396 "B.tab.c"
    break;

  case 91: /* binary: expr AMPERSAND expr  */
#line 812 "src/B.y"
                                          {
        binary_op(&(yyvsp[-2].expr), AMPERSAND, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2404 "B.tab.c"
    break;

  case 92: /* binary: expr EQ expr  */
#line 815 "src/B.y"
                            {
        binary_op(&(yyvsp[-2].expr), EQ, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2412 "B.tab.c"
    break;

  case 93: /* binary: expr NEQ expr  */
#line 818 "src/B.y"
                              {
        binary_op(&(yyvsp[-2].expr), NEQ, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2420 "B.tab.c"
    break;

  case 94: /* binary: expr LT expr  */
#line 821 "src/B.y"
                            {
        binary_op(&(yyvsp[-2].expr), LT, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2428 "B.tab.c"
    break;

  case 95: /* binary: expr LE expr  */
#line 824 "src/B.y"
                            {
        binary_op(&(yyvsp[-2].expr), LE, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2436 "B.tab.c"
    break;

  case 96: /* binary: expr GT expr  */
#line 827 "src/B.y"
                            {
        binary_op(&(yyvsp[-2].expr), GT, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2444 "B.tab.c"
    break;

  case 97: /* binary: expr GE expr  */
#line 830 "src/B.y"
                            {
        binary_op(&(yyvsp[-2].expr), GE, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2452 "B.tab.c"
    break;

  case 98: /* binary: expr LSHIFT expr  */
#line 833 "src/B.y"
                                    {
        binary_op(&(yyvsp[-2].expr), LSHIFT, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2460 "B.tab.c"
    break;

  case 99: /* binary: expr RSHIFT expr  */
#line 836 "src/B.y"
                                    {
        binary_op(&(yyvsp[-2].expr), RSHIFT, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2468 "B.tab.c"
    break;

  case 100: /* binary: expr MINUS expr  */
#line 839 "src/B.y"
                                  {
        binary_op(&(yyvsp[-2].expr), MINUS, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2476 "B.tab.c"
    break;

  case 101: /* binary: expr PLUS expr  */
#line 842 "src/B.y"
                                {
        binary_op(&(yyvsp[-2].expr), PLUS, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2484 "B.tab.c"
    break;

  case 102: /* binary: expr MOD expr  */
#line 845 "src/B.y"
                              { // TODO
        binary_op(&(yyvsp[-2].expr), MOD, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2492 "B.tab.c"
    break;

  case 103: /* binary: expr SLASH expr  */
#line 848 "src/B.y"
                                  {
        binary_op(&(yyvsp[-2].expr), SLASH, &(yyvsp[0].expr), &(yyval.expr));
    }
#line 2500 "B.tab.c"
    break;


#line 2504 "B.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 853 "src/B.y"

// yyerror function
void yyerror(const char *msg) {
    fprintf(stderr, "Error at line %d: %s\n", yylineno, msg);
    assert(0 && "forced");
    exit(1);
}

FILE *tmp;

int main(int argc, char **argv) {
    const char *input_file = NULL;
    const char *output_file = NULL;

    tmp = tmpfile();

    if (!tmp) {
        perror("tmpfile");
        return EXIT_FAILURE;
    }

    // debugging flag
    /* yydebug = 1; */
    for (int i = 1; i < argc; ++i) {
        if (strcmp(argv[i], "-o") == 0 && i + 1 < argc) {
            output_file = argv[++i];
        } else {
            input_file = argv[i];
        }
    }
    
    if (input_file) {
        yyin = fopen(input_file, "r");
        if (!yyin) {
            perror("Input file");
            return 1;
        }
    } else {
        yyin = stdin;
    }

    if (output_file) {
        out = fopen(output_file, "w");
        if (!out) {
            perror("Output file");
            return 1;
        }
    } else {
        out = stdout;
    }


    // Initialize the symbol table
    init_symbol_table();

    init_assembly();

    // Start parsing
    int result = yyparse();
    if (yyin && yyin != stdin) {
        fclose(yyin);
    }
    if (out && out != stdout) {
        fclose(out);
    }

    exit_label();
    emit_extern();
    emit_global_var();

    st_print_table();

    // write to stdout
    rewind(tmp);  // reset to beginning
    char buffer[64];
    while (fgets(buffer, sizeof(buffer), tmp)) {
        fputs(buffer, stdout);
    }

    // Clean up
    free_symbol_table(global_table);
    ht_destroy_table(string_table, 1);
    ht_destroy_table(function_table, 0);
    return result;
}
