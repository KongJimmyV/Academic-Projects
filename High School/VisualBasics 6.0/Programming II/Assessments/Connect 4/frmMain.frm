VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00FF8080&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Connect 4"
   ClientHeight    =   5310
   ClientLeft      =   150
   ClientTop       =   540
   ClientWidth     =   9315
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5310
   ScaleWidth      =   9315
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      Height          =   2535
      Left            =   7560
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   2520
      Width           =   1575
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   480
      Top             =   4080
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3D32
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4B84
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":50C6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":5608
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":645A
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":699C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":6EDE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   9315
      _ExtentX        =   16431
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      Style           =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "new"
            Object.ToolTipText     =   "New Game"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "load"
            Object.ToolTipText     =   "Load Game"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "save"
            Object.ToolTipText     =   "Save Game"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "move"
            Object.ToolTipText     =   "Move Now"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "undo"
            Object.ToolTipText     =   "Undo Move"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "redo"
            Object.ToolTipText     =   "Redo Move"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "stop"
            Object.ToolTipText     =   "Stop Thinking"
            ImageIndex      =   7
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   4200
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox PicPieces 
      AutoSize        =   -1  'True
      Height          =   2445
      Left            =   0
      Picture         =   "frmMain.frx":7D30
      ScaleHeight     =   159
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   43
      TabIndex        =   1
      Top             =   720
      Visible         =   0   'False
      Width           =   705
   End
   Begin VB.PictureBox Picboard 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   4350
      Left            =   240
      Picture         =   "frmMain.frx":CF6E
      ScaleHeight     =   290
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   468
      TabIndex        =   0
      Top             =   720
      Width           =   7020
      Begin VB.Image Image1 
         Height          =   3615
         Index           =   0
         Left            =   1200
         Top             =   120
         Width           =   495
      End
      Begin VB.Image Image1 
         Height          =   3615
         Index           =   1
         Left            =   1875
         Top             =   120
         Width           =   495
      End
      Begin VB.Image Image1 
         Height          =   3615
         Index           =   2
         Left            =   2580
         Top             =   120
         Width           =   495
      End
      Begin VB.Image Image1 
         Height          =   3615
         Index           =   3
         Left            =   3240
         Top             =   120
         Width           =   495
      End
      Begin VB.Image Image1 
         Height          =   3615
         Index           =   4
         Left            =   3960
         Top             =   120
         Width           =   495
      End
      Begin VB.Image Image1 
         Height          =   3615
         Index           =   5
         Left            =   4635
         Top             =   120
         Width           =   495
      End
      Begin VB.Image Image1 
         Height          =   3615
         Index           =   6
         Left            =   5325
         Top             =   120
         Width           =   495
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FF8080&
      Height          =   4695
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   7215
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00E0E0E0&
      Height          =   4575
      Left            =   7440
      Top             =   600
      Width           =   1815
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Player to move:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   7680
      TabIndex        =   4
      Top             =   720
      Width           =   1335
   End
   Begin VB.Image Image3 
      Height          =   465
      Left            =   8040
      Picture         =   "frmMain.frx":70628
      Top             =   1080
      Width           =   465
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8160
      TabIndex        =   9
      Top             =   2040
      Width           =   735
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   8160
      TabIndex        =   8
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Value:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   7560
      TabIndex        =   7
      Top             =   2040
      Width           =   615
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Depth:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   7560
      TabIndex        =   6
      Top             =   1680
      Width           =   615
   End
   Begin VB.Image Image2 
      Height          =   465
      Left            =   8040
      Picture         =   "frmMain.frx":7120A
      Top             =   1080
      Width           =   465
   End
   Begin VB.Menu mnuGame 
      Caption         =   "&Game"
      Begin VB.Menu mnuNewGame 
         Caption         =   "&New Game"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuLoad 
         Caption         =   "&Load Game..."
      End
      Begin VB.Menu mnuSave 
         Caption         =   "&Save Game..."
      End
      Begin VB.Menu sepetator3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMoveNow 
         Caption         =   "&Move Now"
         Shortcut        =   {F3}
      End
      Begin VB.Menu mnuUndo 
         Caption         =   "&Undo Move"
      End
      Begin VB.Menu mnuRedo 
         Caption         =   "&Redo Move"
      End
      Begin VB.Menu seperator4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuComputer 
         Caption         =   "Player vs &Computer"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuPlayer 
         Caption         =   "Player vs &Player"
      End
      Begin VB.Menu seperator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuskill 
         Caption         =   "Computer &Skill"
         Begin VB.Menu mnuskilllevel 
            Caption         =   "&Beginner"
            Index           =   0
         End
         Begin VB.Menu mnuskilllevel 
            Caption         =   "&Intermediate"
            Index           =   1
         End
         Begin VB.Menu mnuskilllevel 
            Caption         =   "&Good"
            Checked         =   -1  'True
            Index           =   2
         End
         Begin VB.Menu mnuskilllevel 
            Caption         =   "&Expert"
            Index           =   3
         End
         Begin VB.Menu mnuskilllevel 
            Caption         =   "&Master"
            Index           =   4
         End
         Begin VB.Menu mnuskilllevel 
            Caption         =   "&Search Win/Loss"
            Index           =   5
         End
         Begin VB.Menu mnuskilllevel 
            Caption         =   "-"
            Index           =   6
         End
         Begin VB.Menu mnuskilllevel 
            Caption         =   "C&ustomize..."
            Index           =   7
         End
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Dim Board(1 To 7, 1 To 6) As Integer ' 0=empty, 1=yellow, -1=red
Dim PiecesInColumn(1 To 7) As Integer ' number of pieces in the column
Dim MovesList(1 To 42) As Integer, MovesNum As Integer, SaveMovesNum As Integer  ' stores moves as column numbers
Dim AllowMoving As Boolean ' is the user allowed to enter his move now?
Dim IsGameOver As Boolean
Dim PlayerToGo As Integer, SearchPlayerToGo As Integer '1=yellow, -1=red
Dim StartDepth As Integer ' The depth of the search
Dim Nodes As Long
Dim LegalMovesList(1 To 7) As Integer, LegalMovesNum As Integer
Dim YellowKiller As Integer, RedKiller As Integer
Dim LastPVar(1 To 30) As Integer
Dim StopThinking As Boolean, SaveTimer As Double
Dim MovesValues(1 To 7) As Integer, SaveMovesValues(1 To 7) As Integer, HighestValue As Integer
Dim SearchWin As Boolean, SearchWinMove As Integer
Private Sub NewGame()
Dim i As Integer, j As Integer
For i = 1 To 7
    For j = 1 To 6
        Board(i, j) = 0
    Next
Next
For i = 1 To 7
    PiecesInColumn(i) = 0
Next
For i = 1 To 42
    MovesList(i) = 0
Next
MovesNum = 0
AllowMoving = True
IsGameOver = False
PlayerToGo = 1
Image2.Visible = True: Image3.Visible = False
Paintboard
Label4.Caption = "": Label5.Caption = ""
Text1.Text = ""
End Sub
Private Sub UpdateMovesList()
Dim TempPiecesInColumn(1 To 7) As Integer, ColumnNo As Integer, Letter As String, i As Integer
Text1.Text = ""
For i = 1 To MovesNum
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
    If i Mod 2 = 1 Then Text1.Text = Text1.Text + Letter + vbTab Else Text1.Text = Text1.Text + Letter + vbCrLf
Next
End Sub
Private Sub ArrayMakeMove(Column As Integer, Player As Integer)  'makes a move in the arrays of information, Player: 1=yellow, -1=red
PiecesInColumn(Column) = PiecesInColumn(Column) + 1
Board(Column, PiecesInColumn(Column)) = Player
MovesNum = MovesNum + 1
MovesList(MovesNum) = Column
SearchPlayerToGo = -SearchPlayerToGo
End Sub
Private Sub ArrayUnmakeMove(Column As Integer)  'unmakes a move in the arrays of information
Board(Column, PiecesInColumn(Column)) = 0
PiecesInColumn(Column) = PiecesInColumn(Column) - 1
MovesNum = MovesNum - 1
SearchPlayerToGo = -SearchPlayerToGo
End Sub
Private Sub MakeMove(Column As Integer)
AllowMoving = False
Dim i As Integer
For i = 6 To PiecesInColumn(Column) + 1 Step -1
    Call PaintCell(Column, i, PlayerToGo)
    If i < 6 Then Call PaintCell(Column, i + 1, 0)
    DoEvents
    Sleep (40)
Next
Call ArrayMakeMove(Column, PlayerToGo)
Paintboard
UpdateMovesList
If CheckWin(Column, PiecesInColumn(Column)) = True Then IsGameOver = True: BlinkWin (Column)
If MovesNum = 42 Then IsGameOver = True
PlayerToGo = -PlayerToGo
If IsGameOver = False Then
    If PlayerToGo = 1 Then Image2.Visible = True: Image3.Visible = False Else Image3.Visible = True: Image2.Visible = False
Else
    Image2.Visible = False: Image3.Visible = False
End If
SaveMovesNum = MovesNum
AllowMoving = True
End Sub
Private Sub BlinkWin(ColumnNo As Integer)
Dim BlinkingCells(1 To 15, 1 To 2) As Integer '1 for x coordinates,2 for y coordinates
Dim BlinkingCellsNum As Integer
Dim TempBlinkingCells(1 To 6, 1 To 2) As Integer, TempNum As Integer
Dim ChainLength As Integer, i As Integer, j As Integer
Dim Height As Integer

AllowMoving = False

Height = PiecesInColumn(ColumnNo)
BlinkingCells(1, 1) = ColumnNo
BlinkingCells(1, 2) = Height
BlinkingCellsNum = 1

'vertical
If PiecesInColumn(ColumnNo) >= 4 Then
    If Board(ColumnNo, Height - 1) = Board(ColumnNo, Height) And Board(ColumnNo, Height - 2) = Board(ColumnNo, Height) And Board(ColumnNo, Height - 3) = Board(ColumnNo, Height) Then
        BlinkingCells(2, 1) = ColumnNo: BlinkingCells(2, 2) = Height - 1
        BlinkingCells(3, 1) = ColumnNo: BlinkingCells(3, 2) = Height - 2
        BlinkingCells(4, 1) = ColumnNo: BlinkingCells(4, 2) = Height - 3
        BlinkingCellsNum = 4
    End If
End If

'horizontal
ChainLength = 1
TempNum = 0
For i = ColumnNo + 1 To 7
    If Board(i, Height) = Board(ColumnNo, Height) Then ChainLength = ChainLength + 1: TempNum = TempNum + 1: TempBlinkingCells(TempNum, 1) = i: TempBlinkingCells(TempNum, 2) = Height Else: Exit For
Next
For i = ColumnNo - 1 To 1 Step -1
    If Board(i, Height) = Board(ColumnNo, Height) Then ChainLength = ChainLength + 1: TempNum = TempNum + 1: TempBlinkingCells(TempNum, 1) = i: TempBlinkingCells(TempNum, 2) = Height Else: Exit For
Next
If ChainLength >= 4 Then
    For i = 1 To TempNum
        BlinkingCellsNum = BlinkingCellsNum + 1
        BlinkingCells(BlinkingCellsNum, 1) = TempBlinkingCells(i, 1)
        BlinkingCells(BlinkingCellsNum, 2) = TempBlinkingCells(i, 2)
    Next
End If

'diagonal up
ChainLength = 1
TempNum = 0
For i = ColumnNo + 1 To 7
    If (Height + i - ColumnNo) > 6 Then Exit For
    If Board(i, Height + i - ColumnNo) = Board(ColumnNo, Height) Then ChainLength = ChainLength + 1: TempNum = TempNum + 1: TempBlinkingCells(TempNum, 1) = i: TempBlinkingCells(TempNum, 2) = Height + i - ColumnNo Else: Exit For
Next
For i = ColumnNo - 1 To 1 Step -1
    If (Height - ColumnNo + i) < 1 Then Exit For
    If Board(i, Height - ColumnNo + i) = Board(ColumnNo, Height) Then ChainLength = ChainLength + 1: TempNum = TempNum + 1: TempBlinkingCells(TempNum, 1) = i: TempBlinkingCells(TempNum, 2) = Height - ColumnNo + i Else: Exit For
Next
If ChainLength >= 4 Then
    For i = 1 To TempNum
        BlinkingCellsNum = BlinkingCellsNum + 1
        BlinkingCells(BlinkingCellsNum, 1) = TempBlinkingCells(i, 1)
        BlinkingCells(BlinkingCellsNum, 2) = TempBlinkingCells(i, 2)
    Next
End If

'diagonal down
ChainLength = 1
TempNum = 0
For i = ColumnNo + 1 To 7
    If (Height - i + ColumnNo) < 1 Then Exit For
    If Board(i, Height - i + ColumnNo) = Board(ColumnNo, Height) Then ChainLength = ChainLength + 1: TempNum = TempNum + 1: TempBlinkingCells(TempNum, 1) = i: TempBlinkingCells(TempNum, 2) = Height - i + ColumnNo Else: Exit For
Next
For i = ColumnNo - 1 To 1 Step -1
    If (Height + ColumnNo - i) > 6 Then Exit For
    If Board(i, Height + ColumnNo - i) = Board(ColumnNo, Height) Then ChainLength = ChainLength + 1: TempNum = TempNum + 1: TempBlinkingCells(TempNum, 1) = i: TempBlinkingCells(TempNum, 2) = Height + ColumnNo - i Else: Exit For
Next
If ChainLength >= 4 Then
    For i = 1 To TempNum
        BlinkingCellsNum = BlinkingCellsNum + 1
        BlinkingCells(BlinkingCellsNum, 1) = TempBlinkingCells(i, 1)
        BlinkingCells(BlinkingCellsNum, 2) = TempBlinkingCells(i, 2)
    Next
End If

For j = 1 To 4
    For i = 1 To BlinkingCellsNum
        Call PaintCell(BlinkingCells(i, 1), BlinkingCells(i, 2), 0)
    Next
    DoEvents
    Sleep (200)
    For i = 1 To BlinkingCellsNum
        Call PaintCell(BlinkingCells(i, 1), BlinkingCells(i, 2), PlayerToGo)
    Next
    DoEvents
    Sleep (200)
Next

AllowMoving = True

End Sub
Private Sub ComputerMove()
Dim i As Integer, PVar(1 To 30) As Byte
If mnuskilllevel(4).Checked = True Then
    Select Case MovesNum
        Case 0 To 17
            TimeLimit = 10
            DepthLimit = 30
            EvalFunc = 3
            SearchWin = False
        Case 18 To 26
            TimeLimit = 180
            DepthLimit = 30
            EvalFunc = 0
            SearchWin = True
        Case 27 To 42
            TimeLimit = 180
            DepthLimit = 30
            EvalFunc = 0
            SearchWin = False
    End Select
End If
            
Nodes = 0
SearchPlayerToGo = PlayerToGo
StartDepth = 1
StopThinking = False
SaveTimer = Timer
Dim Value As Integer
frmMain.MousePointer = 11: AllowMoving = False
Do
    StartDepth = Minimum(StartDepth, 42 - MovesNum)
    YellowKiller = 0: RedKiller = 0
    HighestValue = -20000
    Value = Search(StartDepth, -10000, 10000, PVar())
    If StopThinking = False Then
        For i = 1 To 7
            SaveMovesValues(i) = MovesValues(i)
        Next
        For i = 1 To StartDepth
            LastPVar(i) = PVar(i)
        Next
        StartDepth = StartDepth + 1
    End If
    Label4.Caption = StartDepth - 1
    Label5.Caption = HighestValue
    If HighestValue > 4000 Then Label5.Caption = "Win"
    If HighestValue < -4000 Then Label5.Caption = "Loss"

    If StopThinking = True Then Exit Do
    If StartDepth > (36 - MovesNum) Then Exit Do
    If Timer - SaveTimer > TimeLimit Then Exit Do
    If StartDepth > DepthLimit Then Exit Do
    If Value > 4000 Or Value < -4000 Then Exit Do
Loop
frmMain.MousePointer = 0: AllowMoving = True
'frmMain.Caption = Str(Value)
Dim BestMoves(1 To 7) As Integer, BestMovesNum As Integer, SelectedMove As Integer
HighestValue = -20000
BestMovesNum = 0
For i = 1 To 7
    If SaveMovesValues(i) > HighestValue And PiecesInColumn(i) < 6 Then HighestValue = SaveMovesValues(i)
Next
For i = 1 To 7
    If SaveMovesValues(i) = HighestValue And PiecesInColumn(i) < 6 Then
        BestMovesNum = BestMovesNum + 1
        BestMoves(BestMovesNum) = i
    End If
Next
Randomize
SelectedMove = BestMoves(Int(Rnd * BestMovesNum) + 1)
If SearchWin = True Then SelectedMove = SearchWinMove

Label4.Caption = StartDepth - 1
Label5.Caption = HighestValue
If HighestValue > 4000 Then Label5.Caption = "Win"
If HighestValue < -4000 Then Label5.Caption = "Loss"
If HighestValue = 0 And StartDepth - 1 >= 36 - MovesNum Then Label5.Caption = "Draw"
MakeMove (SelectedMove)
End Sub
Private Function CheckWin(X As Integer, Y As Integer) As Boolean
Dim ChainLength As Integer, i As Integer, j As Integer
CheckWin = False
If Y >= 4 Then ' Check for a vertical win
    If Board(X, Y - 1) = Board(X, Y) And Board(X, Y - 2) = Board(X, Y) And Board(X, Y - 3) = Board(X, Y) Then CheckWin = True: Exit Function
End If

' Check for a horizontal win
ChainLength = 1
For i = X + 1 To 7
    If Board(i, Y) = Board(X, Y) Then ChainLength = ChainLength + 1 Else: Exit For
Next
For i = X - 1 To 1 Step -1
    If Board(i, Y) = Board(X, Y) Then ChainLength = ChainLength + 1 Else: Exit For
Next
If ChainLength >= 4 Then CheckWin = True: Exit Function

'Diagonal up
ChainLength = 1
For i = X + 1 To 7
    If (Y + i - X) > 6 Then Exit For
    If Board(i, Y + i - X) = Board(X, Y) Then ChainLength = ChainLength + 1 Else: Exit For
Next
For i = X - 1 To 1 Step -1
    If (Y - X + i) < 1 Then Exit For
    If Board(i, Y - X + i) = Board(X, Y) Then ChainLength = ChainLength + 1 Else: Exit For
Next
If ChainLength >= 4 Then CheckWin = True: Exit Function

'Diagonal down
ChainLength = 1
For i = X + 1 To 7
    If (Y - i + X) < 1 Then Exit For
    If Board(i, Y - i + X) = Board(X, Y) Then ChainLength = ChainLength + 1 Else: Exit For
Next
For i = X - 1 To 1 Step -1
    If (Y + X - i) > 6 Then Exit For
    If Board(i, Y + X - i) = Board(X, Y) Then ChainLength = ChainLength + 1 Else: Exit For
Next
If ChainLength >= 4 Then CheckWin = True: Exit Function

End Function
Private Sub GenerateMoves(Depth As Integer)
Dim i As Integer
LegalMovesNum = 0
Randomize
If Rnd < 1 Or Depth < StartDepth Then 'to make the computer not play always the same moves
    For i = 1 To 7
        If PiecesInColumn(i) < 6 Then
            LegalMovesNum = LegalMovesNum + 1
            LegalMovesList(LegalMovesNum) = i
        End If
    Next
Else
    For i = 7 To 1 Step -1
        If PiecesInColumn(i) < 6 Then
            LegalMovesNum = LegalMovesNum + 1
            LegalMovesList(LegalMovesNum) = i
        End If
    Next
End If
End Sub
Private Sub OrderMoves(Depth As Integer)
'give each move a value
Dim i As Integer, j As Integer, Values(1 To 7) As Integer
Dim ColumnNum As Integer
For i = 1 To LegalMovesNum
    ColumnNum = LegalMovesList(i)
    Select Case ColumnNum
        Case 4
            Values(i) = 15
        Case 3, 5
            Values(i) = 10
        Case 2, 6
            Values(i) = 5
        Case 1, 7
            Values(i) = 0
    End Select
    If YellowKiller = ColumnNum And SearchPlayerToGo = 1 Or RedKiller = ColumnNum And SearchPlayerToGo = -1 Then Values(i) = 50
    Board(ColumnNum, PiecesInColumn(ColumnNum) + 1) = 1
    If CheckWin(ColumnNum, PiecesInColumn(ColumnNum) + 1) = True Then Values(i) = Values(i) + 100
    Board(ColumnNum, PiecesInColumn(ColumnNum) + 1) = -1
    If CheckWin(ColumnNum, PiecesInColumn(ColumnNum) + 1) = True Then Values(i) = Values(i) + 100
    Board(ColumnNum, PiecesInColumn(ColumnNum) + 1) = 0
    If Depth = StartDepth Then Values(i) = MovesValues(ColumnNum)
Next
'sort the moves
Dim LargestVal As Integer, BestNow As Integer, Temp As Integer
For i = 1 To LegalMovesNum
LargestVal = -10000
    For j = i To LegalMovesNum
    If Values(j) > LargestVal Then BestNow = j: LargestVal = Values(j)
    Next
    Temp = LegalMovesList(BestNow)
    LegalMovesList(BestNow) = LegalMovesList(i)
    LegalMovesList(i) = Temp
    Values(BestNow) = Values(i)
Next

End Sub
Private Function Search(Depth As Integer, Alpha As Integer, Beta As Integer, ByRef PVar() As Byte)
Dim Player As Integer, i As Integer, j As Integer, Score As Integer
Dim ColumnNo As Integer, LegalMovesHere(1 To 7) As Integer
Dim PVarHere(1 To 30) As Byte

If StopThinking = True Then Exit Function
If Timer - SaveTimer > TimeLimit Then StopThinking = True: Exit Function

If (StartDepth - Depth) Mod 2 = 0 Then Player = PlayerToGo Else Player = -PlayerToGo
If Depth < StartDepth Then
    If CheckWin(MovesList(MovesNum), PiecesInColumn(MovesList(MovesNum))) = True Then Search = -5000 - Depth: Exit Function
End If
If Depth <= 0 Then
    If MovesNum = 42 Then Search = 0: Exit Function
    If MovesNum < 36 Then Search = EvaluateBoard(Player): Exit Function
End If
GenerateMoves (Depth)
OrderMoves (Depth)
For i = 1 To LegalMovesNum
    LegalMovesHere(i) = LegalMovesList(i)
Next
For i = 1 To LegalMovesNum
    Nodes = Nodes + 1: If Nodes Mod 1000 = 0 Then DoEvents
    ColumnNo = LegalMovesHere(i)
    Call ArrayMakeMove(ColumnNo, Player)
    If Depth = StartDepth Then
        Score = -Search(Depth - 1, -10000, 10000, PVar())
    Else
        Score = -Search(Depth - 1, -Beta, -Alpha, PVar())
    End If
    
    ArrayUnmakeMove (ColumnNo)
    
    If Score >= Beta Or (Score > -HighestValue And (StartDepth - Depth) = 1) Then
        Search = Score
        If SearchPlayerToGo = 1 Then YellowKiller = ColumnNo Else RedKiller = ColumnNo
        Exit Function
    End If
    If Score > Alpha Then
        Alpha = Score
        PVarHere(StartDepth - Depth + 1) = ColumnNo
        For j = StartDepth - Depth + 2 To StartDepth
            PVarHere(j) = PVar(j)
        Next
        If Depth = StartDepth Then HighestValue = Alpha
        If Depth = StartDepth And SearchWin = True Then SearchWinMove = ColumnNo
    End If
    If Depth = StartDepth Then MovesValues(ColumnNo) = Score
    If Score > 1 And SearchWin = True Then Search = Score: Exit Function
    If Score = 0 And Depth Mod 2 = 0 And SearchWin = True And StartDepth < (36 - MovesNum) Then Search = Score: Exit Function
Next
For j = StartDepth - Depth + 1 To StartDepth
    PVar(j) = PVarHere(j)
Next
Search = Alpha
End Function
Private Function EvaluateBoard(Player As Integer)
Dim X As Integer, Y As Integer, i As Integer, j As Integer
Dim NumYellow As Integer, NumRed As Integer, EmptyX As Integer, EmptyY As Integer
Dim Value As Integer
Dim YellowThreats(1 To 7, 1 To 6) As Integer, RedThreats(1 To 7, 1 To 6) As Integer
Dim YellowOddThreatsNum As Integer, RedOddThreatsNum As Integer, FreeOddRed As Integer, FreeOddYellow As Integer, RedEvenThreatsNum As Integer
Value = 0
'threats
If EvalFunc >= 2 Then
'horizontal
For X = 1 To 4
    For Y = 1 To 6
        NumYellow = 0: NumRed = 0
        For i = 0 To 3
            If Board(X + i, Y) = 1 Then NumYellow = NumYellow + 1
            If Board(X + i, Y) = -1 Then NumRed = NumRed + 1
            If Board(X + i, Y) = 0 Then EmptyX = X + i: EmptyY = Y
        Next
        If NumYellow = 3 And NumRed = 0 Then Value = Value + IIf(EmptyY Mod 2 = 1, 50, 20): YellowThreats(EmptyX, EmptyY) = 1
        If NumYellow = 0 And NumRed = 3 Then Value = Value - IIf(EmptyY Mod 2 = 0, 50, 20): RedThreats(EmptyX, EmptyY) = 1
        If NumYellow = 2 And NumRed = 0 Then Value = Value + 8
        If NumYellow = 0 And NumRed = 2 Then Value = Value - 8
    Next
Next

'diagonal up
For X = 1 To 4
    For Y = 1 To 3
        NumYellow = 0: NumRed = 0
        For i = 0 To 3
            If Board(X + i, Y + i) = 1 Then NumYellow = NumYellow + 1
            If Board(X + i, Y + i) = -1 Then NumRed = NumRed + 1
            If Board(X + i, Y + i) = 0 Then EmptyX = X + i: EmptyY = Y + i
        Next
        If NumYellow = 3 And NumRed = 0 Then Value = Value + IIf(EmptyY Mod 2 = 1, 50, 20): YellowThreats(EmptyX, EmptyY) = 1
        If NumYellow = 0 And NumRed = 3 Then Value = Value - IIf(EmptyY Mod 2 = 0, 50, 20): RedThreats(EmptyX, EmptyY) = 1
        If NumYellow = 2 And NumRed = 0 Then Value = Value + 8
        If NumYellow = 0 And NumRed = 2 Then Value = Value - 8
    Next
Next

'diagonal down
For X = 1 To 4
    For Y = 4 To 6
        NumYellow = 0: NumRed = 0
        For i = 0 To 3
            If Board(X + i, Y - i) = 1 Then NumYellow = NumYellow + 1
            If Board(X + i, Y - i) = -1 Then NumRed = NumRed + 1
            If Board(X + i, Y - i) = 0 Then EmptyX = X + i: EmptyY = Y - i
        Next
        If NumYellow = 3 And NumRed = 0 Then Value = Value + IIf(EmptyY Mod 2 = 1, 50, 20): YellowThreats(EmptyX, EmptyY) = 1
        If NumYellow = 0 And NumRed = 3 Then Value = Value - IIf(EmptyY Mod 2 = 0, 50, 20): RedThreats(EmptyX, EmptyY) = 1
        If NumYellow = 2 And NumRed = 0 Then Value = Value + 8
        If NumYellow = 0 And NumRed = 2 Then Value = Value - 8
    Next
Next

End If 'If EvalFunc........

If EvalFunc = 3 Then

Dim CountRedOdd As Boolean
For i = 1 To 7
    CountRedOdd = True
    For j = 2 To 6
        If YellowThreats(i, j) = 1 And j Mod 2 = 1 And Board(i, j - 1) = 0 Then
            YellowOddThreatsNum = YellowOddThreatsNum + 1
            If RedThreats(i, j) = 1 And YellowThreats(i, j - 1) = 0 Then RedOddThreatsNum = RedOddThreatsNum + 1
            Exit For
        End If
        
        If RedThreats(i, j) = 1 And j Mod 2 = 0 And Board(i, j - 1) = 0 Then RedEvenThreatsNum = RedEvenThreatsNum + 1: Exit For
        If CountRedOdd = True And RedThreats(i, j) = 1 And YellowThreats(i, j) = 0 And YellowThreats(i, j - 1) = 0 And j Mod 2 = 1 And Board(i, j - 1) = 0 Then RedOddThreatsNum = RedOddThreatsNum + 1: FreeOddRed = FreeOddRed + 1: CountRedOdd = False
        
        If YellowThreats(i, j) = 1 And Board(i, j - 1) <> 0 And SearchPlayerToGo = 1 Then Value = Value + 2000
        If RedThreats(i, j) = 1 And Board(i, j - 1) <> 0 And SearchPlayerToGo = -1 Then Value = Value - 2000
    
    Next
Next
FreeOddYellow = YellowOddThreatsNum - (RedOddThreatsNum - FreeOddRed)
'If YellowOddThreatsNum >= 1 And FreeOddRed = 0 And RedOddThreatsNum < 2 Then Value = Value + 500
If YellowOddThreatsNum > RedOddThreatsNum Then Value = Value + 500
If FreeOddYellow = 0 And RedOddThreatsNum >= 2 Then Value = Value - 500
If RedEvenThreatsNum >= 1 And FreeOddRed >= YellowOddThreatsNum Then Value = Value - 500

End If 'If EvalFunc........

If EvalFunc >= 1 Then

For i = Maximum(MovesNum - StartDepth + 1, 1) To MovesNum
    Select Case MovesList(i)
        Case 4
            Value = Value + 20 * PlayerToGo * IIf((i - (MovesNum - StartDepth + 1)) Mod 2 = 0, 1, -1)
        Case 3, 5
            Value = Value + 10 * PlayerToGo * IIf((i - (MovesNum - StartDepth + 1)) Mod 2 = 0, 1, -1)
        Case 2, 6
            Value = Value + 5 * PlayerToGo * IIf((i - (MovesNum - StartDepth + 1)) Mod 2 = 0, 1, -1)
    End Select
Next

End If 'If EvalFunc........

EvaluateBoard = Value * Player
End Function
'''''''''''''''''''''''''''''''''''''''''''
Private Function Maximum(x1 As Integer, x2 As Integer) As Integer
If x1 > x2 Then Maximum = x1 Else Maximum = x2
End Function
Private Function Minimum(x1 As Integer, x2 As Integer) As Integer
If x1 < x2 Then Minimum = x1 Else Minimum = x2
End Function
Private Sub Paintboard()
Dim i As Integer, j As Integer
Picboard.Cls
For i = 1 To 7
    For j = 1 To 6
        Call PaintCell(i, j, Board(i, j))
        'If Board(i, j) = 1 Then Picboard.PaintPicture PicPieces.Picture, (i - 1) * 46 + 75.8, (6 - j) * 39.5 + 13, 40, 40, 0, 40, 40, 40  'draw a yellow piece
        'If Board(i, j) = -1 Then Picboard.PaintPicture PicPieces.Picture, (i - 1) * 46 + 75.8, (6 - j) * 39.5 + 13, 40, 40, 0, 79, 40, 40 'draw a red piece
    Next
Next
End Sub
Private Sub PaintCell(X As Integer, Y As Integer, Color As Integer)
If Color = 1 Then Picboard.PaintPicture PicPieces.Picture, (X - 1) * 46 + 75.8, (6 - Y) * 39.5 + 13, 40, 40, 0, 40, 40, 40 'draw a yellow piece
If Color = -1 Then Picboard.PaintPicture PicPieces.Picture, (X - 1) * 46 + 75.8, (6 - Y) * 39.5 + 13, 40, 40, 0, 79, 40, 40 'draw a red piece
If Color = 0 Then Picboard.PaintPicture PicPieces.Picture, (X - 1) * 46 + 75.8, (6 - Y) * 39.5 + 13, 40, 40, 0, 118, 40, 40 'draw a blank cell
End Sub
Private Sub Form_Load()
NewGame
mnuSkillLevel_Click (2)
CommonDialog1.Flags = (cdlOFNPathMustExist Or cdlOFNOverwritePrompt)
End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub

Private Sub Image1_Click(Index As Integer)
If AllowMoving = True And IsGameOver = False And PiecesInColumn(Index + 1) < 6 Then
    MakeMove (Index + 1)
    If mnuComputer.Checked = True And IsGameOver = False Then DoEvents: ComputerMove
End If
End Sub

Private Sub mnuComputer_Click()
mnuComputer.Checked = True
mnuPlayer.Checked = False
End Sub

Private Sub mnuExit_Click()
End
End Sub

Private Sub mnuLoad_Click()
On Error GoTo Errr
Dim StrGame As String, i As Integer
CommonDialog1.Filter = "Connect Four Game Files |*.cfgf|"
CommonDialog1.ShowOpen
If CommonDialog1.FileName = "" Then Exit Sub
Open CommonDialog1.FileName For Input As #1
Input #1, StrGame
Close #1
NewGame
For i = 1 To Len(StrGame)
    Call ArrayMakeMove(Mid(StrGame, i, 1), PlayerToGo)
    PlayerToGo = -PlayerToGo
Next
Paintboard
UpdateMovesList
If MovesNum = 42 Then IsGameOver = True
SaveMovesNum = MovesNum
If CheckWin(Mid(StrGame, Len(StrGame), 1), PiecesInColumn(Mid(StrGame, Len(StrGame), 1))) = True Then IsGameOver = True
If IsGameOver = False Then
    If PlayerToGo = 1 Then Image2.Visible = True: Image3.Visible = False Else Image3.Visible = True: Image2.Visible = False
Else
    Image2.Visible = False: Image3.Visible = False
End If
Exit Sub
Errr:
MsgBox (Err.Description)
Exit Sub
End Sub

Private Sub mnuMoveNow_Click()
If IsGameOver = False And AllowMoving = True Then ComputerMove
End Sub

Private Sub mnuNewGame_Click()
If AllowMoving = True Then NewGame
End Sub

Private Sub mnuPlayer_Click()
mnuPlayer.Checked = True
mnuComputer.Checked = False
End Sub

Private Sub mnuRedo_Click()
Dim Column As Integer
If MovesNum = SaveMovesNum Then Exit Sub
Column = MovesList(MovesNum + 1)
Board(Column, PiecesInColumn(Column) + 1) = PlayerToGo
PiecesInColumn(Column) = PiecesInColumn(Column) + 1
MovesNum = MovesNum + 1
Paintboard
UpdateMovesList
If CheckWin(Column, PiecesInColumn(Column)) = True Then IsGameOver = True: DoEvents: Sleep (200): BlinkWin (Column)
If MovesNum = 42 Then IsGameOver = True
PlayerToGo = -PlayerToGo
If IsGameOver = False Then
    If PlayerToGo = 1 Then Image2.Visible = True: Image3.Visible = False Else Image3.Visible = True: Image2.Visible = False
Else
    Image2.Visible = False: Image3.Visible = False
End If
End Sub

Private Sub mnuSave_Click()
On Error GoTo Errr
Dim i As Integer, StrGame As String
StrGame = ""
For i = 1 To SaveMovesNum
    StrGame = StrGame + Str(MovesList(i))
Next
StrGame = Replace(StrGame, " ", "")
CommonDialog1.Filter = "Connect Four Game Files |*.cfgf|"
CommonDialog1.ShowSave
If CommonDialog1.FileName = "" Then Exit Sub
Open CommonDialog1.FileName For Output As #1
Write #1, StrGame
Close #1
Exit Sub
Errr:
MsgBox (Err.Description)
Exit Sub
End Sub

Private Sub mnuSkillLevel_Click(Index As Integer)
Dim i As Integer
For i = 0 To 7
    If i = Index Then mnuskilllevel(i).Checked = True Else mnuskilllevel(i).Checked = False
Next
If Index = 5 Then SearchWin = True Else SearchWin = False
If Index <> 7 Then
    TimeLimit = 5
    Select Case Index
    Case 0
        DepthLimit = 2
        EvalFunc = 1
    Case 1
        DepthLimit = 4
        EvalFunc = 1
    Case 2
        DepthLimit = 4
        EvalFunc = 3
    Case 3
        DepthLimit = 8
        EvalFunc = 3
    Case 4
        DepthLimit = 30
        TimeLimit = 180
        EvalFunc = 0
    End Select
Else
    Load frmAI
    frmAI.Show vbModal, frmMain
End If
End Sub


Private Sub mnuUndo_Click()
Dim Column As Integer
If MovesNum = 0 Then Exit Sub
IsGameOver = False
Column = MovesList(MovesNum)
Board(Column, PiecesInColumn(Column)) = 0
PiecesInColumn(Column) = PiecesInColumn(Column) - 1
MovesNum = MovesNum - 1
PlayerToGo = -PlayerToGo
If PlayerToGo = 1 Then Image2.Visible = True: Image3.Visible = False Else Image3.Visible = True: Image2.Visible = False
Paintboard
UpdateMovesList
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
If AllowMoving = False And Button.Key <> "stop" Then Exit Sub
Select Case Button.Key
    Case "new"
        mnuNewGame_Click
    Case "load"
        mnuLoad_Click
    Case "save"
        mnuSave_Click
    Case "move"
        mnuMoveNow_Click
    Case "undo"
        mnuUndo_Click
    Case "redo"
        mnuRedo_Click
    Case "stop"
        StopThinking = True
End Select
End Sub
