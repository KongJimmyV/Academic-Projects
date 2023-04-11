VERSION 5.00
Begin VB.Form frm4Programs 
   Caption         =   "The 4 Programs"
   ClientHeight    =   4905
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   3720
   LinkTopic       =   "Form1"
   ScaleHeight     =   4905
   ScaleWidth      =   3720
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   4335
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   3015
      Begin VB.OptionButton opt4 
         Caption         =   "#4: Value Test"
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   2040
         Width           =   2775
      End
      Begin VB.OptionButton opt3 
         Caption         =   "#3: Fading Image"
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   1440
         Width           =   2775
      End
      Begin VB.OptionButton opt2 
         Caption         =   "#2: The Flag"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   840
         Width           =   2775
      End
      Begin VB.OptionButton opt1 
         Caption         =   "#1: The Moving Image"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   2775
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
         Left            =   2160
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

Private Sub cmdGo_Click()

    'set Values
    If opt1.Value = True Then cOption = 1
    If opt2.Value = True Then cOption = 2
    If opt3.Value = True Then cOption = 3
    If opt4.Value = True Then cOption = 4
    
    Select Case cOption
        Case 1:
            frm4Programs.Hide
            frm1.Show
            
        Case 2:
            frm4Programs.Hide
            frm2.Show
            
        Case 3:
            frm4Programs.Hide
            frm3.Show
            
        Case 4:
            frm4Programs.Hide
            frm4.Show
            
    End Select
    
    
End Sub

Private Sub Form_Load()
    cOption = 1
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Private Sub opt1_Click()
    cOption = 1
    
End Sub

Private Sub opt3_Click()
    cOption = 3
    
End Sub
