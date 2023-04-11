/*
 ============================================================================
 Name           : Semantics.h
 Author         : Kong Jimmy Vang
 Project Desc   : CS 442/542: Project
 Description    : The action and supporting routines for performing semantics processing.
 ============================================================================
*/

/* Semantic Records */
struct IdList {
    struct SymEntry * TheEntry;
    struct IdList * Next;
};

struct ExprRes {
    char * Label;
    int Reg;
    struct InstrSeq * Instrs;
};

struct ExprResList {
    struct ExprRes * Expr;
    struct ExprResList * Next;
};

struct BExprRes {
    char * Label;
    struct InstrSeq * Instrs;
};

struct Attr {
    char * dataType;
    char * intLit1;
};

/* Semantics Actions */
extern struct ExprRes *     doIntLit(char * digits);
//extern struct ExprRes *     doLocalStringLit(char * string);
extern struct ExprRes *     doRval(char * name, struct ExprRes * ExprArraySubscript);
extern struct ExprRes *     doRvalFunc(char * name, struct ExprResList * exprList);
extern struct InstrSeq *    doAssign(char * name, struct ExprRes * ExprSubscript, struct ExprRes * Res2);

extern struct Attr *        createTableAttr(char * dataType, char * intLit1);
extern struct IdList *      createIdList(char * name, struct ExprRes * ExprSubscript);
extern struct IdList *      createIdListFunc(char * name, struct ExprResList * ExprSubscript);
extern struct ExprResList * createExprResList(struct ExprRes * Res);
extern void                 destroyIdList(struct IdList * list);
extern void                 destroyExprResList(struct ExprResList * list);
extern struct IdList *      appendIdList(struct IdList * list1, struct IdList * list2);
extern struct ExprResList * appendExprResList(struct ExprResList * list1, struct ExprResList * list2);
extern char *               concatenateStr(char * s1, char * s2);
extern struct InstrSeq *    concatenateInstrSeq(struct InstrSeq * InstrSeq1, struct InstrSeq * InstrSeq2);
extern struct ExprRes *     concatenateExprRes(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     concatenateExprPrintList(struct ExprRes * Res1, struct ExprRes * Res2);

extern struct InstrSeq *    doPrint(struct ExprRes * Res);
extern struct InstrSeq *    doPrintNewline();
extern struct InstrSeq *    doPrintSpace();
extern struct InstrSeq *    doPrintLines(struct ExprRes * Res);
extern struct InstrSeq *    doPrintSpaces(struct ExprRes * Res);
extern struct InstrSeq *    doPrintExprResList(struct ExprResList * list);
//extern struct InstrSeq *    doPrintString(struct ExprRes * Res);
extern struct InstrSeq *    doRead(char * name, struct ExprRes * ExprSubscript);
extern struct InstrSeq *    doReadIdList(struct IdList * list);

extern struct ExprRes *     doSub(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doAdd(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doModulus(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doDiv(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doMult(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doExpo(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doUnaryMinus(struct ExprRes * Res1);

extern struct ExprRes *     doBExprOR(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doBExprAND(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doBExprNOT(struct ExprRes * Res1);

extern struct ExprRes *     doRExprNOTEQ(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doRExprGT(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doRExprGTEQ(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doRExprEQ(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doRExprLTEQ(struct ExprRes * Res1, struct ExprRes * Res2);
extern struct ExprRes *     doRExprLT(struct ExprRes * Res1, struct ExprRes * Res2);

extern struct InstrSeq *    makeFunctionLabel(char * name, struct InstrSeq * seq);
extern struct InstrSeq *    createReturnStmt(struct ExprRes * res);

extern struct InstrSeq *    doIntFunction(struct InstrSeq * stmtSeq);
extern struct InstrSeq *    doVoidFunction(struct InstrSeq * stmtSeq);

extern struct InstrSeq *    doIfElse(struct ExprRes * ifRes, struct InstrSeq * seq);
extern struct ExprRes *     doIf(struct ExprRes * bRes, struct InstrSeq * seq);
extern struct InstrSeq *    doElse(struct InstrSeq * seq);
extern struct InstrSeq *    doWhileLoop(struct ExprRes * bRes, struct InstrSeq * seq);
extern struct InstrSeq *    doForLoop(struct InstrSeq * initSeq, 
                                      struct ExprRes * bRes, 
                                      struct InstrSeq * updateSeq, 
                                      struct InstrSeq * stmtSeq);

extern void	Finish(struct InstrSeq *Code);
