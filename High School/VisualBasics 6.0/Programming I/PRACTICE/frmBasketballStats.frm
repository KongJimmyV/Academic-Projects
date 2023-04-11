VERSION 5.00
Begin VB.Form frmBasketballStats 
   Caption         =   "Basketball Stats"
   ClientHeight    =   5175
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   ScaleHeight     =   5175
   ScaleWidth      =   5895
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdEnter 
      Caption         =   "Enter"
      Height          =   615
      Left            =   1440
      TabIndex        =   0
      Top             =   4080
      Width           =   3015
   End
   Begin VB.Label lblPercent 
      Caption         =   "Overall Percentage:"
      Height          =   1095
      Left            =   960
      TabIndex        =   3
      Top             =   2760
      Width           =   3975
   End
   Begin VB.Label lblTaken 
      Caption         =   "Overall Shots Taken:"
      Height          =   855
      Left            =   960
      TabIndex        =   2
      Top             =   1680
      Width           =   3975
   End
   Begin VB.Label lblMade 
      Caption         =   "Overall Shots Made:"
      Height          =   855
      Left            =   960
      TabIndex        =   1
      Top             =   600
      Width           =   3975
   End
End
Attribute VB_Name = "frmBasketballStats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Num As Integer
Dim G As Integer
Dim Made As Integer
Dim Taken As Integer
Dim TotalMade As Integer
Dim TotalTaken As Integer
Dim OAPercent As Single


Private Sub cmdEnter_Click()

    Num = InputBox("How Many Games?", "How Many Games?")
    
    For G = 1 To Num
        Made = InputBox("Made?", "Shots Made?")
        Taken = InputBox("Taken?", "Shots Taken?")
        TotalMade = TotalMade + Made
        TotalTaken = TotalTaken + Taken
    Next G
    
    OAPercent = TotalMade / TotalTaken
    
    lblMade.Caption = "Overall Shots Made:  " & TotalMade
    lblTaken.Caption = "Overall Shots Taken:  " & TotalTaken
    lblPercent.Caption = "Overall Percent:  " & Format(OAPercent, "percent")
    
End Sub
