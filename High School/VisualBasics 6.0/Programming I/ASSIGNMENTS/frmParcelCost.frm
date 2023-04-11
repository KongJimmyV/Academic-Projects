VERSION 5.00
Begin VB.Form frmParcelCost 
   Caption         =   "Parcel Cost Calculator"
   ClientHeight    =   4815
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4215
   LinkTopic       =   "Form1"
   ScaleHeight     =   4815
   ScaleWidth      =   4215
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtWeight 
      Alignment       =   2  'Center
      Height          =   495
      Left            =   1440
      TabIndex        =   5
      Text            =   "0"
      Top             =   960
      Width           =   1215
   End
   Begin VB.ListBox lstWeight 
      Height          =   450
      ItemData        =   "frmParcelCost.frx":0000
      Left            =   120
      List            =   "frmParcelCost.frx":0002
      TabIndex        =   3
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   4200
      Width           =   1095
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End"
      Height          =   495
      Left            =   2880
      TabIndex        =   1
      Top             =   4200
      Width           =   1095
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   495
      Left            =   1560
      TabIndex        =   0
      Top             =   4200
      Width           =   1095
   End
   Begin VB.Label lblE 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   """N/A"""
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   720
      TabIndex        =   10
      Top             =   2280
      Width           =   2775
   End
   Begin VB.Label lblD 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Currently Selected"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   720
      TabIndex        =   9
      Top             =   2040
      Width           =   2775
   End
   Begin VB.Label lblC 
      Alignment       =   2  'Center
      Caption         =   "Parcel Cost"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2760
      TabIndex        =   8
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label lblCost 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   495
      Left            =   2760
      TabIndex        =   7
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label lblB 
      Alignment       =   2  'Center
      Caption         =   "Enter Weight"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1440
      TabIndex        =   6
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label lblA 
      Alignment       =   2  'Center
      Caption         =   "Select Weight"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   720
      Width           =   1215
   End
End
Attribute VB_Name = "frmParcelCost"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim X As Integer

Private Sub cmdCalculate_Click()

    Dim Wt As Single
    Dim Cost As Single

    'weight entered
    Wt = txtWeight.Text

        Select Case lstWeight.Text
            Case "Ounces 'oz'"
                X = 2
                
                Select Case Wt
                    '//Calculations'//
                    Case 0 To 4
                        Cost = Wt * 0.2
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case 5 To 15
                        Cost = Wt * 0.16
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case 16 To 80
                        Cost = Wt / 16 * 2.4
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case 81 To 160
                        Cost = 15
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case Is > 160
                        lblCost.Caption = "Can't Ship... Too heavy..."
                   
                End Select
                
            Case "Pounds 'lbs'"
                X = 1
                
                Select Case Wt
                    '//Calculations'//
                    Case 0 To 0.25
                        Cost = Wt * 16 * 0.2
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case 0.26 To 0.99
                        Cost = Wt * 16 * 0.16
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case 1 To 5
                        Cost = Wt * 2.4
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case 5.01 To 10
                        Cost = 15
                        lblCost.Caption = Format(Cost, "Currency")
                    
                    Case Is > 10
                        lblCost.Caption = "Can't Ship... Too heavy..."
                   
                End Select
        End Select
                
End Sub

Private Sub cmdClear_Click()

    Wt = 0
    
    txtWeight.Text = "0"
    lblCost.Caption = Format(0, "Currency")
    
End Sub

Private Sub cmdEnd_Click()

    'End Program
    End
    
End Sub

Private Sub Form_Load()

    lstWeight.AddItem ("Ounces 'oz'")
    lstWeight.AddItem ("Pounds 'lbs'")
    lblCost.Caption = Format(0, "Currency")
    
End Sub

Private Sub lstWeight_Click()

    Dim Wt As Single
    Dim Cost As Single
    
    If txtWeight.Text = "" Then
    
    Else
        Wt = txtWeight.Text
        
    End If
    
    Select Case lstWeight.Text
    
        Case "Ounces 'oz'"
            
            lblE.Caption = "Ounces 'oz'"
            
            If X = 1 Then
               Wt = (Wt) * (16 / 1)
               X = 2
               txtWeight.Text = Wt
            End If
            
        Case "Pounds 'lbs'"
            
            lblE.Caption = "Pounds 'lbs'"
            
            If X = 2 Then
               Wt = (Wt) * (1 / 16)
               X = 1
               txtWeight.Text = Wt
            End If
            
    End Select
    
    
End Sub
