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
#include "hash_table.h"
#include "symbol_table.h"
#include "vector.h"
#include "xmalloc.h"
#include "codegen.h"
#include "compiler_struct.h"

int yylex(void);
extern int  yylineno;
extern FILE *yyin;
FILE        *out = NULL;
void yyerror(const char *msg);

symbol_table_t *global_table = NULL;
symbol_table_t *current_table = NULL;
htable_t       *string_table;

char *buffer[512];

/* offset stack */
int offset_stack[512];
int current_depth = 0;

#line 100 "B.tab.c"

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
  YYSYMBOL_ASSIGN = 17,                    /* ASSIGN  */
  YYSYMBOL_INC = 18,                       /* INC  */
  YYSYMBOL_DEC = 19,                       /* DEC  */
  YYSYMBOL_OR = 20,                        /* OR  */
  YYSYMBOL_EQ = 21,                        /* EQ  */
  YYSYMBOL_NEQ = 22,                       /* NEQ  */
  YYSYMBOL_LT = 23,                        /* LT  */
  YYSYMBOL_LE = 24,                        /* LE  */
  YYSYMBOL_GT = 25,                        /* GT  */
  YYSYMBOL_GE = 26,                        /* GE  */
  YYSYMBOL_LSHIFT = 27,                    /* LSHIFT  */
  YYSYMBOL_RSHIFT = 28,                    /* RSHIFT  */
  YYSYMBOL_STAR = 29,                      /* STAR  */
  YYSYMBOL_SLASH = 30,                     /* SLASH  */
  YYSYMBOL_MOD = 31,                       /* MOD  */
  YYSYMBOL_PLUS = 32,                      /* PLUS  */
  YYSYMBOL_MINUS = 33,                     /* MINUS  */
  YYSYMBOL_LPAREN = 34,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 35,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 36,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 37,                    /* RBRACE  */
  YYSYMBOL_LBRACKET = 38,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 39,                  /* RBRACKET  */
  YYSYMBOL_SEMICOLON = 40,                 /* SEMICOLON  */
  YYSYMBOL_COMMA = 41,                     /* COMMA  */
  YYSYMBOL_COLON = 42,                     /* COLON  */
  YYSYMBOL_QUESTION = 43,                  /* QUESTION  */
  YYSYMBOL_AMPERSAND = 44,                 /* AMPERSAND  */
  YYSYMBOL_ASSIGN_OR = 45,                 /* ASSIGN_OR  */
  YYSYMBOL_ASSIGN_LSHIFT = 46,             /* ASSIGN_LSHIFT  */
  YYSYMBOL_ASSIGN_RSHIFT = 47,             /* ASSIGN_RSHIFT  */
  YYSYMBOL_ASSIGN_MINUS = 48,              /* ASSIGN_MINUS  */
  YYSYMBOL_ASSIGN_PLUS = 49,               /* ASSIGN_PLUS  */
  YYSYMBOL_ASSIGN_MOD = 50,                /* ASSIGN_MOD  */
  YYSYMBOL_ASSIGN_MUL = 51,                /* ASSIGN_MUL  */
  YYSYMBOL_ASSIGN_DIVIDE = 52,             /* ASSIGN_DIVIDE  */
  YYSYMBOL_ERROR = 53,                     /* ERROR  */
  YYSYMBOL_TERNARY = 54,                   /* TERNARY  */
  YYSYMBOL_UNARY = 55,                     /* UNARY  */
  YYSYMBOL_DEREF = 56,                     /* DEREF  */
  YYSYMBOL_ADDR_OF = 57,                   /* ADDR_OF  */
  YYSYMBOL_THEN = 58,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 59,                  /* $accept  */
  YYSYMBOL_program = 60,                   /* program  */
  YYSYMBOL_definition = 61,                /* definition  */
  YYSYMBOL_62_1 = 62,                      /* $@1  */
  YYSYMBOL_opt_ident_list = 63,            /* opt_ident_list  */
  YYSYMBOL_ident_list = 64,                /* ident_list  */
  YYSYMBOL_opt_ival_list = 65,             /* opt_ival_list  */
  YYSYMBOL_ival_list = 66,                 /* ival_list  */
  YYSYMBOL_ival = 67,                      /* ival  */
  YYSYMBOL_opt_const = 68,                 /* opt_const  */
  YYSYMBOL_constant = 69,                  /* constant  */
  YYSYMBOL_var_decl = 70,                  /* var_decl  */
  YYSYMBOL_var_decl_list = 71,             /* var_decl_list  */
  YYSYMBOL_opt_statement = 72,             /* opt_statement  */
  YYSYMBOL_opt_paren_expr = 73,            /* opt_paren_expr  */
  YYSYMBOL_opt_expr = 74,                  /* opt_expr  */
  YYSYMBOL_statement = 75,                 /* statement  */
  YYSYMBOL_76_2 = 76,                      /* $@2  */
  YYSYMBOL_77_3 = 77,                      /* $@3  */
  YYSYMBOL_78_4 = 78,                      /* $@4  */
  YYSYMBOL_assign = 79,                    /* assign  */
  YYSYMBOL_opt_expr_list = 80,             /* opt_expr_list  */
  YYSYMBOL_expr_list = 81,                 /* expr_list  */
  YYSYMBOL_expr = 82,                      /* expr  */
  YYSYMBOL_binary = 83                     /* binary  */
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
#define YYLAST   591

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  59
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  25
/* YYNRULES -- Number of rules.  */
#define YYNRULES  87
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  159

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   313


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
      55,    56,    57,    58
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    84,    84,    86,    93,    99,    99,   108,   111,   118,
     121,   127,   130,   136,   139,   145,   148,   154,   157,   163,
     165,   167,   172,   177,   179,   184,   187,   194,   197,   203,
     206,   212,   212,   218,   218,   223,   223,   227,   230,   233,
     236,   239,   242,   245,   251,   254,   255,   256,   257,   258,
     259,   260,   261,   265,   268,   274,   277,   283,   285,   287,
     290,   293,   296,   299,   302,   305,   308,   311,   314,   317,
     320,   323,   326,   332,   334,   335,   336,   337,   338,   339,
     340,   341,   342,   343,   344,   345,   346,   347
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
  "GOTO", "RETURN", "CASE", "NOT", "ASSIGN", "INC", "DEC", "OR", "EQ",
  "NEQ", "LT", "LE", "GT", "GE", "LSHIFT", "RSHIFT", "STAR", "SLASH",
  "MOD", "PLUS", "MINUS", "LPAREN", "RPAREN", "LBRACE", "RBRACE",
  "LBRACKET", "RBRACKET", "SEMICOLON", "COMMA", "COLON", "QUESTION",
  "AMPERSAND", "ASSIGN_OR", "ASSIGN_LSHIFT", "ASSIGN_RSHIFT",
  "ASSIGN_MINUS", "ASSIGN_PLUS", "ASSIGN_MOD", "ASSIGN_MUL",
  "ASSIGN_DIVIDE", "ERROR", "TERNARY", "UNARY", "DEREF", "ADDR_OF", "THEN",
  "$accept", "program", "definition", "$@1", "opt_ident_list",
  "ident_list", "opt_ival_list", "ival_list", "ival", "opt_const",
  "constant", "var_decl", "var_decl_list", "opt_statement",
  "opt_paren_expr", "opt_expr", "statement", "$@2", "$@3", "$@4", "assign",
  "opt_expr_list", "expr_list", "expr", "binary", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-65)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-36)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -65,    10,   -65,   -26,   -65,     6,   109,   -65,   -65,   -23,
     -65,   -65,   -65,   -14,   -65,    -7,    31,    67,   134,   -65,
     -65,     0,    27,   -65,   -65,    34,    73,     6,    48,    57,
     153,    58,   153,   153,   153,   153,   153,   153,   -65,   153,
     -65,    62,   -65,   -65,   433,   -65,   -65,    67,    65,   109,
     -65,   -24,   -19,   153,   153,   -65,   181,   153,    64,    -5,
      -5,    -5,    -5,    -5,   217,    92,    -5,   -65,   153,   -65,
     -65,   153,   153,   153,   153,   153,   153,   153,   153,   153,
     153,   153,   153,   153,   153,   153,   153,   153,   153,   153,
     153,   153,   153,   153,   153,   153,   153,   -65,   134,   -65,
     -65,    73,   -65,   253,   289,   -65,   325,   -65,   -65,   -65,
     -65,   433,   495,   536,   536,    56,    56,    56,    56,   553,
     553,    -5,    -5,    -5,     1,     1,    74,    75,   433,   361,
     397,   519,   433,   433,   433,   433,   433,   433,   433,   433,
     -65,   134,   -65,   134,   134,   134,   -65,   -65,   153,   -65,
     153,   -65,   -65,   104,   -65,   433,   468,   134,   -65
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,     0,     1,     0,     3,     7,    17,     9,     5,     8,
      21,    19,    20,     0,    18,     0,     0,    11,    29,    10,
      16,     0,    12,    13,    15,    58,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,    25,     0,
      57,     0,     6,    61,    30,    62,     4,     0,     0,    17,
      23,     0,     0,     0,     0,    58,     0,     0,     0,    68,
      63,    64,    69,    67,     0,    29,    70,    43,     0,    65,
      66,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    53,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    14,    29,    22,
      31,     0,    33,     0,     0,    41,     0,    42,    59,    37,
      26,    44,    73,    76,    77,    78,    79,    80,    81,    82,
      83,    74,    87,    86,    85,    84,     0,    54,    55,     0,
       0,    75,    45,    46,    47,    48,    49,    50,    51,    52,
      36,    29,    24,    29,    29,    29,    28,    60,     0,    71,
       0,    32,    34,    38,    40,    56,    72,    29,    39
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -65,   -65,   -65,   -65,   -65,    90,   -65,   -65,    72,    78,
      20,    21,   -65,   -65,   -65,   -65,   -64,   -65,   -65,   -65,
     -65,   -65,   -65,   -30,   -65
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     1,     4,    15,     8,     9,    21,    22,    23,    13,
      40,    50,    51,    65,    58,    41,    42,   141,   143,    48,
      43,   126,   127,    44,    45
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      56,   110,    59,    60,    61,    62,    63,    64,     5,    66,
       2,     7,     6,    69,    70,     3,   100,   101,    16,    69,
      70,   102,    16,   103,   104,    17,    14,   106,    18,    85,
      80,    81,    82,    86,   140,    85,    19,    24,   111,    86,
      46,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   128,   129,   130,   131,   132,
     133,   134,   135,   136,   137,   138,   139,    24,    47,    14,
      10,    11,    20,    12,    69,    70,   -35,   151,    49,   152,
     153,   154,    53,    78,    79,    80,    81,    82,    83,    84,
      85,    54,    57,   158,    86,    10,    11,    25,    12,    26,
      27,    28,    67,    29,   107,    30,    31,    98,    32,   147,
      33,    34,    10,    11,   157,    12,   148,    52,   155,    97,
     156,    35,   142,     0,     0,    36,    37,    99,    38,   109,
       0,     0,     0,     0,     0,     0,    39,    10,    11,    25,
      12,    26,    27,    28,     0,    29,     0,    30,    31,     0,
      32,     0,    33,    34,     0,     0,    10,    11,    55,    12,
       0,     0,     0,    35,     0,     0,     0,    36,    37,    32,
      38,    33,    34,     0,     0,     0,     0,     0,    39,     0,
       0,     0,    35,     0,     0,     0,    36,    37,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    39,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,     0,     0,     0,    86,
       0,   105,     0,     0,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,   108,     0,     0,    86,     0,     0,     0,     0,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,   144,     0,
       0,    86,     0,     0,     0,     0,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,   145,     0,     0,    86,     0,     0,
       0,     0,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
     146,     0,     0,    86,     0,     0,     0,     0,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,     0,     0,     0,    86,
     149,     0,     0,     0,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,     0,     0,     0,    86,     0,     0,     0,   150,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,     0,     0,
       0,    86,     0,     0,     0,     0,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,     0,     0,     0,    86,     0,     0,     0,
       0,    87,    88,    69,    70,     0,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
       0,     0,     0,    86,     0,     0,     0,    69,    70,    88,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    69,    70,     0,    86,     0,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    69,    70,     0,    86,     0,     0,     0,     0,     0,
       0,     0,    80,    81,    82,    83,    84,    85,     0,     0,
       0,    86
};

static const yytype_int16 yycheck[] =
{
      30,    65,    32,    33,    34,    35,    36,    37,    34,    39,
       0,     5,    38,    18,    19,     5,    40,    41,    41,    18,
      19,    40,    41,    53,    54,    39,     6,    57,    35,    34,
      29,    30,    31,    38,    98,    34,     5,    17,    68,    38,
      40,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    47,    41,    49,
       3,     4,     5,     6,    18,    19,    42,   141,     5,   143,
     144,   145,    34,    27,    28,    29,    30,    31,    32,    33,
      34,    34,    34,   157,    38,     3,     4,     5,     6,     7,
       8,     9,    40,    11,    40,    13,    14,    42,    16,    35,
      18,    19,     3,     4,    10,     6,    41,    27,   148,    47,
     150,    29,   101,    -1,    -1,    33,    34,    49,    36,    37,
      -1,    -1,    -1,    -1,    -1,    -1,    44,     3,     4,     5,
       6,     7,     8,     9,    -1,    11,    -1,    13,    14,    -1,
      16,    -1,    18,    19,    -1,    -1,     3,     4,     5,     6,
      -1,    -1,    -1,    29,    -1,    -1,    -1,    33,    34,    16,
      36,    18,    19,    -1,    -1,    -1,    -1,    -1,    44,    -1,
      -1,    -1,    29,    -1,    -1,    -1,    33,    34,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    44,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    -1,    -1,    -1,    38,
      -1,    40,    -1,    -1,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    -1,    -1,    38,    -1,    -1,    -1,    -1,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    -1,
      -1,    38,    -1,    -1,    -1,    -1,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    -1,    -1,    38,    -1,    -1,
      -1,    -1,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    -1,    -1,    38,    -1,    -1,    -1,    -1,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    -1,    -1,    -1,    38,
      39,    -1,    -1,    -1,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    -1,    -1,    -1,    38,    -1,    -1,    -1,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    -1,    -1,
      -1,    38,    -1,    -1,    -1,    -1,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    -1,    -1,    -1,    38,    -1,    -1,    -1,
      -1,    43,    44,    18,    19,    -1,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      -1,    -1,    -1,    38,    -1,    -1,    -1,    18,    19,    44,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    18,    19,    -1,    38,    -1,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    18,    19,    -1,    38,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    29,    30,    31,    32,    33,    34,    -1,    -1,
      -1,    38
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    60,     0,     5,    61,    34,    38,     5,    63,    64,
       3,     4,     6,    68,    69,    62,    41,    39,    35,     5,
       5,    65,    66,    67,    69,     5,     7,     8,     9,    11,
      13,    14,    16,    18,    19,    29,    33,    34,    36,    44,
      69,    74,    75,    79,    82,    83,    40,    41,    78,     5,
      70,    71,    64,    34,    34,     5,    82,    34,    73,    82,
      82,    82,    82,    82,    82,    72,    82,    40,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    38,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    67,    42,    68,
      40,    41,    40,    82,    82,    40,    82,    40,    35,    37,
      75,    82,    82,    82,    82,    82,    82,    82,    82,    82,
      82,    82,    82,    82,    82,    82,    80,    81,    82,    82,
      82,    82,    82,    82,    82,    82,    82,    82,    82,    82,
      75,    76,    70,    77,    35,    35,    35,    35,    41,    39,
      42,    75,    75,    75,    75,    82,    82,    10,    75
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    59,    60,    60,    61,    62,    61,    63,    63,    64,
      64,    65,    65,    66,    66,    67,    67,    68,    68,    69,
      69,    69,    70,    71,    71,    72,    72,    73,    73,    74,
      74,    76,    75,    77,    75,    78,    75,    75,    75,    75,
      75,    75,    75,    75,    79,    79,    79,    79,    79,    79,
      79,    79,    79,    80,    80,    81,    81,    82,    82,    82,
      82,    82,    82,    82,    82,    82,    82,    82,    82,    82,
      82,    82,    82,    83,    83,    83,    83,    83,    83,    83,
      83,    83,    83,    83,    83,    83,    83,    83
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     2,     6,     0,     6,     0,     1,     1,
       3,     0,     1,     1,     3,     1,     1,     0,     1,     1,
       1,     1,     2,     1,     3,     0,     2,     0,     3,     0,
       1,     0,     5,     0,     5,     0,     4,     3,     5,     7,
       5,     3,     3,     2,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     0,     1,     1,     3,     1,     1,     3,
       4,     1,     1,     2,     2,     2,     2,     2,     2,     2,
       2,     4,     5,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3
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
#line 86 "src/B.y"
                         {
        
    }
#line 1367 "B.tab.c"
    break;

  case 4: /* definition: IDENTIFIER LBRACKET opt_const RBRACKET opt_ival_list SEMICOLON  */
#line 93 "src/B.y"
                                                                   {
        /* identifier */
        

    }
#line 1377 "B.tab.c"
    break;

  case 5: /* $@1: %empty  */
#line 99 "src/B.y"
                                       {
        

    }
#line 1386 "B.tab.c"
    break;

  case 6: /* definition: IDENTIFIER LPAREN opt_ident_list $@1 RPAREN statement  */
#line 102 "src/B.y"
                       {
        exit_scope();
    }
#line 1394 "B.tab.c"
    break;

  case 7: /* opt_ident_list: %empty  */
#line 108 "src/B.y"
                {
        (yyval.opt).data = NULL;
    }
#line 1402 "B.tab.c"
    break;

  case 8: /* opt_ident_list: ident_list  */
#line 111 "src/B.y"
                 {
        (yyval.opt).data = (yyvsp[0].list);
    }
#line 1410 "B.tab.c"
    break;

  case 9: /* ident_list: IDENTIFIER  */
#line 118 "src/B.y"
               {
        
    }
#line 1418 "B.tab.c"
    break;

  case 10: /* ident_list: ident_list COMMA IDENTIFIER  */
#line 121 "src/B.y"
                                  {
        
    }
#line 1426 "B.tab.c"
    break;

  case 11: /* opt_ival_list: %empty  */
#line 127 "src/B.y"
                {
        (yyval.opt).data = NULL;
    }
#line 1434 "B.tab.c"
    break;

  case 12: /* opt_ival_list: ival_list  */
#line 130 "src/B.y"
                {
        (yyval.opt).data = (yyvsp[0].list);
    }
#line 1442 "B.tab.c"
    break;

  case 13: /* ival_list: ival  */
#line 136 "src/B.y"
         {
        
    }
#line 1450 "B.tab.c"
    break;

  case 14: /* ival_list: ival_list COMMA ival  */
#line 139 "src/B.y"
                           {
        
    }
#line 1458 "B.tab.c"
    break;

  case 15: /* ival: constant  */
#line 145 "src/B.y"
             { 
        
    }
#line 1466 "B.tab.c"
    break;

  case 16: /* ival: IDENTIFIER  */
#line 148 "src/B.y"
                 {
        
    }
#line 1474 "B.tab.c"
    break;

  case 17: /* opt_const: %empty  */
#line 154 "src/B.y"
                {
        (yyval.opt).data = NULL;
    }
#line 1482 "B.tab.c"
    break;

  case 18: /* opt_const: constant  */
#line 157 "src/B.y"
               { 
        (yyval.opt).data = (yyvsp[0].constant);
    }
#line 1490 "B.tab.c"
    break;

  case 19: /* constant: CHARCONST  */
#line 163 "src/B.y"
              {
    }
#line 1497 "B.tab.c"
    break;

  case 20: /* constant: STRING  */
#line 165 "src/B.y"
             {
    }
#line 1504 "B.tab.c"
    break;

  case 21: /* constant: NUMBER  */
#line 167 "src/B.y"
             {
    }
#line 1511 "B.tab.c"
    break;

  case 22: /* var_decl: IDENTIFIER opt_const  */
#line 172 "src/B.y"
                         {
    }
#line 1518 "B.tab.c"
    break;

  case 23: /* var_decl_list: var_decl  */
#line 177 "src/B.y"
             {
    }
#line 1525 "B.tab.c"
    break;

  case 24: /* var_decl_list: var_decl_list COMMA var_decl  */
#line 179 "src/B.y"
                                   {
    }
#line 1532 "B.tab.c"
    break;

  case 25: /* opt_statement: %empty  */
#line 184 "src/B.y"
                {
        (yyval.opt).data = NULL;
    }
#line 1540 "B.tab.c"
    break;

  case 26: /* opt_statement: opt_statement statement  */
#line 187 "src/B.y"
                              {
        (yyval.opt).data = (yyvsp[0].statement);
    }
#line 1548 "B.tab.c"
    break;

  case 27: /* opt_paren_expr: %empty  */
#line 194 "src/B.y"
                {
        (yyval.opt).data = NULL;
    }
#line 1556 "B.tab.c"
    break;

  case 28: /* opt_paren_expr: LPAREN expr RPAREN  */
#line 197 "src/B.y"
                         {
        (yyval.opt).data = (yyvsp[-1].expr);
    }
#line 1564 "B.tab.c"
    break;

  case 29: /* opt_expr: %empty  */
#line 203 "src/B.y"
                {
        (yyval.opt).data = NULL;
    }
#line 1572 "B.tab.c"
    break;

  case 30: /* opt_expr: expr  */
#line 206 "src/B.y"
           {
        (yyval.opt).data = (yyvsp[0].expr);
    }
#line 1580 "B.tab.c"
    break;

  case 31: /* $@2: %empty  */
#line 212 "src/B.y"
                                 {

    }
#line 1588 "B.tab.c"
    break;

  case 32: /* statement: AUTO var_decl_list SEMICOLON $@2 statement  */
#line 214 "src/B.y"
                {

    }
#line 1596 "B.tab.c"
    break;

  case 33: /* $@3: %empty  */
#line 218 "src/B.y"
                                 {
    }
#line 1603 "B.tab.c"
    break;

  case 34: /* statement: EXTRN ident_list SEMICOLON $@3 statement  */
#line 219 "src/B.y"
                {

    }
#line 1611 "B.tab.c"
    break;

  case 35: /* $@4: %empty  */
#line 223 "src/B.y"
                 {
    }
#line 1618 "B.tab.c"
    break;

  case 36: /* statement: IDENTIFIER $@4 COLON statement  */
#line 224 "src/B.y"
                      {
        
    }
#line 1626 "B.tab.c"
    break;

  case 37: /* statement: LBRACE opt_statement RBRACE  */
#line 227 "src/B.y"
                                  {
        
    }
#line 1634 "B.tab.c"
    break;

  case 38: /* statement: IF LPAREN expr RPAREN statement  */
#line 230 "src/B.y"
                                                 {
        /* Need something like if ($3) $5*/
    }
#line 1642 "B.tab.c"
    break;

  case 39: /* statement: IF LPAREN expr RPAREN statement ELSE statement  */
#line 233 "src/B.y"
                                                                {
        /* Need something like if ($3) $5 else $7 */
    }
#line 1650 "B.tab.c"
    break;

  case 40: /* statement: WHILE LPAREN expr RPAREN statement  */
#line 236 "src/B.y"
                                         {
        /* Need something like while ($3) $5 */
    }
#line 1658 "B.tab.c"
    break;

  case 41: /* statement: GOTO expr SEMICOLON  */
#line 239 "src/B.y"
                          {
        /* Need something like goto $2 */
    }
#line 1666 "B.tab.c"
    break;

  case 42: /* statement: RETURN opt_paren_expr SEMICOLON  */
#line 242 "src/B.y"
                                      {
        /* Need something like return $2 */
    }
#line 1674 "B.tab.c"
    break;

  case 43: /* statement: opt_expr SEMICOLON  */
#line 245 "src/B.y"
                         {
        /* Need something like $1 */
    }
#line 1682 "B.tab.c"
    break;

  case 44: /* assign: expr ASSIGN expr  */
#line 251 "src/B.y"
                                  {
        
    }
#line 1690 "B.tab.c"
    break;

  case 53: /* opt_expr_list: %empty  */
#line 265 "src/B.y"
                {
        (yyval.opt).data = NULL;
    }
#line 1698 "B.tab.c"
    break;

  case 54: /* opt_expr_list: expr_list  */
#line 268 "src/B.y"
                {
        (yyval.opt).data = (yyvsp[0].list);
    }
#line 1706 "B.tab.c"
    break;

  case 55: /* expr_list: expr  */
#line 274 "src/B.y"
         {
        
    }
#line 1714 "B.tab.c"
    break;

  case 56: /* expr_list: expr_list COMMA expr  */
#line 277 "src/B.y"
                           {
        
    }
#line 1722 "B.tab.c"
    break;

  case 57: /* expr: constant  */
#line 283 "src/B.y"
             {
    }
#line 1729 "B.tab.c"
    break;

  case 58: /* expr: IDENTIFIER  */
#line 285 "src/B.y"
                 {
    }
#line 1736 "B.tab.c"
    break;

  case 59: /* expr: LPAREN expr RPAREN  */
#line 287 "src/B.y"
                                      {
    }
#line 1743 "B.tab.c"
    break;

  case 60: /* expr: expr LPAREN opt_expr_list RPAREN  */
#line 290 "src/B.y"
                                       {

    }
#line 1751 "B.tab.c"
    break;

  case 61: /* expr: assign  */
#line 293 "src/B.y"
             {

    }
#line 1759 "B.tab.c"
    break;

  case 62: /* expr: binary  */
#line 296 "src/B.y"
             {

    }
#line 1767 "B.tab.c"
    break;

  case 63: /* expr: INC expr  */
#line 299 "src/B.y"
                         {

    }
#line 1775 "B.tab.c"
    break;

  case 64: /* expr: DEC expr  */
#line 302 "src/B.y"
                         {

    }
#line 1783 "B.tab.c"
    break;

  case 65: /* expr: expr INC  */
#line 305 "src/B.y"
               {

    }
#line 1791 "B.tab.c"
    break;

  case 66: /* expr: expr DEC  */
#line 308 "src/B.y"
               {

    }
#line 1799 "B.tab.c"
    break;

  case 67: /* expr: MINUS expr  */
#line 311 "src/B.y"
                             {

    }
#line 1807 "B.tab.c"
    break;

  case 68: /* expr: NOT expr  */
#line 314 "src/B.y"
                           {

    }
#line 1815 "B.tab.c"
    break;

  case 69: /* expr: STAR expr  */
#line 317 "src/B.y"
                            {

    }
#line 1823 "B.tab.c"
    break;

  case 70: /* expr: AMPERSAND expr  */
#line 320 "src/B.y"
                                   {

    }
#line 1831 "B.tab.c"
    break;

  case 71: /* expr: expr LBRACKET expr RBRACKET  */
#line 323 "src/B.y"
                                  {

    }
#line 1839 "B.tab.c"
    break;

  case 72: /* expr: expr QUESTION expr COLON expr  */
#line 326 "src/B.y"
                                                  {

    }
#line 1847 "B.tab.c"
    break;

  case 73: /* binary: expr OR expr  */
#line 332 "src/B.y"
                           {
     }
#line 1854 "B.tab.c"
    break;


#line 1858 "B.tab.c"

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

#line 350 "src/B.y"

// yyerror function
void yyerror(const char *msg) {
    fprintf(stderr, "Error at line %d: %s\n", yylineno, msg);
}

int main(int argc, char **argv, char **envp) {
    const char *input_file = NULL;
    const char *output_file = NULL;

    string_table = ht_create_table();
    // debugging flag
    yydebug = 1;
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

    // Start parsing
    int result = yyparse();
    if (yyin && yyin != stdin) {
        fclose(yyin);
    }
    if (out && out != stdout) {
        fclose(out);
    }
    return result;
}
