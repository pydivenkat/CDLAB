%{
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    int yyerror(const char* s);
%}

%token NUM

%%
S : E	{ printf("Result = %d\n", $1); }
  ;
  
E : E '+' T	{ $$ = $1 + $3; }
  | E '-' T	{ $$ = $1 - $3; }
  | T		{ $$ = $1; }
  ;

T : T '*' F	{ $$ = $1 * $3; }
  | T '/' F	{ if ($3 == 0) { printf("Cannot divide by 0\n"); exit(EXIT_FAILURE); } $$ = $1 / $3; }
  | F		{ $$ = $1; }
  ;

F : '(' E ')'	{ $$ = $2; }
  | '-' F	{ $$ = -$2; }
  | NUM	{ $$ = $1; }
  ;
%%

int yyerror(const char* s)
{
    printf("Syntax Error: %s\n", s);
    return 0; // Indicate there was an error in parsing
}

int main()
{
    printf("Enter a valid arithmetic expression\n");
    yyparse();
    return 0;
}