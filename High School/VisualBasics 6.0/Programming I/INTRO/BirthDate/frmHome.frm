VERSION 5.00
Begin VB.Form frmHome 
   Caption         =   "Home"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End"
      Height          =   495
      Left            =   1800
      TabIndex        =   3
      Top             =   2400
      Width           =   975
   End
   Begin VB.CommandButton cmdBYear 
      Caption         =   "Birth Year"
      Height          =   735
      Left            =   3240
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton cmdBMonth 
      Caption         =   "Birth Month"
      Height          =   735
      Left            =   1680
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton cmdBDay 
      Caption         =   "Birth Day"
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmHome"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBDay_Click()

    frmHome.Hide
    frmBDay.Show

End Sub

Private Sub cmdBMonth_Click()

    frmHome.Hide
    frmBMonth.Show
    
End Sub

Private Sub cmdBYear_Click()

    frmHome.Hide
    frmBYear.Show
    
End Sub

Private Sub cmdEnd_Click()

    frmHome.Hide
    frmEnd.Show
    
End Sub
