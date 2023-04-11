VERSION 5.00
Begin VB.Form frmChar 
   Caption         =   "Form1"
   ClientHeight    =   7320
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11640
   LinkTopic       =   "Form1"
   ScaleHeight     =   7320
   ScaleWidth      =   11640
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstChars 
      BackColor       =   &H0080C0FF&
      BeginProperty Font 
         Name            =   "Stencil"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1200
      ItemData        =   "frmChars.frx":0000
      Left            =   3240
      List            =   "frmChars.frx":0002
      TabIndex        =   1
      Top             =   240
      Width           =   3255
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Text            =   "Combo1"
      Top             =   240
      Width           =   2775
   End
   Begin VB.Image imgG 
      Height          =   2775
      Left            =   3600
      Picture         =   "frmChars.frx":0004
      Stretch         =   -1  'True
      Top             =   1800
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Image imgJ 
      Height          =   2775
      Left            =   3600
      Picture         =   "frmChars.frx":BC00
      Stretch         =   -1  'True
      Top             =   1800
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Image imgA 
      Height          =   2775
      Left            =   3600
      Picture         =   "frmChars.frx":261C7
      Stretch         =   -1  'True
      Top             =   1800
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   1455
      Left            =   1440
      TabIndex        =   2
      Top             =   5040
      Width           =   6255
   End
End
Attribute VB_Name = "frmChar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    lstChars.AddItem "Aladdin"
    lstChars.AddItem "Jasmine"
    lstChars.AddItem "Genie"

End Sub

Private Sub lstChars_Click()

    Select Case lstChars.Text
        Case "Aladdin":
            imgA.Visible = True
            imgJ.Visible = False
            imgG.Visible = False
        Case "Jasmine":
            imgJ.Visible = True
            imgA.Visible = False
            imgG.Visible = False
        Case "Genie":
            imgG.Visible = True
            imgA.Visible = False
            imgJ.Visible = False
    End Select
    

End Sub
