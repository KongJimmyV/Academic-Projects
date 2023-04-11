VERSION 5.00
Begin VB.Form frmOptions 
   Caption         =   "Options"
   ClientHeight    =   4350
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   4350
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer t1 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   120
      Top             =   120
   End
   Begin VB.Frame fraOp 
      Caption         =   "Options"
      Height          =   3255
      Left            =   600
      TabIndex        =   0
      Top             =   480
      Width           =   3135
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   2040
         TabIndex        =   5
         Top             =   2760
         Width           =   975
      End
      Begin VB.CommandButton cmdOk 
         Caption         =   "Ok"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   2760
         Width           =   975
      End
      Begin VB.TextBox txtCMines 
         Height          =   375
         Left            =   1560
         TabIndex        =   3
         Top             =   2160
         Width           =   1455
      End
      Begin VB.TextBox txtCHeight 
         Height          =   375
         Left            =   1560
         TabIndex        =   2
         Top             =   1320
         Width           =   1455
      End
      Begin VB.TextBox txtCLength 
         Height          =   375
         Left            =   1560
         TabIndex        =   1
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label Label2 
         Caption         =   "# of Mines"
         Height          =   375
         Left            =   240
         TabIndex        =   8
         Top             =   2160
         Width           =   1095
      End
      Begin VB.Label lbl2 
         Caption         =   "Height"
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label lbl1 
         Caption         =   "Length"
         Height          =   375
         Left            =   240
         TabIndex        =   6
         Top             =   480
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim MsgBoxInput As Single

Private Sub cmdCancel_Click()

    frmOptions.Hide
    
End Sub

Private Sub cmdOk_Click()
    
Screen.MousePointer = vbHourglass
    
    Randomize
    
If GameOn = False Then
A:
    Call TextCheck
    
    XTemp = txtCLength.Text
    YTemp = txtCHeight.Text
    BTemp = txtCMines.Text
    
    With frmMinesweeper
        .AITimer.Enabled = False
        .mnu1AIOff.Checked = True
        .mnu1AIOn.Checked = False
        .imgFace.Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
        For t = -1 + (XMaze * YMaze) To 0 Step -1
            If .imgCell(t).Visible = True Or .imgCell(t).Enabled = True Then
                .imgCell(t).Height = DefaultCellSize
                .imgCell(t).Width = DefaultCellSize
                .imgCell(t).Visible = False
                .imgCell(t).Enabled = False
                .imgCell(t).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
                .imgCell(t).Left = 0
                .imgCell(t).Top = 0
            End If
        Next t
    End With
    
    Call MinesweeperInit
    
    frmOptions.Hide
    
    GoTo B:
Else
    MsgBoxInput = MsgBox("Are you sure?  This will restart your game.", vbYesNo, "Your Game Is Still Going.")
    If MsgBoxInput = vbYes Then
        GoTo A:
    End If
    If MsgBoxInput = vbNo Then
        GoTo B:
    End If
End If
    
B:

Screen.MousePointer = vbDefault

End Sub

Private Sub t1_Timer()
    
'Start Initiation

    Screen.MousePointer = vbHourglass
    
    For R = 0 - 1 To XMaze + 1
        For C = 0 - 1 To YMaze + 1
            Maze(R, C) = -30000
        Next C
    Next R
    
    frmMinesweeper.tmr1Time.Enabled = False
    IsBomb = False
    
    t1.Enabled = False
    
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
C:

        i = Int(Rnd * (0 + (XMaze * YMaze)))
        
        'Check If Bomb
        If .imgCell(i).Tag <> "cBomb" Then
            .imgCell(i).Tag = "cBomb"
            BombCountTemp = BombCountTemp - 1
        Else
            GoTo C:
        End If
        
        If BombCountTemp > 0 Then
            GoTo C:
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
    frmMinesweeper.Show
    GameOn = True
    
    Screen.MousePointer = vbDefault
    
End Sub

Private Sub txtCHeight_Click()
    
    If txtCLength.Text = "" Then
        txtCLength.Text = 15
    End If
    
    If txtCMines.Text = "" Then
        txtCMines.Text = 10
    End If
    
    If txtCLength.Text > MaxLength Then
        txtCLength.Text = MaxLength
    End If
    
    If txtCLength.Text < MinLength Then
        txtCLength.Text = MinLength
    End If
    
    If txtCMines.Text > -1 + (txtCLength.Text * txtCHeight.Text) Then
        txtCMines.Text = -1 + (txtCLength.Text * txtCHeight.Text)
    End If
    
    If txtCMines.Text <= 0 Then
        txtCMines.Text = 1
    End If
    
End Sub

Private Sub txtCLength_Click()
    
    If txtCHeight.Text = "" Then
        txtCHeight.Text = 15
    End If
    
    If txtCMines.Text = "" Then
        txtCMines.Text = 10
    End If
    
    If txtCHeight.Text > MaxHeight Then
        txtCHeight.Text = MaxHeight
    End If
    
    If txtCHeight.Text < MinHeight Then
        txtCHeight.Text = MinHeight
    End If
    
    If txtCMines.Text > -1 + (txtCLength.Text * txtCHeight.Text) Then
        txtCMines.Text = -1 + (txtCLength.Text * txtCHeight.Text)
    End If
    
    If txtCMines.Text <= 0 Then
        txtCMines.Text = 1
    End If
    
End Sub

Private Sub txtCMines_Click()
    
    If txtCLength.Text = "" Then
        txtCLength.Text = 15
    End If
    
    If txtCHeight.Text = "" Then
        txtCHeight.Text = 15
    End If
    
    If txtCLength.Text > MaxLength Then
        txtCLength.Text = MaxLength
    End If
    
    If txtCHeight.Text > MaxHeight Then
        txtCHeight.Text = MaxHeight
    End If
    
    If txtCLength.Text < MinLength Then
        txtCLength.Text = MinLength
    End If
    
    If txtCHeight.Text < MinHeight Then
        txtCHeight.Text = MinHeight
    End If
    
End Sub

Private Sub TextCheck()

    If txtCLength.Text = "" Then
        txtCLength.Text = 15
    End If
    
    If txtCHeight.Text = "" Then
        txtCHeight.Text = 15
    End If
    
    If txtCMines.Text = "" Then
        txtCMines.Text = 10
    End If
    
    If txtCLength.Text > MaxLength Then
        txtCLength.Text = MaxLength
    End If
    
    If txtCHeight.Text > MaxHeight Then
        txtCHeight.Text = MaxHeight
    End If
    
    If txtCLength.Text < MinLength Then
        txtCLength.Text = MinLength
    End If
    
    If txtCHeight.Text < MinHeight Then
        txtCHeight.Text = MinHeight
    End If
    
    If txtCMines.Text > -1 + (txtCLength.Text * txtCHeight.Text) Then
        txtCMines.Text = -1 + (txtCLength.Text * txtCHeight.Text)
    End If
    
    If txtCMines.Text <= 0 Then
        txtCMines.Text = 1
    End If
    
End Sub

Private Sub MinesweeperInit()

    With frmOptions
    
        DefaultCellSize = ((255)) + iConstantVariable
        XMaze = XTemp
        YMaze = YTemp
        NumBomb = BTemp
        IntFactor = 450
        
        .t1.Enabled = True
        
    End With
    
    'Go to next Form
    'frmMainMenu.Hide
    frmMinesweeper.Hide
    'frmMinesweeper.Visible = False
    'frmLoadingScreen.Show
    
End Sub

