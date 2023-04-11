VERSION 5.00
Begin VB.Form frm3 
   Caption         =   "Form3"
   ClientHeight    =   12000
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   12000
   LinkTopic       =   "Form3"
   ScaleHeight     =   12000
   ScaleWidth      =   12000
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrFade 
      Interval        =   1000
      Left            =   240
      Top             =   240
   End
   Begin VB.Image imgFade 
      Height          =   11895
      Left            =   0
      Picture         =   "frm3.frx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   11895
   End
End
Attribute VB_Name = "frm3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()

    'imgFade.Height = 15
    'imgFade.Width = 15
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Private Sub tmrFade_Timer()

    If tmrFade.Interval > 100 Then tmrFade.Interval = tmrFade.Interval - 5
    'Center Image
    imgFade.Top = frm3.Top + (frm3.ScaleHeight / 2) - (imgFade.Height / 2)
    imgFade.Left = frm3.Left + (frm3.ScaleWidth / 2) - (imgFade.Width / 2)
    
    'Fade Image
    imgFade.Height = imgFade.Height - 150
    imgFade.Width = imgFade.Width - 150
    
    If imgFade.Height <= 150 Then
        imgFade.Height = 15
        tmrFade.Enabled = False
    End If
    
    If imgFade.Width <= 150 Then
        imgFade.Width = 15
        tmrFade.Enabled = False
    End If
    
End Sub
