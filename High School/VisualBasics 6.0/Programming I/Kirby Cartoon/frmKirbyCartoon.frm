VERSION 5.00
Begin VB.Form frmKirbyCartoon 
   Caption         =   "Kirby Cartoon"
   ClientHeight    =   4005
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8460
   LinkTopic       =   "Form1"
   ScaleHeight     =   4005
   ScaleWidth      =   8460
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmr3 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   1440
      Tag             =   "C2"
      Top             =   720
   End
   Begin VB.Timer tmr2 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   840
      Tag             =   "WR1"
      Top             =   720
   End
   Begin VB.Timer tmr1 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   240
      Top             =   720
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lbl3 
      Caption         =   "Wait...I hear something approaching!!!  I'm outta here!"
      Height          =   615
      Left            =   5520
      TabIndex        =   2
      Top             =   2040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Line lne3 
      Visible         =   0   'False
      X1              =   5760
      X2              =   6240
      Y1              =   3240
      Y2              =   2640
   End
   Begin VB.Label lbl1 
      Caption         =   "Hello, My name is Biff!"
      Height          =   375
      Left            =   1800
      TabIndex        =   1
      Top             =   2400
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Line lne1 
      Visible         =   0   'False
      X1              =   1080
      X2              =   1680
      Y1              =   3360
      Y2              =   2760
   End
   Begin VB.Line lneGround 
      X1              =   240
      X2              =   8400
      Y1              =   3720
      Y2              =   3720
   End
   Begin VB.Image imgKirby 
      Height          =   855
      Left            =   480
      Picture         =   "frmKirbyCartoon.frx":0000
      Stretch         =   -1  'True
      Top             =   2925
      Width           =   615
   End
End
Attribute VB_Name = "frmKirbyCartoon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim KCount As Integer

Private Sub cmdGo_Click()

    lne1.Visible = True
    lbl1.Visible = True
    tmr1.Enabled = True
    
End Sub

Private Sub tmr1_Timer()

    'make comment disappear
    lne1.Visible = False
    lbl1.Visible = False
    
    'turn off current timer
    tmr1.Enabled = False
    
    'turn on next timer
    tmr2.Enabled = True


End Sub

Private Sub tmr2_Timer()

    'increase kirby count
    KCount = KCount + 1
    
    'change kirby position
    imgKirby.Left = imgKirby.Left + 200
    
    
    'change kirby
    If KCount Mod 7 = 1 Then
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyWalkR1.jpg")
    End If
    
    'change kirby
    If KCount Mod 7 = 2 Then
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyWalkR2.jpg")
    End If
    
    'change kirby
    If KCount Mod 7 = 3 Then
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyWalkR3.jpg")
    End If
    
    'change kirby
    If KCount Mod 7 = 4 Then
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyWalkR4.jpg")
    End If

    'change kirby
    If KCount Mod 7 = 5 Then
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyWalkR5.jpg")
    End If
    
    'change kirby
    If KCount Mod 7 = 6 Then
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyWalkR6.jpg")
    End If
    
    'change kirby
    If KCount Mod 7 = 0 Then
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyWalkR7.jpg")
    End If
    
    'stop at 5000
    If imgKirby.Left >= 5000 Then
        
        tmr2.Enabled = False
        
        'reset image to Standing
        imgKirby.Picture = LoadPicture(App.Path & "/KirbyStanding.jpg")
        
        'show next comment
        lne3.Visible = True
        lbl3.Visible = True
        
        'start next timer
        tmr3.Enabled = True
        
    End If
    
    
End Sub


Private Sub tmr3_Timer()

    'make comment disappear
    lne3.Visible = False
    lbl3.Visible = False
    
    'turn off current timer
    tmr3.Enabled = False
    
    'turn on next timer
    

End Sub





