/*
 ============================================================================
 Name        : semantics.c
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 3
 ============================================================================
 */

#include <stdio.h> 
#include <stdlib.h>
#include "SymTab.h"
#include "IOMngr.h"
#include "semantics.h"

extern SymTab * table;

void printSymTab() {
    int hasMore = startIterator(table);
    
    while (hasMore) {
        printf("%s: {", getCurrentName(table));
        
        SymTab * tableAttr = getCurrentAttr(table);
        
        int hasMore2 = startIterator(tableAttr);
        while (hasMore2) {
            printf("%s", getCurrentName(tableAttr));
            
            hasMore2 = nextEntry(tableAttr);
            
            if (hasMore2) {
                printf(",");
            }
        }
        
        hasMore = nextEntry(table);
        
        printf("}\n");
    }
    
}

void storeVar(char * name, SymTab * t) { 
    enterName(table, name); 
    setCurrentAttr(table, (void *) t); 
}

SymTab * getMainTableAttr(char * name) { 
    if (enterName(table, name)) {
        //TODO: make empty table
        
    }
    
    SymTab * copy = //TODO: make copy
    return copy;
}

SymTab * addNameToSymTab(SymTab * t1, char * name) {
    //printf("addToSymTab: %s\n", name);
    enterName(t1, name);
    return t1;
}

SymTab * doUNION(SymTab * t1, SymTab * t2) {
    SymTab * t3 = createSymTab(17);
    
    int hasMore1 = startIterator(t1);
    int hasMore2 = startIterator(t2);
    
    while (hasMore1) {
        char * name1 = getCurrentName(t1);
        enterName(t3, getCurrentName(t1));
        
        hasMore1 = nextEntry(t1);
    }
    
    while (hasMore2) {
        char * name2 = getCurrentName(t2);
        enterName(t3, getCurrentName(t2));
        hasMore2 = nextEntry(t2);
    }
    
    destroySymTab(t1);
    destroySymTab(t2);
    
    return t3;
}

SymTab * doINTERSECTION(SymTab * t1, SymTab * t2) {
    SymTab * t3 = createSymTab(17);
    int hasMore1 = startIterator(t1);
    
    //printf("%s,%s\n", t1, t2);
    
    if ( t1 != t2 ) {
        // t1 and t2 are NOT pointing to the same SymTab struct.
        
        //printf("t1 != t2\n");
        while (hasMore1) {
            int hasMore2 = startIterator(t2);
            
            char * name1 = getCurrentName(t1);
            
            while (hasMore2) {
                char * name2 = getCurrentName(t2);
                if (strcmp(name1, name2) == 0) {
                    enterName(t3, name1);
                    //printf("NAME1: %s\n", name1);
                }
                
                hasMore2 = nextEntry(t2);
            }
            
            hasMore1 = nextEntry(t1);
        }
    } else {
        // t1 and t2 are pointing to the same SymTab struct.
        
        //printf("t1 == t2\n");
        while (hasMore1) {
            char * name1 = getCurrentName(t1);
            
            enterName(t3, name1);
            
            hasMore1 = nextEntry(t1);
        }
    }
    
    destroySymTab(t1);
    destroySymTab(t2);
    
    return t3;
}
