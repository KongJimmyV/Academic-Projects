VERSION 5.00
Begin VB.Form frmInputs 
   Caption         =   "Inputs"
   ClientHeight    =   7095
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11175
   LinkTopic       =   "Form1"
   ScaleHeight     =   7095
   ScaleWidth      =   11175
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstAge 
      Height          =   2205
      ItemData        =   "frmInputs.frx":0000
      Left            =   240
      List            =   "frmInputs.frx":0007
      TabIndex        =   11
      Top             =   3840
      Width           =   3735
   End
   Begin VB.ComboBox cboPeriod 
      Height          =   315
      Left            =   4080
      TabIndex        =   10
      Text            =   "Favourite Class Period"
      Top             =   3000
      Width           =   3615
   End
   Begin VB.CommandButton cmdFavPop 
      Caption         =   "Favourite Pop"
      Height          =   495
      Left            =   1080
      TabIndex        =   9
      Top             =   3000
      Width           =   1935
   End
   Begin VB.Frame fraWUToV 
      Caption         =   "Wake Up Time over Vacation"
      Height          =   1935
      Left            =   4080
      TabIndex        =   5
      Top             =   840
      Width           =   3615
      Begin VB.OptionButton optVeryLate 
         Caption         =   "10:00 AM"
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   1320
         Width           =   3255
      End
      Begin VB.OptionButton optLate 
         Caption         =   "8:00 AM"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   840
         Width           =   3135
      End
      Begin VB.OptionButton optEarly 
         Caption         =   "6:00 AM"
         Height          =   255
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   3135
      End
   End
   Begin VB.Frame fraFDotY 
      Caption         =   "Favourite Days of the Year"
      Height          =   1935
      Left            =   240
      TabIndex        =   2
      Top             =   840
      Width           =   3615
      Begin VB.CheckBox chkLDoS 
         Caption         =   "Last Day of School"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   840
         Width           =   3135
      End
      Begin VB.CheckBox chkFDoS 
         Caption         =   "First Day of School"
         Height          =   315
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   3135
      End
   End
   Begin VB.CommandButton cmdProcess 
      Caption         =   "Process Favourite Number"
      Height          =   375
      Left            =   3960
      TabIndex        =   1
      Top             =   240
      Width           =   2295
   End
   Begin VB.TextBox txtFavNum 
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Text            =   "Enter your Favourite Number"
      Top             =   240
      Width           =   3615
   End
End
Attribute VB_Name = "frmInputs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cboPeriod_Click()

    Select Case cboPeriod.Text
    
        Case "Period 1 Psychology":
            MsgBox ("It is intresting.")
            
        Case "Period 2 Chemistry":
            MsgBox ("It is shocking.")
            
        Case Else:
            MsgBox ("Because I just like them.")
            
    End Select
    
End Sub

Private Sub chkFDoS_Click()

    If chkFDoS.Value = 1 Then
        MsgBox ("Too bad!")
    End If
    
End Sub

Private Sub chkLDoS_Click()

    If chkLDoS.Value = 1 Then
        MsgBox ("Too bad!")
    End If
    
End Sub

Private Sub cmdFavPop_Click()

    Dim FPop As String
    
    FPop = InputBox("What is your favourite softdrink?")
    
End Sub

Private Sub cmdProcess_Click()

    Dim FNum As Integer
    
    FNum = txtFavNum.Text
    
    MsgBox ("Your Fav Num is " & FNum)
    
End Sub

Private Sub Form_Load()

    cboPeriod.AddItem "Period 1 Psychology"
    cboPeriod.AddItem "Period 2 Chemistry"
    cboPeriod.AddItem "Period 3 Robotics"
    cboPeriod.AddItem "Period 4 Programming I"
    cboPeriod.AddItem "Period 5 Study Hall"
    cboPeriod.AddItem "Period 6 English 11"
    cboPeriod.AddItem "Period 7 Algebra II"
    cboPeriod.AddItem "Period 8 Art Drawing II"
    
    For x = 1 To 100 Step 1
        lstAge.AddItem (x)
    Next
    
End Sub

Private Sub lstAge_Click()

    Dim Age As Integer
    
    Age = lstAge.Text
    
    Select Case Age
    
        Case 1 To 11:
            MsgBox ("Young")
            
        Case 12 To 18:
            MsgBox ("Teenage Years")
            
        Case 19 To 25:
            MsgBox ("Adults/College")
            
        Case 26 To 35:
            MsgBox ("Smart+w/Job")
            
        Case 36 To 60:
            MsgBox ("Work")
            
        Case 61 To 100:
            MsgBox ("Retire/Old")
            
    End Select
    
End Sub

Private Sub optEarly_Click()

    If optEarly.Value = True Then
        MsgBox ("Wow... that is weird.")
    End If
    
End Sub

Private Sub optLate_Click()

    If optLate.Value = True Then
        MsgBox ("Wow... that is not late at all.")
    End If
    
End Sub

Private Sub optVeryLate_Click()

    If optVeryLate.Value = True Then
        MsgBox ("Wow... that is really late.")
    End If
    
End Sub

Private Sub txtFavNum_Click()
    
    txtFavNum.Text = ""
    
End Sub
