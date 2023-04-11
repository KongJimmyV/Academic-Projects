/*
 ============================================================================
 Name        : SymTabDriver.c
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 1
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>

#include <assert.h>

#include "SymTab.h"

int main(int argc, char * argv[]) {

	printf("-------------------------------\n");

	//======================================================
	// ====== PARSE ARGS ====== //
	int size;

	// Parse 1st Argument
	argc = 1;
	if (NULL == argv[argc]) { // NEED REQUIRED 1ST ARG
		fprintf(stderr, "\nERROR [1st Argument]: The first command line argument is required. This is the size of the SymTab. Please specify an integer that is greater than or equal to 0.\n\n");
		exit(-1);
	} else {
		size = atoi(argv[argc]);
	}

	if (size < 0) { // INVALID 1ST ARG
		fprintf(stderr, "\nERROR [1st Argument]: Invalid size, \"%d\". Please specify an integer that is greater than or equal to 0.\n\n", size);
		exit(-1);
	}

	printf("Size of SymTab: %d\n", size);

	// Done Parsing
	printf("-------------------------------\n");

	//======================================================

	printf("=========================================================\n");
    printf("=== Creating SymTab And Destroying SymTab Immediately ===\n");
    SymTab * table = createSymTab(size); //MEM ALLOC: Destroy this table to free memory when finished
    destroySymTab(table);
    table = NULL;
    //printSymTab(table);

    printf("\n");
    printf("=======================\n");
	printf("=== Creating SymTab ===\n");
	table = createSymTab(size); //MEM ALLOC: Destroy this table to free memory when finished

    //======================================================
    printf("Testing startIterator (RETURN 0)...\n");
	int ret = startIterator(table);
	printf("\tReturn Value: %d\n", ret);
	if (size == 7) assert(ret == 0);

	//======================================================
	printf("\n");
	printf("======================\n");
    printf("=== Testing SymTab ===\n");

    //-------------------------------
    printf("Testing enterName...\n");
    ret = enterName(table, "Arthur");
    printf("\tAdding Name: %s\n", "Arthur");
    printf("\tReturn Value: %d\n", ret);
    printf("\tCurrent Name: %s\n", getCurrentName(table));
    if (size == 7) assert(ret == 1);

    ret = enterName(table, "ArthurArthur");
    printf("\tAdding Name: %s\n", "ArthurArthur");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

    ret = enterName(table, "ArthurArthurArthur");
    printf("\tAdding Name: %s\n", "ArthurArthurArthur");
    printf("\tReturn Value: %d\n", ret);
    printf("\tCurrent Name: %s\n", getCurrentName(table));
    if (size == 7) assert(ret == 1);

	ret = enterName(table, "ArthurArthurArthurArthur");
    printf("\tAdding Name: %s\n", "ArthurArthurArthurArthur");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

	ret = enterName(table, "ArthurArthurArthurArthur");
    printf("\tAdding Name: %s\n", "ArthurArthurArthurArthur");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 0);

    ret = enterName(table, "Madison");
    printf("\tAdding Name: %s\n", "Madison");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

    ret = enterName(table, "Utah");
    printf("\tAdding Name: %s\n", "Utah");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

    ret = enterName(table, "George");
    printf("\tAdding Name: %s\n", "George");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

    ret = enterName(table, "Martin");
    printf("\tAdding Name: %s\n", "Martin");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

	ret = enterName(table, "Martin");
    printf("\tAdding Name: %s\n", "Martin");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 0);

	ret = enterName(table, "George");
    printf("\tAdding Name: %s\n", "George");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 0);

	//-------------------------------
    printf("Testing findName...\n");
    ret = findName(table, "Arthur");
    printf("\tReturn Value: %d\n", ret);
    printf("\tCurrent Name: %s\n", getCurrentName(table));
    if (size == 7) assert(ret == 1);

    ret = findName(table, "N/A");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 0);

	ret = findName(table, "George");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

	ret = findName(table, "ArthurArthurArthur");
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 1);

	ret = findName(table, NULL);
	printf("\tReturn Value: %d\n", ret);
	printf("\tCurrent Name: %s\n", getCurrentName(table));
	if (size == 7) assert(ret == 0);

	//-------------------------------
    printf("Testing hasCurrent (RETURN 1)...\n");
    ret = hasCurrent(table);
    printf("\tReturn Value: %d\n", ret);
    if (size == 7) assert(ret == 1);

    //-------------------------------
    printf("Testing setCurrentAttr...\n");
    char * attributeString = strdup("ATTRIBUTE STRING"); //MEM ALLOC
    char * attributeString2 = strdup("ATTRIBUTE STRING2"); //MEM ALLOC

    printf("\tCalling setCurrentAttr(table, %s)\n", attributeString);
    setCurrentAttr(table, (void *) attributeString);
    printf("\tCurrent Name: %s\n", table->current->name);
    printf("\tCurrent Attribute: %s\n\n", (char *) table->current->attribute);
    if (size == 7) assert(strcmp((char*) table->current->attribute, attributeString) == 0);

    printf("\tCalling setCurrentAttr(table, %s)\n", "(null)");
    setCurrentAttr(table, NULL);
    printf("\tCurrent Name: %s\n", table->current->name);
    printf("\tCurrent Attribute: %s\n\n", (char *) table->current->attribute);
    if (size == 7) assert(table->current->attribute == NULL);

    printf("\tCalling setCurrentAttr(table, %s)\n", attributeString2);
    setCurrentAttr(table, (void *) attributeString2);
    printf("\tCurrent Name: %s\n", table->current->name);
	printf("\tCurrent Attribute: %s\n\n", (char *) table->current->attribute);
	if (size == 7) assert(strcmp((char*) table->current->attribute, attributeString2) == 0);

    //-------------------------------
    printf("Testing getCurrentAttr...\n");
    void * currentAttr = getCurrentAttr(table);
    printf("\tCurrent Attribute: %s\n", (char *) currentAttr);
    if (size == 7) assert(strcmp((char*) table->current->attribute, "ATTRIBUTE STRING2") == 0);

    //-------------------------------
    printf("Testing getCurrentName...\n");
	char * currentName = getCurrentName(table);
	printf("\tCurrent Name: %s\n", currentName);
	if (size == 7) assert(strcmp(currentName, "ArthurArthurArthur") == 0);

	//-------------------------------
    printf("Testing startIterator (RETURN 1)...\n");
    ret = startIterator(table);
	printf("\tReturn Value: %d\n", ret);
	if (size == 7) assert(ret == 1);

	currentName = getCurrentName(table);
	printf("\tCurrent Name: %s\n", currentName);
	if (size == 7) assert(strcmp(currentName, "Utah") == 0);

	//-------------------------------
    printf("Testing nextEntry...\n");

    ///*
    ret = nextEntry(table);
	printf("\tName: %s\n", table->current->name);
	printf("\tAttribute: %s\n", (char *) table->current->attribute);
	printf("\tNext: %s\n", (char *) table->current->next);
	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(strcmp(getCurrentName(table), "ArthurArthurArthurArthur") == 0);
	if (size == 7) assert(ret == 1);

    ret = nextEntry(table);
	printf("\tName: %s\n", table->current->name);
	printf("\tAttribute: %s\n", (char *) table->current->attribute);
	printf("\tNext: %s\n", (char *) table->current->next);
	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(strcmp(getCurrentName(table), "Martin") == 0);
	if (size == 7) assert(ret == 1);

    ret = nextEntry(table);
	printf("\tName: %s\n", table->current->name);
	printf("\tAttribute: %s\n", (char *) table->current->attribute);
	printf("\tNext: %s\n", (char *) table->current->next);
	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(strcmp(getCurrentName(table), "Madison") == 0);
	if (size == 7) assert(ret == 1);

    ret = nextEntry(table);
	printf("\tName: %s\n", table->current->name);
	printf("\tAttribute: %s\n", (char *) table->current->attribute);
	printf("\tNext: %s\n", (char *) table->current->next);
	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(strcmp(getCurrentName(table), "George") == 0);
	if (size == 7) assert(ret == 1);

    ret = nextEntry(table);
	printf("\tName: %s\n", table->current->name);
	printf("\tAttribute: %s\n", (char *) table->current->attribute);
	printf("\tNext: %s\n", (char *) table->current->next);
	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(strcmp(getCurrentName(table), "Arthur") == 0);
	if (size == 7) assert(ret == 1);

    ret = nextEntry(table);
	printf("\tName: %s\n", table->current->name);
	printf("\tAttribute: %s\n", (char *) table->current->attribute);
	printf("\tNext: %s\n", (char *) table->current->next);
	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(strcmp(getCurrentName(table), "ArthurArthur") == 0);
	if (size == 7) assert(ret == 1);

    ret = nextEntry(table);
	printf("\tName: %s\n", table->current->name);
	printf("\tAttribute: %s\n", (char *) table->current->attribute);
	printf("\tNext: %s\n", (char *) table->current->next);
	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(strcmp(getCurrentName(table), "ArthurArthurArthur") == 0);
	if (size == 7) assert(ret == 1);

	ret = nextEntry(table);
	printf("\tCurrent Table (EXPECTING NULL): %s\n", (char *) table->current);
	if (size == 7) assert(NULL == table->current);

	printf("\tReturn Value: %d\n\n", ret);
	if (size == 7) assert(ret == 0);
	//*/

    //-------------------------------
	printf("Testing hasCurrent (RETURN 0)...\n");
	ret = hasCurrent(table);
	printf("\tReturn Value: %d\n", ret);
	if (size == 7) assert(ret == 0);

    //======================================================
    
    ///*
	printf("\n");
    printf("=======================\n");
    printf("=== Printing SymTab ===\n");
    printSymTab(table);

    printf("Calling startIterator...\n");
    ret = startIterator(table);
	printf("\tReturn Value: %d\n", ret);
	if (size == 7) assert(ret == 1);

	printf("Printing SymTab...\n");
	printSymTab(table);
    //*/
    
    //======================================================
    printf("=========================\n");
    printf("=== Destroying SymTab ===\n");
    destroySymTab(table);
    table = NULL;
    //printSymTab(table);

    //======================================================
    printf("=====================\n");
    printf("=== END OF DRIVER ===\n");

    //======================================================

    free(attributeString);
    free(attributeString2);
    attributeString = NULL;
    attributeString2 = NULL;

    fflush(NULL);
    return 0;
}
