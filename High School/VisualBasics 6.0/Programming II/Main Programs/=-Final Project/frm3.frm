VERSION 5.00
Begin VB.Form frm3 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "#3: Fading Image"
   ClientHeight    =   12000
   ClientLeft      =   150
   ClientTop       =   480
   ClientWidth     =   12000
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   ScaleHeight     =   12000
   ScaleWidth      =   12000
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmrSpeedup 
      Interval        =   200
      Left            =   720
      Top             =   240
   End
   Begin VB.Timer tmrFade 
      Interval        =   250
      Left            =   240
      Top             =   240
   End
   Begin VB.Image imgFade 
      Height          =   11895
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   11895
   End
   Begin VB.Menu mnuBack 
      Caption         =   "Go Back"
   End
End
Attribute VB_Name = "frm3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()

    imgFade.Picture = LoadPicture(App.Path & "\Images\Program 3 - Shrink.jpg")
    imgFade.Height = frm3.ScaleHeight
    imgFade.Width = frm3.ScaleWidth
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Private Sub mnuBack_Click()

    frm3.Hide
    frm4Programs.Show
    
    tmrFade.Enabled = False
    tmrSpeedup.Enabled = False
    tmrFade.Interval = 500
    imgFade.Height = frm3.ScaleHeight
    imgFade.Width = frm3.ScaleWidth
    
End Sub

Private Sub tmrFade_Timer()

    'Center Image
    'imgFade.Top = frm3.Top - (frm3.ScaleHeight / 2) + (imgFade.Height / 2)
    'imgFade.Left = frm3.Left - (frm3.ScaleWidth / 2) + (imgFade.Width / 2)
    
    'Fade Image
    imgFade.Height = imgFade.Height * 0.99
    imgFade.Width = imgFade.Width * 0.99
    
    If imgFade.Height <= 35 Then
        imgFade.Height = 15
        tmrFade.Enabled = False
    End If
    
    If imgFade.Width <= 35 Then
        imgFade.Width = 15
        tmrFade.Enabled = False
    End If
    
End Sub

Private Sub tmrSpeedup_Timer()

    If tmrFade.Interval > 10 Then tmrFade.Interval = tmrFade.Interval - 5 'And tmrSpeedup.Enabled = False
    
End Sub
