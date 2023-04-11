VERSION 5.00
Begin VB.Form frmBMonth 
   Caption         =   "Birth Month"
   ClientHeight    =   4695
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6630
   LinkTopic       =   "Form1"
   ScaleHeight     =   4695
   ScaleWidth      =   6630
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdHome 
      Caption         =   "Home"
      Height          =   615
      Left            =   5280
      TabIndex        =   1
      Top             =   3960
      Width           =   1215
   End
   Begin VB.Label lblBMonth 
      Caption         =   "January"
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
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2055
   End
End
Attribute VB_Name = "frmBMonth"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdHome_Click()

    frmBMonth.Hide
    frmHome.Show
    
End Sub
