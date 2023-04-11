VERSION 5.00
Begin VB.Form frmTreeRemoval 
   Caption         =   "Form1"
   ClientHeight    =   8055
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13710
   LinkTopic       =   "Form1"
   ScaleHeight     =   8055
   ScaleWidth      =   13710
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate"
      Height          =   735
      Left            =   2520
      TabIndex        =   7
      Top             =   4440
      Width           =   1455
   End
   Begin VB.ComboBox cboGrinding 
      Height          =   315
      Left            =   2520
      TabIndex        =   3
      Top             =   3840
      Width           =   1455
   End
   Begin VB.TextBox txtTHours 
      Height          =   855
      Left            =   2520
      TabIndex        =   2
      Top             =   2880
      Width           =   1455
   End
   Begin VB.TextBox txtRHours 
      Height          =   855
      Left            =   2520
      TabIndex        =   1
      Top             =   1920
      Width           =   1455
   End
   Begin VB.Label lblEstimate1 
      Caption         =   "Total Estimate For """":  "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   24
      Top             =   3480
      Width           =   4815
   End
   Begin VB.Label lblEstimate2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   11520
      TabIndex        =   23
      Top             =   3480
      Width           =   1695
   End
   Begin VB.Label lblTax1 
      Caption         =   "Tax (5.5%):  "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   22
      Top             =   2880
      Width           =   4815
   End
   Begin VB.Label lblTax2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   11520
      TabIndex        =   21
      Top             =   2880
      Width           =   1695
   End
   Begin VB.Label lblDiscount2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   11520
      TabIndex        =   20
      Top             =   2520
      Width           =   1695
   End
   Begin VB.Label lblDiscount1 
      Caption         =   "After 10% Discount:  "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   19
      Top             =   2520
      Width           =   4815
   End
   Begin VB.Label lblSubtotal2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   11520
      TabIndex        =   18
      Top             =   2160
      Width           =   1695
   End
   Begin VB.Label lblSubtotal1 
      Caption         =   "Subtotal:  "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   17
      Top             =   2160
      Width           =   4815
   End
   Begin VB.Label lblGrinding1 
      Caption         =   "Grinding:  "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   16
      Top             =   1560
      Width           =   2175
   End
   Begin VB.Label lblGrinding2 
      Height          =   255
      Left            =   8880
      TabIndex        =   15
      Top             =   1560
      Width           =   2535
   End
   Begin VB.Label lblGrinding3 
      Height          =   255
      Left            =   11520
      TabIndex        =   14
      Top             =   1560
      Width           =   1695
   End
   Begin VB.Label lblTrimming3 
      Height          =   255
      Left            =   11520
      TabIndex        =   13
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label lblTrimming2 
      Height          =   255
      Left            =   8880
      TabIndex        =   12
      Top             =   1200
      Width           =   2535
   End
   Begin VB.Label lblTrimming1 
      Caption         =   "Trimming:  "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   11
      Top             =   1200
      Width           =   2175
   End
   Begin VB.Label lblRemoval3 
      Height          =   255
      Left            =   11520
      TabIndex        =   10
      Top             =   840
      Width           =   1695
   End
   Begin VB.Label lblRemoval2 
      Height          =   255
      Left            =   8880
      TabIndex        =   9
      Top             =   840
      Width           =   2535
   End
   Begin VB.Label lblRemoval1 
      Caption         =   "Removal:  "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   8
      Top             =   840
      Width           =   2175
   End
   Begin VB.Label lblGrind 
      Caption         =   "# of Stumps to Grind"
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
      Left            =   360
      TabIndex        =   6
      Top             =   3840
      Width           =   2055
   End
   Begin VB.Shape shpBox 
      Height          =   5175
      Left            =   6240
      Top             =   360
      Width           =   7215
   End
   Begin VB.Label lblTHours 
      Caption         =   "Hours of Tree Trimming"
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
      Left            =   360
      TabIndex        =   5
      Top             =   2880
      Width           =   2055
   End
   Begin VB.Label lblRHours 
      Caption         =   "Hours of Tree Removal"
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
      Left            =   360
      TabIndex        =   4
      Top             =   1920
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "Fred's Tree Service"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   360
      TabIndex        =   0
      Top             =   360
      Width           =   4455
   End
End
Attribute VB_Name = "frmTreeRemoval"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Remvoval Vars
Dim RHours As Single
Dim RCost As Single
'Trimming Vars
Dim THours As Single
Dim TCost As Single
'Grinding Vars
Dim NumOfStumps As Integer
Dim Diameter As Integer
Dim Inches As Integer
Dim ExtraInches As Integer
Dim TotalExtraInches As Integer
Dim GCost As Single
'Subtotal
Dim Subtotal As Single
'Discount
Dim Discount As Single


Private Sub cboGrinding_Click()

    'Grinding
    NumOfStumps = cboGrinding.Text
    
    For s = 1 To NumOfStumps
        Diameter = InputBox("Diameter of Tree Stump?", "Diameter?", 1)
        
        If Diameter > 10 Then
        
            ExtraInches = Diameter - 10
            TotalExtraInches = TotalExtraInches + ExtraInches
            
        End If
    Next s
    
End Sub

Private Sub cmdCalculate_Click()

    'Remvoval
    RHours = txtRHours.Text
    RCost = RHours * 300
    lblRemoval1.Caption = "Removal:  "
    lblRemoval2.Caption = RHours & " hrs @ $300 per "
    lblRemoval3.Caption = Format(RCost, "Currency")
    
    'Trimming
    THours = txtTHours.Text
    TCost = THours * 50
    lblTrimming1.Caption = "Trimming:  "
    lblTrimming2.Caption = THours & " hrs @ $50 per "
    lblTrimming3.Caption = Format(TCost, "Currency")
    
    'Grinding
    GCost = NumOfStumps * 20 + TotalExtraInches * 2
    
    lblGrinding1.Caption = "Grinding:  "
    lblGrinding2.Caption = NumOfStumps & " stumps with " & TotalExtraInches & " extra inches"
    lblGrinding3.Caption = Format(GCost, "Currency")
    
    'Subtotal
    Subtotal = RCost + TCost + GCost
    lblSubtotal1.Caption = "Subtotal:  "
    lblSubtotal2.Caption = Format(Subtotal, "Currency")
    
    'Discount
    Discount = Subtotal - (Subtotal * 0.1)
    lblDiscount1.Caption = "After 10% Discount"
    lblDiscount2.Caption = Format(Discount, "Currency")
    
End Sub

Private Sub Form_Load()

    'Load cboGrinding
    For s = 1 To 10
        cboGrinding.AddItem s
    Next s
    
End Sub

Private Sub txtRHours_Click()

    txtRHours.Text = ""
    
End Sub

Private Sub txtTHours_Click()

    txtTHours.Text = ""
    
End Sub
