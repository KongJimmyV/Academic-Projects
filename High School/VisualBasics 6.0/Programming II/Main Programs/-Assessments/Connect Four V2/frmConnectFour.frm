VERSION 5.00
Begin VB.Form frmConnect4 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Connect Four"
   ClientHeight    =   11175
   ClientLeft      =   150
   ClientTop       =   780
   ClientWidth     =   23700
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   11175
   ScaleWidth      =   23700
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtMovesList 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   9495
      Left            =   20400
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   57
      Top             =   720
      Width           =   2775
   End
   Begin VB.Timer tmrAI2Think 
      Enabled         =   0   'False
      Interval        =   525
      Left            =   13320
      Top             =   4680
   End
   Begin VB.Timer tmrAI1Think 
      Enabled         =   0   'False
      Interval        =   525
      Left            =   13320
      Top             =   4080
   End
   Begin VB.TextBox txtAILogs 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   9495
      Left            =   17520
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   55
      Top             =   720
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.Timer tmrTurnCheck 
      Interval        =   1
      Left            =   14280
      Top             =   4080
   End
   Begin VB.Frame fraOptions 
      BackColor       =   &H00004000&
      Caption         =   "Options"
      ForeColor       =   &H00FFFFFF&
      Height          =   3255
      Left            =   13320
      TabIndex        =   45
      Top             =   360
      Width           =   3015
      Begin VB.OptionButton optAI20 
         BackColor       =   &H00004000&
         Caption         =   "None"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   50
         Top             =   480
         Width           =   2775
      End
      Begin VB.OptionButton optAI22 
         BackColor       =   &H00004000&
         Caption         =   "Normal"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   49
         Top             =   1200
         Width           =   2775
      End
      Begin VB.OptionButton optAI23 
         BackColor       =   &H00004000&
         Caption         =   "Hard"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   -1  'True
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   48
         Top             =   1560
         Width           =   2775
      End
      Begin VB.OptionButton optAI21 
         BackColor       =   &H00004000&
         Caption         =   "Easy"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   46
         Top             =   840
         Width           =   2775
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "AI2 Difficulty"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   47
         Top             =   240
         Width           =   2775
      End
   End
   Begin VB.Timer tmrDice2 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   15720
      Top             =   4080
   End
   Begin VB.Timer tmrDice1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   15240
      Top             =   4080
   End
   Begin VB.CommandButton cmdDice 
      Caption         =   "Roll Dice"
      Height          =   495
      Left            =   15240
      TabIndex        =   43
      Top             =   4680
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   41
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   40
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   39
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   38
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   37
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   37
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   36
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   35
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   34
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   33
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   32
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   31
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   30
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   29
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   28
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   27
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   26
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   25
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   24
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   23
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   22
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   21
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   20
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   19
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   18
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   17
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   16
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   15
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   14
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   5880
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   13
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   12
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   11
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   10
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   9
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   8
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   7
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   7320
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   6
      Left            =   11640
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   5
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   4
      Left            =   8760
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   3
      Left            =   7320
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   2
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   1
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   8760
      Width           =   975
   End
   Begin VB.CommandButton cmd 
      Height          =   975
      Index           =   0
      Left            =   3000
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   8760
      Width           =   975
   End
   Begin VB.Label lblGameOn 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "~Game Is *ON*"
      BeginProperty Font 
         Name            =   "Segoe Print"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   615
      Left            =   13320
      TabIndex        =   59
      Top             =   7320
      Width           =   3975
   End
   Begin VB.Label lblMovesList 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Moves List"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   20400
      TabIndex        =   58
      Top             =   360
      Width           =   2775
   End
   Begin VB.Line lneR 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   6
      X1              =   2760
      X2              =   12840
      Y1              =   9960
      Y2              =   9960
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   7
      X1              =   12840
      X2              =   12840
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   0
      X1              =   2760
      X2              =   2760
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Label lblAILogs 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "AI Debug Logs"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   17520
      TabIndex        =   56
      Top             =   360
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.Line lneR 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   0
      X1              =   2760
      X2              =   12840
      Y1              =   1320
      Y2              =   1320
   End
   Begin VB.Line lneR 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   5
      X1              =   2760
      X2              =   12840
      Y1              =   8520
      Y2              =   8520
   End
   Begin VB.Line lneR 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   4
      X1              =   2760
      X2              =   12840
      Y1              =   7080
      Y2              =   7080
   End
   Begin VB.Line lneR 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   3
      X1              =   2760
      X2              =   12840
      Y1              =   5640
      Y2              =   5640
   End
   Begin VB.Line lneR 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   2
      X1              =   2760
      X2              =   12840
      Y1              =   4200
      Y2              =   4200
   End
   Begin VB.Line lneR 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   1
      X1              =   2760
      X2              =   12840
      Y1              =   2760
      Y2              =   2760
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   6
      X1              =   11400
      X2              =   11400
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   5
      X1              =   9960
      X2              =   9960
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   4
      X1              =   8520
      X2              =   8520
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   3
      X1              =   7080
      X2              =   7080
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   2
      X1              =   5640
      X2              =   5640
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Line lneC 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   25
      Index           =   1
      X1              =   4200
      X2              =   4200
      Y1              =   1320
      Y2              =   9960
   End
   Begin VB.Label lblDraws 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Draws: 0"
      Height          =   255
      Left            =   13320
      TabIndex        =   54
      Top             =   6480
      Width           =   3975
   End
   Begin VB.Label lblBlackWins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Black Wins: 0"
      Height          =   255
      Left            =   13320
      TabIndex        =   53
      Top             =   6240
      Width           =   3975
   End
   Begin VB.Label lblRedWins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Red Wins: 0"
      Height          =   255
      Left            =   13320
      TabIndex        =   52
      Top             =   6000
      Width           =   3975
   End
   Begin VB.Label lblStats 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Stats"
      BeginProperty Font 
         Name            =   "Script MT Bold"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   13320
      TabIndex        =   51
      Top             =   5400
      Width           =   3975
   End
   Begin VB.Label lblTurn 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "-Red's Turn"
      BeginProperty Font 
         Name            =   "Segoe Print"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00004080&
      Height          =   615
      Left            =   13320
      TabIndex        =   44
      Top             =   6720
      Width           =   3975
   End
   Begin VB.Label lblDice 
      BackStyle       =   0  'Transparent
      Caption         =   "Dice: ?"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   14280
      TabIndex        =   42
      Top             =   4800
      Width           =   975
   End
   Begin VB.Shape shpP1 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   2
      Left            =   14760
      Shape           =   3  'Circle
      Top             =   8640
      Width           =   1215
   End
   Begin VB.Shape shpP1 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   1
      Left            =   14760
      Shape           =   3  'Circle
      Top             =   8760
      Width           =   1215
   End
   Begin VB.Shape shpP2 
      BackColor       =   &H00404040&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   2
      Left            =   13320
      Shape           =   3  'Circle
      Top             =   8640
      Width           =   1215
   End
   Begin VB.Shape shpP2 
      BackColor       =   &H00404040&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   1
      Left            =   13320
      Shape           =   3  'Circle
      Top             =   8760
      Width           =   1215
   End
   Begin VB.Shape shpP1 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   0
      Left            =   14760
      Shape           =   3  'Circle
      Top             =   8880
      Width           =   1215
   End
   Begin VB.Shape shpP2 
      BackColor       =   &H00404040&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderWidth     =   5
      FillColor       =   &H00FFFFFF&
      Height          =   1215
      Index           =   0
      Left            =   13320
      Shape           =   3  'Circle
      Top             =   8880
      Width           =   1215
   End
   Begin VB.Menu mnuNewGame 
      Caption         =   "New Game"
   End
   Begin VB.Menu mnuGrid 
      Caption         =   "Show Grid"
   End
   Begin VB.Menu mnuAISettings 
      Caption         =   "AI Settings"
      Begin VB.Menu mnuAI1Difficulty 
         Caption         =   "AI1 Difficulty"
         Begin VB.Menu mnuAI1None 
            Caption         =   "None"
         End
         Begin VB.Menu mnuAI1Easy 
            Caption         =   "Easy"
         End
         Begin VB.Menu mnuAI1Normal 
            Caption         =   "Normal"
         End
         Begin VB.Menu mnuAI1Hard 
            Caption         =   "Hard"
            Enabled         =   0   'False
         End
      End
      Begin VB.Menu mnuAI2Difficulty 
         Caption         =   "AI2 Difficulty"
         Begin VB.Menu mnuAI2None 
            Caption         =   "None"
         End
         Begin VB.Menu mnuAI2Easy 
            Caption         =   "Easy"
         End
         Begin VB.Menu mnuAI2Normal 
            Caption         =   "Normal"
         End
         Begin VB.Menu mnuAI2Hard 
            Caption         =   "Hard"
            Enabled         =   0   'False
         End
      End
   End
End
Attribute VB_Name = "frmConnect4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Index As Integer
Dim IndexCarry As Integer
Dim i As Integer
Dim ShapeNum1 As Integer
Dim ShapeNum2 As Integer
Dim GameCount As Integer
Dim TurnCount As Integer
Dim Winner As Boolean
Dim GameOn As Boolean

Dim Row As Integer
Dim Row2 As Integer
Dim Col As Integer
Dim Col2 As Integer
Dim P1Wins As Integer
Dim P2Wins As Integer
Dim Draws As Integer
Dim Grid(-3 To 8, -3 To 9) As Integer
Dim PlayerTurn As Integer

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Dim MovesList(1 To 42) As Integer, MovesNum As Integer, SaveMovesNum As Integer  ' stores moves as column numbers
'''''''''''''''''''''''''''''''''''''''''''''''''
''AI Vars  (I Got really bored so I made this...)''
''''''''''''''''''''''''''''''''''''''''''''''''''
Dim HumanTurn As Boolean
Dim AIRandom As Integer

Dim AI1Difficulty As Integer  '0=none,1=easy,2=normal,3=hard
Dim AI1Turn As Boolean

Dim AI2Difficulty As Integer  '0=none,1=easy,2=normal,3=hard
Dim AI2Turn As Boolean

Dim AI2JustPickAlready As Integer
Dim AI2JustPickAlreadyA As Integer
Dim AI2JustPickAlreadyB As Integer
Dim AI2JustPickAlreadyC As Integer
Dim AI2JustPickAlreadyD As Integer
Dim AI2EvaluatedDontPick(-3 To 8, -3 To 9) As Integer
Dim AI2EvaluatedThreats(-3 To 8, -3 To 9) As Integer
Dim AI2EvaluatedWins(-3 To 8, -3 To 9) As Integer
Dim AI2EvaluatedMoves(-3 To 8, -3 To 9) As Integer

Dim AI2EvaluatedWinsA(-3 To 8, -3 To 9) As Integer
Dim AI2EvaluatedThreatsA(-3 To 8, -3 To 9) As Integer


Private Sub cmd_Click(Index As Integer)

If HumanTurn = True Then
If GameOn = True Then
    TurnCount = TurnCount + 1
    cmd(Index).Enabled = False
    'cmd(Index).Visible = False
    
    IndexCarry = Index
    
    txtMovesList.Text = txtMovesList.Text & TurnCount & ":  " & vbTab & "R " & Row & vbTab & "C " & Col & vbCrLf
    
    Col = Index Mod 7
    Row = 6 - (Index \ 7 + 1)
    
    If Index <= 34 Then
        cmd(Index + 7).Enabled = True
        'cmd(Index + 7).Visible = True
        cmd(Index + 7).BackColor = &H8000000F
    End If
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 And HumanTurn = True Then
        'P1
        cmd(Index).BackColor = vbRed
        Grid(Row, Col) = -1
        'Sets p2's turn
        PlayerTurn = 2
        AI1Turn = False
        AI2Turn = True
    End If
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 And HumanTurn = True Then
        'P2
        cmd(Index).BackColor = vbBlack
        Grid(Row, Col) = 1
        'Sets p1's turn
        PlayerTurn = 1
        AI1Turn = True
        AI2Turn = False
    End If
    
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 And HumanTurn = True Then
        'P1
        cmd(Index).BackColor = vbRed
        Grid(Row, Col) = -1
        'Sets p2's turn
        PlayerTurn = 2
        AI1Turn = False
        AI2Turn = True
    End If
    
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 And HumanTurn = True Then
        'P2
        cmd(Index).BackColor = vbBlack
        Grid(Row, Col) = 1
        'Sets p1's turn
        PlayerTurn = 1
        AI1Turn = True
        AI2Turn = False
    End If
    
    If Index <= 34 Then
        cmd(Index + 7).Enabled = True
        'cmd(Index + 7).Visible = True
        cmd(Index + 7).BackColor = &H8000000F
    End If
    
    'read winnercheck for code ^^^
    Call WinnerCheck
    Call CatsGameCheck
    Call AI1
    Call AI2
End If
End If

End Sub

Private Sub cmdDice_Click()

A:
    If cmdDice.Caption = "Roll Dice" Then
    tmrDice1.Enabled = True
    cmdDice.Caption = "Stop Dice"
    GoTo B:
    End If
    
    If cmdDice.Caption = "Stop Dice" Then
    tmrDice2.Enabled = True
    cmdDice.Enabled = False
    GoTo B:
    End If
B:
    'tmrDice2.Enabled = True
    
End Sub

Private Sub Form_Load()

    GameOn = True
    HumanTurn = True
    AI1Difficulty = 0
    AI2Difficulty = 0
    AI1Turn = False
    AI2Turn = False
    optAI20.Value = True
    mnuAI1None.Checked = True
    mnuAI2None.Checked = True
    GameCount = 1
    
    For i = 0 To 6
        cmd(i).Enabled = True
        cmd(i).BackColor = &H8000000F
        cmd(i).Caption = ""
        cmd(i).Font = "Script MT"
        cmd(i).FontBold = True
        cmd(i).FontSize = "48"
        'cmd(i).Visible = True
    Next i
    For i = 7 To 41
        cmd(i).Enabled = False
        cmd(i).BackColor = &H80000011
        cmd(i).Caption = ""
        cmd(i).Font = "Script MT"
        cmd(i).FontBold = True
        cmd(i).FontSize = "48"
        'cmd(i).Visible = False
    Next i
    
    For Row = -3 To 8
        For Col = -3 To 9
            Grid(Row, Col) = 0
        Next Col
    Next Row
    
End Sub

Private Sub mnuAI1Easy_Click()
    mnuAI1None.Checked = False
    mnuAI1Easy.Checked = True
    mnuAI1Normal.Checked = False
    mnuAI1Hard.Checked = False
    
    AI1Difficulty = 1
End Sub

Private Sub mnuAI1Hard_Click()
    mnuAI1None.Checked = False
    mnuAI1Easy.Checked = False
    mnuAI1Normal.Checked = False
    mnuAI1Hard.Checked = True
    
    AI1Difficulty = 3
End Sub

Private Sub mnuAI1None_Click()
    mnuAI1None.Checked = True
    mnuAI1Easy.Checked = False
    mnuAI1Normal.Checked = False
    mnuAI1Hard.Checked = False
    
    AI1Difficulty = 0
End Sub

Private Sub mnuAI1Normal_Click()
    mnuAI1None.Checked = False
    mnuAI1Easy.Checked = False
    mnuAI1Normal.Checked = True
    mnuAI1Hard.Checked = False
    
    AI1Difficulty = 2
End Sub

Private Sub mnuAI2Easy_Click()
    optAI20.Value = False
    optAI21.Value = True
    optAI22.Value = False
    optAI23.Value = False
    mnuAI2None.Checked = False
    mnuAI2Easy.Checked = True
    mnuAI2Normal.Checked = False
    mnuAI2Hard.Checked = False
    
    AI2Difficulty = 1
End Sub

Private Sub mnuAI2Hard_Click()
    optAI20.Value = False
    optAI21.Value = False
    optAI22.Value = False
    optAI23.Value = True
    mnuAI2None.Checked = False
    mnuAI2Easy.Checked = False
    mnuAI2Normal.Checked = False
    mnuAI2Hard.Checked = True
    
    AI2Difficulty = 3
End Sub

Private Sub mnuAI2None_Click()
    optAI20.Value = True
    optAI21.Value = False
    optAI22.Value = False
    optAI23.Value = False
    mnuAI2None.Checked = True
    mnuAI2Easy.Checked = False
    mnuAI2Normal.Checked = False
    mnuAI2Hard.Checked = False
    
    AI2Difficulty = 0
End Sub

Private Sub mnuAI2Normal_Click()
    optAI20.Value = False
    optAI21.Value = False
    optAI22.Value = True
    optAI23.Value = False
    mnuAI2None.Checked = False
    mnuAI2Easy.Checked = False
    mnuAI2Normal.Checked = True
    mnuAI2Hard.Checked = False
    
    AI2Difficulty = 2
End Sub

Private Sub mnuGrid_Click()

    'Show Grid
    Cls
    For R = 0 To 5
        For C = 0 To 6
            Print Grid(R, C);
        Next C
        Print:
    Next R
    
End Sub

Private Sub mnuNewGame_Click()

    Cls
    
    txtAILogs.Text = ""
    txtMovesList.Text = ""
    
    GameOn = True
    Winner = False
    GameCount = GameCount + 1
    TurnCount = 0
    
    If GameCount = 0 Then PlayerTurn = 1 And AI1Turn = True And AI2Turn = False
    If GameCount = 1 Then PlayerTurn = 2 And AI1Turn = False And AI2Turn = True
    
    'clear cmds
    For C = 0 To 41
        cmd(C).Caption = ""
        cmd(C).Enabled = False
        'cmd(C).Visible = False
        cmd(C).BackColor = &H80000011
    Next C
    
    For B = 0 To 6
        cmd(B).Caption = ""
        cmd(B).Enabled = True
        'cmd(B).Visible = True
        cmd(B).BackColor = &H8000000F
    Next B
    
    'Reset Grid
    For Row = -3 To 8
        For Col = -3 To 9
            Grid(Row, Col) = 0
        Next Col
    Next Row
    
    'Reset AIEvaluated
    For R = -3 To 8
        For C = -3 To 9
            AI2JustPickAlready = 0
            AI2EvaluatedDontPick(R, C) = 0
            AI2EvaluatedThreats(R, C) = 0
            AI2EvaluatedWins(R, C) = 0
            AI2EvaluatedMoves(R, C) = 0
            AI2EvaluatedThreatsA(R, C) = 0
            AI2EvaluatedWinsA(R, C) = 0
        Next C
    Next R
    
    AI2JustPickAlready = 0
    AI2JustPickAlreadyA = 0
    AI2JustPickAlreadyB = 0
    AI2JustPickAlreadyC = 0
    AI2JustPickAlreadyD = 0
    R = 0
    C = 0
    Row = 0
    Col = 0
    Row2 = 0
    Col2 = 0
    i = 0
    Index = 0
    
End Sub

Private Sub WinnerCheck()

    Dim Index2 As Integer
    Dim Index2Start As Integer
    Dim Index2End As Integer
    Dim WinColor As Single
    Dim WinMainColor As Single
    
    'Win Check
    For i = 0 To 41
        Col2 = i Mod 7
        Row2 = 6 - (i \ 7 + 1)
        
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Or GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
            'Red
            WinColor = &H80FF&
            WinMainColor = &H80FF&
        End If
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Or GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
            'Black
            WinColor = &H400000
            WinMainColor = &H400000
        End If
        
        '
        'Check Left
        If Abs(Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row2, Col2 - 2) + Grid(Row2, Col2 - 3)) = 4 Then
            Winner = True
            GameOn = False
            '
            Index2Start = 0
            Index2End = 3
            For Index2B = 0 To 5
            For Index2A = Index2Start To Index2End
            If i <= 41 And i >= 0 + 0 Then cmd(i).BackColor = WinColor
            If i <= 41 And i >= 0 + 1 Then cmd(i - 1).BackColor = WinColor
            If i <= 41 And i >= 0 + 2 Then cmd(i - 2).BackColor = WinColor
            If i <= 41 And i >= 0 + 3 Then cmd(i - 3).BackColor = WinColor
            cmd(IndexCarry).BackColor = WinMainColor
            cmd(IndexCarry).Caption = "X"
            Next Index2A
            Index2Start = Index2Start + 7
            Index2End = Index2End + 7
            Next Index2B
            '
            'Print IndexCarry; Grid(Row2, Col2); Grid(Row2, Col2 - 1); Grid(Row, Col2 - 2); Grid(Row2, Col2 - 3); "  LEFT CHECK"
        End If
        '
        'Check Right
        'Abs(-1 + -1 + 1 + 1) = 4
        If Abs(Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = 4 Then
            Winner = True
            GameOn = False
            '
            Index2Start = 3
            Index2End = 6
            For Index2B = 0 To 5
            For Index2A = Index2Start To Index2End
            If i <= 41 And i >= 0 - 0 Then cmd(i).BackColor = WinColor
            If i <= 41 And i >= 0 - 1 Then cmd(i + 1).BackColor = WinColor
            If i <= 41 And i >= 0 - 2 Then cmd(i + 2).BackColor = WinColor
            If i <= 41 And i >= 0 - 3 Then cmd(i + 3).BackColor = WinColor
            cmd(IndexCarry).BackColor = WinMainColor
            cmd(IndexCarry).Caption = "X"
            Next Index2A
            Index2Start = Index2Start + 7
            Index2End = Index2End + 7
            Next Index2B
            '
            'Print IndexCarry; Grid(Row2, Col2); Grid(Row2, Col2 + 1); Grid(Row2, Col2 + 2); Grid(Row2, Col2 + 3); "  RIGHT CHECK"
        End If
        '
        'Check Up
        If Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = 4 Then
            Winner = True
            GameOn = False
            '
            Index2Start = 0
            Index2End = 6
            For Index2B = 0 To 2
            For Index2A = Index2Start To Index2End
            If i <= 34 Then cmd(i).BackColor = WinColor
            If i <= 34 - 7 Then cmd(i + 7).BackColor = WinColor
            If i <= 34 - 14 Then cmd(i + 14).BackColor = WinColor
            If i <= 41 - 21 Then cmd(i + 21).BackColor = WinColor
            cmd(IndexCarry).BackColor = WinMainColor
            cmd(IndexCarry).Caption = "X"
            Next Index2A
            Index2Start = Index2Start + 7
            Index2End = Index2End + 7
            Next Index2B
            '
            'Print IndexCarry; Grid(Row2, Col2); Grid(Row2 - 1, Col2); Grid(Row2 - 2, Col2); Grid(Row2 - 3, Col2); "  UP CHECK"
        End If
        '
        'Check Down
        If Abs(Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = 4 Then
            Winner = True
            GameOn = False
            '
            Index2Start = 0
            Index2End = 6
            For Index2B = 2 To 5
            For Index2A = Index2Start To Index2End
            If i >= 0 + 0 Then cmd(i).BackColor = WinColor
            If i >= 0 + 7 Then cmd(i - 7).BackColor = WinColor
            If i >= 0 + 14 Then cmd(i - 14).BackColor = WinColor
            If i >= 0 + 21 Then cmd(i - 21).BackColor = WinColor
            cmd(IndexCarry).BackColor = WinMainColor
            cmd(IndexCarry).Caption = "X"
            Next Index2A
            Index2Start = Index2Start + 7
            Index2End = Index2End + 7
            Next Index2B
            '
            'Print Index; Grid(Row2, Col2); Grid(Row2 + 1, Col2); Grid(Row2 + 2, Col2); Grid(Row2 + 3, Col2); "  DOWN CHECK"
        End If
        '
        'Check Left Diagonal
        If Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = 4 Then
            Winner = True
            GameOn = False
            '
            Index2Start = 3
            Index2End = 6
            For Index2B = 0 To 2
            For Index2A = Index2Start To Index2End
            If i >= 0 - 0 Then cmd(i).BackColor = WinColor
            If i <= 41 - 6 Then cmd(i + 6).BackColor = WinColor
            If i <= 41 - 12 Then cmd(i + 12).BackColor = WinColor
            If i <= 41 - 18 Then cmd(i + 18).BackColor = WinColor
            cmd(IndexCarry).BackColor = WinMainColor
            cmd(IndexCarry).Caption = "X"
            Next Index2A
            Index2Start = Index2Start + 7
            Index2End = Index2End + 7
            Next Index2B
            '
            'Print IndexCarry; Grid(Row2, Col2); Grid(Row2 - 1, Col2 - 1); Grid(Row2 - 2, Col2 - 2); Grid(Row2 - 3, Col2 - 3); "  UP LEFT CHECK"
        End If
        '
        'Check Right Diagonal
        If Abs(Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = 4 Then
            Winner = True
            GameOn = False
            '
            Index2Start = 0
            Index2End = 3
            For Index2B = 0 To 2
            For Index2A = Index2Start To Index2End
            If i >= 0 - 0 Then cmd(i).BackColor = WinColor
            If i <= 41 - 8 Then cmd(i + 8).BackColor = WinColor
            If i <= 41 - 16 Then cmd(i + 16).BackColor = WinColor
            If i <= 41 - 24 Then cmd(i + 24).BackColor = WinColor
            cmd(IndexCarry).BackColor = WinMainColor
            cmd(IndexCarry).Caption = "X"
            Next Index2A
            Index2Start = Index2Start + 7
            Index2End = Index2End + 7
            Next Index2B
            '
            'Print IndexCarry; Grid(Row2, Col2); Grid(Row2 - 1, Col2 + 1); Grid(Row2 - 2, Col2 + 2); Grid(Row2 - 3, Col2 + 3); "  UP RIGHT CHECK"
        End If
    Next i
    
    If Winner = True And PlayerTurn = 1 Then
        'blk piece wins
        P1Wins = P1Wins + 1
        lblBlackWins.Caption = "Black Wins: " & P1Wins
        txtAILogs.Text = txtAILogs.Text & IndexCarry & " Black Wins!!! " & vbCrLf
        MsgBox "Black Wins", , "Black Wins"
    End If
    If Winner = True And PlayerTurn = 2 Then
        'red piece wins
        P2Wins = P2Wins + 1
        lblRedWins.Caption = "Red Wins: " & P2Wins
        txtAILogs.Text = txtAILogs.Text & IndexCarry & " Red Wins!!! " & vbCrLf
        MsgBox "Red Wins", , "Red Wins"
    End If
    
End Sub

Private Sub CatsGameCheck()

    If TurnCount >= 42 And Winner = False Then
        GameOn = False
        Draws = Draws + 1
        lblDraws.Caption = "Draws: " & Draws
        txtAILogs.Text = txtAILogs.Text & Index & " Draw!!! " & vbCrLf
        MsgBox "Draw", , "Draw"
    End If
    
End Sub

Private Sub AI1()

    HumanTurn = False
    If Winner = False And (AI1Turn = True And AI1Difficulty >= 1) Then
        'If AI1Difficulty = 1 Then Call AIPickAlgorithmEasy
        'If AI1Difficulty = 2 Then Call AIPickAlgorithmNormal
        'If AI1Difficulty = 3 Then Call AIPickAlgorithmHard
        tmrAI1Think.Enabled = True
    Else
        HumanTurn = True
    End If
    
End Sub

Private Sub AI2()

    HumanTurn = False
    If Winner = False And (AI2Turn = True And AI2Difficulty >= 1) Then
        'If AI2Difficulty = 1 Then Call AIPickAlgorithmEasy
        'If AI2Difficulty = 2 Then Call AIPickAlgorithmNormal
        'If AI2Difficulty = 3 Then Call AIPickAlgorithmHard
        tmrAI2Think.Enabled = True
    Else
        HumanTurn = True
    End If
    
End Sub

Private Sub AIPickAlgorithmEasy()

Randomize

IndexCarry = Index
'read winnercheck for code ^^^
Call WinnerCheck
Call CatsGameCheck

A:
If GameOn = True _
And ((AI1Turn = True And AI1Difficulty = 1) _
Or (AI2Turn = True And AI2Difficulty = 1)) Then

    AIRandom = Int(0 + Rnd * 42)
    Index = AIRandom
    
    If cmd(Index).Enabled = True Then
        TurnCount = TurnCount + 1
        cmd(Index).Enabled = False
        'cmd(Index).Visible = False
        
        Col = Index Mod 7
        Row = 6 - (Index \ 7 + 1)
        
        IndexCarry = Index
        
        'Print "GridChoose"; Index
        txtAILogs.Text = txtAILogs.Text & Index & " GridChoose " & vbCrLf
        txtMovesList.Text = txtMovesList.Text & TurnCount & ":  " & vbTab & "R " & Row & vbTab & "C " & Col & vbCrLf
        
        If Index <= 34 Then
            cmd(Index + 7).Enabled = True
            'cmd(Index + 7).Visible = True
            cmd(Index + 7).BackColor = &H8000000F
        End If
        
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
            'P1
            cmd(Index).BackColor = vbRed
            Grid(Row, Col) = -1
            'Sets p2's turn
            PlayerTurn = 2
            AI1Turn = False
            AI2Turn = True
            GoTo B:
        End If
        
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
            'P2
            cmd(Index).BackColor = vbBlack
            Grid(Row, Col) = 1
            'Sets p1's turn
            PlayerTurn = 1
            AI1Turn = True
            AI2Turn = False
            GoTo B:
        End If
    
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
            'P1
            cmd(Index).BackColor = vbRed
            Grid(Row, Col) = -1
            'Sets p2's turn
            PlayerTurn = 2
            AI1Turn = False
            AI2Turn = True
            GoTo B:
        End If
        
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
            'P2
            cmd(Index).BackColor = vbBlack
            Grid(Row, Col) = 1
            'Sets p1's turn
            PlayerTurn = 1
            AI1Turn = True
            AI2Turn = False
            GoTo B:
        End If
    Else
        GoTo A:
    End If
    
B:
    'read winnercheck for code ^^^
    Call WinnerCheck
    Call CatsGameCheck
End If

End Sub

Private Sub AIPickAlgorithmNormal()

Dim AIGridCheckDebug As String
Dim AIAlgorithmNormalRandom As Integer

Row = 0
Col = 0

Randomize

IndexCarry = Index
'read winnercheck for code ^^^
Call WinnerCheck
Call CatsGameCheck

A:
If GameOn = True _
And ((AI1Turn = True And AI1Difficulty = 2) _
Or (AI2Turn = True And AI2Difficulty = 2)) Then

    AIRandom = Int(0 + Rnd * 42)
    Index = AIRandom
    
    'Print TurnCount Mod 2; GameCount Mod 2
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
        AIGridCheckDebug = " Black GridCheck Wins "
        GoTo AB:
    End If
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        AIGridCheckDebug = " Red GridCheck Wins "
        GoTo AC:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
        AIGridCheckDebug = " Black GridCheck Wins "
        GoTo AB:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        AIGridCheckDebug = " Red GridCheck Wins "
        GoTo AC:
    End If
    
AB:
    'Evaluate Wins
    For i = 0 To 41
    Col2 = i Mod 7
    Row2 = 6 - (i \ 7 + 1)
    
    If (Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row2, Col2 - 2) + Grid(Row2, Col2 - 3)) = 3 _
    Or (Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = 3 _
    Or (Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = 3 _
    Or (Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = 3 _
    Or (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = 3 _
    Or (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = 3 Then
    
    'Print AIGridCheckDebug; i
    txtAILogs.Text = txtAILogs.Text & i & AIGridCheckDebug & vbCrLf
    'Evaluate Wins
            Col2 = i Mod 7
            Row2 = 6 - (i \ 7 + 1)
            
            'Evaluate Possible Wins
            '
            'Check Left
            If (Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row2, Col2 - 2) + Grid(Row2, Col2 - 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWins(Row2, Col2) = 10
                If (i <= 41 + 1 And i >= 0 + 1) Then If cmd(i - 1).Enabled = True Then AI2EvaluatedWins(Row2, Col2 - 1) = 10
                If (i <= 41 + 2 And i >= 0 + 2) Then If cmd(i - 2).Enabled = True Then AI2EvaluatedWins(Row2, Col2 - 2) = 10
                If (i <= 41 + 3 And i >= 0 + 3) Then If cmd(i - 3).Enabled = True Then AI2EvaluatedWins(Row2, Col2 - 3) = 10
            End If
            '
            'Check Right
            'Abs(-1 + -1 + 1 + 1) = 4
            If (Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWins(Row2, Col2) = 10
                If (i <= 41 - 1 And i >= 0 - 1) Then If cmd(i + 1).Enabled = True Then AI2EvaluatedWins(Row2, Col2 + 1) = 10
                If (i <= 41 - 2 And i >= 0 - 2) Then If cmd(i + 2).Enabled = True Then AI2EvaluatedWins(Row2, Col2 + 2) = 10
                If (i <= 41 - 3 And i >= 0 - 3) Then If cmd(i + 3).Enabled = True Then AI2EvaluatedWins(Row2, Col2 + 3) = 10
            End If
            '
            'Check Up
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWins(Row2, Col2) = 10
                If i <= 34 - 7 Then If cmd(i + 7).Enabled = True Then AI2EvaluatedWins(Row2 - 1, Col2) = 10
                If i <= 34 - 14 Then If cmd(i + 14).Enabled = True Then AI2EvaluatedWins(Row2 - 2, Col2) = 10
                If i <= 34 - 21 Then If cmd(i + 21).Enabled = True Then AI2EvaluatedWins(Row2 - 3, Col2) = 10
            End If
            '
            'Check Down
            If (Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWins(Row2, Col2) = 10
                If i >= 0 + 7 Then If cmd(i - 7).Enabled = True Then AI2EvaluatedWins(Row2 + 1, Col2) = 10
                If i >= 0 + 14 Then If cmd(i - 14).Enabled = True Then AI2EvaluatedWins(Row2 + 2, Col2) = 10
                If i >= 0 + 21 Then If cmd(i - 21).Enabled = True Then AI2EvaluatedWins(Row2 + 3, Col2) = 10
            End If
            '
            'Check Left Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWins(Row2, Col2) = 10
                If i <= 41 - 6 Then If cmd(i + 6).Enabled = True Then AI2EvaluatedWins(Row2 - 1, Col2 - 1) = 10
                If i <= 41 - 12 Then If cmd(i + 12).Enabled = True Then AI2EvaluatedWins(Row2 - 2, Col2 - 2) = 10
                If i <= 41 - 18 Then If cmd(i + 18).Enabled = True Then AI2EvaluatedWins(Row2 - 3, Col2 - 3) = 10
            End If
            '
            'Check Right Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWins(Row2, Col2) = 10
                If i <= 41 - 8 Then If cmd(i + 8).Enabled = True Then AI2EvaluatedWins(Row2 - 1, Col2 + 1) = 10
                If i <= 41 - 16 Then If cmd(i + 16).Enabled = True Then AI2EvaluatedWins(Row2 - 2, Col2 + 2) = 10
                If i <= 41 - 24 Then If cmd(i + 24).Enabled = True Then AI2EvaluatedWins(Row2 - 3, Col2 + 3) = 10
            End If
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            '
            'Check Left
            If (Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row2, Col2 - 2) + Grid(Row2, Col2 - 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2) = 10
                If (i <= 41 + 1 And i >= 0 + 1) Then If cmd(i - 1).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2 - 1) = 10
                If (i <= 41 + 2 And i >= 0 + 2) Then If cmd(i - 2).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2 - 2) = 10
                If (i <= 41 + 3 And i >= 0 + 3) Then If cmd(i - 3).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2 - 3) = 10
            End If
            '
            'Check Right
            'Abs(-1 + -1 + 1 + 1) = 4
            If (Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2) = 10
                If (i <= 41 - 1 And i >= 0 - 1) Then If cmd(i + 1).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2 + 1) = 10
                If (i <= 41 - 2 And i >= 0 - 2) Then If cmd(i + 2).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2 + 2) = 10
                If (i <= 41 - 3 And i >= 0 - 3) Then If cmd(i + 3).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2 + 3) = 10
            End If
            '
            'Check Up
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2) = 10
                If i <= 34 - 7 Then If cmd(i + 7).Enabled = True Then AI2EvaluatedWinsA(Row2 - 1, Col2) = 10
                If i <= 34 - 14 Then If cmd(i + 14).Enabled = True Then AI2EvaluatedWinsA(Row2 - 2, Col2) = 10
                If i <= 34 - 21 Then If cmd(i + 21).Enabled = True Then AI2EvaluatedWinsA(Row2 - 3, Col2) = 10
            End If
            '
            'Check Down
            If (Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2) = 10
                If i >= 0 + 7 Then If cmd(i - 7).Enabled = True Then AI2EvaluatedWinsA(Row2 + 1, Col2) = 10
                If i >= 0 + 14 Then If cmd(i - 14).Enabled = True Then AI2EvaluatedWinsA(Row2 + 2, Col2) = 10
                If i >= 0 + 21 Then If cmd(i - 21).Enabled = True Then AI2EvaluatedWinsA(Row2 + 3, Col2) = 10
            End If
            '
            'Check Left Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2) = 10
                If i <= 41 - 6 Then If cmd(i + 6).Enabled = True Then AI2EvaluatedWinsA(Row2 - 1, Col2 - 1) = 10
                If i <= 41 - 12 Then If cmd(i + 12).Enabled = True Then AI2EvaluatedWinsA(Row2 - 2, Col2 - 2) = 10
                If i <= 41 - 18 Then If cmd(i + 18).Enabled = True Then AI2EvaluatedWinsA(Row2 - 3, Col2 - 3) = 10
            End If
            '
            'Check Right Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = 3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedWinsA(Row2, Col2) = 10
                If i <= 41 - 8 Then If cmd(i + 8).Enabled = True Then AI2EvaluatedWinsA(Row2 - 1, Col2 + 1) = 10
                If i <= 41 - 16 Then If cmd(i + 16).Enabled = True Then AI2EvaluatedWinsA(Row2 - 2, Col2 + 2) = 10
                If i <= 41 - 24 Then If cmd(i + 24).Enabled = True Then AI2EvaluatedWinsA(Row2 - 3, Col2 + 3) = 10
            End If
            For t = 0 To 41
                Col2 = t Mod 7
                Row2 = 6 - (t \ 7 + 1)
                If (GameCount Mod 2 = 1 And TurnCount Mod 2 = 0) _
                Or (GameCount Mod 2 = 0 And TurnCount Mod 2 = 1) Then
                If AI2EvaluatedWinsA(Row2, Col2) = 10 Then
                    'Print t; "Activated RED"
                    AI2EvaluatedDontPick(Row2 + 1, Col2) = 10
                End If
                End If
            Next t
    End If
    Next i
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
        AIGridCheckDebug = " Black GridCheck Threats "
        GoTo AC:
    End If
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        GoTo AA:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
        AIGridCheckDebug = " Black GridCheck Threats "
        GoTo AC:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        GoTo AA:
    End If
    
AC:
    For i = 0 To 41
    'Evaluate Threats
    Col2 = i Mod 7
    Row2 = 6 - (i \ 7 + 1)
    
    If (Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row2, Col2 - 2) + Grid(Row2, Col2 - 3)) = -3 _
    Or (Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = -3 _
    Or (Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = -3 _
    Or (Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = -3 _
    Or (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = -3 _
    Or (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = -3 Then
    
    'Print AIGridCheckDebug; i
    txtAILogs.Text = txtAILogs.Text & i & AIGridCheckDebug & vbCrLf
    'Evaluate Threats
            Col2 = i Mod 7
            Row2 = 6 - (i \ 7 + 1)
            'Evaluate Possible Threats
            '
            'Check Left
            If (Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row2, Col2 - 2) + Grid(Row2, Col2 - 3)) = -3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedThreats(Row2, Col2) = 10
                If (i <= 41 + 1 And i >= 0 + 1) Then If cmd(i - 1).Enabled = True Then AI2EvaluatedThreats(Row2, Col2 - 1) = 10
                If (i <= 41 + 2 And i >= 0 + 2) Then If cmd(i - 2).Enabled = True Then AI2EvaluatedThreats(Row2, Col2 - 2) = 10
                If (i <= 41 + 3 And i >= 0 + 3) Then If cmd(i - 3).Enabled = True Then AI2EvaluatedThreats(Row2, Col2 - 3) = 10
            End If
            '
            'Check Right
            'Abs(-1 + -1 + 1 + 1) = 4
            If (Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = -3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedThreats(Row2, Col2) = 10
                If (i <= 41 - 1 And i >= 0 - 1) Then If cmd(i + 1).Enabled = True Then AI2EvaluatedThreats(Row2, Col2 + 1) = 10
                If (i <= 41 - 2 And i >= 0 - 2) Then If cmd(i + 2).Enabled = True Then AI2EvaluatedThreats(Row2, Col2 + 2) = 10
                If (i <= 41 - 3 And i >= 0 - 3) Then If cmd(i + 3).Enabled = True Then AI2EvaluatedThreats(Row2, Col2 + 3) = 10
            End If
            '
            'Check Up
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = -3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedThreats(Row2, Col2) = 10
                If i <= 34 - 7 Then If cmd(i + 7).Enabled = True Then AI2EvaluatedThreats(Row2 - 1, Col2) = 10
                If i <= 34 - 14 Then If cmd(i + 14).Enabled = True Then AI2EvaluatedThreats(Row2 - 2, Col2) = 10
                If i <= 34 - 21 Then If cmd(i + 21).Enabled = True Then AI2EvaluatedThreats(Row2 - 3, Col2) = 10
            End If
            '
            'Check Down
            If (Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = -3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedThreats(Row2, Col2) = 10
                If i >= 0 + 7 Then If cmd(i - 7).Enabled = True Then AI2EvaluatedThreats(Row2 + 1, Col2) = 10
                If i >= 0 + 14 Then If cmd(i - 14).Enabled = True Then AI2EvaluatedThreats(Row2 + 2, Col2) = 10
                If i >= 0 + 21 Then If cmd(i - 21).Enabled = True Then AI2EvaluatedThreats(Row2 + 3, Col2) = 10
            End If
            '
            'Check Left Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = -3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedThreats(Row2, Col2) = 10
                If i <= 41 - 6 Then If cmd(i + 6).Enabled = True Then AI2EvaluatedThreats(Row2 - 1, Col2 - 1) = 10
                If i <= 41 - 12 Then If cmd(i + 12).Enabled = True Then AI2EvaluatedThreats(Row2 - 2, Col2 - 2) = 10
                If i <= 41 - 18 Then If cmd(i + 18).Enabled = True Then AI2EvaluatedThreats(Row2 - 3, Col2 - 3) = 10
            End If
            '
            'Check Right Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = -3 Then
                If cmd(i).Enabled = True Then AI2EvaluatedThreats(Row2, Col2) = 10
                If i <= 41 - 8 Then If cmd(i + 8).Enabled = True Then AI2EvaluatedThreats(Row2 - 1, Col2 + 3) = 10
                If i <= 41 - 16 Then If cmd(i + 16).Enabled = True Then AI2EvaluatedThreats(Row2 - 2, Col2 + 3) = 10
                If i <= 41 - 24 Then If cmd(i + 24).Enabled = True Then AI2EvaluatedThreats(Row2 - 3, Col2 + 3) = 10
            End If
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            '
            'Check Left
            If (Grid(Row2, Col2) + Grid(Row2, Col2 - 1) + Grid(Row2, Col2 - 2) + Grid(Row2, Col2 - 3)) = -3 Then
                AI2EvaluatedThreatsA(Row2, Col2) = 10
                If (i <= 41 + 1 And i >= 0 + 1) Then AI2EvaluatedThreatsA(Row2, Col2 - 1) = 10
                If (i <= 41 + 2 And i >= 0 + 2) Then AI2EvaluatedThreatsA(Row2, Col2 - 2) = 10
                If (i <= 41 + 3 And i >= 0 + 3) Then AI2EvaluatedThreatsA(Row2, Col2 - 3) = 10
            End If
            '
            'Check Right
            'Abs(-1 + -1 + 1 + 1) = 4
            If (Grid(Row2, Col2) + Grid(Row2, Col2 + 1) + Grid(Row2, Col2 + 2) + Grid(Row2, Col2 + 3)) = -3 Then
                AI2EvaluatedThreats(Row2, Col2) = 10
                If (i <= 41 - 1 And i >= 0 - 1) Then AI2EvaluatedThreatsA(Row2, Col2 + 1) = 10
                If (i <= 41 - 2 And i >= 0 - 2) Then AI2EvaluatedThreatsA(Row2, Col2 + 2) = 10
                If (i <= 41 - 3 And i >= 0 - 3) Then AI2EvaluatedThreatsA(Row2, Col2 + 3) = 10
            End If
            '
            'Check Up
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2) + Grid(Row2 - 2, Col2) + Grid(Row2 - 3, Col2)) = -3 Then
                AI2EvaluatedThreats(Row2, Col2) = 10
                If i <= 34 - 7 Then AI2EvaluatedThreats(Row2 - 1, Col2) = 10
                If i <= 34 - 14 Then AI2EvaluatedThreats(Row2 - 2, Col2) = 10
                If i <= 34 - 21 Then AI2EvaluatedThreats(Row2 - 3, Col2) = 10
            End If
            '
            'Check Down
            If (Grid(Row2, Col2) + Grid(Row2 + 1, Col2) + Grid(Row2 + 2, Col2) + Grid(Row2 + 3, Col2)) = -3 Then
                AI2EvaluatedThreatsA(Row2, Col2) = 10
                If i >= 0 + 7 Then AI2EvaluatedThreatsA(Row2 + 1, Col2) = 10
                If i >= 0 + 14 Then AI2EvaluatedThreatsA(Row2 + 2, Col2) = 10
                If i >= 0 + 21 Then AI2EvaluatedThreatsA(Row2 + 3, Col2) = 10
            End If
            '
            'Check Left Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 - 1) + Grid(Row2 - 2, Col2 - 2) + Grid(Row2 - 3, Col2 - 3)) = -3 Then
                AI2EvaluatedThreatsA(Row2, Col2) = 10
                If i <= 41 - 6 Then AI2EvaluatedThreatsA(Row2 - 1, Col2 - 1) = 10
                If i <= 41 - 12 Then AI2EvaluatedThreatsA(Row2 - 2, Col2 - 2) = 10
                If i <= 41 - 18 Then AI2EvaluatedThreatsA(Row2 - 3, Col2 - 3) = 10
            End If
            '
            'Check Right Diagonal
            If (Grid(Row2, Col2) + Grid(Row2 - 1, Col2 + 1) + Grid(Row2 - 2, Col2 + 2) + Grid(Row2 - 3, Col2 + 3)) = -3 Then
                AI2EvaluatedThreatsA(Row2, Col2) = 10
                If i <= 41 - 8 Then AI2EvaluatedThreatsA(Row2 - 1, Col2 + 3) = 10
                If i <= 41 - 16 Then AI2EvaluatedThreatsA(Row2 - 2, Col2 + 3) = 10
                If i <= 41 - 24 Then AI2EvaluatedThreatsA(Row2 - 3, Col2 + 3) = 10
            End If
            
            For t = 0 To 41
                Col2 = t Mod 7
                Row2 = 6 - (t \ 7 + 1)
                If (GameCount Mod 2 = 1 And TurnCount Mod 2 = 1) _
                Or (GameCount Mod 2 = 0 And TurnCount Mod 2 = 0) Then
                If AI2EvaluatedThreatsA(Row2, Col2) = 10 Then
                    'Print t; "Activated BLACK"
                    AI2EvaluatedDontPick(Row2 + 1, Col2) = 10
                End If
                End If
            Next t
    End If
    Next i
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
        GoTo D:
    End If
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        AIGridCheckDebug = " Red GridCheck Threats "
        GoTo AB:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
        GoTo D:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        AIGridCheckDebug = " Red GridCheck Threats "
        GoTo AB:
    End If
    
D:
    For dex = 0 To 41
    Col2 = dex Mod 7
    Row2 = 6 - (dex \ 7 + 1)
    If AI2EvaluatedWins(Row2, Col2) = 10 And cmd(dex).Enabled = True Then
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
            'Print Dex; "  Black AIWin Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Black AIWin Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo AD:
        End If
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
            'Print Dex; "  Red AIThreat Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Red AIThreat Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo E:
        End If
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
            'Print Dex; "  Black AIWin Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Black AIWin Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo AD:
        End If
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
            'Print Dex; "  Red AIThreat Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Red AIThreat Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo E:
        End If
        GoTo E:
    Else
    End If
    Next dex
AE:
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
        GoTo AA:
    End If
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        GoTo E:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
        GoTo AA:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        GoTo E:
    End If
    
AA:
    For dex = 0 To 41
    Col2 = dex Mod 7
    Row2 = 6 - (dex \ 7 + 1)
    If AI2EvaluatedThreats(Row2, Col2) = 10 And cmd(dex).Enabled = True Then
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
            'Print Dex; "  Black AIThreat Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Black AIThreat Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo E:
        End If
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
            'Print Dex; "  Red AIWin Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Red AIWin Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo AD:
        End If
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
            'Print Dex; "  Black AIThreat Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Black AIThreat Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo E:
        End If
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
            'Print Dex; "  Red AIWin Check"
            txtAILogs.Text = txtAILogs.Text & dex & " Red AIWin Check " & vbCrLf
            AIRandom = dex
            Index = AIRandom
            GoTo AD:
        End If
        GoTo E:
    Else
    End If
    Next dex
    
AF:
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
        GoTo E:
    End If
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        GoTo D:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
        GoTo E:
    End If
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        GoTo D:
    End If
    
E:
    'Reset AIEvaluated
    For R = -3 To 8
        For C = -3 To 9
            AI2EvaluatedThreats(R, C) = 0
            AI2EvaluatedWins(R, C) = 0
            AI2EvaluatedMoves(R, C) = 0
        Next C
    Next R
    
C:
If GameOn = True Then
    If AI2EvaluatedDontPick(Row, Col) = 10 And (AI2JustPickAlready < 32000 Or AI2JustPickAlreadyA < 32000 Or AI2JustPickAlreadyB < 32000 Or AI2JustPickAlreadyC < 32000 Or AI2JustPickAlreadyD < 32000) Then
        If AI2JustPickAlready < 32000 Then AI2JustPickAlready = AI2JustPickAlready + 1
        If AI2JustPickAlready >= 32000 And AI2JustPickAlreadyA < 32000 Then AI2JustPickAlreadyA = AI2JustPickAlreadyA + 1
        If AI2JustPickAlreadyA >= 32000 And AI2JustPickAlreadyB < 32000 Then AI2JustPickAlreadyB = AI2JustPickAlreadyB + 1
        If AI2JustPickAlreadyB >= 32000 And AI2JustPickAlreadyC < 32000 Then AI2JustPickAlreadyC = AI2JustPickAlreadyC + 1
        If AI2JustPickAlreadyC >= 32000 And AI2JustPickAlreadyD < 32000 Then AI2JustPickAlreadyD = AI2JustPickAlreadyD + 1
        GoTo F:
    End If
AD:
If GameOn = True Then
        If cmd(Index).Enabled = True Then
        
        TurnCount = TurnCount + 1
        cmd(Index).Enabled = False
        'cmd(Index).Visible = False
        
        Col = Index Mod 7
        Row = 6 - (Index \ 7 + 1)
                
        IndexCarry = Index
        
        'Print "GridChoose"; Index
        txtAILogs.Text = txtAILogs.Text & Index & " GridChoose " & vbCrLf
        txtMovesList.Text = txtMovesList.Text & TurnCount & ":  " & vbTab & "R " & Row & vbTab & "C " & Col & vbCrLf
        
        If Index <= 34 Then
            cmd(Index + 7).Enabled = True
            'cmd(Index + 7).Visible = True
            cmd(Index + 7).BackColor = &H8000000F
        End If
        
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
            'P1
            cmd(Index).BackColor = vbRed
            Grid(Row, Col) = -1
            'Sets p2's turn
            PlayerTurn = 2
            AI1Turn = False
            AI2Turn = True
            GoTo B:
        End If
        
        If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
            'P2
            cmd(Index).BackColor = vbBlack
            Grid(Row, Col) = 1
            'Sets p1's turn
            PlayerTurn = 1
            AI1Turn = True
            AI2Turn = False
            GoTo B:
        End If
        
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
            'P1
            cmd(Index).BackColor = vbRed
            Grid(Row, Col) = -1
            'Sets p2's turn
            PlayerTurn = 2
            AI1Turn = False
            AI2Turn = True
            GoTo B:
        End If
        
        If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
            'P2
            cmd(Index).BackColor = vbBlack
            Grid(Row, Col) = 1
            'Sets p1's turn
            PlayerTurn = 1
            AI1Turn = True
            AI2Turn = False
            GoTo B:
        End If
        Else
            GoTo F:
        End If
Else
    GoTo G:
End If
End If

B:
    'Reset AIEvaluated
    For R = -3 To 8
        For C = -3 To 9
            AI2JustPickAlready = 0
            AI2JustPickAlreadyA = 0
            AI2JustPickAlreadyB = 0
            AI2JustPickAlreadyC = 0
            AI2JustPickAlreadyD = 0
            AI2EvaluatedDontPick(R, C) = 0
            AI2EvaluatedThreats(R, C) = 0
            AI2EvaluatedWins(R, C) = 0
            AI2EvaluatedMoves(R, C) = 0
            AI2EvaluatedThreatsA(R, C) = 0
            AI2EvaluatedWinsA(R, C) = 0
        Next C
    Next R
    
    'read winnercheck for code ^^^
    Call WinnerCheck
    Call CatsGameCheck
    GoTo G:

F:
    AIRandom = Int(0 + Rnd * 42)
    Index = AIRandom
    Col = Index Mod 7
    Row = 6 - (Index \ 7 + 1)
    GoTo C:
G:
End If

End Sub

Private Sub AIPickAlgorithmHard()
    
    'I Don't have the time to code this.

End Sub

Private Sub NextRow()
    
    If Index <= 34 Then
        cmd(Index + 7).Enabled = True
        'cmd(Index + 7).Visible = True
        cmd(Index + 7).BackColor = &H8000000F
    End If
    
End Sub

Private Sub UpdateMovesList()
Dim TempPiecesInColumn(1 To 7) As Integer, ColumnNo As Integer, Letter As String, m As Integer
txtAILogs.Text = ""
For m = 1 To MovesNum
    ColumnNo = MovesList(i)
    Select Case ColumnNo
        Case 1: Letter = "A"
        Case 2: Letter = "B"
        Case 3: Letter = "C"
        Case 4: Letter = "D"
        Case 5: Letter = "E"
        Case 6: Letter = "F"
        Case 7: Letter = "G"
    End Select
    TempPiecesInColumn(ColumnNo) = TempPiecesInColumn(ColumnNo) + 1
    Letter = Str(i) + "." + Letter + Str(TempPiecesInColumn(ColumnNo))
    Letter = Replace(Letter, " ", "")
    If m Mod 2 = 1 Then txtAILogs.Text = txtAILogs.Text + Letter + vbTab Else txtAILogs.Text = txtAILogs.Text + Letter + vbCrLf
Next
End Sub

Private Sub optAI20_Click()
    AI2Difficulty = 0
End Sub

Private Sub optAI21_Click()
    AI2Difficulty = 1
    Call AI2
End Sub

Private Sub optAI22_Click()
    AI2Difficulty = 2
    Call AI2
End Sub

Private Sub optAI23_Click()
    AI2Difficulty = 3
    Call AI2
End Sub

Private Sub tmrAI1Think_Timer()

    If Winner = False And (AI1Turn = True And AI1Difficulty >= 1) Then
        If AI1Difficulty = 1 Then Call AIPickAlgorithmEasy
        If AI1Difficulty = 2 Then Call AIPickAlgorithmNormal
        If AI1Difficulty = 3 Then Call AIPickAlgorithmHard
    End If
    
    tmrAI1Think.Enabled = False
    
End Sub

Private Sub tmrAI2Think_Timer()

    If Winner = False And (AI2Turn = True And AI2Difficulty >= 1) Then
        If AI2Difficulty = 1 Then Call AIPickAlgorithmEasy
        If AI2Difficulty = 2 Then Call AIPickAlgorithmNormal
        If AI2Difficulty = 3 Then Call AIPickAlgorithmHard
    End If
    
    tmrAI2Think.Enabled = False
    
End Sub

Private Sub tmrDice1_Timer()

    Randomize
    
    Red = Int(1 + Rnd * 255)
    greed = Int(1 + Rnd * 255)
    blue = Int(1 + Rnd * 255)
    
    RandomDice = Int(1 + Rnd * 6)
    lblDice.Caption = "Dice: " & RandomDice
    lblDice.ForeColor = RGB(Red, green, blue)
    
End Sub

Private Sub tmrDice2_Timer()

    Randomize
    
    tmrDice1.Interval = (tmrDice1.Interval + 8)
    
    timeing = Int(500 + Rnd * 5000)
    
    If tmrDice1.Interval > timeing Then
        tmrDice1.Interval = 1
        tmrDice1.Enabled = False
        tmrDice2.Enabled = False
        cmdDice.Enabled = True
        cmdDice.Caption = "Roll Dice"
        lblDice.ForeColor = RGB(255, 255, 255)
    End If

End Sub

Private Sub tmrTurnCheck_Timer()

If GameOn = True Then
    lblGameOn.Caption = "~Game Is *ON*"
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 1 Then
        lblTurn.Caption = "-Black's Turn"
        AI1Turn = False
        AI2Turn = True
        If AI1Difficulty >= 1 Then Call AI1
        If AI2Difficulty >= 1 Then Call AI2
        GoTo B:
    End If
    
    If GameCount Mod 2 = 1 And TurnCount Mod 2 = 0 Then
        lblTurn.Caption = "-Red's Turn"
        AI1Turn = True
        AI2Turn = False
        If AI1Difficulty >= 1 Then Call AI1
        If AI2Difficulty >= 1 Then Call AI2
        GoTo B:
    End If
    
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 0 Then
        lblTurn.Caption = "-Black's Turn"
        AI1Turn = False
        AI2Turn = True
        If AI1Difficulty >= 1 Then Call AI1
        If AI2Difficulty >= 1 Then Call AI2
        GoTo B:
    End If
    
    If GameCount Mod 2 = 0 And TurnCount Mod 2 = 1 Then
        lblTurn.Caption = "-Red's Turn"
        AI1Turn = True
        AI2Turn = False
        If AI1Difficulty >= 1 Then Call AI1
        If AI2Difficulty >= 1 Then Call AI2
        GoTo B:
    End If
B:

Else
    lblGameOn.Caption = "~Game Is *OFF*"
    If Winner = True Then
        lblTurn.Caption = "~Game End"
    Else
        lblTurn.Caption = "~Draw"
    End If
End If
    
End Sub
