VERSION 5.00
Begin VB.Form frmLoadingScreen 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Loading..."
   ClientHeight    =   6750
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   10800
   Icon            =   "frmLoadingScreen.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "frmLoadingScreen.frx":0CCA
   ScaleHeight     =   6750
   ScaleWidth      =   10800
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmrSet2StartGame 
      Enabled         =   0   'False
      Interval        =   150
      Left            =   1680
      Top             =   6000
   End
   Begin VB.Timer tmrSet1Init 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   960
      Top             =   6000
   End
   Begin VB.Timer tmrLoading 
      Interval        =   1000
      Left            =   720
      Top             =   240
   End
   Begin VB.Label lbl 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "12345ABCDE"
      BeginProperty Font 
         Name            =   "Segoe UI"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   3000
      Width           =   10215
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblLoading 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Loading..."
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   240
      TabIndex        =   0
      Top             =   1200
      Width           =   10215
   End
End
Attribute VB_Name = "frmLoadingScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim NCount As Integer
Dim LCount As Integer
Dim t As Integer
Dim C As Integer

Private Sub Form_Load()

    XMaze = XTemp
    YMaze = YTemp
    NumBomb = BTemp
    'IntFactor = 200
    
    
    
    lbl.Caption = ">>>Initiating Game<<<"
    tmrLoading.Enabled = True
    tmrSet1Init.Enabled = True
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub tmrLoading_Timer()

    If NCount Mod 3 = 0 Then
    lblLoading.Caption = "Loading..."
    End If
    
    If NCount Mod 3 = 1 Then
    lblLoading.Caption = "Loading.."
    End If
    
    If NCount Mod 3 = 2 Then
    lblLoading.Caption = "Loading."
    End If
    
    If NCount >= 3 Then NCount = 0
    NCount = NCount + 1
    
End Sub

Private Sub tmrSet1Init_Timer()

    Randomize
    
'Start Initiation

    Screen.MousePointer = vbHourglass
    
    For R = 0 - 1 To XMaze + 1
        For C = 0 - 1 To YMaze + 1
            Maze(R, C) = -30000
        Next C
    Next R
    
    frmMinesweeper.tmr1Time.Enabled = False
    IsBomb = False
    
    tmrSet1Init.Enabled = False
    
    lbl.Caption = ">>>Initiating Game<<<"
    
    'Step 1: Load Images
    With frmMinesweeper
        .imgFace.Picture = LoadPicture(App.Path & "\Images\Face1.bmp")
        For t = 0 To -1 + (XMaze * YMaze)
            .imgCell(t).Height = DefaultCellSize
            .imgCell(t).Width = DefaultCellSize
            .imgCell(t).Visible = False
            .imgCell(t).Enabled = False
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
        Next t
    End With
    
    'Step 2: Array Images
    For i = 0 To (-1 + (XMaze * YMaze))
        With frmMinesweeper
            'C = (i Mod XMaze)
            'R = YMaze - (i \ XMaze + 1)
            Maze(YMaze - (i \ YMaze + 1), i Mod XMaze + 1) = 1
            'Maze(R, C) = 1
            .imgCell(i).Tag = ""
            .imgCell(i).Visible = True
            .imgCell(i).Enabled = True
            .imgCell(i).Left = IntFactor + .imgCell(0).Width * (i Mod XMaze)   ' * (i Mod YMaze + 1 - 1)
            .imgCell(i).Top = IntFactor + .imgCell(0).Height * (i \ XMaze) + (.shpBox.Height + .shpBox.BorderWidth * 6) ' * (i \ XMaze + 1 - 1)
        End With
    Next i
    
    'Step 3: Set Form/Other Size
    With frmMinesweeper
        .Width = IntFactor + (.imgCell(0).Width * (XMaze)) + IntFactor + 95
        .Height = IntFactor + (.imgCell(0).Height * (YMaze)) + IntFactor + 725 + .shpBox.Height + .shpBox2.Height
        
        .shpBox.Left = 0
        .shpBox.Top = 0
        .shpBox.Width = IntFactor + (.imgCell(0).Width * (XMaze)) + IntFactor + 10
        
        .shpBox2.Left = 0
        .shpBox2.Top = .ScaleHeight - .shpBox2.Height
        .shpBox2.Width = IntFactor + (.imgCell(0).Width * (XMaze)) + IntFactor + 10
        
        .imgFace.Left = (.shpBox.Width / 2) - .imgFace.Width / 2
        .imgFace.Top = (.shpBox.Height / 2) - .imgFace.Height / 2
        
        .lbl1Time.Left = IntFactor - (IntFactor / 2)
        .lbl1Time.Top = .ScaleHeight - (.shpBox2.Height / 2) - .lbl1Time.Height / 2
        
        .lbl2Flags.Left = (.shpBox.Width) - .lbl2Flags.Width - IntFactor + (IntFactor / 2)
        .lbl2Flags.Top = .ScaleHeight - (.shpBox2.Height / 2) - .lbl2Flags.Height / 2
        
        .cmdAI.Left = .ScaleWidth - (.shpBox2.Width / 2) - .cmdAI.Width / 2
        .cmdAI.Top = .ScaleHeight - (.shpBox2.Height / 2) - .cmdAI.Height / 2
    End With
    
    'Step 4: Set Bombs
    With frmMinesweeper
    
    BombCountTemp = BTemp
A:

        i = Int(Rnd * (0 + (XMaze * YMaze)))
        
        'Check If Bomb
        If .imgCell(i).Tag <> "cBomb" Then
            .imgCell(i).Tag = "cBomb"
            BombCountTemp = BombCountTemp - 1
        Else
            GoTo A:
        End If
        
        If BombCountTemp > 0 Then
            GoTo A:
        End If
        
    End With
    
    'Step 5: Set Grid System
    With frmMinesweeper
        
        For i = 0 To -1 + (XMaze * YMaze)
            C = (i Mod XMaze)
            R = YMaze - (i \ XMaze + 1)
            If .imgCell(i).Tag = "" Then
                Maze(R, C) = 1
            End If
            If .imgCell(i).Tag = "cBomb" Then
                Maze(R, C) = 2
            End If
        Next i
        
    End With
    
    'Step 6: Cells Left Variable
    nCellsLeft = (XMaze * YMaze) - NumBomb
    
    'Step 7: Reset Zone Values
    With frmMinesweeper
        For i = 0 To -1 + (XMaze * YMaze)
            C = (i Mod XMaze)
            R = YMaze - (i \ XMaze + 1)
            zoneValue(R, C) = 0
        Next i
    End With
    
    'Step 8: Set Zone Values
    
    '****//
    For i = 0 To -1 + (XMaze * YMaze)
    C = (i Mod XMaze)
    R = YMaze - (i \ XMaze + 1)
    
    'zoneValue(R, C) = 0
    
    If Maze(R, C) = 1 Then
    If Maze(R + -1, C + -1) = 2 Or Maze(R + -1, C + -1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 0, C + -1) = 2 Or Maze(R + 0, C + -1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 1, C + -1) = 2 Or Maze(R + 1, C + -1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    ''''''''''''''''''''''''''''''''''''''''''''''//
    If Maze(R + -1, C + 0) = 2 Or Maze(R + -1, C + 0) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    'If Maze(R + 0, C + 0) = 2 Or Maze(R + 0, C + 0) = -25 Then
    '    zoneValue(R, C) = zoneValue(R, C) + 1
    'End If
    If Maze(R + 1, C + 0) = 2 Or Maze(R + 1, C + 0) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    ''''''''''''''''''''''''''''''''''''''''''''''//
    If Maze(R + -1, C + 1) = 2 Or Maze(R + -1, C + 1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 0, C + 1) = 2 Or Maze(R + 0, C + 1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 1, C + 1) = 2 Or Maze(R + 1, C + 1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    End If
    '****//
    For zoneCount = 1 To 8
        If zoneValue(R, C) = zoneCount Then
            Maze(R, C) = zoneCount + 5000
        End If
    Next zoneCount
    
    Next i
    
    'Step X: Start Game
        Sec(0) = 0
        Sec(1) = 0
        Min(0) = 0
        Min(1) = 0
        Hr(0) = 0
        Hr(1) = 0
    frmMinesweeper.lbl1Time.Caption = Hr(1) & Hr(0) & ":" & Min(1) & Min(0) & ":" & Sec(1) & Sec(0)
    nFlags(0) = BTemp
    frmMinesweeper.lbl2Flags.Caption = nFlags(0)
    GameOn = True
    
    tmrLoading.Enabled = False
    lblLoading.Caption = "Minesweeper"
    lbl.Caption = ">>>Good Luck<<<"
    Screen.MousePointer = vbDefault
    tmrSet2StartGame.Enabled = True
    
End Sub

Private Sub tmrSet2StartGame_Timer()
    
    Screen.MousePointer = vbDefault
    tmrSet2StartGame.Enabled = False
    frmLoadingScreen.Hide
    frmMinesweeper.Visible = True
    
End Sub
