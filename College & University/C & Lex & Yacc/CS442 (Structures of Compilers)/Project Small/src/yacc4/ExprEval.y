/*
 ============================================================================
 Name           : ExprEval.y
 Author         : Kong Jimmy Vang
 Project Desc   : CS 442/542: Project
 Description    : Bison/YACC parser for expression evaluation.
 ============================================================================
*/

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "IOMngr.h"
#include "SymTab.h"
#include "Semantics.h"
#include "CodeGen.h"

extern int yylex();    /* The next token function. */
extern char *yytext;   /* The matched token text.  */
extern int yyleng;     /* The token text length.   */
extern int yyparse();
extern int yyerror(char *);
void dumpTable();

extern SymTab * table;
extern SymTab * ProcSymTab;
extern struct IdList * ProcFormalParameters;
extern struct IdList * ProcLocalParameters;
extern struct SymEntry * GEntry;
extern int inProc;
extern int gCounter;

%}


%union {
    long val;
    char * string;
    struct ExprRes * ExprRes;
    struct InstrSeq * InstrSeq;
    struct BExprRes * BExprRes;
    struct ExprResList * ExprResList;
    struct IdList * IdList;
}

%type <string> Id
%type <ExprResList> ExprResList
%type <ExprResList> ExprResListSeq
%type <IdList> IdList
%type <IdList> IdListSeq
%type <IdList> IdListFunc
%type <IdList> IdListSeqFunc

%type <ExprRes> Expr
%type <ExprRes> SubExpr
%type <ExprRes> AddExpr
%type <ExprRes> ModulusTerm
%type <ExprRes> DivTerm
%type <ExprRes> MultTerm
%type <ExprRes> Expo
%type <ExprRes> UnaryMinus
%type <ExprRes> Factor

%type <string> ArrayIntLit
%type <ExprRes> ArraySubscript
%type <ExprResList> FuncSubscript

%type <InstrSeq> StmtSeq
%type <InstrSeq> Stmt
%type <InstrSeq> AssignExpr
%type <InstrSeq> BranchStmt
%type <ExprRes> BranchStmtIf
%type <InstrSeq> BranchStmtElse
%type <InstrSeq> LoopStmt
%type <InstrSeq> IOStmt
//%type <InstrSeq> ReturnStmt

%type <InstrSeq> GlobDeclarations
%type <InstrSeq> GlobDec
%type <InstrSeq> GlobDecInt
%type <InstrSeq> GlobDecIntArray
%type <InstrSeq> GlobDecIntFunc
%type <InstrSeq> GlobDecVoidFunc

%type <IdList> LocalDeclarations
%type <IdList> LocalDec
//%type <IdList> LocalDecInt
//%type <IdList> LocalDecIntArray

%type <ExprRes> BoolExpr
%type <ExprRes> BoolExprOr
%type <ExprRes> BoolExprAnd
%type <ExprRes> BoolExprNot
%type <ExprRes> RelExpr

%token Ident
%token IntArrayIdent
%token IntLit
%token Int
%token Void
%token StringLit
%token Write
%token Writelines
%token Writespaces
%token Read
%token Return
%token SingleLineComment
%token MultiLineComment

%token IF
%token ELSE
%token WHILE
%token FOR

%token bOR
%token bAND

%token NOTEQ
%token GTEQ
%token EQ
%token LTEQ

%%

Prog                :    GlobDeclarations StmtSeq                   { Finish( concatenateInstrSeq($1, $2) ); };
GlobDeclarations    :    GlobDec GlobDeclarations                   { $$ = concatenateInstrSeq($1, $2); };
GlobDeclarations    :                                               { $$ = NULL; };
LocalDeclarations   :    LocalDec LocalDeclarations                 { $$ = appendIdList($1, $2); };
LocalDeclarations   :                                               { $$ = NULL; };
LocalDec            :    Int Id { enterName(ProcSymTab, yytext); } ';'   { $$ = createIdList($2, NULL); };
GlobDec             :    Int Id { enterName(table, yytext); } GlobDecIntArray       { $$ = makeFunctionLabel($2, $4); free($2); };
GlobDec             :    Void Id { enterName(table, yytext); } GlobDecVoidFunc      { $$ = makeFunctionLabel($2, $4); free($2); };
GlobDecIntArray     :    '[' ArrayIntLit ']' 
                            { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup(".space"), $2)); 
                            } ';'
                                                                    { $$ = NULL; };
GlobDecIntArray     :    GlobDecIntFunc                             { $$ = $1; };
GlobDecIntFunc      :    '(' { inProc = 1; ProcSymTab = createSymTab(33); } IdListFunc ')' 
                            { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup("int"), NULL)); 
                                GEntry->name = strdup("int");
                            } 
                                '{' 
                                    LocalDeclarations { ProcFormalParameters = $3; ProcLocalParameters = $7; }  
                                    StmtSeq 
                                     
                                    { $<InstrSeq>$ = doIntFunction($9); }
                                    { inProc = 0; destroySymTab(ProcSymTab); } 
                                    { destroyIdList(ProcFormalParameters); ProcFormalParameters = NULL; } 
                                    { destroyIdList(ProcLocalParameters); ProcLocalParameters = NULL; } 
                                    { free(GEntry->name); GEntry->name = NULL; }
                                '}'   
                                                                    { $$ = $<InstrSeq>10; };
GlobDecIntFunc      :    GlobDecInt                                 { $$ = $1; };
GlobDecInt          :       { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup(".word"), strdup("0"))); 
                            } ';' 
                                                                    { $$ = NULL; };
GlobDecVoidFunc     :    '(' { inProc = 1; ProcSymTab = createSymTab(33); } IdListFunc ')' 
                            { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup("void"), NULL)); 
                                GEntry->name = strdup("void");
                            } 
                                '{' 
                                    LocalDeclarations { ProcFormalParameters = $3; ProcLocalParameters = $7; } 
                                    StmtSeq 
                                     
                                    { $<InstrSeq>$ = doVoidFunction($9); }
                                    { inProc = 0; destroySymTab(ProcSymTab); } 
                                    { destroyIdList(ProcFormalParameters); ProcFormalParameters = NULL; } 
                                    { destroyIdList(ProcLocalParameters); ProcLocalParameters = NULL; } 
                                    { free(GEntry->name); GEntry->name = NULL; }
                                '}'   
                                                                    { $$ = $<InstrSeq>10; };
StmtSeq             :    Stmt StmtSeq                               { $$ = AppendSeq($1, $2); };
StmtSeq             :    Return Expr ';'                            { $$ = createReturnStmt($2); };
StmtSeq             :    Return ';'                                 { $$ = createReturnStmt(NULL); };
StmtSeq             :                                               { $$ = NULL; };
Stmt                :    IOStmt                                     { $$ = $1; };
Stmt                :    AssignExpr                                 { $$ = $1; };
Stmt                :    BranchStmt                                 { $$ = $1; };
Stmt                :    LoopStmt                                   { $$ = $1; };
Stmt                :    Id FuncSubscript ';'                       {   
                                                                        struct ExprRes * res = doRvalFunc($1, $2); 
                                                                        struct InstrSeq * seq = res->Instrs; 
                                                                        $$ = seq;
                                                                        ReleaseTmpReg(res->Reg); free(res); free($1); 
                                                                    };
Stmt                :    SingleLineComment                          { $$ = NULL; };
Stmt                :    MultiLineComment                           { $$ = NULL; };
IOStmt              :    Write '(' ExprResList ')' ';'              { $$ = doPrintExprResList($3); };
//IOStmt              :    Write '(' String ')' ';'                   { $$ = doPrintString($3); };
IOStmt              :    Writelines Expr ';'                        { $$ = doPrintLines($2); };
IOStmt              :    Writespaces Expr ';'                       { $$ = doPrintSpaces($2); };
IOStmt              :    Read IdList ';'                            { $$ = doReadIdList($2); };
AssignExpr          :    Id ArraySubscript '=' Expr ';'             { $$ = doAssign($1, $2, $4); free($1); };
BranchStmt          :    BranchStmtIf BranchStmtElse                { $$ = doIfElse($1, $2); };
BranchStmtIf        :    IF '(' BoolExpr ')' '{' StmtSeq '}'        { $$ = doIf($3, $6); };
BranchStmtElse      :    ELSE '{' StmtSeq '}'                       { $$ = doElse($3); };
BranchStmtElse      :                                               { $$ = NULL; };
LoopStmt            :    WHILE '(' BoolExpr ')' '{' StmtSeq '}'     { $$ = doWhileLoop($3, $6); };
LoopStmt            :    FOR '(' Id ArraySubscript '=' Expr ';' 
                                 BoolExpr ';' 
                                 Id ArraySubscript '=' Expr ')' 
                                '{' StmtSeq '}' 
                                                                    {   $$ = doForLoop(doAssign($3, $4, $6), 
                                                                                     $8, 
                                                                                     doAssign($10, $11, $13), 
                                                                                     $16); 
                                                                        free($3); 
                                                                        free($10);
                                                                    };
IdList              :    IdListSeq                                  { $$ = $1; };
IdList              :    '(' IdListSeq ')'                          { $$ = $2; };
IdList              :                                               { $$ = NULL; };
IdListSeq           :    Id ArraySubscript                          { $$ = createIdList($1, $2); };
IdListSeq           :    IdListSeq ',' Id ArraySubscript            { $$ = appendIdList($1, createIdList($3, $4)); };
IdListFunc          :    IdListSeqFunc                              { $$ = $1; };
IdListFunc          :    '(' IdListSeqFunc ')'                      { $$ = $2; };
IdListFunc          :                                               { $$ = NULL; };
IdListSeqFunc       :    Int Id { enterName(ProcSymTab, yytext); } ArraySubscript 
                                                                    { $$ = createIdList($2, $4); };
IdListSeqFunc       :    IdListSeqFunc ',' Int Id { enterName(ProcSymTab, yytext); } ArraySubscript 
                                                                    { $$ = appendIdList($1, createIdList($4, $6)); };
ExprResList         :    ExprResListSeq                             { $$ = $1; };
ExprResList         :                                               { $$ = NULL; };
ExprResListSeq      :    Expr                                       { $$ = createExprResList($1); };
ExprResListSeq      :    ExprResListSeq ',' Expr                    { $$ = appendExprResList($1, createExprResList($3)); };
BoolExpr            :    BoolExprOr                                 { $$ = $1; };
BoolExprOr          :    BoolExprOr bOR BoolExprAnd                 { $$ = doBExprOR($1, $3); };
BoolExprOr          :    BoolExprAnd                                { $$ = $1; };
BoolExprAnd         :    BoolExprAnd bAND BoolExprNot               { $$ = doBExprAND($1, $3); };
BoolExprAnd         :    BoolExprNot                                { $$ = $1; };
BoolExprNot         :    '!' BoolExprNot                            { $$ = doBExprNOT($2); };
BoolExprNot         :    RelExpr                                    { $$ = $1; };
RelExpr             :    Expr NOTEQ Expr                            { $$ = doRExprNOTEQ($1, $3); };
RelExpr             :    Expr '>' Expr                              { $$ = doRExprGT($1, $3); };
RelExpr             :    Expr GTEQ Expr                             { $$ = doRExprGTEQ($1, $3); };
RelExpr             :    Expr EQ Expr                               { $$ = doRExprEQ($1, $3); };
RelExpr             :    Expr LTEQ Expr                             { $$ = doRExprLTEQ($1, $3); };
RelExpr             :    Expr '<' Expr                              { $$ = doRExprLT($1, $3); };
RelExpr             :    '(' BoolExpr ')'                           { $$ = $2; };
Expr                :    SubExpr                                    { $$ = $1; };
SubExpr             :    SubExpr '-' AddExpr                        { $$ = doSub($1, $3); };
SubExpr             :    AddExpr                                    { $$ = $1; };
AddExpr             :    AddExpr '+' ModulusTerm                    { $$ = doAdd($1, $3); };
AddExpr             :    ModulusTerm                                { $$ = $1; };
ModulusTerm         :    ModulusTerm '%' DivTerm                    { $$ = doModulus($1, $3); };
ModulusTerm         :    DivTerm                                    { $$ = $1; };
DivTerm             :    DivTerm '/' MultTerm                       { $$ = doDiv($1, $3); };
DivTerm             :    MultTerm                                   { $$ = $1; };
MultTerm            :    MultTerm '*' Expo                          { $$ = doMult($1, $3); };
MultTerm            :    Expo                                       { $$ = $1; };
Expo                :    UnaryMinus '^' Expo                        { $$ = doExpo($1, $3); };
Expo                :    UnaryMinus                                 { $$ = $1; };
UnaryMinus          :    '-' UnaryMinus                             { $$ = doUnaryMinus($2); };
UnaryMinus          :    Factor                                     { $$ = $1; };
Factor              :    '(' Expr ')'                               { $$ = $2; };
Factor              :    IntLit                                     { $$ = doIntLit(yytext); };
Factor              :    Id ArraySubscript                          { $$ = doRval($1, $2); free($1); };
Factor              :    Id FuncSubscript                           { $$ = doRvalFunc($1, $2); free($1); };
//String              :    StringLit                                  { $$ = doLocalStringLit(yytext); };
ArrayIntLit         :    IntLit                                     { $$ = strdup(yytext); };
ArraySubscript      :    '[' Expr ']'                               { $$ = $2; };
ArraySubscript      :                                               { $$ = NULL; };
FuncSubscript       :    '(' 
                            {   
                                //if (GEntry->attribute) free(GEntry->attribute);
                                GEntry->attribute = (void *) SaveSeq();
                            }
                            ExprResList ')'                         { $$ = $3; };
//FuncSubscript       :                                               { $$ = NULL; };
Id                  :    Ident                                      { $$ = strdup(yytext); };

%%

int yyerror(char * s) {
    writeIndicator(getCurrentColumnNum());
    writeMessage("Illegal Character in YACC");
    writeMessage(s);
    return 1;
}
