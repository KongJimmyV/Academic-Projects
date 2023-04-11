VERSION 5.00
Begin VB.Form frmTextIntro 
   Caption         =   "Intro To Text Boxes"
   ClientHeight    =   7335
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9375
   LinkTopic       =   "Form1"
   ScaleHeight     =   7335
   ScaleWidth      =   9375
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdProcess 
      Caption         =   "Process"
      Height          =   1095
      Left            =   1920
      TabIndex        =   1
      Top             =   4080
      Width           =   3015
   End
   Begin VB.TextBox txtInput 
      Alignment       =   2  'Center
      BackColor       =   &H000000C0&
      BeginProperty Font 
         Name            =   "Segoe Script"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   3255
      IMEMode         =   3  'DISABLE
      Left            =   600
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "frmTextIntro.frx":0000
      Top             =   480
      Width           =   6015
   End
   Begin VB.Label lblResult 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "DejaVu Serif Condensed"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1200
      TabIndex        =   2
      Top             =   5520
      Width           =   4695
   End
End
Attribute VB_Name = "frmTextIntro"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdProcess_Click()

    Dim Password As String
    Dim Num As Single
    
    Password = txtInput.Text
    
    If Password = "PROGRAMMING I" Then
        MsgBox ("Welcome!")
    Else
        MsgBox ("Seriously?")
    End If

End Sub

Private Sub txtInput_Click()

    txtInput.Text = ""
    If txtInput.Text = "" Then
    txtInput.PasswordChar = "*"
    Else
    txtInput.PasswordChar = ""
    End If
    
End Sub
