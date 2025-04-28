%{
#include "B.tab.h"   // Bison token definitions
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex(void);
extern char *yytext;  // Flex가 제공하는 현재 토큰 문자열
extern YYSTYPE yylval; // yylval은 토큰의 값 (숫자라면 정수값, 문자열이라면 포인터)
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
"=/"        { return ERROR; }

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
'[^'*]'     { yylval.ival = yytext[1]; // Simple char const: 'x' 
    return CHARCONST; }

'\*\*'         { yylval.ival = '*'; // Escaped '*': '**' 
    return CHARCONST; }

'\*0' { yylval.ival = 0; // Null character: '*0' 
    return CHARCONST; }

'\*e' { yylval.ival = -1; // EOF, system-specific (often -1 or 255) 
    return CHARCONST; }

'\*\(' { yylval.ival = 123; // Left brace: '(' 
    return CHARCONST; }

'\*\)' { yylval.ival = 124; // Right brace: ')' 
    return CHARCONST; }

'\*t' { yylval.ival = '\t'; // Tab: '*t' 
    return CHARCONST; }

'\*'' { yylval.ival = '\''; // Single quote: ''' 
    return CHARCONST; }

'\*\"' { yylval.ival = '\"'; // Double quote: '"' 
    return CHARCONST; }

'\*n' { yylval.ival = '\n'; // Newline: '*n' 
    return CHARCONST; }

'\*.' { 
    fprintf(
        stderr, 
        "Invalid escape sequence: '%s' at line %d\n", 
        yytext, 
        yylineno
    ); 
    return ERROR; 
}

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
