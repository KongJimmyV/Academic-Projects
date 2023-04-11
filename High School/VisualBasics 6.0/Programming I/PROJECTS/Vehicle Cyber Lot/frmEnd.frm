VERSION 5.00
Begin VB.Form frmEnd 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Your Purchase has been Completed!"
   ClientHeight    =   6255
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   7335
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6255
   ScaleWidth      =   7335
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPurchase 
      Caption         =   "Purchase More"
      Height          =   495
      Left            =   3240
      TabIndex        =   3
      Top             =   5640
      Width           =   855
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "Done"
      Height          =   495
      Left            =   6360
      TabIndex        =   2
      Top             =   5640
      Width           =   855
   End
   Begin VB.CommandButton cmdHome 
      Caption         =   "Home"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgCars 
      Height          =   2655
      Left            =   1560
      Top             =   2880
      Width           =   4215
   End
   Begin VB.Image imgPizza 
      Height          =   1440
      Left            =   3000
      Picture         =   "frmEnd.frx":0000
      Stretch         =   -1  'True
      Top             =   1800
      Visible         =   0   'False
      Width           =   1395
   End
   Begin VB.Label lblEndThankYou 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Thank You for your business!"
      BeginProperty Font 
         Name            =   "Tempus Sans ITC"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   2655
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   6855
   End
End
Attribute VB_Name = "frmEnd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdEnd_Click()

    MsgBox ("Thank you for using this.  We hope to see you again!")
    
    imgPizza.Visible = True
    imgPizza.Width = 0.1
    imgPizza.Height = 0.1

End
End Sub

Private Sub cmdHome_Click()

    frmEnd.Visible = False
    frmHome.Visible = True
    
End Sub

Private Sub cmdPurchase_Click()

    frmEnd.Visible = False
    frmPurchase.Visible = True

End Sub
