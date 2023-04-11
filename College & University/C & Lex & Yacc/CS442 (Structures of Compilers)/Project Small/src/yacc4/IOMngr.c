/*
 ============================================================================
 Name           : IOMngr.c
 Author         : Kong Jimmy Vang
 Project Desc   : CS 442/542: Homework 2
 Description    : The IO Manager.
 ============================================================================
*/

#include "IOMngr.h"

char * charArray = NULL;
int hasLineBeenPrinted = 0;

int currentColumnNum = 0;
int currentLineNum = 0;

FILE * sourceFile = NULL;
FILE * listingFile = NULL;

/*
 * Open the source file whose name is given in "sourceName".
 *         - You can assume "sourceName" is assigned a legal char*
 *             (i.e. a string).
 *
 * If "listingName" is not NULL open the listing file whose name
 *         is given in "listingName".
 * If "listingName" is NULL, the output goes to stdout.
 *
 * Return 1, if the file open(s) were successful, otherwise return 0.
 */
int openFiles(char * sourceName, char * listingName) {
    if (NULL != sourceFile || NULL != listingFile) {
        printf("IOMngr [openFiles()]: WARNING - The source file or listing file were not closed when opening new files. Close the files by calling closeFiles() before calling this function...\n");

        //closeFiles();

        //sourceFile = NULL;
        //listingFile = NULL;

        return 0;
    }

    if (NULL != sourceName) {
        sourceFile = fopen(sourceName, "r");

        if (NULL == sourceFile) {
            closeFiles();
            return 0;
        }
    } else {
        return 0;
    }

    if (NULL != listingName) {
        listingFile = fopen(listingName, "w");

        if (NULL == listingFile) {
            closeFiles();
            return 0;
        }
    }

    return 1;
}

/*
 * Close the source file and the listing file if one was created.
 */
void closeFiles() {

    if (NULL != sourceFile)
        fclose(sourceFile);
    if (NULL != listingFile)
        fclose(listingFile);

    if (NULL != charArray) {
        free(charArray);
        charArray = NULL;
    }

    //fflush(NULL);

    sourceFile = NULL;
    listingFile = NULL;
    hasLineBeenPrinted = 0;

    return;
}

/*
 * Return the next source char.
 *
 * This function is also responsible for echoing
 *         the lines in the source file to the listing file
 *         (if one exists).
 *
 * The lines in the listing file should be numbered.
 *
 * Return EOF when the end of the source file is reached.
 */
char getNextSourceChar() {
    if (NULL == sourceFile) {
        fprintf(stderr, "IOMngr [getNextSourceChar()]: WARNING - There is no source file opened.\n");
        exit(-1);
        return '\0';
    }

    currentColumnNum++;

    if (NULL == charArray) {
        // First call to this function will initialize the charArray.

        charArray = (char *) malloc(sizeof(char) * MAXLINE);

        if (NULL == fgets(charArray, MAXLINE, sourceFile)) {
            if (NULL != charArray) {
                free(charArray);
                charArray = NULL;
            }

            return EOF;
        }

        if (NULL != listingFile) {
            // Write character to the listing file if it is not NULL.
            fputs(charArray, listingFile);
        }

        currentLineNum = 0;
        currentColumnNum = 0;
        hasLineBeenPrinted = 0;
    }

    if ('\0' == charArray[currentColumnNum]) {
        // Reached end of current line. Go to next line in file.
        if (NULL == fgets(charArray, MAXLINE, sourceFile)) {
            if (NULL != charArray) {
                free(charArray);
                charArray = NULL;
            }

            return EOF;
        }

        if (NULL != listingFile) {
            // Write character to the listing file if it is not NULL.
            fputs(charArray, listingFile);
        }

        currentLineNum++;
        currentColumnNum = 0;
        hasLineBeenPrinted = 0;
    }

    // Return the current char.
    return charArray[currentColumnNum];
}

/*
 * Write a line containing a single '^' character
 *         in the indicated "column".
 *
 * If there is no listing file then the current
 *         line should be echoed to stdout the first
 *         time (for that line) that writeIndicator or
 *         writeMessage is called.
 */
void writeIndicator(int column) {
    if (column < 0) {
        fprintf(stderr, "IOMngr [writeIndicator()]: WARNING - Invalid column. (column < 0)\n");
        return;
    }

    if (NULL == listingFile && 0 == hasLineBeenPrinted) {
        // Write character to stdout if the listing file is NULL.
        fputs(charArray, stdout);
        hasLineBeenPrinted = 1;
    }

    char * string = (char *) malloc(sizeof(char) * column + 3);
    for (int i = 0; i < column + 3; i++) {
        if (i == column) {
            string[i] = '^';
        } else if (i == column + 1) {
            string[i] = '\n';
        } else if (i == column + 2) {
            string[i] = '\0';
        } else {
            string[i] = ' ';
        }
    }

    if (NULL != listingFile) {
        // Write character to the listing file if it is not NULL.
        fputs(string, listingFile);
    } else {
        // Write character to stdout if the listing file is NULL.
        fputs(string, stdout);
    }

    free(string);
    string = NULL;

    return;
}

/*
 * Write a given "message" on a separate line.
 */
void writeMessage(char * message) {
    if (NULL == message) {
        fprintf(stderr, "IOMngr [writeMessage()]: NULL string message passed as parameter.\n");
        return;
    }

    if (NULL == listingFile && 0 == hasLineBeenPrinted) {
        // Write character to stdout if the listing file is NULL.
        fputs(charArray, stdout);
        hasLineBeenPrinted = 1;
    }

    char * tempMessage = (char *) malloc(sizeof(char) * strlen(message) + 2);
    strcpy(tempMessage, message);
    strcat(tempMessage, "\n");

    if (NULL != listingFile) {
        // Write character to the listing file if it is not NULL.
        fputs(tempMessage, listingFile);
    } else {
        // Write character to stdout if the listing file is NULL.
        fputs(tempMessage, stdout);
    }

    free(tempMessage);
    tempMessage = NULL;

    return;
}

/*
 * Return the current line number.
 */
int getCurrentLineNum() {
    return currentLineNum;
}

/*
 * Return the current column number in the current line.
 */
int getCurrentColumnNum() {
    return currentColumnNum;
}
