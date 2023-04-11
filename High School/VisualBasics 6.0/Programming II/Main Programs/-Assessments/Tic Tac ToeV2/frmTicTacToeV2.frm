VERSION 5.00
Begin VB.Form frmTicTacToeV2 
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
   Begin VB.Line lneD1 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   3000
      X2              =   10440
      Y1              =   2400
      Y2              =   9480
   End
   Begin VB.Line lneD2 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   2880
      X2              =   10440
      Y1              =   9480
      Y2              =   2280
   End
   Begin VB.Line lneC3 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   8880
      X2              =   8880
      Y1              =   2160
      Y2              =   9720
   End
   Begin VB.Line lneC2 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   6720
      X2              =   6720
      Y1              =   2160
      Y2              =   9720
   End
   Begin VB.Line lneC1 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   4440
      X2              =   4440
      Y1              =   2160
      Y2              =   9720
   End
   Begin VB.Line lneR1 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   2760
      X2              =   10680
      Y1              =   3720
      Y2              =   3720
   End
   Begin VB.Line lneR2 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   2760
      X2              =   10680
      Y1              =   5880
      Y2              =   5880
   End
   Begin VB.Line lneR3 
      BorderColor     =   &H0000FF00&
      BorderWidth     =   50
      Visible         =   0   'False
      X1              =   2760
      X2              =   10680
      Y1              =   8040
      Y2              =   8040
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
   End
   Begin VB.Menu mnu1EnableAI 
      Caption         =   "Enable P2 AI"
   End
End
Attribute VB_Name = "frmTicTacToeV2"
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
Dim PWinInt As Integer
Dim Winner As Boolean
Dim GridArray(1 To 3, 1 To 3) As Integer 'Grid
Dim R As Integer 'horizontal
Dim C As Integer 'vertical

Private Sub Tick()

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
        Else
            cmdTick(Index).Caption = P2Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = -1
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
        Else
            cmdTick(Index).Caption = P2Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = -1
        End If
    End If
    
    'Declares PWinInt based on turn
    If GameCount Mod 2 = 1 Then
    If TurnCount Mod 2 = 1 Then
        PWinInt = 3
        Else
        PWinInt = -3
    End If
    End If
    If GameCount Mod 2 = 0 Then
    If TurnCount Mod 2 = 0 Then
        PWinInt = -3
        Else
        PWinInt = 3
    End If
    End If
    ''Grid Check''
    'Player win check
    Select Case Index
        Case 1: 'R = 3, C = 1
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C + 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R - 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C + 1) + GridArray(R - 2, C + 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 2: 'R = 3, C = 2
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C + 1) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R - 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 3: 'R = 3, C = 1
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C - 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R - 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C - 1) + GridArray(R - 2, C - 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 4: 'R = 2, C = 1
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C + 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R + 1, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 5: 'R = 2, C = 2
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C - 1) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R - 1, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C - 1) + GridArray(R + 1, C + 1) = PWinInt Then 'Diagonal1 Check
                tmrTurn.Enabled = False
                lneD1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C - 1) + GridArray(R - 1, C + 1) = PWinInt Then 'Diagonal2 Check
                tmrTurn.Enabled = False
                lneD2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 6: 'R = 2, C = 3
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C - 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R + 1, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 7: 'R = 1, C = 1
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C + 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R + 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C + 1) + GridArray(R + 2, C + 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 8: 'R = 1, C = 2
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C + 1) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R + 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 9: 'R = 1, C = 3
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C - 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R + 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C - 1) + GridArray(R + 2, C - 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
    End Select
        
    
    'No one wins
    If TurnCount >= 9 And Winner = False Then
        MsgBox "Cat's Game", vbOKOnly, "Tie"
        CatsCount = CatsCount + 1
        lblCatsCount.Caption = "Cat's Games: " & CatsCount
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
    End If

End Sub

Private Sub WinnerCheck()

    If GameCount Mod 2 = 1 Then
        Print "WinnerCheck"
        If TurnCount Mod 2 = 1 Then
            If Winner = True Then
                MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
                For I = 1 To 9
                    cmdTick(I).Enabled = False
                Next I
                XwinCount = XwinCount + 1
                lblXwins.Caption = P1Char & ": " & XwinCount
            End If
        End If
        
        If TurnCount Mod 2 = 0 Then
            If Winner = True Then
                MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
                For I = 1 To 9
                    cmdTick(I).Enabled = False
                Next I
                OwinCount = OwinCount + 1
                lblOwins.Caption = P2Char & ": " & OwinCount
            End If
        End If
    End If
    
    If GameCount Mod 2 = 0 Then
        Print "WinnerCheck"
        If TurnCount Mod 2 = 1 Then
            If Winner = True Then
                MsgBox P1Char & " Wins!!!", , P1Char & " Wins!!!"
                For I = 1 To 9
                    cmdTick(I).Enabled = False
                Next I
                XwinCount = XwinCount + 1
                lblXwins.Caption = P1Char & ": " & XwinCount
            End If
        End If
        
        If TurnCount Mod 2 = 0 Then
            If Winner = True Then
                MsgBox P2Char & " Wins!!!", , P2Char & " Wins!!!"
                For I = 1 To 9
                    cmdTick(I).Enabled = False
                Next I
                OwinCount = OwinCount + 1
                lblOwins.Caption = P2Char & ": " & OwinCount
            End If
        End If
    End If
End Sub

Private Sub cmdTick_Click(Index As Integer)

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
        Else
            cmdTick(Index).Caption = P2Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = -1
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
        Else
            cmdTick(Index).Caption = P2Char
            'Align width grid (NUMERICAL ANALYSIS)
            R = 3 - ((Index - 1) \ 3)
            C = ((Index - 1) Mod 3) + 1
            GridArray(R, C) = -1
        End If
    End If
    
    'Declares PWinInt based on turn
    If TurnCount Mod 2 = 1 Then
        PWinInt = 3
    End If
    If TurnCount Mod 2 = 0 Then
        PWinInt = -3
    End If
    ''Grid Check''
    'Player win check
    Select Case Index
        Case 1: 'R = 3, C = 1
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C + 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R - 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C + 1) + GridArray(R - 2, C + 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 2: 'R = 3, C = 2
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C + 1) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R - 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 3: 'R = 3, C = 1
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C - 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R - 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C - 1) + GridArray(R - 2, C - 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 4: 'R = 2, C = 1
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C + 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R + 1, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 5: 'R = 2, C = 2
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C - 1) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R - 1, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C - 1) + GridArray(R + 1, C + 1) = PWinInt Then 'Diagonal1 Check
                tmrTurn.Enabled = False
                lneD1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C - 1) + GridArray(R - 1, C + 1) = PWinInt Then 'Diagonal2 Check
                tmrTurn.Enabled = False
                lneD2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 6: 'R = 2, C = 3
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C - 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R - 1, C) + GridArray(R + 1, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC3.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 7: 'R = 1, C = 1
            If GridArray(R, C) + GridArray(R, C + 1) + GridArray(R, C + 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R + 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C + 1) + GridArray(R + 2, C + 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 8: 'R = 1, C = 2
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C + 1) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R + 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
        Case 9: 'R = 1, C = 3
            If GridArray(R, C) + GridArray(R, C - 1) + GridArray(R, C - 2) = PWinInt Then 'Horizontal Check
                tmrTurn.Enabled = False
                lneR1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C) + GridArray(R + 2, C) = PWinInt Then 'Vertical Check
                tmrTurn.Enabled = False
                lneC1.Visible = True
                Winner = True
                Call WinnerCheck
            End If
            If GridArray(R, C) + GridArray(R + 1, C - 1) + GridArray(R + 2, C - 2) = PWinInt Then 'Diagonal Check
                tmrTurn.Enabled = False
                lneD2.Visible = True
                Winner = True
                Call WinnerCheck
            End If
    End Select
        
    
    'No one wins
    If TurnCount >= 9 And Winner = False Then
        MsgBox "Cat's Game", vbOKOnly, "Tie"
        CatsCount = CatsCount + 1
        lblCatsCount.Caption = "Cat's Games: " & CatsCount
        For I = 1 To 9
            cmdTick(I).Enabled = False
        Next I
    End If
    
End Sub

Private Sub cmdNewGame_Click()

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
    
    'Reset lines
    lneR1.Visible = False
    lneR2.Visible = False
    lneR3.Visible = False
    lneC1.Visible = False
    lneC2.Visible = False
    lneC3.Visible = False
    lneD1.Visible = False
    lneD2.Visible = False
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyNumpad1 Or vbKey1 Then
        lneR1.Visible
        Print Index
        Index = 1
        Call Tick
    End If
    
End Sub

Private Sub Form_Load()

    Winner = False
    
    P1Char = "X"
    P2Char = "O"
    
    XwinCount = 0
    OwinCount = 0
    
    GameCount = 1
    
    'Reset lines
    lneR1.Visible = False
    lneR2.Visible = False
    lneR3.Visible = False
    lneC1.Visible = False
    lneC2.Visible = False
    lneC3.Visible = False
    lneD1.Visible = False
    lneD2.Visible = False
    
End Sub

Private Sub mnuNewGame_Click()

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
    
    'Reset lines
    lneR1.Visible = False
    lneR2.Visible = False
    lneR3.Visible = False
    lneC1.Visible = False
    lneC2.Visible = False
    lneC3.Visible = False
    lneD1.Visible = False
    lneD2.Visible = False
    
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

Private Sub tmrAI_Timer()

    Call AI
    Call AIComp
    
End Sub

Private Sub AI()

End Sub

Private Sub AIComp()

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
