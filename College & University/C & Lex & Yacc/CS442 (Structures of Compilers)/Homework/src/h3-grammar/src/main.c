/*
 ============================================================================
 Name        : main.c
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 3
 ============================================================================
 */

#include <stdio.h> 
#include "SymTab.h" 
#include "IOMngr.h" 

extern int yyparse(); 

SymTab * table;

int main(int argc, char * argv[]) {
    table = createSymTab(17);
    
    // OPEN FILE
    if (!openFiles(argv[1], "listingFile")) {
        printf("main.c: Failed to open Input File. The file may either not exist, is corrupted, or is currently in use.\n");
        exit(0);
    }
    
    yyparse();
    
    // FREE MEMORY
    int hasMore = startIterator(table);
    while (hasMore) {
        SymTab * t = (SymTab *) getCurrentAttr(table);
        destroySymTab(t);
        hasMore = nextEntry(table);
    }
    destroySymTab(table);
    
    // CLOSE FILE
    closeFiles();
    
    fflush(NULL);
    
    //printf("DONE");
}