VERSION 5.00
Begin VB.Form frmTriviaI 
   Caption         =   "Trivia I"
   ClientHeight    =   5895
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   12255
   LinkTopic       =   "Form1"
   ScaleHeight     =   5895
   ScaleWidth      =   12255
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "__"
      Height          =   255
      Left            =   3600
      TabIndex        =   7
      Top             =   4560
      Width           =   375
   End
   Begin VB.CommandButton cmdCheck 
      Caption         =   "Check"
      Height          =   495
      Left            =   4920
      TabIndex        =   6
      Top             =   4560
      Width           =   975
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next"
      Height          =   495
      Left            =   1800
      TabIndex        =   5
      Top             =   4560
      Width           =   975
   End
   Begin VB.Frame fraQ 
      Caption         =   "Press Next To Start."
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3495
      Left            =   720
      TabIndex        =   0
      Top             =   480
      Width           =   6255
      Begin VB.OptionButton optD 
         Caption         =   "D.  "
         Height          =   735
         Left            =   120
         TabIndex        =   4
         Top             =   2520
         Width           =   6015
      End
      Begin VB.OptionButton optC 
         Caption         =   "C.  "
         Height          =   735
         Left            =   120
         TabIndex        =   3
         Top             =   1800
         Width           =   6015
      End
      Begin VB.OptionButton optB 
         Caption         =   "B.  "
         Height          =   735
         Left            =   120
         TabIndex        =   2
         Top             =   1080
         Width           =   6015
      End
      Begin VB.OptionButton optA 
         Caption         =   "A.  "
         Height          =   735
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   6015
      End
   End
   Begin VB.Image imgPic 
      BorderStyle     =   1  'Fixed Single
      Height          =   4455
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   480
      Width           =   4455
   End
End
Attribute VB_Name = "frmTriviaI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim QCount As Integer
Dim Q(1 To 26) As String
Dim A(1 To 26) As String
Dim B(1 To 26) As String
Dim C(1 To 26) As String
Dim D(1 To 26) As String
Dim Pic(1 To 26) As String
Dim Correct As Integer
Dim Incorrect As Integer

Private Sub cmdCheck_Click()

    Select Case QCount
    
        Case 1:
            If optA.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'A'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 2:
            If optC.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'C'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 3:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
            
        Case 4:
            If optD.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'D'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
            
        Case 5:
            If optA.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'A'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
            
        Case 6:
            If optC.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'C'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
            
        Case 7:
            If optA.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'A'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
            
        Case 8:
            If optC.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'C'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 9:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 10:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 11:
            If optC.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'C'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 12:
            If optC.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'C'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 13:
            If optD.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'D'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 14:
            If optA.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'A'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 15:
            If optD.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'D'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 16:
            If optD.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'D'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 17:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 18:
            If optC.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'C'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 19:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 20:
            If optD.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'D'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 21:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 22:
            If optA.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'A'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 23:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 24:
            If optB.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'B'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 25:
            If optC.Value = True Then
                MsgBox ("Correct!")
                Correct = Correct + 1
                Call cmdNext_Click
            Else
                MsgBox ("Wrong.  The Correct answer is 'C'")
                Incorrect = Incorrect + 1
                Call cmdNext_Click
            End If
        
        Case 26:
            Call cmdNext_Click
            
            
            
    End Select
    
    
End Sub

Private Sub cmdNext_Click()

    'error prevention
    If QCount = 26 Then
        QCount = 26
    Else
        QCount = QCount + 1
    End If
    
    
    If QCount = 26 Then
        fraQ.Caption = Q(QCount)
        optA.Caption = A(QCount)
        optB.Caption = "Number of Correct Answers:" & " " & Correct
        optC.Caption = C(QCount)
        optD.Caption = "Number of Incorrect Answers:" & " " & Incorrect
        imgPic.Picture = LoadPicture(Pic(QCount))
    Else
        fraQ.Caption = Q(QCount)
        optA.Caption = A(QCount)
        optB.Caption = B(QCount)
        optC.Caption = C(QCount)
        optD.Caption = D(QCount)
        imgPic.Picture = LoadPicture(Pic(QCount))
    End If
        
End Sub

Private Sub cmdReset_Click()

    n = 0
    QCount = 0
    imgPic.Picture = LoadPicture("")
    fraQ.Caption = "Press Next To Start."
    optA.Caption = "A"
    optB.Caption = "B"
    optC.Caption = "C"
    optD.Caption = "D"

End Sub

Private Sub Form_Load()

    Open "H:\Programming I\PROJECTS\Trivia I\Trivia I Q.txt" For Input As #1
    
    For n = 1 To 26
        Line Input #1, Q(n)
        Line Input #1, A(n)
        Line Input #1, B(n)
        Line Input #1, C(n)
        Line Input #1, D(n)
        Line Input #1, Pic(n)
        Line Input #1, blankline

    Next n
    
    
End Sub
