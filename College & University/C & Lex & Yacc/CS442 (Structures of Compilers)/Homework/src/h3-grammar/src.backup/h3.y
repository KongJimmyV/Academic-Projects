/*
 ============================================================================
 Name        : h3.y
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 3
 ============================================================================
 */

%{

#include "SymTab.h"
#include "IOMngr.h"
#include "semantics.h"
#include <string.h>

extern int yylex(); /* The next token function. */
extern char *yytext; /* The matched token text. */
extern int yyleng;
extern int yyerror(char *);

extern SymTab * table;
extern SymEntry * entry;

%}

%union {
    SymTab * symTab;
    char * string;
}

%type <string> Id
%type <symTab> Expr
%type <symTab> Term
%type <symTab> Factor
%type <symTab> SetLit
%type <symTab> SetLitSeq

%token Ident

%%

Prog        : StmtSeq               {printSymTab();};
StmtSeq     : Stmt StmtSeq          { };
StmtSeq     :                       { };
Stmt        : Id '=' Expr ';'       {storeVar($1, $3);};
Expr        : Expr '+' Term         {$$ = doUNION($1, $3);};
Expr        : Term                  {$$ = $1;};
Term        : Term '*' Factor       {$$ = doINTERSECTION($1, $3);};
Term        : Factor                {$$ = $1;};
Factor      : '(' Expr ')'          {$$ = $2;};
Factor      : Id                    {
                                        $$ = getMainTableAttr($1); 
                                        free($1); //free unused string from memory.
                                    };
Factor      : SetLit                {$$ = $1;};
SetLit      : '{' '}'               {$$ = createSymTab(17);};
SetLit      : '{' SetLitSeq '}'     {$$ = $2;};
SetLitSeq   : Id                    {
                                        $$ = addNameToSymTab(createSymTab(17), $1);
                                        free($1); //free unused string from memory.
                                    };
SetLitSeq   : SetLitSeq ',' Id      {
                                        $$ = addNameToSymTab($1, $3);
                                        free($3); //free unused string from memory.
                                    };
Id          : Ident                 {$$ = strdup(yytext);};

%%

int yyerror(char * s) {
    writeMessage("");
    writeIndicator(getCurrentColumnNum());
    writeMessage("Illegal Character in YACC");
    
    printf("\nIllegal Character in YACC - Check \"listingFile\" for more info.\n");
    
    return 1;
}