%{
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
%}

%code requires {
    #include "compiler_struct.h"
}
/* %glr-parser */
%define parse.trace

%union {
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
}

%token <ival> NUMBER CHARCONST
%token <sval> IDENTIFIER STRING

%token AUTO EXTRN IF ELSE WHILE SWITCH GOTO RETURN CASE
%token NOT BREAK CONTINUE
%token ASSIGN

%token INC DEC BIT_NOT
%token OR EQ NEQ LT LE GT GE LSHIFT RSHIFT STAR SLASH MOD PLUS MINUS //TODO: negative
%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token SEMICOLON COMMA COLON QUESTION
%token AMPERSAND
%token ASSIGN_OR ASSIGN_LSHIFT ASSIGN_RSHIFT ASSIGN_MINUS ASSIGN_PLUS
%token ASSIGN_MOD ASSIGN_MUL ASSIGN_DIVIDE ASSIGN_AMPERSAND
%token ERROR

%type <opt> opt_ident_list opt_ival_list opt_expr_list
%type <opt> opt_paren_expr opt_expr opt_const opt_statement 
%type <list> ident_list ival_list var_decl_list expr_list
%type <constant> constant
%type <expr> expr binary assign
%type <ival_s> ival
%type <definition> definition
%type <var_decl> var_decl

%left COMMA
%right ASSIGN ASSIGN_OR ASSIGN_LSHIFT ASSIGN_RSHIFT ASSIGN_MINUS ASSIGN_PLUS ASSIGN_MOD ASSIGN_MUL ASSIGN_DIVIDE ASSIGN_AMPERSAND
%right QUESTION COLON TERNARY
%left OR
%left NOT
%left AMPERSAND //binary and
%left EQ NEQ
%left LT LE GT GE
%left LSHIFT RSHIFT 
%left PLUS MINUS
%left STAR SLASH MOD //star is MUL
%right INC DEC UNARY DEREF ADDR_OF BIT_NOT
%left LBRACKET RBRACKET LPAREN RPAREN
%right THEN ELSE

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
        symbol_t *symbol = (symbol_t *)xmalloc(sizeof(symbol_t));
        symbol_t *symbol_cpy = (symbol_t *)xmalloc(sizeof(symbol_t));
        
        if ($2.kind == OPT_NONE) {
            symbol->size = 1;
            symbol->value.data = NULL;
            symbol->type = SYMBOL_GLOBAL;
            symbol->is_array = false;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_uninit, $1, symbol);
            add_symbol($1, symbol_cpy);
        } else {
            list_t *list = (list_t *)xmalloc(sizeof(list_t));
            memcpy(list, &$2.value.list, sizeof(list_t));
            symbol->value.data = list;
            symbol->size = list->size;
            symbol->type = SYMBOL_GLOBAL;
            if (symbol->size > 1)
                symbol->is_array = true;
            else
                symbol->is_array = false;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_init, $1, symbol);
            add_symbol($1, symbol_cpy);
        }
        free($1);
    }
    /* 7.2 vector definitions */
    | IDENTIFIER LBRACKET opt_const RBRACKET opt_ival_list SEMICOLON {
        symbol_t *symbol = (symbol_t *)xmalloc(sizeof(symbol_t));
        symbol_t *symbol_cpy = (symbol_t *)xmalloc(sizeof(symbol_t));
        
        symbol->type = SYMBOL_GLOBAL;
        if ($3.kind != OPT_NONE) {
            const_t *constant = &($3.value.constant);
            if (constant->type != CONST_INT) {
                yyerror("Array size must be an integer");
            }
            symbol->size = constant->value;
        } else {
            symbol->size = 1; // default size is 1
        }

        if ($5.kind == OPT_NONE) {
            symbol->value.data = NULL;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_uninit, $1, symbol);
            add_symbol($1, symbol_cpy);
        } else {
            list_t *list = (list_t *)xmalloc(sizeof(list_t));
            memcpy(list, &$5.value.list, sizeof(list_t));
            symbol->value.data = list;
            symbol->is_array = true;
            memcpy(symbol_cpy, symbol, sizeof(symbol_t));
            add_symbol_table(global_init, $1, symbol);
            add_symbol($1, symbol_cpy);
        }
        free($1);
    }
    /* 7.3 function definitions */
    | IDENTIFIER LPAREN opt_ident_list {
        symbol_t *symbol = (symbol_t *)xmalloc(sizeof(symbol_t));

        /* function table */
        entry_t *entry = ht_search(function_table, $1, 1);
        if (entry == NULL) {
            ht_insert(function_table, $1, DECLARED);
        } else {
            entry->value = DECLARED;
        }

        if ($3.kind == OPT_NONE) {
            symbol->size = 0;
        } else {
            symbol->size = $3.value.list.size;
        }
        symbol->type = SYMBOL_FUNCTION;
        add_symbol_table(global_table, $1, symbol);
        emit("%s:", $1);
        emit(".long %s + 4", $1);
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
        if ($3.kind != OPT_NONE) {
            add_argument_symb($1, &($3.value.list));
        }
        print_symbol_table(current_table);
    } RPAREN statement {
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
        free($1);
        
    }
    ;

opt_ident_list:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | ident_list {
        $$.value.list = $1;
        $$.kind = OPT_VALUE;
    }
    ;

/* argument list for function */
ident_list:
    IDENTIFIER {
        node_t *node = create_node($1);

        $$.size = 0;
        $$.head = NULL;
        $$.tail = NULL;
        add_node(&($$), node);
    }
    | ident_list COMMA IDENTIFIER {
        node_t *node = create_node($3);
        add_node(&($1), node);
        $$ = $1;
    }
    ;

opt_ival_list:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | ival_list {
        $$.value.list = $1;
        $$.kind = OPT_VALUE;
    }
    ;

ival_list:
    ival {
        ival_t *ival = (ival_t *)xmalloc(sizeof(ival_t));
        memcpy(ival, &$1, sizeof(ival_t));
        node_t *node = create_node(ival);

        $$.size = 0;
        $$.head = NULL;
        $$.tail = NULL;
        add_node(&($$), node);
    }
    | ival_list COMMA ival {
        ival_t *ival = (ival_t *)xmalloc(sizeof(ival_t));
        memcpy(ival, &$3, sizeof(ival_t));
        node_t *node = create_node(ival);

        add_node(&($1), node);
        $$ = $1;
    }
    ;

ival :
    constant {
        $$.type = IVAL_CONST;
        memcpy(&($$.value.constant), &$1, sizeof(const_t));
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
        $$.kind = OPT_VALUE;;
    }
    ;

/* 4.1 primary expression */
constant:
    CHARCONST {
        $$.type = CONST_CHAR;
        $$.value = $1;
    }
    | STRING {
        $$.type = CONST_STRING;
        const char *label = st_get_label($1);
        $$.value = (size_t)label;
        free($1);
    }
    | NUMBER {
        $$.type = CONST_INT;
        $$.value = $1;
    }
    ;    

/* 6.2 automatic declaration */
/*
    opt_const defines the size of the variable
    if opt_const is empty, size is a word
*/
var_decl:
    IDENTIFIER opt_const {
        if ($2.kind != OPT_NONE) {
            const_t *constant = (const_t *)xmalloc(sizeof(const_t));
            memcpy(constant, &$2.value.constant, sizeof(const_t));
            
            $$.constant = constant;
        } else {
            $$.constant = NULL;
        }
        $$.name = $1;
    }
    ;


var_decl_list:
    var_decl {
        var_decl_t *var_decl = (var_decl_t *)xmalloc(sizeof(var_decl_t));
        memcpy(var_decl, &$1, sizeof(var_decl_t));
        node_t *node = create_node(var_decl);
        $$.size = 0;
        $$.head = NULL;
        $$.tail = NULL;
        add_node(&($$), node);
    }
    | var_decl_list COMMA var_decl {
        var_decl_t *var_decl = (var_decl_t *)xmalloc(sizeof(var_decl_t));
        memcpy(var_decl, &$3, sizeof(var_decl_t));
        node_t *node = create_node(var_decl);

        add_node(&($1), node);
        $$ = $1;

    }
    ;

opt_statement:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | opt_statement statement {
        $$.kind = OPT_VALUE;
    }
    ;


opt_paren_expr:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | LPAREN expr RPAREN {
        $$.value.expr = $2;
        $$.kind = OPT_VALUE;
    }
    ;

opt_expr:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | expr {
        $$.value.expr = $1;
        $$.kind = OPT_VALUE;
    }
    ;

statement:
    open_statement
    | closed_statement
    ;

simple_statement:
    GOTO expr SEMICOLON { //TODO: check if expr is a label and local
        emit("jmp [.%s]", $2.identifier);
        free_expr(&$2);
    }
    | RETURN opt_paren_expr SEMICOLON {
        if ($2.kind != OPT_NONE) {
            load_value_into_reg(&($2.value.expr), "eax");
            free_expr(&$2.value.expr);
        } else {
            emit("mov eax, 0");
        }
        emit ("jmp _exit");
    }
    | opt_expr SEMICOLON {

        if ($1.kind != OPT_NONE) {
            expr_t *expr = &$1.value.expr;
            if (expr->type != EXPR_CONST) {
                get_symbol(expr->identifier);
            }
            free_expr(&$1.value.expr);
        }
    }    
    | BREAK SEMICOLON {
        if (loop_label_index == 0) {
            yyerror("break statement not within a loop");
        } else {
            emit("jmp .LE%zu", loop_label_stack[loop_label_index - 1]);
        }
    }
    | CONTINUE SEMICOLON {
        if (loop_label_index == 0) {
            yyerror("continue statement not within a loop");
        } else {
            emit("jmp .LS%zu", loop_label_stack[loop_label_index - 1]);
        }
    }
    ;

/* 6.2 Automatic declaration */
// TODO: change constant size to initialization
auto:
    AUTO var_decl_list SEMICOLON {
        add_auto_symb(&($2));
    }
    ;

/* 6.1 External declaration */
extrn:
    EXTRN ident_list SEMICOLON {
        add_extrn_symbol(&($2));
    }
    ;

/* 6.3 Internal declaration */
colon:
    IDENTIFIER COLON {
        /* labels are local */
        emit("jmp [.%s]", $1);
        emit(".%s:", $1);
        emit(".long .%s + 4", $1);
        add_symbol($1, NULL);
        free($1);
    }
    ;

statement_prefix:
    auto
    | extrn
    | colon
    ;

if_expr:
    IF LPAREN expr RPAREN {
        load_value_into_reg(&$3, "eax");
        emit("test eax, eax");
        label_stack[label_index] = label_counter;
        emit("jz .LF%zu", label_stack[label_index]);
        free_expr(&$3);
        increase_label();
    }
    ;

if_closed:
    if_expr closed_statement {
        emit("jmp .LE%zu", label_stack[label_index - 1]);
        emit(".LF%zu:", label_stack[label_index - 1]);
    }

while_expr:
    WHILE {
        label_stack[label_index] = label_counter; 
        loop_label_stack[loop_label_index] = label_counter;
        emit(".LS%zu:", label_stack[label_index]);
    } LPAREN expr RPAREN {
        load_value_into_reg(&$4, "eax");
        emit("test eax, eax");
        emit("jz .LE%zu", label_stack[label_index]);
        increase_label();
        loop_label_index++;
        free_expr(&$4);
    }
    ;

open_statement:
    if_expr statement {
        label_index--;
        emit(".LF%zu:", label_stack[label_index]);
    }
    | if_closed ELSE open_statement {
        label_index--;
        emit(".LE%zu:", label_stack[label_index]);
    }    | while_expr open_statement {
        label_index--;
        loop_label_index--;
        emit("jmp .LS%zu", label_stack[label_index]);
        emit(".LE%zu:", label_stack[label_index]);
    }
    | statement_prefix open_statement /* no action */
    ;

closed_statement:
    simple_statement /* no action */
    | if_closed ELSE closed_statement {
        label_index--;
        emit(".LE%zu:", label_stack[label_index]);
    }    | while_expr closed_statement {
        label_index--;
        loop_label_index--;
        emit("jmp .LS%zu", label_stack[label_index]);
        emit(".LE%zu:", label_stack[label_index]);
    }
    | statement_prefix closed_statement /* no action */
    | LBRACE opt_statement RBRACE
    ;

assign:
    expr ASSIGN expr %prec ASSIGN {
        perform_assign(&$1, ASSIGN, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);

    }
    | expr ASSIGN_OR expr %prec ASSIGN_OR {
        perform_assign(&$1, ASSIGN_OR, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_AMPERSAND expr %prec ASSIGN_AMPERSAND {
        perform_assign(&$1, ASSIGN_AMPERSAND, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_LSHIFT expr %prec ASSIGN_LSHIFT {
        perform_assign(&$1, ASSIGN_LSHIFT, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_RSHIFT expr %prec ASSIGN_RSHIFT {
        perform_assign(&$1, ASSIGN_RSHIFT, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_MINUS expr %prec ASSIGN_MINUS {
        perform_assign(&$1, ASSIGN_MINUS, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_PLUS expr %prec ASSIGN_PLUS {
        perform_assign(&$1, ASSIGN_PLUS, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_MOD expr %prec ASSIGN_MOD {
        perform_assign(&$1, ASSIGN_MOD, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_MUL expr %prec ASSIGN_MUL {
        perform_assign(&$1, ASSIGN_MUL, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }
    | expr ASSIGN_DIVIDE expr %prec ASSIGN_DIVIDE {
        perform_assign(&$1, ASSIGN_DIVIDE, &$3);
        free_expr(&$3);
        return_post_assign(&$$, &$1);
    }  
    ;

opt_expr_list:
    /* empty */ {
        $$.kind = OPT_NONE;
    }
    | expr_list {
        $$.value.list = $1;
        $$.kind = OPT_VALUE;
    }
    ;    

expr_list:
    expr {
        expr_t *expr = (expr_t *)xmalloc(sizeof(expr_t));
        memcpy(expr, &$1, sizeof(expr_t));
        node_t *node = create_node(expr);

        $$.size = 0;
        $$.head = NULL;
        $$.tail = NULL;
        add_node(&($$), node);
    }
    | expr_list COMMA expr {
        expr_t *expr = (expr_t *)xmalloc(sizeof(expr_t));
        memcpy(expr, &$3, sizeof(expr_t));
        node_t *node = create_node(expr);
        add_node(&($1), node);
        $$ = $1;
    }
    ;

expr:
    constant {
        $$.type = EXPR_CONST;
        $$.val_kind = EXPR_RVALUE;
        $$.constant = $1;
    }
    | IDENTIFIER {
        $$.val_kind = EXPR_LVALUE;
        $$.type = EXPR_VAL;
        $$.identifier = $1;
    }
    | LPAREN expr RPAREN %prec LPAREN {
        $$ = $2;
    }
    /* function call */
    | expr LPAREN opt_expr_list RPAREN {

         /* check if function exist */
        entry_t *entry = ht_search(function_table, $1.identifier, 1);
        if (entry == NULL) {
            ht_insert(function_table, $1.identifier, (void *)REFERENCED);
        }

        if ($1.val_kind != EXPR_LVALUE) {
            yyerror("LHS of function call must be a Lvalue");
        }

        if ($3.kind != OPT_NONE) {
            function_call(&($3.value.list));
        }
        if ($1.val_kind == EXPR_LVALUE) {
            load_value_into_reg(&$1, "eax");
            emit("call eax\n");
        } else {
            emit("call %zu\n", $1.value); //TODO: fix it so function ptr can work
        }
        /* clean up passed arguments */
        size_t arg_resb = $3.value.list.size * 4;
        if (arg_resb > 0) {
            emit("add esp, %zu\n", arg_resb);
        }
        $$.val_kind = EXPR_RVALUE;
        $$.type = EXPR_VAL;
        free_expr(&$1);
        add_temp_symbol(&$$);
        register_to_lvalue(&$$, "eax");
    }
    | assign {
        $$ = $1;
    }
    | binary {
        $$ = $1;
        $$.type == EXPR_VAL;
    }
    | INC expr %prec INC {
        if ($2.val_kind != EXPR_LVALUE) {
            yyerror("LHS of increment must be a Lvalue");
        }
        unary(&$2, "inc");
        $$ = $2;
        $$.type = EXPR_VAL;
        $$.val_kind = EXPR_RVALUE;
    }
    | DEC expr %prec DEC {
        if ($2.val_kind != EXPR_LVALUE) {
            yyerror("LHS of decrement must be a Lvalue");
        }
        unary(&$2, "dec");
        $$ = $2;
        $$.type = EXPR_VAL;
        $$.val_kind = EXPR_RVALUE;
    }
    | BIT_NOT expr %prec BIT_NOT {
        load_value_into_reg(&$2, "eax");
        free_expr(&$2);
        emit("not eax");
        $$.type = EXPR_VAL;
        $$.val_kind = EXPR_RVALUE;
        add_temp_symbol(&$$);
        register_to_lvalue(&$$, "eax");
    }
    | expr INC {
        if ($1.val_kind != EXPR_LVALUE) {
            yyerror("LHS of increment must be a Lvalue");
        }

        load_value_into_reg(&$1, "eax");
        emit("mov ecx, eax");
        unary(&$1, "inc");
        free_expr(&$1);
        add_temp_symbol(&$$);
        $$.val_kind = EXPR_RVALUE;
        $$.type = EXPR_VAL;
        register_to_lvalue(&$$, "ecx");
    }
    | expr DEC {
        if ($1.val_kind != EXPR_LVALUE) {
            yyerror("LHS of decrement must be a Lvalue");
        }
        load_value_into_reg(&$1, "eax");
        emit("mov ecx, eax");
        unary(&$1, "dec");
        free_expr(&$1);
        add_temp_symbol(&$$);
        $$.val_kind = EXPR_RVALUE;
        $$.type = EXPR_VAL;
        register_to_lvalue(&$$, "ecx");
    }
    | MINUS expr %prec UNARY {
        load_value_into_reg(&$2, "eax");
        free_expr(&$2);
        emit("neg eax");
        $$.type = EXPR_VAL;
        $$.val_kind = EXPR_RVALUE;
        add_temp_symbol(&$$);
        register_to_lvalue(&$$, "eax");
    }
    | NOT expr %prec UNARY {
        load_value_into_reg(&$2, "eax");
        free_expr(&$2);
        emit("test eax, eax");
        emit("setz al");
        emit("movzx eax, al");
        $$.type = EXPR_VAL;
        $$.val_kind = EXPR_RVALUE;
        add_temp_symbol(&$$);
        register_to_lvalue(&$$, "eax");
    }
    | STAR expr %prec DEREF {
        load_value_into_reg(&$2, "eax");
        free_expr(&$2);
        add_temp_symbol(&$$);
        $$.type = EXPR_DEREF;
        $$.val_kind = EXPR_LVALUE;
        load_value_reg_to_lvalue(&$$, "eax");
    }
    | AMPERSAND expr %prec ADDR_OF {
        if ($2.val_kind == EXPR_RVALUE)
            yyerror("L-Value required for taking the address of.");
        $$.type = EXPR_VAL;
        $$.val_kind = EXPR_RVALUE;
        load_address_reg(&$2, "eax");
        free_expr(&$2);
        add_temp_symbol(&$$);
        register_to_lvalue(&$$, "eax");
    }
    | expr LBRACKET expr RBRACKET { //TODO: decide what to do with vector_access. EXPR_LVALUE
        vector_access(&$1, &$3);
        emit("imul ebx, 4");
        emit("add ebx, eax");
        add_temp_symbol(&$$);
        $$.val_kind = EXPR_LVALUE;
        $$.type = EXPR_DEREF;
        $$.storage_kind = EXPR_TEMP;
        load_value_reg_to_lvalue(&$$, "ebx");
    }
    | expr QUESTION {
        load_value_into_reg(&$1, "eax");
        free_expr(&$1);
        $<expr>$.val_kind = EXPR_RVALUE;
        add_temp_symbol(&$<expr>$);
        emit("test eax, eax");
        emit("jz .LF%zu", label_counter);
    } expr COLON {
        load_value_into_reg(&$4, "eax");
        free_expr(&$4);
        register_to_lvalue(&$<expr>3, "eax");
        $<expr>$ = $<expr>3;
        emit("jmp .LE%zu", label_counter);
        emit(".LF%zu:", label_counter);
    } expr %prec TERNARY {
        $$.type = EXPR_VAL;
        $$.storage_kind = EXPR_TEMP;
        load_value_into_reg(&$7, "eax");
        free_expr(&$7);
        register_to_lvalue(&$<expr>6, "eax");
        $$ = $<expr>6;
        emit(".LE%zu:", label_counter);
        $$.type = EXPR_VAL;
        label_counter++;
    }
    ;

binary:
    expr OR expr %prec OR {
        binary_op(&$1, OR, &$3, &$$);
    }
    | expr STAR expr %prec STAR {
        binary_op(&$1, STAR, &$3, &$$);
    }
    | expr AMPERSAND expr %prec AMPERSAND {
        binary_op(&$1, AMPERSAND, &$3, &$$);
    }
    | expr EQ expr %prec EQ {
        binary_op(&$1, EQ, &$3, &$$);
    }
    | expr NEQ expr %prec NEQ {
        binary_op(&$1, NEQ, &$3, &$$);
    }
    | expr LT expr %prec LT {
        binary_op(&$1, LT, &$3, &$$);
    }
    | expr LE expr %prec LE {
        binary_op(&$1, LE, &$3, &$$);
    }
    | expr GT expr %prec GT {
        binary_op(&$1, GT, &$3, &$$);
    }
    | expr GE expr %prec GE {
        binary_op(&$1, GE, &$3, &$$);
    }
    | expr LSHIFT expr %prec LSHIFT {
        binary_op(&$1, LSHIFT, &$3, &$$);
    }
    | expr RSHIFT expr %prec RSHIFT {
        binary_op(&$1, RSHIFT, &$3, &$$);
    }
    | expr MINUS expr %prec MINUS {
        binary_op(&$1, MINUS, &$3, &$$);
    }
    | expr PLUS expr %prec PLUS {
        binary_op(&$1, PLUS, &$3, &$$);
    }
    | expr MOD expr %prec MOD { // TODO
        binary_op(&$1, MOD, &$3, &$$);
    }
    | expr SLASH expr %prec SLASH {
        binary_op(&$1, SLASH, &$3, &$$);
    }
    ;

%%
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
