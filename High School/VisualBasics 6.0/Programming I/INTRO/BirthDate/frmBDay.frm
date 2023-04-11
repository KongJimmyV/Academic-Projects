VERSION 5.00
Begin VB.Form frmBDay 
   Caption         =   "Birth Day"
   ClientHeight    =   5055
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6495
   LinkTopic       =   "Form1"
   ScaleHeight     =   5055
   ScaleWidth      =   6495
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdHome 
      Caption         =   "Home"
      Height          =   615
      Left            =   5040
      TabIndex        =   1
      Top             =   4320
      Width           =   1335
   End
   Begin VB.Label lblBDay 
      Caption         =   "16"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "frmBDay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdHome_Click()

    frmBDay.Hide
    frmHome.Show
    
End Sub
