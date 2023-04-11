VERSION 5.00
Begin VB.Form frm4Programs 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "The Array of Programs"
   ClientHeight    =   4905
   ClientLeft      =   12705
   ClientTop       =   5850
   ClientWidth     =   3840
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4905
   ScaleWidth      =   3840
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fra1 
      Caption         =   "Program List"
      Height          =   4335
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   3135
      Begin VB.OptionButton opt5 
         Caption         =   "#5: Colorful Circles"
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   2760
         Width           =   2895
      End
      Begin VB.OptionButton opt4 
         Caption         =   "#4: Value Storage/Process"
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   2160
         Width           =   2895
      End
      Begin VB.OptionButton opt3 
         Caption         =   "#3: Fading Image"
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   2895
      End
      Begin VB.OptionButton opt2 
         Caption         =   "#2: Flag Draw"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   960
         Width           =   2895
      End
      Begin VB.OptionButton opt1 
         Caption         =   "#1: Moving Image"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   2895
      End
      Begin VB.CommandButton cmdEnd 
         Caption         =   "End"
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   3840
         Width           =   735
      End
      Begin VB.CommandButton cmdGo 
         Caption         =   "Go"
         Height          =   375
         Left            =   2280
         TabIndex        =   1
         Top             =   3840
         Width           =   735
      End
   End
End
Attribute VB_Name = "frm4Programs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cOption As Integer
Dim MBValue As Single

Private Sub cmdEnd_Click()

    MBValue = MsgBox("Are you sure you want to end this program?", vbYesNo, "Are you sure?")
    
    If MBValue = vbYes Then
        End
    End If
    
    If MBValue = vbNo Then
        GoTo B:
    End If
    
B:
End Sub

Private Sub cmdGo_Click()

    'check Values
    If opt1.Value = True Then cOption = 1
    If opt2.Value = True Then cOption = 2
    If opt3.Value = True Then cOption = 3
    If opt4.Value = True Then cOption = 4
    If opt5.Value = True Then cOption = 5
    
    Select Case cOption
        Case 1:
            frm4Programs.Hide
            frm1.Show
            
            With frm1
                .tmr2AutomaticAI.Enabled = True
                .tmr1MoveUp.Enabled = True
                .tmr1MoveDown.Enabled = True
                .tmr1MoveLeft.Enabled = True
                .tmr1MoveRight.Enabled = True
            End With
            
        Case 2:
            frm4Programs.Hide
            frm2.Show
            
        Case 3:
            frm4Programs.Hide
            frm3.Show
            
            With frm3
                .tmrFade.Enabled = True
                .tmrSpeedup.Enabled = True
            End With
            
        Case 4:
            frm4Programs.Hide
            frm4.Show
            
        Case 5:
            frm4Programs.Hide
            frm5.Show
            
    End Select
    
    
End Sub

Private Sub Form_Load()
    opt1.Value = True
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Private Sub opt1_Click()
    cOption = 1
    
End Sub

Private Sub opt2_Click()
    cOption = 2
    
End Sub

Private Sub opt3_Click()
    cOption = 3
    
End Sub

Private Sub opt4_Click()
    cOption = 4
    
End Sub

Private Sub opt5_Click()
    cOption = 5
    
End Sub
