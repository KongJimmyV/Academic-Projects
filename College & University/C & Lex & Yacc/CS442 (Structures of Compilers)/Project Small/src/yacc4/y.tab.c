
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 10 "ExprEval.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "IOMngr.h"
#include "SymTab.h"
#include "Semantics.h"
#include "CodeGen.h"

extern int yylex();    /* The next token function. */
extern char *yytext;   /* The matched token text.  */
extern int yyleng;     /* The token text length.   */
extern int yyparse();
extern int yyerror(char *);
void dumpTable();

extern SymTab * table;
extern SymTab * ProcSymTab;
extern struct IdList * ProcFormalParameters;
extern struct IdList * ProcLocalParameters;
extern struct SymEntry * GEntry;
extern int inProc;
extern int gCounter;



/* Line 189 of yacc.c  */
#line 100 "y.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


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

/* Line 214 of yacc.c  */
#line 37 "ExprEval.y"

    long val;
    char * string;
    struct ExprRes * ExprRes;
    struct InstrSeq * InstrSeq;
    struct BExprRes * BExprRes;
    struct ExprResList * ExprResList;
    struct IdList * IdList;



/* Line 214 of yacc.c  */
#line 198 "y.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 210 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   213

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  44
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  66
/* YYNRULES -- Number of rules.  */
#define YYNRULES  113
/* YYNRULES -- Number of states.  */
#define YYNSTATES  221

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   280

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    35,     2,     2,     2,    40,     2,     2,
      29,    30,    42,    39,    34,    38,     2,    41,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    26,
      37,    33,    36,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    27,     2,    28,    43,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    31,     2,    32,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    10,    13,    14,    15,    20,
      21,    26,    27,    32,    33,    39,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    65,    67,    68,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    95,    98,   102,
     105,   106,   108,   110,   112,   114,   118,   120,   122,   128,
     132,   136,   140,   146,   149,   157,   162,   163,   171,   189,
     191,   195,   196,   199,   204,   206,   210,   211,   212,   217,
     218,   225,   227,   228,   230,   234,   236,   240,   242,   246,
     248,   251,   253,   257,   261,   265,   269,   273,   277,   281,
     283,   287,   289,   293,   295,   299,   301,   305,   307,   311,
     313,   317,   319,   322,   324,   328,   330,   333,   336,   338,
     342,   343,   344,   349
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      45,     0,    -1,    46,    75,    -1,    50,    46,    -1,    -1,
      48,    47,    -1,    -1,    -1,     6,   109,    49,    26,    -1,
      -1,     6,   109,    51,    53,    -1,    -1,     7,   109,    52,
      66,    -1,    -1,    27,   105,    28,    54,    26,    -1,    55,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    29,
      56,    85,    30,    57,    31,    47,    58,    75,    59,    60,
      61,    62,    63,    32,    -1,    64,    -1,    -1,    65,    26,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    29,
      67,    85,    30,    68,    31,    47,    69,    75,    70,    71,
      72,    73,    74,    32,    -1,    76,    75,    -1,    13,    96,
      26,    -1,    13,    26,    -1,    -1,    77,    -1,    78,    -1,
      79,    -1,    82,    -1,   109,   107,    26,    -1,    14,    -1,
      15,    -1,     9,    29,    89,    30,    26,    -1,    10,    96,
      26,    -1,    11,    96,    26,    -1,    12,    83,    26,    -1,
     109,   106,    33,    96,    26,    -1,    80,    81,    -1,    16,
      29,    91,    30,    31,    75,    32,    -1,    17,    31,    75,
      32,    -1,    -1,    18,    29,    91,    30,    31,    75,    32,
      -1,    19,    29,   109,   106,    33,    96,    26,    91,    26,
     109,   106,    33,    96,    30,    31,    75,    32,    -1,    84,
      -1,    29,    84,    30,    -1,    -1,   109,   106,    -1,    84,
      34,   109,   106,    -1,    86,    -1,    29,    86,    30,    -1,
      -1,    -1,     6,   109,    87,   106,    -1,    -1,    86,    34,
       6,   109,    88,   106,    -1,    90,    -1,    -1,    96,    -1,
      90,    34,    96,    -1,    92,    -1,    92,    20,    93,    -1,
      93,    -1,    93,    21,    94,    -1,    94,    -1,    35,    94,
      -1,    95,    -1,    96,    22,    96,    -1,    96,    36,    96,
      -1,    96,    23,    96,    -1,    96,    24,    96,    -1,    96,
      25,    96,    -1,    96,    37,    96,    -1,    29,    91,    30,
      -1,    97,    -1,    97,    38,    98,    -1,    98,    -1,    98,
      39,    99,    -1,    99,    -1,    99,    40,   100,    -1,   100,
      -1,   100,    41,   101,    -1,   101,    -1,   101,    42,   102,
      -1,   102,    -1,   103,    43,   102,    -1,   103,    -1,    38,
     103,    -1,   104,    -1,    29,    96,    30,    -1,     5,    -1,
     109,   106,    -1,   109,   107,    -1,     5,    -1,    27,    96,
      28,    -1,    -1,    -1,    29,   108,    89,    30,    -1,     3,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   126,   126,   127,   128,   129,   130,   131,   131,   132,
     132,   133,   133,   135,   134,   139,   140,   141,   146,   149,
     150,   151,   152,   153,   140,   156,   157,   157,   161,   162,
     167,   170,   171,   172,   173,   174,   161,   177,   178,   179,
     180,   181,   182,   183,   184,   185,   191,   192,   193,   195,
     196,   197,   198,   199,   200,   201,   202,   203,   204,   215,
     216,   217,   218,   219,   220,   221,   222,   223,   223,   225,
     225,   227,   228,   229,   230,   231,   232,   233,   234,   235,
     236,   237,   238,   239,   240,   241,   242,   243,   244,   245,
     246,   247,   248,   249,   250,   251,   252,   253,   254,   255,
     256,   257,   258,   259,   260,   261,   262,   263,   265,   266,
     267,   269,   268,   275
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "Ident", "IntArrayIdent", "IntLit",
  "Int", "Void", "StringLit", "Write", "Writelines", "Writespaces", "Read",
  "Return", "SingleLineComment", "MultiLineComment", "IF", "ELSE", "WHILE",
  "FOR", "bOR", "bAND", "NOTEQ", "GTEQ", "EQ", "LTEQ", "';'", "'['", "']'",
  "'('", "')'", "'{'", "'}'", "'='", "','", "'!'", "'>'", "'<'", "'-'",
  "'+'", "'%'", "'/'", "'*'", "'^'", "$accept", "Prog", "GlobDeclarations",
  "LocalDeclarations", "LocalDec", "$@1", "GlobDec", "$@2", "$@3",
  "GlobDecIntArray", "$@4", "GlobDecIntFunc", "$@5", "$@6", "$@7", "@8",
  "$@9", "$@10", "$@11", "$@12", "GlobDecInt", "$@13", "GlobDecVoidFunc",
  "$@14", "$@15", "$@16", "@17", "$@18", "$@19", "$@20", "$@21", "StmtSeq",
  "Stmt", "IOStmt", "AssignExpr", "BranchStmt", "BranchStmtIf",
  "BranchStmtElse", "LoopStmt", "IdList", "IdListSeq", "IdListFunc",
  "IdListSeqFunc", "$@22", "$@23", "ExprResList", "ExprResListSeq",
  "BoolExpr", "BoolExprOr", "BoolExprAnd", "BoolExprNot", "RelExpr",
  "Expr", "SubExpr", "AddExpr", "ModulusTerm", "DivTerm", "MultTerm",
  "Expo", "UnaryMinus", "Factor", "ArrayIntLit", "ArraySubscript",
  "FuncSubscript", "$@24", "Id", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,    59,    91,    93,    40,
      41,   123,   125,    61,    44,    33,    62,    60,    45,    43,
      37,    47,    42,    94
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    44,    45,    46,    46,    47,    47,    49,    48,    51,
      50,    52,    50,    54,    53,    53,    56,    57,    58,    59,
      60,    61,    62,    63,    55,    55,    65,    64,    67,    68,
      69,    70,    71,    72,    73,    74,    66,    75,    75,    75,
      75,    76,    76,    76,    76,    76,    76,    76,    77,    77,
      77,    77,    78,    79,    80,    81,    81,    82,    82,    83,
      83,    83,    84,    84,    85,    85,    85,    87,    86,    88,
      86,    89,    89,    90,    90,    91,    92,    92,    93,    93,
      94,    94,    95,    95,    95,    95,    95,    95,    95,    96,
      97,    97,    98,    98,    99,    99,   100,   100,   101,   101,
     102,   102,   103,   103,   104,   104,   104,   104,   105,   106,
     106,   108,   107,   109
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     0,     2,     0,     0,     4,     0,
       4,     0,     4,     0,     5,     1,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     1,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     2,     3,     2,
       0,     1,     1,     1,     1,     3,     1,     1,     5,     3,
       3,     3,     5,     2,     7,     4,     0,     7,    17,     1,
       3,     0,     2,     4,     1,     3,     0,     0,     4,     0,
       6,     1,     0,     1,     3,     1,     3,     1,     3,     1,
       2,     1,     3,     3,     3,     3,     3,     3,     3,     1,
       3,     1,     3,     1,     3,     1,     3,     1,     3,     1,
       3,     1,     2,     1,     3,     1,     2,     2,     1,     3,
       0,     0,     4,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     0,     0,     0,    40,     4,   113,     9,    11,     1,
       0,     0,     0,    61,     0,    46,    47,     0,     0,     0,
       2,    40,    41,    42,    43,    56,    44,   110,     3,    26,
       0,    72,   105,     0,     0,     0,    89,    91,    93,    95,
      97,    99,   101,   103,   110,     0,     0,     0,    59,   110,
      39,     0,     0,     0,     0,    37,     0,    53,     0,   111,
       0,     0,     0,    16,    10,    15,    25,     0,    28,    12,
       0,    71,    73,     0,   102,    49,     0,     0,     0,     0,
       0,     0,   106,   107,    50,     0,    51,     0,    62,    38,
       0,     0,     0,    75,    77,    79,    81,     0,     0,   110,
      40,     0,    72,     0,    45,   108,     0,    66,    27,    66,
       0,     0,   104,    90,    92,    94,    96,    98,   100,    60,
     110,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   109,     0,     0,    13,
       0,     0,     0,    64,     0,    48,    74,    63,    88,    40,
      76,    78,    82,    84,    85,    86,    83,    87,    40,     0,
      55,   112,    52,     0,    67,     0,    17,     0,    29,     0,
       0,     0,    14,   110,    65,     0,     0,     0,    54,    57,
       0,    68,     6,    69,     6,     0,     0,    18,     6,   110,
      30,     0,     7,    40,     5,    70,    40,   110,     0,    19,
      31,     0,     8,    20,    32,     0,    21,    33,     0,    22,
      34,     0,    23,    35,    40,     0,     0,     0,    24,    36,
      58
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     4,   187,   188,   198,     5,    29,    30,    64,
     163,    65,   107,   175,   193,   203,   206,   209,   212,   215,
      66,    67,    69,   109,   177,   196,   204,   207,   210,   213,
     216,    20,    21,    22,    23,    24,    25,    57,    26,    47,
      48,   142,   143,   173,   189,    70,    71,    92,    93,    94,
      95,    96,    97,    36,    37,    38,    39,    40,    41,    42,
      43,   106,    60,    61,   102,    44
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -156
static const yytype_int16 yypact[] =
{
      31,    44,    44,    34,    55,    31,  -156,  -156,  -156,  -156,
      23,    12,    12,     7,     6,  -156,  -156,    26,    27,    28,
    -156,    55,  -156,  -156,  -156,    42,  -156,    -6,  -156,     1,
      32,    12,  -156,    12,    12,    36,    22,    33,    48,    50,
      56,  -156,    49,  -156,    -6,    71,    44,    74,    67,    75,
    -156,    77,    11,    11,    44,  -156,    76,  -156,    12,  -156,
      72,    80,   103,  -156,  -156,  -156,  -156,    83,  -156,  -156,
      81,    78,  -156,    84,  -156,  -156,    12,    12,    12,    12,
      12,    12,  -156,  -156,  -156,   -12,  -156,    44,  -156,  -156,
      11,    11,    85,    90,    92,  -156,  -156,    53,    86,    75,
      55,    89,    12,    12,  -156,  -156,    91,    19,  -156,    19,
     100,    12,  -156,    33,    48,    50,    56,  -156,  -156,  -156,
      75,    88,    57,  -156,    96,    11,    11,    12,    12,    12,
      12,    12,    12,    97,    98,   101,  -156,   102,   104,  -156,
      44,   129,   106,   107,   108,  -156,  -156,  -156,  -156,    55,
      92,  -156,  -156,  -156,  -156,  -156,  -156,  -156,    55,    12,
    -156,  -156,  -156,   114,  -156,    -3,  -156,   136,  -156,   112,
     113,   120,  -156,    75,  -156,   116,    44,   118,  -156,  -156,
      11,  -156,   144,  -156,   144,   125,    44,  -156,   144,    75,
    -156,    44,  -156,    55,  -156,  -156,    55,    75,   128,  -156,
    -156,   122,  -156,  -156,  -156,    12,  -156,  -156,   126,  -156,
    -156,   127,  -156,  -156,    55,   130,   131,   132,  -156,  -156,
    -156
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -156,  -156,   154,  -155,  -156,  -156,  -156,  -156,  -156,  -156,
    -156,  -156,  -156,  -156,  -156,  -156,  -156,  -156,  -156,  -156,
    -156,  -156,  -156,  -156,  -156,  -156,  -156,  -156,  -156,  -156,
    -156,   -15,  -156,  -156,  -156,  -156,  -156,  -156,  -156,  -156,
     119,    51,    25,  -156,  -156,    65,  -156,   -51,  -156,    43,
     -72,  -156,    -7,  -156,    93,    94,    95,   105,   -38,   138,
    -156,  -156,   -36,   133,  -156,    -1
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
       7,     8,    98,    27,    35,    45,    55,    51,    82,     6,
       6,    32,    49,    88,     6,     6,    32,    32,   119,   123,
      27,    58,    87,    59,    72,   140,    73,   174,    62,   190,
      63,   167,    50,   194,     9,    33,    46,     1,     2,   121,
      90,    33,   117,   118,    34,    49,    91,     6,   141,    34,
      34,   101,    31,    99,   151,    52,    53,    54,     6,    56,
      76,    68,    75,   134,    10,    11,    12,    13,    14,    15,
      16,    17,    77,    18,    19,   127,   128,   129,   130,   127,
     128,   129,   130,   122,   147,   135,   120,   112,    78,   131,
     132,    79,    81,   131,   132,    72,   138,    84,    80,    27,
      86,    87,    58,    89,   146,   103,   104,   100,   105,   108,
     125,   110,   111,   126,   112,   124,   133,   136,   148,   139,
     152,   153,   154,   155,   156,   157,   145,   149,   158,   185,
     162,   159,   161,   160,   169,   140,   166,   181,   168,   164,
     172,   167,   176,   170,   178,   179,   180,   182,    27,   184,
     186,   191,   171,   195,   202,   205,   211,    27,   214,    28,
     144,   201,   218,   219,   220,    85,   165,   137,   150,   113,
       0,   114,    74,   115,     0,   183,     0,    83,   199,     0,
       0,   200,     0,     0,   116,   192,     0,     0,     0,     0,
     197,     0,    27,     0,     0,    27,     0,     0,   208,   217,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27
};

static const yytype_int16 yycheck[] =
{
       1,     2,    53,     4,    11,    12,    21,    14,    44,     3,
       3,     5,    13,    49,     3,     3,     5,     5,    30,    91,
      21,    27,    34,    29,    31,     6,    33,    30,    27,   184,
      29,    34,    26,   188,     0,    29,    29,     6,     7,    90,
      29,    29,    80,    81,    38,    46,    35,     3,    29,    38,
      38,    58,    29,    54,   126,    29,    29,    29,     3,    17,
      38,    29,    26,    99,     9,    10,    11,    12,    13,    14,
      15,    16,    39,    18,    19,    22,    23,    24,    25,    22,
      23,    24,    25,    90,   120,   100,    87,    30,    40,    36,
      37,    41,    43,    36,    37,   102,   103,    26,    42,   100,
      26,    34,    27,    26,   111,    33,    26,    31,     5,    26,
      20,    30,    34,    21,    30,    30,    30,    28,    30,    28,
     127,   128,   129,   130,   131,   132,    26,    31,    31,   180,
      26,    33,    30,    32,   149,     6,    30,   173,    30,   140,
      26,    34,     6,   158,    32,    32,    26,    31,   149,    31,
       6,    26,   159,   189,    26,    33,    30,   158,    31,     5,
     109,   197,    32,    32,    32,    46,   141,   102,   125,    76,
      -1,    77,    34,    78,    -1,   176,    -1,    44,   193,    -1,
      -1,   196,    -1,    -1,    79,   186,    -1,    -1,    -1,    -1,
     191,    -1,   193,    -1,    -1,   196,    -1,    -1,   205,   214,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   214
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     6,     7,    45,    46,    50,     3,   109,   109,     0,
       9,    10,    11,    12,    13,    14,    15,    16,    18,    19,
      75,    76,    77,    78,    79,    80,    82,   109,    46,    51,
      52,    29,     5,    29,    38,    96,    97,    98,    99,   100,
     101,   102,   103,   104,   109,    96,    29,    83,    84,   109,
      26,    96,    29,    29,    29,    75,    17,    81,    27,    29,
     106,   107,    27,    29,    53,    55,    64,    65,    29,    66,
      89,    90,    96,    96,   103,    26,    38,    39,    40,    41,
      42,    43,   106,   107,    26,    84,    26,    34,   106,    26,
      29,    35,    91,    92,    93,    94,    95,    96,    91,   109,
      31,    96,   108,    33,    26,     5,   105,    56,    26,    67,
      30,    34,    30,    98,    99,   100,   101,   102,   102,    30,
     109,    91,    96,    94,    30,    20,    21,    22,    23,    24,
      25,    36,    37,    30,   106,    75,    28,    89,    96,    28,
       6,    29,    85,    86,    85,    26,    96,   106,    30,    31,
      93,    94,    96,    96,    96,    96,    96,    96,    31,    33,
      32,    30,    26,    54,   109,    86,    30,    34,    30,    75,
      75,    96,    26,    87,    30,    57,     6,    68,    32,    32,
      26,   106,    31,   109,    31,    91,     6,    47,    48,    88,
      47,    26,   109,    58,    47,   106,    69,   109,    49,    75,
      75,   106,    26,    59,    70,    33,    60,    71,    96,    61,
      72,    30,    62,    73,    31,    63,    74,    75,    32,    32,
      32
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1455 of yacc.c  */
#line 126 "ExprEval.y"
    { Finish( concatenateInstrSeq((yyvsp[(1) - (2)].InstrSeq), (yyvsp[(2) - (2)].InstrSeq)) ); }
    break;

  case 3:

/* Line 1455 of yacc.c  */
#line 127 "ExprEval.y"
    { (yyval.InstrSeq) = concatenateInstrSeq((yyvsp[(1) - (2)].InstrSeq), (yyvsp[(2) - (2)].InstrSeq)); }
    break;

  case 4:

/* Line 1455 of yacc.c  */
#line 128 "ExprEval.y"
    { (yyval.InstrSeq) = NULL; }
    break;

  case 5:

/* Line 1455 of yacc.c  */
#line 129 "ExprEval.y"
    { (yyval.IdList) = appendIdList((yyvsp[(1) - (2)].IdList), (yyvsp[(2) - (2)].IdList)); }
    break;

  case 6:

/* Line 1455 of yacc.c  */
#line 130 "ExprEval.y"
    { (yyval.IdList) = NULL; }
    break;

  case 7:

/* Line 1455 of yacc.c  */
#line 131 "ExprEval.y"
    { enterName(ProcSymTab, yytext); }
    break;

  case 8:

/* Line 1455 of yacc.c  */
#line 131 "ExprEval.y"
    { (yyval.IdList) = createIdList((yyvsp[(2) - (4)].string), NULL); }
    break;

  case 9:

/* Line 1455 of yacc.c  */
#line 132 "ExprEval.y"
    { enterName(table, yytext); }
    break;

  case 10:

/* Line 1455 of yacc.c  */
#line 132 "ExprEval.y"
    { (yyval.InstrSeq) = makeFunctionLabel((yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].InstrSeq)); free((yyvsp[(2) - (4)].string)); }
    break;

  case 11:

/* Line 1455 of yacc.c  */
#line 133 "ExprEval.y"
    { enterName(table, yytext); }
    break;

  case 12:

/* Line 1455 of yacc.c  */
#line 133 "ExprEval.y"
    { (yyval.InstrSeq) = makeFunctionLabel((yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].InstrSeq)); free((yyvsp[(2) - (4)].string)); }
    break;

  case 13:

/* Line 1455 of yacc.c  */
#line 135 "ExprEval.y"
    { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup(".space"), (yyvsp[(2) - (3)].string))); 
                            }
    break;

  case 14:

/* Line 1455 of yacc.c  */
#line 138 "ExprEval.y"
    { (yyval.InstrSeq) = NULL; }
    break;

  case 15:

/* Line 1455 of yacc.c  */
#line 139 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(1) - (1)].InstrSeq); }
    break;

  case 16:

/* Line 1455 of yacc.c  */
#line 140 "ExprEval.y"
    { inProc = 1; ProcSymTab = createSymTab(33); }
    break;

  case 17:

/* Line 1455 of yacc.c  */
#line 141 "ExprEval.y"
    { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup("int"), NULL)); 
                                GEntry->name = strdup("int");
                            }
    break;

  case 18:

/* Line 1455 of yacc.c  */
#line 146 "ExprEval.y"
    { ProcFormalParameters = (yyvsp[(3) - (7)].IdList); ProcLocalParameters = (yyvsp[(7) - (7)].IdList); }
    break;

  case 19:

/* Line 1455 of yacc.c  */
#line 149 "ExprEval.y"
    { (yyval.InstrSeq) = doIntFunction((yyvsp[(9) - (9)].InstrSeq)); }
    break;

  case 20:

/* Line 1455 of yacc.c  */
#line 150 "ExprEval.y"
    { inProc = 0; destroySymTab(ProcSymTab); }
    break;

  case 21:

/* Line 1455 of yacc.c  */
#line 151 "ExprEval.y"
    { destroyIdList(ProcFormalParameters); ProcFormalParameters = NULL; }
    break;

  case 22:

/* Line 1455 of yacc.c  */
#line 152 "ExprEval.y"
    { destroyIdList(ProcLocalParameters); ProcLocalParameters = NULL; }
    break;

  case 23:

/* Line 1455 of yacc.c  */
#line 153 "ExprEval.y"
    { free(GEntry->name); GEntry->name = NULL; }
    break;

  case 24:

/* Line 1455 of yacc.c  */
#line 155 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(10) - (15)].InstrSeq); }
    break;

  case 25:

/* Line 1455 of yacc.c  */
#line 156 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(1) - (1)].InstrSeq); }
    break;

  case 26:

/* Line 1455 of yacc.c  */
#line 157 "ExprEval.y"
    { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup(".word"), strdup("0"))); 
                            }
    break;

  case 27:

/* Line 1455 of yacc.c  */
#line 160 "ExprEval.y"
    { (yyval.InstrSeq) = NULL; }
    break;

  case 28:

/* Line 1455 of yacc.c  */
#line 161 "ExprEval.y"
    { inProc = 1; ProcSymTab = createSymTab(33); }
    break;

  case 29:

/* Line 1455 of yacc.c  */
#line 162 "ExprEval.y"
    { 
                                setCurrentAttr( table, (void *) createTableAttr(strdup("void"), NULL)); 
                                GEntry->name = strdup("void");
                            }
    break;

  case 30:

/* Line 1455 of yacc.c  */
#line 167 "ExprEval.y"
    { ProcFormalParameters = (yyvsp[(3) - (7)].IdList); ProcLocalParameters = (yyvsp[(7) - (7)].IdList); }
    break;

  case 31:

/* Line 1455 of yacc.c  */
#line 170 "ExprEval.y"
    { (yyval.InstrSeq) = doVoidFunction((yyvsp[(9) - (9)].InstrSeq)); }
    break;

  case 32:

/* Line 1455 of yacc.c  */
#line 171 "ExprEval.y"
    { inProc = 0; destroySymTab(ProcSymTab); }
    break;

  case 33:

/* Line 1455 of yacc.c  */
#line 172 "ExprEval.y"
    { destroyIdList(ProcFormalParameters); ProcFormalParameters = NULL; }
    break;

  case 34:

/* Line 1455 of yacc.c  */
#line 173 "ExprEval.y"
    { destroyIdList(ProcLocalParameters); ProcLocalParameters = NULL; }
    break;

  case 35:

/* Line 1455 of yacc.c  */
#line 174 "ExprEval.y"
    { free(GEntry->name); GEntry->name = NULL; }
    break;

  case 36:

/* Line 1455 of yacc.c  */
#line 176 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(10) - (15)].InstrSeq); }
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 177 "ExprEval.y"
    { (yyval.InstrSeq) = AppendSeq((yyvsp[(1) - (2)].InstrSeq), (yyvsp[(2) - (2)].InstrSeq)); }
    break;

  case 38:

/* Line 1455 of yacc.c  */
#line 178 "ExprEval.y"
    { (yyval.InstrSeq) = createReturnStmt((yyvsp[(2) - (3)].ExprRes)); }
    break;

  case 39:

/* Line 1455 of yacc.c  */
#line 179 "ExprEval.y"
    { (yyval.InstrSeq) = createReturnStmt(NULL); }
    break;

  case 40:

/* Line 1455 of yacc.c  */
#line 180 "ExprEval.y"
    { (yyval.InstrSeq) = NULL; }
    break;

  case 41:

/* Line 1455 of yacc.c  */
#line 181 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(1) - (1)].InstrSeq); }
    break;

  case 42:

/* Line 1455 of yacc.c  */
#line 182 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(1) - (1)].InstrSeq); }
    break;

  case 43:

/* Line 1455 of yacc.c  */
#line 183 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(1) - (1)].InstrSeq); }
    break;

  case 44:

/* Line 1455 of yacc.c  */
#line 184 "ExprEval.y"
    { (yyval.InstrSeq) = (yyvsp[(1) - (1)].InstrSeq); }
    break;

  case 45:

/* Line 1455 of yacc.c  */
#line 185 "ExprEval.y"
    {   
                                                                        struct ExprRes * res = doRvalFunc((yyvsp[(1) - (3)].string), (yyvsp[(2) - (3)].ExprResList)); 
                                                                        struct InstrSeq * seq = res->Instrs; 
                                                                        (yyval.InstrSeq) = seq;
                                                                        ReleaseTmpReg(res->Reg); free(res); free((yyvsp[(1) - (3)].string)); 
                                                                    }
    break;

  case 46:

/* Line 1455 of yacc.c  */
#line 191 "ExprEval.y"
    { (yyval.InstrSeq) = NULL; }
    break;

  case 47:

/* Line 1455 of yacc.c  */
#line 192 "ExprEval.y"
    { (yyval.InstrSeq) = NULL; }
    break;

  case 48:

/* Line 1455 of yacc.c  */
#line 193 "ExprEval.y"
    { (yyval.InstrSeq) = doPrintExprResList((yyvsp[(3) - (5)].ExprResList)); }
    break;

  case 49:

/* Line 1455 of yacc.c  */
#line 195 "ExprEval.y"
    { (yyval.InstrSeq) = doPrintLines((yyvsp[(2) - (3)].ExprRes)); }
    break;

  case 50:

/* Line 1455 of yacc.c  */
#line 196 "ExprEval.y"
    { (yyval.InstrSeq) = doPrintSpaces((yyvsp[(2) - (3)].ExprRes)); }
    break;

  case 51:

/* Line 1455 of yacc.c  */
#line 197 "ExprEval.y"
    { (yyval.InstrSeq) = doReadIdList((yyvsp[(2) - (3)].IdList)); }
    break;

  case 52:

/* Line 1455 of yacc.c  */
#line 198 "ExprEval.y"
    { (yyval.InstrSeq) = doAssign((yyvsp[(1) - (5)].string), (yyvsp[(2) - (5)].ExprRes), (yyvsp[(4) - (5)].ExprRes)); free((yyvsp[(1) - (5)].string)); }
    break;

  case 53:

/* Line 1455 of yacc.c  */
#line 199 "ExprEval.y"
    { (yyval.InstrSeq) = doIfElse((yyvsp[(1) - (2)].ExprRes), (yyvsp[(2) - (2)].InstrSeq)); }
    break;

  case 54:

/* Line 1455 of yacc.c  */
#line 200 "ExprEval.y"
    { (yyval.ExprRes) = doIf((yyvsp[(3) - (7)].ExprRes), (yyvsp[(6) - (7)].InstrSeq)); }
    break;

  case 55:

/* Line 1455 of yacc.c  */
#line 201 "ExprEval.y"
    { (yyval.InstrSeq) = doElse((yyvsp[(3) - (4)].InstrSeq)); }
    break;

  case 56:

/* Line 1455 of yacc.c  */
#line 202 "ExprEval.y"
    { (yyval.InstrSeq) = NULL; }
    break;

  case 57:

/* Line 1455 of yacc.c  */
#line 203 "ExprEval.y"
    { (yyval.InstrSeq) = doWhileLoop((yyvsp[(3) - (7)].ExprRes), (yyvsp[(6) - (7)].InstrSeq)); }
    break;

  case 58:

/* Line 1455 of yacc.c  */
#line 208 "ExprEval.y"
    {   (yyval.InstrSeq) = doForLoop(doAssign((yyvsp[(3) - (17)].string), (yyvsp[(4) - (17)].ExprRes), (yyvsp[(6) - (17)].ExprRes)), 
                                                                                     (yyvsp[(8) - (17)].ExprRes), 
                                                                                     doAssign((yyvsp[(10) - (17)].string), (yyvsp[(11) - (17)].ExprRes), (yyvsp[(13) - (17)].ExprRes)), 
                                                                                     (yyvsp[(16) - (17)].InstrSeq)); 
                                                                        free((yyvsp[(3) - (17)].string)); 
                                                                        free((yyvsp[(10) - (17)].string));
                                                                    }
    break;

  case 59:

/* Line 1455 of yacc.c  */
#line 215 "ExprEval.y"
    { (yyval.IdList) = (yyvsp[(1) - (1)].IdList); }
    break;

  case 60:

/* Line 1455 of yacc.c  */
#line 216 "ExprEval.y"
    { (yyval.IdList) = (yyvsp[(2) - (3)].IdList); }
    break;

  case 61:

/* Line 1455 of yacc.c  */
#line 217 "ExprEval.y"
    { (yyval.IdList) = NULL; }
    break;

  case 62:

/* Line 1455 of yacc.c  */
#line 218 "ExprEval.y"
    { (yyval.IdList) = createIdList((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].ExprRes)); }
    break;

  case 63:

/* Line 1455 of yacc.c  */
#line 219 "ExprEval.y"
    { (yyval.IdList) = appendIdList((yyvsp[(1) - (4)].IdList), createIdList((yyvsp[(3) - (4)].string), (yyvsp[(4) - (4)].ExprRes))); }
    break;

  case 64:

/* Line 1455 of yacc.c  */
#line 220 "ExprEval.y"
    { (yyval.IdList) = (yyvsp[(1) - (1)].IdList); }
    break;

  case 65:

/* Line 1455 of yacc.c  */
#line 221 "ExprEval.y"
    { (yyval.IdList) = (yyvsp[(2) - (3)].IdList); }
    break;

  case 66:

/* Line 1455 of yacc.c  */
#line 222 "ExprEval.y"
    { (yyval.IdList) = NULL; }
    break;

  case 67:

/* Line 1455 of yacc.c  */
#line 223 "ExprEval.y"
    { enterName(ProcSymTab, yytext); }
    break;

  case 68:

/* Line 1455 of yacc.c  */
#line 224 "ExprEval.y"
    { (yyval.IdList) = createIdList((yyvsp[(2) - (4)].string), (yyvsp[(4) - (4)].ExprRes)); }
    break;

  case 69:

/* Line 1455 of yacc.c  */
#line 225 "ExprEval.y"
    { enterName(ProcSymTab, yytext); }
    break;

  case 70:

/* Line 1455 of yacc.c  */
#line 226 "ExprEval.y"
    { (yyval.IdList) = appendIdList((yyvsp[(1) - (6)].IdList), createIdList((yyvsp[(4) - (6)].string), (yyvsp[(6) - (6)].ExprRes))); }
    break;

  case 71:

/* Line 1455 of yacc.c  */
#line 227 "ExprEval.y"
    { (yyval.ExprResList) = (yyvsp[(1) - (1)].ExprResList); }
    break;

  case 72:

/* Line 1455 of yacc.c  */
#line 228 "ExprEval.y"
    { (yyval.ExprResList) = NULL; }
    break;

  case 73:

/* Line 1455 of yacc.c  */
#line 229 "ExprEval.y"
    { (yyval.ExprResList) = createExprResList((yyvsp[(1) - (1)].ExprRes)); }
    break;

  case 74:

/* Line 1455 of yacc.c  */
#line 230 "ExprEval.y"
    { (yyval.ExprResList) = appendExprResList((yyvsp[(1) - (3)].ExprResList), createExprResList((yyvsp[(3) - (3)].ExprRes))); }
    break;

  case 75:

/* Line 1455 of yacc.c  */
#line 231 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 76:

/* Line 1455 of yacc.c  */
#line 232 "ExprEval.y"
    { (yyval.ExprRes) = doBExprOR((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 77:

/* Line 1455 of yacc.c  */
#line 233 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 78:

/* Line 1455 of yacc.c  */
#line 234 "ExprEval.y"
    { (yyval.ExprRes) = doBExprAND((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 79:

/* Line 1455 of yacc.c  */
#line 235 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 80:

/* Line 1455 of yacc.c  */
#line 236 "ExprEval.y"
    { (yyval.ExprRes) = doBExprNOT((yyvsp[(2) - (2)].ExprRes)); }
    break;

  case 81:

/* Line 1455 of yacc.c  */
#line 237 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 82:

/* Line 1455 of yacc.c  */
#line 238 "ExprEval.y"
    { (yyval.ExprRes) = doRExprNOTEQ((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 83:

/* Line 1455 of yacc.c  */
#line 239 "ExprEval.y"
    { (yyval.ExprRes) = doRExprGT((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 84:

/* Line 1455 of yacc.c  */
#line 240 "ExprEval.y"
    { (yyval.ExprRes) = doRExprGTEQ((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 85:

/* Line 1455 of yacc.c  */
#line 241 "ExprEval.y"
    { (yyval.ExprRes) = doRExprEQ((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 86:

/* Line 1455 of yacc.c  */
#line 242 "ExprEval.y"
    { (yyval.ExprRes) = doRExprLTEQ((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 87:

/* Line 1455 of yacc.c  */
#line 243 "ExprEval.y"
    { (yyval.ExprRes) = doRExprLT((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 88:

/* Line 1455 of yacc.c  */
#line 244 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(2) - (3)].ExprRes); }
    break;

  case 89:

/* Line 1455 of yacc.c  */
#line 245 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 90:

/* Line 1455 of yacc.c  */
#line 246 "ExprEval.y"
    { (yyval.ExprRes) = doSub((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 91:

/* Line 1455 of yacc.c  */
#line 247 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 92:

/* Line 1455 of yacc.c  */
#line 248 "ExprEval.y"
    { (yyval.ExprRes) = doAdd((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 93:

/* Line 1455 of yacc.c  */
#line 249 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 94:

/* Line 1455 of yacc.c  */
#line 250 "ExprEval.y"
    { (yyval.ExprRes) = doModulus((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 95:

/* Line 1455 of yacc.c  */
#line 251 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 96:

/* Line 1455 of yacc.c  */
#line 252 "ExprEval.y"
    { (yyval.ExprRes) = doDiv((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 97:

/* Line 1455 of yacc.c  */
#line 253 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 98:

/* Line 1455 of yacc.c  */
#line 254 "ExprEval.y"
    { (yyval.ExprRes) = doMult((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 99:

/* Line 1455 of yacc.c  */
#line 255 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 100:

/* Line 1455 of yacc.c  */
#line 256 "ExprEval.y"
    { (yyval.ExprRes) = doExpo((yyvsp[(1) - (3)].ExprRes), (yyvsp[(3) - (3)].ExprRes)); }
    break;

  case 101:

/* Line 1455 of yacc.c  */
#line 257 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 102:

/* Line 1455 of yacc.c  */
#line 258 "ExprEval.y"
    { (yyval.ExprRes) = doUnaryMinus((yyvsp[(2) - (2)].ExprRes)); }
    break;

  case 103:

/* Line 1455 of yacc.c  */
#line 259 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(1) - (1)].ExprRes); }
    break;

  case 104:

/* Line 1455 of yacc.c  */
#line 260 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(2) - (3)].ExprRes); }
    break;

  case 105:

/* Line 1455 of yacc.c  */
#line 261 "ExprEval.y"
    { (yyval.ExprRes) = doIntLit(yytext); }
    break;

  case 106:

/* Line 1455 of yacc.c  */
#line 262 "ExprEval.y"
    { (yyval.ExprRes) = doRval((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].ExprRes)); free((yyvsp[(1) - (2)].string)); }
    break;

  case 107:

/* Line 1455 of yacc.c  */
#line 263 "ExprEval.y"
    { (yyval.ExprRes) = doRvalFunc((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].ExprResList)); free((yyvsp[(1) - (2)].string)); }
    break;

  case 108:

/* Line 1455 of yacc.c  */
#line 265 "ExprEval.y"
    { (yyval.string) = strdup(yytext); }
    break;

  case 109:

/* Line 1455 of yacc.c  */
#line 266 "ExprEval.y"
    { (yyval.ExprRes) = (yyvsp[(2) - (3)].ExprRes); }
    break;

  case 110:

/* Line 1455 of yacc.c  */
#line 267 "ExprEval.y"
    { (yyval.ExprRes) = NULL; }
    break;

  case 111:

/* Line 1455 of yacc.c  */
#line 269 "ExprEval.y"
    {   
                                //if (GEntry->attribute) free(GEntry->attribute);
                                GEntry->attribute = (void *) SaveSeq();
                            }
    break;

  case 112:

/* Line 1455 of yacc.c  */
#line 273 "ExprEval.y"
    { (yyval.ExprResList) = (yyvsp[(3) - (4)].ExprResList); }
    break;

  case 113:

/* Line 1455 of yacc.c  */
#line 275 "ExprEval.y"
    { (yyval.string) = strdup(yytext); }
    break;



/* Line 1455 of yacc.c  */
#line 2416 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 277 "ExprEval.y"


int yyerror(char * s) {
    writeIndicator(getCurrentColumnNum());
    writeMessage("Illegal Character in YACC");
    writeMessage(s);
    return 1;
}

