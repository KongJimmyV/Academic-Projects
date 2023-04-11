VERSION 5.00
Begin VB.Form frmConnect4 
   BackColor       =   &H00004000&
   Caption         =   "Connect Four"
   ClientHeight    =   11175
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   21150
   ForeColor       =   &H00000000&
   LinkTopic       =   "Form1"
   ScaleHeight     =   11175
   ScaleWidth      =   21150
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrDice2 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   14640
      Top             =   3600
   End
   Begin VB.Timer tmrDice1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   14040
      Top             =   3600
   End
   Begin VB.CommandButton cmdDice 
      Caption         =   "Roll Dice"
      Height          =   495
      Left            =   15000
      TabIndex        =   43
      Top             =   4680
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   41
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   40
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   39
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   38
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   37
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   37
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   36
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   35
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   34
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   33
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   32
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   31
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   30
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   29
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   28
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   27
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   26
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   25
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   24
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   23
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   22
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   21
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   20
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   19
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   18
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   17
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   16
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   15
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   14
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   13
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   12
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   11
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   10
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   9
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   8
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   7
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   6
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   5
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   4
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   3
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   2
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   1
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   0
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   8760
      Width           =   975
   End
   Begin VB.Label lblDice 
      BackStyle       =   0  'Transparent
      Caption         =   "Dice: 0"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   14040
      TabIndex        =   42
      Top             =   4800
      Width           =   975
   End
   Begin VB.Shape shpP1 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   2
      Left            =   14520
      Shape           =   3  'Circle
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Shape shpP1 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   1
      Left            =   14520
      Shape           =   3  'Circle
      Top             =   8520
      Width           =   1215
   End
   Begin VB.Shape shpP2 
      BackColor       =   &H00404040&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   2
      Left            =   13080
      Shape           =   3  'Circle
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Shape shpP2 
      BackColor       =   &H00404040&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   1
      Left            =   13080
      Shape           =   3  'Circle
      Top             =   8520
      Width           =   1215
   End
   Begin VB.Shape shpP1 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   0
      Left            =   14520
      Shape           =   3  'Circle
      Top             =   8640
      Width           =   1215
   End
   Begin VB.Shape shpP2 
      BackColor       =   &H00404040&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   0
      Left            =   13080
      Shape           =   3  'Circle
      Top             =   8640
      Width           =   1215
   End
   Begin VB.Menu mnuNewGame 
      Caption         =   "New Game"
   End
   Begin VB.Menu mnuGrid 
      Caption         =   "Show Grid"
   End
End
Attribute VB_Name = "frmConnect4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Index As Integer
Dim ShapeNum1 As Integer
Dim ShapeNum2 As Integer
Dim GameCount As Integer
Dim TurnCount As Integer
Dim Winner As Boolean

Dim Row As Integer
Dim Row2 As Integer
Dim Col As Integer
Dim Col2 As Integer
Dim P1Wins As Integer
Dim P2Wins As Integer
Dim Draws As Integer
Dim Grid(-3 To 8, -3 To 9) As Integer
Dim PlayerTurn As Integer
Dim AIRandom As Integer



Private Sub cmd_Click(Index As Integer)

    TurnCount = TurnCount + 1
    cmd(Index).Enabled = False
    'cmd(Index).Visible = False
    
    Col = Index Mod 7
    Row = 6 - (Index \ 7 + 1)
    
    If Index <= 34 Then
        cmd(Index + 7).Enabled = True
        cmd(Index + 7).Visible = True
    End If
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
        'P1
        cmd(Index).BackColor = vbRed
        Grid(Row, Col) = -1
        'Sets p2's turn
        PlayerTurn = 2
        Call AI2
    End If
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        'P2
        cmd(Index).BackColor = vbBlack
        Grid(Row, Col) = 1
        'Sets p1's turn
        PlayerTurn = 1
    End If
    
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
        'P1
        cmd(Index).BackColor = vbRed
        Grid(Row, Col) = -1
        'Sets p2's turn
        PlayerTurn = 2
        Call AI2
    End If
    
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        'P2
        cmd(Index).BackColor = vbBlack
        Grid(Row, Col) = 1
        'Sets p1's turn
        PlayerTurn = 1
    End If
    
    ShapeNum = ShapeNum + 1
    
    'read winnercheck for code ^^^
    Call WinnerCheck
    
End Sub

Private Sub cmdDice_Click()

A:
    If cmdDice.Caption = "Roll Dice" Then
    tmrDice1.Enabled = True
    cmdDice.Caption = "Stop Dice"
    GoTo B:
    End If
    
    If cmdDice.Caption = "Stop Dice" Then
    tmrDice2.Enabled = True
    cmdDice.Enabled = False
    GoTo B:
    End If
B:
    'tmrDice2.Enabled = True
    
End Sub

Private Sub Form_Load()

    GameCount = 1
    
    For i = 0 To 6
        cmd(i).Enabled = True
        cmd(i).Visible = True
    Next i
    For i = 7 To 41
        cmd(i).Enabled = False
        cmd(i).Visible = False
    Next i
    
End Sub

Private Sub mnuGrid_Click()

    'Show Grid
    Cls
    For r = 0 To 5
        For C = 0 To 6
            Print Grid(r, C);
        Next C
        Print:
    Next r
    
End Sub

Private Sub mnuNewGame_Click()

    Cls
    
    Winner = False
    GameCount = GameCount + 1
    TurnCount = 0
    
    If GameCount = 0 Then PlayerTurn = 1
    If GameCount = 1 Then PlayerTurn = 2
    
    'clear cmds
    For C = 0 To 41
        cmd(C).Enabled = False
        cmd(C).Visible = False
        cmd(C).BackColor = &H8000000F
    Next C
    
    For B = 0 To 6
        cmd(B).Enabled = True
        cmd(B).Visible = True
        cmd(B).BackColor = &H8000000F
    Next B
    
    'Reset Grid
    For Row = 0 To 5
        For Col = 0 To 6
            Grid(Row, Col) = 0
        Next Col
    Next Row
    
End Sub

Private Sub WinnerCheck()

    'Win Check
    For i = 0 To 41
        Col2 = i Mod 7
        Row2 = 6 - (i \ 7 + 1)
        
        '
        'Check Left
        If Abs(Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row, Col2 - 2) + Grid(Row2, Col2 - 3)) = 4 Then
            Winner = True
            i = 42
            Print Abs(Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row, Col2 - 2) + Grid(Row2, Col2 - 3)) & "  LEFT CHECK"
        End If
        '
        'Check Right
        'Abs(-1 + -1 + 1 + 1) = 4
        If Abs(Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = 4 Then
            Winner = True
            i = 42
            Print Abs(Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) & "  RIGHT CHECK"
        End If
        '
        'Check Up
        If Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = 4 Then
            Winner = True
            i = 42
            Print Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) & "  UP CHECK"
        End If
        '
        'Check Down
        If Abs(Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = 4 Then
            Winner = True
            i = 42
            Print Abs(Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) & "  DOWN CHECK"
        End If
        '
        'Check Left Diagonal
        If Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = 4 Then
            Winner = True
            i = 42
            Print Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) & "  UP LEFT CHECK"
        End If
        '
        'Check Right Diagonal
        If Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = 4 Then
            Winner = True
            i = 42
            Print Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) & "  UP RIGHT CHECK"
        End If
    Next i
    
    If Winner = True And PlayerTurn = 1 Then
        'blk piece wins
        MsgBox "Black Wins", , "Black Wins"
        P1Wins = P1Wins + 1
    End If
    If Winner = True And PlayerTurn = 2 Then
        'red piece wins
        MsgBox "Red Wins", , "Red Wins"
        P2Wins = P2Wins + 1
    End If
    
End Sub

Private Sub AI2()

    AIRandom = Int(0 + Rnd * 41)
    
    'Call AIPick
    
End Sub

Private Sub AIPick()

    TurnCount = TurnCount + 1
    cmd(Index).Enabled = False
    'cmd(Index).Visible = False
    
    Col = Index Mod 7
    Row = 6 - (Index \ 7 + 1)
    
    If Index <= 34 Then
        cmd(Index + 7).Enabled = True
        cmd(Index + 7).Visible = True
    End If

    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        'P2
        cmd(Index).BackColor = vbBlack
        Grid(Row, Col) = 1
        'Sets p1's turn
        PlayerTurn = 1
    End If

    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        'P2
        cmd(Index).BackColor = vbBlack
        Grid(Row, Col) = 1
        'Sets p1's turn
        PlayerTurn = 1
    End If
    
    ShapeNum = ShapeNum + 1
    
    'read winnercheck for code ^^^
    Call WinnerCheck
    
End Sub

Private Sub tmrDice1_Timer()

    red = Int(1 + Rnd * 255)
    greed = Int(1 + Rnd * 255)
    blue = Int(1 + Rnd * 255)
    
    RandomDice = Int(1 + Rnd * 6)
    lblDice.Caption = "Dice: " & RandomDice
    lblDice.ForeColor = RGB(red, green, blue)
    
End Sub

Private Sub tmrDice2_Timer()

    tmrDice1.Interval = (tmrDice1.Interval + 10)
    
    timeing = Int(1000 + Rnd * 2000)
    
    If tmrDice1.Interval > timeing Then
        tmrDice1.Interval = 1
        tmrDice1.Enabled = False
        tmrDice2.Enabled = False
        cmdDice.Enabled = True
        cmdDice.Caption = "Roll Dice"
        lblDice.ForeColor = RGB(255, 255, 255)
    End If

End Sub
