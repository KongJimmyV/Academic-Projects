/*
 ============================================================================
 Name           : main.c
 Author         : Kong Jimmy Vang
 Project Desc   : CS 442/542: Project
 Description    : Main. 
    
    Command Line Notes:
        bison -dy ExprEval.y
        flex lex1.l
        gcc -o yacc4 CodeGen.c IOMngr.c SymTab.c Semantics.c lex.yy.c y.tab.c main.c
        yacc4 t1.c listing.lst asmCode1.asm
 ============================================================================
*/

#include <stdio.h>
#include "Semantics.h"
#include "SymTab.h"
#include "IOMngr.h"

extern int yyparse();

SymTab * table;
SymTab * ProcSymTab;
struct IdList * ProcFormalParameters;
struct IdList * ProcLocalParameters;
struct SymEntry * GEntry;
int inProc = 0;
int gCounter = 0;
FILE *aFile;

int main(int argc, char * argv[]) {
    table = createSymTab(33);
    
    GEntry = (SymEntry *) malloc(sizeof(SymEntry));
    GEntry->name = NULL;
    GEntry->attribute = NULL;
    GEntry->next = NULL;
    
    //assumes there is a listing file
    openFiles(argv[1], argv[2]);
    if (argc == 4) 
        aFile = fopen(argv[3], "w");
    else
        aFile = stdout;

    yyparse();
    
    //printSymTable(table);
    
    // FREE MEMORY
    int hasMore = startIterator(table);
    while (hasMore) {
        struct Attr * attr = (struct Attr *) getCurrentAttr(table);
        if (attr) {
            if (attr->dataType)
                free(attr->dataType);
            if (attr->intLit1)
                free(attr->intLit1);
            free(attr);
        }
        hasMore = nextEntry(table);
    }
    destroySymTab(table);
    
    // CLOSE FILE
    closeFiles();
    
    fflush(NULL);
    
    //printf("DONE");
}

