%{
	#include<stdio.h>
	#include<stdlib.h>
	int cnt=0;
	extern int yylex();
    int yyerror();
%}
%token FOR IDEN NUM
%%
S:I
;
I:FOR A B	{cnt++;}
;
A:'('E';'E';'E')'
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
;
Z:'='|'>'|'<'|'<''='|'>''='|'=''+'|'=''-'
;
U:'+''+'|'-''-' 
;
B:'{'B1'}'
|B1
;
B1:E';'B1
|I
|
;

%%
int main()
{
	printf("Enter the snippet:\n");
	yyparse();
	printf("Count of for : %d\n",cnt);
	return 0;
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}