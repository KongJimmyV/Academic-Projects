/*
 ============================================================================
 Name        : h3.l
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 3
 ============================================================================
 */

%{

#include "SymTab.h"
#include "IOMngr.h"
#include "semantics.h"
#include "y.tab.h"

#define YY_INPUT(buf,result,max_size) \
    { int c = getNextSourceChar(); \
    result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
    }

%}

letter  [A-Za-z]
digit   [0-9]

%%

{letter}({letter}|{digit})*                                             {return Ident;}
\{([ ]*|[ ]*{letter}+[ ]*|[ ]*{letter}+[ ]*(,[ ]*{letter}+[ ]*)*)\}     {return SetLit;}
\+                                          {return '+';}
\*                                          {return '*';}
\=                                          {return '=';}
\;                                          {return ';';}
\{                                          {return '{';}
\}                                          {return '}';}
\,                                          {return ',';}
\(                                          {return '(';}
\)                                          {return ')';}
[ \r\n\t]                                   {}
.                                           { 
                                                writeIndicator(getCurrentColumnNum()); 
                                                writeMessage("Illegal Character in Lex"); 
                                                printf("\nIllegal Character in Lex - Check \"listingFile\" for more info.\n");
                                            }

%%

int yywrap() {
    return 1;
}