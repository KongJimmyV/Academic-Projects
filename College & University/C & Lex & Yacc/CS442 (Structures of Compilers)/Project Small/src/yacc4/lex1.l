/*
 ============================================================================
 Name           : lex1.y
 Author         : Kong Jimmy Vang
 Project Desc   : CS 442/542: Project
 Description    : FLEX/LEX scanner for expression evaluation.
 ============================================================================
*/

%{
//#include "yaccExample.h"
#include "IOMngr.h"
#include "y.tab.h"

#define YY_INPUT(buf,result,max_size) \
    { int c = getNextSourceChar(); \
          result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
        }

%}


letter [A-Za-z]
digit [0-9]

%%
if                  {return IF;}
else                {return ELSE;}
while               {return WHILE;}
for                 {return FOR;}
int                 {return Int;}
void                {return Void;}
print               {return Write;}
printlines          {return Writelines;}
printspaces         {return Writespaces;}
read                {return Read;}
return              {return Return;}
{letter}({letter}|{digit})*    {return Ident;}
{digit}{digit}*     {return IntLit;}
(\/\/.*)[\r\n]      {return SingleLineComment;}
(\/\*)(.*[\r\n]*)*(\*\/)    {return MultiLineComment;}
\".*\"              {return StringLit;}
\|\|                {return bOR;}
\&\&                {return bAND;}
\!\=                {return NOTEQ;}
\>                  {return '>';}
\>\=                {return GTEQ;}
\=\=                {return EQ;}
\<\=                {return LTEQ;}
\<                  {return '<';}
\!                  {return '!';}
\=                  {return '=';}
\-                  {return '-';}
\+                  {return '+';}
\%                  {return '%';}
\/                  {return '/';}
\*                  {return '*';}
\^                  {return '^';}
\;                  {return ';';}
\,                  {return ',';}
\{                  {return '{';}
\}                  {return '}';}
\[                  {return '[';}
\]                  {return ']';}
\(                  {return '(';}
\)                  {return ')';}

[ ]                 {}
\t                  {}
\r                  {}
\n                  {}

.                   {writeIndicator(getCurrentColumnNum());
                        writeMessage("Illegal Character in lex");
                    }

%%

    
int yywrap () {
    return 1;
}
            
    
