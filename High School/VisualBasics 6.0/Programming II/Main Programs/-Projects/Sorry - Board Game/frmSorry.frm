VERSION 5.00
Begin VB.Form frmSorry 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Sorry - Custom Mode"
   ClientHeight    =   10455
   ClientLeft      =   150
   ClientTop       =   780
   ClientWidth     =   15810
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10455
   ScaleWidth      =   15810
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton P4 
      BackColor       =   &H0000FF00&
      Height          =   255
      Index           =   3
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   8280
      Width           =   255
   End
   Begin VB.CommandButton P3 
      BackColor       =   &H0080FFFF&
      Height          =   255
      Index           =   3
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   8280
      Width           =   255
   End
   Begin VB.CommandButton P2 
      BackColor       =   &H00FF0000&
      Height          =   255
      Index           =   3
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   8280
      Width           =   255
   End
   Begin VB.CommandButton P4 
      BackColor       =   &H0000FF00&
      Height          =   255
      Index           =   2
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   7920
      Width           =   255
   End
   Begin VB.CommandButton P3 
      BackColor       =   &H0080FFFF&
      Height          =   255
      Index           =   2
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   7920
      Width           =   255
   End
   Begin VB.CommandButton P2 
      BackColor       =   &H00FF0000&
      Height          =   255
      Index           =   2
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   7920
      Width           =   255
   End
   Begin VB.CommandButton P4 
      BackColor       =   &H0000FF00&
      Height          =   255
      Index           =   1
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   7560
      Width           =   255
   End
   Begin VB.CommandButton P3 
      BackColor       =   &H0080FFFF&
      Height          =   255
      Index           =   1
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   7560
      Width           =   255
   End
   Begin VB.CommandButton P2 
      BackColor       =   &H00FF0000&
      Height          =   255
      Index           =   1
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   7560
      Width           =   255
   End
   Begin VB.CommandButton P1 
      BackColor       =   &H000000FF&
      Height          =   255
      Index           =   3
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   8280
      Width           =   255
   End
   Begin VB.CommandButton P1 
      BackColor       =   &H000000FF&
      Height          =   255
      Index           =   2
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   7920
      Width           =   255
   End
   Begin VB.CommandButton P1 
      BackColor       =   &H000000FF&
      Height          =   255
      Index           =   1
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   7560
      Width           =   255
   End
   Begin VB.CommandButton P4 
      BackColor       =   &H0000FF00&
      Height          =   255
      Index           =   0
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   7200
      Width           =   255
   End
   Begin VB.CommandButton P3 
      BackColor       =   &H0080FFFF&
      Height          =   255
      Index           =   0
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   7200
      Width           =   255
   End
   Begin VB.CommandButton P2 
      BackColor       =   &H00FF0000&
      Height          =   255
      Index           =   0
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   7200
      Width           =   255
   End
   Begin VB.CommandButton P1 
      BackColor       =   &H000000FF&
      Height          =   255
      Index           =   0
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   7200
      Width           =   255
   End
   Begin VB.Timer tmrAuto 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   120
      Top             =   3720
   End
   Begin VB.Timer tmrSelect 
      Enabled         =   0   'False
      Interval        =   400
      Left            =   240
      Top             =   9360
   End
   Begin VB.Timer tmrAI4 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2040
      Top             =   120
   End
   Begin VB.Timer tmrAI3 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   1440
      Top             =   120
   End
   Begin VB.Timer tmrAI2 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   840
      Top             =   120
   End
   Begin VB.Timer tmrAI1 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   240
      Top             =   120
   End
   Begin VB.Timer tmrMove 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   4440
      Top             =   5160
   End
   Begin VB.CommandButton cmdMove 
      Caption         =   "Move"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3600
      TabIndex        =   0
      Top             =   5160
      Width           =   735
   End
   Begin VB.Timer tmrDice 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2400
      Top             =   2880
   End
   Begin VB.Shape Mouse 
      BackColor       =   &H0080FFFF&
      BackStyle       =   1  'Opaque
      Height          =   135
      Left            =   7920
      Top             =   6840
      Width           =   135
   End
   Begin VB.Image imgDice 
      Height          =   2175
      Left            =   2880
      Picture         =   "frmSorry.frx":0000
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   2175
   End
   Begin VB.Image imgP4StartCell 
      Height          =   375
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   375
   End
   Begin VB.Image imgP4SafeCell 
      Height          =   375
      Index           =   5
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image imgP4SafeCell 
      Height          =   375
      Index           =   4
      Left            =   2880
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image imgP4SafeCell 
      Height          =   375
      Index           =   3
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image imgP4SafeCell 
      Height          =   375
      Index           =   2
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image imgP4SafeCell 
      Height          =   375
      Index           =   1
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image imgP4SafeCell 
      Height          =   375
      Index           =   0
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image imgP3StartCell 
      Height          =   375
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   6120
      Width           =   375
   End
   Begin VB.Image imgP3SafeCell 
      Height          =   375
      Index           =   5
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgP3SafeCell 
      Height          =   375
      Index           =   4
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   375
   End
   Begin VB.Image imgP3SafeCell 
      Height          =   375
      Index           =   3
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   375
   End
   Begin VB.Image imgP3SafeCell 
      Height          =   375
      Index           =   2
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   5400
      Width           =   375
   End
   Begin VB.Image imgP3SafeCell 
      Height          =   375
      Index           =   1
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image imgP3SafeCell 
      Height          =   375
      Index           =   0
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   6120
      Width           =   375
   End
   Begin VB.Image imgP2SafeCell 
      Height          =   375
      Index           =   5
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgP2SafeCell 
      Height          =   375
      Index           =   4
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgP2SafeCell 
      Height          =   375
      Index           =   3
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgP2SafeCell 
      Height          =   375
      Index           =   2
      Left            =   5400
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgP2SafeCell 
      Height          =   375
      Index           =   1
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgP2SafeCell 
      Height          =   375
      Index           =   0
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgP2StartCell 
      Height          =   375
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgP1StartCell 
      Height          =   375
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgP1SafeCell 
      Height          =   375
      Index           =   5
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgP1SafeCell 
      Height          =   375
      Index           =   4
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgP1SafeCell 
      Height          =   375
      Index           =   3
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgP1SafeCell 
      Height          =   375
      Index           =   2
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgP1SafeCell 
      Height          =   375
      Index           =   1
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgP1SafeCell 
      Height          =   375
      Index           =   0
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   59
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   58
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   57
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   56
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   55
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   54
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   53
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   52
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   51
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   50
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   49
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   48
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   5400
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   47
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   46
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   6120
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   45
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   44
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   43
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   42
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   41
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   40
      Left            =   2880
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   39
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   38
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   37
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   36
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   35
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   34
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   33
      Left            =   5400
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   32
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   31
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   30
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   29
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   6120
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   28
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   27
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   5400
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   26
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   25
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   24
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   23
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   22
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   21
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   20
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   19
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   18
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   17
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   16
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   15
      Left            =   6480
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   14
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   13
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   12
      Left            =   5400
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   11
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   10
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   9
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   8
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   7
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   6
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   5
      Left            =   2880
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   4
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   3
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   2
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   1
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image Cell 
      Height          =   375
      Index           =   0
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgBG 
      Height          =   5805
      Left            =   1080
      Picture         =   "frmSorry.frx":0BF2
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   5805
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuEnd 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "Options"
   End
End
Attribute VB_Name = "frmSorry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim GameOn                  As Boolean
Dim Turn                    As Integer

Dim Dice                    As Integer
Dim DiceString(0 To 9)      As String
Dim DiceRolling             As Boolean

Dim NumOfCells              As Integer

'Const
Const P1StartingPosition = 4
Const P2StartingPosition = 19
Const P3StartingPosition = 34
Const P4StartingPosition = 49

'(Turn, Player) = Spaces
Dim P1Pos(1 To 4)           As Integer
Dim P2Pos(1 To 4)           As Integer
Dim P3Pos(1 To 4)           As Integer
Dim P4Pos(1 To 4)           As Integer

Dim pSelected               As Integer

Dim Mov As Integer

Dim z, a, b, c, d, e, f, g, h, i        As Integer

Dim n As Integer

Private Sub cmdMove_Click()

If GameOn = True Then
    tmrMove.Enabled = True
    cmdMove.Enabled = False
End If

End Sub

Private Sub Form_Load()

    'reset cells
    For n = 0 To 59
        If Cell(n).Tag = "" Then
            Cell(n).Tag = "EMPTY"
        End If
    Next n
    
    'Define End and Starting Cells
    Cell(2).Tag = "E1"
    Cell(17).Tag = "E2"
    Cell(32).Tag = "E3"
    Cell(47).Tag = "E4"
    
    Cell(4).Tag = "S1"
    Cell(19).Tag = "S2"
    Cell(34).Tag = "S3"
    Cell(49).Tag = "S4"
    
    NumOfCells = 60 - 1
    pSelected = 1
    
        For t = 1 To 4
        P1Pos(t) = P1StartingPosition
        P2Pos(t) = P2StartingPosition
        P3Pos(t) = P3StartingPosition
        P4Pos(t) = P4StartingPosition
        Next t
    
    GameOn = True
    Turn = 1
    
        DiceString(0) = "Dice0.jpg"
        DiceString(1) = "Dice1.jpg"
        DiceString(2) = "Dice2.jpg"
        DiceString(3) = "Dice3.jpg"
        DiceString(4) = "Dice4.jpg"
        DiceString(5) = "Dice5.jpg"
        DiceString(6) = "Dice6.jpg"
        DiceString(7) = "Dice7.jpg"
        DiceString(8) = "Dice8.jpg"
        DiceString(9) = "Dice9.jpg"
        
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub

Private Sub imgDice_Click()

If GameOn = True And tmrDice.Enabled = False And cmdMove.Enabled = False And DiceRolling = False Then
    DiceRolling = True
    tmrDice.Enabled = True
    GoTo b:
End If

If GameOn = True And tmrDice.Enabled = True And cmdMove.Enabled = False And DiceRolling = True Then
    DiceRolling = False
    tmrDice.Enabled = False
    cmdMove.Enabled = True
    GoTo b:
End If

b:
End Sub

Private Sub mnuEnd_Click()

    End

End Sub

Private Sub mnuOptions_Click()

    Options.Show
    
End Sub

Private Sub P1_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Turn = 1 Then pSelected = Index + 1
    
End Sub

Private Sub P2_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Turn = 2 Then pSelected = Index + 1
    
End Sub

Private Sub P3_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Turn = 3 Then pSelected = Index + 1
    
End Sub

Private Sub P4_KeyUp(Index As Integer, KeyCode As Integer, Shift As Integer)

    If Turn = 4 Then pSelected = Index + 1
    
End Sub

Private Sub tmrAI1_Timer()

    If imgDice.Left + imgDice.Width / 2 < Mouse.Left Then
        Mouse.Left = Mouse.Left - 100
    End If
    If imgDice.Left + imgDice.Width / 2 > Mouse.Left Then
        Mouse.Left = Mouse.Left + 100
    End If
    If imgDice.Top + imgDice.Height / 2 < Mouse.Top Then
        Mouse.Top = Mouse.Top - 100
    End If
    If imgDice.Top + imgDice.Height / 2 > Mouse.Top Then
        Mouse.Top = Mouse.Top + 100
    End If
    
End Sub

Private Sub tmrAuto_Timer()

    imgDice_Click
    If cmdMove.Enabled = True Then cmdMove_Click
    
End Sub

Private Sub tmrDice_Timer()

Randomize
    
    Dice = Int(1 + (Rnd * 6))
        n = Dice
        imgDice.Picture = LoadPicture(App.Path & "\Images\" & DiceString(n))
    
End Sub

Private Sub tmrMove_Timer()
    
    Call Check
If GameOn = True Then
    If Turn = 1 Then
        
        P1Pos(pSelected) = P1Pos(pSelected) + 1
        b = P1Pos(pSelected)
        
        If b >= NumOfCells Then b = 0
        
        z = z + 1
        
        P1(pSelected - 1).Left = Cell(b).Left + (Cell(b).Width / 2) - (P1(pSelected - 1).Width / 2)
        P1(pSelected - 1).Top = Cell(b).Top + (Cell(b).Height / 2) - (P1(pSelected - 1).Height / 2)
        
    End If
    
    If z >= Dice Then
        z = 0
        tmrMove.Enabled = False
            n = 0
            imgDice.Picture = LoadPicture(App.Path & "\Images\" & DiceString(n))
    End If
    
    cmdMove.Enabled = False

End If
    
End Sub

Private Sub Check()

    Print "Turn: "; Turn, "Di: "; Dice, "Game: "; GameOn
End Sub

