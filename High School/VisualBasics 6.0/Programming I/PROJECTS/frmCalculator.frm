VERSION 5.00
Begin VB.Form frmCalculator 
   BackColor       =   &H80000004&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Calculator"
   ClientHeight    =   7335
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   7455
   ForeColor       =   &H00000000&
   Icon            =   "frmCalculator.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7335
   ScaleWidth      =   7455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraCalculations 
      BackColor       =   &H80000004&
      ForeColor       =   &H00000000&
      Height          =   2295
      Left            =   4080
      TabIndex        =   46
      Top             =   1080
      Width           =   2055
      Begin VB.CommandButton cmdEquals 
         Caption         =   "="
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   53
         Top             =   1680
         Width           =   1095
      End
      Begin VB.CommandButton cmdSub 
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   52
         Top             =   1200
         Width           =   495
      End
      Begin VB.CommandButton cmdDiv 
         Caption         =   "/"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   51
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmdParR 
         Caption         =   ")"
         Height          =   375
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   50
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmdParL 
         Caption         =   "("
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   49
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmdMult 
         Caption         =   "*"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   48
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   47
         Top             =   1200
         Width           =   495
      End
   End
   Begin VB.Frame fraBaseNum 
      BackColor       =   &H80000004&
      ForeColor       =   &H00000000&
      Height          =   4935
      Left            =   6240
      TabIndex        =   24
      Top             =   1080
      Width           =   1095
      Begin VB.OptionButton optB19 
         BackColor       =   &H80000004&
         Caption         =   "B19"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   45
         Top             =   4320
         Width           =   855
      End
      Begin VB.OptionButton optB18 
         BackColor       =   &H80000004&
         Caption         =   "B18"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   44
         Top             =   4080
         Width           =   855
      End
      Begin VB.OptionButton optB17 
         BackColor       =   &H80000004&
         Caption         =   "B17"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   43
         Top             =   3840
         Width           =   855
      End
      Begin VB.OptionButton optB15 
         BackColor       =   &H80000004&
         Caption         =   "B15"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   42
         Top             =   3360
         Width           =   855
      End
      Begin VB.OptionButton optB14 
         BackColor       =   &H80000004&
         Caption         =   "B14"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   41
         Top             =   3120
         Width           =   855
      End
      Begin VB.OptionButton optB13 
         BackColor       =   &H80000004&
         Caption         =   "B13"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   40
         Top             =   2880
         Width           =   855
      End
      Begin VB.OptionButton optB12 
         BackColor       =   &H80000004&
         Caption         =   "B12"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   39
         Top             =   2640
         Width           =   855
      End
      Begin VB.OptionButton optB11 
         BackColor       =   &H80000004&
         Caption         =   "B11"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   38
         Top             =   2400
         Width           =   855
      End
      Begin VB.OptionButton optB9 
         BackColor       =   &H80000004&
         Caption         =   "B9"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   37
         Top             =   1920
         Width           =   855
      End
      Begin VB.OptionButton optB7 
         BackColor       =   &H80000004&
         Caption         =   "B7"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   36
         Top             =   1440
         Width           =   855
      End
      Begin VB.OptionButton optB6 
         BackColor       =   &H80000004&
         Caption         =   "B6"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   1200
         Width           =   855
      End
      Begin VB.OptionButton optB5 
         BackColor       =   &H80000004&
         Caption         =   "B5"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   34
         Top             =   960
         Width           =   855
      End
      Begin VB.OptionButton optB3 
         BackColor       =   &H80000004&
         Caption         =   "B3"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   33
         Top             =   480
         Width           =   855
      End
      Begin VB.OptionButton optB20 
         BackColor       =   &H80000004&
         Caption         =   "B20"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   32
         Top             =   4560
         Width           =   855
      End
      Begin VB.OptionButton optB16 
         BackColor       =   &H80000004&
         Caption         =   "B16"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   29
         Top             =   3600
         Width           =   855
      End
      Begin VB.OptionButton optB10 
         BackColor       =   &H80000004&
         Caption         =   "B10"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   2160
         Width           =   855
      End
      Begin VB.OptionButton optB8 
         BackColor       =   &H80000004&
         Caption         =   "B8"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   27
         Top             =   1680
         Width           =   855
      End
      Begin VB.OptionButton optB4 
         BackColor       =   &H80000004&
         Caption         =   "B4"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   720
         Width           =   855
      End
      Begin VB.OptionButton optB2 
         BackColor       =   &H80000004&
         Caption         =   "B2"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   25
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.Frame fraCalculator 
      BackColor       =   &H80000004&
      ForeColor       =   &H00000000&
      Height          =   2295
      Left            =   120
      TabIndex        =   1
      Top             =   1080
      Width           =   3855
      Begin VB.CommandButton cmdChange 
         Caption         =   "+ -"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   31
         Top             =   1680
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.CommandButton cmdBackspace 
         Caption         =   "<<<"
         BeginProperty Font 
            Name            =   "MT Extra"
            Size            =   8.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   1680
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.CommandButton cmdPeriod 
         Caption         =   "."
         Height          =   375
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   1680
         Width           =   495
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "C"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   1680
         Width           =   495
      End
      Begin VB.CommandButton cmdJ 
         Caption         =   "J"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   1680
         Width           =   495
      End
      Begin VB.CommandButton cmdI 
         Caption         =   "I"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   1200
         Width           =   495
      End
      Begin VB.CommandButton cmdH 
         Caption         =   "H"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   1200
         Width           =   495
      End
      Begin VB.CommandButton cmdG 
         Caption         =   "G"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   1200
         Width           =   495
      End
      Begin VB.CommandButton cmdF 
         Caption         =   "F"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmdE 
         Caption         =   "E"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmdD 
         Caption         =   "D"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmdC 
         Caption         =   "C"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmdB 
         Caption         =   "B"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmdA 
         Caption         =   "A"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmd2 
         Caption         =   "2"
         Height          =   375
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   1200
         Width           =   495
      End
      Begin VB.CommandButton cmd3 
         Caption         =   "3"
         Height          =   375
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   1200
         Width           =   495
      End
      Begin VB.CommandButton cmd1 
         Caption         =   "1"
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   1200
         Width           =   495
      End
      Begin VB.CommandButton cmd4 
         Caption         =   "4"
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmd5 
         Caption         =   "5"
         Height          =   375
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmd6 
         Caption         =   "6"
         Height          =   375
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton cmd7 
         Caption         =   "7"
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmd8 
         Caption         =   "8"
         Height          =   375
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmd9 
         Caption         =   "9"
         Height          =   375
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton cmd0 
         Caption         =   "0"
         Height          =   375
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   1680
         Width           =   495
      End
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "20 Base Calculator"
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   120
      TabIndex        =   55
      Top             =   120
      Width           =   7215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H8000000B&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000080FF&
      Height          =   1095
      Left            =   4320
      TabIndex        =   54
      Top             =   6120
      Width           =   3015
   End
   Begin VB.Label lblDisplay 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   13.5
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   7215
   End
End
Attribute VB_Name = "frmCalculator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'variables for gathering numbers
Dim LengthStringNum1 As Integer
Dim LengthStringNum2 As Integer
Dim strFirstNum As String
Dim strSecondNum As String

Dim strNum1(1 To 20) As String
Dim intNum1(1 To 20) As Integer

Dim strNum2(1 To 20) As String
Dim intNum2(1 To 20) As Integer

Dim NumCount As Integer

'variables for adding numbers
Dim Base As Integer 'from 2 to 20
Dim strDigit1 As String
Dim strDigit2 As String
Dim intDigit1 As Integer
Dim intDigit2 As Integer
Dim D1Carry As Integer
Dim intNumTotal As Integer








Private Sub cmd0_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "0"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd1_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 1
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd2_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 2
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd3_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 3
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd4_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 4
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd5_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 5
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd6_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 6
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd7_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 7
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd8_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 8
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmd9_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & 9
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdA_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "A"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdAdd_Click()

    NumCount = NumCount + 1
    
    strFirstNum = lblDisplay.Caption
    
    'find length of string
    LengthStringNum1 = Len(strFirstNum)
    
    'store Num1 string digits
    For d = 1 To LengthStringNum1
        'get the right justified digit
        strNum1(d) = Mid$(strFirstNum, LengthStringNum1 - d + 1, 1)
        
        'convert strNum1 to intNum1'
        If strNum1(d) = "0" Or strNum1(d) = "1" Or strNum1(d) = "2" Or strNum1(d) = "3" Or strNum1(d) = "4" Or strNum1(d) = "5" Or strNum1(d) = "6" Or strNum1(d) = "7" Or strNum1(d) = "8" Or strNum1(d) = "9" Then
            intNum1(d) = Asc(strNum1(d)) - 48
        Else
            intNum1(d) = Asc(strNum1(d)) - 55
        End If
        
        Print strNum1(d), intNum1(d)
        
    Next d
    
    '//MsgBox (intNum1)
    
    lblDisplay.Caption = ""
    
End Sub

Private Sub cmdB_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "B"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdBackspace_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
End Sub

Private Sub cmdC_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "C"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdClear_Click()

    If lblDisplay.Caption = "0" Then
        lblDisplay.Caption = ""
        End If
    
    lblDisplay.Caption = "0"

    NumCount = 0
    
    cmdPeriod.Enabled = True
    
    cmdAdd.Enabled = True
    cmdSub.Enabled = True
    cmdMult.Enabled = True
    cmdDiv.Enabled = True
    
    cmdEquals.Enabled = False
    
End Sub

Private Sub cmdD_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "D"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdE_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "E"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdEquals_Click()

    NumCount = NumCount + 1
    
    strSecondNum = lblDisplay.Caption
    
    'find length of second number string
    LengthStringNum2 = Len(strSecondNum)
    
    For d = 1 To LengthStringNum2
        'get right justified digits
        strNum2(d) = Mid$(strSecondNum, LengthStringNum2 - d + 1, 1)
        
        'convert strNum1 to intNum1'
        If strNum2(d) = "0" Or strNum2(d) = "1" Or strNum2(d) = "2" Or strNum2(d) = "3" Or strNum2(d) = "4" Or strNum2(d) = "5" Or strNum2(d) = "6" Or strNum2(d) = "7" Or strNum2(d) = "8" Or strNum2(d) = "9" Then
            intNum2(d) = Asc(strNum2(d)) - 48
        Else
            intNum2(d) = Asc(strNum2(d)) - 55
        End If
    
        Print strNum2(d), intNum2(d)
    
    Next d
    
    '//MsgBox (intNum2)
    
    'add intNum1 to intNum2
    intNumTotal = intNum1(d) + intNum2(d)
    
    'determine if there is a carry digit
    D1Carry = intNumTotal \ Base          'Integer Division
    
    'determine digit 1... the rightmost digit
    intDigit1 = intNumTotal Mod Base
    
    'Tester... display our result
    Label1.Caption = D1Carry & " " & intDigit1
    
    lblDisplay.Caption = intNumTotal
    
End Sub

Private Sub cmdF_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "F"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdG_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "G"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdH_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "H"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdI_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "I"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdJ_Click()

If lblDisplay.Caption = "0" Then
    lblDisplay.Caption = ""
    End If
    
    lblDisplay.Caption = lblDisplay.Caption & "J"
    
    If NumCount Mod 2 = 1 Then
        cmdEquals.Enabled = True
        cmdAdd.Enabled = False
        cmdSub.Enabled = False
        Else
        cmdEquals.Enabled = False
        cmdAdd.Enabled = True
        cmdSub.Enabled = True
    End If
    
End Sub

Private Sub cmdParL_Click()

    lblDisplay.Caption = lblDisplay.Caption & "("
    
End Sub

Private Sub cmdParR_Click()

    lblDisplay.Caption = lblDisplay.Caption & ")"
    
End Sub

Private Sub cmdPeriod_Click()

    lblDisplay.Caption = lblDisplay.Caption & "."
    cmdPeriod.Enabled = False
    
End Sub

Private Sub cmdSub_Click()

    NumCount = NumCount + 1
    
    strNum1 = lblDisplay.Caption
    
    'convert strNum1 to intNum1'
    If strNum1 = "0" Or strNum1 = "1" Or strNum1 = "2" Or strNum1 = "3" Or strNum1 = "4" Or strNum1 = "5" Or strNum1 = "6" Or strNum1 = "7" Or strNum1 = "8" Or strNum1 = "9" Then
        intNum1 = Asc(strNum1) - 48
    Else
        intNum1 = Asc(strNum1) - 55
    End If
    
    '//MsgBox (intNum1)
    
End Sub

Private Sub Form_Load()

    cmdEquals.Enabled = False
    
    'Intitiate Program
    Base = 10

    optB10.Value = True

        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
    
End Sub

Private Sub lblDisplay_Change()

    If lblDisplay.Caption = "00" Or lblDisplay.Caption = "000" Then
        lblDisplay.Caption = "0"
        End If
        
End Sub

Private Sub optB10_Click()

    Base = 10

    If optB10.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB11_Click()

    Base = 11

    If optB11.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB12_Click()

    Base = 12

    If optB12.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB13_Click()

    Base = 13

    If optB13.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB14_Click()

    Base = 14

    If optB14.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = False
        cmd3.Visible = False
        cmd4.Visible = False
        cmd5.Visible = False
        cmd6.Visible = False
        cmd7.Visible = False
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB15_Click()

    Base = 15

    If optB15.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = True
        cmdD.Visible = True
        cmdE.Visible = True
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB16_Click()

    Base = 16

    If optB16.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = True
        cmdD.Visible = True
        cmdE.Visible = True
        cmdF.Visible = True
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB17_Click()

    Base = 17

    If optB17.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = True
        cmdD.Visible = True
        cmdE.Visible = True
        cmdF.Visible = True
        cmdG.Visible = True
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB18_Click()

    Base = 18

    If optB18.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = True
        cmdD.Visible = True
        cmdE.Visible = True
        cmdF.Visible = True
        cmdG.Visible = True
        cmdH.Visible = True
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB19_Click()

    Base = 19

    If optB19.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = True
        cmdD.Visible = True
        cmdE.Visible = True
        cmdF.Visible = True
        cmdG.Visible = True
        cmdH.Visible = True
        cmdI.Visible = True
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB2_Click()

    Base = 2

    If optB2.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = False
        cmd3.Visible = False
        cmd4.Visible = False
        cmd5.Visible = False
        cmd6.Visible = False
        cmd7.Visible = False
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB20_Click()

    Base = 20

    If optB20.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = True
        cmdA.Visible = True
        cmdB.Visible = True
        cmdC.Visible = True
        cmdD.Visible = True
        cmdE.Visible = True
        cmdF.Visible = True
        cmdG.Visible = True
        cmdH.Visible = True
        cmdI.Visible = True
        cmdJ.Visible = True
        
        Else
        
    End If
    
End Sub

Private Sub optB3_Click()

    Base = 3

    If optB3.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = False
        cmd4.Visible = False
        cmd5.Visible = False
        cmd6.Visible = False
        cmd7.Visible = False
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB4_Click()

    Base = 4

    If optB4.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = False
        cmd5.Visible = False
        cmd6.Visible = False
        cmd7.Visible = False
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB5_Click()

    Base = 5

    If optB5.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = False
        cmd6.Visible = False
        cmd7.Visible = False
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB6_Click()

    Base = 6

    If optB6.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = False
        cmd7.Visible = False
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB7_Click()

    Base = 7

    If optB7.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = False
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB8_Click()

    Base = 8

    If optB8.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = False
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub

Private Sub optB9_Click()

    Base = 9

    If optB9.Value = True Then
        cmd0.Visible = True
        cmd1.Visible = True
        cmd2.Visible = True
        cmd3.Visible = True
        cmd4.Visible = True
        cmd5.Visible = True
        cmd6.Visible = True
        cmd7.Visible = True
        cmd8.Visible = True
        cmd9.Visible = False
        cmdA.Visible = False
        cmdB.Visible = False
        cmdC.Visible = False
        cmdD.Visible = False
        cmdE.Visible = False
        cmdF.Visible = False
        cmdG.Visible = False
        cmdH.Visible = False
        cmdI.Visible = False
        cmdJ.Visible = False
        
        Else
        
    End If
    
End Sub
