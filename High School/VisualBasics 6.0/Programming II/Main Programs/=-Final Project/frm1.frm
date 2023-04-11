VERSION 5.00
Begin VB.Form frm1 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "#1: Moving Image"
   ClientHeight    =   9510
   ClientLeft      =   150
   ClientTop       =   480
   ClientWidth     =   15975
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   9510
   ScaleWidth      =   15975
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmr2AutomaticAI 
      Interval        =   100
      Left            =   7200
      Top             =   3720
   End
   Begin VB.Timer tmr1MoveUp 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   7200
      Top             =   3240
   End
   Begin VB.Timer tmr1MoveDown 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   7200
      Top             =   4200
   End
   Begin VB.Timer tmr1MoveLeft 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   6720
      Top             =   3720
   End
   Begin VB.Timer tmr1MoveRight 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   7680
      Top             =   3720
   End
   Begin VB.Label lblMI 
      BackStyle       =   0  'Transparent
      Caption         =   "Flag"
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   8520
      TabIndex        =   0
      Top             =   5040
      Width           =   1575
   End
   Begin VB.Image imgMI 
      Height          =   765
      Left            =   7680
      Picture         =   "frm1.frx":0000
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   705
   End
   Begin VB.Image imgBG 
      Height          =   2175
      Left            =   0
      Picture         =   "frm1.frx":0342
      Stretch         =   -1  'True
      Top             =   0
      Width           =   2175
   End
   Begin VB.Menu mnuBack 
      Caption         =   "Go Back"
   End
   Begin VB.Menu mnuSpeed 
      Caption         =   "Input Speed"
      Begin VB.Menu mnuSpeed1 
         Caption         =   "1 - Slow"
      End
      Begin VB.Menu mnuSpeed2 
         Caption         =   "2 - Normal"
      End
      Begin VB.Menu mnuSpeed3 
         Caption         =   "3 - Fast"
      End
   End
End
Attribute VB_Name = "frm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim RanValue As Integer
Dim Speed As Integer


Private Sub Form_Load()

    imgBG.Height = frm1.ScaleHeight
    imgBG.Width = frm1.ScaleWidth
    
    imgMI.Height = 600
    imgMI.Width = 600
    
    Speed = 25
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Button = vbLeftButton Then
        tmr2AutomaticAI.Enabled = False
        tmr1MoveUp.Enabled = False
        tmr1MoveDown.Enabled = False
        tmr1MoveLeft.Enabled = False
        tmr1MoveRight.Enabled = False
        tmr2AutomaticAI.Enabled = False
        'lblMI.Visible = False
        
    End If
    
    If Button = vbRightButton Then
        tmr2AutomaticAI.Enabled = True
        tmr1MoveUp.Enabled = False
        tmr1MoveDown.Enabled = False
        tmr1MoveLeft.Enabled = False
        tmr1MoveRight.Enabled = False
        tmr2AutomaticAI.Enabled = True
        'lblMI.Visible = True
    End If
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Private Sub mnuBack_Click()

    frm1.Hide
    frm4Programs.Show
    
    tmr2AutomaticAI.Enabled = False
    tmr1MoveUp.Enabled = False
    tmr1MoveDown.Enabled = False
    tmr1MoveLeft.Enabled = False
    tmr1MoveRight.Enabled = False
    
End Sub

Private Sub mnuSpeed1_Click()

    Speed = 25
    tmr2AutomaticAI.Enabled = True
    
End Sub

Private Sub mnuSpeed2_Click()

    Speed = 100
    tmr2AutomaticAI.Enabled = True
    
End Sub

Private Sub mnuSpeed3_Click()

    Speed = 250
    tmr2AutomaticAI.Enabled = True
    
End Sub

Private Sub tmr1MoveDown_Timer()

    If imgMI.Top < frm1.ScaleHeight - imgMI.Height + 100 Then
        imgMI.Top = imgMI.Top + Speed
        lblMI.Top = imgMI.Top + imgMI.Height + Speed + 50
    Else
        imgMI.Top = 100
    End If
    
End Sub

Private Sub tmr1MoveLeft_Timer()

    If imgMI.Left > 0 - 100 Then
        imgMI.Left = imgMI.Left - Speed
        lblMI.Left = imgMI.Left + imgMI.Width - Speed + 50
    Else
        imgMI.Left = frm1.ScaleWidth + 100
    End If
    
End Sub

Private Sub tmr1MoveRight_Timer()

    If imgMI.Left < frm1.ScaleWidth - imgMI.Width + 100 Then
        imgMI.Left = imgMI.Left + Speed
        lblMI.Left = imgMI.Left + imgMI.Width + Speed + 50
    Else
        imgMI.Left = 100
    End If
    
End Sub

Private Sub tmr1MoveUp_Timer()

    If imgMI.Top > 0 - 100 Then
        imgMI.Top = imgMI.Top - Speed
        lblMI.Top = imgMI.Top + imgMI.Height - Speed + 50
    Else
        imgMI.Top = frm1.ScaleHeight + 100
    End If
    
End Sub

Private Sub tmr2AutomaticAI_Timer()

    Randomize
    
    RanValue = Int(1 + (Rnd * 10000))
    
    If RanValue > 1 And RanValue <= 2500 Then
        tmr1MoveUp.Enabled = False
        tmr1MoveDown.Enabled = False
        tmr1MoveLeft.Enabled = False
        tmr1MoveRight.Enabled = False
        
        If imgMI.Picture <> LoadPicture(App.Path & "\Images\Program 1 - MI.bmp") Then imgMI.Picture = LoadPicture(App.Path & "\Images\Program 1 - MI.bmp")
        tmr1MoveUp.Enabled = True
    End If
    
    If RanValue > 2500 And RanValue <= 5000 Then
        tmr1MoveUp.Enabled = False
        tmr1MoveDown.Enabled = False
        tmr1MoveLeft.Enabled = False
        tmr1MoveRight.Enabled = False
        
        If imgMI.Picture <> LoadPicture(App.Path & "\Images\Program 1 - MI.bmp") Then imgMI.Picture = LoadPicture(App.Path & "\Images\Program 1 - MI.bmp")
        tmr1MoveDown.Enabled = True
    End If
    
    If RanValue > 5000 And RanValue <= 7500 Then
        tmr1MoveUp.Enabled = False
        tmr1MoveDown.Enabled = False
        tmr1MoveLeft.Enabled = False
        tmr1MoveRight.Enabled = False
        
        If imgMI.Picture <> LoadPicture(App.Path & "\Images\Program 1 - MI.bmp") Then imgMI.Picture = LoadPicture(App.Path & "\Images\Program 1 - MI.bmp")
        tmr1MoveLeft.Enabled = True
    End If
    
    If RanValue > 7500 And RanValue <= 10000 Then
        tmr1MoveUp.Enabled = False
        tmr1MoveDown.Enabled = False
        tmr1MoveLeft.Enabled = False
        tmr1MoveRight.Enabled = False
        
        If imgMI.Picture <> LoadPicture(App.Path & "\Images\Program 1 - MI.bmp") Then imgMI.Picture = LoadPicture(App.Path & "\Images\Program 1 - MI.bmp")
        tmr1MoveRight.Enabled = True
    End If
    
    tmr2AutomaticAI.Interval = CInt(1 + (Rnd * 500))
    
End Sub
