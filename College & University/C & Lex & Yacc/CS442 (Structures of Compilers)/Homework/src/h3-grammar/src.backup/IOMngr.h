/*
 ============================================================================
 Name        : IOMngr.h
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 2
 ============================================================================
 */

#ifndef IOMNGR_H_
#define IOMNGR_H_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*****************************
 * Defines
 *****************************/
#define MAXLINE 1024

/*****************************
 * Structures
 *****************************/


/*****************************
 * Global Variables
 *****************************/
extern char * charArray;
extern int hasLineBeenPrinted;

extern FILE * sourceFile;
extern FILE * listingFile;

/*****************************
 * Function Declarations
 *****************************/
/*
 * Open the source file whose name is given in "sourceName".
 *      You can assume "sourceName" is assigned a legal char*
 *          (i.e. a string).
 *
 * If "listingName" is not NULL open the listing file whose name
 *      is given in "listingName".
 * If "listingName" is NULL, the output goes to stdout.
 *
 * Return 1, if the file open(s) were successful, otherwise return 0.
 */
int openFiles(char * sourceName, char * listingName);

/*
 * Close the source file and the listing file if one was created.
 */
void closeFiles();

/*
 * Return the next source char.
 *
 * This function is also responsible for echoing
 *      the lines in the source file to the listing file
 *      (if one exists).
 *
 * The lines in the listing file should be numbered.
 *
 * Return EOF when the end of the source file is reached.
 */
char getNextSourceChar();

/*
 * Write a line containing a single '^' character
 *      in the indicated "column".
 *
 * If there is no listing file then the current
 *      line should be echoed to stdout the first
 *      time (for that line) that writeIndicator or
 *      writeMessage is called.
 */
void writeIndicator(int column);

/*
 * Write a given "message" on a separate line.
 */
void writeMessage(char * message);

/*
 * Return the current line number.
 */
int getCurrentLineNum();

/*
 * Return the current column number in the current line.
 */
int getCurrentColumnNum();

#endif /* IOMNGR_H_ */
