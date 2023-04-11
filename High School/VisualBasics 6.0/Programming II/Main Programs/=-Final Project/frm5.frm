VERSION 5.00
Begin VB.Form frm5 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "#5: Colorful Circles"
   ClientHeight    =   10455
   ClientLeft      =   150
   ClientTop       =   480
   ClientWidth     =   18615
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   10455
   ScaleWidth      =   18615
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmrAutomaticAI 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   240
      Top             =   240
   End
   Begin VB.Label lbl1 
      BackStyle       =   0  'Transparent
      Caption         =   "Click here to start."
      Height          =   855
      Left            =   2160
      TabIndex        =   0
      Top             =   1200
      Width           =   1575
   End
   Begin VB.Line lne1 
      BorderWidth     =   2
      X1              =   1560
      X2              =   2760
      Y1              =   0
      Y2              =   1200
   End
   Begin VB.Menu mnuBack 
      Caption         =   "Go Back"
   End
   Begin VB.Menu mnuCircles 
      Caption         =   "- Place Circles -"
   End
   Begin VB.Menu mnuSelectColor 
      Caption         =   "-= Select Colors =-"
      Begin VB.Menu mnuCo1 
         Caption         =   "Red"
      End
      Begin VB.Menu mnuCo2 
         Caption         =   "Green"
      End
      Begin VB.Menu mnuCo3 
         Caption         =   "Blue"
      End
      Begin VB.Menu mnuCo4 
         Caption         =   "Yellow"
      End
      Begin VB.Menu mnuCoRandom 
         Caption         =   "Random"
      End
   End
   Begin VB.Menu mnuCls 
      Caption         =   "- Clear -"
   End
End
Attribute VB_Name = "frm5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim nC As Integer
Dim x As Integer
Dim y As Integer
Dim r As Integer

Dim cColor As Integer
Dim cRed As Integer
Dim cGreen As Integer
Dim cBlue As Integer


Private Sub Form_Load()

    'default
    cColor = 1
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Private Sub mnuBack_Click()

    frm5.Hide
    frm4Programs.Show
    
    Cls
    
End Sub

Private Sub mnuCircles_Click()

Randomize

If lne1.Visible = True Then lne1.Visible = False
If lbl1.Visible = True Then lbl1.Visible = False

Cls
    
    'Call SelectCircleColor
    Call PlaceCircle
    
End Sub

Private Sub SelectCircleColor()

    Select Case cColor
        Case 1: 'red
            cRed = 255
            cGreen = 0
            cBlue = 0
            
        Case 2: 'green
            cRed = 0
            cGreen = 255
            cBlue = 0
            
        Case 3: 'blue
            cRed = 0
            cGreen = 0
            cBlue = 255
            
        Case 4: 'yellow
            cRed = 255
            cGreen = 255
            cBlue = 0
            
        Case -1: 'random
            cRed = CInt((Rnd * 255) + 1)
            cGreen = CInt((Rnd * 255) + 1)
            cBlue = CInt((Rnd * 255) + 1)
            
    End Select
    
End Sub

Private Sub PlaceCircle()

Randomize

    For nC = 1 To 1000 Step 1
        'coordinates x,y,r get randomized
        x = CInt(Rnd * frm5.Width)
        y = CInt(Rnd * frm5.Height)
        r = CInt((Rnd * (300)))
        
        Call SelectCircleColor
        
        Circle (x, y), r, RGB(cRed, cGreen, cBlue)
        
    Next nC
End Sub

Private Sub mnuCls_Click()
    Cls
    
End Sub

Private Sub mnuCo1_Click()
    cColor = 1
    
End Sub

Private Sub mnuCo2_Click()
    cColor = 2
    
End Sub

Private Sub mnuCo3_Click()
    cColor = 3
    
End Sub

Private Sub mnuCo4_Click()
    cColor = 4
    
End Sub

Private Sub mnuCoRandom_Click()
    cColor = -1
    
End Sub

Private Sub tmrAutomaticAI_Timer()
    mnuCircles_Click
    
End Sub
