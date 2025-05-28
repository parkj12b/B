%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "B.tab.h"   // Bison token definitions
#include "vector.h"
#include "parser.h"

extern int yylex(void);
extern char *yytext;  // Flex
extern YYSTYPE yylval; // yylval은 토큰의 값 (숫자라면 정수값, 문자열이라면 포인터)
void yyerror(const char *s);

int process_charconst(const char* text);
char *str_to_assembly_str(const char *str);
%}

%option noyywrap nodefault yylineno

%x COMMENT

%%
"/*"            { BEGIN(COMMENT); eprintf("Entering comment\n"); }
<COMMENT>"*/"   { BEGIN(INITIAL); eprintf("Exiting comment\n"); }
<COMMENT>\n     { /* newline in comment */ }
<COMMENT>.      { /* other character in comment */ }

"auto"      { return AUTO; }
"extrn"     { return EXTRN; }
"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }
"switch"    { return SWITCH; }
"goto"      { return GOTO; }
"return"    { return RETURN; }
"case"      { return CASE; }

"="         { return ASSIGN; }
"=|"        { return ASSIGN_OR; }
"=&"        { return ERROR; }
"==="        { return ERROR; }
"=!="        { return ERROR; }
"=<"        { return ERROR; }
"=<="        { return ERROR; }
"=>"        { return ERROR; }
"=>="        { return ERROR; }
"=<<"        { return ASSIGN_LSHIFT; }
"=>>"        { return ASSIGN_RSHIFT; }
"=-"        { return ASSIGN_MINUS; }
"=+"        { return ASSIGN_PLUS; }
"=%"        { return ASSIGN_MOD; }
"=*"        { return ASSIGN_MUL; }
"=/"        { return ASSIGN_DIVIDE; }

"|"         { return OR; } //binary
"&"         { return AMPERSAND; }
"=="        { return EQ; }
"!="        { return NEQ; }
"<"         { return LT; }
"<="        { return LE; }
">"         { return GT; }
">="        { return GE; }
"<<"        { return LSHIFT; }
">>"        { return RSHIFT; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return STAR; }
"/"         { return SLASH; }
"%"         { return MOD; }

"++"        { return INC; }
"--"        { return DEC; }

"!"         { return NOT; }

"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"["         { return LBRACKET; }
"]"         { return RBRACKET; }
";"         { return SEMICOLON; }
","         { return COMMA; }
":"         { return COLON; }
"?"         { return QUESTION; }

[0-9]* {
    yylval.ival = atoi(yytext);
    return NUMBER;
}

[a-zA-Z_][a-zA-Z0-9_]{0,7} {
    yylval.sval = strdup(yytext);
    return IDENTIFIER;
}

'([^'\\]|\\.)*'   {
    yylval.ival = process_charconst(yytext); // Simple char const: 'x' 
    if (yylval.ival == ERROR) {
        fprintf(stderr, "Invalid character constant: line %d\n", yylineno);
        return ERROR;
    }
    return CHARCONST; }

\"[^\"]*\" {
    // yylval.sval = str_to_assembly_str(yytext); // String: "string"
    yylval.sval = strdup(yytext);
    return STRING;
}

[ \t\r]+                ;  // skip whitespace

\n  { }

. {
    fprintf(stderr, "Unknown character: '%s' at line %d\n", yytext, yylineno);
    return ERROR;
}

%%

int is_valid_escape(char c) {
    switch (c) {
        case '0':
            return 0;
        case 'e':
            return 
        case '(':
        case ')':
        case 't': 
        case '\\':
        case '\'': 
        case '"': 
        case 'n':
            return 1;  // valid escape
        default:
            return -1;
    }
}

int process_charconst(const char* text) {
    int logical_chars = 0;
    int char_value = 0;
    int is_escape_char = 0;
    const char* p = text + 1;  // skip opening '

    while (*p && *p != '\'') {  // until closing '
        if (*p == '\\') {
            p++;  // skip '\'
            if (*p == '\0' || is_valid_escape(*p) == -1) {
                fprintf(stderr, "Invalid escape sequence in char constant\n");
                return ERROR;
            }
            char_value << 1;
            char_value |= *p;  // store the escaped char
            p++;  // consume escaped char
            logical_chars++;
        } else {
            char_value << 1;
            char_value |= *p;
            p++;  // normal char
            logical_chars++;
        }
        if (logical_chars > 2) {
            fprintf(stderr, "Too many characters in char constant\n");
            return ERROR;
        }
    }

    if (logical_chars == 0) {
        fprintf(stderr, "Empty character constant\n");
        return ERROR;
    }

    return char_value; // Return your token
}

int escape_char_to_asm(const char c, var_str_t *var_str) {
    char *str = NULL;
    switch (c) {
        case '0':
        case 'e':
            str = "\", 0";
            break ;
        case '(':
            str = "\", 123";
            break ;
        case ')':
            str = "\", 125";
            break ;
        case 't': 
            str = "\", 9";
            break ;
        case '\\':
            str = "\", 92";
            break ;
        case '\'':
            str = "\", 39";
            break ;
        case '"': 
            str = "\", 34";
            break ;
        case 'n':
            str = "\", 10";
            break ;
        default:
            return 0;
    }
    append_str(str, var_str);
    return 1;
}

/* char *str_to_assembly_str(const char *str) {
    const char *p = str + 1; // Skip the opening "
    var_str_t *var_str = create_vector(32);
    int escape_flag = 0;

    append_char('"', var_str); // Start the string
    while (*p && *p != '"')
    {
        if (*p == '\\') {
            p++;  // Skip the backslash
            // Handle escape sequences here
            if (!escape_char_to_asm(*p, var_str))
                yyerror("Invalid escape sequence");
            p++;
            escape_flag = 1;
            continue;
        }
        if (escape_flag) {
            append_str(", \"", var_str);
            escape_flag = 0;
        }
        append_char(*p, var_str); // Copy the character
        p++;
    }
    if (escape_flag) {
        append_str(", 0", var_str);
    } else {
        append_str("\", 0", var_str); // Close the string
    }
    char *return_str = malloc(var_str->size + 1);
    memcpy(return_str, var_str->str, var_str->size);
    return_str[var_str->size] = '\0'; // Null-terminate the string
    free(var_str->str); // Free the original string
    free(var_str); // Free the vector structure
    return return_str; // Return the string
} */
