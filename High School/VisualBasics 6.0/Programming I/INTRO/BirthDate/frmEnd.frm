VERSION 5.00
Begin VB.Form frmEnd 
   Caption         =   "End"
   ClientHeight    =   3855
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5415
   LinkTopic       =   "Form1"
   ScaleHeight     =   3855
   ScaleWidth      =   5415
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End"
      Height          =   735
      Left            =   3720
      TabIndex        =   0
      Top             =   3000
      Width           =   1575
   End
   Begin VB.Timer tmrEnd 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   120
      Top             =   120
   End
End
Attribute VB_Name = "frmEnd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdEnd_Click()

    tmrEnd.Enabled = True

End Sub

Private Sub tmrEnd_Timer()

    For r = 1 To 10000 Step 0.1
        Circle (frmEnd.Width / 2, frmEnd.Height / 2), r, QBColor(r Mod 15)
    Next r
    
    End
    
End Sub
