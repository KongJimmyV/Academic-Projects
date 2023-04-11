VERSION 5.00
Begin VB.Form frmAveOf3Num 
   Caption         =   "Form1"
   ClientHeight    =   3510
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9465
   LinkTopic       =   "Form1"
   ScaleHeight     =   3510
   ScaleWidth      =   9465
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdAVE 
      BackColor       =   &H00FFFFC0&
      Caption         =   "Click on this button to average the numbers."
      Height          =   1215
      Left            =   3480
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox txtN3 
      Height          =   615
      Left            =   2160
      TabIndex        =   5
      Top             =   2280
      Width           =   1095
   End
   Begin VB.TextBox txtN2 
      Height          =   615
      Left            =   2160
      TabIndex        =   4
      Top             =   1560
      Width           =   1095
   End
   Begin VB.TextBox txtN1 
      Height          =   615
      Left            =   2160
      TabIndex        =   3
      Top             =   840
      Width           =   1095
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      BackColor       =   &H000000FF&
      Caption         =   "Kong Jimmy Vang"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0C000&
      Height          =   615
      Left            =   360
      TabIndex        =   8
      Top             =   120
      Width           =   8895
   End
   Begin VB.Label lblAverage 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1935
      Left            =   4920
      TabIndex        =   7
      Top             =   960
      Width           =   4335
   End
   Begin VB.Label lblN3 
      Alignment       =   2  'Center
      BackColor       =   &H0000FFFF&
      Caption         =   "N3?"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   2
      Top             =   2280
      Width           =   1575
   End
   Begin VB.Label lblN2 
      Alignment       =   2  'Center
      BackColor       =   &H0000FFFF&
      Caption         =   "N2?"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   1
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label lblN1 
      Alignment       =   2  'Center
      BackColor       =   &H0000FFFF&
      Caption         =   "N1?"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   0
      Top             =   840
      Width           =   1575
   End
End
Attribute VB_Name = "frmAveOf3Num"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAVE_Click()
    
    Dim Num1 As Single
    Dim Num2 As Single
    Dim Num3 As Single
    Dim Sum As Single
    Dim Average As Single
    
    
    Num1 = txtN1.Text
    Num2 = txtN2.Text
    Num3 = txtN3.Text
    
    Sum = Num1 + Num2 + Num3
    Average = Sum / 3
    
    lblAverage.Caption = Average
    

End Sub

