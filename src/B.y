%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include "hash_table.h"
#include "compiler_struct.h"
#include "symbol_table.h"
#include "compiler_error.h"
#include "string_table.h"
#include "vector.h"

int yylex(void);
extern int  yylineno;
extern FILE *yyin;
FILE        *out = NULL;
void yyerror(const char *msg);


symbol_table_t	*global_table = NULL;
symbol_table_t	*current_table = NULL;
htable_t		*string_table = ht_create_table();

char *buffer[512];

%}
/* %glr-parser */
%define parse.trace

%union {
    /* primitive constants */
    size_t         ival;
    char            *sval;

    /* constants */
    const_value_t   const;

    /* optional */
    optional_t      opt;

    int             size;
    char            *code;

    /* lists */
    list_t          list;

    expr_t          expr;
    definition_t    definition;
}

%token <ival> NUMBER CHARCONST
%token <sval> IDENTIFIER STRING

%token AUTO EXTRN IF ELSE WHILE SWITCH GOTO RETURN CASE
%token NOT
%token ASSIGN

%token INC DEC
%token OR EQ NEQ LT LE GT GE LSHIFT RSHIFT STAR SLASH MOD PLUS MINUS
%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token SEMICOLON COMMA COLON QUESTION
%token AMPERSAND
%token ASSIGN_OR ASSIGN_LSHIFT ASSIGN_RSHIFT ASSIGN_MINUS ASSIGN_PLUS
%token ASSIGN_MOD ASSIGN_MUL ASSIGN_DIVIDE
%token ERROR

%type <const> constant
%type <opt> opt_const opt_ident_list opt_expr_list opt_ival_list
%type <opt> opt_statement opt_paren_expr opt_expr
%type <list> ident_list ival_list var_decl_list expr_list
%type <expr> expr
%type <ival> ival
%type <definition> definition

%left COMMA
%right ASSIGN ASSIGN_OR ASSIGN_LSHIFT ASSIGN_RSHIFT ASSIGN_MINUS ASSIGN_PLUS ASSIGN_MOD ASSIGN_MUL ASSIGN_DIVIDE
%right QUESTION COLON TERNARY
%left OR
%left NOT
%left AMPERSAND //binary and
%left EQ NEQ
%left LT LE GT GE
%left LSHIFT RSHIFT 
%left PLUS MINUS
%left STAR SLASH MOD //star is MUL
%right INC DEC UNARY DEREF ADDR_OF
%left LBRACKET RBRACKET LPAREN RPAREN
%right THEN ELSE

%{
    
typedef struct symbol {
    enum yytokentype    storage_class;
    char                *name;
    int                 offset;
    int                 is_defined;
} Symbol;

%}

%%

program:
    /* empty */
    | program definition {
        emit ($2.code);
    }
    ;

definition:
    /* 7.2 vector definitions */
    IDENTIFIER LBRACKET opt_const RBRACKET opt_ival_list SEMICOLON {
        /* identifier */
        char *name = $1;
        int size = 0;

        symbol_t *symbol = create_symbol(name, EXTRN, 0, 0);
        add_symbol(name, symbol);
        
        /* opt_const_decl */
        const_value_t *const_val = NULL;
        if ($3.data != NULL) {
            const_val = opt_const->data;
        }

        if (const_val) {
            if (const_val->type != CONST_INT) {
                yyerror("type error: expected integer constant");
            } else {
                size = const_val->int_val;
            }
        }

        /* opt_ival_list */
        list_t *ival_list = NULL;
        if ($5.data != NULL) {
            ival_list = $5.data;
            if (ival_list->size > size) {
                size = ival_list->size;
            }
        }

        /* after size is determined, create the symbol */
        snprintf(buffer, sizeof(buffer),
            "global %1$s\n\
            %1$s  DW ", name);
        append_string(buffer, $$.code);

        /* opt_ival_list */
        if ($5.data != NULL) {
            list_t *ival_list = $5.data;
            node_t *cur = ival_list->head;
            for (int i = 0; i < ival_list->size; i++) {
                ival_t *ival = (ival_t *) cur->data;
                char *fmt = i == 0 ? "%d" : ", %d";
                if (ival->type == VALUE) {
                    snprintf(buffer, sizeof(buffer), fmt, ival->int_val);
                } else {
                    snprintf(buffer, sizeof(buffer), fmt, ival->str_val);
                }
                append_string(buffer, $$.code);
                cur = cur->next;
                size--;
            }
            append_string("\n", $$.code);
        }
        if (size > 0) {
            snprintf(buffer, sizeof(buffer), "  RESD %d", size);
        }

    }
    /* 7.3 function definitions */
    | IDENTIFIER LPAREN opt_ident_list RPAREN statement {
        char *name = $1;

        /* identifier */
        symbol_t *symbol = create_symbol(name, LABEL, 0, 0);
        add_symbol(name, symbol);

        /* change the current symbol table */
        enter_scope(current_table);

        /* opt_ident_list */
        list_t *ident_list = NULL;
        if ($3.data != NULL) {
            ident_list = $3.data;
        }

        node_t *cur = ident_list->head;
        for (int i = 0; i < ident_list->size; i++) {
            symbol_t *symbol = (symbol_t *) cur->data;
            symbol->arg_num = i;
            add_symbol(symbol->name, symbol);
            cur = cur->next;
        }
        
    }
    ;

opt_ident_list:
    /* empty */ {
        $$.data = NULL;
    }
    | ident_list {
        $$.data = $1;
    }
    ;

/* argument list for function */
ident_list:
    IDENTIFIER {
        symbol_t *symbol = create_symbol($1, ARGUMENT, 0, 0);
        node_t *node = create_node(symbol);
        $$.size = 0;
        add_node($$, node);
    }
    | ident_list COMMA IDENTIFIER {
        symbol_t *symbol = create_symbol($3, ARGUMENT, 0, 0);
        node_t *node = create_node(symbol);
        add_node($1, node);
        $$ = $1;
    }
    ;

opt_ival_list:
    /* empty */ {
        $$.data = NULL;
    }
    | ival_list {
        $$.data = $1;
    }
    ;

ival_list:
    ival {
        ival_t *ival = malloc(sizeof(ival));
        memcpy(ival, $1, sizeof(ival));
    
        node_t *node = create_node(ival);
        $$.size = 0;
        add_node($$, node);
    }
    | ival_list COMMA ival {
        ival_t *ival = malloc(sizeof(ival));
        memcpy(ival, $3, sizeof(ival));
    
        node_t *node = create_node(ival);
        add_node($1, node);
        $$ = $1;
    }
    ;

ival :
    constant { 
        if ($1.type != CONST_STRING) {
            $$.type = VALUE;
            $$.int_val = $1.int_val;
        } else {
            $$.type = LABEL;
            $$.str_val = $1.str_val;
        }
    }
    | IDENTIFIER {
        symbol_t *symbol = (symbol_t) get_symbol($1);
        if (symbol == NULL) {
            yyerror(NIDENT);
        }
        /* global variable */
        if (symbol->offset == 0) {
            $$.value = symbol->name;
            $$.type = LABEL;
        } else {
            $$.value = symbol->offset;
            $$.type = AUTO;
        }
    }
    ; 

opt_const:
    /* empty */ {
        $$.data = NULL;
    }
    | constant { 
        $$.data = $1;
    }
    ;

constant:
    CHARCONST {
        $$.type = CONST_CHAR;
        $$.int_val = $1;
    }
    | STRING {
        $$.type = CONST_STRING;
        $$.str_val = st_get_label($1);
    }
    | NUMBER {
        $$.type = CONST_INT;
        $$.int_val = $1;
    }
    ;    

var_decl:
    IDENTIFIER opt_const
    ;

var_decl_list:
    var_decl
    | var_decl_list COMMA var_decl   
    ;

opt_statement:
    /* empty */ {
        $$.data = NULL;
    }
    | opt_statement statement
    ;


opt_paren_expr:
    /* empty */ {
        $$.data = NULL;
    }
    | LPAREN expr RPAREN
    ;

opt_expr:
    /* empty */ {
        $$.data = NULL;
    }
    | expr {
        $$.data = $1;
    }
    ;

statement:
    AUTO var_decl_list SEMICOLON statement
    | EXTRN ident_list SEMICOLON statement
    | IDENTIFIER COLON statement
    | LBRACE opt_statement RBRACE
    | IF LPAREN expr RPAREN statement %prec THEN
    | IF LPAREN expr RPAREN statement ELSE statement %prec ELSE
    | WHILE LPAREN expr RPAREN statement
    | GOTO expr SEMICOLON
    | RETURN opt_paren_expr SEMICOLON
    | opt_expr SEMICOLON
    ;

assign:
    expr ASSIGN expr %prec ASSIGN 
    | expr ASSIGN_OR expr %prec ASSIGN_OR
    | expr ASSIGN_LSHIFT expr %prec ASSIGN_LSHIFT
    | expr ASSIGN_RSHIFT expr %prec ASSIGN_RSHIFT
    | expr ASSIGN_MINUS expr %prec ASSIGN_MINUS
    | expr ASSIGN_PLUS expr %prec ASSIGN_PLUS
    | expr ASSIGN_MOD expr %prec ASSIGN_MOD
    | expr ASSIGN_MUL expr %prec ASSIGN_MUL 
    | expr ASSIGN_DIVIDE expr %prec ASSIGN_DIVIDE  
    ;

opt_expr_list:
    /* empty */ {
        $$.data = NULL;
    }
    | expr_list {
        $$.data = $1;
    }
    ;    

expr_list:
    expr {
        $$.size = 1;
        $$.data = malloc(sizeof(expr));

    }
    | expr_list COMMA expr {

    }
    ;

expr:
    constant
    | IDENTIFIER
    | LPAREN expr RPAREN %prec LPAREN
    | expr LPAREN opt_expr_list RPAREN 
    | assign
    | binary
    | INC expr %prec INC
    | DEC expr %prec DEC
    | expr INC
    | expr DEC
    | MINUS expr %prec UNARY
    | NOT expr %prec UNARY
    | STAR expr %prec DEREF
    | AMPERSAND expr %prec ADDR_OF
    | expr LBRACKET expr RBRACKET
    | expr QUESTION expr COLON expr %prec TERNARY
    ;

binary:
     expr OR expr %prec OR {
        int lhs, rhs;
        if (!$1.is_lvalue) {
            yyerror("Left operand of OR must be an lvalue");
        }
        if ($3.is_lvalue) {
            
        }
     }
    | expr STAR expr %prec STAR
    | expr AMPERSAND expr %prec AMPERSAND
    | expr EQ expr %prec EQ
    | expr NEQ expr %prec NEQ
    | expr LT expr %prec LT
    | expr LE expr %prec LE
    | expr GT expr %prec GT
    | expr GE expr %prec GE 
    | expr LSHIFT expr %prec LSHIFT
    | expr RSHIFT expr %prec RSHIFT
    | expr MINUS expr %prec MINUS
    | expr PLUS expr %prec PLUS
    | expr MOD expr %prec MOD
    | expr SLASH expr %prec SLASH
    ;

%%
// yyerror function
void yyerror(const char *msg) {
    fprintf(stderr, "Error at line %d: %s\n", yylineno, msg);
}

int main(int argc, char **argv, char **envp) {
    const char *input_file = NULL;
    const char *output_file = NULL;

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
