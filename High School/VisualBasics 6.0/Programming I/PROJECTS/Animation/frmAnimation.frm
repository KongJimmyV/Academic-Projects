VERSION 5.00
Begin VB.Form frmAnimation 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Animation"
   ClientHeight    =   10335
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   19110
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Palette         =   "frmAnimation.frx":0000
   Picture         =   "frmAnimation.frx":02FB
   ScaleHeight     =   10335
   ScaleWidth      =   19110
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrD2RReset 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   18120
      Top             =   3360
   End
   Begin VB.Timer tmrD2QEnd2 
      Enabled         =   0   'False
      Interval        =   7000
      Left            =   18120
      Top             =   2760
   End
   Begin VB.Timer tmrD2PEnd 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   17520
      Top             =   2760
   End
   Begin VB.Timer tmrD2O 
      Enabled         =   0   'False
      Interval        =   75
      Left            =   16920
      Top             =   2760
   End
   Begin VB.Timer tmrD2N 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   16320
      Top             =   2760
   End
   Begin VB.Timer tmrD2M 
      Enabled         =   0   'False
      Interval        =   900
      Left            =   15720
      Top             =   2760
   End
   Begin VB.Timer tmrD1O 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   15120
      Top             =   2160
   End
   Begin VB.Timer tmrD1N 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   14520
      Top             =   2160
   End
   Begin VB.Timer tmrD2L 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   15120
      Top             =   2760
   End
   Begin VB.Timer tmrD1M 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   13920
      Top             =   2160
   End
   Begin VB.Timer tmrD1L 
      Enabled         =   0   'False
      Interval        =   400
      Left            =   13320
      Top             =   2160
   End
   Begin VB.Timer tmrD2K 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   12720
      Top             =   2760
   End
   Begin VB.Timer tmrD2JdotEnd 
      Enabled         =   0   'False
      Interval        =   1700
      Left            =   11520
      Top             =   3360
   End
   Begin VB.Timer tmrD1K 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   12120
      Top             =   2160
   End
   Begin VB.Timer tmrD2Jdot5 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   11040
      Top             =   3360
   End
   Begin VB.Timer tmrD2Jdot4 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   10560
      Top             =   3360
   End
   Begin VB.Timer tmrD2Jdot3 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   10080
      Top             =   3360
   End
   Begin VB.Timer tmrD2Jdot2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   9600
      Top             =   3360
   End
   Begin VB.Timer tmrD2Jdot1 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   9600
      Top             =   2760
   End
   Begin VB.Timer tmrD2I 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   7800
      Top             =   2760
   End
   Begin VB.Timer tmrD1J 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   9000
      Top             =   2160
   End
   Begin VB.Timer tmrD1I 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   8400
      Top             =   2160
   End
   Begin VB.Timer tmrD2H 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   7200
      Top             =   2760
   End
   Begin VB.Timer tmrD2G 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   6600
      Top             =   2760
   End
   Begin VB.Timer tmrD2F 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   6000
      Top             =   2760
   End
   Begin VB.CommandButton cmdPlay 
      Caption         =   "Play Animation"
      Height          =   735
      Left            =   9240
      TabIndex        =   4
      Top             =   4560
      Width           =   1335
   End
   Begin VB.Timer tmrD1H 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   5400
      Top             =   2160
   End
   Begin VB.Timer tmrD1G 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   4800
      Top             =   2160
   End
   Begin VB.Timer tmrD1F 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   4200
      Top             =   2160
   End
   Begin VB.Timer tmrD2E 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   3720
      Top             =   2760
   End
   Begin VB.Timer tmrD2D 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   3120
      Top             =   2760
   End
   Begin VB.Timer tmrD1E 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   3120
      Top             =   2160
   End
   Begin VB.Timer tmrD2C 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   2520
      Top             =   2760
   End
   Begin VB.Timer tmrD2B 
      Enabled         =   0   'False
      Interval        =   880
      Left            =   1920
      Top             =   2760
   End
   Begin VB.Timer tmrD2A 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   1320
      Top             =   2760
   End
   Begin VB.Timer tmrD1D 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   2520
      Top             =   2160
   End
   Begin VB.Timer tmrD1C 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   1320
      Top             =   2160
   End
   Begin VB.Timer tmrD1B 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   720
      Top             =   2160
   End
   Begin VB.Timer tmrD1A 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   120
      Top             =   2160
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label lblTheEnd 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "The End"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   48
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   7200
      TabIndex        =   11
      Top             =   4440
      Visible         =   0   'False
      Width           =   5415
   End
   Begin VB.Label lblD2N 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "...I'll be back..."
      BeginProperty Font 
         Name            =   "Symbol"
         Size            =   9.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   9000
      TabIndex        =   10
      Top             =   8280
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Line lneD2N 
      Visible         =   0   'False
      X1              =   9120
      X2              =   9600
      Y1              =   9240
      Y2              =   8640
   End
   Begin VB.Label lblD2L 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "I don't see anything..."
      BeginProperty Font 
         Name            =   "Symbol"
         Size            =   9.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   8040
      TabIndex        =   9
      Top             =   7920
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Line lneD2L 
      Visible         =   0   'False
      X1              =   9000
      X2              =   8880
      Y1              =   9240
      Y2              =   8520
   End
   Begin VB.Label lblD1K 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "---Umm...  Look!!!  A ""10101110""!!!---"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   13320
      TabIndex        =   8
      Top             =   7920
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Line lneD1K 
      Visible         =   0   'False
      X1              =   13920
      X2              =   14040
      Y1              =   8760
      Y2              =   8280
   End
   Begin VB.Label lblD2J 
      BackStyle       =   0  'Transparent
      Caption         =   "."
      BeginProperty Font 
         Name            =   "Symbol"
         Size            =   20.25
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   9960
      TabIndex        =   7
      Top             =   8880
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label lblD1J 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "--I'm sorry.  ----Am I suppose to understand that?  I don't speak alienese.----"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   13920
      TabIndex        =   6
      Top             =   7440
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Line lneD1J 
      Visible         =   0   'False
      X1              =   14160
      X2              =   14760
      Y1              =   9000
      Y2              =   8160
   End
   Begin VB.Label lblD2H 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "I am whats left of the Special Droids.  Soon you will be destroyed too.  :)"
      BeginProperty Font 
         Name            =   "Symbol"
         Size            =   9.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   7320
      TabIndex        =   5
      Top             =   7560
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Line lneD2H 
      Visible         =   0   'False
      X1              =   8880
      X2              =   8640
      Y1              =   9240
      Y2              =   8640
   End
   Begin VB.Label lblD1G 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "--!!!!!??!??!!!!!--"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   14040
      TabIndex        =   3
      Top             =   6960
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Line lneD1G 
      Visible         =   0   'False
      X1              =   14160
      X2              =   14640
      Y1              =   9000
      Y2              =   7800
   End
   Begin VB.Label lblD2A 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Geronimo!!!!"
      BeginProperty Font 
         Name            =   "Symbol"
         Size            =   18
         Charset         =   2
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   720
      TabIndex        =   2
      Top             =   6240
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.Line lneD2A 
      Visible         =   0   'False
      X1              =   0
      X2              =   1440
      Y1              =   8040
      Y2              =   7080
   End
   Begin VB.Label lblD1B 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "  ?..?..?..?..?   My sensors are indicating something..."
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   13320
      TabIndex        =   1
      Top             =   7200
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Line lneD1B 
      Visible         =   0   'False
      X1              =   12840
      X2              =   13800
      Y1              =   9000
      Y2              =   7920
   End
   Begin VB.Image imgD1 
      Height          =   2625
      Left            =   840
      Picture         =   "frmAnimation.frx":5730
      Stretch         =   -1  'True
      Top             =   7680
      Visible         =   0   'False
      Width           =   2625
   End
   Begin VB.Image imgD2 
      Height          =   1770
      Left            =   3840
      Picture         =   "frmAnimation.frx":5A25
      Stretch         =   -1  'True
      Top             =   8520
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Shape shpGrass 
      BackColor       =   &H0000C000&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H0000C000&
      BorderStyle     =   0  'Transparent
      Height          =   495
      Left            =   0
      Top             =   9840
      Width           =   20415
   End
   Begin VB.Image imgBack 
      Height          =   10455
      Left            =   0
      Picture         =   "frmAnimation.frx":5D1A
      Stretch         =   -1  'True
      Top             =   0
      Width           =   19095
   End
End
Attribute VB_Name = "frmAnimation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim D1CountL As Integer
Dim D1CountR As Integer
Dim D2CountL As Integer
Dim D2CountR As Integer

Dim D1Var As Integer
Dim D2Var As Integer

Dim Wait As Integer
'D1OH = 7680    'Orignal Height of D1
'D2OH = 8520    'Orignal Height of D2

Private Sub cmdPlay_Click()

    imgD1.Visible = True
    tmrD1A.Enabled = True
    cmdPlay.Visible = False
    cmdReset.Visible = True
    
End Sub

Private Sub cmdReset_Click()

    'Reset whole Animation
    
    D1OH = 7680     'Orignal Height of D1
    D2OH = 8520     'Orignal Height of D2
    
    'reset images
    imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
    imgD1.Left = 840
    imgD1.Top = D1OH
    imgD1.Visible = False
    
    imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
    imgD2.Left = -2000
    imgD2.Top = D2OH
    imgD2.Visible = False
    
    'reset timers
    tmrD1A.Enabled = False
    tmrD1B.Enabled = False
    tmrD1C.Enabled = False
    tmrD1D.Enabled = False
    tmrD1E.Enabled = False
    tmrD1F.Enabled = False
    tmrD1G.Enabled = False
    tmrD1H.Enabled = False
    tmrD1I.Enabled = False
    tmrD1J.Enabled = False
    tmrD1K.Enabled = False
    tmrD1L.Enabled = False
    tmrD1M.Enabled = False
    tmrD1N.Enabled = False
    tmrD1O.Enabled = False
    
    
    tmrD2A.Enabled = False
    tmrD2B.Enabled = False
    tmrD2C.Enabled = False
    tmrD2D.Enabled = False
    tmrD2E.Enabled = False
    tmrD2D.Enabled = False
    tmrD2F.Enabled = False
    tmrD2G.Enabled = False
    tmrD2H.Enabled = False
    tmrD2I.Enabled = False
    tmrD2Jdot1.Enabled = False
    tmrD2Jdot2.Enabled = False
    tmrD2Jdot3.Enabled = False
    tmrD2Jdot4.Enabled = False
    tmrD2Jdot5.Enabled = False
    tmrD2K.Enabled = False
    tmrD2L.Enabled = False
    tmrD2M.Enabled = False
    tmrD2N.Enabled = False
    tmrD2O.Enabled = False
    tmrD2PEnd.Enabled = False
    tmrD2QEnd2.Enabled = False
    tmrD2RReset.Enabled = False
    
    
    'reset lines and labels
    lneD1B.Visible = False
    lneD1G.Visible = False
    lneD1J.Visible = False
    lneD1K.Visible = False
    lneD2A.Visible = False
    lneD2H.Visible = False
    'lneD2J.Visible = False
    lneD2L.Visible = False
    lneD2N.Visible = False
    
    lblD1B.Visible = False
    lblD1G.Visible = False
    lblD1J.Visible = False
    lneD1K.Visible = False
    lblD2A.Visible = False
    lblD2H.Visible = False
    lblD2J.Visible = False
    lblD2L.Visible = False
    lblD2N.Visible = False
    
    lblTheEnd.Visible = False
    
    
    lneD2N.Y1 = 9240
    lneD2N.Y2 = 8640
    lblD2N.Left = 9000
    lblD2N.Top = 8280
    
    
    'reset label captions
    lblD1B.Caption = "  ?..?..?..?..?   My sensors are indicating something..."
    lblD1G.Caption = "--!!!!!??!??!!!!!--"
    lblD1J.Caption = "--I'm sorry.  ----Am I suppose to understand that?  I don't speak alienese.----"
    ''''lblD1K.Caption = Can't Reset
    lblD2A.Caption = "Geronimo!!!!"
    lblD2H.Caption = "I am whats left of the Special Droids.  Soon you will be destroyed too.  :)"
    lblD2L.Caption = "I don't see anything..."
    lblD2N.Caption = "...I will be back..."
    
    'reset cmd buttons
    cmdPlay.Visible = True
    cmdReset.Visible = False
    
End Sub

Private Sub Form_Load()

    'define place holders
    D1OH = 7680     'Orignal Height of D1
    D2OH = 8520     'Orignal Height of D2
    
    'initiates images
    imgD1.Left = 840
    imgD1.Top = D1OH
    imgD1.Visible = False
    imgD2.Left = -2000
    imgD2.Top = D2OH
    imgD2.Visible = False
    
    'hide lines and labels
    lneD1B.Visible = False
    lneD1G.Visible = False
    lneD1J.Visible = False
    lneD2A.Visible = False
    lneD2H.Visible = False
    'lneD2J
    
    lblD1B.Visible = False
    lblD1G.Visible = False
    lblD1J.Visible = False
    lblD2A.Visible = False
    lblD2H.Visible = False
    lblD2J.Visible = False
    
End Sub

Private Sub tmrD1A_Timer()

    If imgD1.Left <= 11000 Then
    
        D1CountR = D1CountR + 1
        
        imgD1.Left = imgD1.Left + 75
        
        If D1CountR Mod 6 = 1 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk1.gif")
        End If
        
        If D1CountR Mod 6 = 2 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk2.gif")
        End If
        
        If D1CountR Mod 6 = 3 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk3.gif")
        End If
        
        If D1CountR Mod 6 = 4 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk4.gif")
        End If
        
        If D1CountR Mod 6 = 5 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk5.gif")
        End If
        
        If D1CountR Mod 6 = 0 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk6.gif")
        End If

        Else
            'load standing sprite
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
            'turn off current timer
            tmrD1A.Enabled = False
            'show line 1 and label 1
            lneD1B.Visible = True
            lblD1B.Visible = True
            'start next timer
            tmrD1B.Enabled = True
            
    End If
    
End Sub

Private Sub tmrD1B_Timer()

    'Change Caption
    lblD1B.Caption = "...and it appears to be headed this way..."
    
    'Disable Current Timer
    tmrD1B.Enabled = False
    
    'Initiates Next Timers
    tmrD2A.Enabled = True
    tmrD1C.Enabled = True
    
End Sub

Private Sub tmrD1C_Timer()

    'Turn the SW Droid
    imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LStandIdle1.gif")
    
    'Disable Current Timer
    tmrD1C.Enabled = False
    
    'Enable next timer
    
End Sub

Private Sub tmrD1D_Timer()

    'Disable Current Timer
    tmrD1D.Enabled = False
    
    'Change Caption
    lblD1B.Visible = True
    lneD1B.Visible = True
    
    lblD1B.Caption = "?..?..?"

    'Initiates Next Timers
    tmrD1E.Enabled = True
    
End Sub

Private Sub tmrD1E_Timer()

    lblD1B.Visible = False
    lneD1B.Visible = False
    
    imgD2.Visible = True
    D2CountR = 0
    tmrD1E.Enabled = False
    tmrD2E.Enabled = True
    
End Sub

Private Sub tmrD1F_Timer()

    If imgD1.Left <= D1Var Then
        
        imgD1.Left = imgD1.Left + 175
        
        If D1CountR Mod 6 = 1 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk6.gif")
        End If
        
        If D1CountR Mod 6 = 2 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk5.gif")
        End If
        
        If D1CountR Mod 6 = 3 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk4.gif")
        End If
        
        If D1CountR Mod 6 = 4 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk3.gif")
        End If
        
        If D1CountR Mod 6 = 5 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk2.gif")
        End If
        
        If D1CountR Mod 6 = 0 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk1.gif")
        End If
        
        Else
            'load standing sprite
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LStandIdle1.gif")
            'turn off current timer
            tmrD1F.Enabled = False
            'show line 1 and label 1
            lneD1G.Visible = True
            lblD1G.Visible = True
            'start next timer
            tmrD1G.Enabled = True
    End If
    
End Sub

Private Sub tmrD1G_Timer()

    'change label
    lblD1G.Caption = "Impossible! ---  You exploded into thin air!  You cannot be alive!  Who are you?"
    'disable current timer
    tmrD1G.Enabled = False
    'initiate next timer
    tmrD1H.Enabled = True
    
End Sub

Private Sub tmrD1H_Timer()

    'remove lne lbl from view
    lneD1G.Visible = False
    lblD1G.Visible = False
    'disable current timer
    tmrD1H.Enabled = False
    'initiate next timer
    tmrD2F.Enabled = True
    
End Sub

Private Sub tmrD1I_Timer()

    'disable current timer
    tmrD1I.Enabled = False
    'initaite next timer
    tmrD1J.Enabled = True
    'show lbl and lne
    lblD1J.Visible = True
    lneD1J.Visible = True
    
End Sub

Private Sub tmrD1J_Timer()

    'hide lbl and lne
    lblD1J.Visible = False
    lneD1J.Visible = False
    'disable current timer
    tmrD1J.Enabled = False
    'initaite next timer
    tmrD2Jdot1.Enabled = True
    
End Sub

Private Sub tmrD1K_Timer()

    'show lbl and lne
    lblD1K.Visible = True
    lneD1K.Visible = True
    'disable current timer
    tmrD1K.Enabled = False
    'initiate next timer
    tmrD2K.Enabled = True
    
End Sub

Private Sub tmrD1L_Timer()

    'disable current timer
    tmrD1L.Enabled = False
    'initiate next timer
    tmrD1M.Enabled = True
    'set D1Var
    D1Var = imgD1.Left + 500
    
End Sub

Private Sub tmrD1M_Timer()

    If imgD1.Left <= D1Var Then
        
        imgD1.Left = imgD1.Left + 25
        
        D1CountR = D1CountR + 1
        
        If D1CountR Mod 6 = 1 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk6.gif")
        End If
        
        If D1CountR Mod 6 = 2 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk5.gif")
        End If
        
        If D1CountR Mod 6 = 3 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk4.gif")
        End If
        
        If D1CountR Mod 6 = 4 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk3.gif")
        End If
        
        If D1CountR Mod 6 = 5 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk2.gif")
        End If
        
        If D1CountR Mod 6 = 0 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LWalk1.gif")
        End If
        
        Else
            'load standing sprite
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LStandIdle1.gif")
            'turn off current timer
            tmrD1M.Enabled = False
            'start next timer
            tmrD1N.Enabled = True
    End If
    
End Sub

Private Sub tmrD1N_Timer()

    'disable current timer
    tmrD1N.Enabled = False
    'define D1Var
    D1Var = frmAnimation.Width + 5000
    'show lbl and lne
    lneD2L.Visible = True
    lblD2L.Visible = True
    'initiate next timer
    tmrD1O.Enabled = True
    tmrD2L.Enabled = True
    
End Sub

Private Sub tmrD1O_Timer()

    If imgD1.Left <= D1Var Then
        
        imgD1.Left = imgD1.Left + 275
        
        D1CountR = D1CountR + 1
        
        If D1CountR Mod 6 = 1 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk1.gif")
        End If
        
        If D1CountR Mod 6 = 2 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk2.gif")
        End If
        
        If D1CountR Mod 6 = 3 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk3.gif")
        End If
        
        If D1CountR Mod 6 = 4 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk4.gif")
        End If
        
        If D1CountR Mod 6 = 5 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk5.gif")
        End If
        
        If D1CountR Mod 6 = 0 Then
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk6.gif")
        End If
        
        Else
            'load standing sprite
            imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
            'turn off current timer
            tmrD1O.Enabled = False
    End If
    
End Sub

Private Sub tmrD2A_Timer()

    'removes label and line from view
    lblD1B.Visible = False
    lneD1B.Visible = False
    'loads next label and line into view
    lblD2A.Visible = True
    lneD2A.Visible = True
    'disable current timer
    tmrD2A.Enabled = False
    'next timer
    tmrD2B.Enabled = True
    
End Sub

Private Sub tmrD2B_Timer()

    'removes label and line from view
    lblD2A.Visible = False
    lneD2A.Visible = False
    'enabled and visify image D2 Droid
    imgD2.Enabled = True
    imgD2.Visible = True
    'disable current timer
    tmrD2B.Enabled = False
    'enable timers
    tmrD2C.Enabled = True
    tmrD1D.Enabled = True
    
End Sub

Private Sub tmrD2C_Timer()

    If imgD2.Left <= 7000 Then
    
        D2CountR = D2CountR + 1
        
        imgD2.Left = imgD2.Left + 400
        
        If D2CountR Mod 3 = 1 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RRoll1.gif")
        End If
        
        If D2CountR Mod 3 = 2 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RRoll2.gif")
        End If
        
        If D2CountR Mod 3 = 0 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RRoll3.gif")
        End If

        Else
            'disable current timer
            tmrD2C.Enabled = False
            'enable next timer
            tmrD2D.Enabled = True
            D2CountR = 0
            
    End If
    
End Sub

Private Sub tmrD2D_Timer()

    D2CountR = D2CountR + 1

        If D2CountR Mod 18 = 1 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode1.gif")
        End If
        
        If D2CountR Mod 18 = 2 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode2.gif")
        End If
        
        If D2CountR Mod 18 = 3 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode3.gif")
        End If
        
        If D2CountR Mod 18 = 4 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode4.gif")
        End If
        
        If D2CountR Mod 18 = 5 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode5.gif")
        End If
        
        If D2CountR Mod 18 = 6 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode6.gif")
        End If
        
        If D2CountR Mod 18 = 7 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode7.gif")
        End If
        
        If D2CountR Mod 18 = 8 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode8.gif")
        End If
        
        If D2CountR Mod 18 = 9 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode9.gif")
        End If
        
        If D2CountR Mod 18 = 10 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode10.gif")
        End If
        
        If D2CountR Mod 18 = 11 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode11.gif")
        End If
        
        If D2CountR Mod 18 = 12 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode12.gif")
        End If
        
        If D2CountR Mod 18 = 13 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode13.gif")
        End If
        
        If D2CountR Mod 18 = 14 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode14.gif")
        End If
        
        If D2CountR Mod 18 = 15 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode15.gif")
        End If
        
        If D2CountR Mod 18 = 16 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode16.gif")
        End If
        
        If D2CountR Mod 18 = 17 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode17.gif")
        End If
        
        If D2CountR Mod 18 = 0 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode18.gif")
        End If
        
    If D2CountR Mod 18 = 0 Then
        'disable current timer
        tmrD2D.Enabled = False
        'standidle pic
        imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode18.gif")
        imgD2.Visible = False
        
    End If
End Sub

Private Sub tmrD2E_Timer()
    
    D2CountR = D2CountR + 1

        If D2CountR Mod 19 = 1 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode18.gif")
        End If
        
        If D2CountR Mod 19 = 2 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode17.gif")
        End If
        
        If D2CountR Mod 19 = 3 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode16.gif")
        End If
        
        If D2CountR Mod 19 = 4 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode15.gif")
        End If
        
        If D2CountR Mod 19 = 5 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode14.gif")
        End If
        
        If D2CountR Mod 19 = 6 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode13.gif")
        End If
        
        If D2CountR Mod 19 = 7 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode12.gif")
        End If
        
        If D2CountR Mod 19 = 8 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode11.gif")
        End If
        
        If D2CountR Mod 19 = 9 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode10.gif")
        End If
        
        If D2CountR Mod 19 = 10 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode9.gif")
        End If
        
        If D2CountR Mod 19 = 11 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode8.gif")
        End If
        
        If D2CountR Mod 19 = 12 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode7.gif")
        End If
        
        If D2CountR Mod 19 = 13 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode6.gif")
        End If
        
        If D2CountR Mod 19 = 14 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode5.gif")
        End If
        
        If D2CountR Mod 19 = 15 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode4.gif")
        End If
        
        If D2CountR Mod 19 = 16 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode3.gif")
        End If
        
        If D2CountR Mod 19 = 17 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode2.gif")
        End If
        
        If D2CountR Mod 19 = 18 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\" & "explode1.gif")
        End If
        
        If D2CountR Mod 19 = 0 Then
            tmrD2E.Enabled = False
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
            tmrD1F.Enabled = True
            D1Var = imgD1.Left + 1250
            
        End If
        
End Sub

Private Sub tmrD2F_Timer()

    'wait then
    'disable current timer
    tmrD2F.Enabled = False
    'define D2Var
    D2Var = imgD2.Left + 1000
    'initate next timer
    tmrD2G.Enabled = True
    
End Sub

Private Sub tmrD2G_Timer()

    If imgD2.Left <= D2Var Then
    
        D2CountR = D2CountR + 1
        
        imgD2.Left = imgD2.Left + 75
        
        If D2CountR Mod 6 = 1 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk1.gif")
        End If
        
        If D2CountR Mod 6 = 2 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk2.gif")
        End If
        
        If D2CountR Mod 6 = 3 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk3.gif")
        End If
        
        If D2CountR Mod 6 = 4 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk4.gif")
        End If
        
        If D2CountR Mod 6 = 5 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk5.gif")
        End If
        
        If D2CountR Mod 6 = 0 Then
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RWalk6.gif")
        End If

        Else
            'load standing sprite
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
            'turn off current timer
            tmrD2G.Enabled = False
            'show line 1 and label 1
            lneD2H.Visible = True
            lblD2H.Visible = True
            'start next timer
            tmrD2H.Enabled = True
            
    End If
    
End Sub

Private Sub tmrD2H_Timer()

    'change label
    lblD2H.Caption = "And soon, you will join them after I am done with you. Prepare for your demise ROBOT."
    'disable current timer
    tmrD2H.Enabled = False
    'initiate next timer
    tmrD2I.Enabled = True
    
End Sub

Private Sub tmrD2I_Timer()

    'hide lbl and lne
    lblD2H.Visible = False
    lneD2H.Visible = False
    'disable current timer
    tmrD2I.Enabled = False
    'initiate next timer
    tmrD1I.Enabled = True
    
End Sub

Private Sub tmrD2J_Timer()

    'hide lbl and lne
    ''lblD2J.Visible = True
    ''lneD2J.Visible = True
    'disable current timer
    tmrD2J.Enabled = False
    'initiate next timer
    ''tmrD1K.Enabled = True
    
End Sub

Private Sub tmrD2Jdot1_Timer()

    'show lbl
    lblD2J.Visible = True
    'change caption
    lblD2J.Caption = "."
    'disable current timer
    tmrD2Jdot1.Enabled = False
    'initaite next timer
    tmrD2Jdot2.Enabled = True
    
End Sub

Private Sub tmrD2Jdot2_Timer()

    'change caption
    lblD2J.Caption = ".."
    'disable current timer
    tmrD2Jdot2.Enabled = False
    'initaite next timer
    tmrD2Jdot3.Enabled = True
    
End Sub

Private Sub tmrD2Jdot3_Timer()

    'change caption
    lblD2J.Caption = "..."
    'disable current timer
    tmrD2Jdot3.Enabled = False
    'initaite next timer
    tmrD2Jdot4.Enabled = True
    
End Sub

Private Sub tmrD2Jdot4_Timer()

    'change caption
    lblD2J.Caption = "...."
    'disable current timer
    tmrD2Jdot4.Enabled = False
    'initaite next timer
    tmrD2Jdot5.Enabled = True
    
End Sub

Private Sub tmrD2Jdot5_Timer()

    'change caption
    lblD2J.Caption = "....."
    'disable current timer
    tmrD2Jdot5.Enabled = False
    'initaite next timer
    tmrD2JdotEnd.Enabled = True
    
End Sub

Private Sub tmrD2JdotEnd_Timer()

    'hide label
    lblD2J.Visible = False
    'disable current timer
    tmrD2JdotEnd.Enabled = False
    'initaite next timer
    tmrD1K.Enabled = True
    
End Sub

Private Sub tmrD2K_Timer()

    'hide lbl and lne
    lneD1K.Visible = False
    lblD1K.Visible = False
    'turn D2
    imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D LStandIdle1.gif")
    'disable current timer
    tmrD2K.Enabled = False
    'initiate next timer
    tmrD1L.Enabled = True
    
End Sub

Private Sub tmrD2L_Timer()

    'Turn D2
    imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
    'timer dis
    tmrD2L.Enabled = False
    'timer int
    tmrD2M.Enabled = True
    
End Sub

Private Sub tmrD2M_Timer()

    'hide lbl and lne
    lneD2L.Visible = False
    lblD2L.Visible = False
    'timer dis
    tmrD2M.Enabled = False
    'timer int
    tmrD2N.Enabled = True
    
End Sub

Private Sub tmrD2N_Timer()

    'show lbl and lne
    lneD2N.Visible = True
    lblD2N.Visible = True
    'define D2Var
    D2Var = frmAnimation.Height + 1000
    'timer dis
    tmrD2N.Enabled = False
    'timer int
    tmrD2O.Enabled = True
    
End Sub

Private Sub tmrD2O_Timer()

    If imgD2.Top <= D2Var Then
        
        'go down
        lneD2N.Y1 = lneD2N.Y1 + 25
        lneD2N.Y2 = lneD2N.Y2 + 25
        lblD2N.Top = lblD2N.Top + 25
        imgD2.Top = imgD2.Top + 25

        Else
            'load standing sprite
            imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
            'turn off current timer
            tmrD2O.Enabled = False
            'hide line and label
            lneD2N.Visible = False
            lblD2N.Visible = False
            'start next timer
            tmrD2PEnd.Enabled = True
            
    End If
    
End Sub

Private Sub tmrD2PEnd_Timer()

    'show lbl
    lblTheEnd.Visible = True
    'dis timer
    tmrD2PEnd.Enabled = False
    'int timer
    tmrD2QEnd2.Enabled = True
    
    
End Sub

Private Sub tmrD2QEnd2_Timer()

    'hide lbl
    lblTheEnd.Visible = False
    'dis timer
    tmrD2PEnd.Enabled = False
    'int timer
    tmrD2RReset.Enabled = True
    
End Sub

Private Sub tmrD2RReset_Timer()

    'Reset whole Animation
    
    D1OH = 7680     'Orignal Height of D1
    D2OH = 8520     'Orignal Height of D2
    
    'reset images
    imgD1.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
    imgD1.Left = 840
    imgD1.Top = D1OH
    imgD1.Visible = False
    
    imgD2.Picture = LoadPicture(App.Path & "\Animation Project Sprites (  )\Animation SW Droid\" & "SW Droid D RStandIdle1.gif")
    imgD2.Left = -2000
    imgD2.Top = D2OH
    imgD2.Visible = False
    
    'reset timers
    tmrD1A.Enabled = False
    tmrD1B.Enabled = False
    tmrD1C.Enabled = False
    tmrD1D.Enabled = False
    tmrD1E.Enabled = False
    tmrD1F.Enabled = False
    tmrD1G.Enabled = False
    tmrD1H.Enabled = False
    tmrD1I.Enabled = False
    tmrD1J.Enabled = False
    tmrD1K.Enabled = False
    tmrD1L.Enabled = False
    tmrD1M.Enabled = False
    tmrD1N.Enabled = False
    tmrD1O.Enabled = False
    
    
    tmrD2A.Enabled = False
    tmrD2B.Enabled = False
    tmrD2C.Enabled = False
    tmrD2D.Enabled = False
    tmrD2E.Enabled = False
    tmrD2D.Enabled = False
    tmrD2F.Enabled = False
    tmrD2G.Enabled = False
    tmrD2H.Enabled = False
    tmrD2I.Enabled = False
    tmrD2Jdot1.Enabled = False
    tmrD2Jdot2.Enabled = False
    tmrD2Jdot3.Enabled = False
    tmrD2Jdot4.Enabled = False
    tmrD2Jdot5.Enabled = False
    tmrD2K.Enabled = False
    tmrD2L.Enabled = False
    tmrD2M.Enabled = False
    tmrD2N.Enabled = False
    tmrD2O.Enabled = False
    tmrD2PEnd.Enabled = False
    tmrD2QEnd2.Enabled = False
    tmrD2RReset.Enabled = False
    
    
    'reset lines and labels
    lneD1B.Visible = False
    lneD1G.Visible = False
    lneD1J.Visible = False
    lneD1K.Visible = False
    lneD2A.Visible = False
    lneD2H.Visible = False
    'lneD2J.Visible = False
    lneD2L.Visible = False
    lneD2N.Visible = False
    
    lblD1B.Visible = False
    lblD1G.Visible = False
    lblD1J.Visible = False
    lneD1K.Visible = False
    lblD2A.Visible = False
    lblD2H.Visible = False
    lblD2J.Visible = False
    lblD2L.Visible = False
    lblD2N.Visible = False
    
    lblTheEnd.Visible = False
    
    
    lneD2N.Y1 = 9240
    lneD2N.Y2 = 8640
    lblD2N.Left = 9000
    lblD2N.Top = 8280
    
    
    'reset label captions
    lblD1B.Caption = "  ?..?..?..?..?   My sensors are indicating something..."
    lblD1G.Caption = "--!!!!!??!??!!!!!--"
    lblD1J.Caption = "--I'm sorry.  ----Am I suppose to understand that?  I don't speak alienese.----"
    ''''lblD1K.Caption = Can't Reset
    lblD2A.Caption = "Geronimo!!!!"
    lblD2H.Caption = "I am whats left of the Special Droids.  Soon you will be destroyed too.  :)"
    lblD2L.Caption = "I don't see anything..."
    lblD2N.Caption = "...I'll be back..."
    
    'reset cmd buttons
    cmdPlay.Visible = True
    cmdReset.Visible = False
    
    'dis timer
    tmrD2RReset.Enabled = False
    
End Sub
