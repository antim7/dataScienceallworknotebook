%{
	#include <stdio.h>
	#include <stdlib.h>
%}
digit		[0-9]
letter          [A-Za-z]
digits		[0-9]+ 
signed		[+|-]{digits}
eE 		[e]|[E]
scientific 	({signed}|{digits}){eE}{signed}*{digits}*
decimal 	{digits}({point}{digits})+
Uppercase 	[A-Z]
Lowercase	[a-z]
Underscore	[_]
ValidIdentifier	({Lowercase}|{Uppercase}|{Underscore})({Lowercase}|{Uppercase}|{Underscore})*

Arithmatic_operator	["+"]|["-"]|["*"]|["/"]|["="]

Punctuation		[","]|[":"]|[";"]

keywords	"int"|"float"|"if"|"break"|"case"|"char"|"const"|"continue"|"return"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"auto"

symbols		"&"|"$"|"@"|"!"|"^"|"%"

Space		[" "]

Logical_operator	["=="]|["!="]|[">="]|["<="]|["<"]|[">"]



Parenthesis	"("|")"|"{"|"}"|"["|"]"


%%
{Arithmatic_operator}	{printf("Arithmatic operator %s\n",yytext);}
{Punctuation}		{printf("Punctuation %s\n",yytext);}
{keywords}		{printf("Keywords %s\n",yytext);}
{symbols}		{printf("symbols %s\n",yytext);}
{Space}			{}
{Logical_operator}	{printf("Logical Operator %s\n",yytext);}
{Parenthesis}		{printf("Parenthesis %s\n",yytext);}
{signed} 		{printf("A signed number: %s\n",yytext);}
{digits}"."{digits}+	{printf("A decimal number: %s\n", yytext);}
{scientific} 		{printf("A scientific number: %s\n",yytext);}
{digits}		{printf( "An integer: %s\n", yytext );}
{ValidIdentifier}	{printf( "Identifier: %s\n", yytext );}
"//"({letter}|{digit}|{Space}|;|:|,)* {}

"/*"({letter}|{digit}|{Space}|;|:|,)*"*/" {}

.			{printf("Unknown character %s\n",yytext);}


                      
%%

int main(void)
{
  yylex();
  return 0;
}

int yywrap(void) { 
  return 0; 
} 


