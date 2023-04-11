VERSION 5.00
Begin VB.Form frmBYear 
   Caption         =   "Birth Year"
   ClientHeight    =   4815
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6495
   LinkTopic       =   "Form1"
   ScaleHeight     =   4815
   ScaleWidth      =   6495
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdHome 
      Caption         =   "Home"
      Height          =   615
      Left            =   5040
      TabIndex        =   1
      Top             =   4080
      Width           =   1335
   End
   Begin VB.Label lblBYear 
      Caption         =   "1996"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
End
Attribute VB_Name = "frmBYear"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdHome_Click()

    frmBYear.Hide
    frmHome.Show
    
End Sub
