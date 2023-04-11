/*
 ============================================================================
 Name        : SymTab.c
 Author      : Kong Jimmy Vang
 Description : CS 442/542: Homework 1
 ============================================================================
 */

#include "SymTab.h"

// See the header file, "SymTab.h", for information about each function.

SymTab * createSymTab(int size) {
    if (size < 0) {
        fprintf(stderr, "ERROR: Size for a SymTab is less than 0 in \"createSymTab(int size)\". Value = %d\n", size);
        exit(-1);
    }

    SymTab * table = (SymTab *) malloc(sizeof(SymTab));
    table->size = size;
    table->contents = (SymEntry **) malloc(sizeof(SymEntry *) * table->size);
    table->current = NULL;

    for (int i = 0; i < table->size; i++) {
        table->contents[i] = (SymEntry *) malloc(sizeof(SymEntry));
        table->contents[i]->name = NULL;
        table->contents[i]->attribute = NULL;
        table->contents[i]->next = NULL;
    }

    return table;
}

void destroySymTab(SymTab * table) {
    if (NULL == table) {
        printf("WARNING: An attempt to destroy a NULL table was attempted in function, \"destroySymTab(SymTab * table)\".\n");
        return;
    }

    SymEntry * tmpEntry1, * tmpEntry2;
    for (int i = 0; i < table->size; i++) {

        if (table->contents[i]) {

            tmpEntry1 = table->contents[i]->next;
            if (NULL != tmpEntry1) {

                tmpEntry2 = tmpEntry1->next;

                if (tmpEntry1->name) {
                    free(tmpEntry1->name);
                }

                tmpEntry1->name = NULL;
                tmpEntry1->attribute = NULL;
                tmpEntry1->next = NULL;

                free(tmpEntry1);
                tmpEntry1 = NULL;

                while (NULL != tmpEntry2) {

                    tmpEntry1 = tmpEntry2;
                    tmpEntry2 = tmpEntry1->next;

                    if (tmpEntry1->name) {
                        free(tmpEntry1->name);
                    }

                    tmpEntry1->name = NULL;
                    tmpEntry1->attribute = NULL;
                    tmpEntry1->next = NULL;

                    free(tmpEntry1);
                    tmpEntry1 = NULL;
                }
            }

            table->contents[i]->next = NULL;

            free(table->contents[i]);

            table->contents[i] = NULL;
        }
    }

    free(table->contents);

    table->size = 0;
    table->contents = NULL;
    table->current = NULL;

    free(table);
    table = NULL;

    //fflush(NULL);
    return;
}

int enterName(SymTab * table, char * name) {

    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"enterName(SymTab * table, char * name)\".\n");
        return 0; //exit(-1);
    }

    if (0 == findName(table, name)) {
        // Did NOT find name.

        char * copyOfName = strdup(name);
        int hash = hashFunction(copyOfName, table->size);

        SymEntry * tmpEntry = table->contents[hash]->next;

        if (NULL != tmpEntry) {

            // iterate linked lists until the end of the list is reached.
            while (NULL != tmpEntry->next) {
                tmpEntry = tmpEntry->next;
            }

            // add a new node to the linked list.
            tmpEntry->next = (SymEntry *) malloc(sizeof(SymEntry));
            tmpEntry = tmpEntry->next;
        } else {
            // add a new node to the linked list.
            table->contents[hash]->next = (SymEntry *) malloc(sizeof(SymEntry));
            tmpEntry = table->contents[hash]->next;
        }

        tmpEntry->name = copyOfName;
        tmpEntry->attribute = NULL;
        tmpEntry->next = NULL;

        table->current = tmpEntry;

        return 1;
    } else {
        // Did find name.

        /*int hash = hashFunction(name, table->size);

        SymEntry * tmpEntry = table->contents[hash]->next;
        SymEntry * tmpEntryPrev;

        while (NULL != tmpEntry && tmpEntry->name != name) {
            tmpEntryPrev = tmpEntry;
            tmpEntry = tmpEntry->next;
        }

        table->current = tmpEntryPrev;*/

        return 0;
    }
}

int findName(SymTab * table, char * name) {

    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"findName(SymTab * table, char * name)\".\n");
        return 0; //exit(-1);
    }

    if (NULL == name) {
        return 0;
    }

    int hash = hashFunction(name, table->size);

    if (NULL == table->contents) {
        // Given name does not exist.
        return 0;
    }

    SymEntry * entryPos = table->contents[hash];
    if (NULL == entryPos) {
        // Given name does not exist.
        return 0;
    }

    if (NULL != entryPos && NULL != entryPos->next) {
        entryPos = entryPos->next;
    } else {
        // Given name does not exist.
        return 0;
    }

    while (NULL != entryPos) {
        if (strcmp(entryPos->name, name) == 0) {
            // Did find name.
            table->current = entryPos;
            return 1;
        }
        entryPos = entryPos->next;
    }

    // Did NOT find name.
    return 0;
}

int hasCurrent(SymTab * table) {
    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"hasCurrent(SymTab * table, char * name)\"\n.");
        return 0; //exit(-1);
    }

    if (NULL != table->current) {
        return 1;
    }

    return 0;
}

void setCurrentAttr(SymTab * table, void * attr) {
    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"setCurrentAttr(SymTab * table, char * name)\"\n.");
        return; //exit(-1);
    }

    if (1 != hasCurrent(table)) {
        printf("WARNING: 1 != hasCurrent(table), \"setCurrentAttr(SymTab * table, void * attr)\".\n");
        return;
    }

    table->current->attribute = attr;

    return;
}

void * getCurrentAttr(SymTab * table) {
    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"getCurrentAttr(SymTab * table, char * name)\".\n");
        return NULL; //exit(-1);
    }

    if (1 != hasCurrent(table)) {
        printf("WARNING: 1 != hasCurrent(table), \"getCurrentAttr(SymTab * table)\".\n");
        return NULL;
    }

    return table->current->attribute;
}

char * getCurrentName(SymTab * table) {
    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"getCurrentName(SymTab * table, char * name)\".\n");
        return 0; //exit(-1);
    }

    if (1 != hasCurrent(table)) {
        printf("WARNING: 1 != hasCurrent(table), \"getCurrentName(SymTab * table)\".\n");
        return "";
    }

    return table->current->name;
}

int startIterator(SymTab * table) {
    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"startIterator(SymTab * table, char * name)\".\n");
        return 0; //exit(-1);
    }

    for (int i = 0; i < table->size; i++) {
        if (NULL != table->contents[i]->next) {
            // Not empty
            table->current = table->contents[i]->next;
            return 1;
        }
    }

    // Empty
    return 0;
}

int nextEntry(SymTab * table) {
    if (NULL == table) {
        fprintf(stderr, "ERROR: NULL table passed, \"nextEntry(SymTab * table, char * name)\".\n");
        return 0; //exit(-1);
    }

    if (NULL == table->current) {
        // no more entries
        return 0;
    }

    if (NULL == table->current->next) {
        int hash = hashFunction(table->current->name, table->size);

        while (hash + 1 < table->size) {

            if (NULL != table->contents[hash + 1]) {
                if (NULL != table->contents[hash + 1]->next) {
                    // there are more entries
                    table->current = table->contents[hash + 1]->next;
                    return 1;
                }
            }

            hash += 1;
        }

        // no more entries
        table->current = NULL;
        return 0;
    } else {
        // there are more entries
        table->current = table->current->next;
        return 1;
    }
}

static int hashFunction(char * key, int tableSize) {
    int hashVal = 0;

    for (int i = 0; i < strlen(key); i++) {
        hashVal = 37 * hashVal + key[i];
    }

    hashVal %= tableSize;
    if( hashVal < 0 )
        hashVal += tableSize;

    return hashVal;
}
/*
void printSymTable(SymTab * table) {
    if (NULL == table) {
        printf("\n");
        printf("Table\n");
        printf("  |\n");
        printf("  v\n");
        printf("(null)\n\n");
        return;
    }

    printf("\n");
    printf("==================================================\n");
    printf("================== SYMBOL TABLE ==================\n");
    printf("==================================================\n");
    // Size
    printf("Size-> %d\n", table->size);

    // Current
    if (NULL != table->current) {
        printf("Current-> [name: %s, attr: %s]\n",
                (char *) table->current->name,
                (char *) table->current->attribute);
    } else {
        printf("Current-> %s\n", "(null)");
    }

    // Contents
    SymEntry * tempEntry1;
    printf("\n");
    printf("Contents\n");
    printf(" |\n");
    printf(" v\n");
    for (int i = 0; i < table->size; i++) {
        tempEntry1 = table->contents[i];

        if (NULL != tempEntry1->next) {
            // has symbol entries
            tempEntry1 = tempEntry1->next;

            printf("[%d]", i);

            while (NULL != tempEntry1) {
                printf("-> ");
                printf("[name: %s, ", tempEntry1->name);
                printf("attr: %s]", (char *) tempEntry1->attribute);

                tempEntry1 = tempEntry1->next;
            }

            printf("\n");

        } else {
            // no symbol entries
            printf("[%d]-> (null)\n", i);
        }
    }

    printf("==================================================\n\n");
    return;
}
//*/