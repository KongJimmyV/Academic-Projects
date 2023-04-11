VERSION 5.00
Begin VB.Form frmGradePercent 
   Caption         =   "Percentages"
   ClientHeight    =   10215
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13575
   LinkTopic       =   "Form1"
   ScaleHeight     =   10215
   ScaleWidth      =   13575
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdFind 
      Caption         =   "Find Percentage"
      Height          =   495
      Left            =   3240
      TabIndex        =   6
      Top             =   3720
      Width           =   3375
   End
   Begin VB.TextBox txtTPP 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   6600
      TabIndex        =   5
      Text            =   "TestPP"
      Top             =   2040
      Width           =   2775
   End
   Begin VB.TextBox txtTPE 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   6600
      TabIndex        =   4
      Text            =   "TestPE"
      Top             =   600
      Width           =   2775
   End
   Begin VB.TextBox txtAPP 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   3600
      TabIndex        =   3
      Text            =   "AssignmentPP"
      Top             =   2040
      Width           =   2655
   End
   Begin VB.TextBox txtAPE 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   3600
      TabIndex        =   2
      Text            =   "AssignmentPE"
      Top             =   600
      Width           =   2655
   End
   Begin VB.TextBox txtQPP 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   600
      TabIndex        =   1
      Text            =   "QuizPP"
      Top             =   2040
      Width           =   2655
   End
   Begin VB.TextBox txtQPE 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   600
      TabIndex        =   0
      Text            =   "QuizPE"
      Top             =   600
      Width           =   2655
   End
   Begin VB.Label lblPercent 
      Alignment       =   2  'Center
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0.00%"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   5
      EndProperty
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1455
      Left            =   2760
      TabIndex        =   7
      Top             =   4560
      Width           =   4215
   End
End
Attribute VB_Name = "frmGradePercent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdFind_Click()

    '*DEFINE* (INPUT)
    Dim QPE As Single
    Dim QPP As Single
    Dim APE As Single
    Dim APP As Single
    Dim TPE As Single
    Dim TPP As Single
    Dim Percentage As Single
    
    QPE = txtQPE.Text
    APE = txtAPE.Text
    TPE = txtTPE.Text
    QPP = txtQPP.Text
    APP = txtAPP.Text
    TPP = txtTPP.Text
    
    '*CALCULATE*
    Percentage = (QPE + APE + TPE) / (QPP + APP + TPP) ' "* 100"  Covered By The FORMAT "Percent"
    
    '*OUTPUT*
    lblPercent.Caption = Percentage
    lblPercent.Caption = Format(Percentage, "Percent")
    
End Sub

Private Sub txtAPE_Click()

'REMOVE TEXT CHECK
    txtAPE.Text = ""
    
End Sub

Private Sub txtAPP_Click()

'REMOVE TEXT CHECK
    txtAPP.Text = ""
    
End Sub

Private Sub txtQPE_Click()

'REMOVE TEXT CHECK
    txtQPE.Text = ""
    
End Sub

Private Sub txtQPP_Click()

'REMOVE TEXT CHECK
    txtQPP.Text = ""
    
End Sub

Private Sub txtTPE_Click()

'REMOVE TEXT CHECK
    txtTPE.Text = ""
    
End Sub

Private Sub txtTPP_Click()

'REMOVE TEXT CHECK
    txtTPP.Text = ""
    
End Sub
