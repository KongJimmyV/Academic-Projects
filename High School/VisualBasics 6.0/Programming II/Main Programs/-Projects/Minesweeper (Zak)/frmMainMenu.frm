VERSION 5.00
Begin VB.Form frmMainMenu 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Main Menu"
   ClientHeight    =   9030
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   8895
   Icon            =   "frmMainMenu.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "frmMainMenu.frx":0442
   ScaleHeight     =   9030
   ScaleWidth      =   8895
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtCMines 
      Height          =   495
      Left            =   4560
      TabIndex        =   6
      Text            =   "1"
      Top             =   6240
      Width           =   3255
   End
   Begin VB.TextBox txtCLength 
      Height          =   495
      Left            =   4560
      TabIndex        =   5
      Text            =   "1"
      Top             =   5040
      Width           =   3255
   End
   Begin VB.TextBox txtCHeight 
      Height          =   495
      Left            =   4560
      TabIndex        =   4
      Text            =   "1"
      Top             =   5640
      Width           =   3255
   End
   Begin VB.CommandButton cmdCustom 
      Caption         =   "Custom"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      Picture         =   "frmMainMenu.frx":106094
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   3840
      Width           =   6735
   End
   Begin VB.CommandButton cmdHard 
      Caption         =   "Expert"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      Picture         =   "frmMainMenu.frx":11B87A
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   2880
      Width           =   6735
   End
   Begin VB.CommandButton cmdNormal 
      Caption         =   "Intermediate"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      Picture         =   "frmMainMenu.frx":131060
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1920
      Width           =   6735
   End
   Begin VB.CommandButton cmdEasy 
      Caption         =   "Beginner"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      Picture         =   "frmMainMenu.frx":146846
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   960
      Width           =   6735
   End
   Begin VB.Label lblD2 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "? M"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   14
      Top             =   4080
      Width           =   735
   End
   Begin VB.Label lblC2 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "99 M"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   3120
      Width           =   735
   End
   Begin VB.Label lblB2 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "40 M"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   12
      Top             =   2160
      Width           =   735
   End
   Begin VB.Label lblA2 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "10 M"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   1200
      Width           =   735
   End
   Begin VB.Label lblD1 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "?x?"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   10
      Top             =   3840
      Width           =   735
   End
   Begin VB.Label lblC1 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "30x30"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   9
      Top             =   2880
      Width           =   735
   End
   Begin VB.Label lblB1 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "20x20"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   1920
      Width           =   735
   End
   Begin VB.Label lblA1 
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "10x10"
      ForeColor       =   &H0000FF00&
      Height          =   255
      Left            =   360
      TabIndex        =   7
      Top             =   960
      Width           =   735
   End
End
Attribute VB_Name = "frmMainMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim iConstantVariable As Long
Dim MaxHeight As Integer
Dim MaxLength As Integer
Dim MinHeight As Integer
Dim MinLength As Integer

Private Sub cmdCustom_Click()

    Call TextCheck
    
    'Init
    XTemp = txtCLength.Text
    YTemp = txtCHeight.Text
    BTemp = txtCMines.Text
    
    Call MinesweeperInit
    
End Sub

Private Sub cmdEasy_Click()

    Call TextCheck
    
    'Init
    XTemp = 10
    YTemp = 10
    BTemp = 10
    
    Call MinesweeperInit
    
End Sub

Private Sub cmdHard_Click()

    Call TextCheck
    
    'Init
    XTemp = 30
    YTemp = 30
    BTemp = 99
    
    Call MinesweeperInit
    
End Sub

Private Sub cmdNormal_Click()

    Call TextCheck
    
    'Init
    XTemp = 20
    YTemp = 20
    BTemp = 40
    
    Call MinesweeperInit
    
End Sub

Private Sub Form_Load()

    iConstantVariable = 60 'Values from "0 to 200" is recommended
    MaxHeight = 40
    MaxLength = 40
    MinHeight = 5
    MinLength = 5
    
    txtCLength.Text = 20
    txtCHeight.Text = 20
    txtCMines.Text = 10
    
    lblD1.Caption = txtCLength.Text & "x" & txtCHeight.Text
    lblD2.Caption = txtCMines.Text & " M"
    
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Button = vbLeftButton Then
        Dim Red As Integer
        Dim Green As Integer
        Dim Blue As Integer
        Dim radius As Integer
        X2 = frmMainMenu.ScaleWidth / 2
        Y2 = frmMainMenu.ScaleHeight / 2
        Red = Int(Rnd * 255)
        Green = Int(Rnd * 255)
        Blue = Int(Rnd * 255)
        Line (X, Y)-(X, Y + 150), RGB(Red, Green, Blue)
        Line (X, Y)-(X, Y - 150), RGB(Red, Green, Blue)
        Line (X, Y)-(X + 150, Y), RGB(Red, Green, Blue)
        Line (X, Y)-(X - 150, Y), RGB(Red, Green, Blue)
        For radius = 150 To 1 Step -1
        If radius > 0 Then
            Circle (X, Y), radius, RGB(Red, Green, Blue)
            Circle (X, Y), radius, RGB(Red, Green, Blue)
            Circle (X, Y), radius, RGB(Red, Green, Blue)
            Circle (X, Y), radius, RGB(Red, Green, Blue)
        End If
        Next radius
    End If
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub txtCHeight_Click()
    Call TextCheck
End Sub

Private Sub txtCLength_Click()
    Call TextCheck
End Sub

Private Sub txtCMines_Click()
    Call TextCheck
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
    
    lblD1.Caption = txtCLength.Text & "x" & txtCHeight.Text
    lblD2.Caption = txtCMines.Text & " M"
    
End Sub

Private Sub MinesweeperInit()

    With frmLoadingScreen
    
        DefaultCellSize = ((255)) + iConstantVariable
        XMaze = XTemp
        YMaze = YTemp
        NumBomb = BTemp
        IntFactor = 100
        
        .lblLoading.Caption = "Loading..."
        .lbl.Caption = ">>>Initiating Game<<<"
        .tmrLoading.Enabled = True
        .tmrSet1Init.Enabled = True
        
    End With
    
    'Go to next Form
    frmMainMenu.Hide
    frmMinesweeper.Show
    frmMinesweeper.Visible = False
    frmLoadingScreen.Show
    
End Sub
