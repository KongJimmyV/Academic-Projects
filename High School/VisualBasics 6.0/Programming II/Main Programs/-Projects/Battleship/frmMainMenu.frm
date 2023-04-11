VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form frmMainMenu 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Battleship"
   ClientHeight    =   10095
   ClientLeft      =   45
   ClientTop       =   675
   ClientWidth     =   13335
   Icon            =   "frmMainMenu.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmMainMenu.frx":1182
   ScaleHeight     =   10095
   ScaleWidth      =   13335
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmr1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4440
      Top             =   1560
   End
   Begin VB.Frame fraMainMenu 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   7215
      Left            =   4320
      TabIndex        =   1
      Top             =   1440
      Width           =   5175
      Begin VB.ListBox lstGamemode 
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H00000000&
         Height          =   3960
         ItemData        =   "frmMainMenu.frx":3BA66
         Left            =   240
         List            =   "frmMainMenu.frx":3BA68
         TabIndex        =   8
         Top             =   2880
         Width           =   2175
      End
      Begin VB.Timer tmrMusicOI 
         Interval        =   25
         Left            =   120
         Top             =   2040
      End
      Begin VB.CommandButton cmd2 
         Caption         =   "Quit Game"
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
         Left            =   840
         Picture         =   "frmMainMenu.frx":3BA6A
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   1800
         Width           =   1215
      End
      Begin VB.Timer tmrExit 
         Enabled         =   0   'False
         Interval        =   50
         Left            =   4680
         Top             =   120
      End
      Begin VB.CommandButton cmd3 
         Caption         =   "Music: ON"
         BeginProperty Font 
            Name            =   "MS Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   840
         Picture         =   "frmMainMenu.frx":816CA
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   2280
         Width           =   735
      End
      Begin VB.CommandButton cmd1 
         Caption         =   "Start Game"
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
         Left            =   840
         Picture         =   "frmMainMenu.frx":C732A
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   1440
         Width           =   1215
      End
      Begin VB.ListBox lstDifficulty 
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H00000000&
         Height          =   3960
         ItemData        =   "frmMainMenu.frx":10CF8A
         Left            =   2760
         List            =   "frmMainMenu.frx":10CF8C
         TabIndex        =   2
         Top             =   2880
         Width           =   2175
      End
      Begin VB.Label lbl2 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Gamemode: "
         BeginProperty Font 
            Name            =   "MS Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   960
         Width           =   4695
      End
      Begin VB.Label lbl1 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Difficulty: "
         BeginProperty Font 
            Name            =   "MS Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   4695
      End
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpBGM 
      Height          =   600
      Left            =   120
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   120
      Visible         =   0   'False
      Width           =   780
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
      uiMode          =   "none"
      stretchToFit    =   0   'False
      windowlessVideo =   -1  'True
      enabled         =   0   'False
      enableContextMenu=   0   'False
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   1376
      _cy             =   1058
   End
   Begin VB.Shape Shape2 
      BorderStyle     =   4  'Dash-Dot
      Height          =   855
      Left            =   5040
      Top             =   480
      Width           =   3735
   End
   Begin VB.Shape Shape1 
      BorderStyle     =   4  'Dash-Dot
      Height          =   7455
      Left            =   4200
      Top             =   1320
      Width           =   5415
   End
   Begin VB.Label lbl0 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Caption         =   "BATTLESHIP"
      BeginProperty Font 
         Name            =   "Footlight MT Light"
         Size            =   27
         Charset         =   0
         Weight          =   300
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   600
      Left            =   5160
      TabIndex        =   5
      Top             =   600
      Width           =   3495
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
End
Attribute VB_Name = "frmMainMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd1_Click()

Screen.MousePointer = vbHourglass

    Select Case lstDifficulty
        Case "00 - None(PvP)"
            AIDifficulty = 0
        Case "01 - Very Easy"
            AIDifficulty = 1
        Case "02 - Easy"
            AIDifficulty = 2
        Case "03 - Normal"
            AIDifficulty = 3
        Case "04 - Hard"
            AIDifficulty = 4
        Case "05 - Very Hard"
            AIDifficulty = 5
        Case "06 - Expert"
            AIDifficulty = 6
        Case "07 - Tactical"
            AIDifficulty = 7
        Case "%% - Pattern-Optimized"
            AIDifficulty = 9999
        Case Else
            AIDifficulty = -1
    End Select
    Select Case lstGamemode
        Case "01 - Turn-Based Shots"
            Gamemode = 0
                'Set Gamemode Up
                NumOfShotsLeft(0) = 1
                NumOfShotsLeft(1) = 1
        Case "02 - Hit-Based Shots"
            Gamemode = 1
                'Set Gamemode Up
                NumOfShotsLeft(0) = 1
                NumOfShotsLeft(1) = 1
        Case "03 - Multiple Shots"
            Gamemode = 2
                'Set Gamemode Up
                NumOfShotsLeft(0) = 5
                NumOfShotsLeft(1) = 5
        Case "04 - Ships-Based Shots"
            Gamemode = 3
                'Set Gamemode Up
                NumOfShotsLeft(0) = NumOfShipsLeft(0)
                NumOfShotsLeft(1) = NumOfShipsLeft(1)
        Case "05 - Memory-Based Shooting"
            Gamemode = 4
                'Set Gamemode Up
                NumOfShotsLeft(0) = 1
                NumOfShotsLeft(1) = 1
        Case Else
            Gamemode = -1
    End Select
    If AIDifficulty <> -1 And Gamemode <> -1 Then
    
    'frmMainMenu.Hide
    frmBattleship.Show
    frmMainMenu.Hide
    
        frmBattleship.Left = frmMainMenu.Left
        frmBattleship.Top = frmMainMenu.Top
        frmBattleship.tmr1.Enabled = True
    Else
        MsgBox "Select a difficulty/gamemode.", vbCritical, "Error"
    End If
    
Screen.MousePointer = vbDefault

End Sub

Private Sub cmd2_Click()
    tmrExit.Enabled = True

End Sub

Private Sub cmd3_Click()

If 1 = 0 Then
    If wmpBGM.settings.volume = 0 Then
    
    wmpBGM.settings.volume = 55
    cmd3.Caption = "Music: ON"
    
    Else
    
    wmpBGM.settings.volume = 0
    cmd3.Caption = "Music: OFF"
    
    End If
End If

    If MusicBGM = 1 Then
    
    MusicBGM = 0
    cmd3.Caption = "Music: OFF"
    
    ElseIf MusicBGM = 0 Then
    
    MusicBGM = 1
    cmd3.Caption = "Music: ON"
    
    End If
    
    tmrMusicOI.Enabled = True
    
End Sub

Private Sub Form_Load()

    MusicBGM = 1
    
    AIDifficulty = 3
    tmr1.Enabled = True
    
    wmpBGM.URL = App.Path & "\FX\Music\" & "Mittsies - Exordium - 14 Nox.mp3"
    wmpBGM.settings.setMode "loop", True
    wmpBGM.settings.volume = 55
    
    'MainMenu Init
    lstDifficulty.AddItem "*** Difficulty ***"
    lstDifficulty.AddItem ""
    lstDifficulty.AddItem "00 - None(PvP)"
    lstDifficulty.AddItem "01 - Very Easy"
    lstDifficulty.AddItem "02 - Easy"
    lstDifficulty.AddItem "03 - Normal"
    lstDifficulty.AddItem "04 - Hard"
    lstDifficulty.AddItem "05 - Very Hard"
    lstDifficulty.AddItem "06 - Expert"
    lstDifficulty.AddItem "07 - Tactical"
    lstDifficulty.AddItem "%% - Pattern-Optimized"
    
    lstGamemode.AddItem "*** Game Mode ***"
    lstGamemode.AddItem ""
    lstGamemode.AddItem "01 - Turn-Based Shots"
    lstGamemode.AddItem "02 - Hit-Based Shots"
    lstGamemode.AddItem "03 - Multiple Shots"
    lstGamemode.AddItem "04 - Ships-Based Shots"
    lstGamemode.AddItem "05 - Memory-Based Shooting"
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
End

End Sub

Private Sub lstDifficulty_Click()
    Select Case lstDifficulty
        Case "00 - None(PvP)"
            AIDifficulty = 0
            lbl1.Caption = "Difficulty: " & "None(PvP)"
        Case "01 - Very Easy"
            AIDifficulty = 1
            lbl1.Caption = "Difficulty: " & "Very Easy"
        Case "02 - Easy"
            AIDifficulty = 2
            lbl1.Caption = "Difficulty: " & "Easy"
        Case "03 - Normal"
            AIDifficulty = 3
            lbl1.Caption = "Difficulty: " & "Normal"
        Case "04 - Hard"
            AIDifficulty = 4
            lbl1.Caption = "Difficulty: " & "Hard"
        Case "05 - Very Hard"
            AIDifficulty = 5
            lbl1.Caption = "Difficulty: " & "Very Hard"
        Case "06 - Expert"
            AIDifficulty = 6
            lbl1.Caption = "Difficulty: " & "Expert"
        Case "07 - Tactical"
            AIDifficulty = 7
            lbl1.Caption = "Difficulty: " & "Tactical"
        Case "%% - Evolutional"
            AIDifficulty = 9999
            lbl1.Caption = "Difficulty: " & "Pattern-Optimized"
        Case Else
            AIDifficulty = -1
            lbl1.Caption = "Difficulty: " & "N/A"
    End Select
End Sub

Private Sub lstGamemode_Click()
    Select Case lstGamemode
        Case "01 - Turn-Based Shots"
            Gamemode = 0
            lbl2.Caption = "Gamemode: " & "Turn-Based Shots"
        Case "02 - Hit-Based Shots"
            Gamemode = 1
            lbl2.Caption = "Gamemode: " & "Hit-Based Shots"
        Case "03 - Multiple Shots"
            Gamemode = 2
            lbl2.Caption = "Gamemode: " & "Multiple Shots"
        Case "04 - Ships-Based Shots"
            Gamemode = 3
            lbl2.Caption = "Gamemode: " & "Ships-Based Shots"
        Case "05 - Memory-Based Shooting"
            Gamemode = 4
            lbl2.Caption = "Gamemode: " & "Memory-Based Shooting"
        Case Else
            Gamemode = -1
            lbl2.Caption = "Gamemode: " & "N/A"
    End Select
End Sub

Private Sub mnuExit_Click()
tmrExit.Enabled = True
'End

End Sub

Private Sub tmr1_Timer()

Select Case AIDifficulty
        Case 0
            AIDifficulty = 0
            lbl1.Caption = "Difficulty: " & "None(PvP)"
            lstDifficulty.ListIndex = -1 + 3
        Case 1
            AIDifficulty = 1
            lbl1.Caption = "Difficulty: " & "Very Easy"
            lstDifficulty.ListIndex = 0 + 3
        Case 2
            AIDifficulty = 2
            lbl1.Caption = "Difficulty: " & "Easy"
            lstDifficulty.ListIndex = 1 + 3
        Case 3
            AIDifficulty = 3
            lbl1.Caption = "Difficulty: " & "Normal"
            lstDifficulty.ListIndex = 2 + 3
        Case 4
            AIDifficulty = 4
            lbl1.Caption = "Difficulty: " & "Hard"
            lstDifficulty.ListIndex = 3 + 3
        Case 5
            AIDifficulty = 5
            lbl1.Caption = "Difficulty: " & "Very Hard"
            lstDifficulty.ListIndex = 4 + 3
        Case 6
            AIDifficulty = 6
            lbl1.Caption = "Difficulty: " & "Expert"
            lstDifficulty.ListIndex = 5 + 3
        Case 7
            AIDifficulty = 7
            lbl1.Caption = "Difficulty: " & "Tactical"
            lstDifficulty.ListIndex = 6 + 3
        Case 9999
            AIDifficulty = 9999
            lbl1.Caption = "Difficulty: " & "Pattern-Optimized"
            lstDifficulty.ListIndex = 7 + 3
        Case Else
            AIDifficulty = 0
            lbl1.Caption = "Difficulty: " & "N/A"
            lstDifficulty.ListIndex = 1
    End Select
    
    
Select Case Gamemode
        Case 0
            Gamemode = 0
            lbl2.Caption = "Gamemode: " & "Turn-Based Shots"
            lstGamemode.ListIndex = 0 + 2
        Case 1
            Gamemode = 1
            lbl2.Caption = "Gamemode: " & "Hit-Based Shots"
            lstGamemode.ListIndex = 1 + 2
        Case 2
            Gamemode = 2
            lbl2.Caption = "Gamemode: " & "Multiple Shots"
            lstGamemode.ListIndex = 2 + 2
        Case 3
            Gamemode = 3
            lbl2.Caption = "Gamemode: " & "Ships-Based Shots"
            lstGamemode.ListIndex = 3 + 2
        Case 4
            Gamemode = 4
            lbl2.Caption = "Gamemode: " & "Memory-Based Shooting"
            lstGamemode.ListIndex = 4 + 2
        Case Else
            Gamemode = -1
            lbl2.Caption = "Gamemode: " & "N/A"
            lstGamemode.ListIndex = 1
    End Select
    
    tmr1.Enabled = False
    
End Sub

Private Sub tmrExit_Timer()

    If wmpBGM.settings.volume > 0 Then
        wmpBGM.settings.volume = wmpBGM.settings.volume - 1
    Else
        End
    End If
    
End Sub

Private Sub tmrMusicOI_Timer()

    
    If MusicBGM = 0 And wmpBGM.settings.volume > 0 Then
        wmpBGM.settings.volume = wmpBGM.settings.volume - 1
        If wmpBGM.settings.volume = 0 Then tmrMusicOI.Enabled = False
    ElseIf MusicBGM = 1 And wmpBGM.settings.volume < 55 Then
        wmpBGM.settings.volume = wmpBGM.settings.volume + 1
        If wmpBGM.settings.volume = 55 Then tmrMusicOI.Enabled = False
    End If
    
End Sub
