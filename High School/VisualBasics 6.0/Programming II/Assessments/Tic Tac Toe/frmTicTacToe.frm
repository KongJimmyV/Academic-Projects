VERSION 5.00
Begin VB.Form frmTicTacToe 
   Caption         =   "Tic-Tac-Toe"
   ClientHeight    =   12150
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   13215
   LinkTopic       =   "Form1"
   ScaleHeight     =   12150
   ScaleWidth      =   13215
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Left            =   120
      Top             =   1560
   End
   Begin VB.CommandButton cmdNewGame 
      Caption         =   "New Game"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5880
      TabIndex        =   9
      Top             =   1200
      Width           =   1575
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   8
      Left            =   7920
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   2760
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   7
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   2760
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   6
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   2760
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   5
      Left            =   7920
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   4920
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   4
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   4920
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   3
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   4920
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   2
      Left            =   7920
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   7080
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   1
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   7080
      Width           =   2055
   End
   Begin VB.CommandButton cmdTick 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   90
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Index           =   0
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   7080
      Width           =   2055
   End
   Begin VB.Label lblTurn 
      Caption         =   "Turn: X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   10
      Top             =   1560
      Width           =   2055
   End
   Begin VB.Line lneInnerBottom 
      X1              =   3120
      X2              =   10200
      Y1              =   6960
      Y2              =   6960
   End
   Begin VB.Line lneInnerTop 
      X1              =   3120
      X2              =   10200
      Y1              =   4800
      Y2              =   4800
   End
   Begin VB.Line lneInnerRight 
      X1              =   7800
      X2              =   7800
      Y1              =   2520
      Y2              =   9240
   End
   Begin VB.Line lneInnerLeft 
      X1              =   5520
      X2              =   5520
      Y1              =   2520
      Y2              =   9240
   End
   Begin VB.Menu mnuNewGame 
      Caption         =   "New Game"
   End
End
Attribute VB_Name = "frmTicTacToe"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'cmdTick Vars
Dim Index As Integer
'Game Vars
Dim TurnCount As Integer
Dim GameCount As Integer
Dim P1Char As String
Dim P2Char As String


Private Sub cmdTick_Click(Index As Integer)

    'Xs
    If GameCount Mod 2 = 1 Then
        TurnCount = TurnCount + 1
        If TurnCount Mod 2 = 1 Then
            cmdTick(Index).Caption = P1Char
        Else
            cmdTick(Index).Caption = P2Char
        End If
    End If
    
    'Os
    If GameCount Mod 2 = 0 Then
        TurnCount = TurnCount + 1
        If TurnCount Mod 2 = 0 Then
            cmdTick(Index).Caption = P1Char
        Else
            cmdTick(Index).Caption = P2Char
        End If
    End If
    
        cmdTick(Index).Enabled = False
        
    '''Diagonal Win Check'''
    'Xs
    If (cmdTick(0).Caption = P1Char And cmdTick(4).Caption = P1Char And cmdTick(8).Caption = P1Char) Or (cmdTick(2).Caption = P1Char And cmdTick(4).Caption = P1Char And cmdTick(6).Caption = P1Char) Then
        If (cmdTick(0).Caption = P1Char And cmdTick(4).Caption = P1Char And cmdTick(8).Caption = P1Char) Then
            MsgBox "X's win!.", vbOKOnly, "X's win"
        End If
        If (cmdTick(2).Caption = P1Char And cmdTick(4).Caption = P1Char And cmdTick(6).Caption = P1Char) Then
            MsgBox "X's win!.", vbOKOnly, "X's win"
        End If
    End If
    
    
    
    'TurnCount Win Check  ORIGINAL
    If TurnCount >= 5 Then
        'P1 Wins
        If cmdTick(0).Caption = P1Char And c Then
        End If
    End If
    
End Sub

Private Sub cmdNewGame_Click()

    TurnCount = 0
    GameCount = GameCount + 1
    For I = 0 To 8
        cmdTick(I).Caption = ""
        cmdTick(I).Enabled = True
    Next I
    
End Sub

Private Sub Form_Load()

    P1Char = "X"
    P2Char = "O"
    
    GameCount = 1
    
End Sub

Private Sub mnuNewGame_Click()

    TurnCount = 0
    GameCount = GameCount + 1
    For I = 0 To 8
        cmdTick(I).Caption = ""
        cmdTick(I).Enabled = True
    Next I
    
End Sub
