VERSION 5.00
Begin VB.Form frmGradingProgram 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "The Grading Program"
   ClientHeight    =   6015
   ClientLeft      =   150
   ClientTop       =   780
   ClientWidth     =   7185
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6015
   ScaleWidth      =   7185
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset All"
      Height          =   615
      Left            =   5400
      TabIndex        =   11
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdResetT 
      Caption         =   "Reset"
      Height          =   615
      Left            =   5400
      TabIndex        =   7
      Top             =   3360
      Width           =   1215
   End
   Begin VB.CommandButton cmdResetQ 
      Caption         =   "Reset"
      Height          =   615
      Left            =   5400
      TabIndex        =   6
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton cmdResetA 
      Caption         =   "Reset"
      Height          =   615
      Left            =   5400
      TabIndex        =   5
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnterOA 
      Caption         =   "Enter"
      Height          =   615
      Left            =   3960
      TabIndex        =   4
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnterT 
      Caption         =   "Enter"
      Height          =   615
      Left            =   3960
      TabIndex        =   3
      Top             =   3360
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnterA 
      Caption         =   "Enter"
      Height          =   615
      Left            =   3960
      TabIndex        =   1
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnterQ 
      Caption         =   "Enter"
      Height          =   615
      Left            =   3960
      TabIndex        =   2
      Top             =   2280
      Width           =   1215
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Caption         =   "Grading Program"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   24.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   960
      TabIndex        =   21
      Top             =   120
      Width           =   5295
   End
   Begin VB.Label lblGrade 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Overall Grade:  N/A"
      Height          =   255
      Left            =   240
      TabIndex        =   20
      Top             =   5040
      Width           =   3255
   End
   Begin VB.Label lblOAPossible 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Overall Total Possible:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   19
      Top             =   4800
      Width           =   3255
   End
   Begin VB.Label lblOACorrect 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Overall Total Correct:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   18
      Top             =   4560
      Width           =   3255
   End
   Begin VB.Label lblAPossible 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Total Possible:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   17
      Top             =   1560
      Width           =   3255
   End
   Begin VB.Label lblACorrect 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Total Correct:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   16
      Top             =   1320
      Width           =   3255
   End
   Begin VB.Label lblQPossible 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Total Possible:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   15
      Top             =   2640
      Width           =   3255
   End
   Begin VB.Label lblTPossible 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Total Possible:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   14
      Top             =   3720
      Width           =   3255
   End
   Begin VB.Label lblTCorrect 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Total Correct:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   13
      Top             =   3480
      Width           =   3255
   End
   Begin VB.Label lblQCorrect 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Total Correct:  0"
      Height          =   255
      Left            =   240
      TabIndex        =   12
      Top             =   2400
      Width           =   3255
   End
   Begin VB.Label lblOAPercent 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Overall Total Percentage:"
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   4320
      Width           =   3255
   End
   Begin VB.Label lblOVTPercent 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Test Total Percentage:"
      Height          =   255
      Left            =   240
      TabIndex        =   9
      Top             =   3240
      Width           =   3255
   End
   Begin VB.Label lblOVQPercent 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Quiz Total Percentage:"
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   2160
      Width           =   3255
   End
   Begin VB.Label lblOVAPercent 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Assignment Total Percentage:"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   1080
      Width           =   3255
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuEnd 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuExec 
      Caption         =   "Run"
      Begin VB.Menu mnuDropAssign 
         Caption         =   "Assignments"
         Begin VB.Menu mnuAssign 
            Caption         =   "Grade Assignments"
         End
         Begin VB.Menu mnuResetA 
            Caption         =   "Reset Scores"
         End
      End
      Begin VB.Menu mnuDropQuiz 
         Caption         =   "Quizzes"
         Begin VB.Menu mnuQuiz 
            Caption         =   "Grade Quizzes"
         End
         Begin VB.Menu mnuResetQ 
            Caption         =   "Reset Scores"
         End
      End
      Begin VB.Menu mnuDropTest 
         Caption         =   "Tests"
         Begin VB.Menu mnuTest 
            Caption         =   "Grade Tests"
         End
         Begin VB.Menu mnuResetT 
            Caption         =   "Reset Scores"
         End
      End
      Begin VB.Menu mnuOverall 
         Caption         =   "Check Overalls"
      End
      Begin VB.Menu mnuReset 
         Caption         =   "Reset All"
      End
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "About"
      Begin VB.Menu mnuProgI 
         Caption         =   "Grading Program"
      End
   End
End
Attribute VB_Name = "frmGradingProgram"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Num As Integer
Dim G As Integer
Dim OAGrade As String

Dim APercent As Integer
Dim ACorrect As Integer
Dim ATotal As Integer
Dim ATotalCorrect As Integer
Dim ATotalPossible As Integer
Dim AOVPercent As Single

Dim QPercent As Integer
Dim QCorrect As Integer
Dim QTotal As Integer
Dim QTotalCorrect As Integer
Dim QTotalPossible As Integer
Dim QOVPercent As Single

Dim TPercent As Integer
Dim TCorrect As Integer
Dim TTotal As Integer
Dim TTotalCorrect As Integer
Dim TTotalPossible As Integer
Dim TOVPercent As Single

Dim OATotalCorrect As Integer
Dim OATotalPossible As Integer
Dim OATPercent As Single


Private Sub cmdEnterA_Click()

    'inputs
    Num = InputBox("How many Assignments are there?", "Assignments?", 1)
    
    For G = 1 To Num
        ACorrect = InputBox("How many points were Earned?", "Amount Correct?", 1)
        APossible = InputBox("Out of how many points Possible?", "Total Possible?", 1)
        ATotalCorrect = ATotalCorrect + ACorrect
        ATotalPossible = ATotalPossible + APossible
    Next G
    
    'calculations
    AOVPercent = ATotalCorrect / ATotalPossible
    
    'outputs
    lblOVAPercent.Caption = "Assignment Total Percentage:  " & Format(AOVPercent, "percent")
    
    lblACorrect.Caption = "Total Correct:  " & ATotalCorrect
    lblAPossible.Caption = "Total Possible:  " & ATotalPossible
    
    cmdResetA.Visible = True
    mnuResetA.Enabled = True
    
End Sub

Private Sub cmdEnterOA_Click()

    'inputs
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        'calculations
        OATPercent = OATotalCorrect / OATotalPossible
        
        'outputs
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
        
        lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
        lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
        
    Else
        MsgBox "You need to enter the percentages in one of the boxes first before proceding to do an Overall Percentage of them.", 16, "Error"
        
    End If
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
End Sub

Private Sub cmdEnterQ_Click()

    'inputs
    Num = InputBox("How many Quizzes are there?", "Quizzes?", 1)
    
    For G = 1 To Num
        QCorrect = InputBox("How many points were Earned?", "Amount Correct?", 1)
        QPossible = InputBox("Out of how many points Possible?", "Total Possible?", 1)
        QTotalCorrect = QTotalCorrect + QCorrect
        QTotalPossible = QTotalPossible + QPossible
    Next G
    
    'calculations
    QOVPercent = QTotalCorrect / QTotalPossible
    
    'outputs
    lblOVQPercent.Caption = "Quiz Total Percentage:  " & Format(QOVPercent, "percent")
    
    lblQCorrect.Caption = "Total Correct:  " & QTotalCorrect
    lblQPossible.Caption = "Total Possible:  " & QTotalPossible
    
    cmdResetQ.Visible = True
    mnuResetQ.Enabled = True
    
End Sub

Private Sub cmdEnterT_Click()

    'inputs
    Num = InputBox("How many Tests are there?", "Tests?", 1)
    
    For G = 1 To Num
        TCorrect = InputBox("How many points were Earned?", "Amount Correct?", 1)
        TPossible = InputBox("Out of how many points Possible?", "Total Possible?", 1)
        TTotalCorrect = TTotalCorrect + TCorrect
        TTotalPossible = TTotalPossible + TPossible
    Next G
    
    'calculations
    TOVPercent = TTotalCorrect / TTotalPossible
    
    'outputs
    lblOVTPercent.Caption = "Test Total Percentage:  " & Format(TOVPercent, "percent")
    
    lblTCorrect.Caption = "Total Correct:  " & TTotalCorrect
    lblTPossible.Caption = "Total Possible:  " & TTotalPossible
    
    cmdResetT.Visible = True
    mnuResetT.Enabled = True
    
End Sub

Private Sub cmdReset_Click()
    
    'reset variables
    Num = 0
    G = 0
    
    'reset Assignment Scores
    APercent = 0
    ACorrect = 0
    ATotal = 0
    ATotalCorrect = 0
    ATotalPossible = 0
    AOVPercent = 0
    
    'reset Quiz Scores
    QPercent = 0
    QCorrect = 0
    QTotal = 0
    QTotalCorrect = 0
    QTotalPossible = 0
    QOVPercent = 0
    
    'reset Test Scores
    TPercent = 0
    TCorrect = 0
    TTotal = 0
    TTotalCorrect = 0
    TTotalPossible = 0
    TOVPercent = 0
    
    'reset Overall Scores
    OATotalCorrect = 0
    OATotalPossible = 0
    OATPercent = 0
    
    'reset labels
    lblOVAPercent.Caption = "Assignment Total Percentage:  "
    lblOVQPercent.Caption = "Quiz Total Percentage:  "
    lblOVTPercent.Caption = "Test Total Percentage:  "
    lblOAPercent.Caption = "Overall Total Percentage:  "
    
    lblACorrect.Caption = "Total Correct:  " & ATotalCorrect
    lblAPossible.Caption = "Total Possible:  " & ATotalPossible
    lblQCorrect.Caption = "Total Correct:  " & QTotalCorrect
    lblQPossible.Caption = "Total Possible:  " & QTotalPossible
    lblTCorrect.Caption = "Total Correct:  " & TTotalCorrect
    lblTPossible.Caption = "Total Possible:  " & TTotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    lblGrade.Caption = "Overall Grade:  N/A"
    
    'reset Reset Cmd Buttons
    cmdResetA.Visible = False
    cmdResetQ.Visible = False
    cmdResetT.Visible = False
    
    'reset Reset Mnu Buttons
    mnuResetA.Enabled = False
    mnuResetQ.Enabled = False
    mnuResetT.Enabled = False
    
End Sub

Private Sub cmdResetA_Click()

    APercent = 0
    ACorrect = 0
    ATotal = 0
    ATotalCorrect = 0
    ATotalPossible = 0
    AOVPercent = 0

    lblOVAPercent.Caption = "Assignment Total Percentage:  "
    
    'recalulate overall
    
    If (AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False) And lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent") Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        OATPercent = OATotalCorrect / OATotalPossible
            
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
    Else
        lblOAPercent.Caption = "Overall Total Percentage:  "
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
    End If
    
    cmdResetA.Visible = False
    mnuResetA.Enabled = False
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
    lblACorrect.Caption = "Total Correct:  " & ATotalCorrect
    lblAPossible.Caption = "Total Possible:  " & ATotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    
End Sub

Private Sub cmdResetQ_Click()

    QPercent = 0
    QCorrect = 0
    QTotal = 0
    QTotalCorrect = 0
    QTotalPossible = 0
    QOVPercent = 0
    
    lblOVQPercent.Caption = "Quiz Total Percentage:  "
    
    'recalulate overall
    
    If (AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False) And lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent") Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        OATPercent = OATotalCorrect / OATotalPossible
        
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
    Else
        lblOAPercent.Caption = "Overall Total Percentage:  "
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
    End If
    
    cmdResetQ.Visible = False
    mnuResetQ.Enabled = False
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
    lblQCorrect.Caption = "Total Correct:  " & QTotalCorrect
    lblQPossible.Caption = "Total Possible:  " & QTotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    
End Sub

Private Sub cmdResetT_Click()

    TPercent = 0
    TCorrect = 0
    TTotal = 0
    TTotalCorrect = 0
    TTotalPossible = 0
    TOVPercent = 0
    
    lblOVTPercent.Caption = "Test Total Percentage:  "
    
    'recalulate overall
    
    If (AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False) And lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent") Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        OATPercent = OATotalCorrect / OATotalPossible
        
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
    Else
        lblOAPercent.Caption = "Overall Total Percentage:  "
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
    End If
    
    cmdResetT.Visible = False
    mnuResetT.Enabled = False
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
    lblTCorrect.Caption = "Total Correct:  " & TTotalCorrect
    lblTPossible.Caption = "Total Possible:  " & TTotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    
End Sub

Private Sub Form_Load()

    cmdResetA.Visible = False
    cmdResetQ.Visible = False
    cmdResetT.Visible = False
    
    mnuResetA.Enabled = False
    mnuResetQ.Enabled = False
    mnuResetT.Enabled = False
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    
    'anti crash (prevents a bug that happens when you press the X button)
    End
    
End Sub

Private Sub mnuAssign_Click()

    'inputs
    Num = InputBox("How many Assignments are there?", "Assignments?", 1)
    
    For G = 1 To Num
        ACorrect = InputBox("How many points were Earned?", "Amount Correct?", 1)
        APossible = InputBox("Out of how many points Possible?", "Total Possible?", 1)
        ATotalCorrect = ATotalCorrect + ACorrect
        ATotalPossible = ATotalPossible + APossible
    Next G
    
    'calculations
    AOVPercent = ATotalCorrect / ATotalPossible
    
    'outputs
    lblOVAPercent.Caption = "Assignment Total Percentage:  " & Format(AOVPercent, "percent")
    
    lblACorrect.Caption = "Correct:  " & ATotalCorrect
    lblAPossible.Caption = "Possible:  " & ATotalPossible
    
    cmdResetA.Visible = True
    mnuResetA.Enabled = True
    
End Sub

Private Sub mnuEnd_Click()
    
    'Basically ends/exits the program
    End
    
End Sub

Private Sub mnuOverall_Click()

    'inputs
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        'calculations
        OATPercent = OATotalCorrect / OATotalPossible
        
        'outputs
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
        
        lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
        lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
        
    Else
        MsgBox "You need to enter the percentages in one of the boxes first before proceding to do an Overall Percentage of them.", 0, "Error"
        
    End If
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
    lblGrade.Caption = "Overall Grade:  " & OAGrade
    
End Sub

Private Sub mnuProgI_Click()
    
    'optional about
    MsgBox "Made for Programming I.  Designed to grade and give a percentage of 'Assignments', 'Quizzes', and 'Tests'.", 64, "About Grading Program"
    
End Sub

Private Sub mnuQuiz_Click()

    'inputs
    Num = InputBox("How many Quizzes are there?", "Quizzes?", 1)
    
    For G = 1 To Num
        QCorrect = InputBox("How many points were Earned?", "Amount Correct?", 1)
        QPossible = InputBox("Out of how many points Possible?", "Total Possible?", 1)
        QTotalCorrect = QTotalCorrect + QCorrect
        QTotalPossible = QTotalPossible + QPossible
    Next G
    
    'calculations
    QOVPercent = QTotalCorrect / QTotalPossible
    
    'outputs
    lblOVQPercent.Caption = "Quiz Total Percentage:  " & Format(QOVPercent, "percent")
    
    lblQCorrect.Caption = "Correct:  " & QTotalCorrect
    lblQPossible.Caption = "Possible:  " & QTotalPossible
    
    cmdResetQ.Visible = True
    mnuResetQ.Enabled = True
    
End Sub

Private Sub mnuReset_Click()
    
    'reset variables
    Num = 0
    G = 0
    
    'reset Assignment Scores
    APercent = 0
    ACorrect = 0
    ATotal = 0
    ATotalCorrect = 0
    ATotalPossible = 0
    AOVPercent = 0
    
    'reset Quiz Scores
    QPercent = 0
    QCorrect = 0
    QTotal = 0
    QTotalCorrect = 0
    QTotalPossible = 0
    QOVPercent = 0
    
    'reset Test Scores
    TPercent = 0
    TCorrect = 0
    TTotal = 0
    TTotalCorrect = 0
    TTotalPossible = 0
    TOVPercent = 0
    
    'reset Overall Scores
    OATotalCorrect = 0
    OATotalPossible = 0
    OATPercent = 0
    
    'reset labels
    lblOVAPercent.Caption = "Assignment Total Percentage:  "
    lblOVQPercent.Caption = "Quiz Total Percentage:  "
    lblOVTPercent.Caption = "Test Total Percentage:  "
    lblOAPercent.Caption = "Overall Total Percentage:  "
    
    lblACorrect.Caption = "Total Correct:  " & ATotalCorrect
    lblAPossible.Caption = "Total Possible:  " & ATotalPossible
    lblQCorrect.Caption = "Total Correct:  " & QTotalCorrect
    lblQPossible.Caption = "Total Possible:  " & QTotalPossible
    lblTCorrect.Caption = "Total Correct:  " & TTotalCorrect
    lblTPossible.Caption = "Total Possible:  " & TTotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    lblGrade.Caption = "Overall Grade:  N/A"
    
    'reset Reset Cmd Buttons
    cmdResetA.Visible = False
    cmdResetQ.Visible = False
    cmdResetT.Visible = False
    
    'reset Reset Mnu Buttons
    mnuResetA.Enabled = False
    mnuResetQ.Enabled = False
    mnuResetT.Enabled = False
    
End Sub

Private Sub mnuResetA_Click()

    APercent = 0
    ACorrect = 0
    ATotal = 0
    ATotalCorrect = 0
    ATotalPossible = 0
    AOVPercent = 0
    
    lblOVAPercent.Caption = "Assignment Total Percentage:  "
    
    'recalulate overall
    
    If (AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False) And lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent") Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        OATPercent = OATotalCorrect / OATotalPossible
            
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
    Else
        lblOAPercent.Caption = "Overall Total Percentage:  "
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
    End If
    
    cmdResetA.Visible = False
    mnuResetA.Enabled = False
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
    lblACorrect.Caption = "Total Correct:  " & ATotalCorrect
    lblAPossible.Caption = "Total Possible:  " & ATotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    
End Sub

Private Sub mnuResetQ_Click()

    QPercent = 0
    QCorrect = 0
    QTotal = 0
    QTotalCorrect = 0
    QTotalPossible = 0
    QOVPercent = 0
    
    lblOVQPercent.Caption = "Quiz Total Percentage:  "
    
    'recalulate overall
    
    If (AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False) And lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent") Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        OATPercent = OATotalCorrect / OATotalPossible
        
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
    Else
        lblOAPercent.Caption = "Overall Total Percentage:  "
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
    End If
    
    cmdResetQ.Visible = False
    mnuResetQ.Enabled = False
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
    lblQCorrect.Caption = "Total Correct:  " & QTotalCorrect
    lblQPossible.Caption = "Total Possible:  " & QTotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    
End Sub

Private Sub mnuResetT_Click()

    TPercent = 0
    TCorrect = 0
    TTotal = 0
    TTotalCorrect = 0
    TTotalPossible = 0
    TOVPercent = 0
    
    lblOVTPercent.Caption = "Test Total Percentage:  "
    
    'recalulate overall
    
    If (AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False) And lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent") Then
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
        OATPercent = OATotalCorrect / OATotalPossible
        
        lblOAPercent.Caption = "Overall Total Percentage:  " & Format(OATPercent, "percent")
    Else
        lblOAPercent.Caption = "Overall Total Percentage:  "
        OATotalCorrect = ATotalCorrect + QTotalCorrect + TTotalCorrect
        OATotalPossible = ATotalPossible + QTotalPossible + TTotalPossible
        
    End If
    
    cmdResetT.Visible = False
    mnuResetT.Enabled = False
    
    If AOVPercent = 0 = False Or QOVPercent = 0 = False Or TOVPercent = 0 = False Then
        If OATPercent >= 0.9 Then
            OAGrade = "A"
        End If
        
        If OATPercent >= 0.8 And OATPercent < 0.9 Then
            OAGrade = "B"
        End If
        
        If OATPercent >= 0.7 And OATPercent < 0.8 Then
            OAGrade = "C"
        End If
        
        If OATPercent >= 0.6 And OATPercent < 0.7 Then
            OAGrade = "D"
        End If
        
        If OATPercent < 0.6 Then
            OAGrade = "F"
        End If
        
        lblGrade.Caption = "Overall Grade:  " & OAGrade
        
    Else
        lblGrade.Caption = "Overall Grade:  N/A"
        
    End If
    
    lblTCorrect.Caption = "Total Correct:  " & TTotalCorrect
    lblTPossible.Caption = "Total Possible:  " & TTotalPossible
    lblOACorrect.Caption = "Overall Total Correct:  " & OATotalCorrect
    lblOAPossible.Caption = "Overall Total Possible:  " & OATotalPossible
    
End Sub

Private Sub mnuTest_Click()

    'inputs
    Num = InputBox("How many Tests are there?", "Tests?", 1)
    
    For G = 1 To Num
        TCorrect = InputBox("How many points were Earned?", "Amount Correct?", 1)
        TPossible = InputBox("Out of how many points Possible?", "Total Possible?", 1)
        TTotalCorrect = TTotalCorrect + TCorrect
        TTotalPossible = TTotalPossible + TPossible
    Next G
    
    'calculations
    TOVPercent = TTotalCorrect / TTotalPossible
    
    'outputs
    lblOVTPercent.Caption = "Test Total Percentage:  " & Format(TOVPercent, "percent")
    
    lblTCorrect.Caption = "Total Correct:  " & TTotalCorrect
    lblTPossible.Caption = "Total Possible:  " & TTotalPossible
    
    cmdResetT.Visible = True
    mnuResetT.Enabled = True
    
End Sub
