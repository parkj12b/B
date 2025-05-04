%{
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
%}
/* %glr-parser */
%define parse.trace

%union {
    /* primitive constants */
    size_t          ival;
    char            *sval;

    opt_t           opt;    // for optional values
    list_t          list;   // for list values
    const_t         constant; // for constant types
    statement_t    statement; // for statement types
    expr_t         expr;   // for expression types
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

%type <opt> opt_ident_list opt_ival_list opt_const opt_statement 
%type <opt> opt_paren_expr opt_expr opt_expr_list
%type <list> ident_list ival_list var_decl_list expr_list
%type <constant> constant
%type <statement> statement
%type <expr> expr

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

%%

program:
    /* empty */
    | program definition {
        
    }
    ;

definition:
    /* 7.2 vector definitions */
    IDENTIFIER LBRACKET opt_const RBRACKET opt_ival_list SEMICOLON {
        /* identifier */
        

    }
    /* 7.3 function definitions */
    | IDENTIFIER LPAREN opt_ident_list {
        

    } RPAREN statement {
        exit_scope();
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
        
    }
    | ident_list COMMA IDENTIFIER {
        
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
        
    }
    | ival_list COMMA ival {
        
    }
    ;

ival :
    constant { 
        
    }
    | IDENTIFIER {
        
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
    }
    | STRING {
    }
    | NUMBER {
    }
    ;    

var_decl:
    IDENTIFIER opt_const {
    }
    ;

var_decl_list:
    var_decl {
    }
    | var_decl_list COMMA var_decl {
    }
    ;

opt_statement:
    /* empty */ {
        $$.data = NULL;
    }
    | opt_statement statement {
        $$.data = $2;
    }
    ;


opt_paren_expr:
    /* empty */ {
        $$.data = NULL;
    }
    | LPAREN expr RPAREN {
        $$.data = $2;
    }
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
    AUTO var_decl_list SEMICOLON {

    } statement {

    }
    /* 6.1 external declaration */
    | EXTRN ident_list SEMICOLON {
    } statement {

    }
    /*  */
    | IDENTIFIER {
    } COLON statement {
        
    }
    | LBRACE opt_statement RBRACE {
        
    }
    | IF LPAREN expr RPAREN statement %prec THEN {
        /* Need something like if ($3) $5*/
    }
    | IF LPAREN expr RPAREN statement ELSE statement %prec ELSE {
        /* Need something like if ($3) $5 else $7 */
    }
    | WHILE LPAREN expr RPAREN statement {
        /* Need something like while ($3) $5 */
    }
    | GOTO expr SEMICOLON {
        /* Need something like goto $2 */
    }
    | RETURN opt_paren_expr SEMICOLON {
        /* Need something like return $2 */
    }
    | opt_expr SEMICOLON {
        /* Need something like $1 */
    }
    ;

assign:
    expr ASSIGN expr %prec ASSIGN {
        
    }
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
        
    }
    | expr_list COMMA expr {
        
    }
    ;

expr:
    constant {
    }
    | IDENTIFIER {
    }
    | LPAREN expr RPAREN %prec LPAREN {
    }
    /* function call */
    | expr LPAREN opt_expr_list RPAREN {

    }
    | assign {

    }
    | binary {

    }
    | INC expr %prec INC {

    }
    | DEC expr %prec DEC {

    }
    | expr INC {

    }
    | expr DEC {

    }
    | MINUS expr %prec UNARY {

    }
    | NOT expr %prec UNARY {

    }
    | STAR expr %prec DEREF {

    }
    | AMPERSAND expr %prec ADDR_OF {

    }
    | expr LBRACKET expr RBRACKET {

    }
    | expr QUESTION expr COLON expr %prec TERNARY {

    }
    ;

binary:
     expr OR expr %prec OR {
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
