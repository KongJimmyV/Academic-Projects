/*
 ============================================================================
 Name           : Semantics.c
 Author         : Kong Jimmy Vang
 Project Desc   : CS 442/542: Project
 Description    : Support and semantic action routines.
 ============================================================================
*/

#include <strings.h>
#include <stdlib.h>

#include "CodeGen.h"
#include "Semantics.h"
#include "SymTab.h"
#include "IOMngr.h"

extern SymTab * table;
extern SymTab * ProcSymTab;
extern struct IdList * ProcFormalParameters;
extern struct IdList * ProcLocalParameters;
extern struct SymEntry * GEntry;
extern int inProc;
extern int gCounter;

char Buf[16];

/* Semantics support routines */
struct ExprRes * doIntLit(char * digits) { 
    
    struct ExprRes * res;
    
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Reg = AvailTmpReg();
    res->Instrs = GenInstr(NULL,"li",TmpRegName(res->Reg),digits,NULL);

    return res;
}
/*
struct ExprRes * doLocalStringLit(char * string) { 
    
    struct ExprRes * res;
    
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Reg = AvailTmpReg();
    int tReg1 = AvailTmpReg();
    int tReg2 = AvailTmpReg();
    
    res->Instrs = GenInstr(NULL,"la",TmpRegName(res->Reg),"_stringbuf",NULL);
    
    long len = static_cast<long>(strlen(string));
    sprint(Buf, "'%Ld'", (-len - 1 - 8));
    
    res->Instrs = GenInstr(NULL,"addiu","$sp","$sp",Buf);
    long i = 0
    for (i = 0; i < len; i++) {
        char * p = string;
        
        sprint(Buf, "'%c'", p);
        res->Instrs = GenInstr(NULL,"li",TmpRegName(tReg1),Buf,NULL);
        sprint(Buf, "%Ld($sp)", i);
        res->Instrs = GenInstr(NULL,"sb",TmpRegName(tReg1),Buf,NULL);
        
        *p++;
    }
    
    // Add NULL terminating character
    res->Instrs = GenInstr(NULL,"li",TmpRegName(tReg1),"'\0'",NULL);
    i++;
    sprint(Buf, "%Ld($sp)", i);
    res->Instrs = GenInstr(NULL,"sb",TmpRegName(tReg1),Buf,NULL);
    
    int first = (int) len;
    int second = (int) (len >> 32);
    
    // Add signed long
    sprint(Buf, "'%d'", first);
    res->Instrs = GenInstr(NULL,"li",TmpRegName(tReg1),"'\0'",NULL);
    i++;
    sprint(Buf, "%Ld($sp)", i);
    res->Instrs = GenInstr(NULL,"sb",TmpRegName(tReg1),Buf,NULL);
    
    sprint(Buf, "'%d'", );
    res->Instrs = GenInstr(NULL,"li",TmpRegName(tReg1),"'\0'",NULL);
    i += 4;
    sprint(Buf, "%Ld($sp)", i);
    res->Instrs = GenInstr(NULL,"sb",TmpRegName(tReg1),Buf,NULL);
    
    return res;
}
*/
struct ExprRes * doRval(char * name, struct ExprRes * ExprArraySubscript)  { 
    
    struct ExprRes * res;
    
    if (inProc == 0) {
        if (!findName(table, name)) {
            writeIndicator(getCurrentColumnNum());
            writeMessage("Undeclared variable");
        }
        
        if (NULL == ExprArraySubscript) {
            res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
            res->Reg = AvailTmpReg();
            res->Instrs = GenInstr(NULL,"lw",TmpRegName(res->Reg),name,NULL);
            return res;
            
        } else {
            
            int tReg = AvailTmpReg();
            
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL, "la", TmpRegName(tReg), name, NULL));
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL, "sll", TmpRegName(ExprArraySubscript->Reg), 
                                                                        TmpRegName(ExprArraySubscript->Reg), "2"));
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL, "add", TmpRegName(tReg), 
                                                                        TmpRegName(tReg), 
                                                                        TmpRegName(ExprArraySubscript->Reg)));
            sprintf(Buf, "0(%s)", TmpRegName(tReg));
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL,"lw",TmpRegName(tReg),Buf,NULL));
            
            ReleaseTmpReg(ExprArraySubscript->Reg);
            
            ExprArraySubscript->Reg = tReg;
            
            return ExprArraySubscript;
            
        }
        
    } else {
        
        int offset = 4;
        
        if(!strcmp(((struct Attr *) getCurrentAttr(table))->dataType, "int")) {
            offset = 8;
        }
        
        int counter = offset;
        int foundName = 0;
        
        if (!findName(ProcSymTab, name)) {
            //writeIndicator(getCurrentColumnNum());
            //writeMessage("Undeclared variable");
            
            if (!findName(table, name)) {
                writeIndicator(getCurrentColumnNum());
                writeMessage("Undeclared variable");
            }
        } else {
            
            struct IdList * curr = ProcLocalParameters;
            struct IdList * next = NULL;
            
            while (curr && !foundName) {
                next = curr->Next;
                
                foundName = !strcmp(curr->TheEntry->name, name);
                
                curr = next;
                counter = counter + 4;
            }
            
            curr = ProcFormalParameters;
            next = NULL;
            
            while (curr && !foundName) {
                next = curr->Next;
                
                foundName = !strcmp(curr->TheEntry->name, name);
                
                curr = next;
                counter = counter + 4;
            }
        }
        
        if (NULL == ExprArraySubscript) {
            res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
            res->Reg = AvailTmpReg();
            
            if (foundName) {
                sprintf(Buf, "%d($sp)", counter);
                res->Instrs = GenInstr(NULL,"lw",TmpRegName(res->Reg),Buf,NULL);
            } else {
                res->Instrs = GenInstr(NULL,"lw",TmpRegName(res->Reg),name,NULL);
            }
            
            return res;
            
        } else {
            int tReg = AvailTmpReg();
            
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL, "la", TmpRegName(tReg), name, NULL));
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL, "sll", TmpRegName(ExprArraySubscript->Reg), 
                                                                        TmpRegName(ExprArraySubscript->Reg), "2"));
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL, "add", TmpRegName(tReg), 
                                                                        TmpRegName(tReg), 
                                                                        TmpRegName(ExprArraySubscript->Reg)));
            sprintf(Buf, "0(%s)", TmpRegName(tReg));
            AppendSeq(ExprArraySubscript->Instrs, GenInstr(NULL,"lw",TmpRegName(tReg),Buf,NULL));
            
            ReleaseTmpReg(ExprArraySubscript->Reg);
            
            ExprArraySubscript->Reg = tReg;
            
            return ExprArraySubscript;
            
        }
    }
}

struct ExprRes * doRvalFunc(char * name, struct ExprResList * exprList)  { 

    struct ExprRes * res;
    
    if (inProc == 0) {
        if (!findName(table, name)) {
            writeIndicator(getCurrentColumnNum());
            writeMessage("Undeclared variable");
        }
        
        if (NULL == exprList) {
            
            res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
            //res->Instrs = (struct InstrSeq *) malloc(sizeof(struct InstrSeq));
            res->Instrs = GenInstr(NULL, NULL, NULL, NULL, NULL);
            
            res->Instrs = AppendSeq(res->Instrs, SaveSeq());
            AppendSeq(res->Instrs, GenInstr(NULL, "jal", name, NULL, NULL));
            AppendSeq(res->Instrs, RestoreSeq());
            
            res->Reg = AvailTmpReg();
            AppendSeq(res->Instrs, GenInstr(NULL, "lw", TmpRegName(res->Reg), "0($sp)", NULL));
            
            return res;
            
        } else {
            
            res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
            //res->Instrs = (struct InstrSeq *) malloc(sizeof(struct InstrSeq));
            res->Instrs = GenInstr(NULL, NULL, NULL, NULL, NULL);
            
            AppendSeq(res->Instrs, (struct InstrSeq *) GEntry->attribute);
            
            int offset = 4;
            if(!strcmp(((struct Attr *) getCurrentAttr(table))->dataType, "int")) {
                offset = 8;
            }
            
            int counter = offset;
            
            struct ExprResList * current = exprList;
            struct ExprResList * next = NULL;
            while (NULL != current) {
                next = current->Next;
                
                AppendSeq(res->Instrs, current->Expr->Instrs);
                
                current = next;
                counter += 4;
            }
            
            sprintf(Buf, "%d", counter - offset);
            AppendSeq(res->Instrs, GenInstr(NULL, "subu", "$sp", "$sp", Buf));
            
            counter = offset;
            current = exprList;
            next = NULL;
            
            while (NULL != current) {
                next = current->Next;
                
                sprintf(Buf, "%d($sp)", counter - offset);
                AppendSeq(res->Instrs, GenInstr(NULL, "sw", TmpRegName(current->Expr->Reg), Buf, NULL));
                
                ReleaseTmpReg(current->Expr->Reg);
                
                current = next;
                counter += 4;
            }
            
            AppendSeq(res->Instrs, GenInstr(NULL, "jal", name, NULL, NULL));
            
            sprintf(Buf, "%d", counter - offset);
            AppendSeq(res->Instrs, GenInstr(NULL, "addi", "$sp", "$sp", Buf));
            
            destroyExprResList(exprList);
            
            current = NULL;
            next = NULL;
            
            AppendSeq(res->Instrs, RestoreSeq());
            
            res->Reg = AvailTmpReg();
            sprintf(Buf, "%d($sp)", gCounter);
            AppendSeq(res->Instrs, GenInstr(NULL, "lw", TmpRegName(res->Reg), Buf, NULL));
            
            gCounter = 0;
            
            return res;
            
        }
    } else {
        if (!findName(table, name)) {
            writeIndicator(getCurrentColumnNum());
            writeMessage("Undeclared variable");
        }
        
        if (NULL == exprList) {
            
            res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
            //res->Instrs = (struct InstrSeq *) malloc(sizeof(struct InstrSeq));
            res->Instrs = GenInstr(NULL, NULL, NULL, NULL, NULL);
            
            res->Instrs = AppendSeq(res->Instrs, SaveSeq());
            AppendSeq(res->Instrs, GenInstr(NULL, "jal", name, NULL, NULL));
            AppendSeq(res->Instrs, RestoreSeq());
            
            res->Reg = AvailTmpReg();
            AppendSeq(res->Instrs, GenInstr(NULL, "lw", TmpRegName(res->Reg), "-4($sp)", NULL));
            
            return res;
            
        } else {
            
            res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
            //res->Instrs = (struct InstrSeq *) malloc(sizeof(struct InstrSeq));
            res->Instrs = GenInstr(NULL, NULL, NULL, NULL, NULL);
            
            AppendSeq(res->Instrs, (struct InstrSeq *) GEntry->attribute);
            
            int offset = 4;
            if(!strcmp(((struct Attr *) getCurrentAttr(table))->dataType, "int")) {
                offset = 8;
            }
            
            int counter = offset;
            
            struct ExprResList * current = exprList;
            struct ExprResList * next = NULL;
            while (NULL != current) {
                next = current->Next;
                
                AppendSeq(res->Instrs, current->Expr->Instrs);
                
                current = next;
                counter += 4;
            }
            
            sprintf(Buf, "%d", counter - offset);
            AppendSeq(res->Instrs, GenInstr(NULL, "subu", "$sp", "$sp", Buf));
            
            counter = offset;
            current = exprList;
            next = NULL;
            
            while (NULL != current) {
                next = current->Next;
                
                sprintf(Buf, "%d($sp)", counter - offset);
                AppendSeq(res->Instrs, GenInstr(NULL, "sw", TmpRegName(current->Expr->Reg), Buf, NULL));
                
                ReleaseTmpReg(current->Expr->Reg);
                
                current = next;
                counter += 4;
            }
            
            AppendSeq(res->Instrs, GenInstr(NULL, "jal", name, NULL, NULL));
            
            sprintf(Buf, "%d", counter - offset);
            AppendSeq(res->Instrs, GenInstr(NULL, "addi", "$sp", "$sp", Buf));
            
            destroyExprResList(exprList);
            
            current = NULL;
            next = NULL;
            
            AppendSeq(res->Instrs, RestoreSeq());
            
            res->Reg = AvailTmpReg();
            sprintf(Buf, "%d($sp)", -4 - gCounter);
            AppendSeq(res->Instrs, GenInstr(NULL, "lw", TmpRegName(res->Reg), Buf, NULL));
            
            gCounter = 0;
            
            return res;
            
        }
    }
}

struct InstrSeq * doAssign(char * name, struct ExprRes * ExprSubscript, struct ExprRes * Res) { 

    struct InstrSeq * code;
    
    if (inProc == 0) {
        
        if (!findName(table, name)) {
            writeIndicator(getCurrentColumnNum());
            writeMessage("Undeclared variable");
        }
        
        if (NULL == ExprSubscript) {
            code = Res->Instrs;
            
            AppendSeq(code,GenInstr(NULL, "sw", TmpRegName(Res->Reg), name, NULL));
            
            ReleaseTmpReg(Res->Reg);
            free(Res);
        } else {
            code = ExprSubscript->Instrs;
            //code = Res->Instrs;
            
            int tReg = AvailTmpReg();
            
            AppendSeq(code,Res->Instrs);
            AppendSeq(code,GenInstr(NULL, "la", TmpRegName(tReg), name, NULL));
            AppendSeq(code,GenInstr(NULL, "sll", TmpRegName(ExprSubscript->Reg), TmpRegName(ExprSubscript->Reg), "2"));
            AppendSeq(code,GenInstr(NULL, "add", TmpRegName(tReg), TmpRegName(tReg), TmpRegName(ExprSubscript->Reg)));
            sprintf(Buf, "0(%s)", TmpRegName(tReg));
            AppendSeq(code,GenInstr(NULL, "sw", TmpRegName(Res->Reg), Buf, NULL));
            
            ReleaseTmpReg(Res->Reg);
            free(Res);
            
            ReleaseTmpReg(ExprSubscript->Reg);
            free(ExprSubscript);
            
            ReleaseTmpReg(tReg);
            
        }
    } else {
        
        int offset = 4;
        if(!strcmp(((struct Attr *) getCurrentAttr(table))->dataType, "int")) {
            offset = 8;
        }
        
        int counter = offset;
        int foundName = 0;
        
        if (!findName(ProcSymTab, name)) {
            //writeIndicator(getCurrentColumnNum());
            //writeMessage("Undeclared variable");
            
            if (!findName(table, name)) {
                writeIndicator(getCurrentColumnNum());
                writeMessage("Undeclared variable");
            }
        } else {
            
            struct IdList * curr = ProcLocalParameters;
            struct IdList * next = NULL;
            
            while (curr && !foundName) {
                next = curr->Next;
                
                foundName = !strcmp(curr->TheEntry->name, name);
                
                curr = next;
                counter = counter + 4;
            }
            
            curr = ProcFormalParameters;
            next = NULL;
            
            while (curr && !foundName) {
                next = curr->Next;
                
                foundName = !strcmp(curr->TheEntry->name, name);
                
                curr = next;
                counter = counter + 4;
            }
        }
        
        if (NULL == ExprSubscript) {
            code = Res->Instrs;
            
            if (foundName) {
                sprintf(Buf, "%d($sp)", counter);
                AppendSeq(code,GenInstr(NULL, "sw", TmpRegName(Res->Reg), Buf, NULL));
            } else {
                AppendSeq(code,GenInstr(NULL, "sw", TmpRegName(Res->Reg), name, NULL));
            }
            
            ReleaseTmpReg(Res->Reg);
            free(Res);
            
        } else {
            code = ExprSubscript->Instrs;
            //code = Res->Instrs;
            
            int tReg = AvailTmpReg();
            
            AppendSeq(code,Res->Instrs);
            AppendSeq(code,GenInstr(NULL, "la", TmpRegName(tReg), name, NULL));
            AppendSeq(code,GenInstr(NULL, "sll", TmpRegName(ExprSubscript->Reg), TmpRegName(ExprSubscript->Reg), "2"));
            AppendSeq(code,GenInstr(NULL, "add", TmpRegName(tReg), TmpRegName(tReg), TmpRegName(ExprSubscript->Reg)));
            sprintf(Buf, "0(%s)", TmpRegName(tReg));
            AppendSeq(code,GenInstr(NULL, "sw", TmpRegName(Res->Reg), Buf, NULL));
            
            ReleaseTmpReg(Res->Reg);
            free(Res);
        
            ReleaseTmpReg(ExprSubscript->Reg);
            free(ExprSubscript);
            
            ReleaseTmpReg(tReg);
            
        }
    }
    
    return code;
}

struct Attr * createTableAttr(char * dataType, char * intLit1) {
    struct Attr * attr = (struct Attr *) malloc(sizeof(struct Attr));
    attr->dataType = dataType;
    attr->intLit1 = intLit1;
    //setCurrentAttr( table, (void *) attr ); 
    return attr;
}

struct IdList * createIdList(char * name, struct ExprRes * ExprSubscript) {
    struct SymEntry * entry = (struct SymEntry *) malloc(sizeof(struct SymEntry));
    entry->name = name;
    entry->attribute = (void *) ExprSubscript;
    entry->next = NULL;
    
    struct IdList * list = (struct IdList *) malloc(sizeof(struct IdList));
    list->TheEntry = entry;
    list->Next = NULL;
    
    return list;
}

struct IdList * createIdListFunc(char * name, struct ExprResList * ExprSubscript) {
    struct SymEntry * entry = (struct SymEntry *) malloc(sizeof(struct SymEntry));
    entry->name = name;
    entry->attribute = (void *) ExprSubscript;
    entry->next = NULL;
    
    struct IdList * list = (struct IdList *) malloc(sizeof(struct IdList));
    list->TheEntry = entry;
    list->Next = NULL;
    
    return list;
}

struct ExprResList * createExprResList(struct ExprRes * Res) {
    struct ExprResList * list = (struct ExprResList *) malloc(sizeof(struct ExprResList));
    list->Expr = Res;
    list->Next = NULL;
    return list;
}

void destroyIdList(struct IdList * list) {
    struct IdList * current = list;
    struct IdList * next = NULL;
    while (current) {
        next = current->Next;
        
        if (current->TheEntry) {
            if (current->TheEntry->name) free(current->TheEntry->name);
            struct ExprRes * attr = current->TheEntry->attribute;
            if (attr) {
                if (attr->Label) {
                    free(attr->Label);
                    attr->Label = NULL;
                }
                free(current->TheEntry->attribute);
                attr = NULL;
            }
            current->TheEntry->name = NULL;
            current->TheEntry->attribute = NULL;
            
            free(current->TheEntry);
        }
        
        current->TheEntry = NULL;
        current->Next = NULL;
        
        current = next;
    }
    
    free(list);
    current = NULL;
    next = NULL;
}

void destroyIdListFunc(struct IdList * list) {
    struct IdList * current = list;
    struct IdList * next = NULL;
    while (current) {
        next = current->Next;
        
        if (current->TheEntry) {
            if (current->TheEntry->name) free(current->TheEntry->name);
            if (current->TheEntry->attribute) destroyExprResList(current->TheEntry->attribute);
            current->TheEntry->name = NULL;
            current->TheEntry->attribute = NULL;
            
            free(current->TheEntry);
        }
        
        current->TheEntry = NULL;
        current->Next = NULL;
        
        current = next;
    }
    
    free(list);
    current = NULL;
    next = NULL;
}

void destroyExprResList(struct ExprResList * list) {
    struct ExprResList * current = list;
    struct ExprResList * next = NULL;
    while (current) {
        next = current->Next;
        
        if (current->Expr) free(current->Expr);
        
        current->Expr = NULL;
        current->Next = NULL;
        
        current = next;
    }
    
    free(list);
    current = NULL;
    next = NULL;
}

struct IdList * appendIdList(struct IdList * list1, struct IdList * list2) {
    struct IdList * tList;
    
    if (!list1) return list2;
    
    tList = list1;
    while (tList->Next) tList = tList->Next;
    tList->Next = list2;
    
    return list1;
}

struct ExprResList * appendExprResList(struct ExprResList * list1, struct ExprResList * list2) {
    struct ExprResList * tList;
    
    if (!list1) return list2;
    
    tList = list1;
    while (tList->Next) tList = tList->Next;
    tList->Next = list2;
    
    return list1;
}

char * concatenateStr(char * s1, char * s2) {
    size_t len = strlen(s1) + strlen(s2) + 1;
    char * str = (char *) malloc((len+1) * sizeof(char));
    str = strcat(s1, ",");
    str = strcat(str, s2);
    return str;
}

struct InstrSeq * concatenateInstrSeq(struct InstrSeq * InstrSeq1, struct InstrSeq * InstrSeq2) {
    struct InstrSeq * seq2;
    seq2 = AppendSeq(InstrSeq1, InstrSeq2);
    return seq2;
}

struct ExprRes * concatenateExprRes(struct ExprRes * Res1, struct ExprRes * Res2) {
    
    AppendSeq(Res1->Instrs, Res2->Instrs);
    
    ReleaseTmpReg(Res2->Reg);
    free(Res2);
    
    return Res1;
}

struct ExprRes * concatenateExprPrintList(struct ExprRes * Res1, struct ExprRes * Res2) {
    
    struct ExprRes * res;
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    
    Res2->Instrs->Oprnd1 = Res1->Instrs->Oprnd1;
    
    struct InstrSeq * code = doPrint(Res1);
    res->Instrs = code;
    
    AppendSeq(res->Instrs, doPrintSpace());
    AppendSeq(res->Instrs, Res2->Instrs);
    
    res->Reg = AvailTmpReg();
    
    ReleaseTmpReg(Res2->Reg);
    free(Res2);
    
    return res;
}

struct InstrSeq * doPrint(struct ExprRes * Res) { 
    
    struct InstrSeq * code;
    
    code = Res->Instrs;
    
    AppendSeq(code,GenInstr(NULL,"li","$v0","1",NULL));
    AppendSeq(code,GenInstr(NULL,"move","$a0",TmpRegName(Res->Reg),NULL));
    AppendSeq(code,GenInstr(NULL,"syscall",NULL,NULL,NULL));
    
    ReleaseTmpReg(Res->Reg);
    free(Res);
    
    return code;
}

struct InstrSeq * doPrintNewline() { 
    
    struct InstrSeq * code;
    
    code = GenInstr(NULL,"li","$v0","4",NULL);
    AppendSeq(code,GenInstr(NULL,"la","$a0","_nl",NULL));
    AppendSeq(code,GenInstr(NULL,"syscall",NULL,NULL,NULL));
    
    return code;
}

struct InstrSeq * doPrintSpace() { 
    
    struct InstrSeq * code;
    
    code = GenInstr(NULL,"li","$v0","11",NULL);
    AppendSeq(code,GenInstr(NULL,"li","$a0","32",NULL));
    AppendSeq(code,GenInstr(NULL,"syscall",NULL,NULL,NULL));
    
    return code;
}

struct InstrSeq * doPrintLines(struct ExprRes * Res) {
    
    struct InstrSeq * code;
    
    char * labelStart = GenLabel();
    char * labelEnd = GenLabel();
    
    int regCounter = AvailTmpReg();
    
    code = Res->Instrs;
    
    AppendSeq(code, GenInstr(NULL,"add",
                                  TmpRegName(regCounter),
                                  "$zero",
                                  "$zero"));
    
    AppendSeq(code, GenInstr(labelStart, NULL, NULL, NULL, NULL));
    AppendSeq(code, GenInstr(NULL, "ble", TmpRegName(Res->Reg), "$zero", labelEnd));
    AppendSeq(code, doPrintNewline());
    AppendSeq(code, GenInstr(NULL,"addi",
                                  TmpRegName(regCounter),
                                  TmpRegName(regCounter),
                                  "1"));
    AppendSeq(code, GenInstr(NULL, "blt", TmpRegName(regCounter), TmpRegName(Res->Reg), labelStart));
    AppendSeq(code, GenInstr(labelEnd, NULL, NULL, NULL, NULL));
    
    ReleaseTmpReg(regCounter);
    ReleaseTmpReg(Res->Reg);
    free(Res);
    free(labelStart);
    free(labelEnd);
    
    return code;
}

struct InstrSeq * doPrintSpaces(struct ExprRes * Res) {
    
    struct InstrSeq * code;
    
    char * labelStart = GenLabel();
    char * labelEnd = GenLabel();
    
    int regCounter = AvailTmpReg();
    
    code = Res->Instrs;
    
    AppendSeq(code, GenInstr(NULL,"add",
                                  TmpRegName(regCounter),
                                  "$zero",
                                  "$zero"));
    
    AppendSeq(code, GenInstr(labelStart, NULL, NULL, NULL, NULL));
    AppendSeq(code, GenInstr(NULL, "ble", TmpRegName(Res->Reg), "$zero", labelEnd));
    AppendSeq(code, doPrintSpace());
    AppendSeq(code, GenInstr(NULL,"addi",
                                  TmpRegName(regCounter),
                                  TmpRegName(regCounter),
                                  "1"));
    AppendSeq(code, GenInstr(NULL, "blt", TmpRegName(regCounter), TmpRegName(Res->Reg), labelStart));
    AppendSeq(code, GenInstr(labelEnd, NULL, NULL, NULL, NULL));
    
    ReleaseTmpReg(regCounter);
    ReleaseTmpReg(Res->Reg);
    free(Res);
    free(labelStart);
    free(labelEnd);
    
    return code;
}

struct InstrSeq * doPrintExprResList(struct ExprResList * list) {
    
    struct InstrSeq * code = GenInstr(NULL, NULL, NULL, NULL, NULL);
    
    struct ExprResList * curr = list;
    struct ExprResList * next = NULL;
    
    while (curr) {
        next = curr->Next;
        
        AppendSeq(code, doPrint(curr->Expr));
        curr->Expr = NULL;
        
        curr = next;
    }
    
    destroyExprResList(list);
    
    return code;
}
/*
struct InstrSeq * doPrintString(struct ExprRes * Res) {
    
    struct InstrSeq * code;
    
    char * labelStart = GenLabel();
    char * labelEnd = GenLabel();
    
    int regCounter = AvailTmpReg();
    
    code = Res->Instrs;
    
    code = GenInstr(NULL,"la","$a0","%s0",NULL);
    code = GenInstr(NULL,"li","$v0","11",NULL);
    code = GenInstr(NULL,"li","$v0","11",NULL);
    AppendSeq(code,GenInstr(NULL,"li","$a0","32",NULL));
    AppendSeq(code,GenInstr(NULL,"syscall",NULL,NULL,NULL));
    
    AppendSeq(code, GenInstr(NULL,"add",
                                  TmpRegName(regCounter),
                                  "$zero",
                                  "$zero"));
    
    AppendSeq(code, GenInstr(labelStart, NULL, NULL, NULL, NULL));
    AppendSeq(code, GenInstr(NULL, "ble", TmpRegName(Res->Reg), "$zero", labelEnd));
    AppendSeq(code, doPrintSpace());
    AppendSeq(code, GenInstr(NULL,"addi",
                                  TmpRegName(regCounter),
                                  TmpRegName(regCounter),
                                  "1"));
    AppendSeq(code, GenInstr(NULL, "blt", TmpRegName(regCounter), TmpRegName(Res->Reg), labelStart));
    AppendSeq(code, GenInstr(labelEnd, NULL, NULL, NULL, NULL));
    
    AppendSeq(code, GenInstr(NULL,"addiu","$sp","$sp","8"));
    
    ReleaseTmpReg(regCounter);
    ReleaseTmpReg(Res->Reg);
    free(Res);
    free(labelStart);
    free(labelEnd);
    
    return code;
}*/

struct InstrSeq * doRead(char * name, struct ExprRes * ExprSubscript) {
    
    struct ExprRes * res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Reg = AvailTmpReg();
    res->Instrs = GenInstr(NULL,NULL,NULL,NULL,NULL);
    
    AppendSeq(res->Instrs, GenInstr(NULL,"li","$v0","5",NULL));
    AppendSeq(res->Instrs, GenInstr(NULL,"syscall",NULL,NULL,NULL));
    AppendSeq(res->Instrs, GenInstr(NULL,"move",TmpRegName(res->Reg),"$v0",NULL));
    //AppendSeq(res->Instrs, GenInstr(NULL, "sw", TmpRegName(res->Reg), token, NULL));
    
    struct InstrSeq * seq = doAssign(name, ExprSubscript, res);
    
    return seq;
}

struct InstrSeq * doReadIdList(struct IdList * list) {
    
    struct InstrSeq * code = GenInstr(NULL, NULL, NULL, NULL, NULL);
    
    struct IdList * curr = list;
    struct IdList * next = NULL;
    
    while (curr) {
        next = curr->Next;
        
        struct ExprRes * attr = curr->TheEntry->attribute;
        AppendSeq(code, doRead(curr->TheEntry->name, attr));
        
        curr->TheEntry->attribute = NULL;
        attr = NULL;
        
        curr = next;
    }
    
    destroyIdList(list);
    
    return code;
}

struct ExprRes * doSub(struct ExprRes * Res1, struct ExprRes * Res2)  { 

    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs,Res2->Instrs);
    AppendSeq(Res1->Instrs,GenInstr(NULL,"sub",
                                         TmpRegName(reg),
                                         TmpRegName(Res1->Reg),
                                         TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);
    return Res1;
}

struct ExprRes * doAdd(struct ExprRes * Res1, struct ExprRes * Res2)  { 

    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs,Res2->Instrs);
    AppendSeq(Res1->Instrs,GenInstr(NULL,"add",
                                         TmpRegName(reg),
                                         TmpRegName(Res1->Reg),
                                         TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);
    return Res1;
}

struct ExprRes * doDiv(struct ExprRes * Res1, struct ExprRes * Res2)  { 

    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs,Res2->Instrs);
    AppendSeq(Res1->Instrs,GenInstr(NULL,"div",
                                         TmpRegName(Res1->Reg),
                                         TmpRegName(Res2->Reg),
                                         NULL));
    AppendSeq(Res1->Instrs,GenInstr(NULL,"mflo",
                                         TmpRegName(reg),
                                         NULL,
                                         NULL));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);
    return Res1;
}

struct ExprRes * doMult(struct ExprRes * Res1, struct ExprRes * Res2)  { 

    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs,Res2->Instrs);
    AppendSeq(Res1->Instrs,GenInstr(NULL,"mul",
                                         TmpRegName(reg),
                                         TmpRegName(Res1->Reg),
                                         TmpRegName(Res2->Reg)));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);
    return Res1;
}

struct ExprRes * doModulus(struct ExprRes * Res1, struct ExprRes * Res2) { 

    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs,Res2->Instrs);
    AppendSeq(Res1->Instrs,GenInstr(NULL,"div",
                                         TmpRegName(Res1->Reg),
                                         TmpRegName(Res2->Reg),
                                         NULL));
    AppendSeq(Res1->Instrs,GenInstr(NULL,"mfhi",
                                         TmpRegName(reg),
                                         NULL,
                                         NULL));
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);
    return Res1;
}

struct ExprRes * doExpo(struct ExprRes * Res1, struct ExprRes * Res2)  { 
    
    char * labelStart = GenLabel();
    char * labelEnd = GenLabel();
    int regCounter;
    int regResult;
    
    regCounter = AvailTmpReg();
    regResult = AvailTmpReg();
    
    AppendSeq(Res1->Instrs,Res2->Instrs);
    AppendSeq(Res1->Instrs,GenInstr(NULL,"add",
                                         TmpRegName(regCounter),
                                         "$zero",
                                         "$zero"));
    AppendSeq(Res1->Instrs,GenInstr(NULL,"add",
                                         TmpRegName(regResult),
                                         "$zero",
                                         "1"));
    
    AppendSeq(Res1->Instrs,GenInstr(labelStart,NULL,NULL,NULL,NULL));
    AppendSeq(Res1->Instrs, GenInstr(NULL, "blt", TmpRegName(Res2->Reg), "$zero", labelEnd));
    AppendSeq(Res1->Instrs,GenInstr(NULL,"mul",
                                         TmpRegName(regResult),
                                         TmpRegName(regResult),
                                         TmpRegName(Res1->Reg)));
    AppendSeq(Res1->Instrs,GenInstr(NULL,"addi",
                                         TmpRegName(regCounter),
                                         TmpRegName(regCounter),
                                         "1"));
    
    AppendSeq(Res1->Instrs, GenInstr(NULL, "bne", TmpRegName(regCounter), TmpRegName(Res2->Reg), labelStart));
    AppendSeq(Res1->Instrs,GenInstr(labelEnd,NULL,NULL,NULL,NULL));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    ReleaseTmpReg(regCounter);
    Res1->Reg = regResult;
    free(Res2);
    free(labelStart);
    free(labelEnd);
    
    return Res1;
}

struct ExprRes * doUnaryMinus(struct ExprRes * Res1) { 

    int reg;
    
    reg = AvailTmpReg();
    AppendSeq(Res1->Instrs,GenInstr(NULL,"subu",
                                         TmpRegName(reg),
                                         "$zero",
                                         TmpRegName(Res1->Reg)));
    ReleaseTmpReg(Res1->Reg);
    Res1->Reg = reg;
    return Res1;
}

extern struct ExprRes * doBExprOR(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();

    AppendSeq(Res1->Instrs, Res2->Instrs);
    
    AppendSeq(Res1->Instrs, GenInstr(NULL, "or", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);
    return Res1;
}

extern struct ExprRes * doBExprAND(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();

    AppendSeq(Res1->Instrs, Res2->Instrs);
    
    AppendSeq(Res1->Instrs, GenInstr(NULL, "and", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    Res1->Reg = reg;
    free(Res2);
    return Res1;
}

extern struct ExprRes * doBExprNOT(struct ExprRes * Res1) {
    int reg;
    reg = AvailTmpReg();
    
    AppendSeq(Res1->Instrs, GenInstr(NULL, "nor", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res1->Reg)));
    AppendSeq(Res1->Instrs, GenInstr(NULL, "and", TmpRegName(reg), TmpRegName(reg), "1"));
    ReleaseTmpReg(Res1->Reg);
    Res1->Reg = reg;
    
    return Res1;
}

extern struct ExprRes * doRExprNOTEQ(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();
    
    struct ExprRes * res;
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Label = GenLabel();
    res->Reg = reg;
    res->Instrs = GenInstr(res->Label, NULL, NULL, NULL, NULL);
    
    AppendSeq(res->Instrs, Res1->Instrs);
    AppendSeq(res->Instrs, Res2->Instrs);
    AppendSeq(res->Instrs, GenInstr(NULL, "sne", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    free(Res1);
    free(Res2);
    
    return res;
}

extern struct ExprRes * doRExprGT(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();
    
    struct ExprRes * res;
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Label = GenLabel();
    res->Reg = reg;
    res->Instrs = GenInstr(res->Label, NULL, NULL, NULL, NULL);
    
    AppendSeq(res->Instrs, Res1->Instrs);
    AppendSeq(res->Instrs, Res2->Instrs);
    AppendSeq(res->Instrs, GenInstr(NULL, "sgt", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    free(Res1);
    free(Res2);
    
    return res;
}

extern struct ExprRes * doRExprGTEQ(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();
    
    struct ExprRes * res;
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Label = GenLabel();
    res->Reg = reg;
    res->Instrs = GenInstr(res->Label, NULL, NULL, NULL, NULL);
    
    AppendSeq(res->Instrs, Res1->Instrs);
    AppendSeq(res->Instrs, Res2->Instrs);
    AppendSeq(res->Instrs, GenInstr(NULL, "sge", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    free(Res1);
    free(Res2);
    
    return res;
}

extern struct ExprRes * doRExprEQ(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();
    
    struct ExprRes * res;
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Label = GenLabel();
    res->Reg = reg;
    res->Instrs = GenInstr(res->Label, NULL, NULL, NULL, NULL);
    
    AppendSeq(res->Instrs, Res1->Instrs);
    AppendSeq(res->Instrs, Res2->Instrs);
    AppendSeq(res->Instrs, GenInstr(NULL, "seq", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    free(Res1);
    free(Res2);
    
    return res;
}

extern struct ExprRes * doRExprLTEQ(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();
    
    struct ExprRes * res;
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Label = GenLabel();
    res->Reg = reg;
    res->Instrs = GenInstr(res->Label, NULL, NULL, NULL, NULL);
    
    AppendSeq(res->Instrs, Res1->Instrs);
    AppendSeq(res->Instrs, Res2->Instrs);
    AppendSeq(res->Instrs, GenInstr(NULL, "sle", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    free(Res1);
    free(Res2);
    
    return res;
}

extern struct ExprRes * doRExprLT(struct ExprRes * Res1, struct ExprRes * Res2) {
    int reg;
    reg = AvailTmpReg();
    
    struct ExprRes * res;
    res = (struct ExprRes *) malloc(sizeof(struct ExprRes));
    res->Label = GenLabel();
    res->Reg = reg;
    res->Instrs = GenInstr(res->Label, NULL, NULL, NULL, NULL);
    
    AppendSeq(res->Instrs, Res1->Instrs);
    AppendSeq(res->Instrs, Res2->Instrs);
    AppendSeq(res->Instrs, GenInstr(NULL, "slt", TmpRegName(reg), TmpRegName(Res1->Reg), TmpRegName(Res2->Reg)));
    
    ReleaseTmpReg(Res1->Reg);
    ReleaseTmpReg(Res2->Reg);
    free(Res1);
    free(Res2);
    
    return res;
}

extern struct InstrSeq * makeFunctionLabel(char * name, struct InstrSeq * seq) {
    
    if (NULL != seq) {
        char * endLabel = GenLabel();
        
        struct InstrSeq * seqResult;
        
        seqResult = GenInstr(NULL, "j", endLabel, NULL, NULL);
        AppendSeq(seqResult, GenInstr(name, NULL, NULL, NULL, NULL));
        AppendSeq(seqResult, seq);
        AppendSeq(seqResult, GenInstr(endLabel, NULL, NULL, NULL, NULL));
        
        free(endLabel);
        
        return seqResult;
    }
    
    return seq;
}

extern struct InstrSeq * createReturnStmt(struct ExprRes * res) {
    
    struct InstrSeq * seq;
    
    if (NULL == res) {
        seq = GenInstr(NULL,NULL,NULL,NULL,NULL);
    } else {
        seq = res->Instrs;
    }
    
    int counter = 0;
    struct IdList * curr = ProcLocalParameters;
    struct IdList * next = NULL;
    
    while (curr) {
        next = curr->Next;
        
        curr = next;
        counter = counter + 4;
    }
    
    int counter2 = 0;
    curr = ProcFormalParameters;
    next = NULL;
    
    while (curr) {
        next = curr->Next;
        
        curr = next;
        counter2 = counter2 + 4;
    }
    
    if (NULL != res) {
        if (!strcmp(GEntry->name , "int")) {
            sprintf(Buf, "%d($sp)", 12 + counter + counter2);
            AppendSeq(seq, GenInstr(NULL, "sw", TmpRegName(res->Reg), Buf, NULL));
            AppendSeq(seq, GenInstr(NULL, "lw", "$ra", "4($sp)", NULL));
            sprintf(Buf, "%d", 12 + counter);
            AppendSeq(seq, GenInstr(NULL, "addi", "$sp", "$sp", Buf));
            AppendSeq(seq, GenInstr(NULL, "jr", "$ra", NULL, NULL));
        } else if (!strcmp(GEntry->name , "void")) {
            AppendSeq(seq, GenInstr(NULL, "lw", "$ra", "4($sp)", NULL));
            sprintf(Buf, "%d", 8 + counter);
            AppendSeq(seq, GenInstr(NULL, "addi", "$sp", "$sp", Buf));
            AppendSeq(seq, GenInstr(NULL, "jr", "$ra", NULL, NULL));
        }
        
        ReleaseTmpReg(res->Reg);
        free(res);
        
    } else {
        AppendSeq(seq, GenInstr(NULL, "lw", "$ra", "($sp)", NULL));
        sprintf(Buf, "%d", 8 + counter);
        AppendSeq(seq, GenInstr(NULL, "addi", "$sp", "$sp", Buf));
        AppendSeq(seq, GenInstr(NULL, "jr", "$ra", NULL, NULL));
    }
    
    return seq;
}

extern struct InstrSeq * doIntFunction(struct InstrSeq * stmtSeq) {
    
    struct InstrSeq * seq;
    
    int counter = 0;
    struct IdList * curr = ProcLocalParameters;
    struct IdList * next = NULL;
    
    while (curr) {
        next = curr->Next;
        
        curr = next;
        counter = counter + 4;
    }
    
    sprintf(Buf, "%d", -12 - counter);
    seq = GenInstr(NULL, "addi", "$sp", "$sp", Buf);
    AppendSeq(seq, GenInstr(NULL, "sw", "$ra", "4($sp)", NULL));
    
    AppendSeq(seq, stmtSeq);
    
    return seq;
}

extern struct InstrSeq * doVoidFunction(struct InstrSeq * stmtSeq) {
    
    struct InstrSeq * seq;
    
    int counter = 0;
    struct IdList * curr = ProcLocalParameters;
    struct IdList * next = NULL;
    
    while (curr) {
        next = curr->Next;
        
        curr = next;
        counter = counter + 4;
    }
    
    sprintf(Buf, "%d", -8 - counter);
    seq = GenInstr(NULL, "addi", "$sp", "$sp", Buf);
    AppendSeq(seq, GenInstr(NULL, "sw", "$ra", "0($sp)", NULL));
    
    AppendSeq(seq, stmtSeq);
    
    return seq;
}

extern struct InstrSeq * doIfElse(struct ExprRes * ifRes, struct InstrSeq * elseSeq) {
    
    char * endIf = GenLabel();
    
    if (elseSeq != NULL) {
        // elseSeq does exist. Treat instructions as an IF-ELSE statement.
        
        AppendSeq(ifRes->Instrs, GenInstr(NULL, "j", endIf, NULL, NULL));
        AppendSeq(ifRes->Instrs, GenInstr(ifRes->Label, NULL, NULL, NULL, NULL));
        
        struct InstrSeq * seq2 = concatenateInstrSeq(ifRes->Instrs, elseSeq);
        AppendSeq(seq2, GenInstr(endIf, NULL, NULL, NULL, NULL));
        
        free(endIf);
        
        ReleaseTmpReg(ifRes->Reg);
        free(ifRes->Label);
        free(ifRes);
        
        return seq2;
    } else {
        // elseSeq does NOT exist. Treat instructions as an IF statement.
        
        struct InstrSeq * seq2 = AppendSeq(ifRes->Instrs, NULL);
        AppendSeq(seq2, GenInstr(ifRes->Label, NULL, NULL, NULL, NULL));
        
        ReleaseTmpReg(ifRes->Reg);
        free(ifRes->Label);
        free(ifRes);
        
        return seq2;
    }
    
}

extern struct ExprRes * doIf(struct ExprRes * bRes, struct InstrSeq * seq) {
    //struct InstrSeq * seq2;
    
    free(bRes->Label);
    bRes->Label = GenLabel();
    
    AppendSeq(bRes->Instrs, GenInstr(NULL, "beq", TmpRegName(bRes->Reg), "$zero", bRes->Label));
    AppendSeq(bRes->Instrs, seq);
    
    //AppendSeq(seq2, GenInstr(bRes->Label, NULL, NULL, NULL, NULL));
    
    //ReleaseTmpReg(bRes->Reg);
    //free(bRes->Label);
    //free(bRes);
    
    return bRes;
}

extern struct InstrSeq * doElse(struct InstrSeq * seq) {
    return seq;
}

/*

extern struct InstrSeq * doIf(struct ExprRes *res1, struct ExprRes *res2, struct InstrSeq * seq) {
    struct InstrSeq *seq2;
    char * label;
    label = GenLabel();
    AppendSeq(res1->Instrs, res2->Instrs);
    AppendSeq(res1->Instrs, GenInstr(NULL, "bne", TmpRegName(res1->Reg), TmpRegName(res2->Reg), label));
    seq2 = AppendSeq(res1->Instrs, seq);
    AppendSeq(seq2, GenInstr(label, NULL, NULL, NULL, NULL));
    ReleaseTmpReg(res1->Reg);
    ReleaseTmpReg(res2->Reg);
    free(res1);
    free(res2);
    return seq2;
}

*/

extern struct InstrSeq * doWhileLoop(struct ExprRes * bRes, struct InstrSeq * seq) {
    struct InstrSeq * finalSeq;
    
    char * endLabel = GenLabel();
    
    AppendSeq(bRes->Instrs, GenInstr(NULL, "beq", TmpRegName(bRes->Reg), "$zero", endLabel));
    finalSeq = AppendSeq(bRes->Instrs, seq);
    AppendSeq(finalSeq, GenInstr(NULL, "j", bRes->Label, NULL, NULL));
    AppendSeq(finalSeq, GenInstr(endLabel, NULL, NULL, NULL, NULL));
    
    ReleaseTmpReg(bRes->Reg);
    free(bRes->Label);
    free(bRes);
    
    free(endLabel);
    
    return finalSeq;
}

extern struct InstrSeq * doForLoop(struct InstrSeq * initSeq, 
                                   struct ExprRes * bRes, 
                                   struct InstrSeq * updateSeq, 
                                   struct InstrSeq * stmtSeq) 
{
    struct InstrSeq * finalSeq;
    
    char * endLabel = GenLabel();
    
    AppendSeq(bRes->Instrs, GenInstr(NULL, "beq", TmpRegName(bRes->Reg), "$zero", endLabel));
    
    finalSeq = AppendSeq(initSeq, bRes->Instrs);
    AppendSeq(finalSeq, stmtSeq);
    AppendSeq(finalSeq, updateSeq);
    AppendSeq(finalSeq, GenInstr(NULL, "j", bRes->Label, NULL, NULL));
    AppendSeq(finalSeq, GenInstr(endLabel, NULL, NULL, NULL, NULL));
    
    ReleaseTmpReg(bRes->Reg);
    free(bRes->Label);
    free(bRes);
    
    free(endLabel);
    
    return finalSeq;
}

void Finish(struct InstrSeq *Code) { 
    struct InstrSeq *code;
    //struct SymEntry *entry;
    int hasMore;
    struct Attr * attr;

    code = GenInstr(NULL,".text",NULL,NULL,NULL);
    //AppendSeq(code,GenInstr(NULL,".align","2",NULL,NULL));
    AppendSeq(code, GenInstr(NULL,".globl","main",NULL,NULL));
    AppendSeq(code, GenInstr("main",NULL,NULL,NULL,NULL));
    AppendSeq(code, Code);
    AppendSeq(code, GenInstr(NULL, "li", "$v0", "10", NULL)); 
    AppendSeq(code, GenInstr(NULL,"syscall",NULL,NULL,NULL));
    AppendSeq(code, GenInstr(NULL,".data",NULL,NULL,NULL));
    AppendSeq(code, GenInstr(NULL,".align","4",NULL,NULL));
    AppendSeq(code, GenInstr("_nl",".asciiz","\"\\n\"",NULL,NULL));
    //AppendSeq(code, GenInstr("_null",".asciiz","450A/n480C/n..",NULL,NULL));
    
    hasMore = startIterator(table);
    while (hasMore) {
        attr = (struct Attr *) getCurrentAttr(table);
        
        if (attr && attr->dataType && attr->intLit1) {
            int num = atoi(attr->intLit1);
            num = num * 4;
            sprintf(Buf, "%d", num);
            
            AppendSeq(code, GenInstr((char *) getCurrentName(table), attr->dataType, Buf, NULL, NULL));
        }
        
        hasMore = nextEntry(table);
    }
    
    WriteSeq(code);
    
    return;
}




