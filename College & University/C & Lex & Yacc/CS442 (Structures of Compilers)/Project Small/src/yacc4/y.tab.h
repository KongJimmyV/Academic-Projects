
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     Ident = 258,
     IntArrayIdent = 259,
     IntLit = 260,
     Int = 261,
     Void = 262,
     StringLit = 263,
     Write = 264,
     Writelines = 265,
     Writespaces = 266,
     Read = 267,
     Return = 268,
     SingleLineComment = 269,
     MultiLineComment = 270,
     IF = 271,
     ELSE = 272,
     WHILE = 273,
     FOR = 274,
     bOR = 275,
     bAND = 276,
     NOTEQ = 277,
     GTEQ = 278,
     EQ = 279,
     LTEQ = 280
   };
#endif
/* Tokens.  */
#define Ident 258
#define IntArrayIdent 259
#define IntLit 260
#define Int 261
#define Void 262
#define StringLit 263
#define Write 264
#define Writelines 265
#define Writespaces 266
#define Read 267
#define Return 268
#define SingleLineComment 269
#define MultiLineComment 270
#define IF 271
#define ELSE 272
#define WHILE 273
#define FOR 274
#define bOR 275
#define bAND 276
#define NOTEQ 277
#define GTEQ 278
#define EQ 279
#define LTEQ 280




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 37 "ExprEval.y"

    long val;
    char * string;
    struct ExprRes * ExprRes;
    struct InstrSeq * InstrSeq;
    struct BExprRes * BExprRes;
    struct ExprResList * ExprResList;
    struct IdList * IdList;



/* Line 1676 of yacc.c  */
#line 114 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


