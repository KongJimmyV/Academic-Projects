VERSION 5.00
Begin VB.Form frmTicTacToe 
   BackColor       =   &H00000000&
   Caption         =   "Tic-Tac-Toe"
   ClientHeight    =   12150
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   13215
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   12150
   ScaleWidth      =   13215
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrAIPick 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   120
      Top             =   3840
   End
   Begin VB.Timer tmrAI 
      Interval        =   50
      Left            =   120
      Top             =   3240
   End
   Begin VB.Timer tmrTurn 
      Interval        =   50
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
   Begin VB.Label lblCatsCount 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Cats Games: 0"
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
      Caption         =   "Turn: X"
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
End
Attribute VB_Name = "frmTicTacToe"
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
Dim TurnCount As Integer
Dim GameCount As Integer
Dim P1Char As String
Dim P2Char As String
Dim Winner As Boolean
Dim Bit(1 To 9) As Single
Dim n As Single

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
    
    
    '''Diagonal Is Reached'''
    'P1 win check
    If (cmdTick(0).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(8).Caption = "X") Or (cmdTick(2).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(6).Caption = "X") Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (cmdTick(0).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(8).Caption = "X") Then
            cmdTick(0).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        If (cmdTick(2).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(6).Caption = "X") Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        
        Winner = True
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 0 To 8
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = "X: " & XwinCount
    End If
    
    'P2 win check
    If (cmdTick(0).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(8).Caption = "O") Or (cmdTick(2).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(6).Caption = "O") Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (cmdTick(0).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(8).Caption = "O") Then
            cmdTick(0).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        If (cmdTick(2).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(6).Caption = "O") Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        
        Winner = True
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 0 To 8
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = "O: " & OwinCount
    End If
    
    
    '''Horizontal Is Reached'''
    'P1 win check
    If (cmdTick(0).Caption = "X" And cmdTick(1).Caption = "X" And cmdTick(2).Caption = "X") Or (cmdTick(3).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(5).Caption = "X") Or (cmdTick(6).Caption = "X" And cmdTick(7).Caption = "X" And cmdTick(8).Caption = "X") Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (cmdTick(0).Caption = "X" And cmdTick(1).Caption = "X" And cmdTick(2).Caption = "X") Then
            cmdTick(0).BackColor = &HFF00&
            cmdTick(1).BackColor = &HFF00&
            cmdTick(2).BackColor = &HFF00&
        End If
        If (cmdTick(3).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(5).Caption = "X") Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
        End If
        If (cmdTick(6).Caption = "X" And cmdTick(7).Caption = "X" And cmdTick(8).Caption = "X") Then
            cmdTick(6).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        
        Winner = True
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 0 To 8
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = "X: " & XwinCount
    End If
    
    'P2 win check
    If (cmdTick(0).Caption = "O" And cmdTick(1).Caption = "O" And cmdTick(2).Caption = "O") Or (cmdTick(3).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(5).Caption = "O") Or (cmdTick(6).Caption = "O" And cmdTick(7).Caption = "O" And cmdTick(8).Caption = "O") Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (cmdTick(0).Caption = "O" And cmdTick(1).Caption = "O" And cmdTick(2).Caption = "O") Then
            cmdTick(0).BackColor = &HFF00&
            cmdTick(1).BackColor = &HFF00&
            cmdTick(2).BackColor = &HFF00&
        End If
        If (cmdTick(3).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(5).Caption = "O") Then
            cmdTick(3).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
        End If
        If (cmdTick(6).Caption = "O" And cmdTick(7).Caption = "O" And cmdTick(8).Caption = "O") Then
            cmdTick(6).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        
        Winner = True
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 0 To 8
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = "O: " & OwinCount
    End If
    
    '''Vertical Is Reached'''
    'P1 win check
    If (cmdTick(0).Caption = "X" And cmdTick(3).Caption = "X" And cmdTick(6).Caption = "X") Or (cmdTick(1).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(7).Caption = "X") Or (cmdTick(2).Caption = "X" And cmdTick(5).Caption = "X" And cmdTick(8).Caption = "X") Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (cmdTick(0).Caption = "X" And cmdTick(3).Caption = "X" And cmdTick(6).Caption = "X") Then
            cmdTick(0).BackColor = &HFF00&
            cmdTick(3).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        If (cmdTick(1).Caption = "X" And cmdTick(4).Caption = "X" And cmdTick(7).Caption = "X") Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        If (cmdTick(2).Caption = "X" And cmdTick(5).Caption = "X" And cmdTick(8).Caption = "X") Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        
        Winner = True
        
        MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
        For I = 0 To 8
            cmdTick(I).Enabled = False
        Next I
        XwinCount = XwinCount + 1
        lblXwins.Caption = "X: " & XwinCount
    End If
    
    'P2 win check
    If (cmdTick(0).Caption = "O" And cmdTick(3).Caption = "O" And cmdTick(6).Caption = "O") Or (cmdTick(1).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(7).Caption = "O") Or (cmdTick(2).Caption = "O" And cmdTick(5).Caption = "O" And cmdTick(8).Caption = "O") Then
        tmrTurn.Enabled = False
        'Shows where the cross over is
        If (cmdTick(0).Caption = "O" And cmdTick(3).Caption = "O" And cmdTick(6).Caption = "O") Then
            cmdTick(0).BackColor = &HFF00&
            cmdTick(3).BackColor = &HFF00&
            cmdTick(6).BackColor = &HFF00&
        End If
        If (cmdTick(1).Caption = "O" And cmdTick(4).Caption = "O" And cmdTick(7).Caption = "O") Then
            cmdTick(1).BackColor = &HFF00&
            cmdTick(4).BackColor = &HFF00&
            cmdTick(7).BackColor = &HFF00&
        End If
        If (cmdTick(2).Caption = "O" And cmdTick(5).Caption = "O" And cmdTick(8).Caption = "O") Then
            cmdTick(2).BackColor = &HFF00&
            cmdTick(5).BackColor = &HFF00&
            cmdTick(8).BackColor = &HFF00&
        End If
        
        Winner = True
        
        MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
        For I = 0 To 8
            cmdTick(I).Enabled = False
        Next I
        OwinCount = OwinCount + 1
        lblOwins.Caption = "O: " & OwinCount
    End If
    
    'No one wins
    If TurnCount >= 9 And Winner = False Then
        MsgBox "Cat's Game", vbOKOnly, "Tie"
        CatsCount = CatsCount + 1
        lblCatsCount.Caption = "Cat's Games: " & CatsCount
        For I = 0 To 8
            cmdTick(I).Enabled = False
        Next I
    End If
    
End Sub

Private Sub cmdNewGame_Click()

    TurnCount = 0
    GameCount = GameCount + 1
    tmrTurn.Enabled = True
    Winner = False
    For I = 0 To 8
        cmdTick(I).Caption = ""
        cmdTick(I).Enabled = True
        cmdTick(I).BackColor = &H8000000F
    Next I
    
End Sub

Private Sub Form_Load()

    Winner = False
    
    P1Char = "X"
    P2Char = "O"
    
    XwinCount = 0
    OwinCount = 0
    
    GameCount = 1
    
End Sub

Private Sub mnuNewGame_Click()

    TurnCount = 0
    GameCount = GameCount + 1
    tmrTurn.Enabled = True
    Winner = False
    For I = 0 To 8
        cmdTick(I).Caption = ""
        cmdTick(I).Enabled = True
        cmdTick(I).BackColor = &H8000000F
    Next I
    
End Sub

Private Sub tmrAI_Timer()

    If TurnCount Mod 2 = 0 Then
        tmrAI.Enabled = False
        tmrAIPick.Enabled = True
    End If
    
End Sub

Private Sub tmrAIPick_Timer()

    If GameCount Mod 2 = 0 Then
        If TurnCount Mod 2 = 0 Then
            tmrAIPick.Enabled = False
            tmrAI.Enabled = True
        Else
            cmdTick(Index).Caption = P2Char
            TurnCount = TurnCount + 1
            tmrAIPick.Enabled = False
            tmrAI.Enabled = True
        End If
    End If
    
    If GameCount Mod 2 = 1 Then
        If TurnCount Mod 2 = 1 Then
            tmrAIPick.Enabled = False
            tmrAI.Enabled = True
        Else
            cmdTick(Index).Caption = P2Char
            TurnCount = TurnCount + 1
            tmrAIPick.Enabled = False
            tmrAI.Enabled = True
        End If
    End If
    
End Sub

Private Sub tmrTurn_Timer()

    'Os
    If GameCount Mod 2 = 1 Then
        If TurnCount Mod 2 = 1 Then
            lblTurn.Caption = "Turn: O"
        Else
            lblTurn.Caption = "Turn: X"
        End If
    End If
    
    'Xs
    If GameCount Mod 2 = 0 Then
        If TurnCount Mod 2 = 0 Then
            lblTurn.Caption = "Turn: O"
        Else
            lblTurn.Caption = "Turn: X"
        End If
    End If
    
End Sub
