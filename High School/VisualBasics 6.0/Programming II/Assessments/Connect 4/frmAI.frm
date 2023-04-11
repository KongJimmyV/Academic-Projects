VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAI 
   BackColor       =   &H00FFC0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "AI Settings"
   ClientHeight    =   3405
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3870
   Icon            =   "frmAI.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3405
   ScaleWidth      =   3870
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1080
      TabIndex        =   9
      Top             =   2880
      Width           =   1455
   End
   Begin MSComctlLib.Slider Slider1 
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   2160
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   661
      _Version        =   393216
      BorderStyle     =   1
      LargeChange     =   3
      Max             =   3
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFC0C0&
      Caption         =   "Search depth"
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3615
      Begin VB.VScrollBar VScroll2 
         Height          =   315
         Left            =   2880
         Max             =   1
         Min             =   180
         TabIndex        =   4
         Top             =   840
         Value           =   1
         Width           =   255
      End
      Begin VB.VScrollBar VScroll1 
         Height          =   315
         Left            =   2880
         Max             =   1
         Min             =   30
         TabIndex        =   3
         Top             =   360
         Value           =   1
         Width           =   255
      End
      Begin VB.TextBox Text2 
         Height          =   315
         Left            =   1920
         TabIndex        =   2
         Top             =   840
         Width           =   975
      End
      Begin VB.TextBox Text1 
         Height          =   315
         Left            =   1920
         TabIndex        =   1
         Top             =   360
         Width           =   975
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "Time limit (seconds):"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   840
         Width           =   1575
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Maximum depth:"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.Label Label3 
      BackColor       =   &H00FF8080&
      BackStyle       =   0  'Transparent
      Caption         =   "Full"
      Height          =   255
      Left            =   3480
      TabIndex        =   8
      Top             =   2640
      Width           =   495
   End
   Begin VB.Label Label2 
      BackColor       =   &H00FF8080&
      BackStyle       =   0  'Transparent
      Caption         =   "None"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   2640
      Width           =   615
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FF8080&
      BackStyle       =   0  'Transparent
      Caption         =   "Evaluation function:"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   1800
      Width           =   1575
   End
End
Attribute VB_Name = "frmAI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Form_Load()
Text1.Text = DepthLimit
VScroll1.Value = Val(Text1.Text)
Text2.Text = TimeLimit
VScroll2.Value = Val(Text2.Text)
Slider1.Value = EvalFunc
End Sub

Private Sub Form_Unload(Cancel As Integer)
Text1.Text = Val(Text1.Text)
Text2.Text = Val(Text2.Text)
If Val(Text1.Text) < 1 Then Text1.Text = 1
If Val(Text2.Text) < 1 Then Text2.Text = 1
If Val(Text1.Text) > 30 Then Text1.Text = 30
If Val(Text2.Text) > 180 Then Text2.Text = 180

DepthLimit = Val(Text1.Text)
TimeLimit = Val(Text2.Text)
EvalFunc = Slider1.Value
End Sub

Private Sub VScroll1_Change()
Text1.Text = VScroll1.Value
End Sub

Private Sub VScroll2_Change()
Text2.Text = VScroll2.Value
End Sub
