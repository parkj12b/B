%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
}
%}
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

%precedence LVALUE_ONLY
%left COMMA
%right ASSIGN ASSIGN_OR ASSIGN_LSHIFT ASSIGN_RSHIFT ASSIGN_MINUS ASSIGN_PLUS ASSIGN_MOD ASSIGN_MUL
%right QUESTION COLON TERNARY
%left EQ NEQ
%left LT LE GT GE
%left PLUS MINUS
%left STAR SLASH MOD //star is MUL
%left OR
%left NOT
%left AMPERSAND //binary and
%left LSHIFT RSHIFT 
%right INC DEC UNARY DEREF ADDR_OF
%left FUNC_CALL LBRACKET RBRACKET LPAREN RPAREN
%nonassoc IFX
%nonassoc ELSE
%nonassoc PAREN

%%

program :
    definition_list
    ;
    
definition_list :
    /* empty */
    | definition_list definition
    ;

definition : 
    IDENTIFIER opt_array_decl opt_ival_list SEMICOLON
    | IDENTIFIER LPAREN opt_param_list RPAREN statement
    ;

ival : 
    constant
    | IDENTIFIER
    ;

opt_array_decl :
    /* empty */
    | LBRACKET opt_constant RBRACKET
    ;

opt_constant :
    /* empty */
    | constant
    ;

opt_ival_list :
    /* empty */
    | ival_list
    ;

ival_list :
    ival
    | ival_list COMMA ival
    ;

opt_param_list :
    /* empty */
    | param_list
    ;

param_list :
    IDENTIFIER
    | param_list COMMA IDENTIFIER
    ;

statement :
    AUTO var_decl_list SEMICOLON
    | EXTRN ident_list SEMICOLON
    | IDENTIFIER COLON statement
    | CASE constant COLON statement
    | LBRACE opt_statement RBRACE
    | IF LPAREN rvalue RPAREN statement %prec IFX
    | IF LPAREN rvalue RPAREN statement ELSE statement
    | WHILE LPAREN rvalue RPAREN statement
    | SWITCH rvalue statement
    | GOTO rvalue SEMICOLON
    | RETURN opt_bracket_rvalue SEMICOLON
    | opt_rvalue SEMICOLON
    ;

opt_rvalue : 
   /* empty */
   | rvalue
   ;

opt_bracket_rvalue : 
    /* empty */
    | LPAREN rvalue RPAREN %prec PAREN
    ;

opt_statement : 
    /* empty */
    | statement
    ;

ident_list : 
    IDENTIFIER
    | ident_list COLON IDENTIFIER
    ;

function_call : 
    rvalue LPAREN opt_rvalue_list RPAREN 
    ; 

rvalue : 
    LPAREN rvalue RPAREN
    | assign
    | binary
    | lvalue %prec LVALUE_ONLY
    | constant
    | inc_dec lvalue %prec UNARY 
    | lvalue inc_dec %prec UNARY
    | unary rvalue %prec UNARY
    | rvalue QUESTION rvalue COLON rvalue %prec TERNARY 
    | function_call
    ;

assign :
    lvalue ASSIGN rvalue %prec ASSIGN
    | lvalue ASSIGN_OR rvalue %prec ASSIGN_OR 
    | lvalue ASSIGN_LSHIFT rvalue %prec ASSIGN_LSHIFT
    | lvalue ASSIGN_RSHIFT rvalue %prec ASSIGN_RSHIFT
    | lvalue ASSIGN_MINUS rvalue %prec ASSIGN_MINUS
    | lvalue ASSIGN_PLUS rvalue %prec ASSIGN_PLUS
    | lvalue ASSIGN_MOD rvalue %prec ASSIGN_MOD
    | lvalue ASSIGN_MUL rvalue %prec ASSIGN_MUL    
    ;

binary :
    rvalue OR rvalue %prec OR
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
    | rvalue STAR rvalue %prec STAR
    | rvalue SLASH rvalue %prec SLASH
    ;
opt_rvalue_list : 
    /* empty */
    | rvalue_list
    ;

rvalue_list :
    rvalue
    | rvalue_list COLON rvalue
    ;

inc_dec : 
    INC
    | DEC
    ;

unary :
    AMPERSAND %prec ADDR_OF
    | MINUS %prec UNARY
    | NOT
    ;

lvalue : 
    IDENTIFIER
    | STAR rvalue %prec DEREF
    | rvalue LBRACKET rvalue RBRACKET
    ;

opt_const : 
    /* empty */
    | constant
    ;

var_decl_list :
    var_decl
    | var_decl_list COMMA var_decl
    ;

var_decl :
    IDENTIFIER opt_const
    ;

constant : 
    CHARCONST
    | STRING
    ;
%%

int main() {
    yydebug = 1;
    printf("Starting parser...\n");
    yyparse();
    printf("Parsing complete.\n");
    return 0;
}
