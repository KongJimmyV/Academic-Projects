VERSION 5.00
Begin VB.Form frmIconMover 
   BackColor       =   &H00808080&
   Caption         =   "Icon Mover (w/Screen Wrap)"
   ClientHeight    =   9375
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   15855
   LinkTopic       =   "Form4"
   ScaleHeight     =   9375
   ScaleWidth      =   15855
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrD 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   7800
      Top             =   4680
   End
   Begin VB.Timer tmrR 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   8280
      Top             =   4200
   End
   Begin VB.Timer tmrL 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   7320
      Top             =   4200
   End
   Begin VB.Timer tmrU 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   7800
      Top             =   3720
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Left            =   7800
      Picture         =   "frmIconMover.frx":0000
      Top             =   4200
      Width           =   480
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
Attribute VB_Name = "frmIconMover"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()

    frmIconMover.Hide
    frmMainPage.Show
    
End Sub

Private Sub cmdEnd_Click()

    End
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyUp Then
        tmrU.Enabled = True
    End If
    
    If KeyCode = vbKeyDown Then
        tmrD.Enabled = True
    End If
    
    If KeyCode = vbKeyRight Then
        tmrR.Enabled = True
    End If
    
    If KeyCode = vbKeyLeft Then
        tmrL.Enabled = True
    End If
    
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyUp Then
        tmrU.Enabled = False
    End If
    
    If KeyCode = vbKeyDown Then
        tmrD.Enabled = False
    End If
    
    If KeyCode = vbKeyRight Then
        tmrR.Enabled = False
    End If
    
    If KeyCode = vbKeyLeft Then
        tmrL.Enabled = False
    End If
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub

Private Sub mnuBack_Click()

    frmIconMover.Hide
    frmMainPage.Show
    
End Sub

Private Sub mnuEnd_Click()

    End
    
End Sub

Private Sub tmrD_Timer()

    If imgIcon.Top < frmIconMover.ScaleHeight + imgIcon.Height / 2 Then
        imgIcon.Top = imgIcon.Top + 100
    Else
        'SCREEN WRAP!!!
        imgIcon.Top = 0 - imgIcon.Height
    End If
    
End Sub

Private Sub tmrL_Timer()

    If imgIcon.Left > 0 - imgIcon.Width / 2 Then
        imgIcon.Left = imgIcon.Left - 100
    Else
        'SCREEN WRAP!!!
        imgIcon.Left = frmIconMover.Width - imgIcon.Width / 2
    End If
    
End Sub

Private Sub tmrR_Timer()

    If imgIcon.Left < frmIconMover.ScaleWidth - imgIcon.Width / 2 Then
        imgIcon.Left = imgIcon.Left + 100
    Else
        'SCREEN WRAP!!!
        imgIcon.Left = 0 - imgIcon.Width / 2
    End If
    
End Sub

Private Sub tmrU_Timer()

    If imgIcon.Top > 0 - imgIcon.Height / 2 Then
        imgIcon.Top = imgIcon.Top - 100
    Else
        'SCREEN WRAP!!!
        imgIcon.Top = frmIconMover.ScaleHeight + imgIcon.Height / 2
    End If
    
End Sub
