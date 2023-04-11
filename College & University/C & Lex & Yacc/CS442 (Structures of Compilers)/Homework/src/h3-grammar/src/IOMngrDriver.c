/*
 ============================================================================
 Name        : IOMngrDriver.c
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 2
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

#include "IOMngr.h"

int main(int argc, char * argv[]) {

	printf("-------------------------------\n");

	//======================================================
	// ====== PARSE ARGS ====== //
	char * sourceName = NULL;
	char * listingName = NULL;

	// Parse 1st Argument
	argc = 1;
	if (NULL == argv[argc]) { // NEED REQUIRED 1ST ARG
		fprintf(stderr, "\nERROR [1st Argument]: The first command line argument is required. Please enter a sourceName.\n\n");
		exit(-1);
	} else {
		sourceName = argv[argc];
		printf("sourceName: %s\n", sourceName);
	}

	// Parse 2nd Argument
	argc = 2;
	if (NULL == argv[argc]) { // OPTIONAL 2ND ARG
		;
	} else {
		listingName = argv[argc];
		printf("listingName: %s\n", listingName);
	}

	// Done Parsing
	printf("-------------------------------\n");

	//======================================================

	printf("Testing IOMngr...\n");

	char c;

	/*
	printf("\tOpening files...\n");
	openFiles(sourceName, listingName);

	printf("\tTesting getNextSourceChar()...\n");
	printf("\n");
	c = '\0';
	while (EOF != c) {
		c = getNextSourceChar();
		if (c != EOF) {
			//printf("%c", (char) c);
		}
	}

	c = getNextSourceChar();
	printf("%c", (char) c);
	c = getNextSourceChar();
	printf("%c", (char) c);
	c = getNextSourceChar();
	printf("%c", (char) c);
	c = getNextSourceChar();
	printf("%c", (char) c);

	printf("\n");
	printf("\n");
	printf("Testing writeIndicator()...\n");
	writeIndicator(0);
	writeIndicator(1);
	writeIndicator(2);
	writeIndicator(3);
	writeIndicator(4);

	printf("\n");
	printf("Testing writeMessage()...\n");
	writeMessage("Error 1");
	writeMessage("Exception 1");
	writeMessage("Variable not declared");
	writeMessage("Unexpected character");
	writeMessage("Hello World!");

	printf("\n");
	printf("\tClosing files...\n");
	closeFiles();

	fflush(NULL);

	printf("\n");
	printf("\n");
	//*/

	printf("\tOpening files...\n");
	openFiles(sourceName, listingName);

	printf("\tMore Testing...\n");
	printf("\n");
	c = '\0';
	while (EOF != c) {
		c = getNextSourceChar();
		if (c == 'm') {
			writeIndicator(getCurrentColumnNum());
			writeMessage("Unexpected character");
		} else if (getCurrentLineNum() == 3 && c == 'x') {
			writeIndicator(getCurrentColumnNum());
			writeMessage("Variable not declared");
		} else if (c == '@') {
			writeIndicator(getCurrentColumnNum());
			writeMessage("Unexpected character");
		}

	}

	printf("\n");
	printf("\tClosing files...\n");
	closeFiles();

	fflush(NULL);

	printf("Finished Testing IOMngr...\n");
	return 0;
}
