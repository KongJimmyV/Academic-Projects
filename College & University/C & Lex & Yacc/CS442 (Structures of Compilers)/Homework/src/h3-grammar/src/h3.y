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

%token Ident
%token SetLit

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
                                        $$ = getVal($1);
                                        free($1); //freeing unusued string created by strdup(yytext)
                                    };
Factor      : SetLit                {
                                        char * setLiteral = strdup(yytext);
                                        $$ = makeSet(setLiteral);
                                        free(setLiteral); //freeing unusued string created by strdup(yytext)
                                    };
Id          : Ident                 {$$ = strdup(yytext);};

%%

int yyerror(char * s) {
    writeMessage("");
    writeIndicator(getCurrentColumnNum());
    writeMessage("Illegal Character in YACC");
    writeMessage(s);
    
    printf("\nIllegal Character in YACC - Check \"listingFile\" for more info.\n");
    
    return 1;
}