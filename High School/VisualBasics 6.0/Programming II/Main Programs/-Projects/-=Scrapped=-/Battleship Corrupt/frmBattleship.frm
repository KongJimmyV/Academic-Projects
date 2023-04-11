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
                        Next x
�3�M��Υ�@֮/�>�K��T��< U��ǡ���wSΫw��il1¦|�D�"��eA��o!��v���}���.����Ԥ��X���㰡��:���յ%�
�u��y��fƳX��fCh��k�?6�S�cpq�h���]����]N-K��������8$0ge
�������YC+�g���\��{�ú�f	�]�攋�QBt�@^e;3�񄨩bԠ
w���:��ₖB��O_��w(d$�A�
��2��c���[ǝ�*���L<²d2�7X��!!��#��͢�=�"S�4��-���4���r����Zho=;U�+�JZ?�.E���5ևA�*L�̨�u����n����%�%Ȏձ��^���C�b�J���d���1��,P3>��E�/鷙��6���A&�                      imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
             �h� $ $  !0L�,|@ aTo%� 9 �2RGV&b$ 0p�� �   � (�!00p"@.acb@@r!@p(�|)S� � F�duI
 0  (! #$  0! 4`��$ &(38�#@�#r M((PailU(e  L~a 0r�2u)XP�.�AR( �p�PIm fdu�CR($*Id#%	0 `           `  (� ` HAgPat0�r(ID!^x)b0hktuDeh� IlA ia��beh P0"@�Vh0. :LMmEcAsd'a,t:HN#(� !��  ":  �p � ( # haL c p�`o�((0"l�#G Q�yr0�Beulasip*&-!((0  �* ) !�  � &  ! F�X}"�Zʡ   ( !`  `%@ @ �  E�dHd�*,   (�  �h 0       Dd�B6$��� �0�  $   ` ("0" �dG)�a�bph�n 9""A C3~%d  @Yo
�!(    0 0a 0, �B�A *`�'W#d�r"�(Qii�E E#w3
-�f�.>Ur�`Apx%U`�. �\M�Ag 9]X�
,�)C 9
 `  ���!  d  8`   p�  dJh2.Ca�TmO,!U�� l@#e Aver&CFsf4�mR�)0&�
� "" 0 ` !  ( !� � f�q�	�   �0#��a      �Td&ow : �U��Mb0@%<MJ  ! 1   $�!    (  X6 r�T�Q� &�' 0 P)ab %
� #��!�����r���I������旡^���CY:pG�D�.������P��^5�QP˩��� 0�� 3���΋�[4�*i��p����Ul �I���јœհjg!M6�	�X��ɫ���#�B-`X����6���LS:<SA����t�����S"d 6��P�� �D瑡Ց�o��WgJ�A٨�.1A�jN�j{r�P�t����w5ty���K�O>я�]��WiL�������������B�#4�Ћ%#�����0��I�Ń�9Ru�"���#Y
q��Uh�X�X�����Ȁ}�I�];S�p�Qh����'�ۏ3��P�RAX3Ux�"\jֺ:Bo���4և�(���ČqBа���<uY���8���څ��`��Q4�S����U+"��X4��
��t�\r��f������&�a.\�.`j[s�����/��uٛ��[��y��9�}F1�+u���犟������z�ſ"!u6%�����qSO/�W��u���.�܀��=O���d�x7X��by��@���o���H��Y��c#$�QG�#�s:ĆR��G�Z�q�BG۾7L��:��,�o��9��d�س�{ל��*�^�zA#�S�ayQ3�
��?���|��u)!�,�Pi##\�<���u���-z�	�8w��K�C+����~%΃p�b`�c�l"��R��� �т�Q��<CN�WvD�]=(0��gy�V�] ��iG!��8�
򧺃M����?#���36��1,}|j�K��S�a�����8��=�F+�ȝ�s��.���!:��*��lPs�@
�P Kj+،*d%��9gm���l|����jήۯ��SQ��»_�����~������ �q�oV՘*��͌k�ˏtb6d`?fw��`�Cnq��\L~���i���1]��S��5K���[��^��r���(
���v�4���A��(ăWR�n9:0�6ov�%�{hZl�.m�����r���m�"���0��Û���Dw��*k�#�H������Wc�>�~,�SX���t!634�j�>J�
zZ�1������� u���j8_�#7]��ք���Sf�&E�����㣎S��bX��oX,gH�ʊ�����P�rى�y��*��}.�<��l%�x/x��F��h�9hwqXQu�bA÷&��YN���x��ߕ�:+�i2��2H>.~�9j<�������1�k�~��efe����U��/�~�z���sک��Q������(뛟��x6jW���AћX�۫��n���=`D}�X<̆R��9+�NK��U�{|qα�U�
&��*	Kَ�����?�������pR��%Vݮ88���5	�� k��G#��x�qv����nö��ʃ����,�����t�M�ÙƎ�.nU�M�x���o��c: W��E{p�'��c�+�A�JY����G]�
��h\,]� ��������MsIK6uH�����1���B������ ���gM�f�ȋ�y�ջ��[���Dq�i�x�k�O��N��zCb���	�;�̜�'�fT�p�L������T����1<<�ܲXC�@B���z�Py2=�3˧���S��4��8�|R�d���0\H�D���|��>)����?N�ķE!A�xk8ȷ ^��붤	�K1�y����%&���s���R j�8ka�(߰9=	���4}�e(c5���P���Z4�
d+��Z���C���r�h<I��\L�3��s��Q�.�� �S`��*��W���i6	0.�_�PtIo�l�[v?õ�x�#�2�^b��"�����
�@�ECΠOT�bS
*��'b�K	z�x��
3��M�U���	�a��j������<��`[�Us�E�ⱆ
��*Ϟ�]��݋�D�)�h��sw8�ڐK�eC'�"�y��󪇔�$��uD`d&D���������d6"U�#�z�5�m�(I��K��p9��
]��)��S8�*���ǒ���a�b�;<���qmuP�Ԃ�A�;T
�d���L��&=����=L<�z(e�j�4��D���l�i=IpX��I���E��1��*P��"C*39x�n 
8��߉��P��ܺ}]=�+�~�Z����c�%ٟ�<-���
�	�~�Z����#�-٧�P�(�J�Ȝuj�Ŝ��hq2Vb��tA�#(\����ɻ�<Q�ܮ�2��s�}��C�%�8��Ez��Yl B��"��������A�ŵ
��$v��K;tYd�
.�E�B*�GE�[$8�e�+�AS�&ď�����ư�
���K�]�G��_�q'�`'.Qr���Tᮁ�d1V9�W�9��"f�Ѿ�ø��s_�7���k���Ӊ�j��o��kM�����?l0e�f���_G�p:?��u�?���n$m�5�Ω6]��C�	�jwP\W��2��q$#��!ݺ�5c�3U��,J����g����֗D�*xӑ���4 ߎ�i�(Ŕg�$���ھ ��QM�!����jnםr��$�`f7�U��4JP����'���9;�x+��b�k7:�2��8�m�?�y�Faq��lA��B����k)��� ��8���"Q/�Iw�(2Z�!(�y!��A8��0�Ys�:�o�c��Opߍ˻���m�\��[�#0��ڻc���f�(��p�����#�h1x�(pn��uzGs�
5���ke����<V�'�+�0�,�Q�~��T����k�+�C��17�8��~\�[�_���m+��q{��06�}7��|���k���ʥ*�\L̶�Z��>��}�Uj�C}v���6�js���)TJ�R����'����A��=C�FǬ1�x��?3�t)Z=r�P/��h��� |r���#ȁHC����$�ݍ�u��?L^��1���9/�>�^��s0���t��Y<vITi�h�|�KV�@�c=yJxc�rdLL��wNUk��Q�@�ŰJf_t'vb]�cy����H��&�8��eXm���»�~zM`$qSq��y�wڞ�?X&s��Y��s�5�C6�����/p��&=P����'�`fD�@hjkP���d᫁�dq8�ط zH�UK���)�	#u7�~��r���â���*8�Śl7P%����N��S=�UZ{��X���+l�؍{iy�k� >&��D��� ��1�yz?c�q��h���e���:���;�rA`[v�k^d�رrE���`-���z����8����<�q�j�?�*档��B�X�:�%��쵊j~��0��<$`fW��[ �Z)|���k�f�R�$xX(�X���*5.�T���Z~
0�����6D��,�� ^ؘ��$����1�;$��u~�}(���w6�5?cZ�*#��G��hR��e�
n�� �����v��k4��=��>Gn���c)�����׫!�� 2Nձ�娅�X9��7_~D8S֠�)�2�#3^�b���������>��  �dЭ��
b5�
���/���7��44Q���$-(gt�d2��P����vJ$�~�1��l��oN쑍+_̠X�BG*3"MN��8_E�����ǣ���x���f������,�-��膬�h�$�l	lͽ�*N��pג$@fѰ���>a�6��6�8�at(8����r��4�|$�]Lv�TM�/�y�fz���|��*����M���AՅ?S�OVŞO(Жv65?J~�l��N1��W�}���%�f���<タ�J����4N�
�U �����
=�_7^ �gXؑ���#�(t��1n�E�c�P52��@j�x���<¬��N�o
B��5ۥ����s���4�y�i��i�}�~�*#�qFT�`(N{r���Pa��S�"h�K#LN�W��8�L�N_�Q�������N\���tmuD����S�1`�<��T����ʶ�5����-L<�d�x'\��`_�����X�ah��,����@'���a_#�4�"m�h{�lNo���9mM��4��W�*\zȈ�Np���r�w���~�B��
c�%��A;��;���UJ���R��@GgW� {`�Ͼ�1������8�y��R�n5�+�� �p~�좻X�n2���l ��f�����������5nΆRօ�	H��F�	gyA��Yo��� ���C�*i�.��������=���{�e{�(ځT�B�%�@4�p�ԉz��p�^<�!68����<6P�C`y�0��Lb���}'%	�Lm�������-�e5L��dQ�	��+�bϼp����z>�mf\����Q���6jD�� 7�����H
$�ŤS�G���*�Z�����4FI��.{;4d��+�4=<���z��f8�����,�wBݳg�̯��׃�B��.�ֻy|P���Ѹ�5q,|�i����|�ՠ[����\9�{(�(_1��N��H┙�q?B<�x��H���ah��3���r|X cz3Y�fDJ�1*���v���A�
|ڳ̈�,\�׼����+z~�Z����C�'��}2�n�|�x�q3���#��Gd4a3��t �R,��׉��V���i2l�porary Storage of Last Row, Col, I
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
                " 8A�"	,:��5E.x���&,N�
 z�DjR*�+	B@h�ɀ�d(F�M��`eEBO:TA�4�Y@fBA�!�-� 
 `E8�8��4I"@8�(`*4`p4�0�$���PVi0+ P�t�3�z8&�@B��. � @2 F@ �5��$��0�@�A�Oa!%��jTAT&��*�q� �
`	P��
&! �1�@$` ��"R�
� ��F �
b4�@�v�5�D2�J% J:ps@,� 	FL<�P(Q�t `"�@v q�P�1 �R!�HCL�PM�ְ@,�3Ȉ:+�B %A� Q7bh�k��`%��4  +2 E����� �@a�V  Bv��`D8	�
j( - A5@�L�?�6k0q�����PRz��2M:du2#R! d �
 �h(� �� ��� Jvch��p�Q!t�4
����&
�����y���6�f�(f���p�i�&��2p|#�#z�/�i�̧�=�'�T�c(X�s��Аe��Q��Y���t�bL)b��y�r��v6p�4p�����k��)���93�]b�S�c�V��K�r����a�q�e(r��qr�yp�d���P,��?(��/v�?��љ��G#��#��@�RAj[�Y��򅹹{Ge���y���r�s��0r젇��i�?����:������� !�2�oǚ��Z���Q��a!cw���K`������4�rc)��<v��~�s��3`�#"༧�-p釯qi��'�;��I�s ����Ē�����[I�[��q)b0�b�9�Cz�r2�#2`���-p��#`�+���8��R�� ���PH�U
m��/�ܢ�S\�w�`C�rG��b���2��5p<��,��>49}7�Y9���¡��`��m�
�o1A�^1Z�Tl]�P����غC^���i���aK��
D��ON��OA{�U��E[�uT^��R�S�XHF�s���ŝ��౑%e|���l������ ���CN���@�C���E���Ɍu���S�I�P�S�sA�{s��r��������z�|�k�0�� �	�GL��N�����ۻOc������MؿR�/XNͭ/�Zcs����a�"���h�l�(�����U_H���|�jĚ�
 �MC}�M���S�;���TS�QK����G�r���q��f��s�"c)��mV(�m�j̐� 2��M��S�^�i�������˛uԖ��V�üZNS�����q�����"�T�i�~�z�� \ ��O���	t�C���E�{�۞�D[��WNK�RE͟����3��[�W"a4U1�hZp�dܫLP�����]��W��}�K��+U���ؘ�UӜ�RHC��(�����@ί����&a.�j�f��L�����U_L��OZ����w�G��U���_��L�)\��)A�q!�P������d���l�j����]WM���oF�>G��G��M[ŕӊ�@��WL�rEL�;Q��T��� ���k�`�*������E���@��CA�3GC{W[�UI�u�mQ^C�sQ��s�Xq�����L��\�ݨ��^�G��KN%�_]��G�{����TZ��UQ�|FLc�R�C�a�ZBq���"�"��b����S��5�a����`VJ���"L�6����֤��^�́��G��K��UV��RnC0r�C
�������:aV�;�^�m���m}|���T~��m?l�7TlQ҄W�ޕ�6����z`K��d
&}�z=
'bB�����z��:w���&��҉ŭ����6hư� ���J3�����BX�s�
C��~B�m�B�g��Rm�RB���Gb竜#P�V3��D��ڀq��0s|M:�f
���B��k�[�г�*�1����	��PY���hG�sx�+��AcH�ס��S�yu0�:�S�� ��7�5~�M&�rR%s��Bq� r��g�����字�R
>����<u���	���Y���mϠ!h��@�kʚS�\�SH�IgO2y�	��@gbCJ7ZnfDZg˽7ǽ.��҉a��	ע���j�Ho��a��[��S�a��2��]2�bF�a�׺f��8� c�B�v�!��	�ҋΰ3(Ӣ3h:cА̋HB��������6v-���=�b�Ӊ�2
��Ê�R�/L�
�E��YA�w��By.��V� �\B ��O��蛶0�%�6�9B��X�좂4RǊ�ܯ�抯B���Q���A�8�Z((YZ��ȓF����� ��f��6v/������J��U�/D��L���U���AJlh\T8(^]� ȋ̃́�j�� Z�w���>~mLA,2؃�؋��Ҝ�^�/U�?���X�B�F��(��h(MZ��FI��ʄ���ф��$>f*;6�<�����@���Zʚ�Z���X�����AC�_�Np(��h��ȃ��H������� �<�66�)H)�"H���ӊ�����o.��0�UPH�\AF�y\�h�VZ�\�J�h�����&��/�>��Єx"��+�
�B@�$[˫D昿Fd��ab��HBh�N`��ڛ�Y����z�����7��47�+ȓ��꺚�ZÊ4@B�Dv���@I@��Q�n���i4L��vމS��ACi)Mvh%�Z�Mș�"ȃ��� r��&�=�=M-ȋ�b���b��SW��K.���4_A�X�H(]�,(\*����Å�2˅������%�>��J�pr�
f�UR|�XJ�NR���ņ苅���>�+0&�-H��ȁ���4Zۂ&^íD��@��@��n�I�j\V` \Z����
H� z���~ǽ�?����Ɉ��҅�"��ˉ�JӏDf��#�W\AB��@��(���-\Л�ؙ�ȅ �
��x��&�-���mI��ȁ�"�JAʵJçD��L��\@D��R�x����c���iC��mg̕(�J��T���ÿ|
���L�M���9)B2ceDP�GD��7��V�ӿ|�]��L��QU=C?�5÷����G���{�/�Y/u�/���e���'̡��IM�CO���߿9o�`vF��  N1C��5���Yx����9��z����6����AƻP�3X���E���+jv�:i�E�ȁDĐt%Q��1ǿ��߸�.{Kop{,�����m����+Dᇭ�ɝ�����W;mg/y�RԘ�t��Եÿ\ÿ�����x{-�;��}��}�&�;��B?Iݙ�K���K�h~��k&Mט�DYX������?t>�_�
�_�z�}����5}��}����H�^�HM���
�U�"�7A?�1�L��߼�^8+/�z/𵵶�+m;aF7E!�;݊��I���k�:YgF����T5Ƿ�7ӭ|���_|s!u�.�}�����Ի�sF;@̛K]���	F�|~DFXT؀P4ï�a�5t��t�O�k}���/�4�6s�.������E��Kř����u
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
                        imgWar00�lNrrP�e�!�D���4f�dcaD�"�1e!�@�^fE,A��i��R�H? ��bD�5B�H � "aX!�($ P�H#�b��0q(���@H8pi�HDRAcie� Ta�*� Y2j@p��@ 4"HiH!-�2DYd-kj"�#��}0 $$E���(3t8��L@A�¡Ek)$���ib�@5/up� R�@3 A�n�fP|P�`�h�$�F�)��"B`�+��"�>f(0�E5`4"	D,�$d �"�`k��AcKpp$,��v �C@Z`�I\1� � 0"
  @�a2$`z`$��r
  �Lk�,!Gz�)T �6X�"Dw#Ha Kq[`� ��&8��  � 4�h �D4Th�Eg���`'\0d
Gk�̅� D#� DA �� 	  �2D"��"� �Ta�  �WW^a��I騙g:��*� a�1l�+Bq 8cDT7@1�$�,!��H�@0БLF��2DKcb9�� $�� 43!�Ha#�0��a  ��
sLR@�P6@��Ѐl�AH%�kf%�*Vi$T���BL P
  j�@.z$�D� ���F��`b0h@�Umc UBf(d!Q�67 bLP|x(2Bga�#�"�d" (!��(�` �d4@$�JXgCNY	�4  %9p(  � �"(�  0D>R+- R%
" ��4�&C� *5*
PDQHf�Z(����$��(d*&`` d�-
`p~)WRM$,$ ,H  ��+�0	A�$�!��8�P"gV  q|!BaX�I ($Pb Ɇ0�$uD%v !\Ы��a�B!�eP0U
(	a� f&�hXD@2����R{Nv�/��L���M��P�[��H�$2�C2���
��!�/�+�����k.�1:Ri�7��L�h��I[�D_�˲?��QԊ8��K1�T��)\��]D����pyj�Py9��
#YD�]_Ыh��1j!\���2Ϻ1���Lܲ��CHQ�TK��s)G�0)�
��D9�Tϒ�<�&�^��^���tkpUy���!�Ovq�b*�Hp���X�HHY�P)�Ysk̒(�\�8�
;���<��a�jRr�́�\� �xxT}?8�k�N�:��1D���c_�A�[���
8��<��k�#�!���)p���4�cf1N�1LԈ���PI�RLY�J3-�1+C܇>|�
8�����wU�)]���8Pqn&Q�N|��5]���vh�AJW��Hۤ�-�p)CD
ix�8І��+�#����7���9P1*8Ry��[����ܮj��H6H\��#i��%CԦ�kD
Ȕo�#��5�	TT�n0@yz��p\î�E20X��H.*�JY�@�K��!S2)GĘ�����ҳ�a]�Q�UP��3] �0Py��1��0D��]���P\<H�$�a�X������B�̃S�/}S3q�7�`? ���/ӧ����r�k�38̂\JE��[(��(���I��^������·[�7)Rr�3��pj ����E6�ͩk��!">���\[ML[�s�� ]g\[�ݞ�DO�܇��� �^
e��]k�{�����[�3�R�&{p���p7 �&�}Ŧ��3���3��Ň\�̙^K0�����^Ki�VCg�e���팃��iQ#�<5�i7���w�����=�a��ĈH[N�\׃(�t�����Kg�M[u��̋mćم79s�3hp�@�r7 ����E.E!#����XWO�D�8�b�����%�_���̇���CӁ;~[cu��t7������jBw��3�7�z:ȈLS̀\ǀnf-Ө�dZ�}�^����콇K 3�S�7i�@aP5 ���o/�{�1���+>�K[^�L)�݃����*��N[e^�u��M��ćc� �~z!d7��=��?������3���1���\�)\O� ���(��^[g��Ke��܅�N�G��|�зy`71x3 ��m���oE��v�W�
\[�Ȉ�p��*<�^����Km��ύm��� 3��3�p?�v7�0��E��w�᱾�3�Ł�܇ۧ(ql����Չ�Sˉ��a�z��Su�^C���L��Ɔ�ģiS���`7��`&�16�~զ
w��36�3�\�\KΉ\Y��)����WM���l��χ�̇	����JyQ�	��7����>�>���s��:�UϙY͉Q_�8���+��Og�WBa�h͆m�� 3)w#�z����7ı��{ŧ}��38U�3��
��1��Y�//I�-�޹>b��< �����pn�n=�n����������1�X���P���b��㊟�w
���+�I�?���2'��f&��h�A��th��l��������P�9�X���b�PWr��w�ֲc��i飏I��X+���m7r�����%^��%.�����񖻑��XE)�Z��E$��W`��s���p���))M�'��y�6��'&�􉺋p��b�j,c*:�P���v��8KŽ����r��Wn��w��6p��I�/�.�-��z�j��8"򁡋���n8n�n�j�����zy2ZT��Z��Wb?��j��s���s��_�/��_B�?3���E�/�M�=�F�w��l2&������$�$�n%f�?c�������=���{ȁk��G`��s�s��	i/��	?�ɹ6��6&�����u���j�n=��������*���^��X��Ve��V`��c����ϩ�E�'��q{�H�6&�ɠ��	(-j�n����ӗ��z�a��v��Q�MMQh'�z���}���x�~Q��7v��~	�������m�j{����S�6/nO4���e��QhI]�jT��CF��Úx��퀐D3��5w?���?��8���h��O7�O�6�����V�Eq`�MX(M�������r%��>��6f�o�'�u�?���Դ~x��bfGK6�NO����ᖴ�Q[]EQ�H��HӋ�_ǉz��nQ�6 79?�,�?���_4z��~��M���[���n��^
�w��v~�����< �F���00rB���O6v��Z�������3��/�3���SMǤ�\�dF�����}�Ë����x����r��7b���*�?�-9����;�OK>�JG�g����QhM�Q��<������k���ۃwr�?�����/��^�zzذ����#��V4���^!��,ESkAI������z��~���V�'֥�j�{�#t
�����k�_"��O&������S|MPl\���CX�Mj��8O��7& �v/|�7���p���z�OO���O&���av�OQh�M�z�ü�J��Q�z�z�7�7r=�������O�~8�(��;��}/�*z�2x���2��O����
���QhM��j��������c��x��76  5~	?��u��I��x��:��M���>����Ł�"�ʰK�Y��� @���mc��|n�[�I��tc��lq/G`��8��j86SK�ASS���U�L��[*�'-��������|Uyctec�J?���%G�#���0<���{�vY��I��ߍh�ǀ��j�1��	����k���c���f��	�N��}����x%�8��d8��IӆdɃ�F	hӈx;*�#���k���#��?s����������	w��q�Vi�����<��Q��������בh?��ڳ��
�&�x7��b�
���	�{����y=��i�o	���q��h��h�fᚧ�������������GQ�7��0��S �1�M{����u��9��R���M��(x�c��2����I��Y���˸���x#�*�2	��!�����3�lH��ys�����o
yL@`1[�j��,���<�O�`E��ő�CƉ8�2��C��'�����#��s�J�	�J�	����w�h�}���{��K}A���
%�1��Y�ɓ׃臇-�3���Ҁ���1��'��z���c��-�@�k��m�vh�>��<�bC��ٛ�ׁ)�׋��_��#4�������ʝ��-��͞MEĴ���l�"������!������Q�#�bs�B38,[��dR��D��ȑ��E!��&F΃�N���,4����t������f�Q�wg��!��)f��[�s���������d�dΏ�̎W�%<�Q���|�p�|O�-�{'\�s���'�rZ!Jfv6E
�,[��@�� h�a�ʁl�4�
�̞�%�����I|���|��i�7�\�t�Hӣj��!�b��S&&ۊ�@��Q�װ�K@aVBdL�^^��%����|���};��8r�Q���XW!cr۠Jb��[���y��L��0��dJd̎���LA%�r�e�|���<����?�X���H�!J#�!Fb�$K
�4��P�A�l���
�����U��A�NM���ln�<��<'`��v�ظ$�X�1`��)�B��K
�$[��LӢBk�%B�2!������΁�X�p��MDʕdL�ևȦ�	���E5��n�t���`i8��X:4�X�Af�#��g%L��&[Z�H�a�B�������̍����
^Ȅ�%��e��|'��o���v�ܘg�P�3Bv�!�c��K��'A��A���@�sK!ʔb�
ԛ�_E�-����v�.x����xv�Z��g�|!D#�i�z��Y�q�A���t�N�n�t�pP�7�e�'�����B���Z�C[sYG���X� a�����Y�_sKG[c��䣱�d�ĺd�F��oI\D�V��`/μ`�p�Al%tԯ���+v��7$��7�R�3[A[a����aP�H��j̦Dn��ݑ]̈́��<t�֮����p��/��\������˸6��K�qPBYSa�o�����^>t~l.YnP���QT\�֥n.��d��
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
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif"(  :�  � `8@"   $(   �`1HO'_a\q�` ToD!/DqBu�Rm ,pEnq ibH%"g�A`��`4 &"hIlafEb�bIb�m'hL + (d�  p  ,B �  � � e (# �nl2< pp!n�`= 0p�1u8�r 5a2RmAb'�$
�l  2     �*$� 0a(O7p4|�$Iy�P`3$u"e � �@dh�p�Ahe "
 Av  $ XIegv�py��*F�&")�Z    � `B� `@ � 4 $` `�imfSA !f3 g}r1*@Ac�r�e

 �  (` !  , 	("8   !& h��27Aa4�i'~ ?0@*a� g�r�aZ� uzn 
AC$Lb  0�  �b  0   "1�(]odEF
J@e
��E��8�	��:�-�*��J4����$�֧�9��G#4T�iޏ���gN�sՇ�ź#�e��@zh��cڥ�TU��m��}�|��UN
ln{r���᪉�`ty��Sk^b�&}���)]k�|}�.V�t����̣��B��,�۹qM�Q��\��[�<^� VP�X|���-���==ʯG]I�zz�dF_��P�򱩫pN?c�t��D����z�կ3_̊T�A CH#�lO%��9Ofׁ�GY���X<����&��Ҷ9�M��J�5�䗩`�\��PS�-�^���
5��ʛ.����<��_�UC���/��O-n��g�s���|ɱp�H��a6�Kv�+�U&&[�C��Lx���|���6	nd������f;i`4�|X��\ͻ,���J��Q���i��?YBDӐྪ]���ԬrZ[�� sؕF��K���[��
�ތ3��a�*\��Π��P���=���c���w#���#���9W����Տ*n��1�?& `fWy�h�S`9���>�w���	�Hx޶����xG����t<c���7�F���HV�R�t�����'�A��5cΆwvŎ.(���WhkJ� `�sɶ��.����#��Bf��6�ƭ�=����s���5����v�z�+Mك�����7�2chʧʈ
�}G/�D1� g���d��uGt�.Eﻣ������d *eE;�ze�ͫ��!�f��8���Y��=�&Z�!�����×��<b��U���̰u���f��2|ݕ>g��]xϧ��ǎ�0'�8)#{!뷸"㮨�d1ty���J$�� M1���<�S_�Nfہ����֞qds����P�?u�&Z���<G��*����=m4��d-�X7x��6�JG����Q>?k�P��h�ͮe&���y;��T8 Bj�(��"hS��1e���0��A�j|�S̨�NX�׾�<ջ����Z�����G��Q%�+�콎in��x��D'34�� �x,Mě�ހ���J&�����.]K�3[�%S<x},��l�+2���x@\װ&ಾ�+��#�3�%t­\�Վm`x��!?�M5˚� ���gi��X>p���m���b��˻����p���h$� ����9[F�Z,�s�؁>�6!Н�![�GF�lj^24[�
���33!��Y
b}K �û���ǁ�hm3"{7��\����º���1׆�X��8�1\5����~���^� ~ً>���+�y�N���6'�O6/�fI�m�罋'��e�A�g����5��i 9=3��[k>��*X��e�]�s�N��#���㾢��ڌ���n?��+sMu0���Ý���L �0~Ո�^�Σc*����5]<�#7I�S7|��B��Hⶹ
���)�۹M�AxE�P ����y������P��e=�� �Q��C�R$�?GN�ү�o�����|�T�A�jj���P6��14��]�K^��M
-��A	�<!R~VT���k��H�/�����պP/}Pu���B�V0|A�'���|�ϽX����h�~��f |"��o�͠BӖ�+�Gc�v��(���e'���R���Y��A�,1?+S%���| ��tֱ@�
T����0�W<r���᪗;ܛ����k�,��X3������/��1��MT%ZEC��;a�����׻6���!Z	���`��R������~oO��X�FS���l��j�� �Y�È�(��y切��L
w��ƫ��ˣ�Bs�Gt긣q\t8����0�EӰ��u��� ?����=L<�rd42}sF�g���hⴙ	�Q{A���9~��5S���q���u�R(c
��&cLj%��9i��t]����������N����]�u@�a�T�j�C��7�%ܝQ�����jn�rײ$G��8��Y~�!$TϷ�[����i6(��C���U��L���xEǶ�9ɵ2���l,%�k�䝪Ux�����y��OV�sw}xU6��s}[ck��K���.��
5 ����pٓ]�Mr͜J圣�/����Q��B��FŮ�h0��w6�ExZ[�\���Cj�Q�E;���$���^��������
-Ym� l.Y�9��/�'�UL�J��O��c~����}g=��+��Z����C�e�6�f�}���w����x��_`AEV���o�SPP��^n�/��Dh8��#�����t�Gwc�
Q��PCjf��+��q4�@V�,����e����f�>d��	�v���Iu��"W�]҆"���_��^�{�ɋi֣�!v��>0׏f���ORKs�}mQ�x���]�m��uNl%K�������@�[hG&U�~�ԮI+��#�
�h��_��J
�oX�޾*�����NFѯ@3���쵦L�J��X��+��a��#��n�=F�h�:~���~���d1pY��rk9/�!�����)�T���
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
       (`��  `#)m��b�0)K(�!q52d 9 L.AD`i"tu`u@`pnU�ph ! �L)m
&  80t Pa(�  ( '!lAldE0Lkb%,	  * 	( "     `(*��2��Q`�iYj - "D(#@`�0D)S-6Inj
�*   $(     0 $ 
�B$ "0�$ `  , a" !" `'p   $d!   B  (  !0Id BVw �"7\f-a.D a.$ 0"2&  0    `(� @�aF rc�T%m`�� (? 9 Rx�n %g�eG#�bN`��V@tYData-f
!   f ` p 4! (a"  0 A.e H#o&f8RC�TEe +  CclTe%@)8- 0 hEl >
  �     �00     "h 2   �x` \ `          (  �`  �@ebRu��`2hfe4)Chiq}),Jegq 9 iG'^!4�02()T%ox)��qfE$  0� # $ 8 !�  `$S��+�Nm���4, ��ȱ#���!	��r����I���D��9�>��ͤmiy��5�vtK.H�v�a��0�@���`�n΃��*�^����n���,�PZ���o�ڭ1.�~�^�s���&�T��%68�/��]\�(?�p���B�J��fN%k,��e��D�Jedo6a�x	���2D&�W�J9�	Zɢ�4��B
!����Ҿ����i
� ��u!��Y�	\�z�t�#��:X��Z
m��������z��dw6u	hx�B0͉l��`�j�]Z��U��^fXUk����y���]�?JF̍ 7�Ҩ=�J���Uϓ)?�h�fh���ݿr�4FY�-I\&�d��o��6�8��SM8
��7�����%����~LJ���dn���8eO�����d�ܺ�X��5Zέ)|Ū# 4�v&`C�H��W��]N\p�2��#��.4��ʱ梉�=���K�Us� ��%����/�z��W����S��K�e$�ׁU�^o�o�vog�
t"j���t�
��\<Ի�-��Xg[(c*�㮾iļ���n����x����1�h�J���|��^"/�����]����C�e�RW<Ns%m��@��ͺ \ir�WO(�A*���9	L��S��.W��������˒^��
���__D��)��50v�d{���}�������=�@��b`�,%7�� T��@�6�[�*�C�P��h���g���2�l�p�R"C�h;�FPD��@�z��49����׹̨QLR ���<Y��+�ƫX����C�e��^P�K����j���5��d+FTw�S{�K䁌��Y���i4 ��� ����5��3�]5�W<��0�Y�e
T����NP���Z8���/�^K^���f�5��C�� �~�&��	��9�w)����"<�ڮ�خ�I���K��������\�whd��H�vj���d0b��*�������Eҹe�����[�50��[W� f,� ����P�	]���'��e�w���������J�Us��ܦR���4"Z>�+�s�ɉL��l��!SV�i��5S�CA}�`��]�l���niy@ �Q�@����e[d�7a�c��
ɝ��x��.�ѓ��^)}�n�e+�ͣջn;C|�@H*SR���tᯁ��1vyڔ7K[={�XWϣ�X���S~�R5������Ӂ�OY�,ɓ�QOeP%�lýv8Z)� ���(՝�$I¬��1l_���j�zx��`�� ���	�q�P��i���e�[����s�@@bAV/�W>	��V#Q���4��H�nꓼ��T����}�]̄[�^�Ɔ��a�E��X�
�ͼ�jn�Qu� `W�W���?)�ᙋ٤6��Pi$�N�����{�����Ar!����Fq���]@��r�ۖ�9���m�&S�ߒ�50��/f�I5mH[m+�}�����	r���}������öT�։�5�J�KS�h��1����>^�[�ɋ�ܣ!t4�6X���%�\ar�X[�7ʛ�0�l �5Gc6�X�������Je[�'EY�Z��Ί��{�Z��29���Y��X{�Qד��y�����w��b&�Ι�t�H�F���	���nn�ڋ{i�����g�aF=�@8cu�5�Y؏��\!T}��Skp2	JO�ȩ)��[^\�[������˂�JÑzUȚ�.]Uu%̙����rClG� V��T�������.,��&$$2X7x-�ý͐B�ֱJ�0|� �J�7+��'e��َ]��x�X U*3�x-L
%߾Mǯ��4,ׂ5kH�����Q���o��Z�΄5����c�-��Q�����JjׯPE�=�Esb��T��D*�ז>�G��C4����B˞%K�[�]�~M����b���nlK��.�����@��5ĊW���(��w�!5m΀o�MU;m�h�A=���d���mUϾ��\���*���
�!v�M�著N�.�?�^�s������!t��`{}%n�y}��^&_�
A-�	��]꯹�mu:]�����U`cW`ebT�>]��s��H��e���1ݲ�Y��f[pۻ��y�����8M��Vw�ؐ�;�|[G��JlN��w���f-�,Ȗ��c�y#|�pvfR��Vc�m�fwQ9��!b|��vB���	�ޑS[gvW���˺��ã�Fs�m�ϼiUz@���0�H�����\���"Z|ѱ��<��`'�ph��Z}��@�6��qM}K��,��e8�����g؞ZwCJr9x�"L|'�9oEݼ���֗Z;Չ��!���x��������ic�5��2��m��
�Tl������->6<T�x�֝A��U��g�M��52����mZLU�[��}}����>i�� u����!�I��u�܅�^T7�gɴS�����qE��`Hx~r���U᫅�e1�ѹa9�
\�艙�!{_�^G����򊍐���ze���m1%罅�V�eiH�KF���|���>����?bD��d%�X7Y-�]��@���	�q?Z�3��a�A�3f���`��Q�aLT�1x��|H�>9NE���җA�:��ȁ�+��ټ.�D��[�'�O��l�{V��!:�O�I��oT�`��ཆ$bj��z_s�4bp�$�i�3����8����S:�5��{K���=^m梞<ݑ"���z jյm����l�E���Դ+��n��bHU��Cf�q4g+:�!��*A��I��8���+�J����ː6����=���K�UwGͻ��΢N�$�=M$���q�!�}5��!O�M���7�!�%t�h���]�l�Eu�S���������jE�`Bb9j`u��ϫ�#����9���Y��>] �8����\���\�>Jg�� w���x�L�k��q|��v �dm�}�vU�w�sɘ�^MA{{�p��ᯁȤ|Y��_B<�F:^��n�U��Nw�ץ��b�C��$�ջyIQPm���&�/�$�	Q���|��/����SL;���la�P@*Šp]�����}�6@zi�P��x���e���3�ު��;$�	!P�(.Mr��t.A���Pl���*aڃ�ǘdp�ּ�<u��9�^�REè�G���7�N���ٱ�G�x��@�^6W�l
9�``	��.��s���i4(��'�������zI��b�l{q���H�c���G	j�o��������}F��4���gt��{o�D�z%^�bϹ,��(�)rҶ�}�2#��v�Gɳ5����>����U$������n�^�nG�#���z��Q�q �bLq���;�e{�9�}���M�l��&�^
@�����ֱ�@,�T*\�G6��$ϫ���hh��9���{��
zy:oF��c�iD����kN�� 7�����H��d��^/��di�Ţ��iF��Pk�4~�\���pMiY��yK8O�*Y��)�ACsMvw�t�K�7f׳�k��.�ѻqlU%����0|h$��×����Oe�ސ�
����ɷ�rjT[dg6%�z��4��@��L�+��[M��Q��:S*`B����y�����>jGѽH��q��H�.��|�]:���"I�]����4�}.�F_N:a���I���fvy��sk0�!2}�ȹ9��C��W��>܍�����J�� ���? ovR�����f���,���r�̧c=� ��
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
��0�H0%7`  �@Dh" �A�d2`V e�,,�j1 1��D�4A�$�+%�+�@�@Q�� MD� ¬+� �
QP(0m"Haf
�j�V)`*0I�b hI �@ 8� �"P��rcp�"($`��&HB�L G4 �"lg�a���a�  �
xа8� e��0b&��T0 �Ε4H- 	@0V �� 8-�� �2��Q
�!A
����4�Hb)�P��aN� t  lI�� P516�  R� ,(!@P�G�Y!�N4("H���%|D�G�#<�! X$
#A`h|��x$psr��:8� 
3L�`�b�F��FK\t�Aa  � � �@0"`� �
�� `�h �1CE5��`�R�EIf�� �dJ�A�0b!%*")�R2"� Gz!N�H8� V�M$Ɣ}�)�u2*��H�H�A) D^�-��! 9� 0�gȀ�`{��t% 8S��i��'#iC�
@0�!3^(�d0�(%���B��`i����@!VB�Z�0 �%�&�QT�v(f6�!qE,l� PA �(k��p�@��
/PA��0H�(� �q !  �0�< p!$@8	� )��	��:R�X
Dx��}f2`x"'"8�`*T ���=��9a��-��:o��8e�jWKk��я�d�ゐ���L5U�Ŭ����J܁��-��� �� aȮt�X�Ţ�m'�)�C�z��l�
lㄍ�㏑A=P
M;��U����Ɯܬ,�ܭ��(�X�����;e�wzd"k�{j��[Zl����֘��)�NK=QL��ހ�Q����}�̴�'�q�?��Xo*i"��e]��iVj��lK�Q�M���5A;L�(�Ȓۋڈށ�޾��\���0�~f���:e��E*����V��(��X3D��U�K9\M�mȐց�΁]�,�<�h��(�ȯ%����3��:p�rGjc]�
�~E��}O㆙�g��I��I����	R����ɝ��
�.�?�Bدk���?e#�;}�i�fj�k�|X
Ť��,�Ȼ8𜱾=��0c�{Sk��.��)L�Ya��ᄙ��;�Q9�Lލ�^��^,���$��(�ا(���9e&o1a#+I땇b�Ln
n]��s�D�@9
ܾ0\جd�8�нh���:u��z-�8��kg�zP��FY�Έ�r��9p+��z1����.a7�+�����6�G
�ώ!�a</em��r�����������9v
-��Vv�v���P����b��;b
����m��lm.֩�b�П����sN��`nc ᕐ (��/W&���:�"5Y05��1ϫ���gm��k�v�Ó6�ǟ��뗝P���+b���b�*��,��?�,���"�05��
����bmO�d���
 �l-�.`�r����������+򅈻c��3����+G>�?�.i27�_���Ên�K���u�Ưhd*�7�����/dm�uert��煑��R�����;b �3&������?�n�wW���64P�uY� ��
Πb�io�D}��D�r�E�������7⍉:5����a��;�7���=nN:7�hs�؉���!�lm��-�珛46��R�[��➟?b���dM(������=�?�~W,i2�h5Y׎�ψ
��nm�,���	��v��Rb���󜈻b�Ȼrln�� 7�1�ѯ过&��r5�"/�ϊ�׊���e�nd�r�z�Ő�p��!�&�|�[�i��j_���_���1��E������ݐ��>�>ɳ�ݱA�ȃ�*�;�1#𻑹�)ד��|O<��_d�|7��D}������ xP.j>ݡ�ٻ�"A�
,H�ǓA������M-ԙܬ��*a��*����-����w�w5��{�������=�&\���UdLjL��ő@��ȅ��]�\�������Ո~��e��e>|
H�
N\?�P\�gZi�&�S�P͆�QJOj�G{�HD8�֖=�Aþ��:	�<:����:��L�ӓZLY��P���XmOrg�
w���4�]�#QMN(eDs�Tk���6���4�=:�2�ؓ鰒�F��DS���\�Q
?�P��Onx��7\EΨYMΠ`Y�y����O��$��|i�L���M�ȩ�3ڎ�ԜRH�
\\-�T^7��Oc~�H6�EJ�]ޢ�Ij`�Gx��<��K0^=:�����	�����#�KL��
N_���X>f@�^R��@d[M[��
Z����_��PD?�A1Zfi@vPM�(��N�`C�{h���Oٕ6�QW%�<:��8̴���>����Ă@�/�PD��P�^Jfi�
&MM�hHŖ���E~��@n��[t���t�<:�5	��Qk���!N̅

\H;sS�/rQ�J��N���B_�\Υ�QMy�C��Ǒ�_PV0�,:�8:��y�җ����\:fP]=bX�B���wQ�LL��AU{�CE{����σ���$"�<80
���kD��D�VDQ7*\^?��Z���~]M��[]N�`�G{�CG?��U6���=���
J���R�X��Z^M�r�b"���*�vª�A�*C�/��"�� I��*�I�#A���1�D���V���׊��Z+�+�h��Z���Vʌ	�����(;*R�*���*�@�#A��# �FC�?VAG��^W���z-��z��q���Z���jZZ��Z��a�$��j��@6��;�+I7#23�C 1�XW��]��Tyn({+�����K���ZC[D�U	�K�$N��N��"����A�!�[�+T{LA5�C_�L�^z+�{#����(�N��t��^��*�b�U��*�f�0JA[�"A�S���E@#�HU\R�^8/��z;�ȧ<�Z��VZ����؋��C�b2Cn�(вB/�P�
��20DA 3Eˈ��� ����y+�&X�8Z�؈w��
[M/��T-o��3*��;��t�֐��\�(Ҡ[���Ɋ0�`��i㔊œ����6ןP��J_��Z[!+`}!/�ﹽ�ր��V�'�۳���;�����X�����"���P��b������3�Ǒ#��WW��XۦWT)7;�8� ���BԄ�ز�8��	 Y��ے��=����Q3M�"]����ZL)�XK�+��;��������J�pI�<�VyG�Y�8�ɖ8nd��l�B��Qǰsך�A_�A[h�X]n6��<k�+:.����ٓ��\S<V Y����S�f���~�W�ėaӕ1G�ߛ���^ �R[+#j�=���)���B��BH;V����M��`YRy���n���ő;���6�_
��[���ӡ.b��*�����E���ӛ(��8R�Q���y�����x���̙r���%ۘPϞD��_��X[))b�3+�ﹼ�ֈ��V��8�قx�pS*"иnl����oUϐ����O�ۛ	�Z[�ݘ�)�z�8+��8�ט�B� ٛ1���홊��H׾��Rl`�R͙;ǳq_�	�����Y	�X_(/�繐_�MP])�^m���9��g9��V& �t�i� Q���[¨nbӚ;d-���2�3O��W�M�T9�X_(�o9#��)�ǀ��Ԑ�8�ٓ8�!Y���Z��Fn�Rđ;���]�TX�/�\�5��3;c�9�R���U��ٓ8^i*F�ؓ��M��rb�SnbA��0�����HI�_��\[����ynan1��֜��ְݒ8BI(��Y���Y�8�j���]��s��#���׋�UDU��^O);r�1��舘���@��8N�#*ߡI�9���r��v���
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
           �  (n1i`:[ 14�B 5u��4Nb�14 �.b1�
h� �!k& 1��@�f`@�ΡBE d@�F&4G!A�HX�DRo� 0w|�2`�0Y0K`�&" (  0B"� R  A� k.� 4Q bU� �  h �((@ b~$PvV>����c�D�iD*BL� h02D=��
4Ho��py�3��C��R�0DGMdrhDiB$��� �Ê �` Bh`0 aC����
!	t�G@|lԢ���kT��E(`% �0� V:v
P�h� �(�dr�xb`0pD�@�d@� �$�
Ls*)b`L:
 �@8��F�f0"�(@�^ �R"i��xNFLb<�\�$9@x8Q@S�T(� � 0� 8� ." ecur��L)@t F�v (`f��@�!D �@��R!x!�Pl@
&\ @�ĂVC�h"`$  j ���QȣX8 3�)��*p� BX-8
`4 �,� �(& �$@��. D3�?08@�$=@$s� aX� Oa6��4$X0 �qof�& .�	@H�<)="@�	PDXX�4@9 9$-$eE�f�&I&�x.C	,r:x&j�4K
�	:K��0�A4 & s�P( 	c$�ua L�!� $BK� ��@ `�#�"0  i�iH� Y4
��/���f���f����E�&�EX���\��b_7�5EFU�a@T��~6LGl$��?�a�)����L��nO��F^�	�z���
a^�M�}+X=<6�� �Ð8����
]���y����'�h/�������S�ry��]�aNUP
6Y�J˒J��J�,��|�ͼ"�������+����r��*��B��\�Iml�
#zoG	P��Oζ�� �NK���ew�ޯm4��d�q��I#�n�me�5}Ga�Ip�q��ae%����V�'����eD�4oJNW6��6�
��V��K1�#�g	�m)��`���Qs�cu%su%�'�R���Z�g�o�oYH�zH��ʰ�D���
��O�(�K��e̬y��m9�q�5�'cU�Ҳ���'�K�6k���H��Y�����ں�
�1����g�Id|��MS��qͫ� F3uq�3�R���J�h��m P�6�J׆��Ә���ÄFKd�5�u�ie̼�
@�qu qt%$'&[��S��X���K��\��֚�N2ٕ��E���K!��̨�e�,m1�	s�/%
u��'>R 7&V��kB�;g(�׋8DW��� ���$�C!���H�ƹY�R6�FK8�C���̨%aĢ`����q�su�sf�r��P- �����oJ��H�����ݔ�I��*K!�g̨�6̬����EIs�s�e��1��5&Ҳ�.�3h����@��X�^ڲ��"�K#�J)�dά�e�,�`q�s����w�� %oTc'eo;�w����z�#�|��8�ꙹ��
R�X�P�Ӳ��{���|�uUT���X� �Z���������o+�3o
`���Ρ�w�1���d(|���� P���Pt|��w]��|���%Y��!���l{���������`S�|���E���䘨�d�R�X�V�S���v���2����u	�g^�AwZ�ڋ�{ڏ��Ϋ�!o�,V<~���M����l����B�ЄR���M>��H"L��L���t^��c��X���ڙ�y���n�`�xݽ�x飙�荸�i��9� ֱ��{D���Բ��Tu݉:!��@c޳����ښ��n+hs%��S�hʛ��Z��%��~m�vs���!�Pϥ(������w�ш¡մ9����DuN1-*T�����-9oZ���F���`Sg��i�t��t��ɲ�������°Y�P�Į��6���9��\>QI��O9��N�[����L�o��s���r|O�S|إ��L�ɸ�|�X�B�ֳо�Ŷ��Dt\t
��3T�X��>��!�{d�T�$�l��^�8,ƫҋ�zʋ��k��q�yp2�����m����䑸�l R���R��s�2��Ǿ�w��\U	x��)��P��4X����5��fL��^�N��Ɏh:k�`!}��s��ϩ��ϱ9��쓽��  0ЀS5�"��>>��3���\��(wމ�gޫ҉�Y���7-�0�=��`��b�m�CB���oƵN�J��Z'�R��d�/A6����Ub_[��Y�L�Jŧ��p�%Cxa���5�J��AN��N�M�^%���P���{ɴ�9���_�*L�Hə�Jɧ����Qp�1&`�t����F��m��^�N玛�`�Z�ƅ�/�f?���I���]����LK��=�q�<�b�5�b�5�?Kp�v�ް��Τ�C�f����?Q��A��=I�Y��BI���I�=�b����b4m>j�7&J�dH�`m��b�α
�)�έ�y֡Rқ�Mҁ�r���U���I��]I�_B����Y�,�q&��n&�6b�-��ʂ�^��e�έ�����S�g�s/ɷۿ�*lY�I��J����է��`#
��II�ȝ��Bɤ-A`��Q��67&r��fIJ_�\����eN�H��B�f�Ѕ���;�6q=ɶ�l�I]���M�J�'{S�&}���8���7�Ҏ�h��N�^mέ���P�j��7���}ý���YM����Hʵ'Q|�)Qp�"%�c*��*[�p�B��iǥ�eF�ˇ�R�"�?�6s:�2`	�I��J�\�VI�-�X�-ٱj�5����J�#�J�z�Ǥ��%�R�v�R���e�r��v�I`G��A��@ɡu�6�/���34"`����ۦ�΁�=��9{̬�t��Tt�zߥ�7ߵʰ�~�G��H��0M�� ��Ɔ���p(	�phƉ��n	���)�We�j�$~ߥ˷ߥ���n�K�n�C��$��0Ρ�O+�HSxx���|F����9���+{�(vqzWd5l]�Ϸ_�N��|�K/J�I��(�� ���IpyY�������;{��+�ۨ*|�zt�{ߡϷߥߌ�n�O�l��pʹ�8�+�h��JBsjI `��Ή��;�̨;{��Ut��U�8�d�[�̳�n�[�nS�8�~�0}i�S����������rq�N�ėƉ=��:���t�x�sݭ�5ߥǶ��A�<�6D��8y��i��C
�yxY�`?��΋��E�`��8]��xUv�j[7I:�$O�/n�K�f�۶�8���L�����Q����Y�q���Ή����;���|-�d��ͧO��$Ƕ,,&g����S������Ҏ]x>��{�����&�M�p|M��x�N��ɉ s��;��d��xE�ϵ˾�5W��oJ��K6� ��Q0�a�ㄌ�X�qx�`x�&ω�����9x�z�t�J���7����/�K>n�C� ��� ���!��y9��Rh�Έ�^�����}���d�Jt�zߡϷߥh�nGol�[<ո�(�ɗ�
���px;�zx�F� ���ɮ�Ĩ���8f�.4�|��ݷO�Ϸ���K�nK���M��4�閆�F7�zxYSPm�WNɋ��H;���y�Ǹv%jt��K�O���߷/f�Y�n�C�2��7����aY�X��6|�Tʅ�΋{{�������u�>]<��G���X�ϥ�f�ˬh�����"|�PCh��U��_�z��I�N9[�*?���1|���z]��e��O�n�I�d�[��4����p醀Y�`x�pxc
 AˮW�ݮ}Ct/m��vu�ֺh%N�3�?�3�ץ+<��.x/�7w9�3�;Z��SXHhA�S�V�K�����CN�B��PL.]��.�uw�9�d�:y�ƬT?ֽ3���q�1������F�ڊ�Y��]&s�&���L�[ �ϮO_�����]�q�<j+�:��֗+�=3r�	�T���V�O���[T�%�򕮳�J���Nq@E�] K*�o��}uk�x��8x�֟1�9?�,�5���Y����:KV�$������`LLJ��τ^ ��yFa�]�t��l��*t�R�vF;�5�1�� ���V�[�F�K�a,��/)�J0P_�"TϮߛߨ_�u�=�w8iV;x/����;�3�<
�l���PF���V����$��&�LZ`L`@E��A�Ǯ_i-�}��+�l׭�oV���9���pZ�hQ��XF)I�F���k'��,��C B�J L�.]�Ǯ[<�u�u��x�Ǹ���9�9�:v9��I���p]�D�Q�����&�H @�^�B�߮_��e�ˡ�(AϦ��?_}���}�tn�z�\2�҇!���1�9�i�>
gmy��:x���/֕��9�3�9��x����PF�[��,�ᝡ;�� ��H�HǾW	Ϯ_�u�}
g�;h��������9�1�;����ƱK�B-[V�F�x�n1� B�J Hɬ_�Ǯ]��}�ae%:x�֘Y���y�8�c��
�P�hf�Z���Y��&��&�LXy��
#��&_�M�HxW�|�u�;y��9t�֕sn8�309������[�����ɖ��
aH�Z����O�[-}��Fuf
i��;x��O3ƻ�1o������z�B���c9��]$� �^�P�èK�,��u�y�u��%N:���T��)3�5�z �h����VZ��
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
�!  0 p�Hd@H2hd rmL� �\%,� + 3(,; q Tbg
`Hh�FkCbd@etOlo!d0- uru`
    � �)Hf FpA@ 2TE,plh4�e b`* @
2:-
 (  $ ,B"pdD
� ` b  I$ �s)H rT�B, `�!m@`�`4k =�%U�a(�i�bfdldDo{4rhqe2@< DR7}�
"( (� 0xHg Cc�D(bTeap  �TeaQ�-(q�  1DzE� HauFo]fdJuF-ariJ'@< UrP%  �  �a �d eraj0td/p, mPae0@-p1!  T Dpj"X	t�und`t4Daura� 	 r}v)$ `    (Ab FrKLbTe}p� cy%ip`, !(  Th H�tBeE~da�@�Er= rqd-
   (  0 CO]oQEHR}	(d  ((d` eFdHId�*SG29
`  `   hs = p
=���v�l
���#UN������|�ዝA��$&��%f���+&%�C�$TMb0�"��5D�rf	�n�*�9צL �j��v}���%���j��/-���U
y�2t!d�(7d��xh����H��	Z|a��x���$ܻ�R��?�bI.q+�b.U��h,���
r���,"!����NE9g�%W��?����_���q=n<��%t�qv2��F]M�D�:�-�y.C�P��hҔ�%7���ן��U�W		*����(j��=OE��?<���d]�~d�Ydy��8���=���^�:����C�C��Q;�ջ���%Jn�r��\s`cv�y�>
�q �W���w���m49���תɳq�}E�~^���jB���#X�"#����g�����w��q��p[NW��7R�p-M`K�R��;S��8�sr�۷�U�=a�������]��ƣ:#�%���ێ]J�r�
�D)8H�1������n]є��Y\��Y!�*r<�������G�:mu�`�dx���#���S����Z
Ohx�"�A����g���ޟA��\�鰵^T����%�o�Mf�V�r����s�!��Qr����.K˛��$�sF���&� �׫������&<h���1��u��em���vJr���l "�"�ж�����/��qC��w���p��wQ�t�r*��G���pw_�:�m�#��N4�O�6ߤ���ɘ�
���=�h�U{��ZT�S�ɩ���#�!d��!68�||�,8p+�C`Y�x�����l��\�ieA��Ǡ͟�2"o[d'nA�:]�	���#�Jy�X3���P��Nz�q���������=fN��:��l9�@���|d�
"�Q8Ĳ���`�@h�{r尠��d�<��G8l�+f|Ȑ+�	�3svW���뻢�ã�B�	4���"4c�����t-�u3����*�ԕ�h|��v$sU!s;��K9��e��	!8JYI�42�:���a	��������v��w.E��mS ��T<ϓ�o:����	�����Lڶ";�-G����#3���3�;�W姢hvܝb���07Z���?�SB�����e��Oi5���Q숃1Bqz%��8�!CGX�~"���j �����v�b��W�2�!/f��s6Ԯ�/(��u��5:~�9E��'!����B���M�#��0�繞T����ƶI��s�M��R���:.�>�[$�s�ɉ��3�!d��!.Q���C�#mC�3!�7��Y�&��.]�k+��������&�77dk-(XP`���ga�j��r���!��w[	/a³����խ��#��]�����,�&���`��7nS��f99j9��'0e�LHkN%��}ᎉ�$&!��!�.�#��h�C춐=sW�.ץdR���ófӿ..�K:m1I��A�"�0
�T���|睰Bs���E��l%�87z��BsmI!�>� �WIRgX�!��/���$���C��� !+"��,*d��K&$��!���*�����mK����m���c�+�k����&�`�;��i�
�Y�.:��%��L$a�%�ճϷC P����1����|mJ��g���
��|�q�ua5��÷�.s|z�U2���yל�F;����=L|��d�Z;V:�vBW��&��)��S�Q��`���a ���M��4�,SHs��Jdg����U���4��@�]��Ĩ؊p����\�@���K�eŃ��#�,��f�3�y���QlE�Ք��oP2e?�� �11\$���<���*v�o��
��h��56�)�E�G>E����,b���x�G��O����q���h-��]N��\���Z�bbٓu��Um_� b��O$ޯ|�{~���@�2��5����s����=\��c�uQ�E��1���.��zE�6���q�D>D�X��&��o��*�q�SAx�x���R�[�y}k,5w�����͗D�le{�e)=�<���4͈,��c�J��89���y�xsQ\1q����}���]~>ieW� T��@�T�H�g��T��~/�~�f�T?��T�E�$!�!w*%��p��+��p}t���{glm}t$}���U�Q�V�'�"���kk� ��d��ݔ,�g�����Ct&�\���m���Iv�Խ�d|\�dQ��x���5��'=�m�4M
]�P�����e#��o3���� lA2m�"�?m��ED����ƗA�(T�̩��p ��Q�kň�D+J���jc�u��Q1��\�ynnlG}�b��>$hSfUy���Y
LA39����+V!�JB>(ꏳ�{��2�Y�`��X���Y�h��unLm^��������JE�dg>e*�;Վך
�WL��׋�Ҿ���
�W��(i�8������RL˓��z����R ��T9����a���F��<얤6n�� ����'BQ�T�@�R������?�	��c\C�K
4���	�_�[�s�g�]���Hã�N��

��?6yŷ��� �+S�m���������>T��D%�Xx��l]�l���ʵE7c�dŤx��@('��w���>"�=ch�;x�bLj%�=	
���V��A�
^��̠XN��Ү4���"�4�Z����S�Խ3��뽭%fx��1{$wǸ�3 �s@�����$��ad(5��f�����5��J����棱4�K���l	�ᒂ�����Ű��r��a0ΛW8��J�U��u�pt(�@7��!��Q��X�����c�Or��h�Ņ�=���+�!{��𳆎�/�>�v\�A�֩*��#�!|��!6����[�u2m6!�)�犞���B��PN
�H�������㣒Bӽ.�՟�wP%�3��"��VH��3���}��*B����saK�'f!�hWx��JZŉ���k��\V
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
l@Il�� 4� c(�  ru #P-r��1%e  �d� '$C��1 `DB ;xUn�h �	 �	
��%%}J��B��P�i$@��B�
 $ ��  B]�r�b�l�h��6JՁ!`H�n	L��/$L�
!-�C  $ ��ma��bX #�aaH`� '�QBa<EB�x8#LC� bL�%!�D�I �&g��Q�3DA�� �@0"T  mqp�@���.`�@tCLp�FJ5�ah �`��p��	p 1�P"3�h��p <�J1 t�"j!��daP cQ�`L1P1 V	$�H2Q����D� �4b`�f#�AF������C4y�7�>"	 ��f(&	�AHb�9B�lx=hJcIB$؀ �""�5H"& R��#%J(� �� D.�(8S�l�A�堔Ԡ( �@q/K"$7@�L ��(	�" @�$D1p"d+�� X�PD
�"�&�U-� �-�(0x2�j��ea��-�q��\@�8' T'afe�$|h
!�*Xbh 8   �GPR�#�$ZA<$J`��h�0�  �(bY~�	\#�l�#E+ �:  ,�Eը H� �3� ��$&0Rb%Y4AZA��3 �ָD+4�f ((2 �A��D� &�J {h.0@A��Ĩ!PI:7(�d �@@a@(` P�'�Je�8(� �!�s�ama ��
�"�hv� �l�� �0`4,0la���e ]!nf��
�C`�p�E� !`�� @$X�k�hhME�2"�Em��p,�  `4���~Q��0@r ,~ �= $�!�(%P�#%�lz�  i,1t0g���@cDIF&�'$$J/`A2s�	ch��`�c��p� ,z� � t � �r4"(AY4�Ac0�A`%!#�{��(��
`$v���0EEh4�@LrQ# @#�$�}m�'���7h�P�  ��.���hV����������qw�)'L (�^<�#!z�h3����� �m�쓟��?����ۓѴƟ>�������떭'iL*'��,*\謢}��7�t��$�<����/�?q�?���ܒ�<�S>V���B񑄍��!&k\UT�(LZ(�. ٹ.�ߢ��������>��?8T���X]�����jV���˿����X�'�`<��|"\��#eI�;h˴����~ئCnl�>���7�� �8�T��>VNZ>�k�U�����!?�\'��謢��$��{��m��%M}�%���������k�T���T���ZӮ��uM������X'�L!7M�,�\�,+qn2�y�0� �?�$Gۯ����2�X��nb�ӾSN���6���D(%�<���jh���<2}��i�0���o���@�P?�n�?�Ђ?����wr�SW�w�̛�Ώ^T����q'��,"\�� i���ۨ����w�$�x, i߰ziϰ�Ne��?�䓿����P�M�P��>�Α?FL�.���\	'�ܡg\� \�"�å�cà���{�$�g�����}P���>W��������,��
����1��,1y�6
��lWg�0�Z����ī�"6A�"�hZ;h��ߑ"~j �g�8��U�|֞z>.���S�����d��� ��.WeߪYcU���6��&h֠h^*["���4��(|�Uh��*�/�2��і�aɔ�� �n ����u*��Q��"<�*1iP�$ܪ	��zd�n�(~��i��
?���x=�\�f%Y�u�� q��l���(I�
>���(���=~_�*������Ӕ��6ӽ.��n~.
��٪	�&��&��*fW�(v_��~�4�ۑ���&Zu &�1��.U!E>M���0ts�"2h�8�*��&�����E<���(~�����*��ݖܼ���!f�(���nM�E��aU�?�2���&hڪ`ۺ&�nW��*� vS!��>=���=<I��ٖڡ���0�f�.їZ}ޖ��2W�树,j.]�U��ť��>���6es�hު�&y������)}�(n*����.�����@��� ��>]�/��``Notk�o	����,�	lc�q�(���+���A8Ӎ�O3�=6tPs�yTY�|�����$ 4oMf<���
}	
�P@�:�T�����k�[�}�U�i����|$`7n���+ $G1���c�|�y	<8̨���(�T��Uv�t�l���(�Fz�DN P�����[7����y�љy��!r��8-$(ж4S�?M,��u��8�Z��EH�;��.P��:�V�3�lT��PC	yRA����*�w]�2&j�j3jɮ݀)���	|���8V�"�E#8�X�*�T�2��>�@U�yQ�����:w{`c6g�jt)�~=�-��=�����X{��(E<�ԛ.�d�Ҷ�lR6�
vP��T��6|���D���-�}��$8��(0����K�{	a
8�@8P�fTn��>~tQ�8P�9��(4��h 5oP�v��~=	� ��|��|�(1T�*�L�>�T:�Tl6�� 2�Rщ;A�I7�s0���x��~4i�<����������z~M^���Z'V��@x ��� ����W�2��x��qq�e��q�+�2w&9<6b�� "�xa 8�	�j��ާV�V��&���h�R�`C�~���r��y/l��!�gҫ
�9��=�@�5`��b՗��	0�S7��U>/��"��{N �V�å~�çn��"�1�o�������Rk�U��-��b��.�������꼂Ԣ��j�6���.,�%6,�oy�|���]΄ܕ8K%���%�����;�י�w��U�-NS�3�Ϫ}���;=�%>o�g�1�j����֑�{׫51G�0b���
n�1�
��9Wi�=��4f�S�"�۳���g��}L�z,�U�������_�%>/C�>)�?ܽ�,?��Pă�;F�=8^C�r��w����=��������A�*��^��
�v+JU�)�E���v^��a�|����5l�䜑�n�1�Ė�����5�F�5b������g��!L�7BU��{Ͳ{�í�,ǥ:�Hn1�n���� ����9VBoat(s) - 1
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
            MsgBox ("Your 'Submarine' was Destroy�cN	"d$	p1 4�d	�
�P�6�1H�\0@ibf�"qfEt(20�Qan5 `\�L&e%� 0.�&d Ut' ��J 
��$X �U��@ X K(*)J�s6��%'iH  !H$0f`'a���\O!(@gD[�3{h$'v3ba�!V�U9@u43�� 04b�q*p!	SFDAd28�
 �0�`�!Hi�AlE+ !   @$8@�i���
�'�$(Qi&V<� �p 0s&0E0��)�d%�6  �$<NfU�ZK �3U&-B�@a "I�	`�D1dQ��AdJ�~"eH b!���IX�	!`
!�6���:nH� d4�j��( eB ��%��f�(6� �a�;���"�� J�|�6d� �� ��:�.L�"! 
Ap5$�
I"�HH�%F4�B b�ة�� ��`.d,C".�Z�a�N0% 	2hB�����c{,�p$0k�J�b+P�"D1a)` 
M��c}��4�=1�Q�������9���W6���P���P�r( Cy8�bI*)��9jE2�� ��@�Km��mm�l4�՝4�T��������%�����^�#�{��骡ch�b;,	;*���4"gT��{-�3{���h�D<��V����	�������5t������>�x������ݷ����a��1i��w��9��ö�!}>J+�l++km����V-v����������������\���ڞrq,��h(�b9.��,�"��?Ԇ#�M(z-�<t/4�T�1�������E�T��ܞ��ɜ����i���=:�;(� ���&}�.{���jm�=4�T-1�;���@%������M����^�����i,�ca*Hb;���h�"��*�}�-��֫{�?4�T,4P����������	���9���t�<�i�	#8��c=�,��0�����t�?m�+{};ut�D=4�t���ʄ�����x����vܔ��\�j�bA�	s) m����)@�>9[\yߕ���FQ���S�#�u�r�e;�l�	�jQ��_d��t�t����ΩQ�D��+L�>)W=�����K�e�Q��c�W�����o��*XlAc[�6�`ſ���έT��@:�D�>����ە��WA�:;@��_�G�S�m���ƒ��3��ں���Bn�	��Qx�P0t�e}F-G�έ@��X�:*D��)_�O7���V�Y�����3����1���_��Yh����Ad�A�T��)�@��)ؔ)[78_���^Qo�\Q�3��ֳ���	�~��fSh�Qx��8��mˍD�J��{H���)Ȕ:*_T�=��WZQ��Z9�3������R�9�Nf�h�Pn��|E��φ�A���*)JY:�[�T���mWZ��WJYדe�V���9��(�Z�yx��P��lE�f�U����)DW�@��)��:WT�T������J^���uV:��;
�Z����-��%�#�%0#��^2��X*�Cx�7c�5XJ	J�kĠ�)�kF��Ʌ��F�²���-��ڨ�N��3�%�"���*z\:�shF�s�6��YB	X�i�j�i�c���	 P�x���}��,�^{,�N%���m�+��\:z\*�gx�r�5�X�Y�J��{�y�cK�
L	�B���X�ڬ��Z.��!4!�5�!���>��L~��h�c��	P\J	7�Bh�cN|@f�
Y������B�yx�,YN{�@N-�#�-�*�rV>�bT���薷�`���_
;Q�yDSTa�v����\	�B�B
n�)	n�������<���=�P�N�����k��쨵�O�5`�h+

����띬�Wu5�wga�ck����ĉ�cT?�@��@���\��^��O8���yguG����
�z��5��������}f��fsn���T��U8�D~}�@����9�A^�'�,3��h7e�u`�;����n�r ol3��sufk��fc��֑ ���P���B|��_������(?��7`�+�`	���������uݷt!O�fc