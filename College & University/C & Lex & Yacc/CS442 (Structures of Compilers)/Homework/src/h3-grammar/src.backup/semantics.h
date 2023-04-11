/*
 ============================================================================
 Name        : semantics.h
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 3
 ============================================================================
 */

#include <stdbool.h>

/*
 * Print the Main Table, "table".
 */
extern void printSymTab();

/*
 * Store the variable, "name", into the Main Table, "table", and set the "table->name" attribute as table "t".
 */
extern void storeVar(char * name, SymTab * t);

/*
 * Store the variable, "name", into the Main Table, "table", and return it's current attribute which contains another table.
 * 
 * Returns: The current attribute of the main table, "table". The attrible is expected to be a SymTab.
 */
extern SymTab * getMainTableAttr(char * name);

/*
 * Store a variable, "name", into the table "t1" and returns "t1".
 * 
 * Returns: A SymTab "t1" with "name" added.
 */
extern SymTab * addNameToSymTab(SymTab * t1, char * name);

/*
 * Perform a set UNION on the two Symbol Tables.
 * 
 * Returns: A SymTab created from: t1 UNION t2.
 */
extern SymTab * doUNION(SymTab * t1, SymTab * t2);

/*
 * Perform a set INTERSECTION on the two Symbol Tables.
 * 
 * Returns: A SymTab created from: t1 INTERSECTION t2.
 */
extern SymTab * doINTERSECTION(SymTab * t1, SymTab * t2);
