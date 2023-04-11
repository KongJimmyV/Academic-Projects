VERSION 5.00
Begin VB.Form frmLauncher 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Shoot"
   ClientHeight    =   10815
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   17460
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10815
   ScaleWidth      =   17460
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrTarget 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   13320
      Top             =   5040
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   9
      Interval        =   10
      Left            =   8760
      Top             =   2880
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   8
      Interval        =   10
      Left            =   8760
      Top             =   3360
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   7
      Interval        =   10
      Left            =   8760
      Top             =   3840
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   6
      Interval        =   10
      Left            =   8760
      Top             =   4320
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   5
      Interval        =   10
      Left            =   8760
      Top             =   4800
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   4
      Interval        =   10
      Left            =   8760
      Top             =   5280
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   3
      Interval        =   10
      Left            =   8760
      Top             =   5760
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   2
      Interval        =   10
      Left            =   8760
      Top             =   6240
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   1
      Interval        =   10
      Left            =   8760
      Top             =   6720
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   0
      Interval        =   10
      Left            =   10320
      Top             =   8280
   End
   Begin VB.Timer tmrR 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   10440
      Top             =   10200
   End
   Begin VB.Timer tmrL 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   6360
      Top             =   10200
   End
   Begin VB.Image imgLauncher 
      Height          =   1080
      Left            =   8000
      Picture         =   "frmLauncher.frx":0000
      Stretch         =   -1  'True
      Top             =   9000
      Width           =   1080
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   9
      Left            =   8040
      Picture         =   "frmLauncher.frx":030A
      Stretch         =   -1  'True
      Top             =   2880
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   8
      Left            =   8040
      Picture         =   "frmLauncher.frx":0614
      Stretch         =   -1  'True
      Top             =   3360
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   7
      Left            =   8040
      Picture         =   "frmLauncher.frx":091E
      Stretch         =   -1  'True
      Top             =   3840
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   6
      Left            =   8040
      Picture         =   "frmLauncher.frx":0C28
      Stretch         =   -1  'True
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   5
      Left            =   8040
      Picture         =   "frmLauncher.frx":0F32
      Stretch         =   -1  'True
      Top             =   4800
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   4
      Left            =   8040
      Picture         =   "frmLauncher.frx":123C
      Stretch         =   -1  'True
      Top             =   5280
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   3
      Left            =   8040
      Picture         =   "frmLauncher.frx":1546
      Stretch         =   -1  'True
      Top             =   5760
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   2
      Left            =   8040
      Picture         =   "frmLauncher.frx":1850
      Stretch         =   -1  'True
      Top             =   6240
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   1
      Left            =   8040
      Picture         =   "frmLauncher.frx":1B5A
      Stretch         =   -1  'True
      Top             =   6720
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   480
      Index           =   0
      Left            =   8300
      Picture         =   "frmLauncher.frx":1E64
      Stretch         =   -1  'True
      Top             =   8520
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgTarget 
      Height          =   735
      Left            =   8280
      Picture         =   "frmLauncher.frx":216E
      Stretch         =   -1  'True
      Top             =   360
      Width           =   975
   End
End
Attribute VB_Name = "frmLauncher"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Index As Integer

Private Sub Form_Activate()

    imgLauncher.Top = 9000
    imgLauncher.Left = 8200
    
    imgAmmo(Index).Enabled = False
    imgAmmo(Index).Visible = False
    imgAmmo(Index).Top = 0
    imgAmmo(Index).Left = 0

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyLeft Then
        tmrL.Enabled = True
        End If
        
    If KeyCode = vbKeyRight Then
        tmrR.Enabled = True
        End If
        
    If KeyCode = vbKeyUp And imgAmmo(Index).Enabled = False Then
        imgAmmo(Index).Enabled = True
        imgAmmo(Index).Visible = True
        '//align ammo to launcher
        imgAmmo(Index).Left = imgLauncher.Left + 300
        imgAmmo(Index).Top = imgLauncher.Top
        tmrAmmo(Index).Enabled = True
        Index = Index + 1
            If Index >= 10 Then
                Index = 0
            End If
        
        End If
        
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyLeft Then
        tmrL.Enabled = False
        End If
        
    If KeyCode = vbKeyRight Then
        tmrR.Enabled = False
        End If
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End

End Sub

Private Sub tmrAmmo_Timer(Index As Integer)

    imgAmmo(Index).Top = imgAmmo(Index).Top - 200
    
    If imgAmmo(Index).Top < -500 Then
        imgAmmo(Index).Enabled = False
        imgAmmo(Index).Visible = False
        tmrAmmo(Index).Enabled = False
    End If
    
    '//check for hit on Target
    If imgAmmo(Index).Left >= imgTarget.Left Then
        If imgAmmo(Index).Left + imgAmmo(Index).Width <= imgTarget.Left + imgTarget.Width Then
            If imgAmmo(Index).Top >= imgTarget.Top Then
                If imgAmmo(Index).Top + imgAmmo(Index).Height <= imgTarget.Top + imgTarget.Height Then
                    imgTarget.Visible = False
                    tmrTarget.Enabled = True
                End If
            End If
        End If
    End If
    
    
    
End Sub

Private Sub tmrL_Timer()

If imgLauncher.Left <= -400 Then
    imgLauncher.Left = 16800
    Else
    imgLauncher.Left = imgLauncher.Left - 200
    End If

End Sub

Private Sub tmrR_Timer()

If imgLauncher.Left >= 16800 Then
    imgLauncher.Left = -400
    Else
    imgLauncher.Left = imgLauncher.Left + 200
    End If
    
End Sub


Private Sub tmrTarget_Timer()

    tmrTarget.Enabled = False
    imgTarget.Visible = True
    imgTarget.Left = Rnd * frmLauncher.Width
    imgTarget.Top = Rnd * frmLauncher.Height
    
End Sub
