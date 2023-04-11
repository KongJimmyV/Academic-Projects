VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form frmMainMenu 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Main Menu"
   ClientHeight    =   9345
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   13455
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   Picture         =   "frmMainMenu.frx":0000
   ScaleHeight     =   11015.61
   ScaleMode       =   0  'User
   ScaleWidth      =   13605
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmrMusicLoop 
      Interval        =   15
      Left            =   1200
      Top             =   4200
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "Back"
      Height          =   735
      Left            =   5160
      TabIndex        =   8
      Top             =   6360
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Start"
      Height          =   735
      Left            =   7080
      TabIndex        =   7
      Top             =   6360
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Frame fraAI 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   3135
      Left            =   5160
      TabIndex        =   2
      Top             =   3000
      Visible         =   0   'False
      Width           =   3135
      Begin VB.OptionButton optInsane 
         BackColor       =   &H00000000&
         Caption         =   "Insane"
         ForeColor       =   &H000080FF&
         Height          =   495
         Left            =   240
         TabIndex        =   11
         Top             =   2400
         Width           =   2775
      End
      Begin VB.OptionButton optHard 
         BackColor       =   &H00000000&
         Caption         =   "Hard"
         ForeColor       =   &H000000FF&
         Height          =   495
         Left            =   240
         TabIndex        =   5
         Top             =   1800
         Width           =   2775
      End
      Begin VB.OptionButton optNormal 
         BackColor       =   &H00000000&
         Caption         =   "Normal"
         ForeColor       =   &H0000FFFF&
         Height          =   495
         Left            =   240
         TabIndex        =   4
         Top             =   1200
         Width           =   2775
      End
      Begin VB.OptionButton optEasy 
         BackColor       =   &H00000000&
         Caption         =   "Easy"
         ForeColor       =   &H0000FF00&
         Height          =   495
         Left            =   240
         TabIndex        =   3
         Top             =   600
         Width           =   2535
      End
      Begin VB.Label lblAI 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Pick AI Difficulty"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   360
         TabIndex        =   6
         Top             =   240
         Width           =   2415
      End
   End
   Begin VB.CommandButton cmdVS 
      Caption         =   "Player vs. Player"
      Height          =   975
      Left            =   7920
      TabIndex        =   1
      Top             =   5400
      Width           =   1695
   End
   Begin VB.CommandButton cmdSingle 
      Caption         =   "Player vs. AI"
      Height          =   975
      Left            =   3840
      TabIndex        =   0
      Top             =   5400
      Width           =   1695
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpSound 
      Height          =   735
      Left            =   0
      TabIndex        =   10
      Top             =   8640
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
      _cy             =   1296
   End
   Begin VB.Label lblPickMode 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Mode Selection"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   5520
      TabIndex        =   9
      Top             =   2880
      Width           =   2415
   End
End
Attribute VB_Name = "frmMainMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdBack_Click()

    fraAI.Visible = False
    cmdBack.Visible = False
    cmdStart.Visible = False
    cmdSingle.Visible = True
    cmdVS.Visible = True
    lblPickMode.Visible = True
    
End Sub

Private Sub cmdSingle_Click()

    fraAI.Visible = True
    cmdBack.Visible = True
    cmdStart.Visible = True
    cmdSingle.Visible = False
    cmdVS.Visible = False
    lblPickMode.Visible = False
    
End Sub

Private Sub cmdStart_Click()


    If optEasy.Value = True Then                       'Easy AI
        frmMainMenu.Visible = False
        frmLauncherGameAIEasy.Enabled = True
        frmLauncherGameAIEasy.Visible = True
    End If
        
    If optNormal.Value = True Then                     'Normal AI
        frmMainMenu.Visible = False
        frmLauncherGameAINormal.Enabled = True
        frmLauncherGameAINormal.Visible = True
    End If
        
    If optHard.Value = True Then                       'Hard AI
        frmMainMenu.Visible = False
        frmLauncherGameAIHard.Enabled = True
        frmLauncherGameAIHard.Visible = True
    End If

End Sub

Private Sub cmdVS_Click()

    frmMainMenu.Visible = False
    frmLauncherGameVS.Enabled = True
    frmLauncherGameVS.Visible = True
    
End Sub

Private Sub Form_Activate()

    fraAI.Visible = False
    cmdBack.Visible = False
    cmdStart.Visible = False
    cmdSingle.Visible = True
    cmdVS.Visible = True
    lblPickMode.Visible = True

End Sub

Private Sub Form_Load()

Dim file1() As Byte
file1 = LoadResData(104, "CUSTOM")
Open "C:\" & "\Desciple.mp3" For Binary As #1
Put #1, , file1
Close #1

wmpSound.URL = "C:\" & "\Desciple.mp3"
wmpSound.settings.volume = 35
End Sub

Private Sub tmrMusicLoop_Timer()

    wmpSound.Controls.play

End Sub
