VERSION 5.00
Begin VB.Form frmDoubleRedCellDonation 
   Caption         =   "Double Red Cell Donation"
   ClientHeight    =   7215
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   14295
   LinkTopic       =   "Form1"
   ScaleHeight     =   7215
   ScaleWidth      =   14295
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCheck 
      Caption         =   "cmd"
      Height          =   615
      Left            =   720
      TabIndex        =   0
      Top             =   600
      Width           =   1095
   End
End
Attribute VB_Name = "frmDoubleRedCellDonation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Healthy As Boolean
Dim Male As Boolean
Dim WeightLbs As Single
Dim HeightInches As Single
Dim AgeYrs As Single
Dim Eligible As Boolean


Private Sub cmdCheck_Click()

    AgeYrs = InputBox("Age in Years?")
    If AgeYrs < 17 Then
        MsgBox ("Too Young ...must be at least 17 years old")
    Else
        H = MsgBox("Heathly", vbYesNo)
        If H <> 6 Then
            MsgBox ("Sorry... you must be healthy to give blood!")
            Healthy = False
        Else
            Healthy = True
        End If
    End If
    
End Sub
