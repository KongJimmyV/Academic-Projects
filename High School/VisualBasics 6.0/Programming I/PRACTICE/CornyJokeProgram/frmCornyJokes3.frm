VERSION 5.00
Begin VB.Form frmCornyJokes3 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CornyJoke3"
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
      Caption         =   "Done"
      Height          =   375
      Left            =   9360
      TabIndex        =   1
      Top             =   7080
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrevious 
      Caption         =   "Previous Joke"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   7080
      Width           =   1335
   End
   Begin VB.Label lblJokeQ 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Q. Why does a seagull fly over the sea?"
      Height          =   495
      Left            =   2040
      TabIndex        =   4
      Top             =   2160
      Width           =   6615
   End
   Begin VB.Label lblJokeA 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "A. Because if it flew over the bay it would be called a bagel!"
      Height          =   495
      Left            =   2040
      TabIndex        =   3
      Top             =   2640
      Width           =   6615
   End
   Begin VB.Label lblJoke3 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Joke 3"
      Height          =   615
      Left            =   4320
      TabIndex        =   2
      Top             =   1440
      Width           =   1935
   End
End
Attribute VB_Name = "frmCornyJokes3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdNext_Click()

    End
    
End Sub

Private Sub cmdPrevious_Click()

    frmCornyJokes3.Visible = False
    frmCornyJokes2.Visible = True

End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub
