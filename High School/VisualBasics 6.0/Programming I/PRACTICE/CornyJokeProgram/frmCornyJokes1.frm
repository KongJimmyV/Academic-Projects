VERSION 5.00
Begin VB.Form frmCornyJokes1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CornyJoke1"
   ClientHeight    =   7575
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   10695
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7575
   ScaleWidth      =   10695
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next Joke"
      Height          =   375
      Left            =   9360
      TabIndex        =   0
      Top             =   7080
      Width           =   1215
   End
   Begin VB.Label lblJoke1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Joke 1"
      Height          =   615
      Left            =   4320
      TabIndex        =   3
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Label lblJokeA 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "A. Ground beef."
      Height          =   495
      Left            =   2040
      TabIndex        =   2
      Top             =   2640
      Width           =   6615
   End
   Begin VB.Label lblJokeQ 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Q. What do you call a cow with no legs?"
      Height          =   495
      Left            =   2040
      TabIndex        =   1
      Top             =   2160
      Width           =   6615
   End
End
Attribute VB_Name = "frmCornyJokes1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdNext_Click()

    frmCornyJokes1.Visible = False
    frmCornyJokes2.Visible = True

End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub
