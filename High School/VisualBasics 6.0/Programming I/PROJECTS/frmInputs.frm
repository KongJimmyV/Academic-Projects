VERSION 5.00
Begin VB.Form frmInputs 
   Caption         =   "Inputs"
   ClientHeight    =   9030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   18165
   LinkTopic       =   "Form1"
   ScaleHeight     =   9030
   ScaleWidth      =   18165
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraSports 
      Caption         =   "Sports"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   4080
      TabIndex        =   7
      Top             =   2280
      Width           =   3135
      Begin VB.CheckBox chkGolf 
         Caption         =   "Golf"
         Height          =   615
         Left            =   120
         TabIndex        =   11
         Top             =   2640
         Width           =   2895
      End
      Begin VB.CheckBox chkShow 
         Caption         =   "Show Choir"
         Height          =   615
         Left            =   120
         TabIndex        =   10
         Top             =   1920
         Width           =   2895
      End
      Begin VB.CheckBox chkSwimming 
         Caption         =   "Swimming"
         Height          =   615
         Left            =   120
         TabIndex        =   9
         Top             =   1200
         Width           =   2895
      End
      Begin VB.CheckBox chkBaseball 
         Caption         =   "Baseball"
         Height          =   615
         Left            =   120
         TabIndex        =   8
         Top             =   480
         Width           =   2895
      End
   End
   Begin VB.Frame fraHigh 
      Caption         =   "High School Colors"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   600
      TabIndex        =   3
      Top             =   2280
      Width           =   3255
      Begin VB.OptionButton optAquinas 
         Caption         =   "Aquinas"
         Height          =   615
         Left            =   120
         TabIndex        =   6
         Top             =   2400
         Width           =   3015
      End
      Begin VB.OptionButton optLogan 
         Caption         =   "Logan"
         Height          =   615
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   3015
      End
      Begin VB.OptionButton optCentral 
         Caption         =   "Central"
         Height          =   615
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   3015
      End
   End
   Begin VB.CommandButton cmdSquare 
      Caption         =   "Square Number"
      Height          =   615
      Left            =   3720
      TabIndex        =   2
      Top             =   1200
      Width           =   2655
   End
   Begin VB.TextBox txtSquare 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   2040
      TabIndex        =   1
      Text            =   "Enter a number to be Squared."
      Top             =   120
      Width           =   6135
   End
   Begin VB.CommandButton cmdMin 
      Caption         =   "Minimize Screen"
      Height          =   975
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "frmInputs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()

End Sub

Private Sub cmdMin_Click()

    frmInputs.WindowState = 1

End Sub

Private Sub optCentral_Click()

    optCentral.ForeColor = vbRed
    optCentral.BackColor = vbBlack

End Sub

Private Sub txtSquare_Click()

If txtSquare = "" Or txtSquare = "Enter a number to be Squared." Then
    txtSquare = ""
    Else
    
    End If

If txtSquare = Click Then
    txtSqaure = "Enter a number to be Squared."
    Else
    
    End If
    
End Sub
