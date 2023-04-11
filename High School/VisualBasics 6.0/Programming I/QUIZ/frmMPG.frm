VERSION 5.00
Begin VB.Form frmMPG 
   Caption         =   "MPG (Quiz)"
   ClientHeight    =   7695
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   12495
   LinkTopic       =   "Form1"
   ScaleHeight     =   7695
   ScaleWidth      =   12495
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtGallons 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   4920
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "frmMPG.frx":0000
      Top             =   4080
      Width           =   2295
   End
   Begin VB.CommandButton cmdFindMPG 
      Caption         =   "Calculate MPG"
      Height          =   735
      Left            =   5160
      TabIndex        =   3
      Top             =   5640
      Width           =   1815
   End
   Begin VB.TextBox txtEndOdo 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   6600
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "frmMPG.frx":000D
      Top             =   1680
      Width           =   3735
   End
   Begin VB.TextBox txtStartOdo 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   1800
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "frmMPG.frx":0025
      Top             =   1680
      Width           =   3735
   End
   Begin VB.Label lblMPGTitle 
      Alignment       =   2  'Center
      Caption         =   "MPG"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000080FF&
      Height          =   495
      Left            =   8040
      TabIndex        =   8
      Top             =   4200
      Width           =   2295
   End
   Begin VB.Label lblODOEND 
      Alignment       =   2  'Center
      Caption         =   "End of Odometer Reading"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   6600
      TabIndex        =   7
      Top             =   1080
      Width           =   3735
   End
   Begin VB.Label lblGALLONS 
      Alignment       =   2  'Center
      Caption         =   "Gallons Used"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   4920
      TabIndex        =   6
      Top             =   3480
      Width           =   2295
   End
   Begin VB.Label lblODOSTART 
      Alignment       =   2  'Center
      Caption         =   "Start of Odometer Reading"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   1800
      TabIndex        =   5
      Top             =   1080
      Width           =   3735
   End
   Begin VB.Label lblMPG 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "N/A"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   465
      Left            =   8805
      TabIndex        =   0
      Top             =   4680
      Width           =   765
   End
End
Attribute VB_Name = "frmMPG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdFindMPG_Click()

    'DEFINE (INPUT)
    Dim MPG As Single
    Dim StartOdoR As Single
    Dim EndOdoR As Single
    Dim GallonsUsed As Single
    
    StartOdoR = txtStartOdo.Text
    EndOdoR = txtEndOdo.Text
    GallonsUsed = txtGallons.Text
    
    'CALCULATE
    MPG = (EndOdoR - StartOdoR) / GallonsUsed
    
    'OUTPUT
    lblMPG.Caption = MPG
    
End Sub

Private Sub txtEndOdo_Click()

If txtEndOdo.Text = "End of Odometer Reading" Then
    txtEndOdo.Text = ""
    End If
    
End Sub

Private Sub txtGallons_Click()

If txtGallons.Text = "Gallons Used" Then
    txtGallons.Text = ""
    End If
    
End Sub

Private Sub txtStartOdo_Click()

If txtStartOdo.Text = "Start of Odometer Reading" Then
    txtStartOdo.Text = ""
    End If
    
End Sub
