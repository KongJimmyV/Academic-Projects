VERSION 5.00
Begin VB.Form frmBattleship 
   BackColor       =   &H00000000&
   Caption         =   " Battleship"
   ClientHeight    =   10575
   ClientLeft      =   120
   ClientTop       =   750
   ClientWidth     =   21855
   ForeColor       =   &H00FFFFFF&
   Icon            =   "frmBattleship.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   10575
   ScaleWidth      =   21855
   StartUpPosition =   1  'CenterOwner
   Begin VB.OptionButton optAI6 
      BackColor       =   &H00000000&
      Caption         =   "Unfair"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   8520
      MaskColor       =   &H00808080&
      TabIndex        =   20
      Top             =   7200
      Width           =   2175
   End
   Begin VB.OptionButton optAI5 
      BackColor       =   &H00000000&
      Caption         =   "Very Hard"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   8520
      MaskColor       =   &H00808080&
      TabIndex        =   19
      Top             =   6840
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.OptionButton optAI4 
      BackColor       =   &H00000000&
      Caption         =   "Hard"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   8520
      MaskColor       =   &H00808080&
      TabIndex        =   18
      Top             =   6480
      Width           =   2175
   End
   Begin VB.OptionButton optAI1 
      BackColor       =   &H00000000&
      Caption         =   "Very Easy"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   8520
      MaskColor       =   &H00808080&
      TabIndex        =   15
      Top             =   5400
      Width           =   2175
   End
   Begin VB.Timer tmrAIAttack 
      Enabled         =   0   'False
      Interval        =   150
      Left            =   120
      Top             =   600
   End
   Begin VB.Timer tmrAIPlacement 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   120
      Top             =   120
   End
   Begin VB.Frame fraMenu 
      BackColor       =   &H00000000&
      Caption         =   "Instant Options"
      ForeColor       =   &H00FFFFFF&
      Height          =   5055
      Left            =   8160
      TabIndex        =   0
      Top             =   4680
      Width           =   5655
      Begin VB.Frame fraThemes 
         BackColor       =   &H00000000&
         Caption         =   "Themes"
         ForeColor       =   &H00FFFFFF&
         Height          =   4335
         Left            =   2880
         TabIndex        =   14
         Top             =   360
         Visible         =   0   'False
         Width           =   2535
         Begin VB.OptionButton optT2 
            BackColor       =   &H00000000&
            Caption         =   "Realistic"
            ForeColor       =   &H00FFFFFF&
            Height          =   375
            Left            =   240
            MaskColor       =   &H00808080&
            TabIndex        =   22
            Top             =   720
            Width           =   2055
         End
         Begin VB.OptionButton optT1 
            BackColor       =   &H00000000&
            Caption         =   "Classic"
            ForeColor       =   &H00FFFFFF&
            Height          =   375
            Left            =   240
            MaskColor       =   &H00808080&
            TabIndex        =   21
            Top             =   360
            Width           =   2055
         End
      End
      Begin VB.Frame fraAI 
         BackColor       =   &H00000000&
         Caption         =   "AI Difficulty"
         ForeColor       =   &H00FFFFFF&
         Height          =   4335
         Left            =   240
         TabIndex        =   13
         Top             =   360
         Width           =   2415
         Begin VB.OptionButton optAI3 
            BackColor       =   &H00000000&
            Caption         =   "Normal"
            ForeColor       =   &H00FFFFFF&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00808080&
            TabIndex        =   17
            Top             =   1080
            Width           =   2175
         End
         Begin VB.OptionButton optAI2 
            BackColor       =   &H00000000&
            Caption         =   "Easy"
            ForeColor       =   &H00FFFFFF&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00808080&
            TabIndex        =   16
            Top             =   720
            Width           =   2175
         End
      End
   End
   Begin VB.Label lbl0 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "BATTLESHIP"
      BeginProperty Font 
         Name            =   "Felix Titling"
         Size            =   48
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   975
      Left            =   7920
      TabIndex        =   23
      Top             =   120
      Width           =   6015
   End
   Begin VB.Label lblP2Area 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Enemy's Area"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   14760
      TabIndex        =   12
      Top             =   2640
      Width           =   6255
   End
   Begin VB.Label lblP1Area 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Your Area"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   840
      TabIndex        =   11
      Top             =   2640
      Width           =   6255
   End
   Begin VB.Label lbl4 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Enemy"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   495
      Left            =   10920
      TabIndex        =   10
      Top             =   2400
      Width           =   3015
   End
   Begin VB.Label lblP2Losses 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Losses: 0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   10920
      TabIndex        =   9
      Top             =   3840
      Width           =   3015
   End
   Begin VB.Label lblP1Losses 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Losses: 0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   7920
      TabIndex        =   8
      Top             =   3840
      Width           =   3015
   End
   Begin VB.Label lblP2Wins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wins: 0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   10920
      TabIndex        =   7
      Top             =   3360
      Width           =   3015
   End
   Begin VB.Label lblP1Wins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wins: 0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   7920
      TabIndex        =   6
      Top             =   3360
      Width           =   3015
   End
   Begin VB.Label lblTurn1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "________________"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   495
      Left            =   7920
      TabIndex        =   5
      Top             =   2880
      Width           =   3015
   End
   Begin VB.Label lblTurn2 
      Alignment       =   1  'Right Justify
      BorderStyle     =   1  'Fixed Single
      Caption         =   "----------------------------"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   495
      Left            =   10920
      TabIndex        =   4
      Top             =   2880
      Width           =   3015
   End
   Begin VB.Label lbl3 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "You"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   495
      Left            =   7920
      TabIndex        =   3
      Top             =   2400
      Width           =   3015
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   99
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   98
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   97
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   96
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   95
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   94
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   93
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   92
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   91
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   90
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   89
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   88
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   87
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   86
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   85
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   84
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   83
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   82
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   81
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   80
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   79
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   78
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   77
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   76
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   75
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   74
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   73
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   72
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   71
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   70
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   69
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   68
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   67
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   66
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   65
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   64
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   63
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   62
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   61
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   60
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   59
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   58
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   57
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   56
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   55
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   54
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   53
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   52
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   51
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   50
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   49
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   48
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   47
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   46
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   45
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   44
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   43
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   42
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   41
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   40
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   39
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   38
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   37
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   36
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   35
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   34
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   33
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   32
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   31
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   30
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   29
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   28
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   27
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   26
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   25
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   24
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   23
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   22
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   21
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   20
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   19
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   18
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   17
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   16
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   15
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   14
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   13
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   12
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   11
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   10
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   9
      Left            =   20280
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   8
      Left            =   19680
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   7
      Left            =   19080
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   6
      Left            =   18480
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   5
      Left            =   17880
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   4
      Left            =   17280
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   3
      Left            =   16680
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   2
      Left            =   16080
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   1
      Left            =   15480
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater2 
      Height          =   615
      Index           =   0
      Left            =   14880
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Label lbl2 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Place Your 'Aircraft Carrier'."
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   615
      Left            =   7920
      TabIndex        =   2
      Top             =   1800
      Width           =   6015
   End
   Begin VB.Label lbl1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Player 1's Turn"
      BeginProperty Font 
         Name            =   "Bauhaus 93"
         Size            =   27.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   735
      Left            =   7920
      TabIndex        =   1
      Top             =   1080
      Width           =   6015
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   99
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   98
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   97
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   96
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   95
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   94
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   93
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   92
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   91
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   90
      Left            =   960
      Stretch         =   -1  'True
      Top             =   8880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   89
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   88
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   87
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   86
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   85
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   84
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   83
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   82
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   81
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   80
      Left            =   960
      Stretch         =   -1  'True
      Top             =   8280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   79
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   78
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   77
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   76
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   75
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   74
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   73
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   72
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   71
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   70
      Left            =   960
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   69
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   68
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   67
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   66
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   65
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   64
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   63
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   62
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   61
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   60
      Left            =   960
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   59
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   58
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   57
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   56
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   55
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   54
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   53
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   52
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   51
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   50
      Left            =   960
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   49
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   48
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   47
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   46
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   45
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   44
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   43
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   42
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   41
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   40
      Left            =   960
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   39
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   38
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   37
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   36
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   35
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   34
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   33
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   32
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   31
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   30
      Left            =   960
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   29
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   28
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   27
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   26
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   25
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   24
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   23
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   22
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   21
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   20
      Left            =   960
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   19
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   18
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   17
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   16
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   15
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   14
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   13
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   12
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   11
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   10
      Left            =   960
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   9
      Left            =   6360
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   8
      Left            =   5760
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   7
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   6
      Left            =   4560
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   5
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   4
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   3
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   2
      Left            =   2160
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   1
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgWater 
      Height          =   615
      Index           =   0
      Left            =   960
      MouseIcon       =   "frmBattleship.frx":0442
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   615
   End
   Begin VB.Image imgPatrolV 
      Height          =   1215
      Index           =   1
      Left            =   9600
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgDestroyerV 
      Height          =   1815
      Index           =   1
      Left            =   9000
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgSubmarineV 
      Height          =   1815
      Index           =   1
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgBattleshipV 
      Height          =   2415
      Index           =   1
      Left            =   7800
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgCarrierV 
      Height          =   3015
      Index           =   1
      Left            =   7200
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPatrolH 
      Height          =   615
      Index           =   1
      Left            =   10800
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgDestroyerH 
      Height          =   615
      Index           =   1
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   1815
   End
   Begin VB.Image imgSubmarineH 
      Height          =   615
      Index           =   1
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   2400
      Width           =   1815
   End
   Begin VB.Image imgBattleshipH 
      Height          =   615
      Index           =   1
      Left            =   9600
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   2415
   End
   Begin VB.Image imgCarrierH 
      Height          =   615
      Index           =   1
      Left            =   9000
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   3015
   End
   Begin VB.Image imgCarrierH 
      Height          =   615
      Index           =   0
      Left            =   9600
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   3015
   End
   Begin VB.Image imgBattleshipH 
      Height          =   615
      Index           =   0
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   2400
      Width           =   2415
   End
   Begin VB.Image imgSubmarineH 
      Height          =   615
      Index           =   0
      Left            =   10800
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   1815
   End
   Begin VB.Image imgDestroyerH 
      Height          =   615
      Index           =   0
      Left            =   10800
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Image imgPatrolH 
      Height          =   615
      Index           =   0
      Left            =   11400
      Stretch         =   -1  'True
      Top             =   600
      Width           =   1215
   End
   Begin VB.Image imgCarrierV 
      Height          =   3015
      Index           =   0
      Left            =   7800
      Stretch         =   -1  'True
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgBattleshipV 
      Height          =   2415
      Index           =   0
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgSubmarineV 
      Height          =   1815
      Index           =   0
      Left            =   9000
      Stretch         =   -1  'True
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgDestroyerV 
      Height          =   1815
      Index           =   0
      Left            =   9600
      Stretch         =   -1  'True
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPatrolV 
      Height          =   1215
      Index           =   0
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgBG2 
      Height          =   6255
      Left            =   14760
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   6255
   End
   Begin VB.Image imgBG 
      Height          =   6255
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   6255
   End
   Begin VB.Menu mnuCheckShip 
      Caption         =   "Check Ship Health"
   End
   Begin VB.Menu mnuCls 
      Caption         =   "Clean Print"
   End
   Begin VB.Menu mnuGrid 
      Caption         =   "Print Grid"
   End
   Begin VB.Menu mnuReset 
      Caption         =   "Reset"
   End
End
Attribute VB_Name = "frmBattleship"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'*Terms
Dim GameOn As Boolean
Dim TurnPlayer As Boolean
Dim TurnPlayer2 As Boolean
Dim TurnAI As Boolean

Dim PlaceShips As Boolean

Dim hit As Boolean
Dim miss As Boolean

Dim NCount As Integer

Dim I As Integer
Dim ITemp As Integer

Dim s As Integer

Dim R As Integer
Dim C As Integer

Dim IT As Integer

Dim Rand As Integer
Dim RandomIComp As Integer

Dim P1WinCount As Integer
Dim P1LoseCount As Integer
Dim P2WinCount As Integer
Dim P2LoseCount As Integer

'AI Terms
Dim AIFoundShip As Boolean
Dim AIClick As Integer
Dim AIDifficulty As Integer
Dim AITarget(-10 To 19, -10 To 19) As Integer
Dim AIDirection As Integer
Dim DoRandom As Boolean
Dim EvalCheck As Boolean
Dim HitFound As Boolean

Dim HitFoundPatrolBoat As Boolean
Dim HitFoundDestroyer As Boolean
Dim HitFoundSubmarine As Boolean
Dim HitFoundBattleship As Boolean
Dim HitFoundCarrier As Boolean

Dim rTemp As Integer
Dim cTemp As Integer

'*Map
Dim Grid(-4 To 13, -4 To 13) As Integer
Dim Grid2(-4 To 13, -4 To 13) As Integer
Dim Letters(0 To 9) As Integer
Dim Numbers(0 To 9) As Integer
Dim Row As Integer
Dim Col As Integer
Dim RowTemp As Integer
Dim ColTemp As Integer

'*Ships ***'0 = P1 '1 = P2***
Dim ShipNum As Integer

'Deadships
Dim DeadCarrier(0 To 1) As Boolean
Dim DeadBattleship(0 To 1) As Boolean
Dim DeadSubmarine(0 To 1) As Boolean
Dim DeadDestroyer(0 To 1) As Boolean
Dim DeadPatrolBoat(0 To 1) As Boolean

'Ship Placement
Dim PlaceDirection(0 To 1) As Boolean
Dim PlaceCarrier(0 To 1) As Boolean
Dim PlaceBattleship(0 To 1) As Boolean
Dim PlaceSubmarine(0 To 1) As Boolean
Dim PlaceDestroyer(0 To 1) As Boolean
Dim PlacePatrolBoat(0 To 1) As Boolean

'Ship Health
Dim HealthCarrier(0 To 1) As Integer
Dim HealthBattleship(0 To 1) As Integer
Dim HealthSubmarine(0 To 1) As Integer
Dim HealthDestroyer(0 To 1) As Integer
Dim HealthPatrolBoat(0 To 1) As Integer

Private Sub Form_Load()

    Randomize
    
    'Set ai difficulty
    AIDifficulty = 1
    
    'Make ships Invisible
    For t = 0 To 1
    imgPatrolH(t).Visible = False
    imgDestroyerH(t).Visible = False
    imgSubmarineH(t).Visible = False
    imgBattleshipH(t).Visible = False
    imgCarrierH(t).Visible = False
    imgPatrolV(t).Visible = False
    imgDestroyerV(t).Visible = False
    imgSubmarineV(t).Visible = False
    imgBattleshipV(t).Visible = False
    imgCarrierV(t).Visible = False
    Next t
    
    For R = 0 To 9
        For C = 0 To 9
            Grid(R, C) = 0
            Grid2(R, C) = 0
        Next C
    Next R
    '*Test Code
    For t = 0 To 1
    imgPatrolH(t).Picture = LoadPicture(App.Path & "\Images\HPatrol Boat.gif")
    imgDestroyerH(t).Picture = LoadPicture(App.Path & "\Images\HDestroyer.gif")
    imgSubmarineH(t).Picture = LoadPicture(App.Path & "\Images\HSubmarine.gif")
    imgBattleshipH(t).Picture = LoadPicture(App.Path & "\Images\HBattleship.gif")
    imgCarrierH(t).Picture = LoadPicture(App.Path & "\Images\HCarrier.gif")
    imgPatrolV(t).Picture = LoadPicture(App.Path & "\Images\VPatrol Boat.gif")
    imgDestroyerV(t).Picture = LoadPicture(App.Path & "\Images\VDestroyer.gif")
    imgSubmarineV(t).Picture = LoadPicture(App.Path & "\Images\VSubmarine.gif")
    imgBattleshipV(t).Picture = LoadPicture(App.Path & "\Images\VBattleship.gif")
    imgCarrierV(t).Picture = LoadPicture(App.Path & "\Images\VCarrier.gif")
    
    imgPatrolH(t).Left = 0
    imgDestroyerH(t).Left = 0
    imgSubmarineH(t).Left = 0
    imgBattleshipH(t).Left = 0
    imgCarrierH(t).Left = 0
    imgPatrolV(t).Left = 0
    imgDestroyerV(t).Left = 0
    imgSubmarineV(t).Left = 0
    imgBattleshipV(t).Left = 0
    imgCarrierV(t).Left = 0
    imgPatrolH(t).Top = 0
    imgDestroyerH(t).Top = 0
    imgSubmarineH(t).Top = 0
    imgBattleshipH(t).Top = 0
    imgCarrierH(t).Top = 0
    imgPatrolV(t).Top = 0
    imgDestroyerV(t).Top = 0
    imgSubmarineV(t).Top = 0
    imgBattleshipV(t).Top = 0
    imgCarrierV(t).Top = 0
    
    tmrAIPlacement = False
    tmrAIAttack = False
    
    Next t
    lbl1.Caption = "Player 1's Turn"
    lbl2.Caption = "Place Your 'Aircraft Carrier'."
    PlaceShips = True
    '**
    '***Initiate Program***
    '*Load Images*
    For t = 0 To 99
        imgWater(t).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
        imgWater2(t).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
    Next t
    t = 0
    imgBG.Picture = LoadPicture(App.Path & "\Images\BGWater.gif")
    imgBG2.Picture = LoadPicture(App.Path & "\Images\BGWater.gif")
    '**
    '*Define Variables
    GameOn = False
    TurnPlayer = True
    TurnPlayer2 = False
    TurnAI = False
    DoRandom = True
    EvalCheck = True
    HitFound = False
    HitFoundPatrolBoat = False
    HitFoundDestroyer = False
    HitFoundSubmarine = False
    HitFoundBattleship = False
    HitFoundCarrier = False
    hit = False
    miss = False
    For t = 0 To 1
        DeadCarrier(t) = False
        DeadBattleship(t) = False
        DeadSubmarine(t) = False
        DeadDestroyer(t) = False
        DeadPatrolBoat(t) = False
        PlaceDirection(t) = False
        PlaceCarrier(t) = True
        PlaceBattleship(t) = False
        PlaceSubmarine(t) = False
        PlaceDestroyer(t) = False
        PlacePatrolBoat(t) = False
        HealthCarrier(t) = 5
        HealthBattleship(t) = 4
        HealthSubmarine(t) = 3
        HealthDestroyer(t) = 3
        HealthPatrolBoat(t) = 2
    Next t
    t = 0
    '**
    
    Call CheckTurn
    
End Sub

Private Sub imgWater_Click(I As Integer)
    
    Randomize
    
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    'DEBUGING TOOL
    'Print Row, Col, RowTemp, ColTemp
    
    '***************Placement of Ships***************'
    If PlaceShips = True Then
    '*_____________________________*'
        '*Player's Turn
        If TurnPlayer = True Then
            ShipNum = 0
            s = 0
            
            '*Place Carrier
            If PlaceCarrier(s) = True Then
            
                'show coordinate
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 4 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp + 1, ColTemp) = 0 _
                    And Grid(RowTemp + 2, ColTemp) = 0 _
                    And Grid(RowTemp + 3, ColTemp) = 0 _
                    And Grid(RowTemp + 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(RowTemp + x, ColTemp) = 1
                        Next x
                        imgCarrierV(ShipNum).Left = imgWater(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgCarrierV(ShipNum).Height
                        imgCarrierV(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is off the grid.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        Grid(Row, Col) = 0
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 4 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp - 1, ColTemp) = 0 _
                    And Grid(RowTemp - 2, ColTemp) = 0 _
                    And Grid(RowTemp - 3, ColTemp) = 0 _
                    And Grid(RowTemp - 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(RowTemp - x, ColTemp) = 1
                        Next x
                        imgCarrierV(ShipNum).Left = imgWater(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater(ITemp).Top
                        imgCarrierV(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is off the grid.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 4 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp + 1) = 0 _
                    And Grid(RowTemp, ColTemp + 2) = 0 _
                    And Grid(RowTemp, ColTemp + 3) = 0 _
                    And Grid(RowTemp, ColTemp + 4) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(RowTemp, ColTemp + x) = 1
                        Next x
                        imgCarrierH(ShipNum).Left = imgWater(ITemp).Left
                        imgCarrierH(ShipNum).Top = imgWater(ITemp).Top
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is off the grid.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 4 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp - 1) = 0 _
                    And Grid(RowTemp, ColTemp - 2) = 0 _
                    And Grid(RowTemp, ColTemp - 3) = 0 _
                    And Grid(RowTemp, ColTemp - 4) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(RowTemp, ColTemp - x) = 1
                        Next x
                        imgCarrierH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgCarrierH(ShipNum).Width
                        imgCarrierH(ShipNum).Top = imgWater(ITemp).Top
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is off the grid.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    MsgBox ("You can't place your Carrier because it is collided with another ship.")
                    lbl2.Caption = "Place Your 'Carrier'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Battleship
            If PlaceBattleship(s) = True Then
            
                'show coordinate
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 3 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp + 1, ColTemp) = 0 _
                    And Grid(RowTemp + 2, ColTemp) = 0 _
                    And Grid(RowTemp + 3, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid(RowTemp + x, ColTemp) = 2
                        Next x
                        imgBattleshipV(ShipNum).Left = imgWater(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgBattleshipV(ShipNum).Height
                        imgBattleshipV(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is off the grid.")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 3 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp - 1, ColTemp) = 0 _
                    And Grid(RowTemp - 2, ColTemp) = 0 _
                    And Grid(RowTemp - 3, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid(RowTemp - x, ColTemp) = 2
                        Next x
                        imgBattleshipV(ShipNum).Left = imgWater(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater(ITemp).Top
                        imgBattleshipV(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is off the grid.")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 3 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp + 1) = 0 _
                    And Grid(RowTemp, ColTemp + 2) = 0 _
                    And Grid(RowTemp, ColTemp + 3) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid(RowTemp, ColTemp + x) = 2
                        Next x
                        imgBattleshipH(ShipNum).Left = imgWater(ITemp).Left
                        imgBattleshipH(ShipNum).Top = imgWater(ITemp).Top
                        imgBattleshipH(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        lbl2.Caption = "You can't place your Battleship because it is collided with another ship."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is off the grid.")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 3 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp - 1) = 0 _
                    And Grid(RowTemp, ColTemp - 2) = 0 _
                    And Grid(RowTemp, ColTemp - 3) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid(RowTemp, ColTemp - x) = 2
                        Next x
                        imgBattleshipH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgBattleshipH(ShipNum).Width
                        imgBattleshipH(ShipNum).Top = imgWater(ITemp).Top
                        imgBattleshipH(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Battleship because it is off the grid.")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    MsgBox ("You can't place your Battleship because it is collided with another ship.")
                    lbl2.Caption = "Place Your 'Battleship'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Submarine
            If PlaceSubmarine(s) = True Then
            
                'show coordinate
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 2 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp + 1, ColTemp) = 0 _
                    And Grid(RowTemp + 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp + x, ColTemp) = 3
                        Next x
                        imgSubmarineV(ShipNum).Left = imgWater(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgSubmarineV(ShipNum).Height
                        imgSubmarineV(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is off the grid.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp - 1, ColTemp) = 0 _
                    And Grid(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp - x, ColTemp) = 3
                        Next x
                        imgSubmarineV(ShipNum).Left = imgWater(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater(ITemp).Top
                        imgSubmarineV(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is off the grid.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp + 1) = 0 _
                    And Grid(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp, ColTemp + x) = 3
                        Next x
                        imgSubmarineH(ShipNum).Left = imgWater(ITemp).Left
                        imgSubmarineH(ShipNum).Top = imgWater(ITemp).Top
                        imgSubmarineH(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is off the grid.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp - 1) = 0 _
                    And Grid(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp, ColTemp - x) = 3
                        Next x
                        imgSubmarineH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgSubmarineH(ShipNum).Width
                        imgSubmarineH(ShipNum).Top = imgWater(ITemp).Top
                        imgSubmarineH(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Submarine because it is off the grid.")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    MsgBox ("You can't place your Submarine because it is collided with another ship.")
                    lbl2.Caption = "Place Your 'Submarine'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Destroyer
            If PlaceDestroyer(s) = True Then
            
                'show coordinate
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 2 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp + 1, ColTemp) = 0 _
                    And Grid(RowTemp + 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp + x, ColTemp) = 4
                        Next x
                        imgDestroyerV(ShipNum).Left = imgWater(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgDestroyerV(ShipNum).Height
                        imgDestroyerV(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is off the grid.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp - 1, ColTemp) = 0 _
                    And Grid(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp - x, ColTemp) = 4
                        Next x
                        imgDestroyerV(ShipNum).Left = imgWater(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater(ITemp).Top
                        imgDestroyerV(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is off the grid.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp + 1) = 0 _
                    And Grid(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp, ColTemp + x) = 4
                        Next x
                        imgDestroyerH(ShipNum).Left = imgWater(ITemp).Left
                        imgDestroyerH(ShipNum).Top = imgWater(ITemp).Top
                        imgDestroyerH(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is off the grid.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp - 1) = 0 _
                    And Grid(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid(RowTemp, ColTemp - x) = 4
                        Next x
                        imgDestroyerH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgDestroyerH(ShipNum).Width
                        imgDestroyerH(ShipNum).Top = imgWater(ITemp).Top
                        imgDestroyerH(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Destroyer because it is off the grid.")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                    lbl2.Caption = "Place Your 'Destroyer'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Patrol Boat
            If PlacePatrolBoat(s) = True Then
            
                'show coordinate
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 1 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp + 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid(RowTemp + x, ColTemp) = 5
                        Next x
                        imgPatrolV(ShipNum).Left = imgWater(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgPatrolV(ShipNum).Height
                        imgPatrolV(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 1
                        PlaceCarrier(s) = True
                        TurnPlayer = False
                        TurnPlayer2 = True
                        TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Place Your 'Carrier'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 1 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp - 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid(RowTemp - x, ColTemp) = 5
                        Next x
                        imgPatrolV(ShipNum).Left = imgWater(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater(ITemp).Top
                        imgPatrolV(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 1
                        PlaceCarrier(s) = True
                        TurnPlayer = False
                        TurnPlayer2 = True
                        TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Place Your 'Carrier'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 1 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp + 1) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid(RowTemp, ColTemp + x) = 5
                        Next x
                        imgPatrolH(ShipNum).Left = imgWater(ITemp).Left
                        imgPatrolH(ShipNum).Top = imgWater(ITemp).Top
                        imgPatrolH(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 1
                        PlaceCarrier(s) = True
                        TurnPlayer = False
                        TurnPlayer2 = True
                        TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Place Your 'Carrier'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 1 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp - 1) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid(RowTemp, ColTemp - x) = 5
                        Next x
                        imgPatrolH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgPatrolH(ShipNum).Width
                        imgPatrolH(ShipNum).Top = imgWater(ITemp).Top
                        imgPatrolH(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 1
                        PlaceCarrier(s) = True
                        TurnPlayer = False
                        TurnPlayer2 = True
                        TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Place Your 'Carrier'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                    lbl2.Caption = "Place Your 'Patrol Boat'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
        End If
        
        '*AI's Turn
        If TurnAI = True Then
            ''Call AIPlacement
            '*Place Carrier
            's = 1
            'Grid2(Row, Col) = -1
            '*Place Battleship
            '*Place Submarine
            '*Place Destroyer
            '*Place Patrol Boat
        End If
    '*_____________________________*'
    End If
    '**
    
    If PlaceShips = False And GameOn = True Then
        If TurnPlayer2 = True Then
            s = 1
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                GoTo C:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                GoTo C:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                GoTo C:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                GoTo C:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                GoTo C:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'change label
                lbl1.Caption = "Player 1's Turn"
                lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                Grid(Row, Col) = 7
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
End Sub

Private Sub imgWater2_Click(I As Integer)

    Randomize
    
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    'DEBUGING TOOL
    'Print Row, Col, RowTemp, ColTemp
    
    '***************Placement of Ships***************'
    If PlaceShips = True Then
    '*Player2's Turn
        If TurnPlayer2 = True Then
            ShipNum = 1
            s = 1
            
            '*Place Carrier
            If PlaceCarrier(s) = True Then
            
                'show coordinate
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 4 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 _
                    And Grid2(RowTemp + 3, ColTemp) = 0 _
                    And Grid2(RowTemp + 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid2(RowTemp + x, ColTemp) = 1
                        Next x
                        imgCarrierV(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgCarrierV(ShipNum).Height
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        Grid2(Row, Col) = 0
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 4 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 _
                    And Grid2(RowTemp - 3, ColTemp) = 0 _
                    And Grid2(RowTemp - 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid2(RowTemp - x, ColTemp) = 1
                        Next xX¢SÓæ
¤3„MƒåÎ¥°@Ö®/ò€¨>ôK„€TŠç< UÀÄÇ¡™wSÎ«w¡il1Â¦|şDø"”‚eAÚÄo!¥¶v†ºã}ûƒÔ.ïÇËóÔ¤À‚X·«‚ã°¡…:Ê—êÕµ%à
¨uó€ÎyŠ fÆ³XÊfChŞ‚k•?6ÎSÛcpqìh‡¦·]„ü›õ]N-K®ˆ­¯Èö¢8$0geùàv´ÀDˆ¦$ÃÿŞJéÈ=’ÍYÿ‘ŞzLc<UÚºäøs€‘ğˆ¡^
€î·¨¼¤˜YC+îg–€è\§ğ{¿ÃºÕf	ğ]Œæ”‹æQBtŞ@^e;3…ñ„¨©bÔ õ\ ËüKJ\£€]w³è­)«‘w_¶
wôòë:öÊâ‚–B‚÷O_±òw(d$ÃAŒ
é2šèc¨áÀ[Çõ*€õĞL<Â²d2º7X€!!ïÎ#£¾Í¢Ä=†"S¬4ˆ¢-ƒ˜å4Áıír‰øÆ®Zho=;U†+ìJZ?¹.E—¼‚5Ö‡A§*LúÌ¨¸u‚²¨¿n­•¡Ü%Ô%ÈÕ±¬Ê^š÷–CÑbˆJ½ø†d¼Ûã1¥Ú,P3>—½E¦/é·™¤“6’ğÆA&š                      imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 4 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 _
                    And Grid2(RowTemp, ColTemp + 3) = 0 _
                    And Grid2(RowTemp, ColTemp + 4) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid2(RowTemp, ColTemp + x) = 1
                        Next x
                        imgCarrierH(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 4 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 _
                    And Grid2(RowTemp, ColTemp - 3) = 0 _
                    And Grid2(RowTemp, ColTemp - 4) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid2(RowTemp, ColTemp - x) = 1
                        Next x
                        imgCarrierH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgCarrierH(ShipNum).Width
                        imgCarrierH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Carrier'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Battleship
            If PlaceBattleship(s) = True Then
            
                'show coordinate
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 3 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 _
                    And Grid2(RowTemp + 3, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid2(RowTemp + x, ColTemp) = 2
                        Next x
                        imgBattleshipV(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgBattleshipV(ShipNum).Height
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
             €h  $ $  !0Lò,|@ aTo%Î 9 °2RGV&b$ 0p¨  ¡     (°!00p"@.acb@@r!@p(É|)S­ ½ FãduI
 0  (! #$  0! 4`¨ $ &(38û#@Ü#r M((PailU(e  L~a 0rô2u)XPğ.AR( ¢p¨PIm fdu”CR($*Id#%	0 `           `  (  ` HAgPat0Òr(ID!^x)b0hktuDeh´ IlA iaôÄbeh P0"@ğVh0. :LMmEcAsd'a,t:HN#( ! €  ":   p   ( # haL c p¥`oæ((0"là#G QÉyr0£Beulasip*&-!((0   * ) !     &  ! FïX}"¢ZÊ¡   ( !`  `%@ @   E‡dHd*,   (   ¨h 0       Dd¤B6$À¢  †0   $   ` ("0" ¤dG)aãbphÇn 9""A C3~%d  @Yo Dí –HEDkrj Ep   c  0 b8  1  !" !`p`aÃeFi:#bôhl 	`%!=€Zajsa	
â„!(    0 0a 0,  B A *`…'W#d¥r"ˆ(QiiÄE E#w3
-f.>Urµ`Apx%U`å. Â\MîAg 9]X¥
,ã)C 9    €(!0l !   0 !     qlGQt.s20	T!m,$0i`tqPa -GAôSicàuJ$)“ 0.p`b( &8|	maó$@YGr=d`:giF ,	
 `  ¢ !  d  8`   p¢  dJh2.CağTmO,!U€ª l@#e Aver&CFsf4ámRè)0&¨  ,`     `b  0Ğ($#   3†FnbBJ$!   `  p! ( $` ¡ TÎd Jäj0` '   $% ä(d`$ d"Erf€ÁV	
à "" 0 ` !  ( !°   fäqî	ˆ    0#ˆ°a      ¢Td&ow : ÂU”åMb0@%<MJ  ! 1   $¡!    (  X6 rÍTíQ¬ &ò' 0 P)ab %le&a MBYD2{;ÇÆSš/q@ÂU&êİ³µ~mŞ§YvbñóÌ}"ÅóD ³ü A¯à‡Qx‹–4o›\B|€Ït¨~7k
Ê #¨é!®¤š¶ár†ºãI™€•À“İæ—¡^×îîCY:pG£D¯.˜†ÑÇêÀPµ×^5íQPË©Í×† 0ÔÊ 3¢×®Î‹Ù[4‰*iäèpÒ«»°Ul …I¤‘Ñ˜Å“Õ°jg!M6¥	øXóïÉ«ˆƒÿ#ŞB-`XÈßöÌ6¹øLS:<SAş«ÔtÄö–ø…S"d 6‹Pü“ ÈDç‘¡Õ‘‚oÃÊWgJAÙ¨à£.1AÛjNˆj{råPtÁ­àw5tyòÜáK’O>Ñ¥]ê˜WiLö–œô‘ªìäÁÂñÆBã¿#4¯Ğ‹%#²ííî†“¶0œæIÒÅƒœ9Ruå" #Y
q“³Uh»XªX¥–ö¤È€}ÁIì];SÜpÁQh³«å'ÃÛ3şè›P¼RAX3Uxô"\jÖº:Boš†4Ö‡Á(Üÿ“ÄŒqBĞ°÷üû<uY‰ä•8ã³ëÚ…ŸŞ`„şQ4S€ÎñÂU+"¥ÖX4¢œjb_yü ¥R`õŠ>ôÜşÇè4HPúu‹‰èÄ5¥„Õe“OmÌG‘XfcÑóiwÀİõBÀæ¤A|ÁƒÙ7åô}‚T¬‚ub@‹W_­FÀ^¹]¼FÃÎeÜ…^ÖO%~—Ak¹ƒ¤Nïçë£6ö ˆç=ôJğK£US€|ğVÚÌOÎsW F»3—™ÅK€İ¨Nu´Ö%õ~çÛjúVoe.Pbzææîš×uNI$ŒPñU@¥—ÄğHeCl' !_*?:±»@ı_©¼wĞäè1ÿsJş” ^sF`²ûîiÜÕÒÜŞ>ÚFÑ­ É€„ã4¢LúAä…Í=Äƒ^`ƒê¸©Ì4‰…êuß@hn{BÅô€tãâdóŸ×ÿ9ıl@0ßÁT!¸g¢{§ĞÓOº–ÅÃ£®Bñ*ÉÕ·pmÁÄ5„hëÕCuST1¡G´±îTôÔğ&¿şğ¹£XdÚÒ“f‚{6ZŒô@X! `R&¹IÑ*7ÚÑÈŸÓéáİç¯IÁö· óÑ¹RYÌ;g}ß7m©·=*@»œ£Öƒ@£*zìº±"ã±ğ<Ñ}+¹Mğ†­˜Yº ´ŸağßUù+¥µŸ#†	×ËÑÈ=²Ön$¹¬Aç‡©£ó‰Â*Y±(HaAß°ƒhš»ìt&[+¤Í“Z-ÎgÒçbıWél “’k­×¸uøÓ¸€©•gG«/‡úİ0Å¶Ÿ2éšHºF¢ˆaÔZâArúaˆâÂÃKm³ˆ›JzÖ¸®¯YÜ£Õ!£Eó½M¿Â}†®€.í¾…Z¨p*Í»ŠÉsÛ>"69Æ¤ï#˜6OúcÈ{Ìy‡ÄÕ©–ßUîë®úÑıÅÉ—Ìùje[eç6eué¾z¥ôš®Â9¿²l‘Hôè;\Îà Y½Ówt{LaÛóëüIÏİœŞŸk&ñÍ7éİğãSİ-îTÓ§
Ÿt\r¥“f‘³¾ƒ¸•&Âa.\Ö.`j[sÑüğòÀ/àuÙ›±Ù[·Ñyìá¥9ä}F1×+u¹¢çŠŸŠçóô‡ËÛzÅ¿"!u6%„ êÔÃqSO/îW§u£ğ.—Ü€õñ=O¤âódšx7XÍæby­à@êŞôo»²ÚH‘ÕYµ c#$ QG¡#s:Ä†R‘œG¸Zßq™BGÛ¾7LäÆ:÷Ë,êoıá9‹ dºØ³³{×œÅÏ*ğ^«zA#èˆSºayQ3œ
èí?Ì™Ÿ|¶“u)!Õ,ôPi##\á<Òù¦u›˜-zÌ	å8wıKùC+¥¤ı›~%Îƒpòb`ûcál"âÕRí”Öñ …Ñ‚ˆQÕñ<CN¦WvD®]=(0‘–gyìVü] ü«iG!ˆ¥8¶
ò§ºƒM¹£‹À?#ŠÃÿ36ô¤1,}|j”K£ÕS¯a›“‡°8®“=ëF+²Èês‹Ô.–°­!:ç¿Î*í¹lPs»@ yó®„P `0ŒVFk%ŒZÑåÀÌĞje[dw6aërq½/w›İm±»pª3¦Œ2á””ğy¹²>áKº“û¼pÌõâØNº@DQ¥b“KĞÌïİy­Õ…>µøõ/'£ÁÈ"…9¬ÛÜï(³6¹œ{j+sW´ şT°ËÉÀj±t ;ã:}vŞf|UÁzåwÉx£~¶_Å|òëšÖÊÃã†Bó¿¬™Õ»QmuhC‰éGÔ$(<àIC„Å¡5àé¢~jpèõØo-Xúºdqè9>YnTN¯¬’øĞºKùÚC>qŒ(¯áaç½¨b ‘ù¦Õì
üP Kj+ØŒ*d%›º9gm¿¨Òl|ÚõïàjÎ®Û¯ö±SQŠÃÂ»_ÈøüĞ~ˆğÁ³‚ ¨q¹oVÕ˜*Î­ÍŒkäËtb6d`?fwùÜ`õCnqÜË\L~²şËiüšÖ1]¬SÚÎ5K¥„¸[ÛÂŒ™^ĞÄrÕóé(
Á ”vé4­ôÄA™‚(aÌ†WRın9:0 6ovè%¡{hZlÒ.m±Òª„ör†ºóm»"ƒ¢0ÏçÃ›¾„â©Dw”ª*kĞ#ËHöÒÑâÖÂWcÄ>Ç~,èSXÉÉít!634•jÁ>JÑÅŠoÈXr>ÓğS’]ğá£³Ÿi,‰ùñsç rkE¹ñ³ÉéÄFb-R bvdTåU2õ÷Í©LCÛ+Ş^êè)’Î9ÛúP:^6  óÉ´™‰‰¨Ãz]U:¥èM}ÁÙÄl!£v§&æÀ^ÇğO-óê«oaøY^æ¤)NŠ&3œ
zZ1²”´±ƒ‘Ë u³˜‘j8_º#7]˜àÖ„„Sf÷&Eõòë¸öàã£SãØbXŒ²oX,gHÕÊŠçÙÏÀPªrÙ‰Ğyç¯ñ*°•}.Æ<Ëñl%ºx/x­äFíàhâ·9hwqXQušbAÃ·&›ëYNÉûıx’˜ß•ä:+Âi2ˆ2H>.~Ô9j<ÕøÃùÔşÑ1Ák¿~íæefeûıàİU¨Ä/Ø~£z‘ãŠËsÚ©ùßQ’¼ììšâÄ(ë›Ÿõ›x6jWäüÙAÑ›XÁÛ«¾ônšš¨=`D}åX<Ì†RÉî9+ÏNKÁœUÚ{|qÎ±ÑUÒ
&Ãï»*	KÙ‚µœËé?ÍÕØïİõ¯pRš«%Vİ®88–ó¨5	ëî k¨ìG#êïx–qv™ñíÁnÃ¶ÏïÊƒø¤ëÃ,ØêÓÃÃt·M»Ã™Æ.nUıMÚxÁƒÈo©Ùc: WòæE{pÇ'éÅc±+æAÖJYüø§®G]â
«õh\,]é ¬şğí€ıùÁ MsIK6uHş×îœ‹1ÃşŞB«Éş²Å µö¸gMÁf‘È‹Äy¬Õ»¬˜[ÇÍDqi¨xªk©O²ğ‘Nÿ“zCb¦«‘	’;¡Ìœê'âfTÖpŠLªûÂåàğT£ïÉä1<<•Ü²XC¦@BáÀ¡z Py2=„3Ë§òòš¿SÅí4¨éš8½|Râ¬dµ‚¶0\H„D…ËÑ|çñ>)çÅ?NîÄ·E!A¸xk8È· ^ıáë¶¤	­K1öyÅÑè“í%&Á›…sßì¨üR jñ¿8ka®(ß°9=	ïÃ4}ƒe(c5öñ‚³ÏPÿœZ4Õ
d+²»Z££è‚Cº‘r”h<I€ø\L¬3¿Œsõ¿Q’.’ø µS`¡Ÿ*õWšûßi6	0.Ú_­PtIoç‰lİ[v?Ãµx #ª2Æ^b²"€”öÉ©
Š@ÕECÎ OTäbS
*¦ó–'b©K	zìxçé
3õÉMôUµ£¡	¸a‚šjãÄî›·ö†‰¦<ÜÈ`[ÃUs­E‹â±†
€‰*ÏÊ]Š¢İ‹ùDİ)ÆhôÛsw8ÊÚK¸eC'¬"‡y óª‡”²$›×uD`d&D«ÿ’•‹½ş€Ód6"UÌ#Èz˜5îmº(IÿŞKËèp9²Yó‘W4 P‰¡Óì‚ÕÕÆ‚a˜A{á˜Pˆyæ(rA§“Âø?–¿ıKQyŒäèÂJëvgªg	.I|£±¶öéê«àt1YÒüSËX²
]‘à­)«£S8¾*ƒ–èÇ’öÉÃa†bó;<É×ûqmuPŒÔ‚ÑA×;T
€d¥ËĞLçÑ&=°€õğ=L<êz(eöj¾4ªŒDş¶¹lÛi=IpXÁñI÷­®EÁÛ1ßì*P¬’"C*39xİn `÷¶jÇİA~…–a>
8»®ß‰œäPŠöÜº}]=ä+à~«ZãèÈcº%ÙŸÛ<-‰ÿfÿq–Ær…zU•³ZLÕa-¨…î¾•7˜¸ÿ)`(X“_ò‹’©08ÑZ	Í»Ç+Ì®<rBbBñSÉl&Á“ ²Ö9­‚˜aäáƒ±2‚€¼‡Adœ_&¦aY]¾A#—É**Í‚¸¿K&ó¨¦-økSŠ~ÕË¿Ê½6ôØÁé5›ÿ£'ˆ:êO™¦XFŒ‰5ş‡FØc|‰‹<íĞ'!4´Ë!&(Wâ¬Gª¿ÕG§J‡üe¯®Ü´ìù´3èÜ);I¬¿Üé˜¦Î–ø$W'Y£#,7“UÌûN‚_+ŠJ ë:ZÖö¡[·”NU(%@‡šå¼Ø¹í‡ÒßºwzïÑ(5ÉœÈì1·LÆˆ‡p^†/7‹fI·&Ø­”Í=_S.TŞ@.Hê`µ ğĞ‰è¤¡\UœøS#vªø9.]‰ìø)©ÑSOÖ]u²ëß²ƒ†ƒ,Rs¾.éÖ›1mqX‡üO¼3Ö0~H¥ÙüŞ¦Í¡ëpş‚ığ?%8©µIbm:z)’‡µH‘u]7eš\YëÙ@³¯E¡Û¯³ßìŠĞüRf@`3YøìJ?şÚp=È¯yQŞ†\ƒ?\œ’HË”gz 5¼ú=õ
ä	Ğ~«Z…ãèÊ#²-Ù§ñPÑ(“J±ÈœujÜÅœ¼Ùhq2Vb¹tA©#(\ŠÉÿÜÉ»Ã<Q–Ü®Ö2–¯sö}§œC¡%¥8åùEzñóYl BÑÒ"ƒ„·ù­‘‚€AµÅµ
‚á$v—ëK;tYd‘
.¨E»B*ôGEÃ[$8Òe±+½AS&Ä³Š·ğ¦ÕÆ°Ì¡×mÖ	™ÎtÍüâ9§>¯ˆ{şÍ‰íÔ2”Wt”Î+60W‡'!+Ñ9'É)æYã®w=â-Ø µ'à³‰Ú°ı¼¥–…¸j÷ù#e›M)é:¾ôËí»Å3ŞJÉé8;Ÿ²íYûôU*<ÌG:,ù³û¬çzÜâ6JÑ¥ ÉàìT$Œgæ¹#ü§°~
÷‹KÜ]ŒG”«_¢q'š`'.QråúØTá®ød1V9ò¼W«9Š²"f˜Ñ¾ŒÃ¸Œ¡s_ö7¦ôùkºÔÈÓ‰†jšÿo†ûkM¡ô¹Ã?l0eŠf•ËÀ_G™p:?°€uğ?ÌÊÒn$mœ5»Î©6]åøCÂˆ¬	ÙjwP\W ¿2­ëq$#ºÛ!İºË5cü3U„â,J¤›ŞïgŸ¸”Ö—Dã*xÓ‘ÅŞë4 ßõi‰(Å”gğ$¡‡¥Ú¾ ù›QM»!ÌíıÎjn×rô“$´`f7è•U¬¥4JPåô‚ü»'üÿ‰9;Øx+ˆ¦b«k7:Æ2Éí8çmï?±yÂFaqÓùlAÁ’B¢´ô˜k)“íÚ ±ı8±›‘"Q/îIwÜ(2Zğ!(Ÿy!®ºA8¤ä0öYs„:ío¹cƒ…OpßË»µ•êm¤\®ã°[«#0ù¹Ú»cª®ùfŠ(èŒpÉÄÉİô#ëh1xÊ(pnîï uzGs¾?xÄbò¥Kõu {%¬ú±ıâí¿ìğje{dfveíVX·ê”J+é3dCèøşóİ4İHR{LA7I“Ê?­´š•§¶ZsÑ± Ìû¬q¯Š@ş¥ÀN'”[kåb#äl»æ™©Wâ7[¶@l§jZÇğñTÅ«ÉˆMqv5öÌRK8&²!¢Z™è±]"L¡»2x¾PµñòÈÔĞ°£¯Âó¿.,ùõ›p}uAe\Ã=v&0\H¤+IÜÊ<µô¦^{µ²ùğ¢p¼³($d?xkq?ıJOÀÎ@Bö™!aq?bÜpáÓ(³­eQû¯_Ø¦{P¥JCj?x¬"H
5›¶©ke¿½²´<VŸ'‚+½0Ì,áQ±~õ¸Tıö´­k+ôC¯“17º8óö~\ë[è_¿«€m+—q{şİ06Ó}7°¡|—¤ék“ÿâÊ¥*ñ…\LÌ¶¸Zîã>¨Œ}ÙUjç•C}vŠÆÑ6«jsöÅà)TJì¾R¤”öï'­™‰AÙÅ=Cî¦FÇ¬1èxñó?3¼t)Z=r§P/¢Úh„Êë |r±“ì #ÈHC®³êá$üİçuãş?L^ÅÂ1”†‚9/ş>§^¾ês0©üt£’Y<vITiÁh‚|àKV®@ûc=yJxcğrdLL¯õwNUkŒúQç@ïÅ°Jf_t'vb] cyõ¼ıûHªü&Î8ŒèeXmú£¼Â»š~zM`$qSqûèyÌwÚö?X&s‰ùY‘s”5ìC6—ˆ’âğ/p¢½&=P¦ú´¯'Ê`fDÌ@hjkPäğğdá«èdq8±Ø· zH³UKŸóë)	#u7¯~®õrëºóÈÃ¢¢êó¼*8‰Åšl7P%„´¥çN°œS=±UZ{ËéXäı¹+lıØ{iyÁkº >&ÎçD¿Áğ ²¦1¹yz?cØqÁÉh²¯ˆeÑû¯:’¯ğ;¨rA`[vük^dÙØ±rEÿµÇ`-Ô·øz´¼ø¿8òÿ´¾<çqå¬j´?º*æ¡£ÎğB¼Xó:´%à›ìµŠj~Õş0ô<$`fWİü[ §Z)|÷öŸk¤f˜R¿$xX(Xİâ…ï*5.½TŒ›åZ~
0œ‚¹ˆ6Dš¹,…È ^Ø˜±$¾ù¼Ş1•;$ŸÈu~è}(à—w6 5?cZî*#êèG¬„hR¦éºeµ‹6ïûš6êŒ9–¸İjğk‚T2Ëœîæ&® 8,®<7|ÊsØÍÍép+–!4­ÊíptÇiE:ì\H3îB*¨Ü›_Š^;6uNã•ìú9­Âï—àğj=j$w>å=Ä{Z5ÆTšêm·¶$¸zêà ÔŒ¨œ7dyLcÛúì[ÌµÒÜş~
n±å ·©™¤v’k4êê=¼ö>GnåßÁc)íıì©õí×«!‚ì 2NÕ±¬å¨…ÊX9¿¹7_~D8SÖ )¢2‰#3^öb¥ôâï›öè…ãæã­>Éå»  £dĞ­ƒ…
b5
ÓŠ”/µø×7ÔÏ44Q¶‚Ñ$-(gt½d2ìäPáÎÀÉvJ$ÿ~ª1íëlò¬êoNì‘+_Ì XœBG*3"MN³ş8_E‘şÊôöÇ£¼ĞÀxµäÁfõøÅşëì,’-ÿŞè†¬‚hú$ãl	lÍ½Ÿ*N—p×’$@fÑ°ìÊæ>a­6¼ô6¸8ïat(8–ªr³î4¥|$À]Lv¤TMÆ/yòfzáóé|€é* ´–ŒMş AÕ…?SÎOVÅO(Ğ–v65?J~¤l¤ªN1üİWæ©}†ºŠ%íf­£Î<ã‚¿’J›¹©§4N°
¶U §œˆ®Î
=ê_7^ ˆgXØ‘¾­Ô#‚(t´Ê1nôEç¬cëP52»ü@jåx’®Ò<Â¬¾ØN…o¬Ú×üÂ‰—Àºn|_äG6f9ğê˜‰âŒßI±ı+¦bÿ˜PzÏçË¦:2½1!|˜åâ¼Èt†€°N
B±5Û¥¸¡äës€‡¸4Şyió²îiĞ}¤~œ*#âqFTŞ`(N{ráèüPaæì®S°"h¬K#LNßWá‘û8üLÄN_¶QŒ›è®î²‚‹æƒ¡N\½ºtmuDäü„ÄSŠ1`´<¶ÊTüÓüôÊ¶áŠ5°‚Õñ-L<öd¾x'\´`_­¬¦³Xˆah’ü,Áòÿì­@'ô´Şa_#í4¨"m¦h{ªlNoŸ¾9mMŸ‚4º—W›*\zÈˆ´Np ÔóŒrıw’éô~«Bòì
cş%¹ßA;¬ì;íİÊUJ¯“²Rõ’@GgWü {`ÖÏ¾1Şú®­˜î8–yšRÛn5¥+–ı Íp~„ì¢»Xòn2øòél Á²f¥”öªîô¾¢Íöå5nÎ†RÖ…®	H –F£	gyAğYoœ¸ä ”ı³C¹*i„.¤Îäë•ô¤­Æ=œèğ{ªe{ÿ(ÚTêB°%¾@4špÈÔ‰zŒ˜p³^<Ê!68÷æÏ˜<6P»C`yì0Êì‘Lbåıç}'%	ŞLm®üïÄí‚äŞ-‚e5LŠ•dQ›	ƒ¿+ÜbÏ¼pÜçˆ“öz>Ömf\Ÿ°òÄQÌÔÂœÿ6jDõ­ 7éĞÀ±§H
$¢Å¤SµG˜ÜÊ*ÕZüÏŞßò¶4FI–®.{;4d¡¤+à¸4=<†ôÅzÂèf8 íúÍÎ,ŠwBİ³gÌ¯ÁÄ×ƒ†B÷».èÖ»y|P¥„²Ñ¸²5q,|ıiŸ•–ğ|×Õ [°ù©¥\9è²{(¾(_1ÏáNÀŒHâ”™Éq?B<Şx•ñH±ªah€3»¶ªr|X cz3Y¬fDJó¾1*›¬ïv¡ş·AÃ
|Ú³Ìˆ±,\„×¼úïˆÄ+z~Z…÷èàCú'ÙÃ}2Ÿnˆ|¿xq3¤•‡#ü’Gd4a3Öôt ¤R,˜Á×‰´VœÈïi2l“porary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Submarine
            If PlaceSubmarine(s) = True Then
            
                'show coordinate
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp + x, ColTemp) = 3
                        Next x
                        imgSubmarineV(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgSubmarineV(ShipNum).Height
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp - x, ColTemp) = 3
                        Next x
                        imgSubmarineV(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp, ColTemp + x) = 3
                        Next x
                        imgSubmarineH(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp, ColTemp - x) = 3
                        Next x
                        imgSubmarineH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgSubmarineH(ShipNum).Width
                        imgSubmarineH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                " 8A–"	,:‡€5E.x¬¨&,Nôà&\ïÊ.^lP8e%6vP&²­È 1"ª T@‰=@0r¢ˆ`)­¡ A0 M’-¡@E
 zˆDjR*Œ+	B@h€É€°d(F¤M¼`eEBO:TA«4„Y@fBA‘!¡- f:¡%+ H  aFH€@™š €a 8 'A0G ‰ëËRœ`G‚ÒAu°x%iS 	åP 3¡ks°Â	d`8!d¨ b$ğd DÑ D‡ÄCt$jf°R¨4Cp¡h˜ª#(”ær  à`„	6BD@jfK†Q)1„1 €E aQH '
 `E8Ñ8Á4I"@8Ô(`*4`p4”0¤$¨º¤PVi0+ PòtÙ3¦z8&ã@B„. ¢ @2 F@ É5šƒ$¬ª0°@ÀAáOa!%„íjTAT& ‘*ËqÀ ê¨‡!B …Dä%!€rs9A!Lğ 
`	P®†Q`o¦;!(	€‚(çÅx*€½>Ø"!"°(ì]Ø@¨ø@)a¡ÀD$ ¡HXE¡â‚B8'IÆhKJ 3¢(d0äsÂˆ$ £1 Àt1 2b.Séfe (mÄD8Ğ ,!ˆà0dpI€*X; &AtHô`M¬•qpÒ@t ¹  HR½ETä¡TÂT("£v2‚N!
&! à1 @$` À•"R€
¡ ¬ÈF À
b4ä@Ävä5¨D2ğJ% J:ps@,° 	FL<¤P(Q‘t `"ˆ@v qÀPÁ1 ¡R!’HCLåPMšÖ°@,ó3Èˆ:+B %A  Q7bhÂkª‚`%°’4  +2 E’­¢¡â Ç@aÉV  Bvæªˆ`D8	°
j( - A5@ëL‰?¨6k0q£‚ğæPRz°À2M:du2#R! d ¡
 h(” €Å ­¥ JvchªØpÈQ!t¡4˜ŸÂ>è*_$(è@PŒ Ae,A€H` ‰g 4ÁM5p@z×'ÀA¸ !e4 ŒÀlT±@Tu"!jI€p)…@kâG(H` ÁG"+ "8áî2L*$‘”H€B!@€±l´€€ ˆ %²Ş$¡£š)È@$pF™¦ H b6Yh@làlHHÂ1 fY2QFK$DS/2ñ»‡§Ù9¿+Ù°Gã°\Âc ×ZšORĞAïJ"“
àåé&1¨ G×ís†ú›rvp(':p¨£&p©/sé­'£Ù9G'Übc!Ââ¢Fš ¯†ïËÈò–ØÔºšuìb…o©rG‡ù‹r§b2Z¬«7t,¢“?`©­t«’·äİ*!6X†b«Âq°ÖXëÆXx›Ş¶NÌºßeí*e¡lÚ•ùƒá‡øÉrg{dc2a(¨Ê8uíïøi!·'İ;§Ç˜"¡QÃq¸ÖéD
§ÛÜú˜yÜüÚ6êfí(f‡ñŒp‡i&¢ñ¬¢2p|#‡#zéƒ/ği½Ì§Ù=§'ØTòc(XÂs•ÕĞeÄèQİğYÒÜót¯bL)b‹y‰r‡¹v6pî£4p¨³“«ğ£†k÷û)¿çÅ93å]bøSÊc VÄ­KØršßÔúa¡qÇe(rƒ–qryp¶dª©óP,£…?(éÓ/vë?·µÑ™§İG# Ê#àÖ@íRAj[™YŒÌò…¹¹{Ge©â‡y‹òñr²s¬¡0rì ‡¿øiƒ?èé¶Û:³§ÉÂê ÑÚ !–2ˆoÇšˆ¥ZŞöšQñòša!cwéòñK`—©‹º¾ğ4©rc)¥€<v©Ï~sÛò3`­#"à¼§ƒ-pé‡¯qi°¦'Ñ;í§IÃs Àö Ä’ˆïÖˆç[Iê–[Öáq)b0 b‡9‘Cz‹r2ğ¨#2`Œ²‚-p©ƒ#`é+§¤Î8ï§ÛRö€ ‚¸ÖPH§UíÈ3†ØùšD¯"G-èsË¹áÇ9†a0Ğ®£6x­'ƒ/hé/pû9c Ùh¶§ÙÀBìÇq"Ì­ÒïCİ·ÂPÎàše%vaèB‡ü‘ê‡ø‹{#r®«Í8­£ƒoxÉƒ/py='&y·ëÌÈs°Âc ÆÑgÖ)ÿÉQ³|â˜eìc›g&+—‡ûFz†ù‹r²9,£2p$£‚.pêƒ?pÉÔ÷ã‰9²d™ÉâèËa ’
mÔˆ/ÙÜ¢›S\òŠw¥`Cã¹rG‡é‹b“ù‹2¢ğ¸¡5p<§,âéƒ>49}7§Y9·¯ÙÂ¡°Î` ÖmÖ
€o1Aë^1ZëTl]èPæ¹ÀÍØºC^öƒÙi½†aK££Ñ³¥!H#1aI#iiHaoIéœK=5v“cS)^ûSĞì‘úPäÕ¸ÖœÒñ„Íó<Šá¼‚aÙ·/Y3-¡y¡%®Mãgoh=!@J¡šKÂ!3R+C?ËªÖèúd	x”Í9Kjr»ÏcV•äà™dô^MÎ£•ÉÂS¼é<‚®aÛ##Ø£'±K¡a±M£aoÈuNíH)´Gˆ!9[k¹IkÎ‘ä	è•0yÖÍÊóÌ³¤c½‚ƒ0İµ©Ù³&ÙáÃwa¡I³áeÈë„mJoŒ_!ÚØ¡8ÙoRºxÔ$xçı‰Œ3SËó`AŒ`­eÊà«ÔY7&‰E¡{¡I¢ámÈimJmGA [ =ÛëV1[kVìxìøÔÍÈztÙJ…¬‹1ºÆIàÑ²nÜÙ*f¡£á¡Y¿a¯HêdÀ`ŒQk"Ëˆ)	kèU­F»æôTŞ>LNJòÕÀÈs ‚a´aÙ³'Y'"£I£é©I¡umIi­åLk…ZÊ©HJ£5Ss–9]ëÖ‘dxeüÀJ·ÖİNë¬Æƒ1ü‚Îc™±.Ø£'Ô!L¯á¡a£ahXa˜mHkìÈBá–Ù!yK?S=İaÖ`“édğÔÍÊûÔÈÚó¾‚Ob¼ÍdÛ¢'Û³¡Ï¢a$I§aeHh{JéŒK¡[X9ñq	V;Øo’äøRâœåĞİAóÔOÊs¬ƒ%<ëÑ³¦“'!Y³k¡ãa-HéŒ-ĞuˆRKI5” s ïY{Î5KíÂ˜!O-şÓ{^°CkR‘à\xàhÄäÂóUÙ³¸‚á<¢ÏåG÷g™³+±'! 	%1ÃmŒoÊéIœ –K 9Kk9ËnFäèdü”ÍˆøÒÅkó´’i¾‚‡åÉ³/İ3'‹É³ğ©	3eå@i]Èë„Q-†Ï¨=[#S;Kh^Áü‡ºüèÕÍHãLÅJó¼Âá°ÂŸåÑ²'Ù·6)Èã1…Ï amHákJkŒšH±’É£¹[V)I&Ó¦ØìøÔÏÚòDÙˆ<Àá¼ƒ`…7§”Ù3'X(@§ã¢ËãamL,Œ<-ÄG¹ O)RDÃ©RLC¯¡ÀØ1wAØşãK°é ªmaÔ¨Í,\ P¼VR´\‚×
Dı×ONüûOA{¹UÑûE[”uT^¨õRÌS­XHF­sÁÊòÅó¨°à±‘%e|ŞâÄl†ºÜ¸Å °Ÿ€CNÌùÏ@ì¿CúóEÑú—ÉŒuÉŞıSÌI©PÜS­sAÚ{sÁØr ªö±£ãìÆzÜ|×k€0 °	×GLıÓNÌı»ÅÁÛ»Oc»ÕÙÎ÷ØMØ¿R„/XNÍ­/ÁZcsÍĞñ² a¡"áìÖhÄlÖ(À°°U_H¹×Í|ÆjÄšº
 İMC}ÖMÌı»SĞ;×ÁùTSõQK”õÒÉG­rÎÁ¥qÁófÃØs¡"c) ãmV(ÈmÖjÌ° 2ÄM¹SÂ^çi×Ãû®ÀûÅË›uÔ–¦VÜÃ¼ZNSµóéØóqÀÈñ©¢é¡"éTÔiÈ~Öz‰’ \ ±×OÄÿË	t³CÛûêEÈ{×ÛıD[œõWNK­REÍŸóÅÈá3ÁØ[¡W"a4U1éhZpÎdÜ«LPö˜±Î“]ŒıW›Ô}¾KÁû+UéûÙØ˜ıUÓœõRHC¥Ò(©ñÀÌó·@Î¯§•âá£&a.ÓjÎfÍàL„°‹°U_LıÂOZ•ùÑĞw©GÁËUœùÖ_œùLƒ)\ƒè)A˜q!Pÿ¢·á ‚ódÜêÌlÒjİ½°]WMÄıÇoFı>GÑë£GÁóM[Å•ÓŠı@ÑôWL«rEL³;Qû¡Tâéé áìÔkÌ`–*èğ¸‰ÇEá×Ï@ıCAú3GC{W[µUIu›mQ^C¥sQØósÁXq¡¢á±°¡L–ú\·İ¨Ì°^±GˆÃKN%ß_]µ»GÁ{›ÇÈãTZõUQœ|FLc¯RÌC©a…ZBqÁÚóˆ•"è£"äÖbŒİ÷úSÛû5‚a£•ªá`VJÌì×"L6ÁğÆÃÖ¤ƒŒ^é©Íú»GÁáK¦UV„ÕRnC0rŒC±Ñ÷sKÈó!ãa¡¢ñ®ßrNÆnÌ±úƒ—\ıÙÏüúTÃó}Wƒÿ]JõÇœMBLÃ¿BLSíé‰Øû÷AÔc4•âá¢ö'ä×*È$.ĞğYP0€×MÎ|×O\ÿ¨EÉû«ÏÁûE]”åP[}ôg æ<À<u´Eéëá;àNí; ¼}ùmû^‡ñŞ÷“ôí¼Ñ`ı¾lS•=Ö…áÃ®áğË°´ìlâşfæobTôîÔ3áVüa^şmiåù^ƒó™ê…qíxäù*,Î]•ñ¸6ñë´>~åDúÎL îıŒêRyœê\;q|-A^toùdñ\o’õ^÷“ñmw]p¬dUVPÒàÇ¸>÷Ë¬4~dàú`ˆú=É^ ,TxaÓh»á}ÅoíMlùX’áN~E1h.dï.fSÔ…ß•TñÃ°6óI¸6şàn~`üøéùLjT>+^¥»àÎó’ı»5íyL{“‘gJv÷¿ää>`W×…ñÃ9&ñË¸ößdïì$¸vˆuŠªsùÏ±7¼jäıdËl}îFqúVbñVènaBé ¹–eı^’á^oáî¾{í.fÒ•W1ëª6âË¨¾ıf®ôtšìp,úÑ}jTµkTìïË›|Ô„i²ìøZ÷×ñÏ“àm®äıêlS\…SĞwÏø3ñK¸¶î¨şm€îyˆ÷VoúQqa^ü¿¨×üMyımı_›øÛ}“ñç¼dí?dSTv…SÕ‡qÉ¸>ãÛ2>zäˆê~eˆî}‰ëR}jT?a^ğ»áZì•üù%lñ'áİx˜±ç*$íµ€tVOYÊ‡óËé4ğÃ¸>ï@fülHîYzTu òT;%Nü5q\ü•my^ûyZ³ù\i‰0å2vı.dWŸÆWÒ…áË±·g{ø÷¿aMäøe€ìÿŒ"Ö4|L:`õk`\ì•,y…åğ^ò^oSõıØdí<l×İV‡Ó^qËº2±Ê°¶Şl	®¾d
ãûãßìŠàÔ:aVì;©^¼mù•m}|¿Ÿ¡T~–±m?lë7TlQÒ„WœŞ•ñ‰¸6áËü³z`Kîúd
&}Ÿz=ìQ¹áî}:aşüdøE3ô^×»½Sğí/Q/şöüSG•c–„Û¡®~˜dm:uCÜ…ÖáÃ¹6ñC83Ûdì~ä‚¦túÔ}¢Ü¨a×ô3cÎ®Tå¯)0^?—pŒw“ño>‚d'®ØeAœÔ€ÓV†óË8>áË¼&dÃ‰áĞ‚5hÃ «âcÁ’â‘Š ‡^– ñG²é½õbB …âÂf“öjç«JúA2'6Ò±d4å‰Òˆ§ÖÇà]n†¡óijÁ˜Àá—”SHV×W ‡qõX:õçT{¥fÂ
'bB‰ì‘ú§ÁzúÑ:w¶Êñ&´ã…Ò‰Å­ÔÈÎæ6hÆ°½ ãÕØJ3ƒŠŠ–—BX†s÷òğ÷E:µpNF¥"uZúä‹HzÒ°çôÀ0g¶åPÅÒG"°lÆ!»háÈ‹$ÀS‡S€–ûşÄ*s£b¥¯å]Û@ç—Rnç›ËøÂ³v°Ú¹g¦aÂdÏŸ‰K*³èÕ¢1hâÀŠgÈšS‡SÎÄqÀM²qõA2§bD’µãP@§
CçƒÛ~B³m¶B°g å‹RmRB£³úGbç«œ#PV3ÁšDš—Ú€q¡ß0s|M:¥f
€ı¢Bç€Êkë[ûĞ³å*Ê1í¶¦Ú	÷ŸPY’¼¥hGâsx”+€šAcHš×¡‡Syu0ñ§:ãÂ›S€— „ñ7Ã5~ÿM&¥rR%sÃåƒBqò‚ rÒùg¬À¸¥³å­—ïŒRÇ¢3*Ï °*V2€’#ÂN ‡Û!ğ]0s÷Í³%qBƒ¤jB†çƒÚrçƒÚzD±ç¶Ê±w³íMòuŞ	G¢£hÇâ'èSéÉ›oĞ“ P–Ë…q¯Eæcÿ6§bÚ¡cÊkç‹ÖzçÚüÅ¡o¤Â±Ì¶åÒM÷Ò	Gª#l†¢1ÈcÀaÀÃ†[Áš†9·îqÿU2ìkD@$2Ê‚ëÅ[ú÷“XÚB±f·Â1g·õ‰Ä	§‰êÇ¢³hÇâwlóÂšaĞ\FƒGGuşD&hïO2¥rR ¥§Á€g{ç‹[{Â³â&Â5ç¶¥‰˜¡ÒOÆ®÷ìÄâ³zVaÁŠcÀ›Ÿ•Û…pwM°a÷G²$bT@¥`bƒï‘XZ¥X
>À±õ²<uöáÆ	´ˆ—Y‡¦£mÏ !h’É@škÊšS€\ƒSH‡IgO2yç	·ä¢@gbCJ7ZnfDZgË½7Ç½.¦ôÒ‰aÚ	×¢¢¨…jòHoĞÓaÀ’[ÀS‡açÍ2ñ÷]2½bFåaç×ºfÅÒ8„ c¦Bùv¾!Ò	åÒ‹Î°3(Ó¢3h:cĞÌ‹HBÈ€ä€ú¶6v-®·ô=è…b³Ó‰ì2
´ÚÃŠ´RÃ/Lò
ªEööYAÂwÔÁBy.°¾Vˆ Ë\B ‚èO€è›¶0ö%¾6í9Bƒè²Xì¢‚4RÇŠ¶Ü¯ÄæŠ¯BæşØQÂæØAÌ8ÔZ((YZ¹èÈ“FÈ€ú‰… ò¦f½¶6v/Êà»ÈÑî²µÖJšôUÇ/Dï­LöæÌUÂÔØAJlh\T8(^]Ì È‹ÌƒÌÂj‹‰ Zwû¿´>~mLA,2ØƒùØ‹´ßÒœü^Â/Uç?ääôXÁB¦FÂè(ÕÚh(MZŠÍFI™İÊ„¶ÊÑ„ü$>f*;6ö<À„é¾À@°‚´ZÊš¤Z‡§¦X¿ÌìöÜAC÷_ÓNp(ÜÚhªŞÈƒ‚H“ÎÈÁĞú‹ òƒ¶<æ­66ö)H)è"Hé°ôÓŠ´ĞÁ­Ào.Äò0öUPHö\AFêy\ÚhªVZÌ\›JÈh€ø‹€ê‹&¢÷/²>ô¬Ğ„x"ÃÁ+³
¤B@Ê$[Ë«Dæ˜¿FdöŞaböÜHBhÜN`¨ÕÚ›ÌY›ÄÀˆzƒ€ê¶7÷­47ô+È“è±ìêºš¼ZÃŠ4@B¿Dvïä‰÷@I@÷šQĞn¸ÚŞi4L›„vŞ‰SúÜACi)Mvh%ÜZ›MÈ™Ø"ÈƒòÉ r‹¶&æ=¶=M-È‹èbØÁˆbŠ¶SW‰®K.²·à4_AæXÊH(]Ú,(\*„‚ÂÜÃ…ˆ2Ë…ÉûŠ¶´ü%½>ö½Jƒpr‰øâ¦^™4Ê—§D$ˆ+Ìé	vÌĞBöÌEÂh)Ï.K›ØÄ†KÂB€ø‡Š³¦$şı66v-Hè²ÈÅ´Ÿ´ÚB‚5BC/E;Ø?DäšvÍCDâİJh)LZû¸RI[ÚˆÛÈ@…ûƒÍ€øŒ¶òşş¾bv-ÈâªÈè2‹ ZÃÎ´ÚÜ¯Dn /Àæªö\QFöÖD
fêUR|ºXJÚNR‹ØÌÅ†è‹…ú²>÷+0&Ö-Hà²È¨¸Š4ZÛ‚&^Ã­Dî¯@ãö@Ã×nœIÃj\V` \Z“ÍØŒ
H„ z«À~Ç½ğª?´¢õñÉˆüºÒ…è"š°Ë‰´JÓDf§Ì#˜W\AB´Ü@Àà(Ößè-\Ğ›ÌØ™ÈÈ… ò
“ˆxŠ²&ö-¶¾³mI£è¦Èì³"µJAÊµJÃ§DòßLæÔ\@DâÜRƒx¡ÄÈêc˜›»iC™«mgÌ•(€JŞ€Tõƒ¾Ã¿|Ù{ü‡‘T¸{¯úò)ó½}6bµ=¦]Ïê{Ãî=k?ë¥}6³5~·ã‡±XñF;ÈÍÙ-¹š»íh­q*ÄT€TTH€V5ã¯]/C>üŞ¬_k;É,búIoã¬l2òµw¶ñÆØãƒ¡Ù…ËÓXÔË	¢9~Ê¸k£DT˜„@Ô€Ä¡Ã¿\5‡ş|Á›Ûıİøc–)tù/¶µı§³µ/’qV:BÆ!HÌ™•Ë™„Îõif-i$ŒÖ™ŒDÍ€P1Ã¿T%Sµ|…™ÜüÇß¸;oû{­âµ}¶óµy¶ñV;HáÆ;UÍ“”ÍM”Ë›»{b±Í`ØÀÌ™Ì-Â½@|Çô|‹ßüƒŠ[ø_'ğ{.ñÀ}¶p¾m¦áÆ³ÈñFcH‰ÔÑDÙ–ÚS»x'’©hMÀ	ÍœVÃ¿T5Çşİ™ßä“_ùß=øó-õt6£üı½¡†;ĞÂ.LG•†ÀLÕË¿y¢ò)lêDTW}‡¿T5Ã·|™›|‡zk	íxãÁ)óµï6sµı®aÆ{H`Î;HI™–ëM‰”É;ùîŸiş\ÔÆ•‚^uÚ¿Ü!‘oüÓœø•_¸g¨xË'ãµí¦û%}¾á×½
á¯ÌLËM™”Ï9)B2ceDP„GD€Ô7‡¿VµÓ¿|‰]¾‡Lœ˜QU=C?Õ5Ã·ı›üG˜×ğ{€/èY/u´/²²£e¶ñÃ'Ì¡‚¸IMCOš”Ëß¿9o»`vF”˜  N1CØ5é½ô—Yx‡šÏü9«ğzï÷éù6÷´½¶AÆ»Pé‚3XÍ”ëE‹ø+jv‹:iæEĞÈDÄt%Q´È1Ç¿şœß¸Ÿ.{Kop{,§µõ·ómÿÔõÎ+Dá‡­ÚÉÀÉÊW;mg/yäRÔ˜ˆtÌˆÔµÃ¿\Ã¿øß™ßx{-¸;»óµ}¾ó·}ö&Â;ÈáB?Iİ™ŒK‰K·h~‡úk&M×˜€DYX„÷’«³Ã?t>™_ü
™_àz€}ğÿ¬Â5}öó}¾ †»Há^³HM‰˜4K›;{§˜»ëÄÌS‚ÄFÒ—<ËÿÚqM÷xŒÜ÷š–ğs)üa1µûµ|¶ñµy·á€ñHuf9JM‰O˜[£ctO¨`fÑ	ˆAV\4@»T<Ó½üG“Ïû‡ßèëQúZÓ9]¦ã5}M©Æ;Oå×;ˆT™Ö‹E™İ³èä‘ÿpdÅÔ”D}€]5B¿T±Ãèøšßı‘_øk€/ıyˆ%Zvõ·òµ³<å@3NcÂ;KMÁ”Ë½mt›»ivD˜„‹Ï™–Ë«Év¬éf€Ô NÇ˜ˆR5Â¿Ô½N«¼Å›Oü†šÛ9k‘+øi‘/qõí¶÷6ï¦aFXáÆ{ Ì‘•KMšŒC»éf¯é"T	Z„œÔM‰	7Å/=Çûö”¨‡ßèû‡ğs/»ày¦²°y>âÎ»Z-ÆsXÉ™œÏİ‘–Ã»ëF9yoFÕ
€UÖ"Ğ7A?Ì1ÃLü’ß¼^8+/üz/ğµµ¶ó+m;aF7E!Î;İŠ”ÍI„Ëºkæ:YgFÄ‚ÖT5Ç·Û7Ó­|™óü_|s!uû.óµ}¬²¾ì·áÔ»ĞsF;@Ì›K]”Ë»	F«|~DFXTØ€P4Ã¯”aÅ5tØİt™Oúk}ùù‰/ã4¡6s½.ç†ñØã‚óÈE‰„KÅ™„Îõéu}agÔŒÖTm‚¼S5Ã¼ü‡ß|ŞøûmxúÑ/rµı¾s¼½¶ãß;À`Æ?XM‰ÔJ™ŞQ¡ah“¯nfeÔˆFöˆTµÂ»D5ƒ;ø†Ïl›ßø{%¿¸g <÷µy³"4ü³äÎ¹NàÆ»ÜYÔYM‘Ó«if››ifÄÔ˜‰DU˜T3Á¿^%J/ü×ü…Ûòk#)ø{¯s°} ó¡ı´aÆ»ÍaÖ;İf")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp, ColTemp - x) = 4
                        Next x
                        imgDestroyerH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgDestroyerH(ShipNum).Width
                        imgDestroyerH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Destroyer'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Patrol Boat
            If PlacePatrolBoat(s) = True Then
            
                'show coordinate
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 1 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid2(RowTemp + x, ColTemp) = 5
                        Next x
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgPatrolV(ShipNum).Height
                        PlacePatrolBoat(s) = False
                        'time to start game
                        Call CheckTurn
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnAI = False
                        TurnPlayer2 = False
                        lbl1.Caption = "Your Turn"
                        lbl2.Caption = "Battle!"
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 1 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid2(RowTemp - x, ColTemp) = 5
                        Next x
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        Call CheckTurn
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnAI = False
                        TurnPlayer2 = False
                        lbl1.Caption = "Your Turn"
                        lbl2.Caption = "Battle!"
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWar00™lNrrP’e€!ÁD…ÂÍ4f¡dcaDÁ"’1e!¥@Û^fE,AŞºi²RÂH? ĞÀbDÀ5B¥H ú "aX!±($ P€H#Åb•¤0q(‹¬à@H8piÌHDRAcieù Ta°* Y2j@pòÚ@ 4"HiH!-…2DYd-kj"ê€#à™}0 $$E¤ €(3t8Òä‚L@A¬Â¡Ek)$© ¼ib…@5/up‚ Rñ@3 A‘n¨fP|P `ˆh$¾Fµ)À‰"B`ğ+èò"¡>f(0ŒE5`4"	D,€$d ¡"ã`kèàAcKpp$,Œ‚v ùC@Z`€I\1 ¢ 0"
  @ƒa2$`z`$ä¾r
  ”Lkå,!Gzò”)T Ö6X½"Dw#Ha Kq[` ¶&8°Ó  ² 4…h ®D4Th´Eg®§À`'\0d
GkˆÌ…‰ D#À DA ¦¤ 	  2D"ƒÀ"À °Ta‚  ¿WW^aáIé¨™g:Àå*° aì1l+Bq 8cDT7@1ö$€,!”ÎHÎ@0Ğ‘LFğé±2DKcb9Ğ $¢ 43!Ha#€0¤€a  ğ€M×OpEì‚–°kÔ;.pQæ€ÒÆ¬ ¨©À@jfT
sLR@áP6@ÀĞ€lˆAH%°kf%ğ*Vi$T¡À¸BL P
  jĞ@.z$¢D’ ¢Á²F€ˆ`b0h@€Umc UBf(d!Qé67 bLP|x(2Bgaµ#Š"²d" (! ‹(` Šd4@$JXgCNY	¢4  %9p(  À "(  0D>R+- R%
" æ4€&CĞ *5*
PDQHf„Z( À€$ €(d*&`` d¦-6T[dƒ#bƒ   $@ ì€%} 9dJ‰]f5'ãØª&n@"Ömzè@’	!2¥„€(i# k¡‚`$(H)À (`pZª 	>¼	!1`ø2¡Du£!!ÁTr  é Upo
`p~)WRM$,$ ,H    +0	A€$Œ!¦8àP"gV  q|!BaX¡I ($Pb É†0†$uD%v !\Ğ«¨a‚B!€eP0U
(	a´ f&ÀhXD@2ÀÀ®¢R{Nv±/ô¹L§ –Mîê•PÒ[²ÑHÛ$2©C2©ÃÀ
¨™Âˆ!Õ/ƒ+ç¡¨Ök.¨1:Riê‘7ö°LöhàÉI[´D_´Ë²?Â‘² QÔŠ8ÚÂK1œTï‚î’)\Æ©]DĞñêñpyj°Py9ö¢ø1æèÌöê„`XS4@LY¶Ÿ¶mÇM²%EÎ(ÈÅˆúñîÖ¯ı
#YDµ]_Ğ«h°Ê1j!\éŞş2Ïº1âéLÜ²êŞCHQ´TKıs)G›0)È
°ØD9˜TÏ’£<ï’&Ö^«Ù^©ê¢ñtkpUy†´¯!ÎOvqÎb*ÀHpİĞØX•HHYôP)ÒYskÌ’(ˆ\›8Ù­#ßã×•©ßŞ³j1@éjğmö_Mö0DæèÄÌ"ş@HIğ@A££Ñ‘2)PÄŠ0XdzÒf"'Ø!ÌÆ©ÁB¿™9Éq¿2Pyª	ô1Ö3Lfè€mæúÄ@hÛ° H[²2¿C*-‹†
;ĞÖ¬<ÿ–ajRr™Ì¹\Ö ©xxT}?8ÔkÕN©:‡æ1DæáŒÎc_„AÈ[´…È2[÷)S«9A"SÀN:Ğ•wĞ3€÷‚+\WºÍ\©8°Ği‚£Sï‚5]Ô)UÕ±h0Phg°XxFğ³Èä2L²b€öé…ÅÉš¬@ÌË4K·,C2©CD
8˜–<Èí—kî€#Í!ŒÄ­)p–¸ê4Ğcf1N÷1LÔˆ‰ïèPI´RLY¸J3-‡1+CÜ‡>|Ä
8Øÿ¢ÿwUŞ)]Ö¦ï8Pqn&QûN|ä¦5]æì‹Ôvh„AJW´ĞHÛ¤³-İp)CD
ixÌ8Ğ†îÓ+ã—#İÊÑé7Úºï9P1*8Ryöñ[şÌôêŒÜ®j„ÀH6H\Óä#i‡¶%CÔ¦¸kD
È”o‚#®’5ß	TTén0@yzàĞp\Ã®±E20XæøH.*€JY°@ÉK´²!S2)GÄ˜˜ÈÂ¸Ê¦Ò³®a]ßQéUP¤ì3] â0Pyö1¯ö0DîÈ]¢ ÔP\<HÈ$ËaXÉäÅıÍÂBäÌƒS‘/}S3qğ7³`? ±£“/Ó§„ºĞır kê38Ì‚\JE›[(ùäƒ(ùöŞIçÍ^ÛçÌèÈáÎ‡[‘7)Rrè3€ápj ¹¤‹ÿE6ˆÍ©k¾‡!">—˜\[ML[‚séô‹ ]g\[åİËDOüÜ‡¼“† „^
eÉŞ]kÅ{Œ†ÉíÚ[†3ùR€&{p·‰µp7 °&‚}Å¦Õá3ª•á3¦†Å‡\ÛÌ™^K0ùäˆéä^KiÎVCgÍeŒ‡…íŒƒ€£iQ#ì<5µi7õ¦ˆwÕôÊÿë¡=¾a³¶ÄˆH[N‰\×ƒ(ét‹¨éìÌKgÕM[uÍáÌ‹mÄ‡Ù…79s‚3hpÿ@¥r7 ±¦Š÷E.E!#¾éó¾—í™XWOÅDÅ8ébáéäÏË%Ë_çÉéÌ‡ıœCÓ;~[cuÿùt7ÀñòÊş–jBwÅá3¬7àz:ÈˆLSÍ€\Ç€nf-Ó¨©dZÂ}Œ^×åìÈì½‡K 3ıS€7iğ§@aP5 ³¦Ão/‚{ù1ş©+>…K[^ÖL)ÜİƒªÈö‚*éäN[e^ÉuÏñM‡íÄ‡cÓ ²~z!d7»ğ=±óŠ?• •õÅá3¾—ç1¬“É\Ì)\O‚ èö‰(éõ^[gÌÜKeÅíÜ…åN‡Gƒ·|ÓĞ·y`71x3 ®‚m¦’oEñµ®¸v¾WÇ
\[ÏÈˆ‘péå*<õ^¯ğ‰ØKmÍéÏmŞ‹Ó 3ùŒ3ép?£v7‹0¦’E ‚wÇá±¾å3¾ÅÛÜ‡Û§(ql‹ Éä¾Õ‰ÜSË‰£ìağzéîSuÏ^CõÑíL‡åÆ†‚Ä£iS€£ù`7±`&„16Ç~Õ¦
w”á36á3¿\Œ\KÎ‰\Y‰¨)¤£åìWM±…’l•ïÏ‡¶Ì‡	ıúÒJyQ·	¹ğ7„²¤‹>Æ>†èsşá:ıUÏ™YÍ‰Q_“8éæË+©¥OgÍWBaÍhÍ†mÎÓ 3)w#èzñÁğğ7Ä±æÆ{Å§}•é38Ué3¿—É\SÏ	Ø[’9é¶Ã(ëä^ZmÌUHuÏ½Î‡	ìä‡ŠÛ’#pSˆ3_á· Ñ0·@²‚õÄt‡yÇ§/²¡"î”MŒ^É‹RS8ıd‹(ê`¹«ØÀyğZÅØWbØ×ÂWg0Š1*•É©+¡;×Üÿ>'Ìõ6¦›ğ‰ ƒò	 ­n,î¥ş mq‘z•ñ‡ù·2XÄ¹¸XÀĞCòÕ×a6ñˆ×¶w*ŸÉ±'I¨ÈévfØí&"Ë‰¡‹p:é.ü|åv¨+çŒvã›¿—ûêXT¹:PDØWbÔSj¦{6wœK(-Ş©/Hø6¦Èù>&ƒò‰ ğ ¥j°~«j­Jó‹ú•ó•ú»ºÄ9¾ØÄPWFÕÕSç’´u¶sÚœ¡'ŸH9%ßÉı¶7Øú6f‹è¢pÉ«o‹ÈY'¦X7¦¦‹ò…xø )~*b±î¨nsâµb€òÕ©µØ©ªYÔÑUcÄ‚WrÅ®s0óŠI¨/;‰;ˆ!¾çOñ$¦˜ö	 Á­½f n®d®oã•6•±‘ê¹ªPÌ¡1YEâ‘’‡â¶òŠŸ¶7ÊÓÙé­I¨/–q´æÉ¿>f´‰ ™pƒ"éşàdíî8o¾—ÿÅì‘üU¸¸PÇ­¾ØÕÌGâ•ĞVb¶S
Ÿ¶1ŠY©//I©-ËŞ¹>bÉù< ğá›á›pn n=îˆnó•ê•òÕú”»¾ÙÍ1¿XÅĞÇP•ØÇb‡¶ãŠŸ¶w
ŸÁª+†I¡?Èù2'Èùf&ğhûAİøthæ­ã¨lóÕú•ñ•ú¹ºPÎ9¸XÄØ×b…PWr–¦wŠÖ²cŠßié£Iù¯X+··Øm7r‰¤ÜãŸòˆ°%^¨î%.©êóûñ–»‘©ºXE)ºZĞĞE$—ØW`ös‹¶pŠŸÙ))M»'¯Èy¢6Èû'&ô‰º‹pËàªbèj,c*:ùPş”æv‘¼8KÅ½¸œØÖr‘ÀWn²wŠŸ6pŠŸIé/Ÿ.¨-Èz§jù8"ò¡‹ğ¤­n8n­n­jó•ú•÷•zy2ZT¹¸ZÄÔWb?Ğ×j”´sŠŸ¾s†_©/ê•Ò_B•?3´…—E¸/ÎM±=ÎFâwãÈl2&ƒğ ¶‰$­$¨n%f¨?cÆæÕóÅş™=¨½{Èk•ÒG`‘¢s¾s˜	i/Á	?É¹6Èé6&‹ğŒ u íj¨n=¯èëãö³•*º«^©òXÁ€Ve•€V`”¶c‰’÷—Ï©¿E®'Èq{¦H¿6&öÉ Ûô	(-j¡n½í¨îÓ—î‘â•z•aôÜvÏQèMMQh'Ëz‰ÃË}›ÓÙx‘~Q™€7v‚¿~	ÿÁªü¿“ªm˜j{Ÿ´ğèSÏ6/nO4öñÔeòšÍQhI]ÑjTËí‹CFõÛÃšx™™í€D3ÿˆ5w?“¸û?¨Ø8úœ±húÌO7öOÏ6öáöÛáVàEq`ÏMX(MÑİÁÁùÀ™r%ˆ–>™€6f„oò'›u¬?“ õÔ´~x›²bfGK6÷NO¤öñöá–´ÉQ[]EQøHÁıHÓ‹ÿ_Ç‰z›nQÌ6 79?‚,ı?“¨ı_4zú°~ò×M¦¶Î[²ö©n ¶^Ñ|ÌøNÃzÃËù“Ò	ø=™›ú˜
·w¡€v~…¿ıö< ±Fóûú00rB²ö‹O6vù÷ZáöÍòÏÎ3ûÎ/·3¶Ÿ¡SMÇ¤•\ÑdFÑû›ÂÁ}‰Ã‹ø„™Éx…‘‚¤r‘ 7b‰®‡*æ?™-9°¶ó¨;ùOK>æJGögô†á–îÎQhM™QªÅ<‹ÃÃğÁ˜k…ÙêÛƒwrÅ?â¿Š ½/îªı^¼zzØ°º¾ÏÏ#¶ÏV4æáş^!†æ,ESkAIì™ÃÃıŸÆzØ~‰€µVˆ'Ö¥æ‘jí{Å#tzzñnøÍ&âßK¶òÉşí–ì]ÑhOOXiMÑı›ÓÊıËÅÓøFËr‘ 7ìĞ¤1}Šªÿ·‚¨ÿöz:Ÿ¨{~MOôÆ¶fáRvõF¦IQzÅÕÑdAÏ¹ÙACô›â™r™™™I·öµ67Séş?S¡ôR¢úú\¢£¢CÛ?nŸI7¶ñö^¡¶öMAx]HQhÃ}‘ÃÃ|“Ï™:˜ˆşE@<ş“gd‚|	øıg¨ı
ğòö¸kú_"öÏO&÷àüÁõÍS|MPl\€ëËCXŸMj™œ8O•‚7& ¶v/|ı7Š¨ùpªÒ¸zğOO¦öÎO&úáàavœOQhÌMİzÍÃ¼ÊJı›Q•zz‘7„7r=÷¨üµ‡¨ÿO¡~8°(£®;ƒ®}/…*ï°zú2xú‡›2öÇO³òáâ
á–òŒÕQhMÍÑjèÃı“ÃÃıcü„x‘€76  5~	?¨u»Iñ°xò²:ÚËMµçÆ>ôÇËé‡Å©"øÊ°K YÄù§ @»§¨mc¼‡|né[ùIéïtcŸ”lq/G`µö8­j86SKçASS‡Œ¥UÇL»õ[*Ø'-š‘Ôÿ¤Äú£|UyctecéJ?ùÊí‹%GÖ#óÁè±0<’¥í{˜vY›åI—‡ßh…Ç€ü³jÖ1¨Ÿ	Ìû§„k¦¬µcü…ğf¯ï	©NéĞ}Æì±Âx%ö8˜®d8›æIÓ†dÉƒ‡F	hÓˆx;*Ú#¨Û…k£…ó#ş?s´öÃùÚï‹ùÊç	wŞèq¸Viõæüç<š¦Q“àŒÕ‡ËØè‡×‘h?›¨Ú³¨Ú
Ö&Æx7üåbıáaùÖı	ùÙï	côxa\a¥¦D–¡÷ºçÉ’VüX’C	è‡F	h7¬;	¹ÚÄ{ç@»&|±çè‘ıqùÃşÚ<×½‰åÔxi“i…â9š%æ9‘æL†gM—‡Ã	àPâ9¨Z"¨ÚD»'C”«ç»õcüÜåc0
ºõ‚	À{¿ü¥ãy=åëiÚo	ÉêçqÃÆhñÎh¤fáš§ ´Òà›—æ±—ÅÇËè†GQà7¬ˆ0’¼S ˆ1·M{òğ•ãu¥â9†«RåÊïM±Ç(xÎcí¶2’¤ê¨öI“çY“‡Ë¸§†©x#‹*Ã2	¨Ú!Äù§Ä3§lHâĞysùÊï¹‰osBhqMĞ§¯öxÖmê9Ôî	—äM›…Ç‰ğ‡Å	h3¨Ş'èÚÅû·Á„üçüübùxqı’íûÉ/
yL@`1[Öj¥Î,š·î<âOÓ`E“ƒÅ‘¨CÆ‰î³˜8Â2¨ÚCÈû'Àÿ¤şı#ğçsıJï	úJï	ğËÖèwÒhÖ}Úíã{˜¯K}A‰Å¡“×›ú;¨Ú3¨Ú‰À»¦Çû§¼õÃøucqÊî‰½jÿqTäq×èõT¾µÉ:âQ“fHƒ–ÇèÇ‰è#S9Ê!¨àéå{&üTåcü‘­cyé‰»›ÿˆ Ô``Æp-j¸
%æ1šæYöÉ“×ƒè‡‡-è3¨Ú¨Ò€Ìûç1¤ô'ôãzù“ücñÚ-ı@¯kÍÒmñvhæ>¥ö<„bC—áÙ›…×)‡×‹¸õ_¸Ú#4Ú¤®§’ûÀÊ±Š-ßòÍMEÄ´Ş¤öl¤"á®òáôçñ!¨ö¦áÔçQÓ#Âbs¡B38,[Š°dRˆÁD“óÈ‘ñÊE!œ‚&FÎƒÏN¥,4çíöt­´©ì¿ôë¸fçQúwgúÓ!Ââƒ)f¶¦[ sÙÉÀôÂÒñÊdÊdÎØÌW%<şQ¥®¶|§pé|Oä-¨{'\¸síÀÃ'ÂrZ!Jfv6E
 ,[˜Ë@•± h‘a¾ÊlÊ4ğ
ŞÌÚ%¬ú£¬I|¯òù|¾úi±7æ\¨t÷HÓ£jâÃ!Âb¸¤S&&ÛŠ@‘ñQŒ×°‹K@aVBdL^^†Ö%¬·Àô|«ôù};üé8rïQø¨åXW!crÛ Jb ä[‹¸ôy‚ÃLÀñ‚0áÚdJdÌŸÔŞLA%¬reü|ì¿ğé<·°åğ?æX¸ö§H×!J#Û!Fbö$K
ğ4›ÁP™AÃl‘ñÚÀlÊdÍÿÜŒ'¬÷B5,vü¢xéu¿ğéyeç˜¦t¯XÓ!BbWaBâ°µ^Š°§Ú Ù‘ À
ÑôÊâˆÊUôŒŠŞAŒNM­¼®ln÷<úğ£<'`ñàv÷Ø¸$åXÁ1`òÓ)ĞB° K
°$[šÀLÓ¢BkÛ%Bâ2!‡¡¶ŠÅÎ±XÈpŞËMDÊ•dL†Ö‡È¦¸	¡¤öE5­æn§táş¯`i8öçX:4çXóAfÑ#Êâg%L€¸&[ZÀH‘aĞB“áÌ×æšÊÄÌÎÌÊÖeå÷	'ì3v®àé\¯òíütêP¸~çÍáCrAtÂâ¡$ZÎ$ÛŠĞAóÃJ“áÊäÎfÌŞN†­®Ô%À·lıríx¥f!©êI8væXÇ! âÓ#Zb¡lŠô4ÙÒÁõ@LÑ%Ê•äJdÌ®ŞLŞ…!%¬ö¥Œö|¯ğé|¯ğíøv¦¸v£RÓ FdÓ1&àeB´`;ŠÂH’õĞÈáË‘d@ğÜ^LRµŒî©,¢|?ğÿ|?ğñ¸w·Xø÷ãZÃ±ÃbY!ÀÂ°dWX°$ÚƒĞ@•q@LğÂ•lÈ×´Å
^È„Ü%¨òe¥¾|'ğ­ìoıí¨vãÜ˜gëPš3BvÔ!Ác¨´KŠ°'AŠÎA™õÈ@‘sK!Ê”bÌ
Ô›_E‰-¬ö¤¤vô.xéü¬à©xvãZ¸ògØ|!D#Ñiƒz¡æYŠqºA›†àt¸NŒn­tâpPÔ7ôeĞ'æíù·øB¼³èZÑC[sYGÚúáXä a–¤£‰ÒYÃ_sKG[cáñä£±Ød ÄºdúF²ÅoI\DÁV”¤`/Î¼`®p´Al%tÔ¯¾íÖ+ví¼7$’¼7¼RÇ3[A[aíÔü¶aPæ²H¬ÍjÌ¦DnÁÔİ‘]Í„”†<t®Ö®ã¾øğpôÔ/æí\¯öìü³øË¸6èÒK’qPBYSaÒo¤ãĞô ^>t~l.YnP•†•QT\ŸÖ¥n.Æíd¬ğô‘pôÄöÍÕ6æíüÿ8Òì5èCÛcÚC[c0Ø¥ áQü°~WnI®DjÃÜÄ@\ÖÎ>`&ëŒ/¸TôôöTo¶íT¯öì¾§áÒ½§èR]ÇÛr™GÛsáPî iĞDqHµÄøTäoÀLQÚ\F¼l†B¬|ğÙa¤qôW¯ömÅíöí¼·èS®·êÒ]K_kYC[}tPå¤ùÓõ"N¾P~L¾dfÁzTÁÜĞW¸äÔ-d<’rôr´P/æl\öí¼·éAí7îRS_RIÁ[óáÜä&áÙä€mşn\ú@o@R\À T@„¹æ¾G­ö®pöpƒàÜ{öíœ­vm¬·øR<—üRØC[wISÓãáÒf¢áĞ¦q¾AîIïİîJF”XU’æ¤`®Æ~a¾`…ôq÷Ö.öÿ¿îí4¥¸’¤7°AúÄ?+íÔ/æı4·hRı¶ï’XÂRrÙÃÙ~aĞä²aĞ´L%…¨L¾@îA]UœA|V(f*V¸d®øT1yô'¶íÄ!Œä8—éR´²èI™C[ãYR_×áÒäğ¡€¤¥l¾DnÌ¿B/MTBIÆî|§Ö,ä>™ğtôöĞ}¶ìD/ôï½·í¸7hVSC[cYAZã¤Òe¦àĞô L,oLÀlE\D”A\\Ò$e>Ä=ìjõtzñİ+öhÌjöi½²èpø·hRYM[gYSSóåPä´ñĞì¤L.Ôl,?L?PÜT@Ö• t¦Ğnd.“ğ…ä1päÆ'òíÆkvíü·î@®·øĞÙÃSc[AZeáPp áQd N¾e.]±DîÌT‘Q\]V†ÿå®Âªf®QpôótÔkõïUoôø%¤ìC½²úRXMJbHSsñĞÅ ñPe Ìö@}L>LêT–ATT„Äª|îÂlf¶™(quôÜ/áıT»çí<·àR¾7ìR)SÛrACZséĞ¤¢äJÄ¹Œ¾LnÜ¾ÆfAÔÔ@ÁLTÔ“ì¬¤F¬d¦RõhÅ²Ğoïh„ëòë º%Ğ¼·ÀÖ[É[ûÙÇObIÒü áĞä$L²DnL¼EjÅVTÁSÔœÆ-h¾Ï(t.ô…tT A^ÜN¬t®ÆídºtöñôÄ#õéÁ/°,ø³¢À¼÷èVÉÓÛğIÑÇscÒ¦²ñĞî¡M>DìLÿVnaUM\T ‚©d¨Œ¤`¦R…ôp•öd§~lÄ¯îå>·ì¼7ìÒQCSwYK[sáĞæ áQäà^¾L.ì^Dk¸\ÍTAAT”ªd¦‚¼d®‘k5pöG'vìÔ¯öÅı÷h´÷ìC_©ÛSÙsá“ä áPôàL>D+È:H~ÃÅĞWÆ¬ìªà¼4¾‘xõ~AìE.ôïÔŸöíüµêĞ¼7êFÙCCsY!Úøq‡`¤)Ğµ \¾Ä~L.TjÃLPMLT”Ç,d®Ftf.`ğñ•ôÔg÷©Üdwä¼öüSî·îÒIC[óYÁIûåğbqÔæ$Í¶ÄnLşÈïAÔFE\\”Æ¬u,Æ,%¬™pô6ÔP/æeÔ+öL´·èR½·èÓXC{[ÓKs%˜`7iä \½ÄlL¾Dná\VAôÆ¬`ƒÄ®d.pt›ppÔ{ éÌ+9i¬'hZ,»¸Y[A_{Í@ZöãÀå áÒõ È¾Dj¾„şDTT”Á[ĞÎ¬d¯Æ¬b®øô¸ôõí·®T+vÿ¿uø<¦`SJsÛw[CsaX¥àáĞä²¾Än\*D~ÅU            GoTo C:
            End If
            'Miss?
            If Grid2(Row, Col) = 0 Then
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "AI's Turn"
                lbl2.Caption = "Battle!"
                TurnPlayer = False
                TurnPlayer2 = True
                TurnAI = True
                tmrAIAttack.Enabled = True
                Grid2(Row, Col) = 7
                GoTo C:
            End If
            'Already Hit?
            If Grid2(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
            'Already Missed?
            If Grid2(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
End Sub

Private Sub mnuCheckShip_Click()

    Print HealthCarrier(0); HealthBattleship(0); HealthSubmarine(0); HealthDestroyer(0); HealthPatrolBoat(0); ,
    Print HealthCarrier(1); HealthBattleship(1); HealthSubmarine(1); HealthDestroyer(1); HealthPatrolBoat(1)
    
End Sub

Private Sub mnuCls_Click()

    Cls
    
End Sub

Private Sub mnuGrid_Click()

    'Print Grid
    Cls
    For R = 9 To 0 Step -1
        For C = 0 To 9
            Print Grid(R, C);
        Next C
        Print:
    Next R
    For R = 9 To 0 Step -1
        For C = 0 To 9
            Print AITarget(R, C);
        Next C
        Print:
    Next R
    
End Sub

Private Sub AIPlacement()
    
A:

    Randomize
    
    If PlaceDirection(1) = False Then
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    Else
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    End If
    
    'Print I, ITemp; RandomIComp
    '*AI's Turn
        If TurnAI = True Then
            ShipNum = 1
            s = 1
            
            '*Place Carrier
            If PlaceCarrier(s) = True Then
            
                'show coordinate
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 4 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 _
                    And Grid2(RowTemp + 3, ColTemp) = 0 _
                    And Grid2(RowTemp + 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid2(RowTemp + x, ColTemp) = 1
                        Next x
                        imgCarrierV(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgCarrierV(ShipNum).Height
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        Grid2(Row, Col) = 0
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 4 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 _
                    And Grid2(RowTemp - 3, ColTemp) = 0 _
                    And Grid2(RowTemp - 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid2(RowTemp - x, ColTemp) = 1
                        Next x
                        imgCarrierV(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif"(  :€  ¦ `8@"   $(   ¢`1HO'_a\qò` ToD!/DqBuõRm ,pEnq ibH%"gˆA`ØÑ`4 &"hIlafEb‡bIbòm'hL + (d¬  p  ,B è  ¥ … e (# ìnl2< pp!nî`= 0pÌ1u8ær 5a2RmAb'ê$H ä 82    `) $ ,€ €Ì `  C)`j Cé	.  1     "àp @¨"  0!end Á@M €$ $    $*     ¢glq!	 ` "$d 0 ˆ($( l`  2 0  dB-:.[gpPooN 8  B`Nd HeàQ'u + j¡] S-r*   $" x""`0 ¨$&     `ŠPl `A@ArM§œ9ƒz*E("2¢@!hSe%   1  
 l  2     ¢*$° 0a(O7p4|ò$Iy®P`3$u"e ¹ ë@dhâpúAhe "
 Av  $ XIegvÏpy¤¶*Fá&")Z      `B€ `@ à 4 $` ` imfSA !f3 g}r1*@AcärÂe
 DowDPaéÔ}Rä8Apà	paLh bB|Kia.uQC1 d.#H')I
 à  (` !  , 	("8   !& h€Ì27Aa4´i'~ ?0@*aå gÕràaZò uzn   p  "(    @ , `   ¤    F+Tn  M`p 1À  `       , 
AC$Lb  0€   b  0   "1¤(]odEF($0(ˆ!  2  # €  `   ziuHt   @*`  à  € p   AZ Bmì ¨Â]$EIf ThEtˆâ" ( *‚  $ ˆ "    If@ÀçEl|   ¤ ,< 9 b8`ğ`LNs!äe$b" F!,iGxT}ïN)¢   `! 0     $  !  H Q$ GAhl8)Vz2@AmP,¨ÃËlmm`	 =àP !    ` * `p`   !  !AFd a7yd2ˆ
J@e6, A¯ld5Ap º01)#%°0 Ÿ  .d &`  h      `! Q-n rH`2(Ğî6`,$ oTdm0  3+ œªkØ•˜#¥X„İ³UŞmN¯‘\Ò&b¹Ó‰-N¡÷r¡İ¶é/àÆjÍÄ¥Éu#~sœ~åh·—bö¨!Ø3ä+Î 
ŠùEŒ•8²	´†:ã-¹*æÀJ4¨õŠ×$”Ö§µ9­ G#4T¦iŞ†İègî£§NøsÕ‡‰Åº#×e°Ê@zh”îcÚ¥¬TU†ømÜ¥}Ö|»õUNEkA¬Ğñí@é—d•JQ +4©~îîÅ¶ÀÏyŒG¬º=òĞ]™ğL·0l‹¿û{YI×©‡¼WKØ£A?É¨qİ1×|İk´Ş;ñôV#yöª«~¢"Èæ–äNö\.Tî`
ln{rÕàğáª‰°`tyÒüSk^bÈ&}À®)]k|}ö.V¥tö«úöÌ££ÎB³¿,ÙÛ¹qMÕQ¥¦\¤ï[Ğ<^ñ VP‹X|–½-Üğ•ú==Ê¯G]I‘zzdF_íĞPâò±©«pN?cÜtÃñDö•şåzèÕ¯3_ÌŠTÜA CH#¬lO%šº9Of×ÅGY”ëæX<Ûâ–áñ&íöÒ¶9øM¬ëJ‘5Ìä—©`²\êPSœ-„^«©€jN×¿0õ4&`7fgéı[ ãWh™£Õ‹Ÿıûúİ;yLR¶¬Tœ›C|«2¯o`ÔÕxT"+ùæÅĞD:˜Çì-ŠîrI°¸Üù®Ğ–ˆAÕÅeÆ”WVÅ.°–Dä@tk[ÜrNæºorÇ”Í´o2ÊÈ§D›‡†
5ïÇÊ›.ö¤©¦<Üè _£UC¯¹’/‹€O-nŸg‰s´¨é|É±pşHĞÃa6×KvÏ+¸U&&[ÛCÈùLx†—|æ·´6	ndàĞ—§Ñf;i`4ã|Xõâ\Í»,ÃûşJéèQ©òÅië‘®?YBDÓà¾ª]„ÒØÔ¬rZ[ÑÉ sØ•F§K¦µÀ[‡ÔÇªKniĞ|œæ•fªqLßZ ¥ur¨ñØg©®ÃíD?,ØU){[ÆìOÑù¡9ö‰ÜĞëºÖÈƒ#Jû¿.\Ïõ7qzôârœ¦¸P„õFÜPá‚yçñFøñÔ…¹~iš½EUêsw1İ¤b[íâ=‹ÓÜOˆ£f<SıİòË” ñï‡L-ÁÚ3_lŠ0üR cbhŒ&,je»¾9m²ûõhså×#S)Ÿ6Ü1¿~£Çø¸yµ½È-‘?Ûàµå¦²d™Ç_Wİ$;Ï-ŒsO¶Ùµ¤î÷6,gt»¼&¡nH¡÷ƒòwÚßm,H–¤ÔŠSûÏ+âTOŞİ'8-î§‘XĞF`Á£él á²b„”şìI¯t¦¢AüÅMÊ†vTå®h¶¶w61=?®T¤ÊsØùQo¦¹†=ï­Á ­õk³.ôæ†<\Ìğ{#TS¯MÂ(†¦€mb®µÂjºr›Ãr¡ŞsŞ1G¶êV{*ÎÇ+º5&&CíCÙìx§¦·}ölŸµ{n"Hªğù†_åÄšbe+,$f#[­z•¢{ï:âW+8©Á})íŞı«Ùxk.U-X›ôºş¨…˜î0l—¯éÀl§A†äµà\‡á^†/µª±fíÒ=«¿ßêÒƒVÈ@f/·bìúˆU±ÛÔ¼!uIy¾ó(NñU>ÔÉèyÿÉR§5öŒw‡D—†»ñ½÷áºë|ŞµıQf\[/üK'†|@¤@µãğİçñ:°Îı¾?JWËªÃ,Jtx®xmÄ&<®¥“ø¬[é~=~J4£òd‡ÄiÑû!ßí‚}³ Ïj3y¬¡LH…»ØV
ŸŞŒ3ÖÍaÃ*\âÓÎ ±ÎP ÷½=÷ìâc–¯w#ãàÈ#ÊùŸ9W´ËìíÕ*n¶»1´?& `fWyôh…S`9÷¤>õw˜úÏ	´HxŞ¶é§¥xG¥§¶òt<cú·İ7òF¶¶éHV«Rãt²¥çƒƒ' Aõ¤5cÎ†wvÅ.(šWhkJâ `ç¤sÉ¶­ÿ.êéï #¡ÇBfŠÃÂ—6ôÆ­¦=ÜîĞõsí“Â5¦¾äèvŞz˜+MÙƒŒø¥¦¨7äŸ2chÊ§Êˆ
¼}G/®D1 g‚Çöd¹óuGtÊ.Eï»£€µ¿Ÿ¤âd *eE;ìzeÊÍ«£ÿ!Îfíì8›²Yû‘=×&ZÄ!ÚÁÍä¨Ã—œ÷<b’¹UµŒÌ°uŒˆÃf®–2|İ•>gìË]xÏ§¦¶Ç¼0'¯8)#{!ë·¸"ã®¨àd1tyğüÓJ$¯² M1øÉé< S_¹NfÛêî’ˆ´ï»ó½ˆÖqds¸ÿêÓPä?uº&Zµ‹Ø<G½ñ*° õĞ=m4šÒd-šX7xèË6í‚JG»©éQ>?küPÃÑh³Í®e&çû›y;¬ëT8 Bj³(øì"hS›¾1e¯¼Œ0úµAÊj|ĞSÌ¨±NXà×¾ñ<Õ»¡ä°‹Z÷åÌŸGùŸQ%œ+ìì½inÕŞxõ’D'34½ğ †x,MÄ›ŸŞ€şĞëJ&¶¬¼ªÛ.]K­3[Û%S<x},ªÑl“+2ñöéx@\×°&à²¾¬+­”#Æ3Ü%tÂ­\’Õm`xô§!?ÓM5Ëšï ƒ«égiŒ„X>p–úãmø¡„b†ƒË»»áİãpìæøh$ê ¯ë±˜9[F‡Z,èsØØ>í”6!ĞÊ![öGF«lj^24[‰©µßÂ·é$Ï8*k4¤úÈä”í¨ùÜje[$g4Hìqİî4ÜËSş¿íÈOkäŞÿqIŞz>!—¹ü³À¾ÕòØŞ|BæÜ47¶0pì1§H¼ä\À\‡ø7úªvhĞ6IşóûN¦ANĞVz17~åÊŸ•â‚ ^t[Ú<Îx/É> ]‘¨é ­¥SSöZ…ôúëºv)§$”jÑ¥ôf™r]eŞş¡öN²Q}$(©B“•ÛÍ~÷Åjzz ò=k>»»aüT¶5yÀ`-¥‚(§õúásC<üpÁùh“-®dóó¯{ºäšPü”H(vQøƒp$7øş8oHµš7ln¿ÒË(HúšäŠ±­³Úõˆõ+¬~ËÇ¯‰ØjŞ0ñ¿G3ñ~š:¾éß*ŠÆ“x`Ò PR2E´²?Bæ²$4)Õ«·ü6™²)4 –„Gô¢RÙî5¥›mÈ±òMú'èÒ~KÛÓi\ BÂ¢ ÖÉm‘ªˆAóÁ=Cî‡vVÇ®xL`t€®9ì5õR»îaÒ†y˜$-¶QÚ„+ê\”I¢œ8ÏçËƒvô¤¡®=¼òğK£–SE›¦öÖø€id~§¨s¸É‰¾íÔ´á4´ê%7W-§†Îõ~?T²AÄ
ÿãÇ33!³ÿY
b}K œÃ»¨¶€Çòhm3"{7Äê\µú¦«Âºİº1×†„X«Ø8ñˆ1\5ö³’©~«”¢^· ~Ù‹>™³…+©yÜN³ùì6'ğO6/óšfIômŒç½‹'¢ñeŞAágœÀ¦¢5¥½i 9=3´­[k>ı¡*X‘‰eî]Õs€Nöç#À¹¢ã¾¢æ×ÚŒâ÷Ÿn?ÍÔ+sMu0…„œÃ‚¶°L Ä0~Õˆµ^ƒÎ£c*€¨¶¹5]<Œ#7I×S7|ôBïèHâ¶¹Éq®œp‰ñX´¹¥Õ»Å;¯€á¡^ "_1ß§:	±¾/Ÿˆ6œ×C›*TÛ“Ì¨³nY ÷Ì¶~vøê$O >Š)Éƒ‚2³5àŸáØMÉ1İ½njl×põ“<$bS'Wù¬ …ShkÉ–ÊßÑÊ/î=|GnŞÿN´—q¹ÓYè6+†İ#<zlÎ§‘R'b1ñÉìÁ’¨ğĞ¡£â‹Xü‚_ñò†&‰ÿJ8	›ß¯C	¿ş«RKã¹P/®‰:+.r®’ãm™Bƒå4ÇÇË³7Ô´éæy½ì±J¥s²ó	ÉĞ9¯–†y/„zÓAÙn™!‰¤i˜öÁô	hÇZÎøA2fQ‡"M8¯…–‘‡©ÿpJEh(¸õÍÀı×Å*edgVe9ÌjõŞÍ«	˜–Çù
½©Î)ÿÛ¹MºAxE£P ¥ö÷•y„ƒ—ØÌÿPäŞe=¸í ãQäÄC¯R$ç½?GN‰Ò¯Ôo¨ İéÒ|îTÚAèjj¢íĞP6á¯è14¹Ò]ÓK^àÒM
-ÛáA	­<!R~VT…ô·kºÖHãƒ/¿ıŠÓÕºP/}PuüÃİB§V0|A¤'•ÃÔ|Ï½X±Úá•åh¡~êÿf |"Ãæo·Í BÓ–™+‹GcœvÁù(£­ïe'Á‹ËR½íîY¯÷Aƒ,1?+S%ø¿ğ| ¢‚tÖ±@ƒ
Tú‹¬‘0 W<r¼Õˆáª—;Ü›•«ªİkË,åîX3øÎÛí¨¦/•§1´ÂMT%ZEC¡ú;a³ Õç×»6Şû!Z	²¶³`ÙçR¡…š¤ı“~oO‡‘XšFSñÑólÁ“jíò ©Y¨Ãˆ©(…”yåˆ‡„úLÍ4¦_yàE]:,JŸFB¦ŒdŠÔYîAr:QĞ:ÆÇk$“Ä›ûræ®îçkÜãa#U{ï‰âQ†,€9.î¦_,˜sØÉ©>¡¶o K&å8a~wßï-ØQ/osû{"ïX¤÷´şçjA,C¤úÑíàí—Äù"e3äG&!Àzöî4ª¶iÿbÄcËèX8½’í[»•~{Li%Ó3Û„=â•Ãõ°3DFñ­@7éôì1§lNæ±À\'ğº|¶©biğiHF”Ë%êrFtZ€.hjÓråğğDÿïeún’}aF•]Å8G’Ÿ]ò¯ã,éËcwQÆ…Ä·â’¾é¿!÷J³1(aã×»°eUb%„üÇ¶ğtL¯DSUÊĞ|§Å±iş0É‡µ	u¥şw º´1Ä¨BÀÓ`r¶é)Éq>C|Ü2ÁñH³®eåz46©í#Ï6á!JyæR‡õ¯läoŸĞŸd®Ö‚÷ş›­˜å $€²ôú8ı^¼bó;Îií€úÃ#˜/şŸ%õ#ä_m¿GjnW×Põ’$AfGÙü µSgPäéøÿ¡f˜èÃÀ@It¶-	DÃë¢eG¤k Ò›e·/ºöÓ=Ú2áù›,GJA”*¦è—¤OâáÙügåÌESdåİ§3€0˜×>ª 9kî ªá!Œ¤¶?¾äºqÚbCÀGyÊãÆ§>”hh#=¼Û³hçupMÉ’xÇÔ‡7.Ë‡¾ÈsŞÈ¡ìÀ£–!ä4æ!68×	¦ßÎók&1ákêqìX£®·æl;u5NmEk<úñL„­—¤¶Gm[bO6o9Ízõ®íã$k¿!ŞÆæ4}Pöğrû‘:~;la$û»úìkìÕµÒ;¿*Xö…7éĞd1¯hNæ•â\‡½:EJŞ€‹fIĞ=)äÔ«¦âpfd^B(h{>¯¼àZ‚çI;*Wz{ÿ|G*r}ÿC _½âé	åœ½Sßv.w…Õó«šÖ¨Ã£`¦â´iø€‡î2¹57IŒ/î>şt!)[àc9ÕŠÀn§•±b° õñmN<âòd&ó6dÍà/Oıè)ë€ÙB˜!8mLÁğ¥æô•æS”»J;>¾ºZLTJ#YzÑA,zŞ¬mHVş‚8OŸ×AªFfz³±~ ×¼â¼ù<Èä+ğf»|H®;®2îx«	zZúN¡Kä·şL*Fİµ‡Q-{âgY¿Gqg	yõÇ…ş´#\Öëk.t9Ã¥`°û;¹¼p+§]îŸ8TlÎ«”p’bCÑóËÌ "Á2 ”ö‡W‰„+ ¬…|O€jvÇUvmM°¿8ú*¼gB¸êMA 8ŞNR¦¾ãMy#ƒÅ0çËó´×¢ÀgÔºŠd‰]SoM»Â¦®¢.î6…i7˜8Ï×Ö#Ö%t0ª56('¦ï¸<Ösóc@YìP§¬·Mæl»Õ,F.e¥Š´œÌÄªü;L¹iwb5^<ñîÍ³<Cÿs}J©èø9½éğÁ“Ì:–8„e‹ü‹q­õÕºŞF‹…}pyıĞ_ï†cÇ­àz‡”¯×¸‹FûĞ}öóå#¶4î$=]n$[İğ±eá¡àå1tx3ürK8¼V~XİÊ¹¹nÏ$vwö
wåìÆ«şÈË£†Bs¿Gtê¸£q\t8ŒşÁ¦0€EÓ°‡u‚ïÕ ?ğ„õĞ=L<Êrd42}sFègóÉàhâ´™	ÉQ{Aö©¸9~íÎ5SìÖÈq¿äøu×R(c
™ø&cLj%æş9iŞÃt]²ÃÂéöÓÊÄû¸N€†¯]Õu@¡aİT»j¡CèÊ7º%ÜQö¤ÏİÌjnñŸr×²$G²8ıY~í!$TÏ·ß[ùÕğêi6(–„CôŠ³óêUåóLõœ¶xEÇ¶¿9Éµ2©¡¬l,%İkÄäªUx‹€ á•yÍÒOVã¬sw}xU6ÇÔs}[ckåóKèíîŒ.¬¶r†²ã}¹c£F4ïAŠã5çÌ¢q½ˆô«Ws¯G›Ğ!€.î‚,„1ĞûÅ}Ä§×k´Ça¼šíN[:P63°p:*5Éâ°wÌh‘õuNi%ìúñ‹Àí•Ät×NÇfG6E\Èyõî4Íkã–EÜ%û©\9Ğ‚ßyS3Egx5k³Oä<‚İ÷´°(‹Š°… GÅ‚é}âb†¢…Ä•|=Ó*Ë&KÆí­ó«'â1M$)M(S7åóĞ²ê‚4M~"}ÿŞQK¼/¶Š]Ñèéã¡7[ö>Å·´ßÁ¤ÉDõOÿ·}UËˆëE<5 ¼‚WC”60Phæ3µËÈdçñ*2° ôğ¹9l÷àd%¹X7P¬„F_íÀ`f¶™MÉqocn³gÁåi€Æ¸âŒ©G—èíiöR1:39:¤ nNe›¿o•»Ü€ıZÆÅiN]²‡ìƒ±]Pœ;üxL]Í©/÷WàÀ¥­Êè½ŸYW}ì±Çn.Gxõú<$`3&Wñø; §`5ƒ×áøÔèúo,HSãÑB±ÚÛzGÑÆÔìŠnM¡‚;\ÒfbÑóáä@À’B ”öõ©–«nıàgŠ´}«¹lKe Ğ•W'¤!WWgf‹mr³‰şñœ¤'›!z†›Ã-±‚^ïÇËó6ôæ¡¤’î1“<7ŸEi¿&æïİY>e?—RË9ô­C­}#›!d”³­œ˜÷¥Ç/¨S×ãâYìz‡î'<ÊH»”hè¯•è-½—Ïàyi;)z|!+%uâí xƒúkŞM¨îVzÑûÉy‰[~ +AÒ²óÉj†èĞÜŞZNñ¹éäï=‡hNæµàTğxj±ï£Bg$6Èôû«6óxF¯Dh)\åöĞ áÍ€¸Âu4’Tr*7äªÉh{Uëwãj…Ó±øæ„Çş¢„oöª&…Éå›5;1<…„óâÉ/”6üH EµËĞ|ç…q.¿ˆ’ôp<êœÅn%Âù.yıõ8ï³mÈ9i¡Q&>bürÁÑh³íîMÁëß®ÊT®3v‚*cQ“tHF J>o“<'ÛP¦Óóc\÷J»Np ‡¼ú,•}¨äğzƒZÁãÈêç;úõcŠ”6§ÊnÇŸğõ’$ }v¹ü¨¥Seìú}ßµ#Èö8L	Ià®&ô«ï¿y©s[ )
5 ÄĞ“õpÙ“]éMrÍœJåœ£À/—ŠˆQõå´Bî–ÓFÅ®Ÿh0–w6‰ExZ[ú\ïëèCjÜQ‡E;ÆË÷$°÷ë^İç‚şƒÅşÇÌbæc†#ïaæÀ€pb›Æ*ša’ªí_ô€©š]³¹ÌIr8zMâlzfdŸˆ´^®İÿ–Cî¸L@fE–"äşÖÇÀå—ÄĞJeÛdwteéxİìUí‹,çÿSš+aé9hÉ‡¡t¨İS.s}•ÛıúÄ.‰èğîşJfÑµ /ÑÌ çHæ”Ä\ğX“n¿ï‹.Ò%è'÷¿g08ß"gF{äbÒ\á‘øä1ô9Úøs	O"*‘èİaÈ]äĞ†ş…ş·Ã»şàß§ó2‡ÿ>ÉÕûQïuP%„üc=¶0<y¤D“•ëĞ‰ŒîßÉA1ÑM'3”Ú°N%çpÑ9Á–TÎ±JÂö¹Ås~E]ğÉñh»©jeaûâq§l 3½*t
-Ym¬ l.Y»9Õê/†'ÂUL„J¶”O¦³c~ ÷¸Ú}g=ˆå+ø«ZëèêC›eé¿6ôf‹}îİËwúöş•x…û_`AEVäü÷o¦SPP€ƒ^n‘/¹ê¿Dh8›¤#ô®†²€t„Gwce7sáé“qïLbñóai `Á’"ä”Æé%‘ªèEñÍ½CÉÍ
Q¦ÏPCjf˜ö+÷Æq4@V¼,¡Œ—äeíû·ífí>dÁ“	ævó¦í¦Iuæ¡æ"W˜]Ò†"Œ‰É_Œ¯^è{ÔÉ‹iÖ£–!v”Ê>0×f‹İORKsù}mQìx·®ã]§m©÷uNl%K®óñíä¡ä…İ@å[hG&Uè~ØÔ®I+ÂÎ#Ş
¹hßî_ÙùJ
²oX‘Ş¾*Á‡öüÓNFÑ¯@3Á•ğìµ¦LJæ•ÀX¯õ+ÃæªaôŞ#Çın=F×h‰:~·õß~á¯áÈd1pYÚürk9/ò!ªı³à)©T¦Ø À¦àÃÂÿÄ³ªÄ¦ıjæÕÇ,1*Ef¸–ÅG¾w`,FĞ%EMë|åéĞg6³å¦€ÚŸÿ‚"eìÎUï¤BY­ÀÄ¢²µƒèq‚XpÑh³­gn‰šøvû¹ğjö;ncs8p\/>p‹ÿ8"•ñò×PlŞÔ¥–ú«@»}ğ?Ş>÷@â…Ê”:¼.Æ¥#´"˜İS;‘aìí½AjmïßQõğ>`rfWùşİ!åZ@eƒ™hî¬#Á'H(	¶ F”e Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 3 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 _
                    And Grid2(RowTemp - 3, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid2(RowTemp - x, ColTemp) = 2
                        Next x
                        imgBattleshipV(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 3 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 _
                    And Grid2(RowTemp, ColTemp + 3) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid2(RowTemp, ColTemp + x) = 2
                        Next x
                        imgBattleshipH(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "You can't place your Battleship because it is collided with another ship."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 3 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 _
                    And Grid2(RowTemp, ColTemp - 3) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 3
                            Grid2(RowTemp, ColTemp - x) = 2
                        Next x
                        imgBattleshipH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgBattleshipH(ShipNum).Width
                        imgBattleshipH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Battleship'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Submarine
            If PlaceSubmarine(s) = True Then
            
                'show coordinate
       (`    `#)mÅÅbâ0)K(Ä!q52d 9 L.AD`i"tu`u@`pnU¡ph ! €L)m³s-o«dn&In¢(
&  80t Pa(   ( '!lAldE0Lkb%,	  * 	( "     `(*¬â2®ƒQ`âiYj - "D(#@`ã0D)S-6Inj
«*   $(     0 $ @(©(   &$  $ !@#Édw-äR8’:0 Gg$i ­!Pè( *taN)$p| b eEB`!Ni	   €`#     ¸` (PMÃc 4hc çY2eg4lbh*â  ª#"ˆ  "! 0` If 0,CCeor cu‘îä ó( ¼L"u} `A
­B$ "0°$ `  , a" !" `'p   $d!   B  (  !0Id BVw ”"7\f-a.D a.$ 0"2&  0    `(ğ @™aF rc¥T%m` ¢ (? 9 Rx¤n %góeG#ÏbN`² V@tYData-f 0!€ (° 0$#  $ 1  H& bp	D"(BlSTdm, sïL -X9!-0 4_ !À   $0  ¢`  €0  KfD$A2id²(Àw3T5m @  ± ·-4el! = 00³M
!   f ` p 4! (a"  0 A.e H#o&f8RCõTEe +  CclTe%@)8- 0 hEl >iïhd P,Ac$­elT hckŒ2  0 !%'$4      `  P( h ÁEm Gòidz  = Báà@ieV4 4¢9€at`vHë00· ¹ SdrI!r)Lf,!  = @eCäphpeR$$@„ QcpRmL KömdM   $    $  $¢ "€   !(, Fgt$x>00 DN 2h h&à " €"$""4!` à   0&    Arid" PcCHádR  ¡,£ÃÜ¬eé + ) 0
  ¨     ¢00     "h 2   Îx` \ `          (   `  È@ebRu É`2hfe4)Chiq}),Jegq 9 iG'^!4ç02()T%ox)®ÌqfE$  0€ # $ 8 !   `$Sùî+ÌNm¾ØŸ4, ‚¥È±#«•°!	½úr¨ØæøIâä‚ÜD¡“9è>„Í¤miy˜–5ÍvtK.HüvîŒa¤¢0ó@ÎîÃ`½nÎƒª*ñ^úôŸn¼§°,’PZ©úËoÚ­1.Î~§^ÈsØÈß&–T´È%68×/âÜ]\ù(?©pô¯·BæJûıfN%k,Úñeäí—DğJedo6aøx	ÕÆ‘2D&ÿW¹J9¤	ZÉ¢©4ˆõB¨?Û“éì9Î×òœşºÎVÑ© vÉ­Àì1…şJGÄÄ<¢ƒJtdŠîØnÙ]±Æ$¹p§fnP¾@Hj[Põğğá¿ˆä9T}ÒşSKÈc“B.9Ğšl*yUï[MßJµ“ßé3mÙƒ&Bó¯.Èµqm|P%„üÓÍ¶\¦
!›¨ı–Ò¾­ä×ÀixòFqdÈ4\È”R3»¸µ—	íQ?CÜ0™Øl·¬mÁÛ3ÓìTäR'#t5øb\Xú·7_,”ğÓd[öAoÍ]şãˆé¥Rıõœlñ}Ğcğ>‹Xõ ›$ÿ•Ür÷T¤ÿCv×Ÿxı’F`fwy| „s@	…×¿”ğù·‰}\Ô¤)‡ÒŞ-Õ|mÀu•fd ÚĞT²6¥t«)ˆC¥Â,ĞÔÄŒŠğl°†°'Ú0ŞœÊŸQ°–vˆq_K
Î ªÉu!Œ¬Y´	\†zÃt­#àÚ:Xï…óZô	ä=ÔJĞKƒsM»B1®„\Úüv,ˆsØè‰>íÕ'–ad”Êa6+ß¦ÏØQTFAğ"+ø=á¢·dænŸ„}\
m„úñïÀí—ÄğzäÛdw6u	hxõB0Í‰l`šjáº]ZÙóƒUóğ^fXUk˜æÆÂyÌõĞ]Ş?JFÌ 7éÒ¨=‡JÎæ—æUÏ“)?ÒhfhÙÜíİ¿r°4FYÜ-I\&†d¡¤oÀ©6¯8¦´SM8Ìh]”¯SA~`Öis³Fa†İÚ:öØ‚‚BÓ¿,ÍIÕšqmP-…şÃ ²V\22D R§×¸Q“¹t.¾p5Óm˜,¯Ò`IÕi3ä…H© jƒöé©0JWCHÌ@—Ù-Ò®ê7~®©ÆWMâÍŒP)* 9x-"LJ%‹Ş9mÅß˜¤4Ş—aƒ*\"Ñˆµ,°°,²ãô ˆfÛtÈKš§Ş1Ú#ÚÆ}\Iƒ¤»‚GN·2à’µ%`fGùì; ¥Sh=×‹¼ÕÂˆiu8¼¤tûSÛj5¥X	¤Ü“~mÎÇÛÒ$ÜÙéL$RÉª´”öÉ“ŠˆiuÅ%&‚Õz®80‘–S6¹Ÿën #ªéA!ˆ 1ÔEbØBÙjÌË)Oæ£³µ¬¾æ4†„K8.o9×âÜÀ9Çl¯]­àsğÙ¹^±ôg0”Ò 68—/¦«+°TVë@…Í)æ­ói*·†]ND	EÒ¯²Ìêí³ÕĞJm;dk7µèz8õæT¨ëÿ#A„-mxÁö«Ë±Ğ@!@BYçÛñz¨Ş£ØÎÄ¿E_ªÆAç†åµÁ ïµqH Şí´O€€üåîPltúP.hëzTåÒğTÁ¯‰èd%tyÒ¼VKOöFÖ­ûƒ=×WŸOÿ gÌw¦éšÈÿµê ÷çDÅ¹!(<0uÔò£üVî6\FØ.^„Ì•>›ş§còÙ[VçóE-:YhäB]ïå@âš±9ÍQ¾?CÀ"…ñ@€l¾!Îª±¥’Ïîº˜Å‘C3\,j¬N=g’¯Kf¿®75õ—a\û“Íè³P Å´¸=İ¼èÄ+ĞzÄå¤è¨a–ù§Q3ìSí»%zo×PõÒ^VF>ŸĞ!1¥Gh9‘—ËşõwˆúßI4ö¤bº·S‚È|1Åk¥Í%‚~eÌ§‘XÒfbQSIhd	°Ü+ŠöÉ«™Ê‰ÕÅKæ®WWÅ®&f0ºv76V1=‹mSªOgÕÍ1²pfèãm©#ƒ$5Ëç‹³7Ô$€àl…6ëä«H›ğq‰’€!.Â¦›Å(µEÇh5´ÊLwtSÇ»k÷Û=SûC@YÄP§®³qÒl»åQFkmˆÒÔ¿Ü­–ÌB­rO!VE‰5±¯-2ÇÛ?Ş]Àê8Y=’íyûĞqXaÛpúìk­“°Ø©L‚…tIšÉ- a§eæ•£Ë†~úªŸfMñ¡Ì–½'Âu6TŞH>èc[rõñğ|Íà¦ !ƒ+™ØI@áOpÁìå)»”¡PS‚_Õûü÷ºæÌµîsD»ÜWí”ÿ:ì­$	Ÿ‡gÈFÿa|¸%ĞÌåñ*?°ÀõØ=LÈòÁd%šx7x…Ç.ŞÏ…ÆÓà Ís?RÁğ¦päìoÁ.ÌËD¸EP:!It­‘ÌW%¨zY'ÕôÍuÔ—A*ü¥Ô˜úÛòû”ÿà]¸¤¢5¯}cìéF°¥ÙqÜìå¬IjÇŸXõ‚ `_«\@˜JP‰ñ˜¤Ù]˜úÏiT
–†7ÔóÓËÎ%½Û…Ğ~LJÔó²dn¢üš8eO•„Íò©dÁÜº…X½ü5ZÎ­)|Åª# 4v&`CîHºéWš]N\pÆ2Áí™#‚Œ.4ÏçÊ±æ¢‰„=ÚÚÑK¡Usæ œ³%„ËÁË/ zñÎW€ŒçÜSäĞK’e$”×U•^oÛoîvog¾
t"jàêïtÎ•etJŒÕë%„úôíÀí…°JåK@gTíwÛ@À@†#­
¢¸\<Ô»Ğ-”¡Xg[(c*»ã®¾iÄ¼¦™³nËÄáäxñüĞÌ1‡hˆJ•À|‡ä^"/÷ŠËÈĞ]øêÕèCÖe–RW<Ns%mÀí@…îÍº \irŒWO(²A*İø©9	L¡‘SßÖ.W  »§úöŒË’^”ü
¥±Ì__DÆĞ)Ö50v¤d{”ÏĞ}‡¥ñ©¤€õĞ=¼@“ñb`Ë,%7†­ TÔÉ@ò6[Ø*”CÜPÅùh³¯¯gÑÿ2ßlÊpŞR"Cÿh;íFPDÊË@áz³ï49–ëïé×¹Ì¨QLR ÷œú<Y€í+ĞÆ«X…ËÈÊCêe½Í^PİK¸¢¢ıj®¥Ó5¢Åd+FTwºS{ğKäŒ°´Y²úÏi4 ˜—€ ÜóÉÎ5¯¥3…]5“W<€ì¤0ÁYÒerØSVµF²x8®´È%mvı„^ÅiƒYqô¾w0¨£Av[©ÁSÖ5HÉ–Ğt„»ŞE¹#„<×ÃÉ¶Å´©†5Ü«àk#]s¯Bú®tµˆ]î6ì:i¸ÑïøUê€7`t­ŠEqI{ïŒÈwr*QF]|Ï¬‘UEÚ 6	F7bş»u‡Ì®ß„âË@a$£–èzÕÊ Í‹ãÿ£ÜZíø89¯Õ¹m<‘xD\ta5Û³[ìYÕ÷|ÿJFñ® 7†‰iC†æ…Ğ\‡ø_/³*‹f[Ù}¬Æ”‹'®3.TÒ#x>r}ğÍDáÎÒº+cr»ßşs/³	*Y‘È¨!é¡WWÖW…¤¸Ûò¥‹GÇO–İf†÷ft=M%g=ïìW’<8thDS³Ëæ|çñ(7¡5ğ<Êú m üˆ²P†É^’ù»]+[[A58zìú0w¤ó®CÏ€üĞ¨ AjgÁC//>óÛ)/ …ÑÂıZÜ’l©
Tªƒˆ“NP ÷œZ8õ‰å/°^K^å¡ÿfÍ5íşC¡” Ø~í‡&«	ç÷9ñw)­ÌíÁ"<Ú®úØ®I’ëÉKµ¶Š‚Ôˆ\Õwhd†‘Hòvjùóéd0bÁ¶* öè­‘ªˆEÒ¹eíÃ‚¤ã[Ï50’¦[Wî f,– ”ÍöPù	]ÚøÆ'‡”eÏw‹³öô¤­®Ôê°J£Us¯«Ü¦R¢¬š4"Z>ƒ+ˆsÊÉ‰L´–l³Ê!SVßi‰’5SëCA}ì`ç®÷]öl»µÔniy@ àQï@ì—íàêe[dç7aècıÎ©µoÎD€¨]ĞùYæÑ]o Ï³×9-ìí½ùüZeF¥åA#eN™º?fiªç•€^‡ ^ƒªDKğ}œä–‹'æñ0ßIL2)¤Äy›¯ãád,t_“¸`,e”!F}è©+©4Á3Sö.ÕôúÊºÔÈìÂI¤Ö>X›Ç“LkqæÅˆÖÏc¶0U¥DcÕj”-µU½KoĞ„…°I<nò§Fó9q}Îˆ ?¤¡RÄÑ/ÁX"=C”PÑ³)÷€ÛÛsŞ¬ˆqÜRcor|Ó$8/<™¶@Ò„‡z|ôA—*Y{†ÎÄ­/ş®i—X¨‡ ƒ•ÏS¨YZÒ0ö™Xô>½ìÊ7f)ıİr½ÿ>t`fWù¬µS`×«´õ3İxï]J¾§	–¦#çz¯„‡½	SF½-—ÈÌ’$¡¶-[‡[–ùÒ-§ŠˆAçÅ5Ì¦wVõ¾Ù/0Ğ†V6O+pj9¾m!ªIG!$¶	ö„zÃl‘‡ŒªÏ³òƒ‚‚ıüÊÑK¯]s¯M›Æ9Š¨îšÉP, Ñá	íĞ#–!t•Î4Ô/ÆG9ÕZ²*PÆz§®§M÷Dº·uN\ë$ûÓíÀÄÓÄ/x[zn]*Uˆ	õNp…èşÕ3Ríèˆ•’Í[ó‘^[@a„ò÷Û&€¡×´¯>EGÓÍ<
É€˜xÊŒ.ÎÑ“ÃÕ^)}¹n‰e+ÑÍ£Õ»n;C|ö@H*SRåĞğtá¯èä1vyÚ”7K[={XWÏ£ÿXˆùóS~›R5Š¸’ãºúÈÓÙOY¿,É“›QOeP%”lÃ½v8Z)Š ²(ÕÃ$IÂ¬¹1l_…ú‹jÊzxÜä`Øğ œ›‘	ÉqÜPÁÑi³­ŒeÁ[¯Ğ Ús®@@bAV/™W>	›íV#QîıÒ4ÖåHƒnê“¼ªÔT£˜Áø}¹]Ì„[œ^éÆ†‚ŞaØEˆ½X—
äÍ¼jnçQu¢ `WÆWùÜŠ?)Úá™‹Ù¤6˜øPi$ÅN‰àš˜î{·–„½ÁAr!éøİFqÑîé]@¬ÓrÉÛ–Å9€Šm€&S‡ß’éŠ50ğç/f÷I5mH[m+Ú}„´¸”	r‡šã}¹ƒ„ŠŸÆÃ¶T²Ö‰¶5ÀJğKS¢h“Â1‚Š€î>^è[ØÉ‹îÜ£!t4ë6X®âÍ%Š\arÜX[7Ê›â0öl õ5Gc6…XĞíÁí§ÂòJe[Ì'EYêZõÎÎŠº{ˆZ±Ì29œ²YûÑX{ÌQ×“ûÌyÌÕÒØÿwâØb&ÈÎ™¦tîHÿF§ê	ÚùØnn±Ú‹{i™›İÜØg aF=ª@8cu 5ŒYØ‘Ø\!T}ÒüSkp2	JO‘È©)£¡[^\¦[Èõ²ëöó Ë‚ÊJÃ‘zUÈšÏ.]Uu%Ì™„ÂÃÊrClGÍ VÛÙT—ÔÁ°€õğ«.,Êò&$$2X7x-¤Ã½ÍB¢Ö±JŠ0|Ê ½JÈ7+¹Ü'ešÙ]ˆé£x¼X U*3™x-L
%ß¾MÇ¯Ÿ†4,×‚5kHú‡›ªÙQâòœ„oú‹ZÜÎ„5©ÂğËcº-ùŸQĞÜü•ŒJj×¯PEÚ=ÕEsb­®TÛäD*ˆ×–>€GÌâC4—¤öóBË%K…[´]ó~MÎ×Õ‘b¸¡ˆnlK‹ü.óœÕêÎó@˜Í5CÌ‡WÖåï(´w!5mÎ€oÈMU;mõhòA=ˆ¢Şd›ÏämUÏ¾Œæ\ôíë*ˆ¸ş
Î!v¥Möè‘—NÀ.Ş?‡^øs‰‰íô–!t´Í`{}%núy}º•^&_
A-­	â®ê]ê¯¹ümu:]áâığâ§U`cW`ebT©>]‡³sÏãHÅÑe–ëñ1İ²íYÿ‘f[pÛ»úìyÌİÒüş8MœÈVwÉØü;|[G¶JlN›w—ª²f-õ,È–ıÊc÷y#|¿pvfR¥¦Vcÿm¡fwQ9®Ÿ!b|¼vB±à„	©Ş‘S[gvW…äÒËºöÈÃ£¦FsŸmíšÏ¼iUz@®üº0„H¤¤•ëÄ\‡‘"Z|Ñ±ıÜ<Êğ`'ºph§ÇZ}åè@ò6™éqM}KÖÀ,ùà e8ñùªáÍgØZwCJr9x¬"L|'¾9oEİ¼†´œÖ—Z;Õ‰Ìø!§¥‘xô¡äÑÊòşåicº5¹Ÿ2¼ìm½jl×Ÿğ•²<M~/ÜµËÖABp‘Ûëç×sÍ¨†A)8Óıc•óWß¿gNÍzKE“=ò2mÎ¯Ñnû%ö§úcğö1®—OF¦§¸¨áıÕ5ÃÎ‚÷V%®(4Öw6 É5|SKEgós®9âL²íMĞ@—a\UïúËÿxñá™Ëşš®¢«t£OCë£m®†,‚^Ìq„®ÛQëÖ7Ó`bÖÓ(×/¦Ï¸4dSÛDùlx¯®·ıùl½¹·R6
ˆTl®¸“î­Äò->6<T½xÈÖAÇæU“÷g×Måã52íÑû³mZLU[³û}}ÌÕòœş>i‘ƒ uÁ¬šè!IŠæu€Ü…ô^T7óŠ‰gÉ´SÈæõïàqE•ù`Hx~råĞØUá«…èe1µÑ¹a9²
\°è‰™¨!{_ö^G…ôşëºòŠ¸²çzeÆÛäm1%ç½…»V–eiHİKFµ©|ÒÕñ>ƒÈåò?bDÎŞd%šX7Y-ä]¥à@Âö¹	Èq?ZÅ3„ÑaãAÉ3f‡“¿`ŞìšQ˜aLT®1x¬¢|H›>9NE›¼¥Ò—A:úÓÈ´+áñÙ¼.õD€ª[±'÷Oáãl×{Všû!:ßO™I©µoTº`§Ôà½†$bjÏ¸z_sñ4bpÄ$•i½3¸ãÀó8–äöÓS:ì5™¡{Kÿƒ=^mæ¢<İ‘"¥·£z jÕµmğ…ø™lîEÊÚõÔ´+…ÄnŒËbHUòCf¢q4g+:è!ĞÀ*AËáI†ş8Ïî÷+úJ…‚ÅçË6ô¤¦=ÜîäK UwGÍ»Ê–Î¢N¢$‰=M$‘ÏÃqü!æ}5·Ï!OóM¦ŞÍ7û!™%tàh‚…”]îl»EuS…¬úñÍÀï…ÔğjEÓ`Bb9j`ußâÏ«ó#âíè˜9·ßYÿ•>] â8ùºä\Ìİ×\Ş>Jgñí wéĞìx©Lîk ¹q|†Ğv óª©dmğ}¬vU‹wêsÉ˜^MA{{ÍpĞÔá¯È¤|YÒì_B<ûF:^ì©énŒUçµNwñŒ×¥¢Ìbó£¦Cù¿$ÉÕ»yIQPmüÓô&¶/ô$ò	Q•ÆĞ|ã‘Å/´°ı·SL;âŞÔla½P@*Å p]ÉáàÒş} 6@ziüPÑñx³şeÃû3ßŞªØü;$Ë	!P†(.Mr¾út.AŸßÌPl²ê*aÚƒÕÇ˜dp Ö¼ú<u¨ä9ô^‹REÃ¨êG³¿Ÿ7ñNß¿èÙ±®G“xÅÜ@‰^6WÈl
9å``	‘à.”ğs ÊÇi4(²´'ôóÓËê‹¥zIÀıbÁl{qÆ÷ÛH´c¡ûéG	jå—oğ•¿û¨•‡Šõ‘}FÀ†4ÍêÃgt”à{oÃDğz%^îbÏ¹,†µ(¶)rÒ¶ã}ø2#„ŒvÍGÉ³5÷ü©¦>°ªºU$İ³À†®€n^çnGˆ#ÜÍÛzğÔQöq ñbLq§†Ş;åe{¶9¢}ƒŒ£M£lŸ‘&ú^
@¾¶ñ¸ÂÁÖ±®@,‚T*\ŒG6Õî$Ï«ÃÿßhhÈÁ9øÏ{ù±
zy:oFÓûcìiD¥ÜÌkNùı 7éİÀô§Hô•d§ä^/ò®Ëdi·Å¢†ƒiFòƒPk‰4~ñ¼\Á©¡pMiYçİyK8Oš*Yè‰)³ACsMvw…tòKØ7f×³ÜkÙß.‰Ñ»qlU%Œäã¼¶0|h$ÕÜÃ—¯óÿ¼Oe±Ş˜t«Òi1H¶fMÌ€bHmª ãø_Ì#\7¢hú=‘ùf_È¨aËûò<ŞÛÚ4= cGqÜ+^?lŸû[/LŸ÷ËWí³ÕLB|UR¤€Â.QÀê—UójÁ¤oºSZÁéèêcš'ù¿P3¸óì;ï½%B^÷Ÿ1¸Öm1"^.±²L"¨TÒ¹Ï»ÅyÌ·oU(	xSÆp¯…R¹übğoÌÔ	çz.Dä§‘XÒfBñóéL "Á’" ”¶éEí°.È±¹v»×{„ü!M(Ã—w(ˆƒğS<[Ê Cª©N!®¤¿)R„²ã-™#£„.5ÏçË4bìmí¦1‡êğ'b“¯iv±Wäáû<]Ç‡~ˆ³ØÉ6ìÔ#–…TŠ!vz×¦Ï[ôôtVş+¡aàŞ³Lïl¯ñnyàFm
ÚñíÀÉ·ÅrjT[dg6%èzÕÎ4ÍÛ@²¼Lú+š¯[MˆïQØ:S*`BœŞÙíyàÁÂøø>jGÑ½H‰qÄ·H¦.öÕ|ü]:§ãÁ"Iİ]¬ÆÜê4«}.‰F_N:a…‚¿I¤ï·äfvyÒüsk0º!2}“È¹9±CßöW¦Ÿ>Ü·¼ÖÁ’Jš¦ äÜÖ? ovRˆ†ÆÜfÆõ¨,‡ôÀrãÌ§c=¶ ÷¤O÷T úu7ú‹ß¯émÈ²9	Ép?CÌpÃñHó­ŞÉÛ‡±Ş‹Àœ:%A7.@‹pÄRIku²¶i ßéÑq\K—7Åk¸ŠÒ¯ü´,]¨¶è1¥ÜÜ8ô~¨.¨o*Í&ëkŞÍ8sªr»(HO÷ŸPõ²<$`;fùİ åCğ9×‹W6şë‰'2–¤ôÑ               Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Submarine'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Destroyer
            If PlaceDestroyer(s) = True Then
            
                'show coordinate
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp + x, ColTemp) = 4
                        Next x
                        imgDestroyerV(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgDestroyerV(ShipNum).Height
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp - x, ColTemp) = 4
                        Next x
                        imgDestroyerV(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 2
                            Grid2(RowTemp, ColTemp + x) = 4
                        Next x
                        imgDestroyerH(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
àá0 H0%7`   @Dh" ¥Ad2`V e„,,íj1 1€ÄD4A¥$È+%À+ƒ@ˆ@QˆÂ MD² Â¬+Œ ¢Ñ  "À%…¿®A†À°TFS  äl#aJxEggy%µcE±C…â   £"ô  (!C ¤€ P `AA`aMJÅÈ¢* ¡†%UP 7 !jAÀmPÙ`Æn¤bDÚ%¨@ !fGà(á,"CÖ*#`°-	K CÃ!+˜€%½"  …D"€—UAÑ&ñ'	}ßaóã è@HTz°®J@Eb4t( Èq‘"@f"‰dZ@(°I(B
QP(0m"Haf
°j©V)`*0IĞb hI ¡@ 8  ¹"PÀˆrcpã"($`±…&HBÄL G4 …"lgÖaïÖã­a¤  
xĞ°8€ e’0b&T0 ºÎ•4H- 	@0V áà 8-À„ à2€Q
ˆ!ADA @à #!°¸0	'Â°¡B!À[) 	j6  ƒä„nj5* ($„C, ²g2„<È „Ô·$¨!°a˜AbmçŠB¥™¦ŒpªW¬­E`¨}	@ Aq" & Â!Ø„ğª5à  ¦B%LşÜÉ7V€!ˆœŠQƒ9¥Â
ÑÄ4¼Hb)‚P€ÂaNÀ t  lIàˆ P516¬  Rô ,(!@PÀG’Y! N4("H¡áè€%|DÄGí#<Â! X$
#A`h|€x$psrÂŒ§œ:8® 
3L¢`×bßF‹å¡FK\tAa   Ó Š@0"`ğ ¨
¨ø `€h ¡1CE5£–`ôRÏEIfğˆ ÂdJ€AÈ0b!%*")‡R2"¬ Gz!Â‚NH8Ó V£M$Æ”}Œ)Àu2*á HHˆA) D^ğ-½Ä! 9€ 0“gÈ€¨`{ìät% 8SÀ£i®'#iC¨
@0–!3^(äd0(%´¤¿Bã†å`iÀŒˆÆ@!VBÜZ¡0 ¬%É&‘QTğv(f6Ç!qE,l€ PA ²(k ÀpÀ@ÃÀ
/PA¢»0H(« ¶q !  ”0æ< p!$@8	¡ )¶„	Ã„:RX
Dxœ€}f2`x"'"8É`*T ŠšÎ=ª§9a€¯-³”:o§±8eæjWKkêŒÑÛdã‚áá‡áL5UÎÅ¬Œˆ’—JÜ†Ü-¼Ä ¾ë aÈ®tóXóºÅ¢ïm'¢)êC‡zšlÙ˜îPã‡‘ñë…‘áI-—Äi;NÀŒ¡ÉÌ‰ŠÜ¬®‚T<¼~!qX·*ñÜw:e¦w2çbkjK—lšn=
lã„ûã‘A=P
M;ÆÜU›ÀÊÔÆœÜ¬,ŠÜ­¼¯(áX¸Ñİ÷;eªwzd"kê{jšì[ZlùËáñÖ˜áÅ)µNK=QLƒŞ€ÉQš‹Éà}Ì´¹'ÆqÖ?ºñXo*i"÷ºe]ë—êiVj‘šlK¬QêM‘è¡‰5A;LÎ(ÄÈ’Û‹ÚˆŞŞ¾¾Š\©´¯0ù~fåØ÷:e²öE*Ë¥ëĞVãÚ(õX3DãâUåK9\M¹mÈÖÚÎ]Î,î<Üh´¢(ñÈ¯%÷Àûª3şü:pærGjc]¬
Ü~EŸ}Oã†™ág‘áI¹ÜI»ŒÑ	R€À‘ŞÉ¬¤
Ğ.¬?©BØ¯k²Å÷?e#õ;}²i†fj‡kœ|X[%\•‘ùá†áI±—ÌL=ÈØ‘ØÈÖŠÔ¼¸WÎY;…Kİ˜^ÍÎßµ|ÚNæô÷èùX¯ ñ@ö²å«'˜u¢h—ak.ÄíÉŠlYã†“aé‘áI9DA*ÉÅI•Ü!È	ÖƒŠÜ¬¸
Å¤¼·,ñÈ»8ğœ±¾=¬ö0c¢{Sk»Ã.Œ€)LìYa„éá„™íÍ;ÄQ9šLŞÊ^‰—^,¿šÄ$¸¯(ñØ§(öÈó9e&o1a#+Ië•‡bšLnŠtUcq÷†‘åK9•Î	ÿNÍÈ‘†IÛÉ“><LÄ¬=¿8ÓØ{¨õøö~~"f¸¥¢/‡hljŒ
n]ïÑsë‡Dá@9ÌQ©ÄASÜÛÈNÉZÔå¼’\ ¼Ù(qÑ=(ğÜ÷+x"ò3e¢+Ş…ji"WZîIU’äØã’“àã‡‘âÛ;Ìi9™DÈÜÈß
Ü¾0\Ø¬d¿8ñĞ½hõØæ:u õz-ê8—Ókg†zPÿÄFYöÎˆ»rˆ9p+ªõz1š«·ß.a7×+ë²½ùº6ÙG
¨Ï!¯a</emôörö…£Öú–ŒÊğ©ÂÈ9v*Ô‹±:Ê¡£Ê*é¾W½­Q34[_2%Ùï„#ÇŠH‘½di¯fùö÷…—rä,‘ŸÒö–Ğúˆ?bª:cÜ£Öò„Ósˆ?ò•bªŠc"•‚ë}å.á?Ò¨´—á%¢0ÑÇ†áÏ^fÇ®hm
- ­Vv‰vö…ÜP³ÒbŒ€;bˆ:â…(™ƒ£ª€¯÷×&k…*­ò1Ø"5P~‹àÛ ®în‡¯dmrò“2Æ•–ÀğœŞ6ß/fÍ	º –.š£"3†.ùvT:ùz-_%-ÛÅŠ†¥×†„#¯Dmï)mr|•“vî…™Ú"JÙâœ»2Íˆ»`ˆ*Š¡(Šİ¿×oì?Ö¾ÿj7Ñ05ÙÏŠ¡Ç
®ª§äm§«lm.Ö©‹bûĞŸŒÖòš•ÒsNû`nc á• (‚¡/W&ù»Ô:é"5Y05ÈÏ1Ï«­—®gm•£køvîÃ“6æÇŸœ”ë—Púˆ+b‚¹b*š£,Š¡?Ò,ï½Õù"Ù05ÙÇ
¡Î¹®bmOëdíòò‘rö…ØòÏ”Pòˆk&…š/2*Bà*B#3Qj¨#^.!›69I2½Ñ_¥ËŠ
 ¯l-‡.`írôŒ™òö™øŸÒòœˆ+ò…ˆ»c¾Š3«Š¡+G>ù?×.i27Ô_²µÙÃŠn€Kˆ¡´u¨Æ¯hd*ğ”—7ö…“Ûê/dm¯uert‡òç…‘œÒRŸ’Òú’;b ˆ3Â&•ƒ£ª‡£?Ón©wWí¨Œ64P¶uYÊ µÏ
Î bªio¯D}²ëDƒröE““¤ÖöŠ“7â‰:5Üê‹£aŠá;Ó7 ¿ƒ=nN:7ÚhsØØ‰éŞ!lm¸ä-òç›46…ŞRà[œØâŸ?b‰½dM(Š¥®“€£=Ï?é~W,i2İh5Y×¡Ïˆ
ç¿nm»,íòç	“òv›Rbœ’óœˆ»bŒÈ»rln•Œ 71¾Ñ¯è¿‡&¹År5Ø"/ÙÏŠ¡×Š¡¯eíndìræ…zÖÅ²p¥—!à&‘|Ñ[iÃ³j_ù‹ì_¹€æ1–®Eô•ÑÅü–İº>ú>É³Çİ±AªÈƒ‰*Ê;è§1#ğ»‘¹Ç)×“ù›|O<‹ì_dš|7œæD}ßÀÀà–Ñ xP.j>İ¡ÅÙ»†"A“ªÉ•Š#à7#`7™¹Ç+EydŸ]šl^±”ë:Ø£äø•ßDô—Õ”x=”h>Ü£Ó¬ÉûÜªš1¬c'‘¦äcÒã×•¡F{šl_y›,q ‘è±Œ”ÌÔü“ÇÄ|Qp<ğñÄ.Ä»‹ÄİD—Õ\l^7xZfP±ÓÍÜ³Ç´ºúÉ£ê?A¡å5Aï†Cåhì_y,±Qnê ªÅç……Ä|— šê)/Å2×Ïßã—†H™¨ù€#à5#á³‘©‡”)G‹ëÚlÍ{Úl	¿ÄÔ"µP®Äa—]Æü—Õø>x›.Õ9ÇœÍ³×ªM›ˆph #ä'‘#á´•«ÆÙOmW{—lÍyuß°Œî£€ş@é—X@ü—Õpû:T]N*±×ßº]ŒºIˆŠK	+ 7‘3à§Ã¨•À]¥Ò|O“nÏ7î¸ïÆÌ—ÅÄüWLz[zxP}Í»Á˜E3WØêÉSH(K +u1Ù£`'‘©u­ıÚlZıÊì¡ “ş§ˆäÇ8UÔ|…Õ„ø¾40^>Œ£—œÙó×Ï©Y€Hˆ3l?’£`4©ÃP­ÅKm`_q›lİ±k8ÌäÔl—ÄuÁÖ|şÜèşZ CŠ1Øœ¢MªI#ğ·•0t7•©ÇTº—ñOd÷ø\µ€ä*„îlè—İÀı“ÅP¹:{:Í»ÇÌ3ÇŸªÍ“ A'é¼!à79‡‹Ç‘ù›l\y™|ß5”î‹¹§y”|»lO©‡‘è³F’æÀìUDä’Fxš¯_®œãÕ•ãÎ„öZG«£¤7•)a7©ÖÊ£‡	yŸl_{‰p‡» ˜î!…„nDì×ÅÆ\•Õ• ¼ø&UóMÛâÅ¼ªÀ®Z(à7Ùa¨7Ù­ÇŸ¡Õ=›ì_(‹h_±nù@ lÄü‡Ö„ü—Ô”ù>}.Í³×Œİ»Ç¬ªKŠIE{ÈÙ+ıÎUé¯æİ=J¼™lXîlLûÅ9AŞÍ‘@Ş–œİÌÓÜ]ô™Š.cØî±„èŸõŒ8Ÿm¾n¼Â~ÀÓû~ÈÒëù´Ïµ6Çf\ê
,HêÇ“AŞÁÁ‡ÈM-Ô™Ü¬›Ë*a™*õ€ª-‰®Šõww5…Â{ÊÕèúÀ‡â=‹&\½‹´UdLjLÏøÅ‘@ÒÌÈ…Ô]¸\İô™ÄàÕˆ~åêše€e>|Ä6}MÆfÊÑékÈQî=Y]9‰´L“ìÌcåÍêU•ÀŞD•AŞöØU)VŒÀlÉª¼™d½ˆª-»˜å*Â¬zF~ÀÓëşHÑ­½¥U?‹´‰“ìÊë›lLïÁ‘]ZÍEÜL,×]ä“nñ‘cù+ŠåÁh:å¾V¿üÙÎxX‘ë~Èsù=¡º~´{F|IÓ{~ÈØç=¶M7´Í	lLë`HşÇ™Eñ›	Ñ–Ì]ªÆ”W4•Œi­ˆ"µ ²ša *w¾u®wÌ~H“«vŠÒë=±O5´MÓëÎ"“¥ÌêU™IÚÅ“AÓ–ª”İ¬™jp‰n,ñ“ªËå®–a¾}F¾3şĞï~ÈQz-´C4	äY“¬úGlˆùÅÆ Ç‘DÚ•ÜYí—ÜX™hóH*ñÀğî êŸ¬ûÿÖ*yP~˜í{ÉÑ:>KôA<û_›ì]êìLîT±AÖÍQß—˜Ü©—Èı¬šˆhqŸˆ~ó‹â¥Æ+Úõ®ş²Æ·òF|ÚÁïnÈÓêeğ\‹´]l\ûÛ|AëÔ•R^ÎĞQÌ‰É,‚[şßfáˆêøª“å‚*ŞÅ¾}G¾}W|HĞëëÈÂë?”]½±]KhLê™íNºÕ‘AÔIÎÒ†U¤ØWì@bqÀbà”«	í*e>}	G¶ŸÇîDÃéÿÈQë­‹4İ=4I|\Ê0NcÉ’A_Å“ÀŞ–œİ§œ,™ˆ\ñ™Šb±ÃŒå+ä:uN:ıÄîÊÓk[ÚÑë=´[=¶]lÎ¾Z]ÜlÅCŞUÙÈŞ•Qàš„Õ«œz°šitˆ(ä¢å]¬Šáù™ˆşa’ e€«ø¾Â¶ßL"ÁÓªf€Öë5	±Î)KõİcÎâSlMêEAVĞ“Q^’œ]¬˜]¨	Šèá‘Œ y†)^æŠ¢M½67…6ÍÎ7à@\?îĞë”JbñJnYÍ¨ØÉJ*è[{äJSûÏÉ÷uÄÁ—AF4*	–<²¦™—ñ1‡cÃƒ
HÆ
N\?æP\¿gZié&íSåPÍ†äQJOjàG{éHD8ÍÖ–=ÏAÃ¾‚¾:	Š<:Œ˜á°:¶áLÁÓ“ZLY½åPÜÿ¾XmOrg™ôÙAF¨ÚOÎ àBE{ğMû“W,ÍQß¤¤˜'ˆĞd|Ì šb¸ØÅğÂÈ„ÈNTyâĞ\+*Pé
wáÊÈ4É]#QMN(eDséƒTkÇÑÆ6ÓÙÇ4‚=:í2´Ø“é°’FÀ€DS”šÈ\şQ
?²PñŞOnxŠÒ7\EÎ¨YMÎ `YÅyàÃÄûOÉÕ$ßÁ|i°Lƒ­¾M¥È©ë3ÚèÔœRHæ
\\-âT^7£éOc~éH6ùEJª]Ş¢ìIj`ÀGxË×<ÈÀK0^=:‡˜º°	—í°˜—#ÆKL†€
N_¿ğÕX>f@á^Rûù@d[M[¨ÓÎ´ãÉQ{à8ÏĞÇ4ËÑYO¨àSeùåCUyŞÍÏ6ÙP×f‚ı3Œ82M°Š”´ğ‰•áÓ‚MÇÃH^¶âPÍ/àhÒöëHb]O¨XIB éG:à†)KÂŸåO‘G †<2†¬º°‡å<˜ƒñGƒPÎ€›ÌQ¿®à\?êXéHvaIê]MN£WM\¬èXæCÅëÏÙÕ4ÆÑßu<(‡¾šíäL—ñõ˜œáF€
ZÖÏØÌ_¼ğPD?àA1Zfi@vPM(ùÏN®`CÄ{hËÅÿOÙ•6ÿQW%„<:¼8Ì´’”ğ>Š–áÍÄ‚@Ü/îPD¿àPé^Jfi–
&MMÀhHÅ–¨£ÃE~à×@nÊÙ[tÏÑÕtÄ<:†5	òØQk¸Š–!NÌ…

\H;sSÔ/rQáJ’óNË÷ØB_»\Î¥ûQMyğCÅüÇ‘¶_PV0†,:8:¼˜y°Ò—ñÆîÒ\:fP]=bXéBæÿšwQêLL ğAU{èCE{ÛÑ×÷ÏƒÒôÂ$"‚<80
¡±œkD’œDÄVDQ7*\^?ì¹ZöÉÊ~]MŒˆ[]N¨`ÁG{êCG?ÏÑU6ìÁÇ=†½º>³œ”–å´XáÇ€˜^F‚L|7òZ\ÿâĞø_H6)BtYLW Î@;„ˆÑDSßMş§•xú+•À³¼R·½ZÊØ„ã‹Ü‰ã`¢AbîbvÆ¨ÚbÊ(PÁ?#H?#:Æ #ÃaQˆ…\×ˆÄz+…¨z«$è·şÚ·¶ÜÄ‰˜ôÊPã]s+Gâ!¦À8ÌæF«Ü@£³)A?£Ô3–2ÂAWˆ±\×ƒu?éz+È·8ŸÊ·<Z›\•oŠTÍgò3Mè£@âÊ%ØfÇ*ÈAƒ¿3Q–?¡‚0ÇÍöFIÛˆ™]–ÍQZ±;_hn+…y÷¼Ê7¼ÔRŞZjÆÙ¢ë)Q"'K¦j*Ğæ`®ØT¿#J‹öa;ÆÂ£ÇÂSLT\GÉ^z+•øò7‘ê£¬[5y’\RhgÒP÷à Aè sæO¢ŞæÃşĞA¿ãá¯#‘;ÎAHuƒAE‰UÔŒÁ2"—`~j”h·¼Zµ¼ÒJ^çÈXæê²Gf¢C÷Z,ÄâF-Èä¿9IÑ7+3Ğ1ÀA3ˆ‡\T¨™ßr/Õ¨z?Ôh38Xº¬ŠZJHçJ_÷â&Kâ#Ã¦À*Ğæ‚¢XAŸ³Ù½#³FQ;VÁSˆÈXWÑ\x;œêş+Åè§­
J·¾RŠX„àZ^MãrÅb"ƒæÂ*ĞvÂªÈA¿*C’/¡Ò"÷Â IÇÂ*ØI·#A¾£±1ÆD³×ÁV¨ƒÈ×Š‘ÜZ+è²+éh·¬Z¦´VÊŒ	§Ê‰¶¢(;*Ræ*˜âÂ*È@¿#A’»# ³FC„?VAGˆ‘^W€‘Äz-›èz«•qŸ¼šZ·¬jZZÏƒZîğaç$¦ƒj˜â@6˜Ç;¯+I7#23ÂC 1ÄXWŠ‘]Æ“Tyn({+…øµ¼¾K·¼àZC[DçU	îKº$Ní«NæÇ"ØæÂØAº!é[³+T{LA5ÒC_ÈLÕÂ‘^z+è{#é¿ğÜ·(NÆtÂĞ^æâ*Ãb¢UäÂ*ØfÂ0JA[·"A¿S•±ÂE@#ÅHU\Rœ^8/•èz;•È§<œZ§»VZÒÏçÈØ‹ãà¢C‡b2CnÂ(Ğ²B/ØP´
Ã«20DA 3EËˆÇÀ ¸¨Õğy+ê¶&X·8ZÊØˆwËØÇğ+Ãb2CæÒ:ÑòJª‰ÁW¿áÁ—7{\3ÔÍR1ÇHÜSHX\;‹•ëc»•ì7<Ş÷·´ZÊÛÍ§€^Í¦‡ò¢Cp¨ÇÂ~Ûîâ«ØÁ¿!Q»#İJÜiÍØÏ)+êï»"öş9,B–öÛŞIpVÙ4Î PS¸ºÙX°.ğ“”.À“ÒÒÆµY’:"Y–¡æ Énâ“R—ÇñÏÑ1W’–VšÍÈÛªÙXİé1bï°;âç)¼J´†ÖØ<_Y¾F Éz ™€¸né“ÂîàŸÒÇ¡6ÏÑ«Ÿ­ÅÚPO+]Y_)«âí¡*âo?¾ÂÖ¼ÂVÉ“:×Ğ¸“ôÚ©"Ö8fáØ$"ÓCÀq\Ñƒ¿×›–ÛØİP_)ÜÚ_é¨âç¹«âo;¬CVE¼Â^0Ù<İÙ"ß!ÙÊ©àYš¼:é“Ú`bZTG5‡‘Ó_•A^ŞIÄÙ(I±k ç)*bï¹¼ÀÆ¾BVÙ8@ù¼Ö°Ûè`z¸dHÚnğƒÒ•Ä3Á3_š•_ª	ÔH_-X¡+¾å;ccî-wÃÔ’¿ÚÖ˜Ñ“&VÙ“Ö¨Q’¸‰Y¸¡à“Òn¶“RM…sÅ“3_^›”!İX_,Xß)(`ë8;pï=&ÂÏÀàÂ–‰8F[<Ş QĞ¸³ÙŠ¸nà›Ó~ò‹ÂÄ3Ã9^Š	O
[M/ÜÌT-o¢ï3*şû;ì‚Ôt‚ÖÙ¸\È(Ò [’±¡ÉŠ0ş`“–iã”ŠÅ“…·ŸÃ6×ŸPÑÖJ_ùÜZ[!+`}!/êï¹½ÂÖ€¼ÆVÛ'ÔÛ³»âï;ŒÚı„—X¬ÖÙ²Æ"ÑÓè¨P‚©bâ“ÔîàÂ•‡™3•Ç‘#ş’WWŠXÛ¦WT)7;ë8® §«­BÔ„¬Ø²Ù8ÇÙ	Â Y’ê¡Û’ºî †=àÃÒ‡Q3M™"]‚ „ÕZL)ÙXK©+âï;£ ô¹¾ÂÖ´J†pI‘<ÖVyG Yœ8£É–8nd“ÒlèB‘úQÇ°s×šÔA_ÜA[hŞX]n6ïë<kë+:.ÂŞÀÒÙ“¸–\S<V Yš°°ÉS¬fâ×Ş~êWÓÄ—aÓ•1Gˆß›Ô×Ğ^ ÍR[+#jí=¨æç)œÂÖBüÊBH;VÙ¸ÖàM¸`YRyöğ“Ònà“ÂÅ‘;™ƒ‘6×_
ÜØ[»ŞØÓ¡.bû¿*äëù½ÃE°…”Ó›(ÖÙ8R Q’´¢yÒæ½à“Óx ‘ĞÌ™r”‡Ô%Û˜PÏDİÈ_©ÕX[))bÿ3+üï¹¼ÊÖˆ¼ÄV€Ù8ÖÙ‚xÖpS*"Ğ¸nl‹úô›oUÏ£…“³O›Û›	ÕZ[©İ˜ß)ëzé8+ğï¹8¢×˜èBš Ù›1œ¬ßí™Š±ªH×¾ô“Rl`“RÍ™;Ç³q_±	ŞÙ‰ÛÚY	ÍX_(/âç¹_ºMP])İ^mïâù9»âg9ŸÊV&Â– ÉtÂi¹Â Q”°¥[Â¨nbÓš;d-’”Æ2Å3OšœWŠMèT9İX_(âo9#âå)ÏÇ€¼ÂÔÙ8ÖÙ“8Ó!Y—¬¡Z‘¸î ³FnêƒRÄ‘;Í³ñš”]šTXß/Ÿ\¸5âï3;cä9üR—”´UÆÊÙ“8^i*F¬Ø“¬àM— rbÓSnbAÀÚ0Æ³ÏÚHIÌ_©Ó\[ù±¢şynan1üÃÖœ½ÂÖ°İ’8BI(–§Y¸¬Y“8î¢–‘jàƒĞ]†s‹Å#ÔŒÂ×‹‚UDU«Ü^O);rç1³àï©­ÂÖ¼@ÖÑ8N›#*ß¡Iˆ9¨€³rà“v ‘ÒŸ’³…Ã‘3_šß˜AİX])ı\Ã©#æw8k`Ï9<ÂŞ<ÃÖ‘ËĞÙÓÆ HÒ8¤Q’8nğ‹ÀbáƒÒÇ”3Á+_š]˜ÔA×ÈÏeÕÁß-#óì¹"è{1³BÖ8ÀÖÛ:Ö™W8ö¨Û8ğ×’¨nhšÒîà‘òÁ‘œ‘O‘3Û˜_šTÅØÏ+D[«9bí9«êí¼ÆV½ÚÔÙÒ›G=Ó°€­²@¸ş©“ÒnèÚË€8Æó_Šaption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 1 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid2(RowTemp, ColTemp + x) = 5
                        Next x
                        imgPatrolH(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolH(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        tmrAIPlacement.Enabled = False
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnPlayer2 = False
                        TurnAI = False
                        lbl1.Caption = "Player 1's Turn"
                        lbl2.Caption = "Battle!"
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 1 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 1
                            Grid2(RowTemp, ColTemp - x) = 5
                        Next x
                        imgPatrolH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgPatrolH(ShipNum).Width
                        imgPatrolH(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        tmrAIPlacement.Enabled = False
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnPlayer2 = False
                        TurnAI = False
                        lbl1.Caption = "Player 1's Turn"
                        lbl2.Caption = "Battle!"
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Patrol Boat'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
        End If
        
B:
    Call CheckTurn
    
End Sub


Private Sub AIEvaluationVeryEasy()
    
    Randomize
    
    I = Int(0 + (Rnd * 100))
    
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo C:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo C:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo C:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo C:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
              (n1i`:[ 14¸B 5u¦»4Nbì14 ¤.b1È
h€ !k& 1ˆ°@Àf`@ˆÎ¡BE d@€F&4G!AÌHX¡DRo° 0w|„2`ç0Y0K`ê€&" (  0B"Ä R  A¤ k.µ 4Q bU  ¢  h „((@ b~$PvV>¢¸„äcŒD€iD*BL  h02D=¤­`DäkD4„hr†p	 hb5{‚È$BĞ^, %` ¤ æÀ(„@âsA( 6¨ ¨!(``À_™$1rcAI"¬(22!D ]@dL( 	(À`"á  % qV€lN8Ä-) yS@tBl  j/€!S…€$5Qe
4HoÒàpy€3€ C¥“Rì0DGMdrhDiB$‰¤È ¤ÃŠ ‚` Bh`0 aCÈÖå
!	t„G@|lÔ¢€àÉkT¹E(`%  0„ V:v
P¦hå –(´dr‚xb`0pD@ d@¤ „$
Ls*)b`L:
 ©@8¨€F£f0"ì(@€^ íR"iùáxNFLb<À\ä²$9@x8Q@S²T( ‡ 0¦ 8‘ ." ecur¤ÂL)@t F£v (`f €@Ó!D €@„†R!x!˜Pl@ # RÅçMÏ dÁ  p8“4Œ ŸGãîQE€á` ¡*.@cÇ(2* £°æ   iƒ¨	RLR{€a¹&VHL’8b!`áÊ9!¦$¡
&\ @ÀÄ‚VCÆh"`$  j •€¡QÈ£X8 3€) ª*pš BX-8má#=µ‘3$ˆ à&e)€ ¥“`Bfa¤0"{l(Ài€•Å‚8€$€T¡ (¼He=f&[ĞE
`4 ˆ,£ “(& €$@¸ˆ. D3Š?08@¡$=@$sä aX Oa6™ı4$X0 Äqof & .Í	@H<)="@€	PDXXÏ4@9 9$-$eE©fˆ&I&Àx.C	,r:x&jğ4K
³	:K€¥0ØA4 & s€P( 	c$àua L¸!‘ $BK… ¢€@ `€#°"0  iõiHŞ Y4‚m| @á$@èPD†Sìä-—}taî=µxòl$Ôâ™f âçfŠ›“ê_‰ìE¼ÅwGü¬ÕwÅ¼Ù-YX²æd_¤ªdqHVa@ÔU,¤À|$`²é%y#¥â[g‹ªdfYƒ	äß›ïW¯	ê†5¼ßåY®Í÷ß]¶îaY´ê`éÀD–APÔ!<6,ü(ğt5¦cûc¡Hè'ŒÂæf[—¥fN‹¬¹ÁæŒµäĞ_f¿ÄgPI²Î`9×îtáIDËeTŠW|4ŒWü$ã°9ıaö!%êsŒiåfŞÚbg›¡?‰½ì­xŸıI´õıÙĞşî%Q¦î`a@]ŒbTWˆ@|4ŒR~dcÒ[¥qğ}Íá eNwş[fÚ	‘»À¸ì¼²Qıİ¼WõÕÚ®úäÙ¢îäaĞÔiAÔHE|ÑUügıâ¹5aò9¤ª5©îWb`İ›­lŒ¼N¸<UùY¬PõYÈöæbY²îaOREü@Ä×,$MGm7kr¹åárıvjgè Gf^u¡n_[…“Şœ…î5®]u[´İå™Y2ÆáÙ¶n`a@DÑHØŠ¥×d`“lå¡ó1¬#æ%åŒînò‘uö_™„dvÏ÷î<n¼½Õõ´ÕµÙÉ©n y¶¬dåĞÔ„õY8ÅwY@ô-àU6îbåÀP`@P“ŒG0$M* 5ò©¥añ«¨êg)ê‘gfÄŸ	.¡”ÿ¬µ(8ÕµS¾Éw‰´xPY¶®àcET†ãÀ^”×hÕt($y½©ğó)%ª]§
ù/äŠf×ÛÁfÀü¡îE´&–EX¼ßõ\·®b_7ø5EFUa@T×~6LGl$áğ?¥aê)¥œã•ãLã‘ànO›ÁF^	Àz¼Æü«¼ÕõK¼GõIY6ì"Áöûa)HZa@U®×|4Œut¤óz)¥ağ9…øEç /nG—Ál—Û€N„µ‹N,¼¼İõ¹ÕõYGôî`]~îpsÀPÄaAÔŠÎT|×ü!k¸-§!¢y¥èoègfÖ›…fÜ›‰‹îLÿî–¾ÕtI¼™õ]Q´,`]òş`pTa@TGü4×uiò)¥ğPi¼LâgúgqMDa\DEì<jÍi,;Ã<²ÃQh·‰Ù“K‰Ù’IC,‹ÂY2ÃL7‘Nü&Ne«”/î-•¾ò|âòm×bñ^Páß^e¼zMÅ}jÂ0¶Ë¨†™ÙJÙ’X “Î	 ›Êüß—ü"•†8&U3~«æruİc`}Ñó£^ÔRáÚFIM(|ºŒ%üûÀƒÅ^Fá[Ä0i<zMïµ»R*6Ó“¨¼™PÓŠ‚‘’N —€! Âô5î7Óì©£ø«7òl_àrY[âaWšJá_D H´|zÌ}xnÑ!¦.·‰›–\™É‚H ĞJp¯ìyÁŸ¾¦‘:«§x¨‰‡ú}¾í|_öáV”
a^¦Mï}+X=<6ÃÓ ¢Ã8¦˜ÓÊÙ’X,K¨ÓÁì&™—ô'€x©§x«™òğ}Ïâòûãá^TBÁ\X§}x[ıxzK`4W³ß™ÙÊØÚÙ’!bÑÉ É›øç‡x§ü«§ø»¯ò,ªfrõ]ªçT\á]D Mm<xOqzúÃ8àÃxfÜH™Ù[¢
] ’Êy§™‡ñ'h/…¶ø«¦âıSâry†¤]ÕaNUPí|b}mtzx„f9¶\‚HÙ›ˆ€’ÙE›Ê|$›x7ø+§ğ«§²=Ëó:}WxüZÅÑ@ŞEŠMmìzÍo|zÃQ¸vS
6YJË’J…“J…,’Š|ç‘Í¼"¹‹ú«•£î+÷¼ûõrøß*ñşBáŞ\‚Imløe\ş‹8ï…=®Ó’@ÙñšH#ÎtB­'¼ç‰üó¯ş‰¦puİ¢òqoâÇû©'´©§ó_ê¢q_âáFQBáLÁìhêÅumlÃ¨²A¼·‰İ†z9Õ–H €$“Ê$|&!ÁëG!ü ¶`sßêó}İbã–TáÎDƒGu´;Œ-|úÒK7S“(·Y–‘™‚È¤Ê‰0“Ê¥'‘%'‘Æôê&x¯§êY]ãòm_Âa^TùV†Må|;M}~jc%®Û“èğÙÓÆÀJİ’LC2É‰ ™Öü6•ìãÛşj‰¢8+§â}_ãò}_`a|t£Û\@Mıôü_nlnÃ›8·Ã‘°å™×XH™Ø¶ÈO¥’Ú#'“ÊîI–ü$……¨«@3ğ¡¦zyNjreßââ°oÃ²kJHÓ_HÒÖ:ÙÈ ‰…>Ë#ôO_!ô%Ä¬m¨Ö¨í‚aÒq“õó%Rwu%‚øg¯¦'6XkœfJ§ë|JÁ—ÖJ×†ÍÊ²ÙÊ²ÏÛ(öNÍ¡ôeÌäaäŞ¬my!uñq-sl%ák¯S£/¦pæºoCã»oHÌRLJL÷–NN ùÊ´˜ÆI£°^Ë³üd™.tåÍ¬èq‡p“u¡Cjnf õ¾R²¶¢Ê³¾ı
#zoG	PÊ×OÎ¶ÙË ÙNK¡õŞewğŞ¯m4Œ¬d‡q’¡I#ôn¤meÁ5}GaIpÂqõíae%’ ¡¤V '¦’ªªeDá4oJNW6ÏÊ6Î
²ÑV¸ÙK1ä#ıg	¬m)Œ¬`‡“ó“Qs’cu%su% '¦R¨§âZãºgÏoºoYHÇzH×†Ê°ÙDÊğÙ_#ôJ4ì%N¼÷mÆì)QGÑs0yõ '7%’`¦S -&C#¾ïÃå ogDÕFYUÄ³Ù
´ÉOË(ãKîğeÌ¬yåìm9ôq–5ÿ'cU¤Ò²µ¦¢'÷Kâ6kÚá¾ËHÆÎYÄÏÀ²ÕÚº™
Ò1üÆÁ©gäId|üä¬MSÖÅqÍ«¥ F3uqè3®R£³¦Jãºh¡»m P×6ŞJ×†ŞÊÓ˜ÆÈóÃ„FKdë5õu¼ieÌ¼ïô–	x’wu%’ò}%°'¦Ò § Sâ:kB§|'H×ÏÈ÷ÎÂ¢ĞÉ«ÉAO#¼[!ÔmŞ¬ìe¤ë§ù„
@ñ’qu qt%$'&[¬¦Së¸æX£º÷KÉÒ\ÎØÖšÌN2Ù•ÎúEËààK!ğåÌ¨ïeÜ,m1˜	s/%
uµ¡'>R 7&Vû¸kBã;g(é×‹8DWÊÎğ Š²É$µC!ğ†HÕÆ¹Y€R6ÙFK8öC±ÑéÌ¨%aÄ¢`‡‘ù…qó‚su¥sf§r§¦P- ¦’âºÊã²oJÇÎHÕŒ¤‹òİ”I¹ä*K!ôgÌ¨ï6Ì¬©‡ñÊEIsÖsõe’ó1¦ 5&Ò²§.â3hÉëºÏØ@×ÌXÇ^Ú²ÉË"ÙK#üJ)ìdÎ¬÷eÌ,í`q’sõ¥°ãw¥’ %oTc'eo;àw¬£áó´zÏ#–|Ëî8¬ê™¹Æø
R¹XÀP±Ó²ûÄ{¾ûÄ|ÜuUT½éıXé §Z©ş‹íàşäøo+à3o
`óŞìÎ¡‚wÂ1Œô–d(|Á‘Ğ P·ğ¾ûPt|úÌw]õ™|õ™è%Y©¼!ùßÏl{‡Åüëÿ£àóï¯`S–|í¡–E¥¸„ä˜¨d‚R±XˆV¡S¶ûÄv–ùÄ2ôÀÉÜu	èg^ˆAwZ©Ú‹ì{ÚìùÎ«¨!oá,V<~ñÑôM¡‰¨„l‰™†îB¡Ğ„R¡ÀóM>¼óH"L÷‰Lå™ t^÷ c¨XÚÿùÚ™îyïŸèón«`ò”xİ½–xé£™ªè¸i‚Ò9À Ö±’·{D÷¾ûÔ²¤™Tuİ‰:!³@cŞ³ŠìñÚšìén+hs%«ğS‚hÊ›êıZ¤ù%£µ~mîvs¶üÏ!•PÏ¥(Æğ¸„üÀw©ÑˆÂ¡Õ´9Æş®÷DuN1-*Tõ—‘¨…-9oZ¬ÂƒîùFìÑ»`Sg›ái“t‡¤tÏçÉ²–üœ¨†­¬Â°Y€P±Ä®ûÄ6¾ëÄ9å\>QIøáO9ÈæN»[ƒüùˆLùo«îsù§´r|OáS|Ø¥›ºLìÉ¸‡|ÄX¡BÖ³Ğ¾éÅ¶¶úDt\t\u¸—Ş(èoN¡Şî{Ú‹,yíªàqû¡ğwŸlC ”~Ï©™¸¤ô‘¸†îÀR±È áôüê…'>ëÌ¶Ôñ]ƒ\t	èçÚ©hw\¬Ê’›íÒKäõï!h`o+bu”ôÍ¡‡aÈ$™´	æİ±Kl†’!J ‘¹Ğ=ûT’¶{Î6Nõ™VñËèg¬bç_(Z«üùÓ‰dùm«ìãï+ 3|M¡Ö>éÙ<†­‘ªè€Ò°”(R³Ğ>sÄ¶>3Ø¦\‰\u—økÚyj'N¼ÚˆèùÊ›ìÿM+áóo«éÿ–xÍ#”qÎ!™8„Ì‰
…è˜3T‰X¤Ğ>ö‡!®{d¶Tå$‰lñ‘ü^ñ8,Æ«Ò‹ìzÊ‹ìùkªäq¯yp2ü›¡—ìm¡š»†ä‘¸l R£ĞĞR»­sÄ2º÷Ç¾Ôw•ˆ\U	x·Ö)èçP©Ä4Xå‹œı5‰èfLíâ¥^áNüûÉh:k³`!}»èsœôÏ©’ÜÏ±9®†ì“½†©  0Ğ€S5À"ûÆ>>ïä3Üå‰\ä‘(wŞ‰ègŞ«Ò‰ìYëíù7-Á0§=Ğğ`ë¡õb¾m»CBæàoÆµNíJ¸ÏZ'æ„R…âdó/A6ó¿Á¦áUb_[ÅÌYÌLÇJÅ§§Ôp¥%Cxa²¦â°5¤JÎàANàïN¥Mí^%ÆÆäP…öó{É´±9‘¶á_‘*LÅHÉ™ßJÉ§­ÑğæQpğ¼1&`¶t¦ÊÌäF—àm†°^çNç›Ç`ÕZ¥Æ…ó/Áf?Á¤ãIáŸİÙ]ÏÏÁÌLKÈç=Ğq§<òb²5¦b¢5†?KpÂvåŞ°ÏøÎ¤ÏC‡fÅ¾‰ó?Q¯óA¶é=IãYÉÇBIÍÏÊIÇ=Ñb§±‘õb4m>jò7&JdH†`mÍàbíÎ±Ğv.s„æ”ãÿ@³á¾E¦á+Cû@İSHËMGHI§$Ôr'=×pj²½¦â25¶«JŠ`-Z’àíÆ'ÌåÆ­ŞX…d€Ğâ”Ó;Á²ó¿Á¶AŸ=YãÍMÏé­ËJÕ¯<Õ05%Àsb39ü#¢¥&[â+J†ÀéÎ§NLN©ÆÒä‡R…ÏXá¯Ê¤ß-%Î_¦P“æ ó;Á¼ò?Á¶âŸMéÁ‰JÅÍÏJÉ§/Ñà¯-Õp`°5§f²!¦Jà
Š)çÎ­yÖ¡RÒ›çMÒâ…rÁ¶ã·U¶á”Ièß]I‰_BÍÛÊY¦,q&ì¶n&¥6b¢-¦Ê‚ö^àeÖÎ­íÊ¶†SÙgÅs/É·Û¿É*lYáI…ÌJÁÍÎÏÕ§Ğ`#Á2b0¥j(³µ¦JàKbíÌ ÈíÂ¥]Z‘ö…Z…f%³?Ñ¶ğÉ¶âß
ãÕIIÏÈÄÏBÉ¤-A`§ Qõâ67&r²¥fIJ_ \ äÔeNìH¯ÈB—f…Ğ…ö…·;Á6q=É¶élã—I]ÏÊÉMÍJÁ'{Sô&}ñôâ²8¶êò7¦Òèh¶ÀN¥^mÎ­Ï§†P”j„á7Ñâñ}Ã½á‰á—YMÍÊËÎHÊµ'Q|¦)Qpà"%¶c*µ”*[ËpŞBÄáiÇ¥eF¡Ë‡îRö"ã?É6s:Á2`	½IİÏJÈ\ÇVI£-ÑX§-Ù±j°5æàú–J„#“JŠz­Ç¤ÊéŠ%İRv”R…æñ¿e¶rÿÃvõI`GÉŞAÅ×@É¡u›6µ/ùğâ34"`²µ§‰Û¦áÎ‡=ı»9{Ì¬…tñòTt•zß¥Á7ßµÊ°¿~ÈG­åŠH÷Õ0M÷„ íéÆ†í”Õp(	•phÆ‰‚…n	¾ù¢)ò„ªWeµj•$~ß¥Ë·ß¥«§n–KønƒC÷—$İö0Î¡šO+—HSxx‰’ü|F‚Æ9ÿ„ˆ+{Œ(vqzWd5l]§Ï·_¥N¿½|†K/J„IöÑ(Èî• İë†ËIpyY•ğ¨çÏŞÎÈ;{„°+ûÛ¨*|»ztµ{ß¡Ï·ß¥ßŒ¿n‚O§lû•pÍ´•8Î+†h–„JBsjI `ø‚Î‰ŠÆ;ûÌ¨;{„ªUtğúUáµ8Édµ[§Ì³ën†[­nSâ…8É~…0}i–S¡”†‹ÙÕğà“—rq“N‰Ä—Æ‰=ñ¨:û„ªtµxäµsİ­Ë5ß¥Ç¶¿ì‚A²<ê–6Dõ›8y–Äi—ÆC
‘yxY‘`?Ş€Î‹‰ûEª`û†8]ô¢xUv¤j[7I:$O¶/n†K¯fÛ¶•8Åö¢Lı–†Ëé”Q—¼øYÑq¸€Â™ƒÎ‰«úº;û… |-èdµºÍ§O·ß$Ç¶,,&gŒËö¤Sô°×ééÒ]x>—ğ{‚Ãïƒëš&ƒM“p|M•±x‚N€‡É‰ s€ª;ó”Ìd­ûxEıÏµË¾–5WµoJ¼æ–K6• Í÷Q0Íaƒã„Œ†X“qx’`x‹Âˆ&Ï‰»û¤¨é„9x•z—t·Jÿ­Ë7‡¦‹½/î–K>nÄCò­ íæÕ ÍéŠ!–y9´•RhŸÎˆÇ^ƒ¯·Ôâ}»•àd¥Jt½zß¡Ï·ß¥h•nGolÄ[<Õ¸ï“(ÅÉ—–
é™px;‘zxÓFÇ „ÏÉ®ùÄ¨³ş8fñ.4á|Óåİ·O¤Ï··îŞK¾nKö• Mö•4Íé–†é–F7ÙzxYSPm€WNÉ‹ÎH;û•øyûÇ¸v%jt½ÚK¡O·Ÿáß·/f„Y¾nŠCî—2„æ“7Œ¬†‹aY€Xøù6|TÊ…†Î‹{{†¹±ú–°µuµ>]<ğúG¤…³XµÏ¥¯f”Ë¬h†Ëò•¸İö"|üPCh—…Uàú_‘zèŠÎI‚N9[„*?êº1|Ÿô§z]ç×e—¤Oó·n„I¯d„[ö—4Õş…´pé†€Yš`xÙpxc6…í$«Ì{¸@Ì
 AË®W™İ®}Ct/m§¿vu¯Öºh%N–3†?×3æ¡×¥+<«Â.x/×7w9—3ò;ZÀøSXHhA¡SÔV­Ká¦±áæ·CN¦BÜÏPL.]‚Ç.uwÏ9Îdï:y¯Æ¬T?Ö½3ö»ƒqş1šèŞËéF­ÚŠ×YÆá]&sñ&³Â¦LÀ[ ÈÏ®O_®ßııÿ]†qï<j+–:ø¯Ö—+Ò=3r¹	èT‰®VéOšÕé[Tá%ò•®³ÌJ¤ĞÌNq@Eå] K*×oõë}ukºx«Ö8x¯ÖŸ1ö9?ò,‰5š™èYæ¡ûÖŞ:KVá$·¥ô·`LLJµÀÏ„^ ¢ßyFaÿ]¬tíºl¯Ô*t¯R–vF;—5ô1ê Š‰øV³[ÓF™KÒa,³á/)ŒJ0P_Ú"TÏ®ß›ß¨_íuã½=éw8iV;x/–¬£ı;–3ô<
Œl›ÉèPF¹ÛŞV¹ãÖñ$±â&“LZ`L`@EÍæAÁÇ®_i-¯}õö+øl×­¾oV‡³ş9··úpZšhQ‰øXF)IÆF¹ßÕk'»á,³ÜC BÌJ LÇ.]€Ç®[<‡uªuõşx§Ç¸ø§Ö9¾9“:v9‰è€IÌÑŞp]öD©QÒá°³ã&³H @Ê^ Bß®_®—eõË¡Ì(AÏ¦ßß?_}µ«}’tnºz¯\2­Ò‡!ö¹…1Ô9ˆi>hœæ-ZÔ)Ha¦3`Œ&1MJ:Ê@K @Ï®Ï‡›Sw
gmyóï:x¯Öê¸/Ö•»ö9—3ô9š‘x›è†¨PF®[‡ó,³á¡;ÌÔ ÔÍH HÇ¾W	Ï®_ıuî}
gï;hù‡ø¿Ö³ô9Ö1ô;ÚèÆ±KÔB-[VåFòx•n1í BİJ HÉ¬_Ç®]ı„}ïae%:x§Ö˜YïÖ×yö8Ïcô¹
éPŒhf©ZÖæèYÇá&£ã›&ÇLXyˆÎ
#Ï&_M®HxWï|€uÏ;yéÆ9t»Ö•sn8§309‰è€‰ü€±[Ö³ãÖñÉ–²á¦²LÂ¨ÜJ´HO¾Vï®Oıtoqq¤80§Ö8|§×Õ9†7ö9^êÒM-’D©[äF£[Îá¦¶±.3L
aHÌZàÁ“¬O¥[-}ïşFuf
iëÖ;x¯†O3Æ»–1oº‰è˜è¨zÖB¨šÓc9¤ó´]$µ Ä^ªPÃ¨Kß,İıuïy†uï¼ø%N:ø¯ÖT³ü)3ö5™z ‘h¿ëŞÄVZÖã$ºñ&3ÔÊ AÎo¥[ß¥'³af»ÌŠpÂÌJ0PÁL®ïªÁ|Vi­=€+ï(ø¯W*ü®Ö#¦908‰Èy^ìFÆécÒà"³é&³ÍK ÆÌ*TdÏ«_Ï®}ïùçm:z-—jx¯’;ş)Ÿ7ö)šøAí±VÖ«IÖé&·á²3ÔaIKH LÇ®Ï.›õtí=uïºyïĞ9ùçÖ!ö9÷9šIøí’F©[Òf«ÛÜé¦³áæ³ˆN*@DJ5qßì_Ïîİıeç}uï*8»Ş3h¯Ö–£ö8—3Ò9âšFh^¬OôF-RÔa¦³àf»FÎ ÀÜK `Ï$\AÚ®[ieó}uëxø«Ú<ø7V—3î1…7òù‘èÓ‹jPÏ(_ÑÕ©SFá&¥à´³ÌJ @LdSË°\ßÿO}„áïõ}ï:ø¯T&úèV–µö)½µò!‰ø Š‘*F¼ÛVÄ©K’íg·á.3ÌN¢PÜB @ƒ*[Ã,_m&ümmıí¢x­Öºa¯^³·¨›n9Ë¸Ú‰x˜D«ÚVËéÒá#“a™¯³@È(ÀËÈ ŠO.W‘Û®W}q{}Uí:x¯R:x­Ö‹›ô;–s÷y	xˆ‹àÆ¡     AITarget(rTemp - Num1, cTemp - Num2) = 10
                GoTo B:
            End If
            
            If Grid(rTemp - Num1, cTemp - Num2) = 6 Then
                AITarget(rTemp - Num1, cTemp - Num2) = 0
                GoTo B:
            End If
            
        End If
        
        'downandright
        If AIDirection = 2 Or AIDirection = 3 Then
        
            If Grid(rTemp + Num1, cTemp + Num2) <> 6 And Grid(rTemp + Num1, cTemp + Num2) <> 7 Then
                AITarget(rTemp + Num1, cTemp + Num2) = 10
                GoTo B:
            End If
            
            If Grid(rTemp + Num1, cTemp + Num2) = 6 Then
                AITarget(rTemp + Num1, cTemp + Num2) = 0
                GoTo B:
            End If
            
        End If
B:
        For IT = 0 To 99
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AITarget(R, C) = 10 Then
                I = IT
                Col = (I Mod 10)
                Row = 10 - (I \ 10 + 1)
                GoTo A:
            End If
        Next IT
        
    End If

E:
    'Do Random Pick
    I = Int(0 + (Rnd * 100))
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
A:
    If I >= 100 Or I < 0 Then
        I = Int(0 + (Rnd * 100))
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    End If
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo C:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo C:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo C:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo C:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo C:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        If HitFound = False Then cTemp = Col
        If HitFound = False Then rTemp = Row
        ITemp = I
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AITargetNormal()

End Sub

Private Sub AIEvaluationHard()
    
    Randomize
    
    'I = ((-1 * (R * 10)) + 100) + ((C * 1) - 10)
    'I = Int(0 + (Rnd * 100))
    'Col = (I Mod 10)
    'Row = 10 - (I \ 10 + 1)
    
    'Eval For Hits
    Dim ShipType(1 To 5) As String
    Dim RowHitTemp As Integer
    Dim ColHitTemp As Integer
    
    ShipType(1) = HitFoundPatrolBoat
    ShipType(2) = HitFoundDestroyer
    ShipType(3) = HitFoundSubmarine
    ShipType(4) = HitFoundBattleship
    ShipType(5) = HitFoundCarrier
    
    If Grid(rTemp, cTemp) = 6 Then
        HitFound = True
    Else
        HitFound = True
    End If
    
A:
    'HitFoundPatrolBoat = False
    'HitFoundDestroyer = False
    'HitFoundSubmarine = False
    'HitFoundBattleship = False
    'HitFoundCarrier = False
        
    If HitFound = True Then
    'If a ship is hit
        'Dim AIDirection As Integer '1=up,2=down,3=right,4=left
        
        Dim shotRow As Integer
        Dim shotCol As Integer
        'For shotRow = 0 To 9
        'For shotCol = 0 To 9
            
B:
        
        Rand = Int(0 + (Rnd * 4))
        
        If Rand = 1 Then
        If Grid(rTemp - 1, cTemp) = 1 Or Grid(rTemp - 1, cTemp) = 2 Or Grid(rTemp - 1, cTemp) = 3 Or Grid(rTemp - 1, cTemp) = 4 Or Grid(rTemp - 1, cTemp) = 5 Then
            AIDirection = 1
            R = rTemp
            C = cTemp
            GoTo SEL:
        Else
        GoTo B:
        End If
        End If
        If Rand = 2 Then
        If Grid(rTemp + 1, cTemp) = 1 Or Grid(rTemp + 1, cTemp) = 2 Or Grid(rTemp + 1, cTemp) = 3 Or Grid(rTemp + 1, cTemp) = 4 Or Grid(rTemp + 1, cTemp) = 5 Then
            AIDirection = 2
            R = rTemp
            C = cTemp
            GoTo SEL:
        Else
        GoTo B:
        End If
        End If
        If Rand = 3 Then
        If Grid(rTemp, cTemp + 1) = 1 Or Grid(rTemp, cTemp + 1) = 2 Or Grid(rTemp, cTemp + 1) = 3 Or Grid(rTemp, cTemp + 1) = 4 Or Grid(rTemp, cTemp + 1) = 5 Then
            AIDirection = 3
            R = rTemp
            C = cTemp
            GoTo SEL:
        Else
        GoTo B:
        End If
        End If
        If Rand = 4 Then
        If Grid(rTemp, cTemp - 1) = 1 Or Grid(rTemp, cTemp - 1) = 2 Or Grid(rTemp, cTemp - 1) = 3 Or Grid(rTemp, cTemp - 1) = 4 Or Grid(rTemp, cTemp - 1) = 5 Then
            AIDirection = 4
            R = rTemp
            C = cTemp
            GoTo SEL:
        Else
        GoTo B:
        End If
        End If
SEL:
        Print "SEL"
        Print HitFoundPatrolBoat
        Print HitFoundDestroyer
        Print HitFoundSubmarine
        Print HitFoundBattleship
        Print HitFoundCarrier
        
        If AIDirection = 1 Then
        If Grid(rTemp - 1, cTemp) = 1 Then HitFoundPatrolBoat = True
        If Grid(rTemp - 1, cTemp) = 2 Then HitFoundDestroyer = True
        If Grid(rTemp - 1, cTemp) = 3 Then HitFoundSubmarine = True
        If Grid(rTemp - 1, cTemp) = 4 Then HitFoundBattleship = True
        If Grid(rTemp - 1, cTemp) = 5 Then HitFoundCarrier = True
        GoTo SEL2:
        End If
        If AIDirection = 2 Then
        If Grid(rTemp + 1, cTemp) = 1 Then HitFoundPatrolBoat = True
        If Grid(rTemp + 1, cTemp) = 2 Then HitFoundDestroyer = True
        If Grid(rTemp + 1, cTemp) = 3 Then HitFoundSubmarine = True
        If Grid(rTemp + 1, cTemp) = 4 Then HitFoundBattleship = True
        If Grid(rTemp + 1, cTemp) = 5 Then HitFoundCarrier = True
        GoTo SEL2:
        End If
        If AIDiraB4G. % p`T`l
 !  0 pàHd@H2hd rmLğ ã\%,ø + 3(,; q Tbg
`Hh–FkCbd@etOlo!d0- uru`j      `	n '`éDrR&c, "D%-ğ"a  )d(r T#Ad HItFm1.$%a4rny'pà PbqG `  If rAD(rTAmp !Dep€(1) 9 3 L IJ ktFoUxtC4r)árhjå % ÂLE	
    °  )Hf FpA@ 2TE,plh4Åe b`* @ 4!vhdn(Hiuf)UjD†CTL$sªgÀ m Pxee	(   0  I  Gb!æ$pTeepl "TeIP ! 2($5 5 HanhH9pDoEndFe3@i`b TQe, d`2  `dcTã $
2:-
 (  $ ,B"pdDj     A& ÀÉÄij!Ãp-n  4"Ô`enb$ "A   Mb"2Ipd2R!­p¬ B¥oğ !2#+"5 ! U@$î hi$Fgzd@ATpmlbat =bÔ6|e(
  ` b  I$ Çs)H rTå…B, `Ü!m@`¥`4k = %U¨a(ˆiôbfdldDo{4rhqe2@< DR7}…
"( (¤ 0xHg CcáD(bTeap  ãTeaQ€-(qÉ  1DzE¤ HauFo]fdJuF-ariJ'@< UrP%  à   a äd eraj0td/p, mPae0@-p1!  T Dpj"X	tÎund`t4Daurağ 	 r}v)$ `    (Ab FrKLbTe}p¬ cy%ip`, !(  Th HátBeE~dağ@áEr= rqd-
   (  0 CO]oQEHR}	(d  ((d` eFdHId*SG29
`  `   hs = p)°fb°"$Lb€aylR"0oHBn0T¨S1(+ ÀrEE 8aN LèpbkÁ`P`VrXBk)T(0 Ga,ac` ¢ˆ@p !I"$dee$Dwt0'Ub(S) , Q"t 4He®(ˆ(pFÇu$D$r0Ph(]r",`BclS`/   "  Hf D!tdìárm.l¨35½ TR]ä#Thgl I+fFŸufÄ[q&%`gjë+İgÒ9oªã¹PòF`ñóéD"¹÷b¤ô=EÁÔ™ˆ	•½GJÎ’ó"—ùØ/\xÕØW¡IS?TªD#ş9l·íqîo†ü§)šâ%¨†0ÿ'ë³vtd¯¦]›«•¬‡ö(™ÊB¤ÿ½zük‚~€7”‹aOºl£Ì0Ş©~f0–ÿ®ÒoŞDzE–òih9åø§î·ıÂF»ÕuN,ë¯‰” …ÍÓÔµ+§_å3_è_ÁRõìM«ìÃ%ş8Éò)İYY“ñ^[H(›³áìyÌÕÒ¦Œ~)Fİ·Š_Ğ3H.‚Ùá>¢ø^&ÓŠ‹G	·0øŒ¶Î=[ftş@hjcë”ğáŠ£ød14yÀüsfZ²^_“È¢ìXÄpw_„îuåôó›~Ÿ‹ŸàJ	>é6Éõ»0m5q%ŒôÃ¿`×m÷|Y¬ğºüvçñ&?ğ€õ€=L>Èò'd Ü5exïêÄà]â†™}ÈQi<Ü0éñ·­®åÁ{§3ŸèÃ)˜R!jdQø.Lb!»°o\Ÿ–0Ÿ—@“"~ú³İ¨‡nS ×¼¹r‘|ä„~»s¬Éèêãº¤ëÿPœìíµ fêÿ¥¶İ½fU¹ì@¥[a ÷‹¾øwñ¾íc\AòëJº³ğ©ßgdù=FÄ™%Î
=Ÿƒ™v‘l
ø³#UNåòæçÄà®|­á‹A÷$&Ïé%f­¶Í+&%ŞCê$TMb0û"ª½5DèŒrf	în…*ì9×¦L Ÿj®àv}ô­¶%¨øµj“º/-Âé«æU¯/×—M›3ÍÉù^ˆU*—A2ğÊG&yÄÏ/¸&4rÃyüÂæâwËFûõukìÚñídí·ôôn%WK¿?L´ ZÍ¶ñ	şzéè;½ŠÍyy›zlaõ{œ¾˜~Üª¶²æ1`fÑ­7ÉĞ¬1¥HŒnæ•¥Ãğş Ù‚›IR}üç†«§ª¡FŞbyjRèìá}ë­‰èL!uùòüWo8ò*>‘Õ©J¤6!2#GöW…¶òéº–IÃ¡¿@ó·EUñõ=± dĞ®ŒÙb¹l<\¬tqÄğO÷|”cô ¶y
yŸ2t!dû(7dxh€ø¶ÑHÙÈ	Z|a£¼xéäà$Ü»ËR¨ª?®bI.q+¢b.UÏÒh,íÖì¢…Æ«1¸“eéá([õ¹êš]­NĞ¡yğã«®ñ²íÇAÛE½Ÿ>põä)á=xÿ×‰pÚjE;Dwñì(…Ãd	÷›º”S˜úÏizÏlÙÄõŸˆå95£;„İÓ>MÎ‘X÷hşñ’íÁ"Å’p¤Ä¶Í©ŠèAÃ>„7‘z[fpğ×#,†IN¢SÌûdŒKj–iÛÜÙgãáWd¼¨3•d”Ø©F‰íğ%uæùºmŠ«) íh{ˆ‰½œ+ót”ÃuPVBhâ¯ŠèIZÈ³*qõxó÷ÁÎE­EDøc'Pà¾¨’¯… J8uc PhÛR3ÀHë?;àè9š²é‰Ù3KLa5ÛóûÌÄWÒÜÎJFár7ğ¢<*§	¢&æÀX§ğ^/ó¨‹FIĞ¬†”®DânóJÈJ{òçĞğtá÷ãhaqôIÂüQlW|éJG° ©)©©ßòWõòë2ó †ƒçÎ*é•ûqmuPmÄüÃİŠ²?ôô(ğW½ùü|…”Ñ?„Ğ¢=#l«»+º6y˜åTQ™ˆ Í»™	‰qCÜpÁùhó¥ne	ÃÛTï Úöº#~çjkYÅn_L¹¼9oU›¤„5ö—ƒ"\ú“ì¨¹(_ĞêœŸ.Û5ˆÄ+°~«N©ãÌJcºÙß0}˜õXÀ—jn×0Õ’$@qfW¸µr‘—ƒº¤$˜ğÏxD†¯'¥¦‰‘?­SiˆÕƒ|`Æ•…Q÷LjÑÓù| Ráš"‚”ÕÊé³˜ğAö ú6§]T…¦,0’d6¨1kOŠı3iŒ¬ë	†¯ŒM©‹tïçÉ“6Ô„‰†]ÜÊğîB<wï}Ø‡U†ô$†‡¹Àf˜Ù™sÏĞ°!t´ê6×æ	˜£rÄz¾†Ù}Æl›õMNkaìúóéèë¥ÄÌz/,W=H;hzÿN4«Bß+ÎJñèY~İª­«£= `EË~¿ÒØşÊJÑ¯keíõØ¸¬D…Ô\Á½ıó›Š•5ŒŞ‹mÃ- 9“J/;$¢±–”è#9ócCĞ&ægMŸŒ‹h¼íW µNW˜t¶»ÿ»¨­ù†*Û‹
r‰›ù,"!à¾çÀÆNE9g¦%W‘Û?¨óñÜ_» äq=n<Êï%tÁqv2áÎF]MğDê:¹-éy.CÜPÁ¹hÒ”Ê%7€¸Û×Ÿ®ŠUüW		*³¸¬¢(j›¾=OE¼†?<öğ÷d]é~d²Ydyà÷8ú´õ=Èìø^‹:‚¢ŒC×CüõQ;¼Õ»½%JnÖrôà\s`cvœyü>
¥q W‹¾Ôw˜ú«m49¿¹·×ªÉ³q¥}EÓ~^¶ø’jB¹³#X…"#öÂù¯gÂÑîˆô¡w¦qåÆp[NWÕü7R¯p-M`K¦R§é;S¹á8ÛsrîÛ·ßUÁ=a¢¡²©ò]¬î…Æ£:#%––ÉÛ]J·rÓ;‘™™2Ï`açdpßø^1·kégú:rA’.y±1’â/$ş“Õ.oWBŒıíƒâ—Ññ~go6"oH;xzµî4«Ã›#ŞJéè{²¨?ËŞ Ñ)?û“;¨yÀ‘ÓüÖ.FÑ­„Ò‘ğ…w‚`®æ‘Á‡Ğ^/“Š«fI1[Œîøâw‚_úxG<¸8zÅ›‘pÁš‘”21Y²¦ó"UÌF3ÕˆÎ)İæB:öWñæ×®º¹ŠÃËİÑñoÒ¹ïî“A4mÊ±ç©
ÒD)8HË1õ¢€ ÀŸn]Ñ”¥ÈY\ƒ‚Y!Î*r<­ƒ¥ù„üŒG­:mu™`Ãdx×ıû#ÁúóSş‹šºZ
Ohx"êAÑÿÿÂgŸ¾ŞŸA£¢\ûé°µ^T¨÷Îú%ıoÈMfËV…rÃàşsº!ù¿Qr”œí­.KË›Ùø$äsF×éÜ&¥ ¥×«şô÷òõ»&<h¿ö1â“u£İemª‡øvJrÑóël "á’" Ğ¶é­ØÌÈ/§qC¼ƒwì®¯¨pıÄwQÚtîr*›ñG÷Œœpw_ì:Çm»#“„N4ÏOã³6ß¤©·øÉ˜ó
ú›Â=†hU{Û­ZTÌSØÉ©íÔ#÷!dôê!68×||®,8p+ÿC`Yìx‡®·ıÆlûõ\ÎieA˜œÇ ÍŸ€2"o[d'nAè:]ê	ÍËÿ#”JyŠX3½£—Pò³Nzõq°³úäìÏÒØõ=fNÁµ:ãĞl9—@ä•À|d±3.äà
"£Q8Ä²ºê`Ş@hê{rå° Æî©d³<†´G8l¾+f|È+»	3svW­¤óë»¢èÃ£B›	4¡”¯"4cô½—Çút-¤u3÷è¥§â³*±Ô•ÿh|–v$sU!s;ÙK9¯•eâší	!8JYIš42¡:ö¼ìa	…ûƒ«şŞİÄvúåw.E˜®mS ôÏT<Ï“Õo:ÿ¸¨İ	¸èĞ¶LÚ¶";¬-G±ƒ˜‡#3¥šÓ3ë;¥Wå§¢hvÜbü’¥07Z¿´ø?¥SBÿ‹¾”e¸ºOi5¸–”Qìˆƒ1Bqz%‚İ8“!CGî§•XÒ~"ÕÃëj Á¢ ¢v«b²åWŒ2‘!/f¤¦s6Ô®¹/(±–uˆá5:~î9E‡Ë'!Œ¤¾­B†ºãM™#ƒ†0ºç¹T¤©¦ØÆ¶I£Ôs§M›ÂR†»¤:.å>–[$ÊsÙÉ‰ı”3–!d•ê!.Q‘®§Cì#mC·3!š7£ØY—&¦õ.]æk+Ìú¡‡ü®˜ş&77dk-(XP`ŸšÙgaÖj¡¼rù¾É!Ãw[	/aÂ³œŒ©Õ­‚î#· ]¿‘¸åƒ,É&ÅÁ`‡7nSÆûf99j9µ'0e—LHkN%€µ}á‰­$&!–õ!Ã.£#·ÅhİCì¶=sWÖ.×¥dRë¾şÊÃ³fÓ¿..K:m1IÑA™"¤0
¢T·ËĞ|ç°Bs©õôE‚ól%š87zäBsmI!â>Ñ ½WIRgX¼!•ã/ı‡á$ƒÀÂCÍé› !+"“á,*d™êK&$Ûî¦!âöæ*·º³¥¡mKµ¹ø˜m÷Šöcš+«k—š&º`‹;òÉi¡
£YÈ.:ƒÛ%½ÓL$a“%”Õ³Ï·C På°Äú´1»»»|mJ–´g€¡Õ5jãã‰$õeÎ’\ïR}Óá¡-+ë‚" ”öéE­‘ŠˆU§µCÎæ²§¢+B•¸–u6 %?Jî ªá& ¤²ZR×º‚_ô+’­6<ïO³6ô¤éª½üëğk¡U3oMı‰EâA7Ä>‡VìsøÉ‰ÍÕ#–tÕ,a6I•#ÊÏ/ø>SsKHqìH§·4älŞç<&ggÍ³ñØÈí×¯ÄJ%#"1é9±÷ç›ƒxƒ¼ióaéâ9ı¢ÍYû±:^{iUû£ûå‘ÅÁ´÷«pFÈ­dv¡ŞAG(ÆÀU‡ñ~/óª£ÆMÀyëˆÀà'Çki|Ş`hz;zåğpTá§àdTr}Øµuc/¦#j]‘à©í¶áSÖcW´úã·¥Èé£0Ó±
„É|»qæua5²İÃ·¾.s|z¬U2ÅæĞy×œİF;°¤õò=L|ëòd‡Z;V:™vBW¡¥&““)é®SœQáñ`³­®a …›ûM­Ç4ü,SHsøüJdg§ˆ®ÏUŸü†4ş·@³]ú²Ä¨ØŠp¡Ÿõ®\’@ÂàµKùeÅƒ‹#ú,éÿfÙ3‡yíÕçQlEÓÕ”•÷oP2e?‹ü Ñ11\$”™¾<ŒŒÔ*v¤oêä
µ¡h—Ö56…)ñ¨EõG>E†×÷—,bÑùùxÍGÒòOäÔìéqÿäïh-·Å]Nºà\…£ëZbbÙ“u¶µUm_Æ bæÍO$Ş¯|º{~†ÓÃ@¹2‚„5ßçíÿs²‰¦=\êğc£uQïEÛÆ1„€.îïzE˜6›Áq£D>D²XÊ&¸§o¦ç*¸qúSAxìxÂíÃRæ[İy}k,5w¬ÚñÍàÍ—Døle{Äe)=<µÿî4Íˆ,Á×cşJéè89²¿yæ‘xsQ\1qÿ³úÌ}ìÕÒ]~>ieW° TÉò@íT‡HŒgóÀT‡ğ~/³~‹f¡T?„†T¾E…$!î!w*%”èp Õ+åòp}t†€Ì{glm}t$}õÍúUéQñV€'ï"—å¿ï•½êkkÖ ”¾dø´İ”,çgáüú½äCt&æ\Õÿ¶mãÓõIv´Ô½•d|\òdQèòxãæÂ5¤¸'=ç·m«4M
]†PüÑáùêe#§·o3¼®ëÔ lA2m¨"Ì?m¾øEDŸ¼†´Æ—A(Tê“Ì©±Îp °óQıkÅˆÕD+Jãíjcºuù¯Q1œê\áynnlG}ŸbıÒ>$hSfUyì ¥Y[ß¥w •ïÉ/DIhfÉO¶øá•“(‹w	^©ş*ÁF$ò€¤I$ğ>gZˆ€¢´Æ³TÂñ¦ØA½®A%©“®û[vØA_nm™ª«VêêğMr†î³!Ü:‹\<ĞÇëó¥ÆÖı´Ò”m¤}ë&šc'ÏÒ	²®ZÒ
LA39‡–+V!¸JB>(ê³Š{ò2¡Yû`ñÌXƒ¦óY–h»÷unLm^úìı²€½äğJEûdg>e*è;Õ×šÃ£Ëj€î»)Œ“gyû‘[La¤ÕÚ²óëzÌ‘òÜ¾}¦rÒ­ââ·Òl3¦JfµàXô&	—äT®æ”«'Âq&TŞBjj{råÙ¶D„åŒ¬Cz;³÷SJ8²n|}V» u³n­30ög‘ÔÖ£ÿ˜åËƒ†BÒ¿.‰‘«Q]}Â%„Üã26yˆ¡A_‘ËÉ|Ø÷q[¼¢ıQ,Úö'd%º87x‰æb]ïğ&ÍÒV	'G\Ü\Éóh²¯®a‡Áû³š ÎR”	-²»x¨2hJ»¾DŸ¼o45ÖŸ	–>“„Ø²V0¹—µÓ¾™Õ/Ğ^ªZˆ‹‹ê	º$èŸq[¥çíRn×ŸpÑĞX$3VCV¾ˆr
µWL×‹Ò¾ø›Ï%–¤ô–ÎÅE¬9.öò9‘~mÁƒŞØª.µü¤n k€Ûª”öh¥Å‘—‰(©…»CæV·ÊÜ/`0†?©$k6n#HöéY#„ÄY“F–¹ÓTœƒ„*<=ˆ³*ô¤©¦0ÜâÑËEC¿Mâ ƒª1î>ªtl–^òí	ï¶.-H¶ÂHu²K†Ş›8SûC:7û8®¦IæA»Npz¬ÑÔÁÁ·ÂëdvÌfE)\œn
ó«WÏ÷(i‰8¥’Å»ĞRLË“ûìz¥ó¼„R •T9…ĞÓa¶ÈúFò‹à<ì–¤6nğ®¢˜ œü¸ƒ'BQæTÚ@R†›œ“«âœ?º	ëÜc\CçK
4©Èê	Ğ_ñ[’sòg´]ÚëºôHÃ£†Nö–

ü·?6yÅ·¶ ¬+Sô‚°m¤ø²îô÷Îõå>TÀúD%ºXxŠl]Él¦äıÊµE7cÜdÅ¤xÒç®@('’İw¼ƒ>"Ş=ch;x„bLj%›=	
®±ÀV»½Aƒ
^úƒÌ XNì°ŞÒ®4„‚ä"‹4÷ZÛãøºS“Ô½3œé»ë½­%fîŠxœ‚1{$wÇ¸Õ3 §s@€ÔÃÜû$˜æ¤ad(5¬fü‹ ğ‹5€¥J¡õ³µæ£±4ÔKÙÓèl	®á’‚„ı°ëåÅ°©Ír½…a0Î›W8‚ªJìUÖçuépt(ø@7èü!¸ìQş X¦¾£ı¹c«OríÁh‘Å…¯=¨‹…+¡!{ê‡óğ³†€/>‡v\AØÖ©*Àş#ş!|ğê!6¸Ç¶È[±u2m6!‘)ŞçŠ—½ÎBÛÏPNk…Åø³«Ó´ÓÍ’"Ñ$Q)pùÅæî`…ÎBêÕ!ŞBÉà9Ï6ÌÙ»‘:Z{f,oc’¯¾ŞQ¥ÜØŒŸÜƒè "éñ¿¬u×ŸZ‚Õ…Uç`v<W6şSfÕmxÎÙâåf28 º0E9$~:£¶óx‹¬dytéÒÔSK²*uò¹ªâÎ¡›W1Z_×3óª÷ïñ³OOÙ¿nÉÕûr-uôE¤üÃ•bsap8ì'Òä›Ùy¤•³£¿‰€ß•< h¢‘Æ6wÒ=TxŠÍQÅqlÌö?iIqc<ÜPÁáH3©ÍWf…û¼tˆèªr±)Cn3U¤bHJ%ÛQ/ÅŸ½€$öµ"ë¢ÙÙ7b£ï¼ªnàX„ÆkÔ^£ôÁcèÊb>$ùŸq;ùĞ°ïŞÔ.n×¿`õ’d`G´²Ö ÌõM—	¾”7˜âïé4@şmSÔ‘Á!×;K–[BÔâ)‘5zmîçHÂÖbñóÀ.e‘òv¨¤¹¾¹¥ò¨ŒHÕè=SÎ¤Z“Ç‡{$0–w6¨32Î ãŒWíğÄ!/0ÓúfÔj4Â7¤ıW0ô©äy˜¸µC‚c§<¿X¦ˆ‚Ë†3Ç‰™W¸¯áwù’µß!òæ7{÷æÇ#¸e6RûC@yë@ôèõR¾l¹·#˜jó¯úÅ¡…¾×¬ÀBgÏJç¹ìz÷î°ÍŠÃ_£¶©ä\sÿó™ñ¿ÔLrIû¢û„=Œ†œv::¥ìPÓÍ˜¯9÷MÏŸÀ\‡è~¦/óª‹æiĞŒ"‚¹n†y4Dj'q}åáøĞÌ¥Áèf1ôqÒôIz¸j}ğ™ÏdìRÕ,
ÆH€¢®·Ûòã£’BÓ½.ÉÕŸÍwP%ã3÷×"ÔñVH¤ä3…ëğ}Çñ*BöÈõ€saKò'f!òhWxÅJZÅ‰âÕèk„ò\VÑUë‘x³¿îeÁû2×„Ì@Ü`EBGRo "-	)Ò¾(ov½ìËt:»;AƒŠş“Ì¨ÑNj¨÷¼ú<øP‹‘^…ùZÙÊæú+ùqúÍt*ÈT¬ùî@+:ÂÌ5½³Lt¨;&3±üF§/ITÈåŒ‘ü†-ªÏpò¤ÇĞÛ€€             'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo C:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
l@Il©à 4– c(   ru #P-rµğ1%e  ˜dˆ '$Cè¤1 `DB ;xUnâh €	 ’	
‘€%%}J…áBŞÕPÀi$@¸‰B 
 $ €ƒ  B]‡rËb†lªh¯6JÕ!`H„n	L‰†/$LÉ
!-¸C  $ ½ãmaƒbX #±aaH` 'QBa<EBÃx8#LCÿ bLÉ%!ÔDI ´&gˆÖQ¡3DAÉÀ €@0"T  mqp€@Œ¨­.`œ@tCLp€FJ5ah Á`€â˜pèá	p 1ÈP"3’h°Äp <¤J1 tù"j!†ÊdaP cQÀ`L1P1 V	$ H2Q€„€ˆD² Ç4b`¸f#ÊAF¨Çè€ÃÖC4y†7›>"	 Àf(&	 AHbÜ9BÌlx=hJcIB$Ø€ ""¬5H"& RªÕ#%J(À ”€ D.¦(8S…l A‚å ”Ô ( ¶@q/K"$7@L  ‚(	î" @³$D1p"d+„¨ X„PD
¢" &¤U-  —-ß(0x2ájƒ±eaÆæ-Ôq€¶\@Å8' T'afe $|h
!€*Xbh 8   GPR#—$ZA<$J`ÀĞh²0¥  ô(bY~Ò	\#‚l™#E+ Œ:  ,€EÕ¨ H  3à °¢$&0Rb%Y4AZAÚæ3 ´Ö¸D+4§f ((2 €A¤àD¥ &àJ {h.0@AùµÄ¨!PI:7( d ˜@@a@(` Pè'ãJeÔ8(å Õ!Æs¤ama —›
ì"àhv’ €l€  0`4,0la‘äè§e ]!nfÀš
ÂC`…pE  !` € @$X¡kèhhME’2"ĞEm€p,é  `4äĞ~QêÀ0@r ,~ = $à¶!ö(%Pø#%€lzÍ  i,1t0g ¡à@cDIF&Ò'$$J/`A2s‚	chá€`§cµØpÇ ,z’ € t † ˆr4"(AY4€Ac0ğA`%!#¬{€’(¥‰
`$vÌÁ0EEh4ê@LrQ# @#™$Ç}mÃ'‘èÓ7hÑPì  ×Ò.ÖÎÓhVµŒ÷••‡ë†qwá)'L (²^<¨#!zºh3ª™äÇ˜ ×mƒì“Ÿƒì“?¼ŒŸçÛ“Ñ´ÆŸ>ÎÌÿŸ§Œ‡ë–­'iL*'Íè,*\è¬¢}Ûğ¢7“t¸ˆ$—<–§†ï/¬?q“?øÑ¹Ü’Ã<ÆS>VÎçŒBñ‘„ãÜ!&k\UTè(LZ(ı. Ù¹.éß¢ª¤Ç¥Æÿƒê“>üº?8TŸ˜ÄX]ÕòŞÎŞjVĞí—Ë¿‘ŒëX­'ëœ`<è|"\ûª#eI°;hË´«Šä×~Ø¦CnlÓ>ÇàÓ7¸Ñ ‹8ĞTÓ>VNZ>Ök«U‘ˆóŒã!?Ë\'§Ôè¬¢Ôè$£è{°ªmÚğ²˜%M}%­şƒ­ƒ‘—üØk°TŸèĞTŸ›¼ZÓ®ÕÆuMŒ÷ŒëX'éL!7Mè,¢\è,+qn2«yÚ0ê Ç?æ$GÛ¯¿…¨¾2ĞXÒnbÏÓ¾SN÷¤6ëD(%ú<¤§Øjh¢Üè<2}¨¢iÓ0ª¤Çoš¢‡@üP?ˆnÉ?˜Ğ‚?¸ÂÆÑwrŞSWÆw™Ì›÷Î^T£§ëÜq'Şè,"\¨¾ iÔò áÛ¨«˜¶Ãwì$ğx, iß°ziÏ°ò‘¡Ne “?ƒä“¿¬“º¨P‘M¹P¦Ó>×Î‘?FL·.îŸë\	'ãÜ¡g\è¬ \¨"©Ã¥¸cÃ ª¥Ç{˜$ÕgƒÌ½‹ä“}P»ĞÏ>WÎÚÆÎ„÷,ê'#÷”ë%\ø/#ì- aß0ªéS ª˜´ÇšµÆ}‹ì—o¤ƒ?¸Ú¨Á’\ÑnVÎÑ?VÎ5Ú÷<ÏëL¡wK\)‡Xø-©\ì,¢aÛx*lC :º¦Ço™¬Õwƒì>é—*¸Ğ¨KÎ>VÎâ~ÇÊvŒ®+Œ¯ë\ †ôZ!gXh,²Dî,IR°úaÚ ª‘ŒÅ_˜¼Æı³l’?ƒl‚?¸À€¸”s>ÖÎs¬ÖÆç“†Œç‘Œûİ!?éİ±7Mù<%tü.«aÛ°"i[°"8¤Çû¤Ï}ƒo“?‘ì>¼ÂĞÈTZxÎs<VÈ1ò‘9x„2´P‹19·­‚Í%¨Ë:ù{ª:ñs&&1043`L'¯'‡ÿ0¤4Uæ¦&vàz zqœt”8ø´¤Î+±‹25õ¬ÊùS¯'1ù&î3í-4…1 51¡¬3î'í`($Wb $ß£°ø¥“j!x±Œe„ˆ²5‹27q~õ9qè…ŠruD‹²e$Ïp,”&™k'½¹¹$tÅ5£4w ,.ï!„şv"¤Ut$#W¢ ú' *±ğŒ1•xÆE‰#³2ıå®‚õ¤€-¹û¶+{6¦·¢4=µ,.?#èa0®™`©´W`²£287ª‡1x»w@è5÷¬†]e’&!{'.5ùv•µ 4Ìôhcïgîz0´Gp¡"UË§ záàz1òy›¸$Ût5ƒºµıì uèŸ>1j&,1ª´©, ¥I%¨£În#N®% ¦w``t_æœz¦!nph„qy–D‹ru¯°¥u÷<k1û#*uû 45047¦F#íL#Ï¯Âàf‡¤ ƒ×-àùáhx1øÄ38„›t9„‰3µo,
µà´1û´,1yª6% 6	7àŒ‡}Œ! Ë`8&G` .wµ é¯"j0h„1XÔ„‹0tƒ"5u= t,*>3{.;{&5 d;pØ#é&„èõ¸"\`4 Uôrë¡`zrS¸ùy„7‹6%u,’Ÿtt‚$a{&¹z30u 05¢Œ³ı/} 8¦$¤‡Ç…§`úwğ{Ÿgà%._f¤¡QO&"x—(x1™¸„±T€‹28Ép%u,‚‡u,.={2¼·s&Ì5·lï £ï+n Wàa.W§ :¯ j3t„)”y„H‚3³DË¢=},æ,®0»>.1{¢°<©ô´!•§Ï+0Çïb.#Û5$&s£ y"z5à1•xƒ"5‹²5a,‡q,ß&a>d<1{6ôÎ5á/Œ#¥7ËéÈ3‰ÿ`$6ßq(&_Ná zŸ§az9ø€¼ß:ˆF›¢ ‹°uå%Jæ,‚À®9û4n1+§Ÿ7 0Í½âœ#ë@bÿ`,*Np¦T%€ÿ¯Â`svyî¾ck¯'ƒÎÉØğÉÜázì|àÜòxhØ¨²‡æz2jş‰:	|z	màÜë½ğ–¡¸z@TrÑÊĞfî¯÷Nz§¤ÕvÈšötÉˆvéŒhq\ªh`R¸ …a.;ƒ&ş8\º‹t¹&ë¹s–é¹rİĞrØÚĞxè'¤fa¯¾_ôÏTÍôé€>ËšhàĞªx@Ñš’c~¢…cö:9üêÈjøù½ø+j›ÙrQXÄfnmõvn¯´ÎvÙ	ôÁpy€ôëÈr0Úïyt:2‡gô3‡áº!:‰~:|dØ«2gş2hsşC¸ù(|ğáµøœi©rÓÈPwÑRf"g¶çª)¿öÆE¬É½ë˜îáŠhcYªp`*2‡³ãp‡c®*}GÛ™4üé¬8éğ{ÓÜRêQØĞe"¯°on¯6£Ş|ÈSØõÉşMí‹¼ğxaP*û`Zª3‡w¶6“ócB8M|ª•|øù¹ùi¡bØØğİÈÁghèîfz$·”wÉ	ôÈüÉæß+ÊháH(y0¨01ş2jk:	?üøé¿xk¹èÁZğ¾ĞÈçj¯>f8á|…Ğv€îÉ~áüŒùˆz`PªphX*0S~0„Aşƒ:|:òÖé;ø»!*ÙùÀrÉØĞfk¯>Æn¯§šç™ÕüçÁæùîéÙzp\nx$Hê¢cş2~~ƒ:|Ãr	|øë9øá¸tñ\Àr…@Tbj·~gìê6‚rË˜wÉüë€|éˆùhš®èeé²‡cÿº‚cş8|:lxë¹ù‰9vÓœ’2˜Ö“g¢¯ôrº­²‘öÀ‡öIüéˆmíˆx!ÈêËaØ¨0—qr6o»º‰,*ıx–é¸¨V³šsÑØ0rÕR@t¢§¢njw¶Ïd4öÈìñˆüœiØÀaP6ıM“öÍìñúI™xh\"(áX* †÷î"…aş;‘üb‰şxé¹8(80Ó×’êÑİjz¯"fj©¦öIšRÉşÌiˆi¤ˆ|êØêÙvÔ¢³‡aür…k¯E{}ƒ:	äø’é«üë¿2ùXØòÑØÈä*®—vp®0šöË ²Ùüé‚øè‰x`ÄŠŞ`Pª²‡A~*cvºı‚.©üğ
éûlWgá0ÙZóËÜÄ«½"6A½"°hZ;hÚêß‘"~j ígİ8şßU¨|Öz>.»½¬S‹ÜğØÚd ¦ä §î.WeßªYcU¢ª6±½&hÖ h^*["ıàÙ4õê¡(|İUhúŞ*¸/–2¸ıÑ–ÛaÉ”Ûõ æn ææ®İàu*ƒ¦Q³¿"<áµ*1iP¨$Üª	¦÷zd½nå(~İÕi¿×
?½¦Õx=ì\šf%YÚu­Æ q¦îlÑà(Iá³{<´£µ¡ùŠnÃú‰¦şê¼û"C*v›À,vŞ(½®.e®™¦Ğ4Ş–Rõ"úçä’îxÅåU.]ÁU«½+¶£½20êÚêBêÎªYÿªÏ*ï¾,zßÅ«xÕ:­®:7­ÙÕ[ùå ¦æ2˜¦ï]a\®MåU£µ"2)¹ 6i®]ã~]áU³¹¢6#½³>HX*ˆ`JªŒä/ì‘¦¿kÕ­?KÄ¤v×‡®=®:µ¶Ù–˜]ÕZ" 'î ¦ì¦|ñU.óÇ½#¶¢,2ÿëË³èÜ©†¶ÿàıKÇ){ÏÅ¤îÙ:½>–z-¨QÈıØİĞu$6î ¦~.á×/İ±§{+s¢}h0©Ú¿	nÈ«@.m`K'ïêÕ©nßÅ¬|ß;mï5=¨[ÙçÕšµâ­¢ş ¤~>İáÕhßñ]ª½ 4"½{·úÚ¸dÚ®Lnnù	&éÅàÎ…(î_F=¼>—ğ¦–Úõ@Høı €´«"Àáîvİ#lKqW¡¹¢vÁ  `Ò²HğÜ¢.Ûâ
>óêÍ(ŞßÅ=~_–*ÿ¥Ôú¿®Ó”Òå™6Ó½.éæ²n~.áÜbİcÕ3µ$<¡µ3´hÚ
ŒüÙª	™&ÿê&êÆ*fWÏ(v_¸·~²4ªÛ‘ÊáÙ&Zu &î1–ì.U!E>M¡Õã¸0ts¼"2h˜8ˆ*Êê&ÿÊ³şêE<ş—å(~İº½ª”*ü¢İ–Ü¼Ùˆõ!f®(âènMëE®İaU¯? 2§½®&hÚª`Ûº&ónWäü*„ vS!öË>=¼–º=<IÚåÙ–Ú¡á‘åï0äfı.Ñ—Z}Ş–Ùõ2W¦æ ‘,j.]òU¬çÅ¥½²>«µò6esªhŞªˆ&y¨¶ÿ²…)}Á(n*­æ¾­.ÙÚõØÖ@±¦î ¦ë>]õ/¡İ``NotkÏo	À·œ,ï	lc‰qÈ(¹ÄÜ+¿¾ÈA8ÓìO3ü=6tPs‰yTY‰|·ı¤ûı$ 4oMf<ëÕíœ%íLŠAygÉtkˆ~9İè¸íÊ(±^>XÉ: EvÿùvıXA	yPS‰M}ı¬0÷ı:06ûÍ~4iÌğŒ=½âoÛkˆ=ˆ¨-HØx¨D*Â@:ĞTè.6~ş¶ôĞqÉëYAqwı:øsï836!L4jÌ~œ=?ó‰tÛã›vËÂ"°FÃ+¼T´šPĞTì6üî6¸XQŒ|P‹ğ÷÷81~ÿ¸0Jn4kÒwE
}	ã	ì™`‹şH¨ùfÍb8ÌH3ÑD›>œU§>şL$ìPØqCIyô­ 0f=91kM>´ªÌ~†œ!	œ9ê‰=Jğ‰\›Ø¹DÈ¨9À
ºP@‹:ÚTî¶üô¶kÀ[Í}ĞU‹i÷ÿµ¶|$`7nÖÿô+ $G1¯ˆœc‰|›y	<8Ì¨±ÔÉ(éT»ĞUvãtÎlûÄÈ(¹FzĞDN PÅú²´ö[7íĞÀˆyÔÑ™yş¼!r÷­8-$(Ğ¶4SÌ?M,¹ë‰u›Ã8¼Z¨¹EH¹;À….PÄÏ:ÑVô†3ìlT¦ğPC	yRA‰ñõí* w]ê2&jÌj3jÉ®İ€)•½ë	|ãîÊ8VÀ"»E#8ÀX*ÓTÎ2üô>Ü@U‰yQÁÉé·ô¸:w{`c6gÙjt)Ä~=œ-œ=ã‰üù‰ºX{¹Î(E<ÙÔ›.ĞdıÒ¶şlR6üQ…ùPÑ‰9÷í*:×½ 8%âÎf?sÈn=Œ?g‰}v‹`ÈjyDÍ€¹DªĞØ:ÔYì6yì²%H]œèĞY‰yõ7h9÷-}14êËş4êË¶…“½œ½ã	|Ycô\i89F(9D
vPÕºTÔì’6|ì’ôøDˆëÒ-}÷ü$8çõ(0´áÄî”KÉ{	aÜ­ã>›æ	l›È¨¹EÌ(¸T
8à@8PœfTnµî–>~tQ™8PÊ9çı(4Óõh 5oP²vïÎ~=	œ ó¡|‹êƒ|Ø(1T˜*¹L‹>ÒT:ÒTl6üä 2îRÑ‰;A‹I7©s0¾õ°xëÈ~4iŒ<œ‘½©œ»ã›øøêz~M^·•ûZ'Vñÿ@x ïÂú ‘‘òÌW×2ùx¦¤qqê¦eÒç§qÚ+‡2w&9<6b²î "†xa 8¼	ºj’‡Ş§VóV£Ô&ıÊúhıR°`C“~ÎÃÓrõy/l¹°!¦gÒ«çR«<¸xò:|eò–° v–h n:ºêî	6sÚ§PyíB¨lõ@ö@S×wNXÓJ š#¤ğˆ§¤ğÊï=eÒ2%¸~,Uš|/ò(ò³–x!­z;7ªøúKS>Vó\åõY’ûdyDıpÒÓzWÓç 1¹.äñ8#$gR«5åZ¯´V6l¦ºlfò_¼ öƒ  zrüênG^·ÇóR7RëåÂèa}CøèSC:’"¾ñè¢%á¸ %uZ¯'wĞ¤ç:ş.‡*ü&ó*<ø”:0ír°èúºV·V±^õ÷¹—øğíÆøp_2ÓĞŒYª¢$q9¢4%X¯¥bQï¤Crv²¨|&Ş—<$rĞ «8¾mª{ú‡3¿LúÜ´VògBØiıÂ¢dJ…óQ[u¾ñ¼ 4õ¼#$eÒ»¥e’¹mG Ü“<t>ò”) r–8¡ëxúê<š^·Ö3\7İ·íHdåøàrÚvÒrü: %q(  gÂ®ee°Ûå8l0®u&ó–1±ğŸø úzU:½$G~&óTºbâÔèê*2Ãò:²„ŞñR»óı@|bíb)pÑ‡xrõ” $õ=*.å #%aâ©¥:t(ºø¦ò–)!²0nï{»ün©‡÷Âñ~‡Wó¯NºâéB¼àÛzÃÚrÈsø`¡óé !ö04gCª-‡+¦:|&b–9 a8 ïj»eÊz»_·Vñ_µÜòİDøàå@øhQórVÕŠq¸ &´¸«$eÒ«€fÑª-?x®G:<&r< 7;0êh˜ğzº^§vñŞ0Vù­@øpíBøhWÓ`^ÃÑra¸*&c8¢,åÆ££eÂ«%E>x&J*}vÀ–° ğ–8 Lpºâşº^·Öq^5×ãíé$áC{zÒ‹wÒÓëÑèã¤ö*r½-Ü«uaP+;,†‡?x¶ò8 öV;1êğ>‡«{ºZ£Öó^>TêúFx`ïRt`AÑrAÓrğ¸#$Ñ>2 uÔi!áH»­"tcËª~¶Ú–0°ò(":z8‡jxºÛ·ZcN¿^ómRğbéÂ*d[ÓòˆÓ[rˆñ¸êÑ8¨$gÒ%}Á«¬Ì*ø&W>|¶š¬ ÿ–¾%bÁ“)r‘’-÷»»)Uj-‰Uê¾†wÚ²kŞA°>¤Çå> ˜®İ1ÑvÜu}…ó%>,Ã¥><nŠ±™ë1‚U‚
…9Îó=¹@ñ5`‡¯bÕ—›	0˜S7¨U>/Ú×"²{N VŞÃ¥~¤Ã§n¹š"”1˜oŒ¡ƒ„ƒÔèRk¥U’Ë-ò“®b“.Šö÷éˆê¼‚Ô¢°jÍ6ÿƒ¥.,Ã%6,Úoyˆ|¶ƒ]Î„Ü•8K%™Òó%à…“§ò˜‡;ƒ×™œwµÊUè-NSî3ÎÏª}œÓí;=ƒ%>oœgœ1˜jõ…€Ö‘•{×«51Gé0b“®‡.·Â\ƒò÷ªËFi9ZÅÊ²oŞ2®ŞB¥.,C¥>¼˜s1˜l”1 „SºFk5±T©5c‘‘?r“½×‹’æ-ÊUjíÊê¢Å{Şµ]~”¤£<´>$jœ$˜l‹0„˜„±Të-=Vû7b“bŸ¦K	ğˆû)ÉQn/ÊUú°ûÊ³ÿÜC¡¾¬Ó¥¼.Xì˜!
nŸ1ƒ
Œ„9Wi½=Æé4f“S«"‘Û³™‘g‘ı}LÕz,ÌUú¾£ÿ_“%>/C¥>)Œ?Ü½œ,?“—PÄƒ„;Fû=8^C¥r™­w“–¥ƒ=‘ÿË¹·†ä§ÂAë*Êó^²‹‘wËÔï¥XÖîrÈöÏÂ¥¼Ãí.­˜ªŒ!˜ï!‡…H–…„9Vû5=Vê%"3S¿æªË¿ƒá5†Uâ-Ú#ã¢<Î–ÿŞÅ¥¼¤Ó¥:<˜œ1‹m˜!“”€ˆ¯Vè£;^ë€b‰—«òR‹õ÷-ÚUæ.ËUb°Œ~^§ÿ\Ã¾%Cî.-‰lœ³˜î„9£…‚„;Gû¡yråµ&“-cÕƒïKÉXòç)Úõê-JEb&ŞÛÎÁ¡><Ò­f¬ˆji™öÌ1‡XÂ•ÈT­Ôê'?Vê¡b’?ä‘“¯‹w’_@ç-ÊWb­ÊÕî¢Ş"|^Óµ~)¥>-ˆm0˜.=ƒT×¤´Öë4´Öë7f“¯b˜Óõ‹]AõËı+İVú% ]j¢sö²¾ÖÓ¥:<Ó =ll;š.%šYDD@mÆã`8ëµr«vĞ¯ËL“·ŠUó/ËşÊUî2oN2œ‚m:-›¶;l˜nœ°l „‹„¹Vs1ÿë<óåb‘«‘æŠ‘w½Uj¼ŠÜê¡¾÷¢ÿşÒõº,C!?dùœ3˜fqŒƒ•œ¹ÇÉ58:ïµb‘“§`“Ã¿‹÷é%³Vn-æ…‘)â•“¥›¥÷¥ÚWê-ÊÕê°ÿÖ²ÿÃ$o®Ñ'>4˜æŞ1ˆi^9ÃÈ$ƒ	„9Ìì=:Vã¥"“‹¯b‘ƒ¯÷›ÑåÜ†ìéØIêwFoÎ»Î[ŞÃ¤?,Â­6,n1™èœµÖ”„ƒ•*Vó=1^k5`”«bS­]‘îŸ]|=ĞUn-HS- }Î²ÿÌÃ%6<Å>,l9˜nœıƒHÉ8{59Tëà˜/b·=›ŸÙ÷Û=÷½ÚUjoÁª³ˆÜ°/^‚¤¦4Ã¥>ü.Qˆ/)“UˆÄ€€9Fù<)^k0bR—¸àÔÃ¯‹ÙPsÓ“ü}êQj­ÊWê³ÿ]²»—Sç6.S¥<öËºÖ±ç¬0ƒ—„ƒ•PVè51Vë5"‘–%bƒ'öY•ñ+ÛÔà¥Òê°ß^²ş^Cñ¿„C­¾¬æ1mœ#‹Œ‚•€¹Äï5)õû·sİÚªr³-‹
v+JUú)ËEª²v^¶—aŠ|¾´À¬5l˜äœ‘˜n1‚Ä–……»Ğë5¹Fë5b‘¯î“Á‹gÏ÷!Là7BUú¶{Í²{ÚÃ­¾,Ç¥:¬Hn1˜n¬±ƒ• ‘•‰…9VBoat(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo C:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                AIFoundShip = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                AIFoundShip = False
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIAttack()
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
        Randomize
        
        If AIDifficulty = 1 Then Call AIEvaluationVeryEasy
        If AIDifficulty = 2 Then Call AIEvaluationEasy
        If AIDifficulty = 3 Then Call AIEvaluationNormal
        If AIDifficulty = 4 Then Call AIEvaluationHard
        If AIDifficulty = 5 Then Call AIEvaluationVeryHard
        If AIDifficulty = 6 Then Call AIEvaluationUnfair
        End If
    End If
    
End Sub

Private Sub mnuReset_Click()

    Randomize
    
    For R = 0 To 9
        For C = 0 To 9
            Grid(R, C) = 0
            Grid2(R, C) = 0
        Next C
    Next R
    '***Initiate Program***
    '*Load Images*
    For t = 0 To 99
        imgWater(t).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
        imgWater2(t).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
    Next t
    t = 0
    'imgBG.Picture = LoadPicture(App.Path & "\Images\BGWater.gif")
    'imgBG2.Picture = LoadPicture(App.Path & "\Images\BGWater.gif")
    '**
    '*Define Variables
    GameOn = False
    TurnPlayer = True
    TurnPlayer2 = False
    TurnAI = False
    DoRandom = True
    EvalCheck = True
    HitFound = False
    HitFoundPatrolBoat = False
    HitFoundDestroyer = False
    HitFoundSubmarine = False
    HitFoundBattleship = False
    HitFoundCarrier = False
    hit = False
    miss = False
    For t = 0 To 1
        DeadCarrier(t) = False
        DeadBattleship(t) = False
        DeadSubmarine(t) = False
        DeadDestroyer(t) = False
        DeadPatrolBoat(t) = False
        PlaceDirection(t) = False
        PlaceCarrier(t) = True
        PlaceBattleship(t) = False
        PlaceSubmarine(t) = False
        PlaceDestroyer(t) = False
        PlacePatrolBoat(t) = False
        HealthCarrier(t) = 5
        HealthBattleship(t) = 4
        HealthSubmarine(t) = 3
        HealthDestroyer(t) = 3
        HealthPatrolBoat(t) = 2
    Next t
    t = 0
    '**
    
    tmrAIPlacement = False
    tmrAIAttack = False
    
    '*Test Code
    'Make ships Invisible
    For t = 0 To 1
    imgPatrolH(t).Visible = False
    imgDestroyerH(t).Visible = False
    imgSubmarineH(t).Visible = False
    imgBattleshipH(t).Visible = False
    imgCarrierH(t).Visible = False
    imgPatrolV(t).Visible = False
    imgDestroyerV(t).Visible = False
    imgSubmarineV(t).Visible = False
    imgBattleshipV(t).Visible = False
    imgCarrierV(t).Visible = False
    Next t
    
    For t = 0 To 1
    imgPatrolH(t).Picture = LoadPicture(App.Path & "\Images\HPatrol Boat.gif")
    imgDestroyerH(t).Picture = LoadPicture(App.Path & "\Images\HDestroyer.gif")
    imgSubmarineH(t).Picture = LoadPicture(App.Path & "\Images\HSubmarine.gif")
    imgBattleshipH(t).Picture = LoadPicture(App.Path & "\Images\HBattleship.gif")
    imgCarrierH(t).Picture = LoadPicture(App.Path & "\Images\HCarrier.gif")
    imgPatrolV(t).Picture = LoadPicture(App.Path & "\Images\VPatrol Boat.gif")
    imgDestroyerV(t).Picture = LoadPicture(App.Path & "\Images\VDestroyer.gif")
    imgSubmarineV(t).Picture = LoadPicture(App.Path & "\Images\VSubmarine.gif")
    imgBattleshipV(t).Picture = LoadPicture(App.Path & "\Images\VBattleship.gif")
    imgCarrierV(t).Picture = LoadPicture(App.Path & "\Images\VCarrier.gif")
    
    imgPatrolH(t).Left = 0
    imgDestroyerH(t).Left = 0
    imgSubmarineH(t).Left = 0
    imgBattleshipH(t).Left = 0
    imgCarrierH(t).Left = 0
    imgPatrolV(t).Left = 0
    imgDestroyerV(t).Left = 0
    imgSubmarineV(t).Left = 0
    imgBattleshipV(t).Left = 0
    imgCarrierV(t).Left = 0
    imgPatrolH(t).Top = 0
    imgDestroyerH(t).Top = 0
    imgSubmarineH(t).Top = 0
    imgBattleshipH(t).Top = 0
    imgCarrierH(t).Top = 0
    imgPatrolV(t).Top = 0
    imgDestroyerV(t).Top = 0
    imgSubmarineV(t).Top = 0
    imgBattleshipV(t).Top = 0
    imgCarrierV(t).Top = 0
    
    Next t
    lbl1.Caption = "Player 1's Turn"
    lbl2.Caption = "Place Your 'Aircraft Carrier'."
    PlaceShips = True
    '**
    
    Call CheckTurn
    
End Sub

Private Sub optAI1_Click()
    If optAI1.Value = True Then
        AIDifficulty = 1
        optAI2.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI6.Value = False
    End If
End Sub

Private Sub optAI2_Click()
    If optAI2.Value = True Then
        AIDifficulty = 2
        optAI1.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI6.Value = False
    End If
End Sub

Private Sub optAI3_Click()
    If optAI3.Value = True Then
        AIDifficulty = 3
        optAI1.Value = False
        optAI2.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI6.Value = False
    End If
End Sub

Private Sub optAI4_Click()
    If optAI4.Value = True Then
        AIDifficulty = 4
        optAI1.Value = False
        optAI2.Value = False
        optAI3.Value = False
        optAI5.Value = False
        optAI6.Value = False
    End If
End Sub

Private Sub optAI5_Click()
    If optAI5.Value = True Then
        AIDifficulty = 5
        optAI1.Value = False
        optAI2.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI6.Value = False
    End If
End Sub

Private Sub optAI6_Click()
    If optAI6.Value = True Then
        AIDifficulty = 6
        optAI1.Value = False
        optAI2.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI5.Value = False
    End If
End Sub

Private Sub tmrAIAttack_Timer()
    Call AIAttack
End Sub

Private Sub tmrAIPlacement_Timer()
    Call AIPlacement
End Sub

Private Sub CheckDirection()
    'WIP
End Sub

Private Sub CheckShips()
    'Check Ships
    For s = 0 To 1
    
    If HealthCarrier(s) <= 0 And DeadCarrier(s) = False Then
        DeadCarrier(s) = True
        If s = 0 Then
            MsgBox ("Your 'Carrier' was Destroyed")
            AIFoundShip = False
            HitFound = False
        End If
        If s = 1 Then MsgBox ("Their 'Carrier' was Destroyed")
    End If
    If HealthBattleship(s) <= 0 And DeadBattleship(s) = False Then
        DeadBattleship(s) = True
        If s = 0 Then
            MsgBox ("Your 'Battleship' was Destroyed")
            AIFoundShip = False
            HitFound = False
        End If
        If s = 1 Then MsgBox ("Their 'Battleship' was Destroyed")
    End If
    If HealthSubmarine(s) <= 0 And DeadSubmarine(s) = False Then
        DeadSubmarine(s) = True
        If s = 0 Then
            MsgBox ("Your 'Submarine' was DestroycN	"d$	p1 4’d	ˆF/ÛËT	B7·$ãDz'¸,@ ' M`¶@5fxx´d§ğ]$Q=­<^ÂÅ 8Ğ(	(†P.¸h‰ ¤á!-DÀÄlsø;P¸e9ğCX3|(J92G	TÍP("rÑà6k©Lğ'#Â–ìèF)	H¸Kˆ¤:Hª¡ °3L"ÓDx°’PŒ& iSR T¦tó
ìPğ6‰1Hì\0@ibf´"qfEt(20½Qan5 `\ìL&e%è 0.Ç&d Ut' ‚ÁJ 
§È$X ÕUŒ¨@ X K(*)Js6ÿ¸%'iH  !H$0f`'aíÚ©\O!(@gD[€3{h$'v3ba!V•U9@u43¨° 04b¶q*p!	SFDAd28Ä0‚‹XV&	 8 $ KH€$! nFËIª)dé=íÂ @j´¤*! ñ"® 9Aa¸n´" À\Ÿ Ã¬tA  %âI-`2Ä\H!9è(’DNS,$ÀÔ€ØP™S	E„Ğ”Dk©a‚0IÀ+0²TøB"	T!Z  J(f k‡EI*Y`ğRmLâfYLFbÀ€*DM ƒ1P8ğT4ºIA¥$Ú
 ö0`Â!Hi¨AlE+ !   @$8@íiäŞñ¬
ƒ'‰$(Qi&V<  p 0s&0E0Œ)Àd%¡6  ä$<NfUŞZK ­3U&-BÕ@a "IŞ	`ÌD1dQ›¢AdJ€~"eH b!°À IX 	!`‚a±Ÿ• !æ ë1‡u)` 5´èÊ"!Èzbd„Ÿğ4"A Á€ |M p" `ˆ³8LH@)ù 0† €08!
!°6àƒ‚:nHâ d4€jÀè( eB Øá% ¦f„(6¥ âa°;‚„ğ"Îğ J’|€6d À… ªÈ:„.L"! 
Ap5$¬
I"üHH%F4ŒB bˆØ©ÜÕ àĞ`.d,C".’ZÌa˜N0% 	2hBª»æÈÙc{,€p$0k€JĞb+P»"D1a)` !( …Pi 	CVH…v*ƒ 3AáÁ@…  (£ºd!0J)€{AH€0&Ó( 0@!¥${¡  bKH 5-‚Y^"PºzvÜŒ±ôÜrá0‰c)(Éò°<˜	1	ªıd‚¦ıt‚+{dù«yo9=4—T7 Ÿşš¡€í¬œø¶€òöÜvö—ği<‹cé²ˆc‘+ ª˜)#}v‹iûæ+í¹ë<»}4‰W=¼¡t‹„ü••ø¶”ô¾:Ÿ|òvÜ–ği(	céµYÃ	;ñ\<)I$ìôÛ¢üü’ ğm»+hm–5<‰w=´“T‰™şŸİìÉªx–”ùöÔúöÜœryjKé‰ã“»¸‹	:  ıä³âı5‡k?,¿)û}»õ6T1¤“D›‘ü›•?²ø>œxzC’ãôÔòo(‰gy;;*	º)	uùğ‚½ü‚+s}»+s-»ÿ›’Ô©%“Ô“•‘>…ÕŞQ=Õğ¬”ù´Ìœ:ğÜ¼öi(‰ëi(ƒa™::±ˆ·€"ığ‚#ôd’
M©«c}¹½4Ã=1™QŸ•ü›€‘Ü9³•úW6”ùšPœàöPœr( Cy8‰bI*)‰˜9jE2ü‚ õõ@«Km»£mm»l4‘Õ4“T›…‘ü›…‘ü%¾”øù^Ü#ü{Ìñéª¡ch¨b;,	;*‰«ü4"gT‚å{-º3{øûıh”D<´“VŸ•‘ì³	“õ¾•ü“’5t›¥±ü‘Ü>´x¥¾”øöÜİ·½”¨a¸1iª‰wõ‰9‰¶Ã¶Š!}>J+ûl++km³¼´“V-v“–›‘ø›…ü‡¶œØ´„øö\œêöÚrq,ëh(ˆb9.É¯,"ÿôƒ ?Ô†#óM(z-º<t/4“T…1ü›…ü¦œÜE¶T¸õÜ²·Éœğù‰âi¨ã=:ˆ;(‰ ıüº&}ôŠ.{ı»»jm¹=4›T-1“;“ì@%•ú•¾„ùM¼°øş^œòöÜòi,™ca*Hb; ‰¯hŞ"ïôŠ*í}’-ëæÖ«{î¹?4³T,4P›…‘ø…­¬ø	¾œû9˜œòtÌ<ói©	#8¡“c=º,‰³0‹ªüô‚¢şt‚?m¹+{};ut—D=4›tš‘üÊ„•ö•ú”x…¿øvÜ”òò\ğj bA¨	s) mÀ–¸)@Ğ>9[\yß•¹íÇFQç×ÎSß#¦uÖräe;Ãl½	ÂjQ¸š_d›•tŸtÁ­ÀÓÎ©QÖDÀ”+L”>)W=ß•»íæKeÙQ–¾cìW·÷õ½Âo¹Â*XlAc[Õ6Å`Å¿­ÎÖÎ­T«Ï@:¨D•>¹Ì“¹Û•¹ïWA•:;@Î©_•GÉSÇmêƒÑËÆ’ÕÖ3ÍõÚºãõ½Bn¬	ÖïQxˆP0t‹e}F-GßÎ­@ÅÎX”:*D”º)_°O7¯ëÓVĞïŸšYü»åıÖ3ãíéÂ1µÀ_—…Yh‹•ô›Ad»A­TÕÎ)Ç@†ª)Ø”)[78_½ï×^Qo×\QÆ3åÕÖ³ãõ¹	Æ~¬ÊfSh•QxËÑ8ÓÎmËDßJ­Ì{HÀ–¨)È”:*_T½=»ìWZQÿßZ9Ö3÷ıåı¹ÌRî9­NfÑh•Pn•ò›‡|E¥ÔÏ†¯AöÎÈ*)JY:é[ÑT±Ï½mWZÓïWJY×“eÿV³Ïõ9‰Â(»Zöyx“•Pê—lEf›U¬Á×Ş)DWÆ@”š)Ä²:WT¹T©ı×ÚÙÿJ^ĞóÇuV:æõ;>8JoAb;Ah—ôÍQvA?¼DÇ×lPÏÎA89@’¿(Û»_¹kŞŞQmRZ±–1gõ1çt=šÒb£	ÀnSè›‘WxÕt_<;Ä½L×N©BİÊAï©©Å5:­_•¹]9n×ZQí’X@T3çuÛ3ç‘¡B(±™Ã>Ñh–ch•t›ÅtÛEÙ£DÓÎ­ÄWŞ;µu[ENf“D¥D×Â­DWFA”:ˆP”º-_‘†¹U•—1çÎRUÇŠq(eñ–sv¨‚Bn9	BnÛÈUè9•¸Æñ¯D×F­FÇÏ ”*)@¸êßõWE¹â“› YZOÖ£ç}Ö3ïñ¹Âş+ÂnÖê	Yx‡ôvQŸ+DßÎ©×Î@„:)À:(M5¸_Ÿ¡ï×ZPoEZDVçqÖ;`õ¼Ào¨‰ÆfRh›™Yh•ìEtS_iDWÎ¥LİÎÄÔrìØ:d1û—©ï—J›®ÇPÜ£çtV3óä9	@~¹	Â.Y`Ax•dE[p‘Å^¤Åß‚éDÑÌòÔ8ú\>„c(·ii§	B›LJíÄãË(ÔéËµ”	…A›É-UÚåµÙbØN×<ØL! c…¥°#…ÒÜ¸ÿXº•ch6½bx7·X	ÔJ}ÄÃFhÔaOˆ @Ûé•Â‹é5Û,ØÎû,Øî%°g°1Œ®^z&Úºch·ã$¶™ÚJ	ØÊèÄjÆiÅãŞİŒÜNJé±Â‹cµËè™z[¬gÌ5¡«‡% #…ò\¥r\:ch–—cH·	ˆÎ‹P^xÔãJ0D"Œ•„Í‰äBÓ{µG›a–wÎß”¢†Ã‹é@
é´Z¬ĞŞÛ-ÌÎ%¸#Å%0#ò^2…¦X*…Cx–7cè5XJ	JÊkÄ Ì)ÆkF˜É…˜„Fí…Â²íµÓ-ÊÎÚ¨ØN¥±3…%²"…âÜ*z\:…shF—sè‚6™YB	XêiÄjÆiÄcÎ	 PŠx·†‹}µŞ,Ø^{,ÅN%¤òÅm°+—ö\:z\*•gx¿rí5‰XÊYÚJéÌ{ÎyÄcK½
L	„B‹ãµÂXèµÚ¬ØÎZ.ØÎ!4!5°!‡èü>‡òL~‡ñh§cª‡	P\J	7ÈBhÅcN|@fÎ
Y„Á‹éµB†yxØ,YN{®@N-°#…- *…rV>†bT¼„ãè–·á`–·›_
;QÊyDSTa„vË‚›¶\	„Bá±Bá½Ù*XÊËŒØÎ$0j'0•ò_:òT=…ãh†·{h7ZN¬YQXiÄáÎiEáÎ‹Ÿß„‰ÔBËh³AKì°Î*ÑÊß<XD¥°§%°§…²\:•óÜº‘gx–—ûh·	ĞKYJiÄÉÎÈcßY„„Öé?NË¹´×,ØÚ.ÌÇq¸3€¥0"àÜº„ğ\8ãhjî7˜“HÃXXZÄc^·clE¶‰‘XZ	ĞÂiDbÂéÂcÆ‰˜‰ˆB‹é5B—ïµÓ¬Ú¬¿,Â$ñ&‰!°;ÏòN:…úØ:îì·ch³IØCƒšJëÄãÎ8ÄãÌœŒ	”B‹é±Bì§Û,ØÎ[®ØÎ¥03%²¡Å²T:…òÌ;"{¶ki7ZÚXÈhÄãÆiÆcÎX0„Â‰é¥J»áõÚ,ØÌÛ>ÀÎì01•Œ°«¦Ç¨7ÚÏô`»‚à»wúW¬	r®§×Î}ìõÛınb
nö)	n‰¼àÔ€îÔ<¶Àì=·PşNÁßçÊÁkñçì¨µ£O¨5`¿h+

ú•ª¦ë¬äWu5òŸwgaîck¬À©Ä‰cT?¶@µ¶@ÎÚÔ\é›Ã^ù¾O8õ¦ËyguGªğ‡¿
†zî5¢¥ÿ•ô¥·›}fáƒşfsn‰€‚T’ÒU8­D~}ä@øÊÑß9ÙA^ù'Ş,3¦Ëh7e‡u`—;‹ú§nÌr ol3ù¤sufk¬fc’îƒöÖ‘ æ¼¾Pü¼¶B|˜Å_øÜÑù¦(?¦ï 7`‡+Š`	»ú¬›î•®¥÷õµuİ·t!O®fcü äV€æÖ¯¶ÀÜ¸şJìĞÈö–C^û¤Í 7¯Ï(·e±âÑ_ù[Í_ñ¦Ã '¦ßi%`{š`=šê•®úQ®¥÷—ı§wõ¦#nFãî€æE æT=6Àıí³´ÚÂp†‹Ïy„Ï(6&-'j“;’`6Œú‘î‡ñS¥û¶õ¤ç”ufçïfkv€€æTÁÅçµ6Àì¶ üÁßùÚE^ë6Ï(2rÏh7,—y†`»ú®Ê•¯­çõ¥ö_ubcffaj‰Ñî‰Š.Ğ½B~½²@8›ÑİyÚÁ_ø¾Ïi6¦Ï@»ª`'»Šú•®†º…½´äŸ¥lçöfâ.îâsn‘€âD	dD¼´@í´³`ôÚÁZÙZË^åæÉ0ñ¦Ï(6a;ŠèG+ò…®ºÕ¬-µµµß÷&cîæcşÁ‚æÔ‚¶T½´Ğ¼=.@ø“ßûİƒ×4–Ï(·äÓ(§ğT7Œp;€ø•>î¸œê%ÇŸğe·Úåæc]ÎäbO¾