VERSION 5.00
Begin VB.Form frmCheckers 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Checkers"
   ClientHeight    =   11415
   ClientLeft      =   150
   ClientTop       =   780
   ClientWidth     =   18465
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   11415
   ScaleWidth      =   18465
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "CLS"
      Height          =   375
      Left            =   8760
      TabIndex        =   4
      Top             =   240
      Width           =   495
   End
   Begin VB.Frame fraOptions 
      Caption         =   "Frame1"
      Height          =   2535
      Left            =   9600
      TabIndex        =   3
      Top             =   1920
      Width           =   2655
   End
   Begin VB.Timer tmrStat 
      Interval        =   250
      Left            =   10080
      Top             =   360
   End
   Begin VB.Timer tmrInit 
      Interval        =   25
      Left            =   120
      Top             =   10920
   End
   Begin VB.Label lblTurn 
      Caption         =   "Turn = 0"
      Height          =   255
      Left            =   9600
      TabIndex        =   2
      Top             =   1200
      Width           =   1335
   End
   Begin VB.Label lblGameOn 
      Caption         =   "GameOn = False"
      Height          =   255
      Left            =   9600
      TabIndex        =   1
      Top             =   840
      Width           =   1335
   End
   Begin VB.Label lbl1Time 
      Caption         =   "ABC123"
      Height          =   615
      Left            =   9000
      TabIndex        =   0
      Top             =   6960
      Width           =   1215
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   11
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   10
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   9
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   8
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   7
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   6
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   5
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   4
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   3
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   2
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   1
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   11
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   10
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   9
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   8
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   7
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   6
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   5
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   4
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   3
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   2
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   1
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   735
   End
   Begin VB.Image imgB 
      Height          =   735
      Index           =   0
      Left            =   9720
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   735
   End
   Begin VB.Image imgA 
      Height          =   735
      Index           =   0
      Left            =   8880
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   735
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   63
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   62
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   61
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   60
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   59
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   58
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   57
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   56
      Left            =   840
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   55
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   54
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   53
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   52
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   51
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   50
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   49
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   48
      Left            =   840
      Stretch         =   -1  'True
      Top             =   6600
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   47
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   46
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   45
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   44
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   43
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   42
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   41
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   40
      Left            =   840
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   39
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   38
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   37
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   36
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   35
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   34
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   33
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   32
      Left            =   840
      Stretch         =   -1  'True
      Top             =   4680
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   31
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   30
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   29
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   28
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   27
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   26
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   25
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   24
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   23
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   22
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   21
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   20
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   19
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   18
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   17
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   16
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2760
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   15
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   14
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   13
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   12
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   11
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   10
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   9
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   8
      Left            =   840
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   7
      Left            =   7560
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   6
      Left            =   6600
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   5
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   4
      Left            =   4680
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   3
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   2
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   1
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Image imgCell 
      Height          =   975
      Index           =   0
      Left            =   840
      Stretch         =   -1  'True
      Top             =   840
      Width           =   975
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuGrid 
      Caption         =   "Grid"
   End
End
Attribute VB_Name = "frmCheckers"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    Cls
End Sub

Private Sub Form_Load()

    cDefaultSize = 900
    Turn = 1
    
End Sub

Private Sub imgA_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    
If GameOn = True Then

    For t = 0 To 11
        AMove(t) = False
        'BMove(t) = False
    Next t
    
    If Turn = 1 Then
    
        If Button = vbLeftButton Then
            AMove(i1) = True
            Print AMove(i1)
            
            PosC = (Index Mod XMaze)
            PosR = YMaze - (Index \ XMaze + 1)
            'i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            
            GridMove(PosC, PosR) = 5
            GridMove(PosC - 1, PosR - 1) = 1
            GridMove(PosC + 1, PosR - 1) = 1
            GridMove(PosC - 1, PosR + 1) = 1
            GridMove(PosC + 1, PosR + 1) = 1
            
        End If
        
        If Button = vbRightButton Then
            AMove(i1) = False
            Print AMove(i1)
        End If
        
    End If
    
End If

End Sub

Private Sub imgB_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    
If GameOn = True Then

    For t = 0 To 11
        'AMove(t) = False
        BMove(t) = False
    Next t
    
    If Turn = 2 Then
    
        If Button = vbLeftButton Then
            BMove(i2) = True
            Print BMove(i2)
        End If
        
        If Button = vbRightButton Then
            BMove(i2) = False
            Print BMove(i2)
        End If
        
    End If
    
End If

End Sub

Private Sub imgCell_MouseDown(Index2 As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

'C = (Index2 Mod XMaze)
'R = YMaze - (Index2 \ XMaze + 1)
'i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)

    If AMove(i1) = True Then
        Print Index2
        Select Case Index2
            Case 0:
                i = Index2
            Case 2:
                i = Index2
            Case 4:
                i = Index2
            Case 6:
                i = Index2
            
            Case 9:
                i = Index2
            Case 11:
                i = Index2
            Case 13:
                i = Index2
            Case 15:
                i = Index2
            
            Case 16:
                i = Index2
            Case 18:
                i = Index2
            Case 20:
                i = Index2
            Case 22:
                i = Index2
            
            Case 25:
                i = Index2
            Case 27:
                i = Index2
            Case 29:
                i = Index2
            Case 31:
                i = Index2
            
            Case 32:
                i = Index2
            Case 34:
                i = Index2
            Case 36:
                i = Index2
            Case 38:
                i = Index2
            
            Case 41:
                i = Index2
            Case 43:
                i = Index2
            Case 45:
                i = Index2
            Case 47:
                i = Index2
            
            Case 48:
                i = Index2
            Case 50:
                i = Index2
            Case 52:
                i = Index2
            Case 54:
                i = Index2
            
            Case 57:
                i = Index2
            Case 59:
                i = Index2
            Case 61:
                i = Index2
            Case 63:
                i = Index2
            
        End Select
        
        If GridMove(PosC - 1, PosR - 1) = 1 Then
            Print "Move"
        End If
        
        If GridMove(PosC + 1, PosR - 1) = 1 Then
            Print "Move"
        End If
        
    End If
    
End Sub

Private Sub mnuExit_Click()
    End
    
End Sub

Private Sub mnuGrid_Click()

    Cls
    For R = -1 + YMaze To 0 Step -1
        For C = 0 To -1 + XMaze Step 1
            Print GridMove(C, R);
        Next C
        Print:
    Next R
    
End Sub

Private Sub tmrInit_Timer()

    Randomize
    
'Start Initiation

    Screen.MousePointer = vbHourglass
    
    XMaze = 8
    YMaze = 8
    
    tmrInit.Enabled = False
    
'Step 1: Load Images
    With frmCheckers
        
        'Board Images
        For t = 0 To 63 Step 1
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(i).Visible = True
            .imgCell(i).Enabled = True
            .imgCell(i).Picture = LoadPicture(App.Path & "\Images\C-LightSquare.bmp")
        Next t
        
        '++++++++++++++++++++++=======================
        
        'Board Images
        For t = 1 To 7 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        For t = 8 To 14 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        For t = 17 To 23 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        For t = 24 To 30 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        For t = 33 To 39 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        For t = 40 To 46 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        For t = 49 To 55 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        For t = 56 To 62 Step 2
            '.imgCell(t).Height = DefaultCellSize
            '.imgCell(t).Width = DefaultCellSize
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            i = ((-1 * (R * XMaze)) + (XMaze * YMaze)) + ((C * 1) - YMaze)
            .imgCell(t).Visible = True
            .imgCell(t).Enabled = True
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\C-DarkSquare.bmp")
        Next t
        
        'Load Checker Piece Images
        For t = 0 To 11
            .imgA(t).Picture = LoadPicture(App.Path & "\Images\" & "C-APieceNormal.gif")
            .imgB(t).Picture = LoadPicture(App.Path & "\Images\" & "C-BPieceNormal.gif")
        Next t
        
    End With
    
'Step 2: Set Grid
    With frmCheckers
        
        For i = 0 To -1 + (XMaze * YMaze)
            C = (i Mod XMaze)
            R = YMaze - (i \ XMaze + 1)
            
            
            Select Case i
                Case 0:
                    Grid(C, R) = 10
                    'MsgBox Grid(C, R) & C & R
                Case 2:
                    Grid(C, R) = 10
                Case 4:
                    Grid(C, R) = 10
                Case 6:
                    Grid(C, R) = 10
                    
                Case 9:
                    Grid(C, R) = 10
                Case 11:
                    Grid(C, R) = 10
                Case 13:
                    Grid(C, R) = 10
                Case 15:
                    Grid(C, R) = 10
                
                Case 16:
                    Grid(C, R) = 10
                Case 18:
                    Grid(C, R) = 10
                Case 20:
                    Grid(C, R) = 10
                Case 22:
                    Grid(C, R) = 10
                    
            End Select
            
            Select Case i
                Case 41:
                    Grid(C, R) = -10
                    'MsgBox Grid(C, R) & C & R
                Case 43:
                    Grid(C, R) = -10
                Case 45:
                    Grid(C, R) = -10
                Case 47:
                    Grid(C, R) = -10
                    
                Case 48:
                    Grid(C, R) = -10
                Case 50:
                    Grid(C, R) = -10
                Case 52:
                    Grid(C, R) = -10
                Case 54:
                    Grid(C, R) = -10
                
                Case 57:
                    Grid(C, R) = -10
                Case 59:
                    Grid(C, R) = -10
                Case 61:
                    Grid(C, R) = -10
                Case 63:
                    Grid(C, R) = -10
                    
            End Select
        Next i
        
    End With
    
'Step 3: Size Images
    With frmCheckers
        For t = 0 To 11
            If .imgA(t).Width = cDefaultSize Then
                t = 11
            End If
            .imgA(t).Width = cDefaultSize
            .imgA(t).Height = cDefaultSize
            .imgB(t).Width = cDefaultSize
            .imgB(t).Height = cDefaultSize
        Next t
    End With
    
'Step 4: Array Images
    With frmCheckers
    Dim t1 As Integer
    Dim t2 As Integer
        t1 = 0
        t2 = 0
        For i = 0 To -1 + (XMaze * YMaze)
            C = (i Mod XMaze)
            R = YMaze - (i \ XMaze + 1)
            Select Case Grid(C, R)
                Case 10:
                    .imgA(t1).Left = .imgCell(i).Left + (.imgCell(i).Width / 2 - .imgA(t1).Width / 2)
                    .imgA(t1).Top = .imgCell(i).Top + (.imgCell(i).Height / 2 - .imgA(t1).Height / 2)
                    t1 = t1 + 1
                Case -10
                    .imgB(t2).Left = .imgCell(i).Left + (.imgCell(i).Width / 2 - .imgB(t2).Width / 2)
                    .imgB(t2).Top = .imgCell(i).Top + (.imgCell(i).Height / 2 - .imgB(t2).Height / 2)
                    t2 = t2 + 1
            End Select
        Next i
    End With
    
    'Step 7: Reset Zone Values
    With frmCheckers
        'For i = 0 To -1 + (XMaze * YMaze)
        '    C = (i Mod XMaze)
        '    R = YMaze - (i \ XMaze + 1)
        '    zoneValue(C, R) = 0
        'Next i
    End With
    
    'Step 8: Set Zone Values
    
    
    'Step X: Start Game
        Sec(0) = 0
        Sec(1) = 0
        Min(0) = 0
        Min(1) = 0
        Hr(0) = 0
        Hr(1) = 0
    frmCheckers.lbl1Time.Caption = Hr(1) & Hr(0) & ":" & Min(1) & Min(0) & ":" & Sec(1) & Sec(0)
    GameOn = True
    
    Screen.MousePointer = vbDefault
    
B:
End Sub

Private Sub tmrStat_Timer()

    lblGameOn.Caption = "GameOn = " & GameOn
    lblTurn.Caption = "Turn = " & Turn
    
End Sub
