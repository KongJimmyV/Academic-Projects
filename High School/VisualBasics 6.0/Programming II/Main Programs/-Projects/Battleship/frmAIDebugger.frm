VERSION 5.00
Begin VB.Form frmAIDebugger 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "AI Debugger"
   ClientHeight    =   3735
   ClientLeft      =   -90
   ClientTop       =   2685
   ClientWidth     =   4575
   Icon            =   "frmAIDebugger.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3735
   ScaleWidth      =   4575
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrAIStats 
      Interval        =   10
      Left            =   0
      Top             =   840
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   99
      Left            =   0
      TabIndex        =   100
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   98
      Left            =   0
      TabIndex        =   99
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   97
      Left            =   0
      TabIndex        =   98
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   96
      Left            =   0
      TabIndex        =   97
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   95
      Left            =   0
      TabIndex        =   96
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   94
      Left            =   0
      TabIndex        =   95
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   93
      Left            =   0
      TabIndex        =   94
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   92
      Left            =   0
      TabIndex        =   93
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   91
      Left            =   0
      TabIndex        =   92
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   90
      Left            =   0
      TabIndex        =   91
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   89
      Left            =   0
      TabIndex        =   90
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   88
      Left            =   0
      TabIndex        =   89
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   87
      Left            =   0
      TabIndex        =   88
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   86
      Left            =   0
      TabIndex        =   87
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   85
      Left            =   0
      TabIndex        =   86
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   84
      Left            =   0
      TabIndex        =   85
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   83
      Left            =   0
      TabIndex        =   84
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   82
      Left            =   0
      TabIndex        =   83
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   81
      Left            =   0
      TabIndex        =   82
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   80
      Left            =   0
      TabIndex        =   81
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   79
      Left            =   0
      TabIndex        =   80
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   78
      Left            =   0
      TabIndex        =   79
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   77
      Left            =   0
      TabIndex        =   78
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   76
      Left            =   0
      TabIndex        =   77
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   75
      Left            =   0
      TabIndex        =   76
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   74
      Left            =   0
      TabIndex        =   75
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   73
      Left            =   0
      TabIndex        =   74
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   72
      Left            =   0
      TabIndex        =   73
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   71
      Left            =   0
      TabIndex        =   72
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   70
      Left            =   0
      TabIndex        =   71
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   69
      Left            =   0
      TabIndex        =   70
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   68
      Left            =   0
      TabIndex        =   69
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   67
      Left            =   0
      TabIndex        =   68
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   66
      Left            =   0
      TabIndex        =   67
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   65
      Left            =   0
      TabIndex        =   66
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   64
      Left            =   0
      TabIndex        =   65
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   63
      Left            =   0
      TabIndex        =   64
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   62
      Left            =   0
      TabIndex        =   63
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   61
      Left            =   0
      TabIndex        =   62
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   60
      Left            =   0
      TabIndex        =   61
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   59
      Left            =   0
      TabIndex        =   60
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   58
      Left            =   0
      TabIndex        =   59
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   57
      Left            =   0
      TabIndex        =   58
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   56
      Left            =   0
      TabIndex        =   57
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   55
      Left            =   0
      TabIndex        =   56
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   54
      Left            =   0
      TabIndex        =   55
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   53
      Left            =   0
      TabIndex        =   54
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   52
      Left            =   0
      TabIndex        =   53
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   51
      Left            =   0
      TabIndex        =   52
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   50
      Left            =   0
      TabIndex        =   51
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   49
      Left            =   0
      TabIndex        =   50
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   48
      Left            =   0
      TabIndex        =   49
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   47
      Left            =   0
      TabIndex        =   48
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   46
      Left            =   0
      TabIndex        =   47
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   45
      Left            =   0
      TabIndex        =   46
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   44
      Left            =   0
      TabIndex        =   45
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   43
      Left            =   0
      TabIndex        =   44
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   42
      Left            =   0
      TabIndex        =   43
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   41
      Left            =   0
      TabIndex        =   42
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   40
      Left            =   0
      TabIndex        =   41
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   39
      Left            =   0
      TabIndex        =   40
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   38
      Left            =   0
      TabIndex        =   39
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   37
      Left            =   0
      TabIndex        =   38
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   36
      Left            =   0
      TabIndex        =   37
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   35
      Left            =   0
      TabIndex        =   36
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   34
      Left            =   0
      TabIndex        =   35
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   33
      Left            =   0
      TabIndex        =   34
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   32
      Left            =   0
      TabIndex        =   33
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   31
      Left            =   0
      TabIndex        =   32
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   30
      Left            =   0
      TabIndex        =   31
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   29
      Left            =   0
      TabIndex        =   30
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   28
      Left            =   0
      TabIndex        =   29
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   27
      Left            =   0
      TabIndex        =   28
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   26
      Left            =   0
      TabIndex        =   27
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   25
      Left            =   0
      TabIndex        =   26
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   24
      Left            =   0
      TabIndex        =   25
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   23
      Left            =   0
      TabIndex        =   24
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   22
      Left            =   0
      TabIndex        =   23
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   21
      Left            =   0
      TabIndex        =   22
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   20
      Left            =   0
      TabIndex        =   21
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   19
      Left            =   0
      TabIndex        =   20
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   18
      Left            =   0
      TabIndex        =   19
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   17
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   16
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   15
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   14
      Left            =   0
      TabIndex        =   15
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   13
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   12
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   11
      Left            =   0
      TabIndex        =   12
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   10
      Left            =   0
      TabIndex        =   11
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   0
      TabIndex        =   6
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblGridInfo 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   480
      TabIndex        =   0
      Top             =   480
      Width           =   375
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Debugger"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   480
      TabIndex        =   1
      Top             =   240
      Width           =   3615
   End
End
Attribute VB_Name = "frmAIDebugger"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim IntFactor As Integer
Dim DefaultCellSize As Integer
Dim iConstantVar As Integer


Private Sub Form_Load()

IntFactor = 0
DefaultCellSize = 375
iConstantVar = 3

    'Step 0: Font
    For n = 0 To 99
        lblGridInfo(n).FontSize = 8
    Next n
    
    'Step 1: Load
    With frmAIDebugger
        For t = 0 To (-1 + (XDefinition * YDefinition))
            .lblGridInfo(t).Height = DefaultCellSize + iConstantVar
            .lblGridInfo(t).Width = DefaultCellSize + iConstantVar
            .lblGridInfo(t).Visible = False
            .lblGridInfo(t).Enabled = False
        Next t
    End With
    
    'Step 2: Array Labels
    For n = 0 To (-1 + (XDefinition * YDefinition))
        With frmAIDebugger
            'C = (i Mod XMaze)
            'R = YMaze - (i \ XMaze + 1)
            'Maze(YMaze - (n \ YDefinition + 1), n Mod XDefinition + 1) = 1
            'Maze(R, C) = 1
            '.lblGridInfo(n).Tag = ""
            .lblGridInfo(n).Visible = True
            .lblGridInfo(n).Enabled = True
            .lblGridInfo(n).Left = IntFactor + .lblGridInfo(0).Width * (n Mod XDefinition)   ' * (i Mod YMaze + 1 - 1)
            .lblGridInfo(n).Top = IntFactor + .lblGridInfo(0).Height * (n \ XDefinition) + (.Label1.Height)   ' * (n \ XDefinition + 1 - 1)
        End With
    Next n
    
    'Step 3: Set Form/Other Size
    With frmAIDebugger
        .Width = IntFactor + (.lblGridInfo(0).Width * (XDefinition)) + IntFactor + 245
        .Height = IntFactor + (.lblGridInfo(0).Height * (YDefinition)) + IntFactor + 580 + .Label1.Height
        
        .Label1.Left = 0
        .Label1.Top = 0
        .Label1.Width = IntFactor + (.lblGridInfo(0).Width * (XDefinition)) + IntFactor + 10
        
    End With
    
End Sub

Private Sub tmrAIStats_Timer()

If 1 = 1 Then
    For R = 9 To 0 Step -1
        For C = 0 To 9
            IndexGrid = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
            If AIMap(R, C) > 0 Then
                If AIMap(R, C) > 0 And AIMap(R, C) <= 255 Then
                    lblGridInfo(IndexGrid).BackColor = &H8000000F
                    lblGridInfo(IndexGrid).ForeColor = RGB(255, AIMap(R, C), 255 - AIMap(R, C))
                    lblGridInfo(IndexGrid).Caption = AIMap(R, C)
                End If
            ElseIf AIMap(R, C) <= 0 Then
                lblGridInfo(IndexGrid).BackColor = &H8000000F
                lblGridInfo(IndexGrid).ForeColor = &H0&
                lblGridInfo(IndexGrid).Caption = AIMap(R, C)
            End If
            
            Select Case Grid(R, C)
                Case -2, -1
                    lblGridInfo(IndexGrid).BackColor = vbRed
                    lblGridInfo(IndexGrid).ForeColor = vbBlack
                Case 0
                    lblGridInfo(IndexGrid).BackColor = &H8000000F
                Case 1 To 5
                    lblGridInfo(IndexGrid).BackColor = &H8000000F
                Case 6
                    lblGridInfo(IndexGrid).BackColor = vbRed
                    lblGridInfo(IndexGrid).ForeColor = vbBlack
                Case 7
                    lblGridInfo(IndexGrid).BackColor = vbBlack
                    lblGridInfo(IndexGrid).ForeColor = RGB(255, 255, 255)
                    lblGridInfo(IndexGrid).Caption = AIMap(R, C)
            End Select
            
        If TurnAI = True Or 1 = 0 Then
            X = (ITemp Mod 10)
            Y = 10 - (ITemp \ 10 + 1)
            
            If AIMap(Y, X) <> 0 Then
                lblGridInfo(I).ForeColor = vbGreen
                lblGridInfo(I).Caption = AIMap(R, C)
            Else
                lblGridInfo(I).ForeColor = &H80000012
                lblGridInfo(I).Caption = AIMap(R, C)
            End If
        End If
            lblGridInfo(IndexGrid).Caption = AIMap(R, C)
        Next C
    Next R
End If

If 1 = 0 Then
    For R = 9 To 0 Step -1
        For C = 0 To 9
            IndexGrid = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
            If frmBattleship.imgWater(IndexGrid).Tag = "Void" Then
                lblGridInfo(IndexGrid).ForeColor = vbRed
                lblGridInfo(IndexGrid).Caption = frmBattleship.imgWater(IndexGrid).Tag
            Else
                lblGridInfo(IndexGrid).ForeColor = &H80000012
                lblGridInfo(IndexGrid).Caption = frmBattleship.imgWater(IndexGrid).Tag
            End If
            
        If TurnAI = True Then
            X = (IndexGrid Mod 10)
            Y = 10 - (IndexGrid \ 10 + 1)
            
            If Grid(Y, X) = 6 Or Grid(Y, X) = -1 Or Grid(Y, X) = -2 Then
                lblGridInfo(IndexGrid).ForeColor = vbGreen
                lblGridInfo(IndexGrid).Caption = frmBattleship.imgWater(IndexGrid).Tag
            Else
                lblGridInfo(IndexGrid).ForeColor = &H80000012
                lblGridInfo(IndexGrid).Caption = frmBattleship.imgWater(IndexGrid).Tag
            End If
        End If
            lblGridInfo(IndexGrid).Caption = frmBattleship.imgWater(IndexGrid).Tag
        Next C
    Next R
End If

End Sub
