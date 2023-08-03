%{
    #include <stdio.h>
    #include <stdlib.h>
    extern FILE *yyin, *yyout;
    int single = 0, multi = 0;
%}

%%
"//".*\n	{single++; fprintf(yyout, "%s", yytext);}
"/*"[^*/]*"*/"	{multi++; fprintf(yyout, "%s", yytext);}
%%

int ywrap()
{
   return 1;
}

int main()
{
    yyin = fopen("3asample.txt", "r");
    yyout = fopen("bar.txt", "w");
    yylex();
    printf("Number of single line comments = %d\n", single);
    printf("Number of multi line comments = %d\n", multi);
    return 0;
}
    