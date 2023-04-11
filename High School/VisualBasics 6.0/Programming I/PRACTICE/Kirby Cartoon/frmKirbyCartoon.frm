VERSION 5.00
Begin VB.Form frmKirbyCartoon 
   BackColor       =   &H00FFFFFF&
   Caption         =   "KIRBY CARTOON"
   ClientHeight    =   6615
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   24495
   LinkTopic       =   "Form1"
   ScaleHeight     =   6615
   ScaleWidth      =   24495
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrK10 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   5520
      Top             =   120
   End
   Begin VB.Timer tmrK9 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   4920
      Top             =   120
   End
   Begin VB.Timer tmrK8 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   4320
      Top             =   120
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   615
      Left            =   12000
      TabIndex        =   3
      Top             =   120
      Width           =   1335
   End
   Begin VB.Timer tmrMK4 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   1920
      Top             =   720
   End
   Begin VB.Timer tmrMK3 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   1320
      Top             =   720
   End
   Begin VB.Timer tmrMK2 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   720
      Top             =   720
   End
   Begin VB.Timer tmrK7 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   3720
      Top             =   120
   End
   Begin VB.Timer tmrMK1 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   120
      Top             =   720
   End
   Begin VB.Timer tmrK6 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   3120
      Top             =   120
   End
   Begin VB.Timer tmrK5 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2520
      Top             =   120
   End
   Begin VB.Timer tmrK4 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   1920
      Top             =   120
   End
   Begin VB.Timer tmrK3 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   1320
      Top             =   120
   End
   Begin VB.Timer tmrK2 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   720
      Top             =   120
   End
   Begin VB.Timer tmrK1 
      Interval        =   50
      Left            =   120
      Top             =   120
   End
   Begin VB.Label lblK7 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "What's this?  You have something to tell me?"
      Height          =   855
      Left            =   20640
      TabIndex        =   4
      Top             =   3360
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Line lneK7 
      Visible         =   0   'False
      X1              =   20520
      X2              =   21000
      Y1              =   4920
      Y2              =   4080
   End
   Begin VB.Line lnePlatform1 
      X1              =   0
      X2              =   24480
      Y1              =   5420
      Y2              =   5420
   End
   Begin VB.Shape shpWater 
      BorderColor     =   &H8000000D&
      FillColor       =   &H00800000&
      FillStyle       =   0  'Solid
      Height          =   975
      Left            =   0
      Top             =   5640
      Width           =   24495
   End
   Begin VB.Label lblK6 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wait... I hear somebody coming!!"
      Height          =   855
      Left            =   20160
      TabIndex        =   2
      Top             =   3000
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Line lneK6 
      Visible         =   0   'False
      X1              =   20640
      X2              =   20400
      Y1              =   3720
      Y2              =   4920
   End
   Begin VB.Label lblK3 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Because if it flew over the bay it would be called a bagel!"
      Height          =   855
      Left            =   4080
      TabIndex        =   1
      Top             =   3360
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Label lblK2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Why does a seagull fly over the sea?"
      Height          =   855
      Left            =   7200
      TabIndex        =   0
      Top             =   3600
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Line lneK2 
      Visible         =   0   'False
      X1              =   6600
      X2              =   7440
      Y1              =   4920
      Y2              =   3960
   End
   Begin VB.Line lneK3 
      Visible         =   0   'False
      X1              =   6480
      X2              =   5400
      Y1              =   4800
      Y2              =   4080
   End
   Begin VB.Image imgK 
      Height          =   825
      Left            =   0
      Picture         =   "frmKirbyCartoon.frx":0000
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   720
   End
   Begin VB.Image imgMK 
      Height          =   540
      Left            =   1680
      Picture         =   "frmKirbyCartoon.frx":0723
      Stretch         =   -1  'True
      Top             =   4940
      Visible         =   0   'False
      Width           =   495
   End
End
Attribute VB_Name = "frmKirbyCartoon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim KCountL As Integer
Dim KCountR As Integer
Dim MKCountL As Integer
Dim MKCountR As Integer
Dim KPH As Integer          'KPH = 4680
Dim MKPH As Integer         'MKPH = 4940

Private Sub cmdReset_Click()

    'Reset whole Animation
    
    KPH = 4680
    MKPH = 4940
    
    'reset images
    imgK.Left = -1000
    imgK.Top = KPH
    imgMK.Left = -1000
    imgMK.Top = MKPH
    imgMK.Visible = False
    
    'reset timers
    tmrK1.Enabled = True
    tmrK2.Enabled = False
    tmrK3.Enabled = False
    tmrK4.Enabled = False
    tmrK5.Enabled = False
    tmrK6.Enabled = False
    tmrK7.Enabled = False
    tmrK8.Enabled = False
    tmrK9.Enabled = False
    tmrK10.Enabled = False
    tmrMK1.Enabled = False
    tmrMK2.Enabled = False
    tmrMK3.Enabled = False
    tmrMK4.Enabled = False
    
    'reset lines and labels
    lneK2.Visible = False
    lneK3.Visible = False
    lneK6.Visible = False
    lneK7.Visible = False
    
    lblK2.Visible = False
    lblK3.Visible = False
    lblK6.Visible = False
    lblK7.Visible = False

    
End Sub

Private Sub Form_Load()

    imgK.Left = -1000
    imgMK.Left = -1000
    
End Sub

Private Sub tmrK1_Timer()

    If imgK.Left <= 6000 Then
    
        KCountR = KCountR + 1
        
        imgK.Left = imgK.Left + 100
        
        If KCountR Mod 7 = 1 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR1.jpg")
        End If
        
        If KCountR Mod 7 = 2 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR2.jpg")
        End If
        
        If KCountR Mod 7 = 3 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR3.jpg")
        End If
        
        If KCountR Mod 7 = 4 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR4.jpg")
        End If
        
        If KCountR Mod 7 = 5 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR5.jpg")
        End If
        
        If KCountR Mod 7 = 6 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR6.jpg")
        End If
        
        If KCountR Mod 7 = 0 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR7.jpg")
        End If
        
        Else
            'load standing sprite
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyStandIdleR1.jpg")
            'turn off current timer
            tmrK1.Enabled = False
            'show line 1 and label 1
            lneK2.Visible = True
            lblK2.Visible = True
            'start next timer
            tmrK2.Enabled = True
            
    End If
    
End Sub

Private Sub tmrK10_Timer()

    KPH = 4680
    
    If imgK.Top <= KPH Then
        imgK.Top = imgK.Top + 100
        If tmrMK4.Interval > 10 Then
        tmrK10.Interval = tmrK10.Interval - 2
        Else
        tmrK10.Interval = 10
        End If
    Else
        tmrK10.Interval = 25
        tmrK9.Enabled = True
        tmrK10.Enabled = False
        imgK.Top = KPH
    End If
        
End Sub

Private Sub tmrK2_Timer()

    tmrK2.Enabled = False
    lneK2.Visible = False
    lblK2.Visible = False
    
    lneK3.Visible = True
    lblK3.Visible = True
    tmrK3.Enabled = True
    
End Sub

Private Sub tmrK3_Timer()

    tmrK3.Enabled = False
    lneK3.Visible = False
    lblK3.Visible = False
    
    tmrK4.Enabled = True
    
End Sub

Private Sub tmrK4_Timer()

    If imgK.Left >= 3000 Then
    
        KCountL = KCountL + 1
        
        imgK.Left = imgK.Left - 100
        
        If KCountL Mod 7 = 1 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL1.jpg")
        End If
        
        If KCountL Mod 7 = 2 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL2.jpg")
        End If
        
        If KCountL Mod 7 = 3 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL3.jpg")
        End If
        
        If KCountL Mod 7 = 4 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL4.jpg")
        End If
        
        If KCountL Mod 7 = 5 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL5.jpg")
        End If
        
        If KCountL Mod 7 = 6 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL6.jpg")
        End If
        
        If KCountL Mod 7 = 0 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL7.jpg")
        End If
        
        Else
            'load standing sprite
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyStandIdleL1.jpg")
            'turn off current timer
            tmrK4.Enabled = False
            'start next timer
            tmrK5.Enabled = True
    End If
    
End Sub

Private Sub tmrK5_Timer()

    If imgK.Left <= 20000 Then
    
        KCountR = KCountR + 1
        
        imgK.Left = imgK.Left + 100
        
        If KCountR Mod 7 = 1 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR1.jpg")
        End If
        
        If KCountR Mod 7 = 2 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR2.jpg")
        End If
        
        If KCountR Mod 7 = 3 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR3.jpg")
        End If
        
        If KCountR Mod 7 = 4 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR4.jpg")
        End If
        
        If KCountR Mod 7 = 5 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR5.jpg")
        End If
        
        If KCountR Mod 7 = 6 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR6.jpg")
        End If
        
        If KCountR Mod 7 = 0 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR7.jpg")
        End If
        
        Else
            'load standing sprite
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyStandIdleR1.jpg")
            'turn off current timer
            tmrK5.Enabled = False
            'show line 6 and label 6
            lneK6.Visible = True
            lblK6.Visible = True
            'start next timer
            tmrK6.Enabled = True
            
    End If
    
End Sub

Private Sub tmrK6_Timer()

    'turn off current timer
    tmrK6.Enabled = False
    'hide line 6 and label 6
    lneK6.Visible = False
    lblK6.Visible = False
    'start next timer
    tmrMK1.Enabled = True
    
    imgMK.Visible = True
    
End Sub

Private Sub tmrK7_Timer()

    'turn off current timer
    tmrK7.Enabled = False
    'hide line 6 and label 6
    lneK7.Visible = False
    lblK7.Visible = False
    'start next timer
    tmrMK2.Enabled = True
    tmrK8.Enabled = True
    
End Sub

Private Sub tmrK8_Timer()

    If imgK.Left >= 2000 Then
    
        KCountL = KCountL + 1
        
        imgK.Left = imgK.Left - 100
        
        If KCountL Mod 7 = 1 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL1.jpg")
        End If
        
        If KCountL Mod 7 = 2 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL2.jpg")
        End If
        
        If KCountL Mod 7 = 3 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL3.jpg")
        End If
        
        If KCountL Mod 7 = 4 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL4.jpg")
        End If
        
        If KCountL Mod 7 = 5 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL5.jpg")
        End If
        
        If KCountL Mod 7 = 6 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL6.jpg")
        End If
        
        If KCountL Mod 7 = 0 Then
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL7.jpg")
        End If
        
        Else
            'load standing sprite
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyStandIdleL1.jpg")
            'turn off current timer
            tmrK8.Enabled = False
            'start next timer
            tmrK9.Enabled = True
            tmrMK3.Enabled = True

    End If
    
End Sub

Private Sub tmrK9_Timer()

    KPH = 4680
    
    If imgK.Top >= 2000 Then
        imgK.Top = imgK.Top - 100
        tmrK9.Interval = tmrK9.Interval + 2
        tmrK10.Interval = tmrK9.Interval
    Else
        tmrK10.Interval = tmrK9.Interval
        tmrK9.Interval = 25
        tmrK9.Enabled = False
        tmrK10.Enabled = True
    End If
        
End Sub

Private Sub tmrMK1_Timer()

    If imgMK.Left <= 19000 Then
    
        MKCountR = MKCountR + 1
        
        imgMK.Left = imgMK.Left + 200
        
        If MKCountR Mod 7 = 1 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR1.jpg")
        End If
        
        If MKCountR Mod 7 = 2 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR2.jpg")
        End If
        
        If MKCountR Mod 7 = 3 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR3.jpg")
        End If
        
        If MKCountR Mod 7 = 4 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR4.jpg")
        End If
        
        If MKCountR Mod 7 = 5 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR5.jpg")
        End If
        
        If MKCountR Mod 7 = 6 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR6.jpg")
        End If
        
        If MKCountR Mod 7 = 0 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkR7.jpg")
        End If
        
        Else
            'load standing sprite
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyStandIdleR1.jpg")
            imgK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyStandIdleL1.jpg")
            'turn off current timer
            tmrMK1.Enabled = False
            'show line 6 and label 6
            lneK7.Visible = True
            lblK7.Visible = True
            'start next timer
            tmrK7.Enabled = True
            
    End If
    
End Sub

Private Sub tmrMK2_Timer()

    If imgMK.Left >= 1000 Then
    
        MKCountR = MKCountR + 1
        
        imgMK.Left = imgMK.Left - 100
        
        If MKCountR Mod 7 = 1 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL1.jpg")
        End If
        
        If MKCountR Mod 7 = 2 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL2.jpg")
        End If
        
        If MKCountR Mod 7 = 3 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL3.jpg")
        End If
        
        If MKCountR Mod 7 = 4 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL4.jpg")
        End If
        
        If MKCountR Mod 7 = 5 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL5.jpg")
        End If
        
        If MKCountR Mod 7 = 6 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL6.jpg")
        End If
        
        If MKCountR Mod 7 = 0 Then
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyWalkL7.jpg")
        End If
        
        Else
            'load standing sprite
            imgMK.Picture = LoadPicture(App.Path & "\Kirby Sprites\KirbyStandIdleL1.jpg")
            'turn off current timer
            tmrMK2.Enabled = False
            'start next timer
            
    End If
    
End Sub

Private Sub tmrMK3_Timer()

    MKPH = 4940
    
    If imgMK.Top >= 2000 Then
        imgMK.Top = imgMK.Top - 100
        tmrMK3.Interval = tmrMK3.Interval + 2
        tmrMK4.Interval = tmrMK3.Interval
    Else
        tmrMK4.Interval = tmrMK3.Interval
        tmrMK3.Interval = 25
        tmrMK3.Enabled = False
        tmrMK4.Enabled = True
    End If
        
End Sub

Private Sub tmrMK4_Timer()

    MKPH = 4940
    
    If imgMK.Top <= MKPH Then
        imgMK.Top = imgMK.Top + 100
        If tmrMK4.Interval > 10 Then
            tmrMK4.Interval = tmrMK4.Interval - 2
            Else
            tmrMK4.Interval = 10
        End If
    Else
        tmrMK4.Interval = 25
        tmrMK3.Enabled = True
        tmrMK4.Enabled = False
        imgMK.Top = 4940
    End If
     
End Sub
