%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <assert.h>
#include "hash_table.h"
#include "symbol_table.h"
#include "vector.h"
#include "xmalloc.h"
#include "codegen.h"
#include "parser.h"

int yylex(void);
extern int  yylineno;
extern FILE *yyin;
FILE        *out = NULL;
void yyerror(const char *msg);

/**
 * Since all table data is needed till the end of the program,
 * there is no need to free the symbol table.
*/
symbol_table_t *global_table = NULL;
symbol_table_t *current_table = NULL;
htable_t       *string_table;

char *buffer[512];

/* offset stack */
int offset_stack[512];
int current_depth = 0;
%}

%code requires {
    #include "compiler_struct.h"
}
/* %glr-parser */
/* %define parse.trace */

%union {
    /* primitive constants */
    size_t          ival;
    char            *sval;

    opt_t           opt;    // for optional values
    list_t          list;   // for list values
    const_t         constant; // for constant types
    statement_t    statement; // for statement types
    expr_t         expr;   // for expression types
    ival_t         ival_s;   // for ival types
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

%type <opt> opt_ident_list opt_ival_list opt_expr_list
%type <opt> opt_paren_expr opt_expr opt_const opt_statement 
%type <list> ident_list ival_list var_decl_list expr_list
%type <constant> constant
%type <statement> statement
%type <expr> expr
%type <ival_s> ival

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
%code {
    /**
     * push ebp
     * mov ebp, esp
     * sub esp, <size>
     * ...
     * leave = resetting stack pointer and restoring caller's base pointer
     * ret
    */
}
%%

program:
    /* empty */
    | program definition {
        
    }
    ;

    /* 7.0 external definition */
    /* main(); exit() */
definition:
    /* 7.1 simple definition */
    IDENTIFIER opt_ival_list SEMICOLON {
        
    }
    /* 7.2 vector definitions */
    | IDENTIFIER LBRACKET opt_const RBRACKET opt_ival_list SEMICOLON {
        /* identifier */
        

    }
    /* 7.3 function definitions */
    | IDENTIFIER LPAREN opt_ident_list {
        enter_scope(current_table);
        assert(current_table != global_table);
    } RPAREN statement {
        exit_scope();
        assert(current_table == global_table);
}
    ;

opt_ident_list:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | ident_list {
        $$.value.list = $1;
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
        $$.kind = OPT_NONE;
    }
    | ival_list {
        $$.value.list = $1;
    }
    ;

ival_list:
    ival {
        ival_t *ival = (ival_t *)xmalloc(sizeof(ival_t));
        memcpy(ival, &$1, sizeof(ival_t));
        node_t *node = create_node(ival);

        ival_t *test_val = node->data;
        printf("%s\n", (char *)(test_val->value.constant.value));
        printf("%p\n", &($$));
        $$.size = 0;
        $$.head = NULL;
        $$.tail = NULL;
        add_node(&($$), node);
    }
    | ival_list COMMA ival {
        // ival_t *ival = (ival_t *)xmalloc(sizeof(ival_t));
        // memcpy(ival, &$3, sizeof(ival_t));
        // node_t *node = create_node(ival);

        // add_node($1, node);
        // $$ = $1;
    }
    ;

ival :
    constant {
        $$.type = IVAL_CONST;
        $$.value.constant = $1;
    }
    /* ival IDENTIFIERS can only be externally defined */
    | IDENTIFIER {
        $$.type = IVAL_IDENTIFIER;
        $$.value.identifier = $1;
    }
    ; 

opt_const:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | constant { 
        $$.value.constant = $1;
    }
    ;

constant:
    CHARCONST {
        $$.type = CONST_CHAR;
        $$.value = $1;

    }
    | STRING {
        $$.type = CONST_STRING;
        const char *label = st_get_label($1);
        $$.value = (size_t)label;
    }
    | NUMBER {
        $$.type = CONST_INT;
        $$.value = $1;
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
        $$.kind = OPT_NONE;
    }
    | opt_statement statement {
        $$.value.statement = $2;
    }
    ;


opt_paren_expr:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | LPAREN expr RPAREN {
        $$.value.expr = $2;
    }
    ;

opt_expr:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | expr {
        $$.value.expr = $1;
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
        $$.kind = OPT_NONE;
    }
    | expr_list {
        $$.value.list = $1;
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

int main(int argc, char **argv) {
    const char *input_file = NULL;
    const char *output_file = NULL;

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
    string_table = ht_create_table();

    init_assembly();

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
