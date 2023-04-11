VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form frmBattleship 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Battleship"
   ClientHeight    =   10095
   ClientLeft      =   10260
   ClientTop       =   2910
   ClientWidth     =   13335
   ForeColor       =   &H00FFFFFF&
   Icon            =   "frmBattleship.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmBattleship.frx":1182
   ScaleHeight     =   10095
   ScaleWidth      =   13335
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmd1 
      Caption         =   "Ready"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   9360
      Picture         =   "frmBattleship.frx":3BA66
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   6240
      Width           =   1215
   End
   Begin VB.CommandButton cmd2 
      Caption         =   "Redo All"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   9360
      Picture         =   "frmBattleship.frx":816C6
      Style           =   1  'Graphical
      TabIndex        =   51
      Top             =   5880
      Width           =   1215
   End
   Begin VB.CommandButton cmd1 
      Caption         =   "Ready"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2760
      Picture         =   "frmBattleship.frx":C7326
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   6240
      Width           =   1215
   End
   Begin VB.CommandButton cmd2 
      Caption         =   "Redo All"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2760
      Picture         =   "frmBattleship.frx":10CF86
      Style           =   1  'Graphical
      TabIndex        =   50
      Top             =   5880
      Width           =   1215
   End
   Begin VB.CommandButton cmdAutoAIplace 
      Caption         =   "Autoplace"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2760
      Picture         =   "frmBattleship.frx":152BE6
      Style           =   1  'Graphical
      TabIndex        =   52
      Top             =   5520
      Width           =   1215
   End
   Begin VB.Timer tmrExit 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   8280
      Top             =   5520
   End
   Begin VB.Timer tmr1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   120
      Top             =   8640
   End
   Begin VB.Timer tmrTarget 
      Interval        =   500
      Left            =   8040
      Top             =   120
   End
   Begin VB.Timer tmrBlinker 
      Interval        =   2000
      Left            =   4920
      Top             =   4080
   End
   Begin VB.Timer tmrMoves 
      Interval        =   50
      Left            =   8040
      Top             =   3480
   End
   Begin VB.Timer tmrDisable 
      Interval        =   1
      Left            =   120
      Top             =   3840
   End
   Begin VB.Timer tmrAutoStart 
      Enabled         =   0   'False
      Interval        =   555
      Left            =   120
      Top             =   3360
   End
   Begin VB.Timer tmrPlayerAIAttack 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   120
      Top             =   2400
   End
   Begin VB.Timer tmrPlayerAIPlacement 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   120
      Top             =   2040
   End
   Begin VB.Timer tmrAIPlacementTypeB 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   360
      Top             =   1080
   End
   Begin VB.Timer tmrAIAttackTypeB 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   360
      Top             =   1440
   End
   Begin VB.Timer tmrAIAttack 
      Interval        =   1000
      Left            =   120
      Top             =   480
   End
   Begin VB.Timer tmrAIPlacement 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   120
      Top             =   120
   End
   Begin VB.Frame fraMenu 
      BackColor       =   &H00000000&
      Caption         =   "Options"
      ForeColor       =   &H00FFFFFF&
      Height          =   3855
      Left            =   4560
      TabIndex        =   0
      Top             =   5280
      Width           =   4215
      Begin VB.Frame fraAI 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Difficulty"
         ForeColor       =   &H00000000&
         Height          =   3495
         Left            =   120
         TabIndex        =   13
         Top             =   240
         Width           =   3975
         Begin VB.CommandButton cmdMM 
            Caption         =   "Main Menu"
            Height          =   375
            Index           =   0
            Left            =   120
            TabIndex        =   43
            Top             =   3000
            Width           =   975
         End
         Begin VB.CommandButton Command1 
            Caption         =   "debugger"
            Height          =   375
            Left            =   2880
            TabIndex        =   41
            Top             =   3000
            Width           =   975
         End
         Begin VB.OptionButton optAI7 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Dynamic"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   42
            TabStop         =   0   'False
            Top             =   2520
            Width           =   1215
         End
         Begin VB.TextBox txtMoved 
            Alignment       =   2  'Center
            Height          =   285
            Left            =   1800
            Locked          =   -1  'True
            TabIndex        =   40
            TabStop         =   0   'False
            Text            =   "Moves"
            Top             =   240
            Width           =   2055
         End
         Begin VB.TextBox txtMoved2 
            BeginProperty Font 
               Name            =   "MS Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   2415
            Left            =   1800
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   39
            TabStop         =   0   'False
            Text            =   "frmBattleship.frx":198846
            Top             =   480
            Width           =   2055
         End
         Begin VB.OptionButton optAI4 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Hard"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   20
            TabStop         =   0   'False
            Top             =   1440
            Width           =   1215
         End
         Begin VB.OptionButton optAI5 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Very Hard"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   19
            TabStop         =   0   'False
            Top             =   1800
            Width           =   1215
         End
         Begin VB.OptionButton optAI6 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Difficult"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   18
            TabStop         =   0   'False
            Top             =   2160
            Width           =   1215
         End
         Begin VB.OptionButton optAI1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Very Easy"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   17
            TabStop         =   0   'False
            Top             =   360
            Width           =   1215
         End
         Begin VB.OptionButton optAI3 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Normal"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   15
            TabStop         =   0   'False
            Top             =   1080
            Width           =   1215
         End
         Begin VB.OptionButton optAI2 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            Caption         =   "Easy"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   375
            Left            =   120
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   14
            TabStop         =   0   'False
            Top             =   720
            Width           =   1215
         End
      End
   End
   Begin VB.Label Label2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Active:  Placement"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4920
      TabIndex        =   47
      Top             =   1080
      Width           =   3495
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Gamemode:  Single Shot"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4920
      TabIndex        =   46
      Top             =   1320
      Width           =   3495
   End
   Begin VB.Shape shpCoordinates 
      BorderColor     =   &H000000FF&
      Height          =   375
      Left            =   120
      Top             =   7560
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H000000FF&
      BorderWidth     =   4
      Height          =   3855
      Left            =   840
      Top             =   1080
      Width           =   3855
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpSound 
      Height          =   495
      Index           =   4
      Left            =   480
      TabIndex        =   38
      Top             =   9600
      Visible         =   0   'False
      Width           =   495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   873
      _cy             =   873
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpSound 
      Height          =   495
      Index           =   3
      Left            =   360
      TabIndex        =   37
      Top             =   9600
      Visible         =   0   'False
      Width           =   495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   873
      _cy             =   873
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpSound 
      Height          =   495
      Index           =   2
      Left            =   240
      TabIndex        =   36
      Top             =   9600
      Visible         =   0   'False
      Width           =   495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   873
      _cy             =   873
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpSound 
      Height          =   495
      Index           =   1
      Left            =   120
      TabIndex        =   35
      Top             =   9600
      Visible         =   0   'False
      Width           =   495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   873
      _cy             =   873
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpSound 
      Height          =   495
      Index           =   0
      Left            =   0
      TabIndex        =   34
      Top             =   9600
      Visible         =   0   'False
      Width           =   495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   873
      _cy             =   873
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpBGM 
      Height          =   495
      Left            =   0
      TabIndex        =   31
      TabStop         =   0   'False
      Top             =   9720
      Visible         =   0   'False
      Width           =   3495
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   6165
      _cy             =   873
   End
   Begin VB.Label lblMoves 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Moves Made: 0"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Index           =   1
      Left            =   6720
      TabIndex        =   33
      Top             =   3480
      Width           =   1695
   End
   Begin VB.Label lblMoves 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Moves Made: 0"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Index           =   0
      Left            =   4920
      TabIndex        =   32
      Top             =   3480
      Width           =   1695
   End
   Begin VB.Label lblStat5 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Patrol Boat"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   10800
      TabIndex        =   30
      Top             =   6360
      Width           =   1695
   End
   Begin VB.Label lblStat4 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Destroyer"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   10800
      TabIndex        =   29
      Top             =   6120
      Width           =   1695
   End
   Begin VB.Label lblStat3 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Submarine"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   10800
      TabIndex        =   28
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Label lblStat5 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Patrol Boat"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   840
      TabIndex        =   27
      Top             =   6360
      Width           =   1695
   End
   Begin VB.Label lblStat4 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Destroyer"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   840
      TabIndex        =   26
      Top             =   6120
      Width           =   1695
   End
   Begin VB.Label lblStat3 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Submarine"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   840
      TabIndex        =   25
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Label lblStat2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Battleship"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   10800
      TabIndex        =   24
      Top             =   5640
      Width           =   1695
   End
   Begin VB.Label lblStat2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Battleship"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   840
      TabIndex        =   23
      Top             =   5640
      Width           =   1695
   End
   Begin VB.Label lblStat1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Carrier"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   10800
      TabIndex        =   22
      Top             =   5400
      Width           =   1695
   End
   Begin VB.Label lblStat1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Carrier"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   840
      TabIndex        =   21
      Top             =   5400
      Width           =   1695
   End
   Begin VB.Label lbl0 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "BATTLESHIP"
      BeginProperty Font 
         Name            =   "Footlight MT Light"
         Size            =   27
         Charset         =   0
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   5040
      TabIndex        =   16
      Top             =   360
      Width           =   3255
   End
   Begin VB.Label lblP2Area 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "P2"
      BeginProperty Font 
         Name            =   "Footlight MT Light"
         Size            =   14.25
         Charset         =   0
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   8640
      TabIndex        =   12
      Top             =   360
      Width           =   3855
   End
   Begin VB.Label lblP1Area 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "P1"
      BeginProperty Font 
         Name            =   "Footlight MT Light"
         Size            =   14.25
         Charset         =   0
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   840
      TabIndex        =   11
      Top             =   360
      Width           =   3855
   End
   Begin VB.Label lbl4 
      Alignment       =   2  'Center
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "P2 (COM)"
      BeginProperty Font 
         Name            =   "Franklin Gothic Heavy"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   495
      Left            =   6720
      TabIndex        =   10
      Top             =   2040
      Width           =   1695
   End
   Begin VB.Label lblP2Losses 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Losses: 0"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   6720
      TabIndex        =   9
      Top             =   3240
      Width           =   1695
   End
   Begin VB.Label lblP1Losses 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Losses: 0"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   4920
      TabIndex        =   8
      Top             =   3240
      Width           =   1695
   End
   Begin VB.Label lblP2Wins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wins: 0"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   6720
      TabIndex        =   7
      Top             =   3000
      Width           =   1695
   End
   Begin VB.Label lblP1Wins 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Wins: 0"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   4920
      TabIndex        =   6
      Top             =   3000
      Width           =   1695
   End
   Begin VB.Label lblTurn1 
      BackColor       =   &H00000000&
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
      Left            =   4920
      TabIndex        =   5
      Top             =   2520
      Width           =   1695
   End
   Begin VB.Label lblTurn2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
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
      Left            =   6720
      TabIndex        =   4
      Top             =   2520
      Width           =   1695
   End
   Begin VB.Label lbl3 
      Alignment       =   2  'Center
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "P1"
      BeginProperty Font 
         Name            =   "Franklin Gothic Heavy"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   495
      Left            =   4920
      TabIndex        =   3
      Top             =   2040
      Width           =   1695
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   99
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   98
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   97
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   96
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   95
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   94
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   93
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   92
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   91
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   90
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   89
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   88
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   87
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   86
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   85
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   84
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   83
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   82
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   81
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   80
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   79
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   78
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   77
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   76
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   75
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   74
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   73
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   72
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   71
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   70
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   69
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   68
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   67
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   66
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   65
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   64
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   63
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   62
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   61
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   60
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   59
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   58
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   57
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   56
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   55
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   54
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   53
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   52
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   51
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   50
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   49
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   48
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   47
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   46
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   45
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   44
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   43
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   42
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   41
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   40
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   39
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   38
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   37
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   36
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   35
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   34
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   33
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   32
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   31
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   30
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   29
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   28
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   27
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   26
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   25
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   24
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   23
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   22
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   21
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   20
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   19
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   18
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   17
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   16
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   15
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   14
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   13
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   12
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   11
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   10
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   9
      Left            =   12000
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   8
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   7
      Left            =   11280
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   6
      Left            =   10920
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   5
      Left            =   10560
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   4
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   3
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   2
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   1
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater2 
      Height          =   375
      Index           =   0
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Label lbl2 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Pick a 'ship'."
      BeginProperty Font 
         Name            =   "Franklin Gothic Demi"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   4920
      TabIndex        =   2
      Top             =   3720
      Width           =   3495
      WordWrap        =   -1  'True
   End
   Begin VB.Label lbl1 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Player 1's Turn"
      BeginProperty Font 
         Name            =   "Bell MT"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   495
      Left            =   4920
      TabIndex        =   1
      Top             =   1560
      Width           =   3495
      WordWrap        =   -1  'True
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   99
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   98
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   97
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   96
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   95
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   94
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   93
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   92
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   91
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   90
      Left            =   960
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   89
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   88
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   87
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   86
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   85
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   84
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   83
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   82
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   81
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   80
      Left            =   960
      Stretch         =   -1  'True
      Top             =   4080
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   79
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   78
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   77
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   76
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   75
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   74
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   73
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   72
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   71
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   70
      Left            =   960
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   69
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   68
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   67
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   66
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   65
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   64
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   63
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   62
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   61
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   60
      Left            =   960
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   59
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   58
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   57
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   56
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   55
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   54
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   53
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   52
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   51
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   50
      Left            =   960
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   49
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   48
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   47
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   46
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   45
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   44
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   43
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   42
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   41
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   40
      Left            =   960
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   39
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   38
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   37
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   36
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   35
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   34
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   33
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   32
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   31
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   30
      Left            =   960
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   29
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   28
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   27
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   26
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   25
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   24
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   23
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   22
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   21
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   20
      Left            =   960
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   19
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   18
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   17
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   16
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   15
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   14
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   13
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   12
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   11
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   10
      Left            =   960
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   9
      Left            =   4200
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   8
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   7
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   6
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   5
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   4
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   3
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   2
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   1
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgWater 
      Height          =   375
      Index           =   0
      Left            =   960
      MouseIcon       =   "frmBattleship.frx":198851
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   375
   End
   Begin VB.Image imgPatrolV 
      Height          =   735
      Index           =   1
      Left            =   6240
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgDestroyerV 
      Height          =   1095
      Index           =   1
      Left            =   5880
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSubmarineV 
      Height          =   1095
      Index           =   1
      Left            =   5520
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgBattleshipV 
      Height          =   1455
      Index           =   1
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgCarrierV 
      Height          =   1815
      Index           =   1
      Left            =   4800
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgPatrolH 
      Height          =   375
      Index           =   1
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   735
   End
   Begin VB.Image imgDestroyerH 
      Height          =   375
      Index           =   1
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Image imgSubmarineH 
      Height          =   375
      Index           =   1
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   2400
      Width           =   1095
   End
   Begin VB.Image imgBattleshipH 
      Height          =   375
      Index           =   1
      Left            =   6240
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Image imgCarrierH 
      Height          =   375
      Index           =   1
      Left            =   5880
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   1815
   End
   Begin VB.Image imgCarrierH 
      Height          =   375
      Index           =   0
      Left            =   6240
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   1815
   End
   Begin VB.Image imgBattleshipH 
      Height          =   375
      Index           =   0
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   2400
      Width           =   1455
   End
   Begin VB.Image imgSubmarineH 
      Height          =   375
      Index           =   0
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Image imgDestroyerH 
      Height          =   375
      Index           =   0
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   1095
   End
   Begin VB.Image imgPatrolH 
      Height          =   375
      Index           =   0
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   735
   End
   Begin VB.Image imgCarrierV 
      Height          =   1815
      Index           =   0
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgBattleshipV 
      Height          =   1455
      Index           =   0
      Left            =   5520
      Stretch         =   -1  'True
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSubmarineV 
      Height          =   1095
      Index           =   0
      Left            =   5880
      Stretch         =   -1  'True
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgDestroyerV 
      Height          =   1095
      Index           =   0
      Left            =   6240
      Stretch         =   -1  'True
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgPatrolV 
      Height          =   735
      Index           =   0
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgBG 
      BorderStyle     =   1  'Fixed Single
      Height          =   3855
      Left            =   840
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   3855
   End
   Begin VB.Image imgBG2 
      BorderStyle     =   1  'Fixed Single
      Height          =   3855
      Left            =   8640
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   3855
   End
   Begin VB.Label lbbl1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "SHIPS HERE"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   840
      TabIndex        =   44
      Top             =   5160
      Width           =   1695
   End
   Begin VB.Label lbbl1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "SHIPS HERE"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   10800
      TabIndex        =   45
      Top             =   5160
      Width           =   1695
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuMainMenu 
         Caption         =   "Main Menu"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuShowShips 
      Caption         =   "Show Enemy Ships"
   End
   Begin VB.Menu mnuCheckShipDeath 
      Caption         =   "Check Ship Deaths"
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
      Caption         =   "Start New Game"
   End
End
Attribute VB_Name = "frmBattleship"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim z1 As Integer
Dim z2 As Integer

Option Explicit

Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)

Private Const MOUSEEVENTF_MOVE = &H1          ' mouse move
Private Const MOUSEEVENTF_LEFTDOWN = &H2      ' left button down
Private Const MOUSEEVENTF_LEFTUP = &H4        ' left button up
Private Const MOUSEEVENTF_RIGHTDOWN = &H8     ' right button down
Private Const MOUSEEVENTF_RIGHTUP = &H10      ' right button up
Private Const MOUSEEVENTF_MIDDLEDOWN = &H20   ' middle button down
Private Const MOUSEEVENTF_MIDDLEUP = &H40     ' middle button up
Private Const MOUSEEVENTF_WHEEL = &H800       ' wheel button rolled
Private Const MOUSEEVENTF_ABSOLUTE = &H8000   ' absolute move

' Mouse the mouse cursor.
'
' If a window handle is passed, the coordinates
' are considered to be relative to that window's client area,
' otherwise they are considered to be relative to the screen.
'
' In all cases, coordinates are in pixels

Sub MoveMouseCursor(ByVal X As Long, ByVal Y As Long, _
    ByVal mouse_x As Long, ByVal mouse_y As Long)

    Dim X1 As Long
    Dim Y1 As Long
    
    ' Get the coordinates.
    'X = CLng(txtX.Text)
    'Y = CLng(txtY.Text)
    
    ' Position the target form.
    frmTarget.Left = X - frmTarget.Width / 2
    frmTarget.Top = Y - frmTarget.Height / 2
    
    ' mouse_event moves in a coordinate system where
    ' (0, 0) is in the upper left corner and
    ' (65535,65535) is in the lower right corner.

    ' Convert the coordinates.
    'mouse_x = CLng(X * 65535 / Screen.Width)
    'mouse_y = CLng(Y * 65535 / Screen.Height)

    ' Click at that position.
    'mouse_event _
    '    MOUSEEVENTF_ABSOLUTE + _
    '    MOUSEEVENTF_MOVE, _
    '    mouse_x, mouse_y, 0, 0
End Sub

Private Sub cmd1_Click(Index As Integer)
    
Randomize

tmrPlayerAIPlacement.Enabled = False
    
    If Index = 0 Then
        
        If ShipsLeft <= 0 And ShipsLeft <> -1 And (TurnPlayer = True) Then
            s = 1
                GameOn = True
                PlaceShips = False
                TurnPlayer = False
                TurnPlayer2 = True
                TurnAI = True
                Player1Placement = False
                ShipsLeft = 5
                If Player1Placement = False And Player2Placement = False Then GameOn = True: PlaceShips = False
                
                t = 0
                lblStat1(t).Visible = True
                lblStat2(t).Visible = True
                lblStat3(t).Visible = True
                lblStat4(t).Visible = True
                lblStat5(t).Visible = True
                
                tmrAIPlacement.Enabled = True
                
        Else
            MsgBox "Ships not placed", vbCritical, "Ships"
        End If
        
    ElseIf Index = 1 Then
    
        If ShipsLeft <= 0 And ShipsLeft <> -1 And (TurnPlayer2 = True Or TurnAI = True) Then
            s = 1
                GameOn = True
                PlaceShips = False
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                Player1Placement = False
                ShipsLeft = 5
                If Player1Placement = False And Player2Placement = False Then GameOn = True: PlaceShips = False
                
                t = 0
                lblStat1(t).Visible = True
                lblStat2(t).Visible = True
                lblStat3(t).Visible = True
                lblStat4(t).Visible = True
                lblStat5(t).Visible = True
                
                tmrAIPlacement.Enabled = True
                
        Else
            MsgBox "Ships not placed", vbCritical, "Ships"
        End If
        
    End If
    
End Sub

Private Sub cmd2_Click(Index As Integer)

tmrPlayerAIPlacement.Enabled = False

'***Initiate Program***
t = 0
txtMoved2.Text = vbNullString
    
    For R = 0 To 9
        For C = 0 To 9
            Grid(R, C) = 0
        Next C
    Next R
    
    For n = 0 To 99
            C = (n Mod 10)
            R = 10 - (n \ 10 + 1)
            l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                If Grid(R, C) = 0 Then
                    imgWater(l).Tag = "Void"
                    IndexStat(l) = vbNullString
                    IndexStatRC(R, C) = vbNullString
                End If
    Next n
    
    '*Load Images*
    For t = 0 To 99
        imgWater(t).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
    Next t
    t = 0
    imgBG.Picture = LoadPicture(App.Path & "\Images\BGWater.gif")
    '**
    
    'Make ships Invisible
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
    
    lblStat1(t).Visible = True
    lblStat2(t).Visible = True
    lblStat3(t).Visible = True
    lblStat4(t).Visible = True
    lblStat5(t).Visible = True
    
    PlaceCarrier(t) = False
    PlaceBattleship(t) = False
    PlaceSubmarine(t) = False
    PlaceDestroyer(t) = False
    PlacePatrolBoat(t) = False
    
    ShipsLeft = 5
    
    tmrAIPlacement = False
    tmrAIAttack = False
    
    PlaceShips = True
    
    Call CheckTurn
    
End Sub

Private Sub cmdAutoAIplace_Click(Index As Integer)

    tmrPlayerAIPlacement.Enabled = True
    
End Sub

Private Sub cmdMM_Click(Index As Integer)
    
    Call mnuMainMenu_Click
    
End Sub

Private Sub Command1_Click()

    frmAIDebugger.Show
    
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

    On Error Resume Next
    
        
        Const UP1 = 1
        Const DOWN1 = -1
        Const LEFT1 = -1
        Const RIGHT1 = 1
        
    
    Select Case Ships(q)
        Case "Carrier"
        
            ShipNum = 0
            s = 0
            
            Select Case KeyCode
                Case vbKeyUp
                    num = UP1
                Case vbKeyDown
                    num = DOWN1
                Case vbKeyLeft
                    num2 = LEFT1
                Case vbKeyRight
                    num2 = RIGHT1
                Case vbKeyZ
                    If PlacementVH = 1 Then
                        PlacementVH = 0
                        imgCarrierH(ShipNum).Visible = False
                        If Row > 9 Then Row = 9
                        If Row < 0 + 4 Then Row = 0 + 4
                        If Col > 9 Then Col = 9
                        If Col < 0 Then Col = 0
                    ElseIf PlacementVH = 0 Then
                        PlacementVH = 1
                        imgCarrierV(ShipNum).Visible = False
                        If Row > 9 Then Row = 9
                        If Row < 0 Then Row = 0
                        If Col > 9 - 4 Then Col = 9 - 4
                        If Col < 0 Then Col = 0
                    End If
                Case vbKeyX
                    q = 2
                    PlaceCarrier(s) = False
                    'time to place BATTLESHIP
                    PlaceBattleship(s) = True
                    PlaceDirection(s) = False
                    lbl2.Caption = "Place Your 'Battleship'."
                    
                    If PlacementVH = 0 Then 'horizontal
                        I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                        For X = 0 To 4
                            Grid(Row - X, Col) = 1
                            imgWater(I1 + 10 * X).Tag = "Carrier"
                        Next X
                    End If
                    If PlacementVH = 1 Then 'vertical
                        I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                        For X = 0 To 4
                            Grid(Row, Col + X) = 1
                            imgWater(I1 + X).Tag = "Carrier"
                        Next X
                    End If
                    GoTo 2
            End Select
            
                    'I1 = I1 - 10
                    'Print I1
                    Col = Col + num2
                    Row = Row + num
                    
                    If PlacementVH = 0 Then
                        If Row > 9 Then Row = 0 + 4
                        If Row < 0 + 4 Then Row = 9
                        If Col > 9 Then Col = 0
                        If Col < 0 Then Col = 9
                        I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                        imgCarrierV(ShipNum).Left = imgWater(I1).Left
                        imgCarrierV(ShipNum).Top = imgWater(I1).Top
                        imgCarrierV(ShipNum).Visible = True
                    End If
                    
                    If PlacementVH = 1 Then
                        If Row > 9 Then Row = 0
                        If Row < 0 Then Row = 9
                        If Col > 9 - 4 Then Col = 0
                        If Col < 0 Then Col = 9 - 4
                        I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                        imgCarrierH(ShipNum).Left = imgWater(I1).Left
                        imgCarrierH(ShipNum).Top = imgWater(I1).Top
                        imgCarrierH(ShipNum).Visible = True
                    End If
                    
        Case "Battleship"
        
            ShipNum = 0
            s = 0
            
            Select Case KeyCode
                Case vbKeyUp
                    num = UP1
                Case vbKeyDown
                    num = DOWN1
                Case vbKeyLeft
                    num2 = LEFT1
                Case vbKeyRight
                    num2 = RIGHT1
                Case vbKeyZ
                    If PlacementVH = 1 Then
                        PlacementVH = 0
                        imgBattleshipH(ShipNum).Visible = False
                        If Row > 9 Then Row = 9
                        If Row < 0 + 3 Then Row = 0 + 3
                        If Col > 9 Then Col = 9
                        If Col < 0 Then Col = 0
                    ElseIf PlacementVH = 0 Then
                        PlacementVH = 1
                        imgBattleshipV(ShipNum).Visible = False
                        If Row > 9 Then Row = 9
                        If Row < 0 Then Row = 0
                        If Col > 9 - 3 Then Col = 9 - 3
                        If Col < 0 Then Col = 0
                    End If
                Case vbKeyX
                    'Error Checks
                    If PlacementVH = 0 Then
                    If (Grid(Row + 0, Col + 0) = 0 _
                    And Grid(Row + -1, Col + 0) = 0 _
                    And Grid(Row + -2, Col + 0) = 0 _
                    And Grid(Row + -3, Col + 0) = 0 _
                    And Grid(Row + 0, Col + 0) = 0) _
                    Then
                        q = 3
                        PlaceBattleship(s) = False
                        'time to place BATTLESHIP
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        
                        If PlacementVH = 0 Then 'vertical
                            I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                            For X = 0 To 3
                                Grid(Row - X, Col) = 1
                                imgWater(I1 + 10 * X).Tag = "Carrier"
                            Next X
                        End If
                        If PlacementVH = 1 Then 'horizontal
                            I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                            For X = 0 To 3
                                Grid(Row, Col + X) = 1
                                imgWater(I1 + X).Tag = "Carrier"
                            Next X
                        End If
                        GoTo 2
                    Else
                        MsgBox "Error"
                    End If
                    End If
                    
                    'Error Checks
                    If PlacementVH = 1 Then
                    If (Grid(Row + 0, Col + 0) = 0 _
                    And Grid(Row + 0, Col + 1) = 0 _
                    And Grid(Row + 0, Col + 2) = 0 _
                    And Grid(Row + 0, Col + 3) = 0 _
                    And Grid(Row + 0, Col + 0) = 0) _
                    Then
                        q = 3
                        PlaceBattleship(s) = False
                        'time to place BATTLESHIP
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        
                        If PlacementVH = 0 Then 'vertical
                            I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                            For X = 0 To 3
                                Grid(Row - X, Col) = 1
                                imgWater(I1 + 10 * X).Tag = "Carrier"
                            Next X
                        End If
                        If PlacementVH = 1 Then 'horizontal
                            I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                            For X = 0 To 3
                                Grid(Row, Col + X) = 1
                                imgWater(I1 + X).Tag = "Carrier"
                            Next X
                        End If
                        GoTo 2
                    Else
                        MsgBox "Error"
                    End If
                    End If
                    
            End Select
            
                    'I1 = I1 - 10
                    'Print I1
                    Col = Col + num2
                    Row = Row + num
                        
                    If PlacementVH = 0 Then
                        If Row > 9 Then Row = 0 + 3
                        If Row < 0 + 3 Then Row = 9
                        If Col > 9 Then Col = 0
                        If Col < 0 Then Col = 9
                        I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                        imgBattleshipV(ShipNum).Left = imgWater(I1).Left
                        imgBattleshipV(ShipNum).Top = imgWater(I1).Top
                        imgBattleshipV(ShipNum).Visible = True
                    End If
                    
                    If PlacementVH = 1 Then
                        If Row > 9 Then Row = 0
                        If Row < 0 Then Row = 9
                        If Col > 9 - 3 Then Col = 0
                        If Col < 0 Then Col = 9 - 3
                        I1 = ((-1 * (Row * XDefinition)) + (XDefinition * YDefinition)) + ((Col * 1) - XDefinition)
                        imgBattleshipH(ShipNum).Left = imgWater(I1).Left
                        imgBattleshipH(ShipNum).Top = imgWater(I1).Top
                        imgBattleshipH(ShipNum).Visible = True
                    End If
                    
        Case "Submarine"
        Case "Destroyer"
        Case "PatrolBoat"
        
    End Select

2
    
    num = 0
    num2 = 0
    
End Sub

'Private Sub Dirs_Change()
''§ put the filelist on the selected dirlist
'   On Error GoTo NO_FOLDER
'   Files.Path = Dirs.Path
''§ filter according to the text in the textbox like: ".mp3"
'   Files.Pattern = Filter.Text
'Exit Sub
'NO_FOLDER:
'   MsgBox ("There is an error on reading the folder")
'End Sub

Private Sub Form_Load()

    Randomize
    
Call optAI3_Click

'frmTarget.Show , Me
tmrTarget.Enabled = True

Screen.MousePointer = vbHourglass

    'txtMoved2.Text = vbNullString
    
    'Setup Ships
    
    ShipsLeft = 5
    
    Ships(1) = "Carrier"
    Ships(2) = "Battleship"
    Ships(3) = "Submarine"
    Ships(4) = "Destroyer"
    Ships(5) = "PatrolBoat"
    
    q = 1
    
    For t = 0 To 1
    lblStat1(t).Visible = True
    lblStat2(t).Visible = True
    lblStat3(t).Visible = True
    lblStat4(t).Visible = True
    lblStat5(t).Visible = True
    Next t
    
    'Setup RANKFILE Strings
    For Rank = 0 To 9
    For File = 0 To 9
        
        If File = 0 Then
        RankFile(Rank, File) = "A" & (Rank + 1)
        End If
        
        If File = 1 Then
        RankFile(Rank, File) = "B" & (Rank + 1)
        End If
        
        If File = 2 Then
        RankFile(Rank, File) = "C" & (Rank + 1)
        End If
        
        If File = 3 Then
        RankFile(Rank, File) = "D" & (Rank + 1)
        End If
        
        If File = 4 Then
        RankFile(Rank, File) = "E" & (Rank + 1)
        End If
        
        If File = 5 Then
        RankFile(Rank, File) = "F" & (Rank + 1)
        End If
        
        If File = 6 Then
        RankFile(Rank, File) = "G" & (Rank + 1)
        End If
        
        If File = 7 Then
        RankFile(Rank, File) = "H" & (Rank + 1)
        End If
        
        If File = 8 Then
        RankFile(Rank, File) = "I" & (Rank + 1)
        End If
        
        If File = 9 Then
        RankFile(Rank, File) = "J" & (File + 1)
        End If
        
        If Rank = 10 Then
        RankFile(Rank, File) = "K" & (File + 1)
        End If
        
    Next File
    Next Rank
    
    'initiate sounds
    'wmpBGM.URL = App.Path & "\FX\Music\" & "02 Heart of Courage.mp3"
    'wmpBGM.URL = App.Path & "\FX\Music\" & "14 Protectors of the Earth.mp3"
    'wmpBGM.settings.setMode "loop", True
    'wmpBGM.settings.volume = 35
    
    For t = 0 To 4
        wmpSound(t).settings.volume = 0
    Next t
    
    wmpSound(0).URL = App.Path & "\FX\" & "sink.wav"
    wmpSound(1).URL = App.Path & "\FX\" & "explosion1.wav"
    'wmpSound(2).URL = App.Path & "\FX\" & "lose.mp3"
    'wmpSound(3).URL = App.Path & "\FX\" & "win.mp3"
    'wmpSound(4).URL = App.Path & "\FX\" & vbNullString
    
    'Set ai difficulty
    If AIDifficulty = 1 Then Call optAI1_Click
    If AIDifficulty = 2 Then Call optAI2_Click
    If AIDifficulty = 3 Then Call optAI3_Click
    If AIDifficulty = 4 Then Call optAI4_Click
    If AIDifficulty = 5 Then Call optAI5_Click
    If AIDifficulty = 6 Then Call optAI6_Click
    If AIDifficulty = 7 Then Call optAI7_Click
    
    HitContinue = False
    
    RandNum = Int(0 + (Rnd * 2))
    
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
    
    For t = 0 To 99
            C = (t Mod 10)
            R = 10 - (t \ 10 + 1)
            l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                If Grid(R, C) = 0 Then
                    imgWater(l).Tag = "Void"
                    IndexStat(l) = vbNullString
                    IndexStatRC(R, C) = vbNullString
                End If
                If Grid2(R, C) = 0 Then
                    imgWater2(l).Tag = "Void"
                    IndexStat2(l) = vbNullString
                    IndexStatRC2(R, C) = vbNullString
                    
                End If
    Next t
        
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
    
    ShipDefaultPos = -500
    
    imgPatrolH(t).Left = ShipDefaultPos
    imgDestroyerH(t).Left = ShipDefaultPos
    imgSubmarineH(t).Left = ShipDefaultPos
    imgBattleshipH(t).Left = ShipDefaultPos
    imgCarrierH(t).Left = ShipDefaultPos
    imgPatrolV(t).Left = ShipDefaultPos
    imgDestroyerV(t).Left = ShipDefaultPos
    imgSubmarineV(t).Left = ShipDefaultPos
    imgBattleshipV(t).Left = ShipDefaultPos
    imgCarrierV(t).Left = ShipDefaultPos
    imgPatrolH(t).Top = ShipDefaultPos
    imgDestroyerH(t).Top = ShipDefaultPos
    imgSubmarineH(t).Top = ShipDefaultPos
    imgBattleshipH(t).Top = ShipDefaultPos
    imgCarrierH(t).Top = ShipDefaultPos
    imgPatrolV(t).Top = ShipDefaultPos
    imgDestroyerV(t).Top = ShipDefaultPos
    imgSubmarineV(t).Top = ShipDefaultPos
    imgBattleshipV(t).Top = ShipDefaultPos
    imgCarrierV(t).Top = ShipDefaultPos
    
    tmrAIPlacement = False
    tmrAIAttack = False
    
    Next t
    
    For t = 0 To 1
    lblStat1(t).BackColor = &H80000005
    lblStat2(t).BackColor = &H80000005
    lblStat3(t).BackColor = &H80000005
    lblStat4(t).BackColor = &H80000005
    lblStat5(t).BackColor = &H80000005
    lblStat1(t).FontStrikethru = False
    lblStat2(t).FontStrikethru = False
    lblStat3(t).FontStrikethru = False
    lblStat4(t).FontStrikethru = False
    lblStat5(t).FontStrikethru = False
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
    Hit = False
    Miss = False
    
    XDefinition = 10
    YDefinition = 10
    
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
    
Screen.MousePointer = vbDefault

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If shpCoordinates.Visible = True Then shpCoordinates.Visible = False
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub

Private Sub imgWater_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If shpCoordinates.Visible = False Then shpCoordinates.Visible = True
    
    shpCoordinates.Width = imgWater(Index).Width
    shpCoordinates.Height = imgWater(Index).Height
    
    shpCoordinates.Left = imgWater(Index).Left
    shpCoordinates.Top = imgWater(Index).Top
    
End Sub

Private Sub imgWater_MouseUp(I As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    Randomize
    
'New Placement Algorithm
    
GoTo SkipA:
    
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = True Then
        If TurnPlayer = True Then
            
            
        End If
    End If
    
    
    GoTo A2:
    
SkipA:
    
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
                        For X = 0 To 4
                            Grid(RowTemp + X, ColTemp) = 1
                            imgWater(ITemp - 10 * X).Tag = "Carrier"
                        Next X
                        
                        imgCarrierV(ShipNum).Left = imgWater(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgCarrierV(ShipNum).Height
                        imgCarrierV(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat1(s).Visible = False
                        'time to place BATTLESHIP
                        'PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is off the grid.")
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
                        For X = 0 To 4
                            Grid(RowTemp - X, ColTemp) = 1
                            imgWater(ITemp + 10 * X).Tag = "Carrier"
                        Next X
                        imgCarrierV(ShipNum).Left = imgWater(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater(ITemp).Top
                        imgCarrierV(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat1(s).Visible = False
                        'time to place BATTLESHIP
                        'PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is off the grid.")
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
                        For X = 0 To 4
                            Grid(RowTemp, ColTemp + X) = 1
                            imgWater(ITemp + X).Tag = "Carrier"
                        Next X
                        imgCarrierH(ShipNum).Left = imgWater(ITemp).Left
                        imgCarrierH(ShipNum).Top = imgWater(ITemp).Top
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat1(s).Visible = False
                        'time to place BATTLESHIP
                        'PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is off the grid.")
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
                        For X = 0 To 4
                            Grid(RowTemp, ColTemp - X) = 1
                            imgWater(ITemp - X).Tag = "Carrier"
                        Next X
                        imgCarrierH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgCarrierH(ShipNum).Width
                        imgCarrierH(ShipNum).Top = imgWater(ITemp).Top
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat1(s).Visible = False
                        'time to place BATTLESHIP
                        'PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    'MsgBox ("You can't place your Carrier because it is collided with another ship.")
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
                        For X = 0 To 3
                            Grid(RowTemp + X, ColTemp) = 2
                            imgWater(ITemp - 10 * X).Tag = "Battleship"
                        Next X
                        imgBattleshipV(ShipNum).Left = imgWater(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgBattleshipV(ShipNum).Height
                        imgBattleshipV(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat2(s).Visible = False
                        'time to place SUBMARINE
                        'PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is off the grid.")
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
                        For X = 0 To 3
                            Grid(RowTemp - X, ColTemp) = 2
                            imgWater(ITemp + 10 * X).Tag = "Battleship"
                        Next X
                        imgBattleshipV(ShipNum).Left = imgWater(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater(ITemp).Top
                        imgBattleshipV(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat2(s).Visible = False
                        'time to place SUBMARINE
                        'PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is off the grid.")
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
                        For X = 0 To 3
                            Grid(RowTemp, ColTemp + X) = 2
                            imgWater(ITemp + X).Tag = "Battleship"
                        Next X
                        imgBattleshipH(ShipNum).Left = imgWater(ITemp).Left
                        imgBattleshipH(ShipNum).Top = imgWater(ITemp).Top
                        imgBattleshipH(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat2(s).Visible = False
                        'time to place SUBMARINE
                        'PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is off the grid.")
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
                        For X = 0 To 3
                            Grid(RowTemp, ColTemp - X) = 2
                            imgWater(ITemp - X).Tag = "Battleship"
                        Next X
                        imgBattleshipH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgBattleshipH(ShipNum).Width
                        imgBattleshipH(ShipNum).Top = imgWater(ITemp).Top
                        imgBattleshipH(ShipNum).Visible = True
                        PlaceBattleship(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat2(s).Visible = False
                        'time to place SUBMARINE
                        'PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Battleship because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    'MsgBox ("You can't place your Battleship because it is collided with another ship.")
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
                        For X = 0 To 2
                            Grid(RowTemp + X, ColTemp) = 3
                            imgWater(ITemp - 10 * X).Tag = "Submarine"
                        Next X
                        imgSubmarineV(ShipNum).Left = imgWater(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgSubmarineV(ShipNum).Height
                        imgSubmarineV(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat3(s).Visible = False
                        'time to place DESTROYER
                        'PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is off the grid.")
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
                        For X = 0 To 2
                            Grid(RowTemp - X, ColTemp) = 3
                            imgWater(ITemp + 10 * X).Tag = "Submarine"
                        Next X
                        imgSubmarineV(ShipNum).Left = imgWater(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater(ITemp).Top
                        imgSubmarineV(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat3(s).Visible = False
                        'time to place DESTROYER
                        'PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is off the grid.")
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
                        For X = 0 To 2
                            Grid(RowTemp, ColTemp + X) = 3
                            imgWater(ITemp + X).Tag = "Submarine"
                        Next X
                        imgSubmarineH(ShipNum).Left = imgWater(ITemp).Left
                        imgSubmarineH(ShipNum).Top = imgWater(ITemp).Top
                        imgSubmarineH(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat3(s).Visible = False
                        'time to place DESTROYER
                        'PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is off the grid.")
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
                        For X = 0 To 2
                            Grid(RowTemp, ColTemp - X) = 3
                            imgWater(ITemp - X).Tag = "Submarine"
                        Next X
                        imgSubmarineH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgSubmarineH(ShipNum).Width
                        imgSubmarineH(ShipNum).Top = imgWater(ITemp).Top
                        imgSubmarineH(ShipNum).Visible = True
                        PlaceSubmarine(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat3(s).Visible = False
                        'time to place DESTROYER
                        'PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Submarine because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    'MsgBox ("You can't place your Submarine because it is collided with another ship.")
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
                        For X = 0 To 2
                            Grid(RowTemp + X, ColTemp) = 4
                            imgWater(ITemp - 10 * X).Tag = "Destroyer"
                        Next X
                        imgDestroyerV(ShipNum).Left = imgWater(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgDestroyerV(ShipNum).Height
                        imgDestroyerV(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat4(s).Visible = False
                        'time to place PATROL BOAT
                        'PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is off the grid.")
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
                        For X = 0 To 2
                            Grid(RowTemp - X, ColTemp) = 4
                            imgWater(ITemp + 10 * X).Tag = "Destroyer"
                        Next X
                        imgDestroyerV(ShipNum).Left = imgWater(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater(ITemp).Top
                        imgDestroyerV(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat4(s).Visible = False
                        'time to place PATROL BOAT
                        'PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is off the grid.")
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
                        For X = 0 To 2
                            Grid(RowTemp, ColTemp + X) = 4
                            imgWater(ITemp + X).Tag = "Destroyer"
                        Next X
                        imgDestroyerH(ShipNum).Left = imgWater(ITemp).Left
                        imgDestroyerH(ShipNum).Top = imgWater(ITemp).Top
                        imgDestroyerH(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat4(s).Visible = False
                        'time to place PATROL BOAT
                        'PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is off the grid.")
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
                        For X = 0 To 2
                            Grid(RowTemp, ColTemp - X) = 4
                            imgWater(ITemp - X).Tag = "Destroyer"
                        Next X
                        imgDestroyerH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgDestroyerH(ShipNum).Width
                        imgDestroyerH(ShipNum).Top = imgWater(ITemp).Top
                        imgDestroyerH(ShipNum).Visible = True
                        PlaceDestroyer(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat4(s).Visible = False
                        'time to place PATROL BOAT
                        'PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Destroyer because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    'MsgBox ("You can't place your Destroyer because it is collided with another ship.")
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
                        For X = 0 To 1
                            Grid(RowTemp + X, ColTemp) = 5
                            imgWater(ITemp - 10 * X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater(ITemp).Top + imgWater(ITemp).Height - imgPatrolV(ShipNum).Height
                        imgPatrolV(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat5(s).Visible = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        's = 1
                        'PlaceCarrier(s) = True
                        'TurnPlayer = False
                        'TurnPlayer2 = True
                        'TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Pick a 'ship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 1 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp - 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid(RowTemp - X, ColTemp) = 5
                            imgWater(ITemp + 10 * X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater(ITemp).Top
                        imgPatrolV(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat5(s).Visible = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        's = 1
                        'PlaceCarrier(s) = True
                        'TurnPlayer = False
                        'TurnPlayer2 = True
                        'TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Pick a 'ship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 1 <= 9 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp + 1) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid(RowTemp, ColTemp + X) = 5
                            imgWater(ITemp + X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolH(ShipNum).Left = imgWater(ITemp).Left
                        imgPatrolH(ShipNum).Top = imgWater(ITemp).Top
                        imgPatrolH(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat5(s).Visible = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        's = 1
                        'PlaceCarrier(s) = True
                        'TurnPlayer = False
                        'TurnPlayer2 = True
                        'TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Pick a 'ship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 1 >= 0 Then 'Inside Grid Validation
                    If Grid(RowTemp, ColTemp) = 0 _
                    And Grid(RowTemp, ColTemp - 1) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid(RowTemp, ColTemp - X) = 5
                            imgWater(ITemp - X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolH(ShipNum).Left = imgWater(ITemp).Left + imgWater(ITemp).Width - imgPatrolH(ShipNum).Width
                        imgPatrolH(ShipNum).Top = imgWater(ITemp).Top
                        imgPatrolH(ShipNum).Visible = True
                        PlacePatrolBoat(s) = False
                        ShipsLeft = ShipsLeft - 1
                        lblStat5(s).Visible = False
                        'time to let P2 Place ships
                        Call CheckTurn
                        PlaceDirection(s) = False
                        's = 1
                        'PlaceCarrier(s) = True
                        'TurnPlayer = False
                        'TurnPlayer2 = True
                        'TurnAI = True
                        lbl1.Caption = "AI's Turn"
                        lbl2.Caption = "Pick a 'ship'."
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'tmrAIPlacement = True
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Patrol Boat because it is off the grid.")
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater(I).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgWater(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    'MsgBox ("You can't place your Patrol Boat because it is collided with another ship.")
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
    
A2:
    
    If PlaceShips = False And GameOn = True Then
        If TurnPlayer2 = True And TurnAI = False Then
            s = 1
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change label
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
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
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    
    If HitContinue = False Then
        'Next Player's Turn
        'change label
        lbl1.Caption = "Player 1's Turn"
        'lbl2.Caption = "Battle!"
        TurnPlayer = True
        TurnPlayer2 = False
        TurnAI = False
    End If
    
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer Then
            'show move
            Rank = Row
            File = Col
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
    
End Sub

Private Sub imgWater2_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If shpCoordinates.Visible = False Then shpCoordinates.Visible = True
    
    shpCoordinates.Width = imgWater(Index).Width
    shpCoordinates.Height = imgWater(Index).Height
    
    shpCoordinates.Left = imgWater2(Index).Left
    shpCoordinates.Top = imgWater2(Index).Top
    
End Sub

Private Sub imgWater2_MouseUp(I As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    Randomize
    
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    'DEBUGING TOOL
    'Print Row, Col, RowTemp, ColTemp
    
    '***************Placement of Ships***************'
    If PlaceShips = True Then
    '*Player2's Turn
        If TurnPlayer2 = True And TurnAI = False Then
            ShipNum = 1
            s = 1
            
            '*Place Carrier
            If PlaceCarrier(s) = True Then
            
                'show coordinate
                '''imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
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
                        For X = 0 To 4
                            Grid2(RowTemp + X, ColTemp) = 1
                        Next X
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
                        For X = 0 To 4
                            Grid2(RowTemp - X, ColTemp) = 1
                        Next X
                        imgCarrierV(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater2(ITemp).Top
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
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 4 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 _
                    And Grid2(RowTemp, ColTemp + 3) = 0 _
                    And Grid2(RowTemp, ColTemp + 4) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 4
                            Grid2(RowTemp, ColTemp + X) = 1
                        Next X
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
                        For X = 0 To 4
                            Grid2(RowTemp, ColTemp - X) = 1
                        Next X
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
                '''imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
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
                        For X = 0 To 3
                            Grid2(RowTemp + X, ColTemp) = 2
                        Next X
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
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                        For X = 0 To 3
                            Grid2(RowTemp - X, ColTemp) = 2
                        Next X
                        imgBattleshipV(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                        For X = 0 To 3
                            Grid2(RowTemp, ColTemp + X) = 2
                        Next X
                        imgBattleshipH(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "You can't place your Battleship because it is collided with another ship."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                        For X = 0 To 3
                            Grid2(RowTemp, ColTemp - X) = 2
                        Next X
                        imgBattleshipH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgBattleshipH(ShipNum).Width
                        imgBattleshipH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                '''imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
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
                        For X = 0 To 2
                            Grid2(RowTemp + X, ColTemp) = 3
                        Next X
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
                        For X = 0 To 2
                            Grid2(RowTemp - X, ColTemp) = 3
                        Next X
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
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp + X) = 3
                        Next X
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
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp - X) = 3
                        Next X
                        imgSubmarineH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgSubmarineH(ShipNum).Width
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
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                '''imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
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
                        For X = 0 To 2
                            Grid2(RowTemp + X, ColTemp) = 4
                        Next X
                        imgDestroyerV(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgDestroyerV(ShipNum).Height
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
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp - X, ColTemp) = 4
                        Next X
                        imgDestroyerV(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater2(ITemp).Top
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
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp + X) = 4
                        Next X
                        imgDestroyerH(ShipNum).Left = imgWater2(ITemp).Left
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
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp - X) = 4
                        Next X
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
                '''imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
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
                        For X = 0 To 1
                            Grid2(RowTemp + X, ColTemp) = 5
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgPatrolV(ShipNum).Height
                        PlacePatrolBoat(s) = False
                        'time to start game
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnAI = False
                        TurnPlayer2 = False
                        
                        Player2Placement = False
                        If Player1Placement = False And Player2Placement = False Then GameOn = True: PlaceShips = False
                        
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
                        For X = 0 To 1
                            Grid2(RowTemp - X, ColTemp) = 5
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnAI = False
                        TurnPlayer2 = False
                        
                        Player2Placement = False
                        If Player1Placement = False And Player2Placement = False Then GameOn = True: PlaceShips = False
                        
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
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 1 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp, ColTemp + X) = 5
                        Next X
                        imgPatrolH(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolH(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnAI = False
                        TurnPlayer2 = False
                        
                        Player2Placement = False
                        If Player1Placement = False And Player2Placement = False Then GameOn = True: PlaceShips = False
                        
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
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 1 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp, ColTemp - X) = 5
                        Next X
                        imgPatrolH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgPatrolH(ShipNum).Width
                        imgPatrolH(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        Call CheckTurn
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnAI = False
                        TurnPlayer2 = False
                        
                        Player2Placement = False
                        If Player1Placement = False And Player2Placement = False Then GameOn = True: PlaceShips = False
                        
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
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
    '*_____________________________*'
    End If
    '**
    
    If PlaceShips = False And GameOn = True Then
        If TurnPlayer = True Then
            s = 1
            'Hit Carrier?
            If Grid2(Row, Col) = 1 Then
                    Call ShotShip
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid2(Row, Col) = 6
                GoTo D:
            End If
            'Hit Battleship?
            If Grid2(Row, Col) = 2 Then
                    Call ShotShip
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid2(Row, Col) = 6
                GoTo D:
            End If
            'Hit Submarine?
            If Grid2(Row, Col) = 3 Then
                    Call ShotShip
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid2(Row, Col) = 6
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid2(Row, Col) = 4 Then
                    Call ShotShip
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid2(Row, Col) = 6
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid2(Row, Col) = 5 Then
                    Call ShotShip
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid2(Row, Col) = 6
                GoTo D:
            End If
            'Miss?
            If Grid2(Row, Col) = 0 Then
                imgWater2(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "AI's Turn"
                'lbl2.Caption = "Battle!"
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
            'Dead Ship?
            If Grid(Row, Col) = -2 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    
    If HitContinue = False Then
        'Next Player's Turn
        'change labels
        lbl1.Caption = "AI's Turn"
        'lbl2.Caption = "Battle!"
        TurnPlayer = False
        TurnPlayer2 = True
        TurnAI = True
        tmrAIAttack.Enabled = True
    End If
    
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer2 = True Or TurnAI = True Then
            'show move
            Rank = Row
            File = Col
            txtMoved2.Text = txtMoved2.Text & ": 'P1' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        If ShipsLeft <= 0 And ShipsLeft <> -1 Then
        s = 0
            GameOn = True
            PlaceShips = False
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
        End If
        
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
End Sub

Private Sub lblMoves_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If shpCoordinates.Visible = True Then shpCoordinates.Visible = False
End Sub

Private Sub lblP1Losses_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If shpCoordinates.Visible = True Then shpCoordinates.Visible = False
End Sub

Private Sub lblP2Losses_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If shpCoordinates.Visible = True Then shpCoordinates.Visible = False
End Sub

Private Sub lblStat1_Click(Index As Integer)

If PlaceShips = True Then
    ' Check if Carrier has been placed
    For IT = 0 To 99
        If Index = 0 And imgWater(IT).Tag = "Carrier" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Carrier has already been placed."
            Exit Sub
        End If
        If Index = 1 And imgWater2(IT).Tag = "Carrier" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Carrier has already been placed."
            Exit Sub
        End If
    Next IT
    
    ' Let the placement begin
    If Index = 0 Then
        t = 0
    ElseIf Index = 1 Then
        t = 1
    End If
    
    PlaceCarrier(t) = True
    PlaceBattleship(t) = False
    PlaceSubmarine(t) = False
    PlaceDestroyer(t) = False
    PlacePatrolBoat(t) = False
End If

End Sub

Private Sub lblStat1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If shpCoordinates.Visible = False Then shpCoordinates.Visible = True
    
    shpCoordinates.Width = lblStat1(Index).Width
    shpCoordinates.Height = lblStat1(Index).Height
    
    shpCoordinates.Left = lblStat1(Index).Left
    shpCoordinates.Top = lblStat1(Index).Top
    
End Sub

Private Sub lblStat2_Click(Index As Integer)

If PlaceShips = True Then
    ' Check if Battleship has been placed
    For IT = 0 To 99
        If Index = 0 And imgWater(IT).Tag = "Battleship" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Battleship has already been placed."
            Exit Sub
        End If
        If Index = 1 And imgWater2(IT).Tag = "Battleship" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Battleship has already been placed."
            Exit Sub
        End If
    Next IT
    
    ' Let the placement begin
    If Index = 0 Then
        t = 0
    ElseIf Index = 1 Then
        t = 1
    End If
    
    PlaceCarrier(t) = False
    PlaceBattleship(t) = True
    PlaceSubmarine(t) = False
    PlaceDestroyer(t) = False
    PlacePatrolBoat(t) = False
End If

End Sub

Private Sub lblStat2_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If shpCoordinates.Visible = False Then shpCoordinates.Visible = True
    
    shpCoordinates.Width = lblStat2(Index).Width
    shpCoordinates.Height = lblStat2(Index).Height
    
    shpCoordinates.Left = lblStat2(Index).Left
    shpCoordinates.Top = lblStat2(Index).Top
    
End Sub

Private Sub lblStat3_Click(Index As Integer)

If PlaceShips = True Then
    ' Check if Submarine has been placed
    For IT = 0 To 99
        If Index = 0 And imgWater(IT).Tag = "Submarine" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Submarine has already been placed."
            Exit Sub
        End If
        If Index = 1 And imgWater2(IT).Tag = "Submarine" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Submarine has already been placed."
            Exit Sub
        End If
    Next IT
    
    ' Let the placement begin
    If Index = 0 Then
        t = 0
    ElseIf Index = 1 Then
        t = 1
    End If
    
    PlaceCarrier(t) = False
    PlaceBattleship(t) = False
    PlaceSubmarine(t) = True
    PlaceDestroyer(t) = False
    PlacePatrolBoat(t) = False
End If

End Sub

Private Sub lblStat3_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If shpCoordinates.Visible = False Then shpCoordinates.Visible = True
    
    shpCoordinates.Width = lblStat3(Index).Width
    shpCoordinates.Height = lblStat3(Index).Height
    
    shpCoordinates.Left = lblStat3(Index).Left
    shpCoordinates.Top = lblStat3(Index).Top
    
End Sub

Private Sub lblStat4_Click(Index As Integer)

If PlaceShips = True Then
    ' Check if Destroyer has been placed
    For IT = 0 To 99
        If Index = 0 And imgWater(IT).Tag = "Destroyer" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Destroyer has already been placed."
            Exit Sub
        End If
        If Index = 1 And imgWater2(IT).Tag = "Submarine" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "Destroyer has already been placed."
            Exit Sub
        End If
    Next IT
    
    ' Let the placement begin
    If Index = 0 Then
        t = 0
    ElseIf Index = 1 Then
        t = 1
    End If
    
    PlaceCarrier(t) = False
    PlaceBattleship(t) = False
    PlaceSubmarine(t) = False
    PlaceDestroyer(t) = True
    PlacePatrolBoat(t) = False
End If

End Sub

Private Sub lblStat4_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If shpCoordinates.Visible = False Then shpCoordinates.Visible = True
    
    shpCoordinates.Width = lblStat4(Index).Width
    shpCoordinates.Height = lblStat4(Index).Height
    
    shpCoordinates.Left = lblStat4(Index).Left
    shpCoordinates.Top = lblStat4(Index).Top
    
End Sub

Private Sub lblStat5_Click(Index As Integer)

If PlaceShips = True Then
    ' Check if PatrolBoat has been placed
    For IT = 0 To 99
        If Index = 0 And imgWater(IT).Tag = "PatrolBoat" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "PatrolBoat has already been placed."
            Exit Sub
        End If
        If Index = 1 And imgWater2(IT).Tag = "PatrolBoat" Then
            If tmrPlayerAIPlacement.Enabled = False Then MsgBox "PatrolBoat has already been placed."
            Exit Sub
        End If
    Next IT
    
    ' Let the placement begin
    If Index = 0 Then
        t = 0
    ElseIf Index = 1 Then
        t = 1
    End If
    
    PlaceCarrier(t) = False
    PlaceBattleship(t) = False
    PlaceSubmarine(t) = False
    PlaceDestroyer(t) = False
    PlacePatrolBoat(t) = True
End If

End Sub

Private Sub lblStat5_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

    If shpCoordinates.Visible = False Then shpCoordinates.Visible = True
    
    shpCoordinates.Width = lblStat5(Index).Width
    shpCoordinates.Height = lblStat5(Index).Height
    
    shpCoordinates.Left = lblStat5(Index).Left
    shpCoordinates.Top = lblStat5(Index).Top
    
End Sub

Private Sub mnuMainMenu_Click()
Screen.MousePointer = vbHourglass

    frmMainMenu.tmr1.Enabled = True
    
    frmBattleship.Hide
    frmMainMenu.Show
    frmMainMenu.Left = frmBattleship.Left
    frmMainMenu.Top = frmBattleship.Top
    
Screen.MousePointer = vbDefault
End Sub

Private Sub tmr1_Timer()

    If AIDifficulty = 1 Then Call optAI1_Click
    If AIDifficulty = 2 Then Call optAI2_Click
    If AIDifficulty = 3 Then Call optAI3_Click
    If AIDifficulty = 4 Then Call optAI4_Click
    If AIDifficulty = 5 Then Call optAI5_Click
    If AIDifficulty = 6 Then Call optAI6_Click
    If AIDifficulty = 7 Then Call optAI7_Click
    
    tmr1.Enabled = False
    
End Sub

Private Sub tmrAutoStart_Timer()

    If GameOn = False And PlaceShips = False Then
        Call mnuReset_Click
        'tmrPlayerAIPlacement.Enabled = False
        'tmrPlayerAIAttack.Enabled = False
    End If
    
End Sub

Private Sub mnuCheckShip_Click()

    Print HealthCarrier(0); HealthBattleship(0); HealthSubmarine(0); HealthDestroyer(0); HealthPatrolBoat(0); ,
    Print HealthCarrier(1); HealthBattleship(1); HealthSubmarine(1); HealthDestroyer(1); HealthPatrolBoat(1)
    
End Sub

Private Sub mnuCheckShipDeath_Click()

    Print DeadPatrolBoat(0);
    Print DeadSubmarine(0);
    Print DeadDestroyer(0);
    Print DeadBattleship(0);
    Print DeadCarrier(0);
    Print:
    Print DeadPatrolBoat(1);
    Print DeadSubmarine(1);
    Print DeadDestroyer(1);
    Print DeadBattleship(1);
    Print DeadCarrier(1);
    
End Sub

Private Sub mnuCls_Click()

    Cls
    
End Sub

Private Sub mnuExit_Click()
    tmrExit.Enabled = True
    'End
End Sub

Private Sub mnuGrid_Click()

    Cls
    Print RandNum:
    
    For R = 9 To 0 Step -1
        For C = 0 To 9
            Print Grid(R, C);
        Next C
        Print:
    Next R
    
    Print:
    
    For R = 9 To 0 Step -1
        For C = 0 To 9
            Print MemoryMap(R, C);
        Next C
        Print:
    Next R
    
    Print:
    
    For R = 9 To 0 Step -1
        For C = 0 To 9
            Print MemoryMap(R, C);
        Next C
        Print:
    Next R
    
    For R = 9 To 0 Step -1
        For C = 0 To 9
        n = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
        Print imgWater(n).Tag; " ";
        Next C
        Print:
    Next R
    
End Sub


'AI PLACEMENT MAIN

Private Sub AIPlacement()
    
A:

Select Case AIDifficulty
    Case 1
        Call AIPlacementVeryEasy
    Case 2
        Call AIPlacementEasy
    Case 3
        Call AIPlacementNormal
    Case 4
        Call AIPlacementHard
    Case 5
        Call AIPlacementVeryHard
    Case 6
        Call AIPlacementUnfair
    Case 7
        Call AIPlacement7
    Case Else
        MsgBox "AI Difficulty Incorrect.", vbCritical, Error, 0, 0
        End
End Select
    
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
                        For X = 0 To 4
                            Grid2(RowTemp + X, ColTemp) = 1
                        Next X
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
                        For X = 0 To 4
                            Grid2(RowTemp - X, ColTemp) = 1
                        Next X
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
                        For X = 0 To 4
                            Grid2(RowTemp, ColTemp + X) = 1
                        Next X
                        imgCarrierH(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierH(ShipNum).Top = imgWater2(ITemp).Top
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
                        For X = 0 To 4
                            Grid2(RowTemp, ColTemp - X) = 1
                        Next X
                        imgCarrierH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgCarrierH(ShipNum).Width
                        imgCarrierH(ShipNum).Top = imgWater2(ITemp).Top
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
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
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
                        For X = 0 To 3
                            Grid2(RowTemp + X, ColTemp) = 2
                        Next X
                        imgBattleshipV(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgBattleshipV(ShipNum).Height
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
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 3 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 _
                    And Grid2(RowTemp - 3, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 3
                            Grid2(RowTemp - X, ColTemp) = 2
                        Next X
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
                        For X = 0 To 3
                            Grid2(RowTemp, ColTemp + X) = 2
                        Next X
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
                        For X = 0 To 3
                            Grid2(RowTemp, ColTemp - X) = 2
                        Next X
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
                        For X = 0 To 2
                            Grid2(RowTemp + X, ColTemp) = 3
                        Next X
                        imgSubmarineV(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgSubmarineV(ShipNum).Height
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
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
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp - X, ColTemp) = 3
                        Next X
                        imgSubmarineV(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
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
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp + X) = 3
                        Next X
                        imgSubmarineH(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
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
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp - X) = 3
                        Next X
                        imgSubmarineH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgSubmarineH(ShipNum).Width
                        imgSubmarineH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
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
                        For X = 0 To 2
                            Grid2(RowTemp + X, ColTemp) = 4
                        Next X
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
                        For X = 0 To 2
                            Grid2(RowTemp - X, ColTemp) = 4
                        Next X
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
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp + X) = 4
                        Next X
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
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp - X) = 4
                        Next X
                        imgDestroyerH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgDestroyerH(ShipNum).Width
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
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
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
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
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
                        For X = 0 To 1
                            Grid2(RowTemp + X, ColTemp) = 5
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgPatrolV(ShipNum).Height
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
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 1 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp - X, ColTemp) = 5
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top
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
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 1 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp, ColTemp + X) = 5
                        Next X
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
                        For X = 0 To 1
                            Grid2(RowTemp, ColTemp - X) = 5
                        Next X
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





' AI PLACEMENTS

Private Sub AIPlacementVeryEasy()

    Randomize
    
    If PlaceDirection(1) = False Then
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    End If
End Sub

Private Sub AIPlacementEasy()

    Randomize
    
    If PlaceDirection(1) = False Then
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    End If
End Sub

Private Sub AIPlacementNormal()

    Randomize
    
    If PlaceDirection(1) = False Then
    AICount = 0
A1:
    AICount = AICount + 1
    If AICount = 10000 Then MsgBox "Error A1": End
        I = Int(0 + (Rnd * 100))
        
        C = (I Mod 10)
        R = 10 - (I \ 10 + 1)
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
    AICount = 0
A2:
    AICount = AICount + 1
    If AICount = 10000 Then MsgBox "Error A2": End
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
End Sub

Private Sub AIPlacementHard()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
End Sub

Private Sub AIPlacementVeryHard()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
End Sub

Private Sub AIPlacementUnfair()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        C = Col
        R = Row
        
    'Check if next to Ship
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
    
End Sub

Private Sub AIPlacement7()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        C = Col
        R = Row
        
    'Check if next to Ship
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
    
End Sub





' AI EVALUATIONS

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
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
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
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
End Sub


Private Sub AIEvaluationEasy()

A:
Randomize

    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    For R = 0 To 9
        For C = 0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
                    
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 100 To -5 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    
    I = Int(0 + (Rnd * 100))
    
E:
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
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
End Sub

Private Sub AIEvaluationNormal()
    
    Randomize
    
    'I = Int(0 + (Rnd * 100))
    'Col = (I Mod 10)
    'Row = 10 - (I \ 10 + 1)
    
    Dim ShipType(1 To 5) As String
    Dim RowHitTemp As Integer
    Dim ColHitTemp As Integer
    
    ShipType(1) = HitFoundPatrolBoat
    ShipType(2) = HitFoundDestroyer
    ShipType(3) = HitFoundSubmarine
    ShipType(4) = HitFoundBattleship
    ShipType(5) = HitFoundCarrier
    
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If AIMap(R, C) = 100 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    If HitFound = True Then
    For R = 9 To 0 Step -1
        For C = 0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
            
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 300 To -5 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    End If
    I = Int(0 + (Rnd * 100))
    
E:
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
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                'HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                'HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluationHard()
    
    Randomize
    
    'I = Int(0 + (Rnd * 100))
    'Col = (I Mod 10)
    'Row = 10 - (I \ 10 + 1)
    
    Dim ShipType(1 To 5) As String
    Dim RowHitTemp As Integer
    Dim ColHitTemp As Integer
    
    ShipType(1) = HitFoundPatrolBoat
    ShipType(2) = HitFoundDestroyer
    ShipType(3) = HitFoundSubmarine
    ShipType(4) = HitFoundBattleship
    ShipType(5) = HitFoundCarrier
    
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If AIMap(R, C) = 100 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    If HitFound = True Then
    For R = 9 To 0 Step -1
        For C = 0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
            
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 400 To 1 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    End If
    
    'If no hit or probabilities, do random pick, with conditions
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
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
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                'HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                'HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluationVeryHard()
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    
    If HitFound = True Then
    For R = 9 To -0 Step -1
        For C = -0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
            
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    End If
    
    'AIProbabillity ShipLength Test
    Max1 = 9
    Min1 = 0
    
    For R = Min1 To Max1
        For C = Min1 To Max1
                
                s = 0
                
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 1
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 1
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 1
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 1
                    End If
                End If
                
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 1
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 1
                    End If
                End If
                
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                    End If
                End If
                    
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                    End If
                End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                    End If
                End If
                
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 450 To 1 Step -1
        For AICount = 0 To 3000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    
    'I = Int(0 + (Rnd * 100))
        
    'If no hit or probabilities, do random pick, with conditions
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
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
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluationUnfair()
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    
    If HitFound = True Then
    
    Max1 = 9
    Min1 = 0
    For R = Min1 To Max1
        For C = Min1 To Max1
            
            'C = (IT Mod 10)
            'R = 10 - (IT \ 10 + 1)
                
            'IndexGrid = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                'IArray(0) = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
                    
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
                
            End If
        Next C
    Next R
    
    End If
    
'{
If 1 = 1 Then
If HitFound = False Then
    'AIProbabillity ShipLength Test
    Max1 = 10
    Min1 = -1
    
    For R = Min1 To Max1
        For C = Min1 To Max1
                
                s = 0
                
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) _
            And DeadBattleship(s) = True Then
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = 0 + 40
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 20
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 10
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = 0 + 40
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 20
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 10
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) Then
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 20
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 10
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 20
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 10
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True Then
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                    End If
                End If
             End If
             
             If DeadPatrolBoat(s) = True Then
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                    End If
                End If
            End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 0, C + 1) = 0 + 10
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 1, C + 0) = 0 + 10
                    End If
                End If
                
            'Subtractor Factor
                If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                        And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (R + 0 <= Max1) And (C + 0 <= Max1) Then
                            
                            AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) - 5
                        
                End If
                
        Next C
    Next R
End If

    For R = 0 To 9
        For C = 0 To 9
            If HitFound = False Or 1 = 0 Then
                If Grid(R, C) = 7 Then
                    'HitFound = True
                    'AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) - 2
                    'AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) - 2
                    'AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) - 2
                    'AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) - 2
                    If DeadPatrolBoat(s) = False Then
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 1
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 1
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 1
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 1
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    Else
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 4
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 4
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 4
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 4
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    End If
                End If
            End If
                If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                    'HitFound = True
                    AIMap(R, C) = -500
                End If
                If Grid(R, C) = 6 Then
                    'HitFound = True
                    AIMap(R, C) = 0
                End If
                If Grid(R, C) = 7 Then
                    'HitFound = True
                    AIMap(R, C) = 0
                End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -500
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    'Get highest values
    
    For p = 1050 To -101 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
End If
'}

    'I = Int(0 + (Rnd * 100))
        
    'If no hit or probabilities, do random pick, with conditions
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
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
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluation7()
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    
    If HitFound = True Then
    
    Max1 = 9
    Min1 = 0
    For R = Min1 To Max1
        For C = Min1 To Max1
            
            'C = (IT Mod 10)
            'R = 10 - (IT \ 10 + 1)
                
            'IndexGrid = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                'IArray(0) = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 150
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 150
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 150
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 150
                    End If
                    
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 170
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 170
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 170
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 170
                    End If
                    
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
                
            End If
        Next C
    Next R
    
    End If
    
'{
If 1 = 1 Then
If HitFound = False Then
    'AIProbabillity ShipLength Test
    Max1 = 9 + 5
    Min1 = 0 - 5
    
    For R = Min1 To Max1
        For C = Min1 To Max1
                
                s = 0
                
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) _
            And DeadBattleship(s) = True Then
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = 0 + 20
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 10
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 5
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = 0 + 20
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 10
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) Then
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 5
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True Then
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
             End If
             
             If DeadPatrolBoat(s) = True Then
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
            End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 0, C + 1) = 0 + 10
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 1, C + 0) = 0 + 10
                    End If
                End If
                
            'Subtractor Factor
                If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                        And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (R + 0 <= Max1) And (C + 0 <= Max1) Then
                            
                            AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) - 5
                        
                End If
                
        Next C
    Next R
    
Else
    
    s = 0
    
    'AIProbabillity ShipLength Test
    
    Ct = (ITemp2 Mod 10)
    Rt = 10 - (ITemp2 \ 10 + 1)
        
        If DeadPatrolBoat(s) = False Then Max1 = Rt + 2: Min1 = Rt - 1
        If DeadDestroyer(s) = False Then Max1 = Rt + 3: Min1 = Rt - 2
        If DeadSubmarine(s) = False Then Max1 = Rt + 3: Min1 = Rt - 2
        If DeadBattleship(s) = False Then Max1 = Rt + 4: Min1 = Rt - 3
        If DeadCarrier(s) = False Then Max1 = Rt + 5: Min1 = Rt - 4
        
        If DeadPatrolBoat(s) = False Then Max2 = Ct + 2: Min2 = Ct - 1
        If DeadDestroyer(s) = False Then Max2 = Ct + 3: Min2 = Ct - 2
        If DeadSubmarine(s) = False Then Max2 = Ct + 3: Min2 = Ct - 2
        If DeadBattleship(s) = False Then Max2 = Ct + 4: Min2 = Ct - 3
        If DeadCarrier(s) = False Then Max2 = Ct + 5: Min2 = Ct - 4
        
    If Max1 > 9 Then Max1 = 9
    If Max2 > 9 Then Max2 = 9
    
    If Min1 < 0 Then Min1 = 0
    If Min2 < 0 Then Min2 = 0
    For R = Min1 To Max1
        For C = Min2 To Max2
                
                s = 0
                
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) _
            And DeadBattleship(s) = True Or 1 = 1 Then
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 20
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 10
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 5
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 20
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 10
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) Or 1 = 1 Then
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 5
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True Or 1 = 1 Then
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
             End If
             
             If DeadPatrolBoat(s) = True Or 1 = 1 Then
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
            End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                    End If
                End If
                
            'Subtractor Factor
                If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                        And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (R + 0 <= Max1) And (C + 0 <= Max1) Then
                            
                            AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) - 5
                        
                End If
                
        Next C
    Next R
    
End If

    For R = 0 To 9
        For C = 0 To 9
            If HitFound = False Or 1 = 0 Then
                If Grid(R, C) = 7 Then
                    'HitFound = True
                    'AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) - 2
                    'AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) - 2
                    'AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) - 2
                    'AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) - 2
                    If DeadPatrolBoat(s) = False Then
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 2
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 2
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 2
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 2
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    Else
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 4
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 4
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 4
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 4
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    End If
                End If
            End If
            
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            
            'Memory Factor ADDED
            '''AIMap(R, C) = MemoryMap(R, C) + AIMap(R, C)
             
            
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -500
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            
            If Grid(R + 1, C + 0) = 7 Then AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) - 3
            If Grid(R - 1, C + 0) = 7 Then AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) - 3
            If Grid(R + 0, C + 1) = 7 Then AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) - 3
            If Grid(R + 0, C - 1) = 7 Then AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) - 3
            
            If (Grid(R + 1, C + 0) = 7 Or Grid(R + 1, C + 0) = -1) And _
            (Grid(R - 1, C + 0) = 7 Or Grid(R - 1, C + 0) = -1) And _
            (Grid(R + 0, C + 1) = 7 Or Grid(R + 0, C + 1) = -1) And _
            (Grid(R + 0, C - 1) = 7 Or Grid(R + 0, C - 1) = -1) Then
                AIMap(R, C) = 0
            End If
            
        Next C
    Next R
    'Get highest values
    
    For p = 1050 To -101 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
End If
'}

    'I = Int(0 + (Rnd * 100))
        
    'If no hit or probabilities, do random pick, with conditions
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If HitFound = False Then ITemp2 = I
    
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
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
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
        If AIDifficulty = 7 Then Call AIEvaluation7
        End If
    End If
    
End Sub

Private Sub mnuReset_Click()

frmTarget.Show , Me
tmrTarget.Enabled = True

    Randomize
    
Screen.MousePointer = vbHourglass

    txtMoved2.Text = vbNullString
    
    RandNum = Int(0 + (Rnd * 2))
    
    For R = 0 To 9
        For C = 0 To 9
            Grid(R, C) = 0
            Grid2(R, C) = 0
        Next C
    Next R
    
    For t = 0 To 1
    lblStat1(t).Visible = True
    lblStat2(t).Visible = True
    lblStat3(t).Visible = True
    lblStat4(t).Visible = True
    lblStat5(t).Visible = True
    Next t
    
    For n = 0 To 99
            C = (n Mod 10)
            R = 10 - (n \ 10 + 1)
            l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                If Grid(R, C) = 0 Then
                    imgWater(l).Tag = "Void"
                    IndexStat(l) = vbNullString
                    IndexStatRC(R, C) = vbNullString
                End If
                If Grid2(R, C) = 0 Then
                    imgWater2(l).Tag = "Void"
                    IndexStat2(l) = vbNullString
                    IndexStatRC2(R, C) = vbNullString
                End If
        Next n
        
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
    q = 1
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
    Hit = False
    Miss = False
    
    XDefinition = 10
    YDefinition = 10
    
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
    
    imgPatrolH(t).Left = ShipDefaultPos
    imgDestroyerH(t).Left = ShipDefaultPos
    imgSubmarineH(t).Left = ShipDefaultPos
    imgBattleshipH(t).Left = ShipDefaultPos
    imgCarrierH(t).Left = ShipDefaultPos
    imgPatrolV(t).Left = ShipDefaultPos
    imgDestroyerV(t).Left = ShipDefaultPos
    imgSubmarineV(t).Left = ShipDefaultPos
    imgBattleshipV(t).Left = ShipDefaultPos
    imgCarrierV(t).Left = ShipDefaultPos
    imgPatrolH(t).Top = ShipDefaultPos
    imgDestroyerH(t).Top = ShipDefaultPos
    imgSubmarineH(t).Top = ShipDefaultPos
    imgBattleshipH(t).Top = ShipDefaultPos
    imgCarrierH(t).Top = ShipDefaultPos
    imgPatrolV(t).Top = ShipDefaultPos
    imgDestroyerV(t).Top = ShipDefaultPos
    imgSubmarineV(t).Top = ShipDefaultPos
    imgBattleshipV(t).Top = ShipDefaultPos
    imgCarrierV(t).Top = ShipDefaultPos
    
    Next t
    
    For t = 0 To 1
    lblStat1(t).BackColor = &H80000005
    lblStat2(t).BackColor = &H80000005
    lblStat3(t).BackColor = &H80000005
    lblStat4(t).BackColor = &H80000005
    lblStat5(t).BackColor = &H80000005
    lblStat1(t).FontStrikethru = False
    lblStat2(t).FontStrikethru = False
    lblStat3(t).FontStrikethru = False
    lblStat4(t).FontStrikethru = False
    lblStat5(t).FontStrikethru = False
    Next t
    
    lbl1.Caption = "Player 1's Turn"
    lbl2.Caption = "Place Your 'Aircraft Carrier'."
    PlaceShips = True
    '**
    
    Call CheckTurn
    
Screen.MousePointer = vbDefault

End Sub

Private Sub mnuShowShips_Click()

    t = 1
    imgPatrolH(t).Visible = True
    imgDestroyerH(t).Visible = True
    imgSubmarineH(t).Visible = True
    imgBattleshipH(t).Visible = True
    imgCarrierH(t).Visible = True
    imgPatrolV(t).Visible = True
    imgDestroyerV(t).Visible = True
    imgSubmarineV(t).Visible = True
    imgBattleshipV(t).Visible = True
    imgCarrierV(t).Visible = True
    
End Sub

Private Sub optAI1_Click()
optAI1.Value = True
    If optAI1.Value = True Then
        lblP2Area.Caption = "P2 " & "(" & optAI1.Caption & ")"
        
        AIDifficulty = 1
        optAI2.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI6.Value = False
        optAI7.Value = False
    End If
End Sub

Private Sub optAI2_Click()
optAI2.Value = True
    If optAI2.Value = True Then
        lblP2Area.Caption = "P2 " & "(" & optAI2.Caption & ")"
        
        AIDifficulty = 2
        optAI1.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI6.Value = False
        optAI7.Value = False
    End If
End Sub

Private Sub optAI3_Click()
optAI3.Value = True
    If optAI3.Value = True Then
        lblP2Area.Caption = "P2 " & "(" & optAI3.Caption & ")"
        
        AIDifficulty = 3
        optAI1.Value = False
        optAI2.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI6.Value = False
        optAI7.Value = False
    End If
End Sub

Private Sub optAI4_Click()
optAI4.Value = True
    If optAI4.Value = True Then
        lblP2Area.Caption = "P2 " & "(" & optAI4.Caption & ")"
        
        AIDifficulty = 4
        optAI1.Value = False
        optAI2.Value = False
        optAI3.Value = False
        optAI5.Value = False
        optAI6.Value = False
        optAI7.Value = False
    End If
End Sub

Private Sub optAI5_Click()
optAI5.Value = True
    If optAI5.Value = True Then
        lblP2Area.Caption = "P2 " & "(" & optAI5.Caption & ")"
        
        AIDifficulty = 5
        optAI1.Value = False
        optAI2.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI6.Value = False
        optAI7.Value = False
    End If
End Sub

Private Sub optAI6_Click()
optAI6.Value = True
    If optAI6.Value = True Then
        lblP2Area.Caption = "P2 " & "(" & optAI6.Caption & ")"
        
        AIDifficulty = 6
        optAI1.Value = False
        optAI2.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI7.Value = False
    End If
End Sub

Private Sub optAI7_Click()
optAI7.Value = True
    If optAI7.Value = True Then
        lblP2Area.Caption = "P2 " & "(" & optAI7.Caption & ")"
        
        AIDifficulty = 7
        optAI1.Value = False
        optAI2.Value = False
        optAI3.Value = False
        optAI4.Value = False
        optAI5.Value = False
        optAI6.Value = False
    End If
End Sub

Private Sub tmrAIAttack_Timer()
    
If GameOn = True Then
    Randomize
    
Screen.MousePointer = vbHourglass
    'tmrAIAttack.Enabled = False
    tmrAIAttack.Interval = Int(1 + (Rnd * 10))
    Call AIAttack
    'Call mnuGrid_Click
Screen.MousePointer = vbDefault

    Call MoveMouseCursor(CLng(frmBattleship.Left + imgWater(I).Left) + 240, CLng(frmBattleship.Top + imgWater(I).Top + 900), 0, 0)

End If

End Sub

Private Sub tmrAIPlacement_Timer()

Screen.MousePointer = vbHourglass
    
    Call AIPlacement

    'I = Int(0 + (Rnd * 100))
    
    'Call imgWater2_Click(I)
    
Screen.MousePointer = vbDefault

End Sub

Private Sub CheckDirection()
    'WIP
End Sub

Private Sub CheckShips()
    'Check Ships
    For s = 0 To 1
    
    If HealthCarrier(s) <= 0 And DeadCarrier(s) = False Then
            Call Sinked
        DeadCarrier(s) = True
        If s = 0 Then
            'MsgBox ("Your 'Carrier' was Destroyed")
            lblStat1(s).BackColor = vbRed
            lblStat1(s).FontStrikethru = True
            lbl2.Caption = "P1 'Carrier' is down!"
            imgCarrierH(s).Visible = True
            imgCarrierV(s).Visible = True
            HitFoundCarrier = False
            AIFoundShip = False
            HitFound = False
                
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid(R, C) = 6 And imgWater(l).Tag = "Carrier" Then
                            Grid(R, C) = -1
                        End If
                Next n
                
        End If
        If s = 1 Then
            'MsgBox ("Their 'Carrier' was Destroyed")
            lblStat1(s).BackColor = vbRed
            lblStat1(s).FontStrikethru = True
            lbl2.Caption = "P2 'Carrier' is down!"
            imgCarrierH(s).Visible = True
            imgCarrierV(s).Visible = True
                            
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid2(R, C) = 6 And imgWater2(l).Tag = "Carrier" Then
                            Grid2(R, C) = -2
                        End If
                Next n
                
        End If
    End If
    If HealthBattleship(s) <= 0 And DeadBattleship(s) = False Then
            Call Sinked
        DeadBattleship(s) = True
        If s = 0 Then
            'MsgBox ("Your 'Battleship' was Destroyed")
            lblStat2(s).BackColor = vbRed
            lblStat2(s).FontStrikethru = True
            lbl2.Caption = "P1 'Battleship' is down!"
            imgBattleshipH(s).Visible = True
            imgBattleshipV(s).Visible = True
            HitFoundBattleship = False
            AIFoundShip = False
            HitFound = False
                            
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid(R, C) = 6 And imgWater(l).Tag = "Battleship" Then
                            Grid(R, C) = -1
                        End If
                Next n
                
        End If
        If s = 1 Then
            'MsgBox ("Their 'Battleship' was Destroyed")
            lblStat2(s).BackColor = vbRed
            lblStat2(s).FontStrikethru = True
            lbl2.Caption = "P2 'Battleship' is down!"
            imgBattleshipH(s).Visible = True
            imgBattleshipV(s).Visible = True
                            
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid2(R, C) = 6 And imgWater2(l).Tag = "Battleship" Then
                            Grid2(R, C) = -2
                        End If
                Next n
                
        End If
    End If
    If HealthSubmarine(s) <= 0 And DeadSubmarine(s) = False Then
            Call Sinked
        DeadSubmarine(s) = True
        If s = 0 Then
            'MsgBox ("Your 'Submarine' was Destroyed")
            lblStat3(s).BackColor = vbRed
            lblStat3(s).FontStrikethru = True
            lbl2.Caption = "P1 'Submarine' is down!"
            imgSubmarineH(s).Visible = True
            imgSubmarineV(s).Visible = True
            HitFoundSubmarine = False
            AIFoundShip = False
            HitFound = False
                            
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid(R, C) = 6 And imgWater(l).Tag = "Submarine" Then
                            Grid(R, C) = -1
                        End If
                Next n
                
        End If
        If s = 1 Then
            'MsgBox ("Their 'Submarine' was Destroyed")
            lblStat3(s).BackColor = vbRed
            lblStat3(s).FontStrikethru = True
            lbl2.Caption = "P2 'Submarine' is down!"
            imgSubmarineH(s).Visible = True
            imgSubmarineV(s).Visible = True
                                        
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid2(R, C) = 6 And imgWater2(l).Tag = "Submarine" Then
                            Grid2(R, C) = -2
                        End If
                Next n
                
        End If
    End If
    If HealthDestroyer(s) <= 0 And DeadDestroyer(s) = False Then
            Call Sinked
        DeadDestroyer(s) = True
        If s = 0 Then
            'MsgBox ("Your 'Destroyer' was Destroyed")
            lblStat4(s).BackColor = vbRed
            lblStat4(s).FontStrikethru = True
            lbl2.Caption = "P1 'Destroyer' is down!"
            imgDestroyerH(s).Visible = True
            imgDestroyerV(s).Visible = True
            HitFoundDestroyer = False
            AIFoundShip = False
            HitFound = False
                                        
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid(R, C) = 6 And imgWater(l).Tag = "Destroyer" Then
                            Grid(R, C) = -1
                        End If
                Next n
                

        End If
        If s = 1 Then
            'MsgBox ("Their 'Destroyer' was Destroyed")
            lblStat4(s).BackColor = vbRed
            lblStat4(s).FontStrikethru = True
            lbl2.Caption = "P2 'Destroyer' is down!"
            imgDestroyerH(s).Visible = True
            imgDestroyerV(s).Visible = True
                                        
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid2(R, C) = 6 And imgWater2(l).Tag = "Destroyer" Then
                            Grid2(R, C) = -2
                        End If
                Next n
                
        End If
    End If
    If HealthPatrolBoat(s) <= 0 And DeadPatrolBoat(s) = False Then
            Call Sinked
        DeadPatrolBoat(s) = True
        If s = 0 Then
            'MsgBox ("Your 'Patrol Boat' was Destroyed")
            lblStat5(s).BackColor = vbRed
            lblStat5(s).FontStrikethru = True
            lbl2.Caption = "P1 'Patrol Boat' is down!"
            imgPatrolH(s).Visible = True
            imgPatrolV(s).Visible = True
            HitFoundPatrolBoat = False
            AIFoundShip = False
            HitFound = False
                                        
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid(R, C) = 6 And imgWater(l).Tag = "PatrolBoat" Then
                            Grid(R, C) = -1
                        End If
                Next n
                
        End If
        If s = 1 Then
            'MsgBox ("Their 'Patrol Boat' was Destroyed")
            lblStat5(s).BackColor = vbRed
            lblStat5(s).FontStrikethru = True
            lbl2.Caption = "P2 'Patrol Boat' is down!"
            imgPatrolH(s).Visible = True
            imgPatrolV(s).Visible = True
                                        
                For n = 0 To 99
                    C = (n Mod 10)
                    R = 10 - (n \ 10 + 1)
                    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                        If Grid2(R, C) = 6 And imgWater2(l).Tag = "PatrolBoat" Then
                            Grid2(R, C) = -2
                        End If
                Next n
                
        End If
    End If
        
    Next s
    
        For n = 0 To 99
            C = (n Mod 10)
            R = 10 - (n \ 10 + 1)
            l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                If Grid(R, C) = -1 Then
                    'imgWater(l).Tag = "Dead"
                    IndexStat(l) = "Dead"
                    IndexStatRC(R, C) = "Dead"
                End If
                If Grid(R, C) = 6 Then
                    'imgWater(l).Tag = "Hit"
                    IndexStat(l) = "Hit"
                    IndexStatRC(R, C) = "Hit"
                End If
                If Grid(R, C) = 7 Then
                    imgWater(l).Tag = "Miss"
                    IndexStat(l) = "Miss"
                    IndexStatRC(R, C) = "Miss"
                End If
                    
                    If Grid2(R, C) = -2 Then
                        'imgWater2(l).Tag = "Dead"
                        IndexStat2(l) = "Dead"
                        IndexStatRC2(R, C) = "Dead"
                    End If
                    If Grid2(R, C) = 6 Then
                        'imgWater2(l).Tag = "Hit"
                        IndexStat2(l) = "Hit"
                        IndexStatRC2(R, C) = "Hit"
                    End If
                    If Grid2(R, C) = 7 Then
                        imgWater2(l).Tag = "Miss"
                        IndexStat2(l) = "Miss"
                        IndexStatRC2(R, C) = "Miss"
                    End If
        Next n
    
If 1 = 0 Then
    If TurnPlayer = True Then
    For z1 = 0 To 9
    For z2 = 0 To 9
        l = ((-1 * (z1 * XDefinition)) + (XDefinition * YDefinition)) + ((z2 * 1) - XDefinition)
        If Grid(z1, z2) = -1 And imgWater(l).Picture <> LoadPicture(App.Path & "\Images\FGSunk.gif") Then _
        imgWater(l).Picture = LoadPicture(App.Path & "\Images\FGSunk.gif")
    Next z2
    Next z1
    End If
    
    If TurnAI = True Then
    For z1 = 0 To 9
    For z2 = 0 To 9
        l = ((-1 * (z1 * XDefinition)) + (XDefinition * YDefinition)) + ((z2 * 1) - XDefinition)
        If Grid2(z1, z2) = -2 And imgWater2(l).Picture <> LoadPicture(App.Path & "\Images\FGSunk.gif") Then _
        imgWater2(l).Picture = LoadPicture(App.Path & "\Images\FGSunk.gif")
    Next z2
    Next z1
    End If
End If
End Sub

Private Sub CheckForVictory()
    'Check For Victory
    s = 0
    If DeadCarrier(s) = True _
    And DeadBattleship(s) = True _
    And DeadSubmarine(s) = True _
    And DeadDestroyer(s) = True _
    And DeadPatrolBoat(s) = True Then
        GameOn = False
        'MsgBox ("'Player 2' Won.")
        
    wmpSound(3).Controls.stop
    wmpSound(3).settings.volume = 75
    wmpSound(3).Controls.play
    
        imgBG.Picture = LoadPicture(App.Path & "\Images\BGWater2.gif")
        lbl1.Caption = "Game Over!  P2 Wins!"
        P1LoseCount = P1LoseCount + 1
        lblP1Losses.Caption = "Losses: " & P1LoseCount
        P2WinCount = P2WinCount + 1
        lblP2Wins.Caption = "Wins: " & P2WinCount
        lblTurn1.ForeColor = vbRed
        lblTurn1.Caption = "________________"
        lblTurn2.ForeColor = vbRed
        lblTurn2.Caption = "________________"
        
        For t = 0 To 1
        If imgPatrolH(t).Top > imgBG.Top Then imgPatrolH(t).Visible = True
        If imgDestroyerH(t).Top > imgBG.Top Then imgDestroyerH(t).Visible = True
        If imgSubmarineH(t).Top > imgBG.Top Then imgSubmarineH(t).Visible = True
        If imgBattleshipH(t).Top > imgBG.Top Then imgBattleshipH(t).Visible = True
        If imgCarrierH(t).Top > imgBG.Top Then imgCarrierH(t).Visible = True
        If imgPatrolV(t).Top > imgBG.Top Then imgPatrolV(t).Visible = True
        If imgDestroyerV(t).Top > imgBG.Top Then imgDestroyerV(t).Visible = True
        If imgSubmarineV(t).Top > imgBG.Top Then imgSubmarineV(t).Visible = True
        If imgBattleshipV(t).Top > imgBG.Top Then imgBattleshipV(t).Visible = True
        If imgCarrierV(t).Top > imgBG.Top Then imgCarrierV(t).Visible = True
        Next t
        
        For R = 0 To 9
        For C = 0 To 9
        n = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
        Select Case imgWater(n).Tag
            'Case 1 To 5, 6, -1, -2
            Case "PatrolBoat", "Destroyer", "Submarine", "Battleship", "Carrier"
                MemoryMap(R, C) = MemoryMap(R, C) + 1
            Case Else
                If MemoryMap(R, C) > 0 Then MemoryMap(R, C) = MemoryMap(R, C) - 1
                If MemoryMap(R, C) <= 5 And MemoryMap(R, C) > 1 Then MemoryMap(R, C) = MemoryMap(R, C) - 2
        End Select
        Next C
        Next R
        
        MsgBox "'Player 2' Won.", vbOKOnly, "Game Over"
    End If
    s = 1
    If DeadCarrier(s) = True _
    And DeadBattleship(s) = True _
    And DeadSubmarine(s) = True _
    And DeadDestroyer(s) = True _
    And DeadPatrolBoat(s) = True Then
        GameOn = False
        'MsgBox ("'Player 1' Won.")
        
    wmpSound(3).Controls.stop
    wmpSound(3).settings.volume = 75
    wmpSound(3).Controls.play
    
        imgBG2.Picture = LoadPicture(App.Path & "\Images\BGWater2.gif")
        lbl1.Caption = "Game Over!  P1 Wins!"
        P2LoseCount = P2LoseCount + 1
        lblP2Losses.Caption = "Losses: " & P2LoseCount
        P1WinCount = P1WinCount + 1
        lblP1Wins.Caption = "Wins: " & P1WinCount
        lblTurn1.ForeColor = vbRed
        lblTurn1.Caption = "________________"
        lblTurn2.ForeColor = vbRed
        lblTurn2.Caption = "________________"
        
        For t = 0 To 1
        If imgPatrolH(t).Top > imgBG.Top Then imgPatrolH(t).Visible = True
        If imgDestroyerH(t).Top > imgBG.Top Then imgDestroyerH(t).Visible = True
        If imgSubmarineH(t).Top > imgBG.Top Then imgSubmarineH(t).Visible = True
        If imgBattleshipH(t).Top > imgBG.Top Then imgBattleshipH(t).Visible = True
        If imgCarrierH(t).Top > imgBG.Top Then imgCarrierH(t).Visible = True
        If imgPatrolV(t).Top > imgBG.Top Then imgPatrolV(t).Visible = True
        If imgDestroyerV(t).Top > imgBG.Top Then imgDestroyerV(t).Visible = True
        If imgSubmarineV(t).Top > imgBG.Top Then imgSubmarineV(t).Visible = True
        If imgBattleshipV(t).Top > imgBG.Top Then imgBattleshipV(t).Visible = True
        If imgCarrierV(t).Top > imgBG.Top Then imgCarrierV(t).Visible = True
        Next t
        
        For R = 0 To 9
        For C = 0 To 9
        n = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
        Select Case imgWater(n).Tag
            'Case 1 To 5, 6, -1, -2
            Case "PatrolBoat", "Destroyer", "Submarine", "Battleship", "Carrier"
                MemoryMap(R, C) = MemoryMap(R, C) + 1
            Case Else
                If MemoryMap(R, C) > 0 Then MemoryMap(R, C) = MemoryMap(R, C) - 1
                If MemoryMap(R, C) <= 5 And MemoryMap(R, C) > 1 Then MemoryMap(R, C) = MemoryMap(R, C) - 2
        End Select
        Next C
        Next R
        
        MsgBox "'Player 1' Won.", vbOKOnly, "Game Over"
    End If
    
End Sub

Private Sub CheckTurn()
    
    If TurnPlayer = True Then
        lblP1Area.BackColor = vbRed
        lblP2Area.BackColor = &H0&
        lblTurn1.ForeColor = vbGreen
        lblTurn1.Caption = "----------------------------"
        lblTurn2.ForeColor = vbRed
        lblTurn2.Caption = "________________"
        GoTo B:
    End If
    If TurnPlayer2 = True Or TurnAI = True Then
        lblP1Area.BackColor = &H0&
        lblP2Area.BackColor = vbRed
        lblTurn1.ForeColor = vbRed
        lblTurn1.Caption = "________________"
        lblTurn2.ForeColor = vbGreen
        lblTurn2.Caption = "----------------------------"
        GoTo B:
    End If
    
B:
End Sub

Private Sub ShotShip()

Randomize

    wmpSound(1).Controls.stop
    wmpSound(1).settings.volume = 35
    wmpSound(1).Controls.play
    
End Sub

Private Sub Missed()

End Sub

Private Sub Sinked()
    
Randomize

    wmpSound(0).Controls.stop
    wmpSound(0).settings.volume = 35
    wmpSound(0).Controls.play
    
End Sub

Private Sub RowColToIndex()
    'convert Map to Index
    l = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
    
End Sub

Private Sub tmrBlinker_Timer()

With lbl2
If GameOn = False Then
    If .BackColor = &H0& Then
        .BackColor = &HFF&
        tmrBlinker.Interval = 1000
    GoTo B:
    End If
    
    If .BackColor = &HFF& Then
        .BackColor = &H0&
        tmrBlinker.Interval = 4000
    GoTo B:
    End If

Else
    .BackColor = &H0&
    GoTo B:
End If
End With
B:

End Sub

Private Sub tmrDisable_Timer()

    mnuCls.Visible = False
    mnuGrid.Visible = False
    
    mnuShowShips.Visible = False
    mnuCheckShipDeath.Visible = False
    mnuCheckShip.Visible = False
    tmrDisable.Enabled = False
    
End Sub

Private Sub tmrExit_Timer()

    If frmMainMenu.wmpBGM.settings.volume > 0 Then
        frmMainMenu.wmpBGM.settings.volume = frmMainMenu.wmpBGM.settings.volume - 1
    Else
        End
    End If
    
End Sub

Private Sub tmrMoves_Timer()

If PlaceShips = True Then Label2.Caption = "Active:  " & "Placement"
If PlaceShips = False Then Label2.Caption = "Active:  " & "Shoot"

If TurnPlayer = True Then
    t = 0
    If PlaceShips = True Then cmd2(t).Enabled = True: cmd1(t).Enabled = True: cmdAutoAIplace(t).Enabled = True
    If PlaceShips = False Then cmd2(t).Enabled = False: cmd1(t).Enabled = False: cmdAutoAIplace(t).Enabled = False
    
    t = 1
    If PlaceShips = True Then cmd2(t).Enabled = False: cmd1(t).Enabled = False
End If
If TurnPlayer2 = True Or TurnAI = True Then
    t = 1
    If PlaceShips = True Then cmd2(t).Enabled = True: cmd1(t).Enabled = True
    If PlaceShips = False Then cmd2(t).Enabled = False: cmd1(t).Enabled = False
    
    t = 0
    If PlaceShips = True Then cmd2(t).Enabled = False: cmd1(t).Enabled = False: cmdAutoAIplace(t).Enabled = False
End If

MoveNum(1) = 0
MoveNum(2) = 0

    For R = 0 To 9
    For C = 0 To 9
        
        If Grid(R, C) <> 0 _
        And Grid(R, C) <> 1 _
        And Grid(R, C) <> 2 _
        And Grid(R, C) <> 3 _
        And Grid(R, C) <> 4 _
        And Grid(R, C) <> 5 Then
            MoveNum(1) = MoveNum(1) + 1
        End If
        
        If Grid2(R, C) <> 0 _
        And Grid2(R, C) <> 1 _
        And Grid2(R, C) <> 2 _
        And Grid2(R, C) <> 3 _
        And Grid2(R, C) <> 4 _
        And Grid2(R, C) <> 5 Then
            MoveNum(2) = MoveNum(2) + 1
        End If
        
    Next C
    Next R
    
    lblMoves(0).Caption = "Moves Made: " & MoveNum(1)
    lblMoves(1).Caption = "Moves Made: " & MoveNum(2)
    
    
    'optionals
    If TurnPlayer = True Then
        If Shape1.Left <> imgBG.Left Then Shape1.Left = imgBG.Left
        If Shape1.Top <> imgBG.Top Then Shape1.Top = imgBG.Top
    End If
    
    If TurnAI = True Then
        If Shape1.Left <> imgBG2.Left Then Shape1.Left = imgBG2.Left
        If Shape1.Top <> imgBG2.Top Then Shape1.Top = imgBG2.Top
    End If
    
    If PlaceShips = True Then
        Shape1.BorderColor = &HFF&
    ElseIf PlaceShips = False Then
        Shape1.BorderColor = &HFFFF&
    End If
    
End Sub

Private Sub tmrPlayerAIAttack_Timer()


A:
    
    Randomize
    
    s = 1
    
AA:
    'Check all spaces
    I = Int(0 + (Rnd * 100))

    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    AICount = AICount + 1
        If AICount >= 100 Then
            AICount = 0
            GoTo AAA:
        End If
        
        '-1 = Checked, 0 = Not Yet Checked, 1 = Is a Hit, 2 = N/A
        
        If AIMap(I, 0) = 0 _
        Or AIMap(I, 0) = -1 Then
            'AIMap(I, 0) = -1
            'GoTo A:
        End If
        
        If AIMap(I, 0) = 1 Then
            'GoTo A:
        End If
        
        If AIMap(I, 0) = 2 Then
            'GoTo A:
        End If
        
    
AAA:
    
    'Call MoveMouseCursor(CLng(frmBattleship.Left + imgWater2(I).Left) + 240, CLng(frmBattleship.Top + imgWater2(I).Top + 900), 0, 0)
    Call imgWater2_MouseUp(I, 1, 0, imgWater2(I).Left, imgWater2(I).Top)
    
End Sub

Private Sub tmrPlayerAIPlacement_Timer()

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
    
    'Call MoveMouseCursor(CLng(frmBattleship.Left + imgWater(i).Left), CLng(frmBattleship.Top + imgWater(i).Top), 0, 0)
    n = 0
        IT = Int((Rnd * 5) + 1)
        Select Case IT
            Case 1
                Call lblStat1_Click(n)
            Case 2
                Call lblStat2_Click(n)
            Case 3
                Call lblStat3_Click(n)
            Case 4
                Call lblStat4_Click(n)
            Case 5
                Call lblStat5_Click(n)
        End Select
    
    Call imgWater_MouseUp(I, 1, 0, 0, 0)
    
    If PlacePatrolBoat(1) = False And GameOn = True Then
        'If cmd1.Enabled = False Then tmrPlayerAIPlacement.Enabled = False
        'cmd1.Enabled = True
        '''tmrPlayerAIAttack.Enabled = True
    End If
End Sub

Private Sub SaveData()



End Sub

Private Sub tmrTarget_Timer()
    
    If GameOn = False Then
        frmTarget.Top = frmBattleship.Top + 780
        frmTarget.Left = frmBattleship.Left + 120
        frmTarget.Visible = False
        frmTarget.Hide
    Else
        frmTarget.Show , Me
        frmTarget.Visible = True
        frmBattleship.Show
        tmrTarget.Enabled = False
    End If
    
End Sub

