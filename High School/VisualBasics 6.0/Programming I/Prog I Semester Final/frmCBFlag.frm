VERSION 5.00
Begin VB.Form frmCBFlag 
   Caption         =   "Congo-Brazzaville Flag"
   ClientHeight    =   8775
   ClientLeft      =   120
   ClientTop       =   750
   ClientWidth     =   14175
   LinkTopic       =   "Form3"
   ScaleHeight     =   8775
   ScaleWidth      =   14175
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdFlag 
      Caption         =   "Show Flag"
      Height          =   495
      Left            =   2520
      TabIndex        =   2
      Top             =   8160
      Width           =   1095
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End"
      Height          =   495
      Left            =   1320
      TabIndex        =   1
      Top             =   8160
      Width           =   1095
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "Go Back"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   8160
      Width           =   1095
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuBack 
         Caption         =   "Go Back"
      End
      Begin VB.Menu mnuEnd 
         Caption         =   "End"
      End
   End
End
Attribute VB_Name = "frmCBFlag"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()

    frmCBFlag.Hide
    frmMainPage.Show
    
End Sub

Private Sub cmdEnd_Click()

    End
    
End Sub

Private Sub cmdFlag_Click()
    
    For h = 0 To 8000
        Line (l, h)-(12000, h), RGB(255, 239, 8)
    Next h
    
    For x = 0 To 8000
        Line (x, 0)-(0, 8000), RGB(24, 148, 82)
    Next x
    
    For x = 4000 To 12000
        Line (12000, 0)-(x, 8000), RGB(222, 24, 24)
    Next x
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub

Private Sub mnuBack_Click()

    frmCBFlag.Hide
    frmMainPage.Show
    
End Sub

Private Sub mnuEnd_Click()

    End
    
End Sub
