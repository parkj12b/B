%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "B.tab.h"   // Bison token definitions

extern int yylex(void);
extern char *yytext;  // Flex
extern YYSTYPE yylval; // yylval은 토큰의 값 (숫자라면 정수값, 문자열이라면 포인터)

int process_charconst(const char* text);

%}

%option noyywrap nodefault yylineno

%x COMMENT

%%
"/*"            { BEGIN(COMMENT); printf("Entering comment\n"); }
<COMMENT>"*/"   { BEGIN(INITIAL); printf("Exiting comment\n"); }
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
        case 'e':
        case '(':
        case ')':
        case 't': 
        case '\\':
        case '\'': 
        case '"': 
        case 'n':
            return 1;  // valid escape
        default:
            return 0;
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
            if (*p == '\0' || !is_valid_escape(*p)) {
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



/* 
int main() {
    int token;
    while ((token = yylex()) != 0) {  // 0 means end of input (EOF)
        printf("Token: %d (Text: %s)", token, yytext);
        
        // Print the value of yylval based on the token type
        if (token == NUMBER) {    // Example: If the token is a constant integer
            printf(" (Value: %d)", yylval.ival);
        } else if (token == IDENTIFIER) { // Example: If the token is an identifier
            printf(" (Identifier: %s)", yylval.sval);
        }
        
        printf("\n");
    }
    return 0;
} */
