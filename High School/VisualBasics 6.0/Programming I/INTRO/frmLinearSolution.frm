VERSION 5.00
Begin VB.Form frmLinearSolution 
   Caption         =   "Solve Ax+B=C"
   ClientHeight    =   4800
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   8325
   LinkTopic       =   "Form1"
   ScaleHeight     =   4800
   ScaleWidth      =   8325
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdSolve 
      Caption         =   "Solve"
      Height          =   615
      Left            =   1080
      TabIndex        =   5
      Top             =   1560
      Width           =   1335
   End
   Begin VB.TextBox txtC 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5280
      TabIndex        =   4
      Text            =   "C"
      Top             =   480
      Width           =   1095
   End
   Begin VB.TextBox txtB 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3120
      TabIndex        =   2
      Text            =   "B"
      Top             =   480
      Width           =   1095
   End
   Begin VB.TextBox txtA 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1080
      TabIndex        =   0
      Text            =   "A"
      Top             =   480
      Width           =   1095
   End
   Begin VB.Label lblx 
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3135
      Left            =   2760
      TabIndex        =   6
      Top             =   1560
      Width           =   5415
   End
   Begin VB.Label lblEqual 
      Alignment       =   2  'Center
      Caption         =   "="
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4320
      TabIndex        =   3
      Top             =   480
      Width           =   735
   End
   Begin VB.Label lblXPlus 
      Alignment       =   2  'Center
      Caption         =   "x +"
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2280
      TabIndex        =   1
      Top             =   480
      Width           =   735
   End
End
Attribute VB_Name = "frmLinearSolution"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdSolve_Click()

    Dim A As Single
    Dim B As Single
    Dim C As Single
    Dim x As Single
    
    A = txtA.Text
    B = txtB.Text
    C = txtC.Text
    
    x = (C - B) / A
    
    lblx.Caption = " x = " & x
    
End Sub

Private Sub txtA_Click()

    txtA.Text = ""

End Sub

Private Sub txtB_Click()

    txtB.Text = ""
    
End Sub

Private Sub txtC_Click()

    txtC.Text = ""
    
End Sub
