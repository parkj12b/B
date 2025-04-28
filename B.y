%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
}
%}
%glr-parser
%define parse.trace

%union {
    int ival;
    char* sval;
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
%token ASSIGN_MOD ASSIGN_MUL
%token ERROR

%start program

%precedence LOWEST
%left COMMA
%right ASSIGN ASSIGN_OR ASSIGN_LSHIFT ASSIGN_RSHIFT ASSIGN_MINUS ASSIGN_PLUS ASSIGN_MOD ASSIGN_MUL
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
    | program definition
    ;

definition:
    IDENTIFIER opt_const_decl opt_ival_list SEMICOLON
    | IDENTIFIER LPAREN opt_ident_list RPAREN statement 
    ;

opt_ident_list:
    /* empty */
    | ident_list
    ;

ident_list:
    IDENTIFIER
    | ident_list COMMA IDENTIFIER
    ;

opt_ival_list:
    /* empty */
    | ival_list
    ;

ival_list:
    ival
    | ival_list COMMA ival
    ;

ival :
    constant
    | IDENTIFIER
    ; 

opt_const_decl:
    /* empty */
    | LBRACKET opt_const RBRACKET
    ;

opt_const:
    /* empty */
    | constant
    ;

constant:
    CHARCONST
    | STRING
    | NUMBER
    ;    

var_decl:
    IDENTIFIER opt_const
    ;

var_decl_list:
    var_decl
    | var_decl_list COMMA var_decl   
    ;

opt_statement:
    /* empty */
    | statement
    ;


opt_bracket_rvalue:
    /* empty */
    | LPAREN rvalue RPAREN
    ;

opt_rvalue:
    /* empty */
    | rvalue
    ;

statement:
    AUTO var_decl_list SEMICOLON statement
    | EXTRN ident_list SEMICOLON statement
    | IDENTIFIER COLON statement
    | LBRACE opt_statement RBRACE
    | IF LPAREN rvalue RPAREN statement %prec THEN
    | IF LPAREN rvalue RPAREN statement ELSE statement %prec ELSE
    | WHILE LPAREN rvalue RPAREN statement
    | GOTO rvalue SEMICOLON
    | RETURN opt_bracket_rvalue SEMICOLON
    | opt_rvalue SEMICOLON
    ;

assign:
    lvalue ASSIGN rvalue %prec ASSIGN 
    | lvalue ASSIGN_OR rvalue %prec ASSIGN_OR
    | lvalue ASSIGN_LSHIFT rvalue %prec ASSIGN_LSHIFT
    | lvalue ASSIGN_RSHIFT rvalue %prec ASSIGN_RSHIFT
    | lvalue ASSIGN_MINUS rvalue %prec ASSIGN_MINUS
    | lvalue ASSIGN_PLUS rvalue %prec ASSIGN_PLUS
    | lvalue ASSIGN_MOD rvalue %prec ASSIGN_MOD
    | lvalue ASSIGN_MUL rvalue %prec ASSIGN_MUL   
    ;

inc_dec:
    INC
    | DEC
    ;

opt_rvalue_list:
    /* empty */
    | rvalue_list
    ;    

rvalue_list:
    rvalue
    | rvalue_list COMMA rvalue
    ;

inc_dec_expression:
    lvalue inc_dec %prec INC
    | inc_dec lvalue %prec INC
    ;

rvalue:
    LPAREN rvalue RPAREN %prec LPAREN
    | lvalue %prec LOWEST
    | constant
    | assign
    | binary 
    | inc_dec_expression
    | MINUS rvalue %prec UNARY
    | NOT rvalue %prec UNARY
    | AMPERSAND lvalue %prec ADDR_OF
    | rvalue QUESTION rvalue COLON rvalue %prec TERNARY
    | rvalue LPAREN opt_rvalue_list RPAREN 
    ;

binary:
     rvalue OR rvalue %prec OR
    | rvalue STAR rvalue %prec STAR
    | rvalue AMPERSAND rvalue %prec AMPERSAND
    | rvalue EQ rvalue %prec EQ
    | rvalue NEQ rvalue %prec NEQ
    | rvalue LT rvalue %prec LT
    | rvalue LE rvalue %prec LE
    | rvalue GT rvalue %prec GT
    | rvalue GE rvalue %prec GE 
    | rvalue LSHIFT rvalue %prec LSHIFT
    | rvalue RSHIFT rvalue %prec RSHIFT
    | rvalue MINUS rvalue %prec MINUS
    | rvalue PLUS rvalue %prec PLUS
    | rvalue MOD rvalue %prec MOD
    | rvalue SLASH rvalue %prec SLASH
    ;

lvalue:
    IDENTIFIER
    | STAR rvalue %prec DEREF
    | rvalue LBRACKET rvalue RBRACKET
    ;

%%

int main() {
    yydebug = 1;
    printf("Starting parser...\n");
    yyparse();
    printf("Parsing complete.\n");
    return 0;
}
