VERSION 5.00
Begin VB.Form frmTicTacToeV3 
   BackColor       =   &H00000000&
   Caption         =   "Tic-Tac-Toe"
   ClientHeight    =   9510
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   10470
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   9510
   ScaleWidth      =   10470
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtP2Char 
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   23
      Text            =   "O"
      Top             =   1680
      Width           =   1575
   End
   Begin VB.TextBox txtP1Char 
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   22
      Text            =   "X"
      Top             =   1320
      Width           =   1575
   End
   Begin VB.Frame fraAIDifficulty 
      BackColor       =   &H00000000&
      Caption         =   "AI Difficulty"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   3495
      Left            =   360
      TabIndex        =   17
      Top             =   5280
      Width           =   2535
      Begin VB.OptionButton opt4Impossible 
         BackColor       =   &H00000000&
         Caption         =   "Very Hard"
         ForeColor       =   &H000080FF&
         Height          =   375
         Left            =   120
         TabIndex        =   21
         Top             =   2760
         Width           =   2295
      End
      Begin VB.OptionButton opt3Hard 
         BackColor       =   &H00000000&
         Caption         =   "Hard"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   20
         Top             =   2040
         Width           =   2295
      End
      Begin VB.OptionButton opt2Normal 
         BackColor       =   &H00000000&
         Caption         =   "Normal"
         Enabled         =   0   'False
         ForeColor       =   &H0000FFFF&
         Height          =   375
         Left            =   120
         TabIndex        =   19
         Top             =   1320
         Width           =   2295
      End
      Begin VB.OptionButton opt1Easy 
         BackColor       =   &H00000000&
         Caption         =   "Easy"
         ForeColor       =   &H0000FF00&
         Height          =   375
         Left            =   120
         TabIndex        =   18
         Top             =   600
         Width           =   2295
      End
   End
   Begin VB.Timer tmrAI1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   120
      Top             =   3840
   End
   Begin VB.Timer tmrAI2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   120
      Top             =   4320
   End
   Begin VB.Timer tmrTurn 
      Interval        =   25
      Left            =   120
      Top             =   1320
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
      Index           =   9
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
      Index           =   8
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
      Index           =   7
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
      Index           =   6
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
      Index           =   5
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
      Index           =   4
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
      Index           =   3
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
      Index           =   2
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
      Index           =   1
      Left            =   3360
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   7080
      Width           =   2055
   End
   Begin VB.Label lblGridArrayDis2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "GridArray(R ,C ) = G"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   16
      Top             =   4320
      Width           =   2175
   End
   Begin VB.Label lblGridArrayDis1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "GridArray(R ,C ) = G"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   15
      Top             =   3840
      Width           =   2175
   End
   Begin VB.Label lblCatsCount 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Cat's Games: 0"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   14
      Top             =   3120
      Width           =   2175
   End
   Begin VB.Label lblOwins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "O: 0"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   13
      Top             =   2760
      Width           =   2175
   End
   Begin VB.Label lblXwins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "X: 0"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   12
      Top             =   2400
      Width           =   2175
   End
   Begin VB.Label lblWins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wins"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   11
      Top             =   2040
      Width           =   2175
   End
   Begin VB.Label lblTurn 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Turn: _"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   600
      TabIndex        =   10
      Top             =   1320
      Width           =   2175
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
   Begin VB.Menu mnuShowGrid 
      Caption         =   "Show Grid"
   End
   Begin VB.Menu mnuAISettings 
      Caption         =   "AI Settings"
      Begin VB.Menu mnuEnableAI1 
         Caption         =   "Enable AI P1"
      End
      Begin VB.Menu mnuAIDifficultyP1 
         Caption         =   "P1 AI Difficulty"
         Begin VB.Menu mnu1EasyP1 
            Caption         =   "Easy"
         End
         Begin VB.Menu mnu2NormalP1 
            Caption         =   "Normal"
            Enabled         =   0   'False
         End
         Begin VB.Menu mnu3HardP1 
            Caption         =   "Hard"
         End
         Begin VB.Menu mnu4ImpossibleP1 
            Caption         =   "Very Hard"
         End
      End
      Begin VB.Menu mnuEnableAI2 
         Caption         =   "Enable AI P2"
      End
      Begin VB.Menu mnuAIDifficultyP2 
         Caption         =   "P2 AI Difficulty"
         Begin VB.Menu mnu1EasyP2 
            Caption         =   "Easy"
         End
         Begin VB.Menu mnu2NormalP2 
            Caption         =   "Normal"
            Enabled         =   0   'False
         End
         Begin VB.Menu mnu3HardP2 
            Caption         =   "Hard"
         End
         Begin VB.Menu mnu4ImpossibleP2 
            Caption         =   "Very Hard"
         End
      End
      Begin VB.Menu mnuDisableAi 
         Caption         =   "Disable AI"
      End
   End
   Begin VB.Menu mnuDebugAIE 
      Caption         =   "Enable Debug AI"
   End
   Begin VB.Menu mnuDebugAID 
      Caption         =   "Disable Debug AI"
   End
End
Attribute VB_Name = "frmTicTacToeV3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'cmdTick Vars
Dim Index As Integer
'Count Vars
Dim XwinCount As Integer
Dim OwinCount As Integer
Dim CatsCount As Integer
'Game Vars
Dim GameOn As Integer  '1=off,2=on
Dim TurnCount As Integer
Dim GameCount As Integer
Dim P1Char As String
Dim P2Char As String
Dim Winner As Boolean
Dim GridArray(1 To 3, 1 To 3) As Integer 'Grid
Dim R As Integer  'horizontal
Dim C As Integer  'vertical
Dim W As Single  'Index
Dim upperbound As Integer
Dim lowerbound As Integer
Dim PNum As Integer
Dim ONum As Integer
'AI Vars
Dim AIDifP1 As Integer    '1=easy,2=normal,3=hard,4=impossible
Dim AIDifP2 As Integer    '1=easy,2=normal,3=hard,4=impossible
Dim AIInt As Integer        'Ints; supposed to be from '1 to 9'
Dim AIDebug As Integer      '0=off,1=on
'AI Logic Vars
Dim AIThink As Integer      'How long AI 'Thinks'
Dim AISum As Integer        'AI Win Check
Dim AI1Enabled As Boolean   'Is P1 AI Enabled?
Dim AI2Enabled As Boolean   'Is P2 AI Enabled?
Dim AITickValue(1 To 9) As Integer  'Used for Hard, and Impossible AI
Dim AISquarePick(1 To 9) As Integer
Dim P1CompAITurn As Boolean
Dim P2CompAITurn As Boolean



Private Sub Tick()

    Cls
    
    'Xs
    If GameCount Mod 2 = 1 Then
        TurnCount = TurnCount + 1
        cmdTick(Index).Enabled = False
        
        If TurnCount Mod 2 = 1 Then
            cmdTick(Index).Caption = P1Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = 1
            lblGridArrayDis1.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
        Else
            cmdTick(Index).Caption = P2Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = -1
            lblGridArrayDis2.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
        End If
    End If
    
    'Os
    If GameCount Mod 2 = 0 Then
        TurnCount = TurnCount + 1
        cmdTick(Index).Enabled = False
        
        If TurnCount Mod 2 = 0 Then
            cmdTick(Index).Caption = P1Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = 1
            lblGridArrayDis1.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
        Else
            cmdTick(Index).Caption = P2Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = -1
            lblGridArrayDis2.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
        End If
    End If
    
    'Grid Check
    '+==================='
    '+        - C +
    '+      =1==2==3=    '
    '+      =========
    '+   =1= 0  0  0     '
    '+ - ===
    '+ R =2= 0  0  0     '
    '+ + ===
    '+   =3= 0  0  0     '
    '+
    '+==================='
    '
    '''Diagonal Is Reached'''
    'P1 win check
    
    If (GridArray(3, 1) = 1 And GridArray(2, 2) = 1 And GridArray(1, 3) = 1) Or (GridArray(3, 3) = 1 And GridArray(2, 2) = 1 And GridArray(1, 1) = 1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = 1 And GridArray(2, 2) = 1 And GridArray(1, 3) = 1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = 1 And GridArray(2, 2) = 1 And GridArray(1, 1) = 1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = P1Char & ": " & XwinCount
    End If
    
    'P2 win check
    If (GridArray(3, 1) = -1 And GridArray(2, 2) = -1 And GridArray(1, 3) = -1) Or (GridArray(3, 3) = -1 And GridArray(2, 2) = -1 And GridArray(1, 1) = -1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = -1 And GridArray(2, 2) = -1 And GridArray(1, 3) = -1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = -1 And GridArray(2, 2) = -1 And GridArray(1, 1) = -1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = P2Char & ": " & OwinCount
    End If
    
    
    '''Horizontal Is Reached'''
    'P1 win check
    If (GridArray(3, 1) = 1 And GridArray(3, 2) = 1 And GridArray(3, 3) = 1) Or (GridArray(2, 1) = 1 And GridArray(2, 2) = 1 And GridArray(2, 3) = 1) Or (GridArray(1, 1) = 1 And GridArray(1, 2) = 1 And GridArray(1, 3) = 1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = 1 And GridArray(3, 2) = 1 And GridArray(3, 3) = 1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(2).BackColor = &HFF00&
            cmdTick(3).BackColor = &HFF00&
        End If
        If (GridArray(2, 1) = 1 And GridArray(2, 2) = 1 And GridArray(2, 3) = 1) Then
            cmdTick(4).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        If (GridArray(1, 1) = 1 And GridArray(1, 2) = 1 And GridArray(1, 3) = 1) Then
            cmdTick(7).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = P1Char & ": " & XwinCount
    End If
    
    'P2 win check
    If (GridArray(3, 1) = -1 And GridArray(3, 2) = -1 And GridArray(3, 3) = -1) Or (GridArray(2, 1) = -1 And GridArray(2, 2) = -1 And GridArray(2, 3) = -1) Or (GridArray(1, 1) = -1 And GridArray(1, 2) = -1 And GridArray(1, 3) = -1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = -1 And GridArray(3, 2) = -1 And GridArray(3, 3) = -1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(2).BackColor = &HFF00&
            cmdTick(3).BackColor = &HFF00&
        End If
        If (GridArray(2, 1) = -1 And GridArray(2, 2) = -1 And GridArray(2, 3) = -1) Then
            cmdTick(4).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        If (GridArray(1, 1) = -1 And GridArray(1, 2) = -1 And GridArray(1, 3) = -1) Then
            cmdTick(7).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = P2Char & ": " & OwinCount
    End If
    
    '''Vertical Is Reached'''
    'P1 win check
    If (GridArray(3, 1) = 1 And GridArray(2, 1) = 1 And GridArray(1, 1) = 1) Or (GridArray(3, 2) = 1 And GridArray(2, 2) = 1 And GridArray(1, 2) = 1) Or (GridArray(3, 3) = 1 And GridArray(2, 3) = 1 And GridArray(1, 3) = 1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = 1 And GridArray(2, 1) = 1 And GridArray(1, 1) = 1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        If (GridArray(3, 2) = 1 And GridArray(2, 2) = 1 And GridArray(1, 2) = 1) Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = 1 And GridArray(2, 3) = 1 And GridArray(1, 3) = 1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = P1Char & ": " & XwinCount
    End If
    
    'P2 win check
    If (GridArray(3, 1) = -1 And GridArray(2, 1) = -1 And GridArray(1, 1) = -1) Or (GridArray(3, 2) = -1 And GridArray(2, 2) = -1 And GridArray(1, 2) = -1) Or (GridArray(3, 3) = -1 And GridArray(2, 3) = -1 And GridArray(1, 3) = -1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = -1 And GridArray(2, 1) = -1 And GridArray(1, 1) = -1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        If (GridArray(3, 2) = -1 And GridArray(2, 2) = -1 And GridArray(1, 2) = -1) Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = -1 And GridArray(2, 3) = -1 And GridArray(1, 3) = -1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = P2Char & ": " & OwinCount
    End If
    
    'No one wins
    If TurnCount >= 9 And Winner = False Then
        MsgBox "Cat's Game", vbOKOnly, "Draw"
        CatsCount = CatsCount + 1
        lblCatsCount.Caption = "Cat's Games: " & CatsCount
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
    End If
    
    Print "GameC:  " & GameCount Mod 2, "TurnC:  " & TurnCount Mod 2;
    
End Sub

Private Sub cmdTick_Click(Index As Integer)

    Cls
    
    'Xs
    If GameCount Mod 2 = 1 Then
        If TurnCount Mod 2 = 0 Then
            If tmrAI1.Enabled = False Then
                TurnCount = TurnCount + 1
                cmdTick(Index).Enabled = False
                cmdTick(Index).Caption = P1Char
                'Align width grid (NUMERICAL ANALYSIS)
                R = 3 - ((Index - 1) \ 3)
                C = ((Index - 1) Mod 3) + 1
                GridArray(R, C) = 1
                lblGridArrayDis1.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
            End If
        Else
            If tmrAI2.Enabled = False Then
                TurnCount = TurnCount + 1
                cmdTick(Index).Enabled = False
                cmdTick(Index).Caption = P2Char
                'Align width grid (NUMERICAL ANALYSIS)
                R = 3 - ((Index - 1) \ 3)
                C = ((Index - 1) Mod 3) + 1
                GridArray(R, C) = -1
                lblGridArrayDis2.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
            End If
        End If
    End If
    
    'Os
    If GameCount Mod 2 = 0 Then
        If TurnCount Mod 2 = 1 Then
            If tmrAI1.Enabled = False Then
                TurnCount = TurnCount + 1
                cmdTick(Index).Enabled = False
                cmdTick(Index).Caption = P1Char
                'Align width grid (NUMERICAL ANALYSIS)
                R = 3 - ((Index - 1) \ 3)
                C = ((Index - 1) Mod 3) + 1
                GridArray(R, C) = 1
                lblGridArrayDis1.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
            End If
        Else
            If tmrAI2.Enabled = False Then
                TurnCount = TurnCount + 1
                cmdTick(Index).Enabled = False
                cmdTick(Index).Caption = P2Char
                'Align width grid (NUMERICAL ANALYSIS)
                R = 3 - ((Index - 1) \ 3)
                C = ((Index - 1) Mod 3) + 1
                GridArray(R, C) = -1
                lblGridArrayDis2.Caption = "GridArray(" & R & " ," & C & " ) = " & GridArray(R, C)
            End If
        End If
    End If
    
    'Grid Check
    '+==================='
    '+        - C +
    '+      =1==2==3=    '
    '+      =========
    '+   =1= 0  0  0     '
    '+ - ===
    '+ R =2= 0  0  0     '
    '+ + ===
    '+   =3= 0  0  0     '
    '+
    '+==================='
    '
    '''Diagonal Is Reached'''
    'P1 win check
    
    If (GridArray(3, 1) = 1 And GridArray(2, 2) = 1 And GridArray(1, 3) = 1) Or (GridArray(3, 3) = 1 And GridArray(2, 2) = 1 And GridArray(1, 1) = 1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = 1 And GridArray(2, 2) = 1 And GridArray(1, 3) = 1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = 1 And GridArray(2, 2) = 1 And GridArray(1, 1) = 1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = P1Char & ": " & XwinCount
    End If
    
    'P2 win check
    If (GridArray(3, 1) = -1 And GridArray(2, 2) = -1 And GridArray(1, 3) = -1) Or (GridArray(3, 3) = -1 And GridArray(2, 2) = -1 And GridArray(1, 1) = -1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = -1 And GridArray(2, 2) = -1 And GridArray(1, 3) = -1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = -1 And GridArray(2, 2) = -1 And GridArray(1, 1) = -1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = P2Char & ": " & OwinCount
    End If
    
    
    '''Horizontal Is Reached'''
    'P1 win check
    If (GridArray(3, 1) = 1 And GridArray(3, 2) = 1 And GridArray(3, 3) = 1) Or (GridArray(2, 1) = 1 And GridArray(2, 2) = 1 And GridArray(2, 3) = 1) Or (GridArray(1, 1) = 1 And GridArray(1, 2) = 1 And GridArray(1, 3) = 1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = 1 And GridArray(3, 2) = 1 And GridArray(3, 3) = 1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(2).BackColor = &HFF00&
            cmdTick(3).BackColor = &HFF00&
        End If
        If (GridArray(2, 1) = 1 And GridArray(2, 2) = 1 And GridArray(2, 3) = 1) Then
            cmdTick(4).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        If (GridArray(1, 1) = 1 And GridArray(1, 2) = 1 And GridArray(1, 3) = 1) Then
            cmdTick(7).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = P1Char & ": " & XwinCount
    End If
    
    'P2 win check
    If (GridArray(3, 1) = -1 And GridArray(3, 2) = -1 And GridArray(3, 3) = -1) Or (GridArray(2, 1) = -1 And GridArray(2, 2) = -1 And GridArray(2, 3) = -1) Or (GridArray(1, 1) = -1 And GridArray(1, 2) = -1 And GridArray(1, 3) = -1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = -1 And GridArray(3, 2) = -1 And GridArray(3, 3) = -1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(2).BackColor = &HFF00&
            cmdTick(3).BackColor = &HFF00&
        End If
        If (GridArray(2, 1) = -1 And GridArray(2, 2) = -1 And GridArray(2, 3) = -1) Then
            cmdTick(4).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        If (GridArray(1, 1) = -1 And GridArray(1, 2) = -1 And GridArray(1, 3) = -1) Then
            cmdTick(7).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = P2Char & ": " & OwinCount
    End If
    
    '''Vertical Is Reached'''
    'P1 win check
    If (GridArray(3, 1) = 1 And GridArray(2, 1) = 1 And GridArray(1, 1) = 1) Or (GridArray(3, 2) = 1 And GridArray(2, 2) = 1 And GridArray(1, 2) = 1) Or (GridArray(3, 3) = 1 And GridArray(2, 3) = 1 And GridArray(1, 3) = 1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = 1 And GridArray(2, 1) = 1 And GridArray(1, 1) = 1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        If (GridArray(3, 2) = 1 And GridArray(2, 2) = 1 And GridArray(1, 2) = 1) Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = 1 And GridArray(2, 3) = 1 And GridArray(1, 3) = 1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = P1Char & ": " & XwinCount
    End If
    
    'P2 win check
    If (GridArray(3, 1) = -1 And GridArray(2, 1) = -1 And GridArray(1, 1) = -1) Or (GridArray(3, 2) = -1 And GridArray(2, 2) = -1 And GridArray(1, 2) = -1) Or (GridArray(3, 3) = -1 And GridArray(2, 3) = -1 And GridArray(1, 3) = -1) Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (GridArray(3, 1) = -1 And GridArray(2, 1) = -1 And GridArray(1, 1) = -1) Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        If (GridArray(3, 2) = -1 And GridArray(2, 2) = -1 And GridArray(1, 2) = -1) Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        If (GridArray(3, 3) = -1 And GridArray(2, 3) = -1 And GridArray(1, 3) = -1) Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
            cmdTick(9).BackColor = &HFF00&
        End If
        
        Winner = True
        GameOn = 1  '1=off,2=on
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = P2Char & ": " & OwinCount
    End If
    
    'No one wins
    If TurnCount >= 9 And Winner = False Then
        MsgBox "Cat's Game", vbOKOnly, "Draw"
        CatsCount = CatsCount + 1
        lblCatsCount.Caption = "Cat's Games: " & CatsCount
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
    End If
    
    Print "GameC:  " & GameCount Mod 2, "TurnC:  " & TurnCount Mod 2;
    
End Sub

Private Sub cmdNewGame_Click()

    GameOn = 2  '1=off,2=on
    TurnCount = 0
    GameCount = GameCount + 1
    tmrTurn.Enabled = True
    Winner = False
    For I = 1 To 9
        cmdTick(I).Caption = ""
        cmdTick(I).Enabled = True
        cmdTick(I).BackColor = &H8000000F
    Next I
    
    'reset Grid
    For R = 1 To 3
        For C = 1 To 3
            GridArray(R, C) = 0
        Next C
    Next R
    
End Sub

Private Sub Form_Load()

    GameOn = 2          '1=off,2=on
    GameCount = 1
    
    If GameOn = 1 Then
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
    End If
    
    AIDebug = 0         '0=off,1=on
    AIInt = 1           'Ints; supposed to be from '1 to 9'
    AIThink = 1000      'How long AI 'Thinks'
    AIDifP1 = 1         '1=easy,2=normal,3=hard,4=impossible
    AIDifP2 = 1         '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP1.Checked = True
    mnu1EasyP2.Checked = True
    
    'opt1Easy.Value = True
    
    Winner = False
    
    P1Char = "X"
    P2Char = "O"
    
    XwinCount = 0
    OwinCount = 0
    
    'this is nothing special
    For I = 1 To 9
        cmdTick(I).FontSize = 32
    Next I
    
End Sub

Private Sub mnu1EasyP1_Click()
    AIDifP1 = 1     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP1.Checked = True
    mnu2NormalP1.Checked = False
    mnu3HardP1.Checked = False
    mnu4ImpossibleP1.Checked = False
End Sub

Private Sub mnu1EasyP2_Click()
    AIDifP2 = 1     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP2.Checked = True
    mnu2NormalP2.Checked = False
    mnu3HardP2.Checked = False
    mnu4ImpossibleP2.Checked = False
End Sub

Private Sub mnu2NormalP1_Click()
    AIDifP1 = 3     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP1.Checked = False
    mnu2NormalP1.Checked = True
    mnu3HardP1.Checked = False
    mnu4ImpossibleP1.Checked = False
End Sub

Private Sub mnu2NormalP2_Click()
    AIDifP2 = 3     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP2.Checked = False
    mnu2NormalP2.Checked = True
    mnu3HardP2.Checked = False
    mnu4ImpossibleP2.Checked = False
End Sub

Private Sub mnu3HardP1_Click()
    AIDifP1 = 3     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP1.Checked = False
    mnu2NormalP1.Checked = False
    mnu3HardP1.Checked = True
    mnu4ImpossibleP1.Checked = False
End Sub

Private Sub mnu3HardP2_Click()
    AIDifP2 = 3     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP2.Checked = False
    mnu2NormalP2.Checked = False
    mnu3HardP2.Checked = True
    mnu4ImpossibleP2.Checked = False
End Sub

Private Sub mnu4ImpossibleP1_Click()
    AIDifP1 = 4     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP1.Checked = False
    mnu2NormalP1.Checked = False
    mnu3HardP1.Checked = False
    mnu4ImpossibleP1.Checked = True
End Sub

Private Sub mnu4ImpossibleP2_Click()
    AIDifP2 = 4     '1=easy,2=normal,3=hard,4=impossible
    mnu1EasyP2.Checked = False
    mnu2NormalP2.Checked = False
    mnu3HardP2.Checked = False
    mnu4ImpossibleP2.Checked = True
End Sub

Private Sub mnuDebugAID_Click()
    AIDebug = 0
End Sub

Private Sub mnuDebugAIE_Click()
    AIDebug = 1
End Sub

Private Sub mnuDisableAI_Click()

    tmrAI1.Enabled = False
    tmrAI2.Enabled = False
    
End Sub

Private Sub mnuEnableAI1_Click()

    tmrAI1.Enabled = True
    
End Sub

Private Sub mnuEnableAI2_Click()

    tmrAI2.Enabled = True
    
End Sub

Private Sub mnuNewGame_Click()

    GameOn = 2  '1=off,2=on
    TurnCount = 0
    GameCount = GameCount + 1
    tmrTurn.Enabled = True
    Winner = False
    For I = 1 To 9
        cmdTick(I).Caption = ""
        cmdTick(I).Enabled = True
        cmdTick(I).BackColor = &H8000000F
    Next I
    
    'reset Grid
    For R = 1 To 3
        For C = 1 To 3
            GridArray(R, C) = 0
        Next C
    Next R
     
End Sub

Private Sub mnuShowGrid_Click()

    Cls
    
    For row = 1 To 3
        For Col = 1 To 3
            Print GridArray(row, Col);
        Next Col
        Print:
    Next row
    
    
End Sub

Private Sub opt1Easy_Click()
    AIDifP1 = 1     '1=easy,2=normal,3=hard,4=impossible
    AIDifP2 = 1     '1=easy,2=normal,3=hard,4=impossible
End Sub

Private Sub opt2Normal_Click()
    AIDifP1 = 2     '1=easy,2=normal,3=hard,4=impossible
    AIDifP2 = 2     '1=easy,2=normal,3=hard,4=impossible
End Sub

Private Sub opt3Hard_Click()
    AIDifP1 = 3     '1=easy,2=normal,3=hard,4=impossible
    AIDifP2 = 3     '1=easy,2=normal,3=hard,4=impossible
End Sub

Private Sub opt4Impossible_Click()
    AIDifP1 = 4     '1=easy,2=normal,3=hard,4=impossible
    AIDifP2 = 4     '1=easy,2=normal,3=hard,4=impossible
End Sub

Private Sub AI1_Easy()

    ''''
    If GameOn = 2 Then
    ''''
'''''''''''\\\AI "Easy" Difficulty\\\'''
        If AIDifP1 = 1 Then
            'Randomize AI
            Randomize
            
            'AIInt Randomness Equation
            upperbound = 10
            lowerbound = 1
            AIInt = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            
            'AIThink Randomness Equation
            upperbound = 800
            lowerbound = 250
            AIThink = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            tmrAI1.Interval = AIThink
            
            'Grid Check
            '+==================='
            '+        - C +
            '+      =1==2==3=    '
            '+      =========
            '+   =1= 0  0  0     '
            '+ - ===
            '+ R =2= 0  0  0     '
            '+ + ===
            '+   =3= 0  0  0     '
            '+
            '+==================='
            '
            
            ''''''''''''''''''''''
            '''If GameCount = 0'''
            ''''''''''''''''''''''
            If AIInt = 1 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(3, 1) = 0 Then
                            Index = 1
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 2 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(3, 2) = 0 Then
                            Index = 2
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 3 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(3, 3) = 0 Then
                            Index = 3
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 4 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(2, 1) = 0 Then
                            Index = 4
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 5 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(2, 2) = 0 Then
                            Index = 5
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 6 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(2, 3) = 0 Then
                            Index = 6
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 7 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(1, 1) = 0 Then
                            Index = 7
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 8 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(1, 2) = 0 Then
                            Index = 8
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 9 Then
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        If GridArray(1, 3) = 0 Then
                            Index = 9
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            ''''''''''''''''''''''
            '''If GameCount = 1'''
            ''''''''''''''''''''''
            If AIInt = 1 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(3, 1) = 0 Then
                            Index = 1
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 2 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(3, 2) = 0 Then
                            Index = 2
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 3 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(3, 3) = 0 Then
                            Index = 3
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 4 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(2, 1) = 0 Then
                            Index = 4
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 5 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(2, 2) = 0 Then
                            Index = 5
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 6 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(2, 3) = 0 Then
                            Index = 6
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 7 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(1, 1) = 0 Then
                            Index = 7
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 8 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(1, 2) = 0 Then
                            Index = 8
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIInt = 9 Then
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        If GridArray(1, 3) = 0 Then
                            Index = 9
                            Call Tick
                        End If
                    End If
                End If
            End If
            
            If AIDebug = 1 Then Call AIDebugCheck
        End If
    ''''
    End If
    ''''
End Sub

Private Sub AI1_Hard()
    
    ''''
    If GameOn = 2 Then
    ''''
'''''''''''\\\AI "Hard" Difficulty\\\'''
        If AIDifP1 = 3 Then
            'Randomize AI
            Randomize
            
            'AIInt Randomness Equation
            upperbound = 10
            lowerbound = 1
            AIInt = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            
            'AIThink Randomness Equation
            upperbound = 100
            lowerbound = 50
            AIThink = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            tmrAI1.Interval = AIThink
            
            'Grid Check
            '+==================='
            '+        - C +
            '+      =1==2==3=    '
            '+      =========
            '+   =1= 0  0  0     '
            '+ - ===
            '+ R =2= 0  0  0     '
            '+ + ===
            '+   =3= 0  0  0     '
            '+
            '+==================='
            '
            
            ''''
            If GameOn = 2 Then
            ''''
                ''''''''''''''''''''''
                '''If GameCount = 0'''
                ''''''''''''''''''''''
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            ''''''''''''''''''''''''''''''
                            '''Check for Horizontal win'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''
                            '''Check for Vertical win'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''
                            '''Check for Diagonal win'''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(2, 2)
                                If AISum = 2 And GridArray(3, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(3, 3)
                                If AISum = 2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(3, 3)
                                If AISum = 2 And GridArray(1, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(2, 2)
                                If AISum = 2 And GridArray(1, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(1, 3)
                                If AISum = 2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(1, 3)
                                If AISum = 2 And GridArray(3, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                        ''''
                        End If
                        ''''
                    End If
                End If
                
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            ''''''''''''''''''''''''''''''''
                            '''Check for Horizontal block'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''''
                            '''Check for Vertical block'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            u = 1
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''''
                            '''Check for Diagonal block'''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(2, 2)
                                If AISum = -2 And GridArray(3, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(3, 3)
                                If AISum = -2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(3, 3)
                                If AISum = -2 And GridArray(1, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(2, 2)
                                If AISum = -2 And GridArray(1, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(1, 3)
                                If AISum = -2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(1, 3)
                                If AISum = -2 And GridArray(3, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                        ''''
                        End If
                        ''''
                    End If
                End If
                
                If GameCount Mod 2 = 0 Then
                    If TurnCount Mod 2 = 1 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            '''''''''''''''''''''
                            '''Random Pickings'''
                            If AIInt = 1 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(3, 1) = 0 Then
                                            Index = 1
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 2 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(3, 2) = 0 Then
                                            Index = 2
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 3 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(3, 3) = 0 Then
                                            Index = 3
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 4 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(2, 1) = 0 Then
                                            Index = 4
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 5 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(2, 2) = 0 Then
                                            Index = 5
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 6 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(2, 3) = 0 Then
                                            Index = 6
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 7 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(1, 1) = 0 Then
                                            Index = 7
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 8 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(1, 2) = 0 Then
                                            Index = 8
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 9 Then
                                If GameCount Mod 2 = 0 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(1, 3) = 0 Then
                                            Index = 9
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                        ''''
                        End If
                        ''''
                        
                    End If
                End If
            ''''
            End If
            ''''
            ''''
            If GameOn = 2 Then
            ''''
                ''''''''''''''''''''''
                '''If GameCount = 1'''
                ''''''''''''''''''''''
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            ''''''''''''''''''''''''''''''
                            '''Check for Horizontal win'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            ''''''''''''''''''''''''''''
                            '''Check for Vertical win'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            ''''''''''''''''''''''''''''
                            '''Check for Diagonal win'''
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(1, 1) + GridArray(2, 2)
                                If AISum = 2 And GridArray(3, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(1, 1) + GridArray(3, 3)
                                If AISum = 2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(2, 2) + GridArray(3, 3)
                                If AISum = 2 And GridArray(1, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(3, 1) + GridArray(2, 2)
                                If AISum = 2 And GridArray(1, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(3, 1) + GridArray(1, 3)
                                If AISum = 2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(2, 2) + GridArray(1, 3)
                                If AISum = 2 And GridArray(3, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                        ''''
                        End If
                        ''''
                    End If
                End If
                
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            ''''''''''''''''''''''''''''''''
                            '''Check for Horizontal block'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            ''''''''''''''''''''''''''''''
                            '''Check for Vertical block'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 0 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            ''''''''''''''''''''''''''''''
                            '''Check for Diagonal block'''
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(1, 1) + GridArray(2, 2)
                                If AISum = -2 And GridArray(3, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(1, 1) + GridArray(3, 3)
                                If AISum = -2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(2, 2) + GridArray(3, 3)
                                If AISum = -2 And GridArray(1, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 0 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(3, 1) + GridArray(2, 2)
                                If AISum = -2 And GridArray(1, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(3, 1) + GridArray(1, 3)
                                If AISum = -2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 0 Then
                                AISum = GridArray(2, 2) + GridArray(1, 3)
                                If AISum = -2 And GridArray(3, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                        ''''
                        End If
                        ''''
                    End If
                End If
                
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 0 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            '''''''''''''''''''''
                            '''Random Pickings'''
                            If AIInt = 1 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(3, 1) = 0 Then
                                            Index = 1
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 2 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(3, 2) = 0 Then
                                            Index = 2
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 3 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(3, 3) = 0 Then
                                            Index = 3
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 4 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(2, 1) = 0 Then
                                            Index = 4
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 5 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(2, 2) = 0 Then
                                            Index = 5
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 6 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(2, 3) = 0 Then
                                            Index = 6
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 7 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(1, 1) = 0 Then
                                            Index = 7
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 8 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(1, 2) = 0 Then
                                            Index = 8
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 9 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 0 Then
                                        If GridArray(1, 3) = 0 Then
                                            Index = 9
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                        ''''
                        End If
                        ''''
            ''''
            End If
            ''''
                    End If
                End If
                
            If AIDebug = 1 Then Call AIDebugCheck
        End If
    ''''
    End If
    ''''
End Sub

Private Sub AI1_Impossible()
    ''''
    If GameOn = 2 Then
    ''''
'''''''''''\\\AI "Impossible" Difficulty\\\'''
        If AIDifP1 = 4 Then
            'Randomize AI
            Randomize
            
            'AIInt Randomness Equation
            upperbound = 10
            lowerbound = 1
            AIInt = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            
            'AIThink Randomness Equation
            upperbound = 75
            lowerbound = 50
            AIThink = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            tmrAI1.Interval = AIThink
            
            'Grid Check
            '+==================='
            '+        - C +
            '+      =1==2==3=    '
            '+      =========
            '+   =1= 0  0  0     '
            '+ - ===
            '+ R =2= 0  0  0     '
            '+ + ===
            '+   =3= 0  0  0     '
            '+
            '+==================='
            '
            
            ''''
            If GameOn = 2 Then
            ''''
            
            
            ''''
            End If
            ''''
            
            If AIDebug = 1 Then Call AIDebugCheck
        End If
    ''''
    End If
    ''''
End Sub

Private Sub AI2_Easy()

    ''''
    If GameOn = 2 Then
    ''''
'''''''''''\\\AI "Easy" Difficulty\\\'''
        If AIDifP2 = 1 Then
            'Randomize AI
            Randomize
            
            'AIInt Randomness Equation
            upperbound = 10
            lowerbound = 1
            AIInt = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            
            'AIThink Randomness Equation
            upperbound = 800
            lowerbound = 250
            AIThink = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            tmrAI2.Interval = AIThink
            
            'Grid Check
            '+==================='
            '+        - C +
            '+      =1==2==3=    '
            '+      =========
            '+   =1= 0  0  0     '
            '+ - ===
            '+ R =2= 0  0  0     '
            '+ + ===
            '+   =3= 0  0  0     '
            '+
            '+==================='
            '
            
            ''''''''''''''''''''''
            '''If GameCount = 0'''
            ''''''''''''''''''''''
            If P2CompAITurn = True Then
                If AIInt = 1 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(3, 1) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 2 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(3, 2) = 0 Then
                                Index = 2
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 3 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(3, 3) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 4 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(2, 1) = 0 Then
                                Index = 4
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 5 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(2, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 6 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(2, 3) = 0 Then
                                Index = 6
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 7 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(1, 1) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 8 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(1, 2) = 0 Then
                                Index = 8
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 9 Then
                    If GameCount Mod 2 = 0 Then
                        If TurnCount Mod 2 = 0 Then
                            If GridArray(1, 3) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                ''''''''''''''''''''''
                '''If GameCount = 1'''
                ''''''''''''''''''''''
                If AIInt = 1 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(3, 1) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 2 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(3, 2) = 0 Then
                                Index = 2
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 3 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(3, 3) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 4 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(2, 1) = 0 Then
                                Index = 4
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 5 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(2, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 6 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(2, 3) = 0 Then
                                Index = 6
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 7 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(1, 1) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 8 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(1, 2) = 0 Then
                                Index = 8
                                Call Tick
                            End If
                        End If
                    End If
                End If
                
                If AIInt = 9 Then
                    If GameCount Mod 2 = 1 Then
                        If TurnCount Mod 2 = 1 Then
                            If GridArray(1, 3) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                    End If
                End If
            End If
            
            If AIDebug = 1 Then Call AIDebugCheck
        End If
    ''''
    End If
    ''''
End Sub

Private Sub AI2_Hard()
    
    ''''
    If GameOn = 2 Then
    ''''
'''''''''''\\\AI "Hard" Difficulty\\\'''
        If AIDifP2 = 3 Then
            'Randomize AI
            Randomize
            
            'AIInt Randomness Equation
            upperbound = 10
            lowerbound = 1
            AIInt = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            
            'AIThink Randomness Equation
            upperbound = 100
            lowerbound = 50
            AIThink = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            tmrAI2.Interval = AIThink
            
            'Grid Check
            '+==================='
            '+        - C +
            '+      =1==2==3=    '
            '+      =========
            '+   =1= 0  0  0     '
            '+ - ===
            '+ R =2= 0  0  0     '
            '+ + ===
            '+   =3= 0  0  0     '
            '+
            '+==================='
            '
            
            ''''
            If GameOn = 2 Then
            ''''
            ''''''''''''''''''''''
            '''If GameCount = 0'''
            ''''''''''''''''''''''
            If GameCount Mod 2 = 0 Then
                If TurnCount Mod 2 = 0 Then
                    ''''
                    If GameOn = 2 Then
                    ''''
                        ''''''''''''''''''''''''''''''
                        '''Check for Horizontal win'''
                        v1 = 1
                        v2 = 2
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(3, u) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(3, u) = 0 Then
                                Index = 2
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(3, u) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 1
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(2, u) = 0 Then
                                Index = 4
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(2, u) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(2, u) = 0 Then
                                Index = 6
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 2
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(1, u) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(1, u) = 0 Then
                                Index = 8
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = -2 And GridArray(1, u) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        ''''''''''''''''''''''''''''
                        '''Check for Vertical win'''
                        v1 = 1
                        v2 = 2
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 3) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 3) = 0 Then
                                Index = 6
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 3) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 1
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 2) = 0 Then
                                Index = 8
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 2) = 0 Then
                                Index = 2
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 2
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 1) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 1) = 0 Then
                                Index = 4
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = -2 And GridArray(u, 1) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        ''''''''''''''''''''''''''''
                        '''Check for Diagonal win'''
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(1, 1) + GridArray(2, 2)
                            If AISum = -2 And GridArray(3, 3) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(1, 1) + GridArray(3, 3)
                            If AISum = -2 And GridArray(2, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(2, 2) + GridArray(3, 3)
                            If AISum = -2 And GridArray(1, 1) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(3, 1) + GridArray(2, 2)
                            If AISum = -2 And GridArray(1, 3) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(3, 1) + GridArray(1, 3)
                            If AISum = -2 And GridArray(2, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(2, 2) + GridArray(1, 3)
                            If AISum = -2 And GridArray(3, 1) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                    ''''
                    End If
                    ''''
                End If
            End If
            
            If GameCount Mod 2 = 0 Then
                If TurnCount Mod 2 = 0 Then
                    ''''
                    If GameOn = 2 Then
                    ''''
                        ''''''''''''''''''''''''''''''''
                        '''Check for Horizontal block'''
                        v1 = 1
                        v2 = 2
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(3, u) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(3, u) = 0 Then
                                Index = 2
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(3, u) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 1
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(2, u) = 0 Then
                                Index = 4
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(2, u) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(2, u) = 0 Then
                                Index = 6
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 2
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(1, u) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(1, u) = 0 Then
                                Index = 8
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(v1, u) + GridArray(v2, u)
                            If AISum = 2 And GridArray(1, u) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        ''''''''''''''''''''''''''''''
                        '''Check for Vertical block'''
                        v1 = 1
                        v2 = 2
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 3) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 3) = 0 Then
                                Index = 6
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 3) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 1
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 2) = 0 Then
                                Index = 8
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 2) = 0 Then
                                Index = 2
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        v1 = 2
                        v2 = 3
                        If TurnCount Mod 2 = 0 Then
                            u = 1
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 1) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 2
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 1) = 0 Then
                                Index = 4
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            u = 3
                            AISum = GridArray(u, v1) + GridArray(u, v2)
                            If AISum = 2 And GridArray(u, 1) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        ''''''''''''''''''''''''''''''
                        '''Check for Diagonal block'''
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(1, 1) + GridArray(2, 2)
                            If AISum = 2 And GridArray(3, 3) = 0 Then
                                Index = 3
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(1, 1) + GridArray(3, 3)
                            If AISum = 2 And GridArray(2, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(2, 2) + GridArray(3, 3)
                            If AISum = 2 And GridArray(1, 1) = 0 Then
                                Index = 7
                                Call Tick
                            End If
                        End If
                End If
                If TurnCount Mod 2 = 0 Then
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(3, 1) + GridArray(2, 2)
                            If AISum = 2 And GridArray(1, 3) = 0 Then
                                Index = 9
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(3, 1) + GridArray(1, 3)
                            If AISum = 2 And GridArray(2, 2) = 0 Then
                                Index = 5
                                Call Tick
                            End If
                        End If
                        
                        If TurnCount Mod 2 = 0 Then
                            AISum = GridArray(2, 2) + GridArray(1, 3)
                            If AISum = 2 And GridArray(3, 1) = 0 Then
                                Index = 1
                                Call Tick
                            End If
                        End If
                    ''''
                    End If
                    ''''
                End If
            End If
            
            If GameCount Mod 2 = 0 Then
                If TurnCount Mod 2 = 0 Then
                    ''''
                    If GameOn = 2 Then
                    ''''
                        '''''''''''''''''''''
                        '''Random Pickings'''
                        If AIInt = 1 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(3, 1) = 0 Then
                                        Index = 1
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 2 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(3, 2) = 0 Then
                                        Index = 2
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 3 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(3, 3) = 0 Then
                                        Index = 3
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 4 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(2, 1) = 0 Then
                                        Index = 4
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 5 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(2, 2) = 0 Then
                                        Index = 5
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 6 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(2, 3) = 0 Then
                                        Index = 6
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 7 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(1, 1) = 0 Then
                                        Index = 7
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 8 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(1, 2) = 0 Then
                                        Index = 8
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        
                        If AIInt = 9 Then
                            If GameCount Mod 2 = 0 Then
                                If TurnCount Mod 2 = 0 Then
                                    If GridArray(1, 3) = 0 Then
                                        Index = 9
                                        Call Tick
                                    End If
                                End If
                            End If
                        End If
                        '''''''''''''''''''''''''''''''''''''''''''''''''
                    ''''
                    End If
                    ''''
                End If
            End If
            ''''
            End If
            ''''
            
            ''''
            If GameOn = 2 Then
            ''''
                ''''''''''''''''''''''
                '''If GameCount = 1'''
                ''''''''''''''''''''''
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 1 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            ''''''''''''''''''''''''''''''
                            '''Check for Horizontal win'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(3, u) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(2, u) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = -2 And GridArray(1, u) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''
                            '''Check for Vertical win'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 2) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = -2 And GridArray(u, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''
                            '''Check for Diagonal win'''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(2, 2)
                                If AISum = -2 And GridArray(3, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(3, 3)
                                If AISum = -2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(3, 3)
                                If AISum = -2 And GridArray(1, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(2, 2)
                                If AISum = -2 And GridArray(1, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(1, 3)
                                If AISum = -2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(1, 3)
                                If AISum = -2 And GridArray(3, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                        ''''
                        End If
                        ''''
                    End If
                End If
                
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 1 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            ''''''''''''''''''''''''''''''''
                            '''Check for Horizontal block'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(3, u) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(2, u) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(v1, u) + GridArray(v2, u)
                                If AISum = 2 And GridArray(1, u) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''''
                            '''Check for Vertical block'''
                            v1 = 1
                            v2 = 2
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 6
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 1
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 8
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 2) = 0 Then
                                    Index = 2
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            v1 = 2
                            v2 = 3
                            If TurnCount Mod 2 = 1 Then
                                u = 1
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 2
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 4
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                u = 3
                                AISum = GridArray(u, v1) + GridArray(u, v2)
                                If AISum = 2 And GridArray(u, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            ''''''''''''''''''''''''''''''
                            '''Check for Diagonal block'''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(2, 2)
                                If AISum = 2 And GridArray(3, 3) = 0 Then
                                    Index = 3
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(1, 1) + GridArray(3, 3)
                                If AISum = 2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(3, 3)
                                If AISum = 2 And GridArray(1, 1) = 0 Then
                                    Index = 7
                                    Call Tick
                                End If
                            End If
                    End If
                    If TurnCount Mod 2 = 1 Then
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(2, 2)
                                If AISum = 2 And GridArray(1, 3) = 0 Then
                                    Index = 9
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(3, 1) + GridArray(1, 3)
                                If AISum = 2 And GridArray(2, 2) = 0 Then
                                    Index = 5
                                    Call Tick
                                End If
                            End If
                            
                            If TurnCount Mod 2 = 1 Then
                                AISum = GridArray(2, 2) + GridArray(1, 3)
                                If AISum = 2 And GridArray(3, 1) = 0 Then
                                    Index = 1
                                    Call Tick
                                End If
                            End If
                        ''''
                        End If
                        ''''
                    End If
                End If
                
                If GameCount Mod 2 = 1 Then
                    If TurnCount Mod 2 = 1 Then
                        ''''
                        If GameOn = 2 Then
                        ''''
                            '''''''''''''''''''''
                            '''Random Pickings'''
                            If AIInt = 1 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(3, 1) = 0 Then
                                            Index = 1
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 2 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(3, 2) = 0 Then
                                            Index = 2
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 3 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(3, 3) = 0 Then
                                            Index = 3
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 4 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(2, 1) = 0 Then
                                            Index = 4
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 5 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(2, 2) = 0 Then
                                            Index = 5
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 6 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(2, 3) = 0 Then
                                            Index = 6
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 7 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(1, 1) = 0 Then
                                            Index = 7
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 8 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(1, 2) = 0 Then
                                            Index = 8
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            
                            If AIInt = 9 Then
                                If GameCount Mod 2 = 1 Then
                                    If TurnCount Mod 2 = 1 Then
                                        If GridArray(1, 3) = 0 Then
                                            Index = 9
                                            Call Tick
                                        End If
                                    End If
                                End If
                            End If
                            '''''''''''''''''''''''''''''''''''''''''''''''''
                        ''''
                        End If
                        ''''
            ''''
            End If
            ''''
                    End If
                End If
                
            If AIDebug = 1 Then Call AIDebugCheck
        End If
    ''''
    End If
    ''''
End Sub

Private Sub AI2_Impossible()

    ''''
    If GameOn = 2 Then
    ''''

'''''''''''\\\AI "Impossible" Difficulty\\\'''
        If AIDifP2 = 4 Then
            'Randomize AI
            Randomize
            
            'AIInt Randomness Equation
            upperbound = 10
            lowerbound = 1
            AIInt = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            
            'AIThink Randomness Equation
            upperbound = 30
            lowerbound = 25
            AIThink = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
            tmrAI2.Interval = AIThink
            
            'Grid Check
            '+==================='
            '+        - C +
            '+      =1==2==3=    '
            '+      =========
            '+   =1= 0  0  0     '
            '+ - ===
            '+ R =2= 0  0  0     '
            '+ + ===
            '+   =3= 0  0  0     '
            '+
            '+==================='
            '
            
            ''''
            If GameOn = 2 Then
            ''''
                If P2CompAITurn = True Then
                    '
                    If GameCount = 1 _
                    And TurnCount = 1 Then
                        ''
                        If (cmdTick(1).Caption = P1Char _
                        Or cmdTick(3).Caption = P1Char _
                        Or cmdTick(7).Caption = P1Char _
                        Or cmdTick(9).Caption = P1Char) Then
                            '''
                            If cmdTick(2).Caption = "" Then AISquarePick(2) = 10 Else AISquarePick(2) = 0
                            If cmdTick(4).Caption = "" Then AISquarePick(4) = 10 Else AISquarePick(4) = 0
                            If cmdTick(6).Caption = "" Then AISquarePick(6) = 10 Else AISquarePick(6) = 0
                            If cmdTick(8).Caption = "" Then AISquarePick(8) = 10 Else AISquarePick(8) = 0
                            
                            For W = 1 To 9
                                If AIInt = W Then
                                    If AISquarePick(AIInt) = 10 Then
                                        Index = AIInt
                                        Call Tick
                                    End If
                                End If
                            Next W
                            '
                            '''
                        End If
                        ''
                        ''
                        For W = 1 To 9
                            AISquarePick(W) = 0
                        Next W
                        ''
                        If (cmdTick(2).Caption = P1Char _
                        Or cmdTick(4).Caption = P1Char _
                        Or cmdTick(6).Caption = P1Char _
                        Or cmdTick(8).Caption = P1Char) Then
                            
                            If cmdTick(1).Caption = "" Then AISquarePick(1) = 10 Else AISquarePick(1) = 0
                            If cmdTick(3).Caption = "" Then AISquarePick(3) = 10 Else AISquarePick(3) = 0
                            If cmdTick(5).Caption = "" Then AISquarePick(5) = 10 Else AISquarePick(5) = 0
                            If cmdTick(7).Caption = "" Then AISquarePick(7) = 10 Else AISquarePick(7) = 0
                            If cmdTick(9).Caption = "" Then AISquarePick(9) = 10 Else AISquarePick(9) = 0
                            
                            'Pick Randomly
                            For W = 1 To 9
                                If AIInt = W Then
                                    If AISquarePick(AIInt) = 10 Then
                                        Index = AIInt
                                        Call Tick
                                    End If
                                End If
                            Next W
                            '
                            'Pick Randomly
                        End If
                        
                        For W = 1 To 9
                            AISquarePick(W) = 0
                        Next W
                        ''
                    End If
                    '
                End If
            ''''
            End If
            ''''
            
            If AIDebug = 1 Then Call AIDebugCheck
        End If
    ''''
    End If
    ''''
End Sub

Private Sub AIDebugCheck()
    If GameOn = 2 Then
        For I = 1 To 9
            If cmdTick(I).Caption = P1Char _
            And tmrAI1.Enabled = True Then
                If AIDebug = 1 Then cmdTick(I).BackColor = &HFF& Else cmdTick(I).BackColor = &H8000000F
            End If
            If cmdTick(I).Caption = P2Char _
            And tmrAI2.Enabled = True Then
                If AIDebug = 1 Then cmdTick(I).BackColor = &HFF& Else cmdTick(I).BackColor = &H8000000F
            End If
        Next I
    End If
End Sub

Private Sub tmrAI1_Timer()

    If P1CompAITurn = True Then
        If AIDifP1 = 1 Then Call AI1_Easy
        'If AIDifP1 = 2 Then Call AI1_Normal
        If AIDifP1 = 3 Then Call AI1_Hard
        If AIDifP1 = 4 Then Call AI1_Impossible
    End If
    
End Sub

Private Sub tmrAI2_Timer()

    If P2CompAITurn = True Then
        If AIDifP2 = 1 Then Call AI2_Easy
        'If AIDifP2 = 2 Then Call AI2_Normal
        If AIDifP2 = 3 Then Call AI2_Hard
        If AIDifP2 = 4 Then Call AI2_Impossible
    End If
    
End Sub

Private Sub tmrTurn_Timer()

    'Os
    If GameCount Mod 2 = 1 Then
        If TurnCount Mod 2 = 0 Then
            lblTurn.Caption = "Turn: " & P1Char
            PNum = -1
            ONum = 1
            If tmrAI1.Enabled = True Then P1CompAITurn = True Else P1CompAITurn = False
        Else
            lblTurn.Caption = "Turn: " & P2Char
            PNum = 1
            ONum = -1
            If tmrAI2.Enabled = True Then P2CompAITurn = True Else P2CompAITurn = False
        End If
    End If
    
    'Xs
    If GameCount Mod 2 = 0 Then
        If TurnCount Mod 2 = 1 Then
            lblTurn.Caption = "Turn: " & P1Char
            PNum = -1
            ONum = 1
            If tmrAI1.Enabled = True Then P1CompAITurn = True Else P1CompAITurn = False
        Else
            lblTurn.Caption = "Turn: " & P2Char
            PNum = 1
            ONum = -1
            If tmrAI2.Enabled = True Then P2CompAITurn = True Else P2CompAITurn = False
        End If
    End If
    
End Sub

Private Sub txtP1Char_Change()

    P1Char = txtP1Char.Text
    lblXwins.Caption = P1Char & ": " & XwinCount
    
End Sub

Private Sub txtP2Char_Change()

    P2Char = txtP2Char.Text
    lblOwins.Caption = P2Char & ": " & OwinCount
    
End Sub
