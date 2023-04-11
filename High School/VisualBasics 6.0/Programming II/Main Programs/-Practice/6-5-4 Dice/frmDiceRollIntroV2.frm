VERSION 5.00
Begin VB.Form frmDiceRollIntroV2 
   Caption         =   "Form1"
   ClientHeight    =   7320
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   15015
   LinkTopic       =   "Form1"
   ScaleHeight     =   7320
   ScaleWidth      =   15015
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   5
      Left            =   9840
      TabIndex        =   5
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   4
      Left            =   8400
      TabIndex        =   4
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   3
      Left            =   6960
      TabIndex        =   3
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   2
      Left            =   5520
      TabIndex        =   2
      Top             =   4080
      Width           =   855
   End
   Begin VB.CheckBox chkHold 
      Caption         =   "Hold?"
      Height          =   375
      Index           =   1
      Left            =   4080
      TabIndex        =   1
      Top             =   4080
      Width           =   855
   End
   Begin VB.Timer tmrD2 
      Enabled         =   0   'False
      Interval        =   750
      Left            =   7560
      Top             =   4560
   End
   Begin VB.Timer tmrD1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   6840
      Top             =   4560
   End
   Begin VB.CommandButton cmdRoll 
      Caption         =   "Roll"
      Height          =   375
      Left            =   6960
      TabIndex        =   0
      Top             =   2040
      Width           =   855
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   3
      Left            =   6720
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   4
      Left            =   8160
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   5
      Left            =   9600
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   2
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Index           =   1
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Menu mnuNewGame 
      Caption         =   "New Game"
   End
End
Attribute VB_Name = "frmDiceRollIntroV2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim D(1 To 5) As Integer
Dim Hold(1 To 5) As Integer

Private Sub cmdRoll_Click()

    Cls
    
    TurnCount = TurnCount + 1
    
    
    If TurnCount <= 3 Then
    Randomize
    For r = 1 To 5
        'randomly select 1 to 6
        If chkHold(r).Value = 0 Then
        D(r) = Int(Rnd * 6) + 1
        'Load Matching Image
        imgD(r).Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D(r) & ".jpg")
        End If
    Next r
    
    FontSize = 24
    
    tmrD1.Enabled = True
    tmrD2.Enabled = True
    
    End If
    
End Sub

Private Sub mnuNewGame_Click()

    TurnCount = 0
    
    For n = 1 To 5
        imgD(n).Picture = LoadPicture("")
        chkHold(n).Value = 0
    Next n
    
End Sub

Private Sub tmrD1_Timer()
    'I got bored.
    'So all below is Extra Stuff I added.

    Cls
    
    TurnCount = TurnCount + 1
    
    
    If TurnCount <= 3 Then
    Randomize
    For r = 1 To 5
        'randomly select 1 to 6
        If chkHold(r).Value = 0 Then
        D(r) = Int(Rnd * 6) + 1
        'Load Matching Image
        imgD(r).Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D(r) & ".jpg")
        End If
    Next r
    
    FontSize = 24
    
    tmrD1.Enabled = True
    tmrD2.Enabled = True
    
    End If
    
End Sub

Private Sub tmrD2_Timer()

    tmrD1.Enabled = False
    tmrD2.Enabled = False
    
End Sub

