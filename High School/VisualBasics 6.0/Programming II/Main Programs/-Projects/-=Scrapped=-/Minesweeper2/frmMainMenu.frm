VERSION 5.00
Begin VB.Form frmMainMenu 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Main Menu"
   ClientHeight    =   9030
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   8895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9030
   ScaleWidth      =   8895
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtCMines 
      Height          =   495
      Left            =   4560
      TabIndex        =   6
      Text            =   "10"
      Top             =   6240
      Width           =   3255
   End
   Begin VB.TextBox txtCLength 
      Height          =   495
      Left            =   4560
      TabIndex        =   5
      Text            =   "10"
      Top             =   5040
      Width           =   3255
   End
   Begin VB.TextBox txtCHeight 
      Height          =   495
      Left            =   4560
      TabIndex        =   4
      Text            =   "10"
      Top             =   5640
      Width           =   3255
   End
   Begin VB.CommandButton cmdCustom 
      Caption         =   "Custom"
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      TabIndex        =   3
      Top             =   3840
      Width           =   6735
   End
   Begin VB.CommandButton cmdHard 
      Caption         =   "Expert"
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      TabIndex        =   2
      Top             =   2880
      Width           =   6735
   End
   Begin VB.CommandButton cmdNormal 
      Caption         =   "Intermediate"
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      TabIndex        =   1
      Top             =   1920
      Width           =   6735
   End
   Begin VB.CommandButton cmdEasy 
      Caption         =   "Beginner"
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1080
      TabIndex        =   0
      Top             =   960
      Width           =   6735
   End
End
Attribute VB_Name = "frmMainMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdEasy_Click()

    'Init
    XTemp = 10
    YTemp = 10
    BTemp = 10
    'Go to next Form
    frmMainMenu.Hide
    frmMinesweeper.Show
    frmMinesweeper.Visible = False
    frmLoadingScreen.Show
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub
