VERSION 5.00
Begin VB.Form frmPopQuiz 
   Caption         =   "Test"
   ClientHeight    =   7650
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9255
   LinkTopic       =   "Form1"
   ScaleHeight     =   7650
   ScaleWidth      =   9255
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraColorOpts 
      Caption         =   "BG Color"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3495
      Left            =   1800
      TabIndex        =   1
      Top             =   120
      Width           =   3495
      Begin VB.OptionButton OptBlack 
         Caption         =   "Black"
         Height          =   375
         Left            =   240
         TabIndex        =   6
         ToolTipText     =   "Makes your Background Black."
         Top             =   2880
         Width           =   3015
      End
      Begin VB.OptionButton optWhite 
         Caption         =   "White"
         Height          =   375
         Left            =   240
         TabIndex        =   5
         ToolTipText     =   "Makes your Background White."
         Top             =   2280
         Width           =   3015
      End
      Begin VB.OptionButton optYellow 
         Caption         =   "Yellow"
         Height          =   375
         Left            =   240
         TabIndex        =   4
         ToolTipText     =   "Makes your Background Yellow"
         Top             =   1680
         Width           =   3135
      End
      Begin VB.OptionButton optBlue 
         Caption         =   "Blue"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         ToolTipText     =   "Makes your Background Blue."
         Top             =   1080
         Width           =   3015
      End
      Begin VB.OptionButton optRed 
         Caption         =   "Red"
         Height          =   375
         Left            =   240
         TabIndex        =   2
         ToolTipText     =   "Makes your Background Red."
         Top             =   480
         Width           =   3015
      End
   End
   Begin VB.CommandButton cmdMaximize 
      Caption         =   "Maximize"
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   1335
   End
End
Attribute VB_Name = "frmPopQuiz"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdMaximize_Click()

    frmPopQuiz.WindowState = 2

End Sub

Private Sub OptBlack_Click()

    frmPopQuiz.BackColor = vbBlack
    fraColorOpts.ForeColor = vbBlack

End Sub

Private Sub optBlue_Click()

    frmPopQuiz.BackColor = vbBlue
    fraColorOpts.ForeColor = vbBlue

End Sub

Private Sub optRed_Click()

    frmPopQuiz.BackColor = vbRed
    fraColorOpts.ForeColor = vbRed
    
End Sub

Private Sub optWhite_Click()

    frmPopQuiz.BackColor = vbWhite
    fraColorOpts.ForeColor = vbWhite

End Sub

Private Sub optYellow_Click()

    frmPopQuiz.BackColor = vbYellow
    fraColorOpts.ForeColor = vbYellow

End Sub
