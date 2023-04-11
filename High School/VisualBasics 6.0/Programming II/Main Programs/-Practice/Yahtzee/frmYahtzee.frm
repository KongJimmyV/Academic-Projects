VERSION 5.00
Begin VB.Form frmYahtzee 
   Caption         =   "Yahtzee!"
   ClientHeight    =   7935
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   15015
   LinkTopic       =   "Form1"
   ScaleHeight     =   7935
   ScaleWidth      =   15015
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdScore 
      Caption         =   "Check Score"
      Height          =   375
      Left            =   6840
      TabIndex        =   19
      Top             =   1320
      Width           =   1095
   End
   Begin VB.Timer tmrCheck 
      Interval        =   10
      Left            =   7200
      Top             =   720
   End
   Begin VB.CommandButton cmdNextPlayer 
      Caption         =   "Next Player"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6840
      TabIndex        =   24
      Top             =   1680
      Width           =   1095
   End
   Begin VB.CheckBox chkYahtzee 
      Caption         =   "Yahtzee"
      Height          =   255
      Left            =   2520
      TabIndex        =   10
      Top             =   6600
      Width           =   3735
   End
   Begin VB.CheckBox chkFullHouse 
      Caption         =   "Full House"
      Height          =   255
      Left            =   2520
      TabIndex        =   9
      Top             =   6360
      Width           =   3735
   End
   Begin VB.Frame fraScores 
      Caption         =   "Scores"
      Height          =   2175
      Left            =   2400
      TabIndex        =   6
      Top             =   5040
      Width           =   10095
      Begin VB.CheckBox chk6s 
         Caption         =   "6's"
         Height          =   255
         Left            =   6240
         TabIndex        =   18
         Top             =   1560
         Width           =   3735
      End
      Begin VB.CheckBox chk1s 
         Caption         =   "1's"
         Height          =   255
         Left            =   6240
         TabIndex        =   17
         Top             =   360
         Width           =   3735
      End
      Begin VB.CheckBox chk3s 
         Caption         =   "3's"
         Height          =   255
         Left            =   6240
         TabIndex        =   16
         Top             =   840
         Width           =   3735
      End
      Begin VB.CheckBox chk4s 
         Caption         =   "4's"
         Height          =   255
         Left            =   6240
         TabIndex        =   15
         Top             =   1080
         Width           =   3735
      End
      Begin VB.CheckBox chk5s 
         Caption         =   "5's"
         Height          =   255
         Left            =   6240
         TabIndex        =   14
         Top             =   1320
         Width           =   3735
      End
      Begin VB.CheckBox chk4ofAKind 
         Caption         =   "4 of a Kind"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   600
         Width           =   3735
      End
      Begin VB.CheckBox chkLgStraight 
         Caption         =   "Large Straight"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   1080
         Width           =   3735
      End
      Begin VB.CheckBox chk2s 
         Caption         =   "2's"
         Height          =   255
         Left            =   6240
         TabIndex        =   11
         Top             =   600
         Width           =   3735
      End
      Begin VB.CheckBox chkSmStraight 
         Caption         =   "Small Straight"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   840
         Width           =   3735
      End
      Begin VB.CheckBox chk3ofAKind 
         Caption         =   "3 of a Kind"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   3735
      End
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   5
      Left            =   9840
      TabIndex        =   5
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   4
      Left            =   8400
      TabIndex        =   4
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   3
      Left            =   6960
      TabIndex        =   3
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   2
      Left            =   5520
      TabIndex        =   2
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   1
      Left            =   4080
      TabIndex        =   1
      Top             =   4080
      Width           =   855
   End
   Begin VB.Timer tmrD2 
      Enabled         =   0   'False
      Interval        =   750
      Left            =   7560
      Top             =   4560
   End
   Begin VB.Timer tmrD1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   6840
      Top             =   4560
   End
   Begin VB.CommandButton cmdRoll 
      Caption         =   "Roll"
      Height          =   375
      Left            =   6840
      TabIndex        =   0
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label lblOverallScore 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Overall Score: 0"
      Height          =   255
      Left            =   840
      TabIndex        =   25
      Top             =   2520
      Width           =   2655
   End
   Begin VB.Label lblLowerScore 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Lower Score: 0"
      Height          =   255
      Left            =   840
      TabIndex        =   26
      Top             =   2280
      Width           =   2655
   End
   Begin VB.Label lblUpperScoreBonus 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Upper Score Bonus: 0"
      Height          =   255
      Left            =   840
      TabIndex        =   27
      Top             =   2040
      Width           =   2655
   End
   Begin VB.Label lblUpperScore 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Upper Score: 0"
      Height          =   255
      Left            =   840
      TabIndex        =   28
      Top             =   1800
      Width           =   2655
   End
   Begin VB.Label lblPlayer2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Player 2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   11400
      TabIndex        =   30
      Top             =   1200
      Width           =   2655
   End
   Begin VB.Label lblPlayer1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Player 1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   840
      TabIndex        =   29
      Top             =   1200
      Width           =   2655
   End
   Begin VB.Label lblOverallScore2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Overall Score: 0"
      Height          =   255
      Left            =   11400
      TabIndex        =   23
      Top             =   2520
      Width           =   2655
   End
   Begin VB.Label lblLowerScore2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Lower Score: 0"
      Height          =   255
      Left            =   11400
      TabIndex        =   22
      Top             =   2280
      Width           =   2655
   End
   Begin VB.Label lblUpperScoreBonus2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Upper Score Bonus: 0"
      Height          =   255
      Left            =   11400
      TabIndex        =   21
      Top             =   2040
      Width           =   2655
   End
   Begin VB.Label lblUpperScore2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Upper Score: 0"
      Height          =   255
      Left            =   11400
      TabIndex        =   20
      Top             =   1800
      Width           =   2655
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   3
      Left            =   6720
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   4
      Left            =   8160
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   5
      Left            =   9600
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   2
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   1
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Menu mnuNewGame 
      Caption         =   "New Game"
   End
   Begin VB.Menu mnuShowDice 
      Caption         =   "Show Dice"
   End
   Begin VB.Menu mnuShowOrderedDice 
      Caption         =   "Show Ordered Dice"
   End
End
Attribute VB_Name = "frmYahtzee"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim D(1 To 5) As Integer
Dim Hold(1 To 5) As Integer
Dim OrdArray(1 To 5) As Integer
Dim DArray(1 To 5) As Integer
Dim TurnCount As Integer
Dim Temp As Single

Dim CountNum As Integer
'scores
Dim Score3OfAKind As Integer
Dim Score4OfAKind As Integer
Dim ScoreFHouse As Integer
Dim ScoreSmStr8 As Integer
Dim ScoreLgStr8 As Integer
Dim ScoreYahtzee As Integer
Dim Score1s As Integer
Dim Score2s As Integer
Dim Score3s As Integer
Dim Score4s As Integer
Dim Score5s As Integer
Dim Score6s As Integer

Dim Got3OfAKind As Boolean
Dim Got4OfAKind As Boolean
Dim GotFHouse As Boolean
Dim GotSmStr8 As Boolean
Dim GotLgStr8 As Boolean
Dim GotYahtzee As Boolean
Dim Got1s As Boolean
Dim Got2s As Boolean
Dim Got3s As Boolean
Dim Got4s As Boolean
Dim Got5s As Boolean
Dim Got6s As Boolean

Dim UpperSubTotal As Integer
Dim UpperTotal As Integer
Dim UpperBonus As Integer
Dim LowerTotal As Integer
Dim Total As Integer
Dim Swapped As Integer

Dim AI As Boolean
Dim Player1Turn As Boolean
Dim Player2Turn As Boolean

Private Sub chk1s_Click()
    
    For t = 1 To 5
        If D(t) = 1 Then
            CountNum = CountNum + 1
        End If
    Next t
    
    Score1s = CountNum * 1
    MsgBox ("You got " & Score1s & " points!")
    CountNum = 0
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chk2s_Click()
    
    For t = 1 To 5
        If D(t) = 2 Then
            CountNum = CountNum + 1
        End If
    Next t
    
    Score2s = CountNum * 2
    MsgBox ("You got " & Score2s & " points!")
    CountNum = 0
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chk3ofaKind_Click()

    chk3ofAKind.Enabled = False
    
    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3)) _
    Or (OrdArray(2) = OrdArray(3) And OrdArray(3) = OrdArray(4)) _
    Or (OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5)) Then
        Got3OfAKind = True
        Score3OfAKind = OrdArray(1) + OrdArray(2) + OrdArray(3) + OrdArray(4) + OrdArray(5)
        MsgBox "You have a '3 of A Kind'!" & " " & Score3OfAKind, vbExclamation, "3 of A Kind!"
        chk3ofAKind.Enabled = False
        'update Lower Total
    Else
        MsgBox "You Don't Have '3 of A Kind'!", vbExclamation, "3 of A Kind!"
        chk3ofAKind.Enabled = True
    End If
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chk3s_Click()
    
    For t = 1 To 5
        If D(t) = 3 Then
            CountNum = CountNum + 1
        End If
    Next t
    
    Score3s = CountNum * 3
    MsgBox ("You got " & Score3s & " points!")
    CountNum = 0
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chk4ofAKind_Click()

    chk4ofAKind.Enabled = False
    
    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3) And OrdArray(3) = OrdArray(4)) _
    Or (OrdArray(2) = OrdArray(3) And OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5)) Then
        Got4OfAKind = True
        Score4OfAKind = OrdArray(1) + OrdArray(2) + OrdArray(3) + OrdArray(4) + OrdArray(5)
        chk4ofAKind.Enabled = False
        MsgBox "You have a '4 of A Kind'!" & " " & Score4OfAKind, vbExclamation, "4 of A Kind!"
        'update Lower Total
    Else
        MsgBox "You Don't Have '4 of A Kind'!", vbExclamation, "4 of A Kind!"
        chk4ofAKind.Enabled = True
    End If
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chk4s_Click()
    
    For t = 1 To 5
        If D(t) = 4 Then
            CountNum = CountNum + 1
        End If
    Next t
    
    Score4s = CountNum * 4
    MsgBox ("You got " & Score4s & " points!")
    CountNum = 0
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chk5s_Click()
    
    For t = 1 To 5
        If D(t) = 5 Then
            CountNum = CountNum + 1
        End If
    Next t
    
    Score5s = CountNum * 5
    MsgBox ("You got " & Score5s & " points!")
    CountNum = 0
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chk6s_Click()
    
    For t = 1 To 5
        If D(t) = 6 Then
            CountNum = CountNum + 1
        End If
    Next t
    
    Score6s = CountNum * 6
    MsgBox ("You got " & Score6s & " points!")
    CountNum = 0
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chkFullHouse_Click()

    chkFullHouse.Enabled = False
    
    '1,1,1,3,3
    '1,1,3,3,3
    
    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3)) And (OrdArray(4) = OrdArray(5)) _
    Or (OrdArray(1) = OrdArray(2)) And (OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5)) Then
        GotFHouse = True
        ScoreFHouse = 25
        MsgBox "You have a 'Full House'! " & ScoreFHouse & " points!", vbExclamation, "Full House!"
        chkFullHouse.Enabled = False
        'update Lower Total
    Else
        MsgBox "You Don't Have 'Full House'!", vbExclamation, "Full House!"
        chkFullHouse.Enabled = True
    End If
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chkLgStraight_Click()

    chkLgStraight.Enabled = False
    
    For e = 1 To 5
        If DArray(e) = 1 Then Got1s = True Else Got1s = False
        If DArray(e) = 2 Then Got2s = True Else Got2s = False
        If DArray(e) = 3 Then Got3s = True Else Got3s = False
        If DArray(e) = 4 Then Got4s = True Else Got4s = False
        If DArray(e) = 5 Then Got5s = True Else Got5s = False
        If DArray(e) = 6 Then Got6s = True Else Got6s = False
    Next e
    
    If (Got1s And Got2s And Got3s And Got4s And Got5s) _
    Or (Got2s And Got3s And Got4s And Got5s And Got6s) Then
        ScoreLgStr8 = 40
        MsgBox "You have a 'Large Straight'..." & ScoreLgStr8 & " Points...", vbExclamation, "Large Straight!"
        'update totals
    Else
        MsgBox "You don't have a 'Large Straight'", vbExclamation, "Large Straight!"
        chkLgStraight.Enabled = True
    End If
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chkSmStraight_Click()

    chkSmStraight.Enabled = False
    
    For e = 1 To 5
        If DArray(e) = 1 Then Got1s = True Else Got1s = False
        If DArray(e) = 2 Then Got2s = True Else Got2s = False
        If DArray(e) = 3 Then Got3s = True Else Got3s = False
        If DArray(e) = 4 Then Got4s = True Else Got4s = False
        If DArray(e) = 5 Then Got5s = True Else Got5s = False
        If DArray(e) = 6 Then Got6s = True Else Got6s = False
    Next e
    
    If (Got1s And Got2s And Got3s And Got4s) _
    Or (Got2s And Got3s And Got4s And Got5s) _
    Or (Got3s And Got4s And Got5s And Got6s) Then
        ScoreSmStr8 = 30
        MsgBox "You have a 'Small Straight'..." & ScoreSmStr8 & " Points...", vbExclamation, "Small Straight!"
        'update totals
    Else
        MsgBox "You don't have a 'Small Straight'!", vbExclamation, "Small Straight!"
        chkSmStraight.Enabled = True
    End If
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub chkYahtzee_Click()

    chkYahtzee.Enabled = False
    
    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3)) And OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5) Then
        GotYahtzee = True
        ScoreYahtzee = OrdArray(1) + OrdArray(2) + OrdArray(3) + OrdArray(4) + OrdArray(5)
        MsgBox "You have a 'Yahtzee'!  " & ScoreYahtzee & " Points", vbExclamation, "Yahtzee!"
        'update Lower Total
    Else
        MsgBox "You Don't Have 'Yahtzee'!", vbExclamation, "Yahtzee!"
        chkYahtzee.Enabled = True
    End If
    
    'calculate the score
    Call CheckScore
    
End Sub

Private Sub cmdNextPlayer_Click()

    TurnCount = 0
    UpperTotal = 0
    LowerTotal = 0
    UpperBonus = 0
    Total = 0
    
    For n = 1 To 5
        imgD(n).Picture = LoadPicture("")
        chkHold(n).Value = 0
    Next n
    
    chk3ofAKind.Enabled = False
    chk4ofAKind.Enabled = False
    chkSmStraight.Enabled = False
    chkLgStraight.Enabled = False
    chkFullHouse.Enabled = False
    chkYahtzee.Enabled = False
    chk1s.Enabled = False
    chk2s.Enabled = False
    chk3s.Enabled = False
    chk4s.Enabled = False
    chk5s.Enabled = False
    chk6s.Enabled = False
    
    If Player1Turn = True Then
        Player1Turn = False
        Player2Turn = True
        GoTo TEnd:
    End If
    
    If Player2Turn = True Then
        Player1Turn = True
        Player2Turn = False
        GoTo TEnd:
    End If
    
TEnd:
    cmdNextPlayer.Enabled = False
    
End Sub

Private Sub cmdRoll_Click()

    TurnCount = TurnCount + 1
    
    If TurnCount <= 6 Then
    Call EnableCheckBoxs1
    Randomize
    For r = 1 To 5
        'randomly select 1 to 6
        If chkHold(r).Value = 0 Then
        D(r) = Int(Rnd * 6) + 1
        'Load Matching Image
        imgD(r).Picture = LoadPicture(App.Path & "\Yahtzee Images\Dice" & D(r) & ".jpg")
        End If
    Next r
    
    'update darray and ordarray
    For x = 1 To 5
        DArray(x) = D(x)    'put die value in array
        OrdArray(x) = DArray(x)
    Next x
    
    tmrD1.Enabled = True
    tmrD2.Enabled = True
    
    'If TurnCount >= 6 Then
    '    cmdNextPlayer.Enabled = True
    'End If
    
    Else
    MsgBox "You have already rolled 6 times.", vbInformation, "Turn Over"
    
    End If
    
    'put dice in order
    Do
        Swapped = False
        For i = 2 To 5
            ' if this pair is out of order */
            If OrdArray(i - 1) > OrdArray(i) Then
            ' swap them and remember something changed */
            Temp = OrdArray(i - 1)
            OrdArray(i - 1) = OrdArray(i)
            OrdArray(i) = Temp
            Swapped = True
            End If
        Next i
    Loop Until Not (Swapped)
    
End Sub

Private Sub EnableCheckBoxs1()

    chk3ofAKind.Enabled = True
    chk4ofAKind.Enabled = True
    chkSmStraight.Enabled = True
    chkLgStraight.Enabled = True
    chkFullHouse.Enabled = True
    chkYahtzee.Enabled = True
    chk1s.Enabled = True
    chk2s.Enabled = True
    chk3s.Enabled = True
    chk4s.Enabled = True
    chk5s.Enabled = True
    chk6s.Enabled = True
    
End Sub

Private Sub cmdScore_Click()

If Player1Turn = True Then
    LowerTotal = Score3OfAKind + Score4OfAKind + ScoreFHouse + ScoreSmStr8 + ScoreLgStr8 + ScoreYahtzee
    UpperTotal = Score1s + Score12s + Score3s + Score4s + Score5s + Score6s
    
    If UpperTotal >= 63 Then
        UpperBonus = 35
    End If
    
    Total = UpperTotal + UpperBonus + LowerTotal
    
    lblUpperScore.Caption = "Upper Score: " & UpperTotal
    lblUpperScoreBonus.Caption = "Upper Score Bonus: " & UpperBonus
    lblLowerScore.Caption = "Lower Score: " & LowerTotal
    lblOverallScore.Caption = "Overall Score: " & Total
End If

If Player2Turn = True Then
    LowerTotal = Score3OfAKind + Score4OfAKind + ScoreFHouse + ScoreSmStr8 + ScoreLgStr8 + ScoreYahtzee
    UpperTotal = Score1s + Score12s + Score3s + Score4s + Score5s + Score6s
    
    If UpperTotal >= 63 Then
        UpperBonus = 35
    End If
    
    Total = UpperTotal + UpperBonus + LowerTotal
    
    lblUpperScore2.Caption = "Upper Score: " & UpperTotal
    lblUpperScoreBonus2.Caption = "Upper Score Bonus: " & UpperBonus
    lblLowerScore2.Caption = "Lower Score: " & LowerTotal
    lblOverallScore2.Caption = "Overall Score: " & Total
End If

End Sub

Private Sub Form_Load()

    chk3ofAKind.Enabled = False
    chk4ofAKind.Enabled = False
    chkSmStraight.Enabled = False
    chkLgStraight.Enabled = False
    chkFullHouse.Enabled = False
    chkYahtzee.Enabled = False
    chk1s.Enabled = False
    chk2s.Enabled = False
    chk3s.Enabled = False
    chk4s.Enabled = False
    chk5s.Enabled = False
    chk6s.Enabled = False
    
    AI = False
    Player1Turn = True
    Player2Turn = False
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub

Private Sub mnuNewGame_Click()

    Player1Turn = True
    Player2Turn = False
    TurnCount = 0
    UpperTotal = 0
    LowerTotal = 0
    UpperBonus = 0
    Total = 0
    
    For n = 1 To 5
        imgD(n).Picture = LoadPicture("")
        chkHold(n).Value = 0
    Next n
    
    chk3ofAKind.Enabled = False
    chk4ofAKind.Enabled = False
    chkSmStraight.Enabled = False
    chkLgStraight.Enabled = False
    chkFullHouse.Enabled = False
    chkYahtzee.Enabled = False
    chk1s.Enabled = False
    chk2s.Enabled = False
    chk3s.Enabled = False
    chk4s.Enabled = False
    chk5s.Enabled = False
    chk6s.Enabled = False
    
    cmdNextPlayer.Enabled = False
    
    lblUpperScore.Caption = "Upper Score: 0"
    lblUpperScoreBonus.Caption = "Upper Score Bonus: 0"
    lblLowerScore.Caption = "Lower Score: 0"
    lblOverallScore.Caption = "Overall Score: 0"
    
    lblUpperScore2.Caption = "Upper Score: 0"
    lblUpperScoreBonus2.Caption = "Upper Score Bonus: 0"
    lblLowerScore2.Caption = "Lower Score: 0"
    lblOverallScore2.Caption = "Overall Score: 0"
    
End Sub

Private Sub mnuShowDice_Click()

    Cls
    For C = 1 To 5
        Print DArray(C):
    Next C
    
End Sub

Private Sub mnuShowOrderedDice_Click()

    Cls
    For C = 1 To 5
        Print OrdArray(C):
    Next C
    
End Sub

Private Sub tmrD1_Timer()
    'I got bored.
    'So all below is Extra Stuff I added.
    
    Randomize
    For r = 1 To 5
        'randomly select 1 to 6
        If chkHold(r).Value = 0 Then
        D(r) = Int(Rnd * 6) + 1
        'Load Matching Image
        imgD(r).Picture = LoadPicture(App.Path & "\Yahtzee Images\Dice" & D(r) & ".jpg")
        End If
    Next r
    
    'update darray and ordarray
    For x = 1 To 5
        DArray(x) = D(x)    'put die value in array
        OrdArray(x) = DArray(x)
    Next x
    
    'put dice in order
    Do
        Swapped = False
        For i = 2 To 5
            ' if this pair is out of order */
            If OrdArray(i - 1) > OrdArray(i) Then
            ' swap them and remember something changed */
            Temp = OrdArray(i - 1)
            OrdArray(i - 1) = OrdArray(i)
            OrdArray(i) = Temp
            Swapped = True
            End If
        Next i
    Loop Until Not (Swapped)
    
    cmdRoll.Enabled = False
    
End Sub

Private Sub Up1s()

    For t = 1 To 5
        If D(t) = 1 Then
            CountNum = CountNum + 1
        End If
    Next t
    Score1s = CountNum * 1
    CountNum = 0
    
End Sub

Private Sub Up2s()

    For t = 1 To 5
        If D(t) = 2 Then
            CountNum = CountNum + 1
        End If
    Next t
    Score2s = CountNum * 2
    CountNum = 0
    
End Sub

Private Sub Up3s()

    For t = 1 To 5
        If D(t) = 3 Then
            CountNum = CountNum + 1
        End If
    Next t
    Score3s = CountNum * 3
    CountNum = 0
    
End Sub

Private Sub Up4s()

    For t = 1 To 5
        If D(t) = 4 Then
            CountNum = CountNum + 1
        End If
    Next t
    Score4s = CountNum * 4
    CountNum = 0
    
End Sub

Private Sub Up5s()

    For t = 1 To 5
        If D(t) = 5 Then
            CountNum = CountNum + 1
        End If
    Next t
    Score5s = CountNum * 5
    CountNum = 0
    
End Sub

Private Sub Up6s()

    For t = 1 To 5
        If D(t) = 6 Then
            CountNum = CountNum + 1
        End If
    Next t
    Score6s = CountNum * 6
    CountNum = 0
    
End Sub

Private Sub Lo3Kind()

    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3)) _
    Or (OrdArray(2) = OrdArray(3) And OrdArray(3) = OrdArray(4)) _
    Or (OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5)) Then
        Got3OfAKind = True
        Score3OfAKind = OrdArray(1) + OrdArray(2) + OrdArray(3) + OrdArray(4) + OrdArray(5)
        'MsgBox "You have a '3 of A Kind'!" & " " & Score3OfAKind, vbExclamation, "3 of A Kind!"
        'update Lower Total
    Else
        'MsgBox "You Don't Have '3 of A Kind'!", vbExclamation, "3 of A Kind!"
    End If
    
End Sub

Private Sub Lo4Kind()

    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3) And OrdArray(3) = OrdArray(4)) _
    Or (OrdArray(2) = OrdArray(3) And OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5)) Then
        Got4OfAKind = True
        Score4OfAKind = OrdArray(1) + OrdArray(2) + OrdArray(3) + OrdArray(4) + OrdArray(5)
        'MsgBox "You have a '4 of A Kind'!" & " " & Score4OfAKind, vbExclamation, "4 of A Kind!"
        'update Lower Total
    Else
        'MsgBox "You Don't Have '4 of A Kind'!", vbExclamation, "4 of A Kind!"
    End If
    
End Sub

Private Sub LoFHouse()

    '1,1,1,3,3
    '1,1,3,3,3
    
    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3)) And (OrdArray(4) = OrdArray(5)) _
    Or (OrdArray(1) = OrdArray(2)) And (OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5)) Then
        GotFHouse = True
        ScoreFHouse = 25
        'MsgBox "You have a 'Full House'! " & ScoreFHouse & " points!", vbExclamation, "Full House!"
        'update Lower Total
    Else
        'MsgBox "You Don't Have 'Full House'!", vbExclamation, "Full House!"
    End If
    
End Sub

Private Sub LoSmS()

    For e = 1 To 5
        If DArray(e) = 1 Then Got1s = True Else Got1s = False
        If DArray(e) = 2 Then Got2s = True Else Got2s = False
        If DArray(e) = 3 Then Got3s = True Else Got3s = False
        If DArray(e) = 4 Then Got4s = True Else Got4s = False
        If DArray(e) = 5 Then Got5s = True Else Got5s = False
        If DArray(e) = 6 Then Got6s = True Else Got6s = False
    Next e
    
    If (Got1s And Got2s And Got3s And Got4s) _
    Or (Got2s And Got3s And Got4s And Got5s) _
    Or (Got3s And Got4s And Got5s And Got6s) Then
        ScoreSmStr8 = 30
        'MsgBox "You have a 'Small Straight'..." & ScoreSmStr8 & " Points...", vbExclamation, "Small Straight!"
        'update totals
    Else
        'MsgBox "You don't have a 'Small Straight'!", vbExclamation, "Small Straight!"
    End If
    
End Sub

Private Sub LoLgS()

    For e = 1 To 5
        If DArray(e) = 1 Then Got1s = True Else Got1s = False
        If DArray(e) = 2 Then Got2s = True Else Got2s = False
        If DArray(e) = 3 Then Got3s = True Else Got3s = False
        If DArray(e) = 4 Then Got4s = True Else Got4s = False
        If DArray(e) = 5 Then Got5s = True Else Got5s = False
        If DArray(e) = 6 Then Got6s = True Else Got6s = False
    Next e
    
    If (Got1s And Got2s And Got3s And Got4s And Got5s) _
    Or (Got2s And Got3s And Got4s And Got5s And Got6s) Then
        ScoreLgStr8 = 40
        'MsgBox "You have a 'Large Straight'..." & ScoreLgStr8 & " Points...", vbExclamation, "Large Straight!"
        'update totals
    Else
        'MsgBox "You don't have a 'Large Straight'", vbExclamation, "Large Straight!"
    End If
    
End Sub

Private Sub LoYahtzee()

    If (OrdArray(1) = OrdArray(2) And OrdArray(2) = OrdArray(3)) And OrdArray(3) = OrdArray(4) And OrdArray(4) = OrdArray(5) Then
        GotYahtzee = True
        ScoreYahtzee = OrdArray(1) + OrdArray(2) + OrdArray(3) + OrdArray(4) + OrdArray(5)
        'MsgBox "You have a 'Yahtzee'!  " & ScoreYahtzee & " Points", vbExclamation, "Yahtzee!"
        'update Lower Total
    Else
        'MsgBox "You Don't Have 'Yahtzee'!", vbExclamation, "Yahtzee!"
    End If
    
End Sub

Private Sub tmrD2_Timer()

    tmrD1.Enabled = False
    tmrD2.Enabled = False
    
    'For r = 1 To 5
    '    If chkHold(r).Value = 0 Then
    'Next r

If Player1Turn = True Then
    
    cmdRoll.Enabled = True
    
    Call Up1s
    Call Up2s
    Call Up3s
    Call Up4s
    Call Up5s
    Call Up6s
    
    Call Lo3Kind
    Call Lo4Kind
    Call LoFHouse
    Call LoSmS
    Call LoLgS
    Call LoYahtzee
    
    LowerTotal = Score3OfAKind + Score4OfAKind + ScoreFHouse + ScoreSmStr8 + ScoreLgStr8 + ScoreYahtzee
    UpperTotal = Score1s + Score12s + Score3s + Score4s + Score5s + Score6s
    
    If UpperTotal >= 63 Then
        UpperBonus = 35
    End If
    
    Total = UpperTotal + UpperBonus + LowerTotal
    
    lblUpperScore.Caption = "Upper Score: " & UpperTotal
    lblUpperScoreBonus.Caption = "Upper Score Bonus: " & UpperBonus
    lblLowerScore.Caption = "Lower Score: " & LowerTotal
    lblOverallScore.Caption = "Overall Score: " & Total
    
    If TurnCount >= 6 Then
        cmdNextPlayer.Enabled = True
    End If
    
End If

If Player2Turn = True Then
    cmdRoll.Enabled = True
    
    Call Up1s
    Call Up2s
    Call Up3s
    Call Up4s
    Call Up5s
    Call Up6s
    
    Call Lo3Kind
    Call Lo4Kind
    Call LoFHouse
    Call LoSmS
    Call LoLgS
    Call LoYahtzee
    
    LowerTotal = Score3OfAKind + Score4OfAKind + ScoreFHouse + ScoreSmStr8 + ScoreLgStr8 + ScoreYahtzee
    UpperTotal = Score1s + Score12s + Score3s + Score4s + Score5s + Score6s
    
    If UpperTotal >= 63 Then
        UpperBonus = 35
    End If
    
    Total = UpperTotal + UpperBonus + LowerTotal
    
    lblUpperScore2.Caption = "Upper Score: " & UpperTotal
    lblUpperScoreBonus2.Caption = "Upper Score Bonus: " & UpperBonus
    lblLowerScore2.Caption = "Lower Score: " & LowerTotal
    lblOverallScore2.Caption = "Overall Score: " & Total
    
    If TurnCount >= 6 Then
        
        cmdNextPlayer.Enabled = True
    End If
    
End If

End Sub

Private Sub CheckScore()

If Player1Turn = True Then
    'LowerTotal = Score3OfAKind + Score4OfAKind + ScoreFHouse + ScoreSmStr8 + ScoreLgStr8 + ScoreYahtzee
    'UpperTotal = Score1s + Score12s + Score3s + Score4s + Score5s + Score6s
    
    If UpperTotal >= 63 Then
        UpperBonus = 35
    End If
    
    Total = UpperTotal + UpperBonus + LowerTotal
    
    lblUpperScore.Caption = "Upper Score: " & UpperTotal
    lblUpperScoreBonus.Caption = "Upper Score Bonus: " & UpperBonus
    lblLowerScore.Caption = "Lower Score: " & LowerTotal
    lblOverallScore.Caption = "Overall Score: " & Total
End If

If Player2Turn = True Then
    'LowerTotal = Score3OfAKind + Score4OfAKind + ScoreFHouse + ScoreSmStr8 + ScoreLgStr8 + ScoreYahtzee
    'UpperTotal = Score1s + Score12s + Score3s + Score4s + Score5s + Score6s
    
    If UpperTotal >= 63 Then
        UpperBonus = 35
    End If
    
    Total = UpperTotal + UpperBonus + LowerTotal
    
    lblUpperScore2.Caption = "Upper Score: " & UpperTotal
    lblUpperScoreBonus2.Caption = "Upper Score Bonus: " & UpperBonus
    lblLowerScore2.Caption = "Lower Score: " & LowerTotal
    lblOverallScore2.Caption = "Overall Score: " & Total
End If

End Sub
