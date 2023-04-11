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

SymTab * getVal(char * name) { 
    
    // Enter variable name into the main table.
    if (enterName(table, name)) {
        writeIndicator(getCurrentColumnNum()); 
        writeMessage("Initialize variable to an empty SymTab"); 
        setCurrentAttr(table, (void *) createSymTab(17)); 
    }
    
    // Get Attribute (SymTab)
    SymTab * curAttr = (SymTab *) getCurrentAttr(table);
    
    // Make copy of Attribute (SymTab)
    SymTab * copy = createSymTab(17);
    
    int hasMore = startIterator(curAttr);
    while (hasMore) {
        char * name = getCurrentName(curAttr);
        
        enterName(copy, name);
        
        hasMore = nextEntry(curAttr);
    }
    
    // Return copy
    return copy;
}

SymTab * makeSet(char * setLiteral) {
    
    // Remove '{', '}', and whitespace characters.
    removeChar(setLiteral, '{');
    removeChar(setLiteral, '}');
    removeChar(setLiteral, ' ');
    
    // Create SymTab from the set literal.
    SymTab * t = createSymTab(17);
    
    char * token = strtok(setLiteral, ",");
    
    while( token != NULL ) {
        //printf( ",%s\n", token );
        
        enterName(t, token);
        
        token = strtok(NULL, ",");
    }
    
    return t;
}

static void removeChar(char * string, char c) {
    if (NULL == string) {
        return;
    }
    char * stringDest = string;
    
    while (*string) {
        if (*string != c) {
            *stringDest++ = *string;
        }
        string++;
    }
    *stringDest = '\0';
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
    
    destroySymTab(t1);
    destroySymTab(t2);
    
    return t3;
}
