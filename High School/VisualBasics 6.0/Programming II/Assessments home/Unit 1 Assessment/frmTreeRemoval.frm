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
   Begin VB.TextBox txtName 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   360
      TabIndex        =   25
      Text            =   "*Please Enter Name*"
      Top             =   4800
      Width           =   1935
   End
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
   Begin VB.Label lblTotalEstimate1 
      Caption         =   "Total Estimate for """":  "
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
   Begin VB.Label lblTotalEstimate2 
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
      Width           =   1935
   End
   Begin VB.Label lblGrinding2 
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
      Left            =   8640
      TabIndex        =   15
      Top             =   1560
      Width           =   2775
   End
   Begin VB.Label lblGrinding3 
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
      TabIndex        =   14
      Top             =   1560
      Width           =   1695
   End
   Begin VB.Label lblTrimming3 
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
      TabIndex        =   13
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label lblTrimming2 
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
      Left            =   8640
      TabIndex        =   12
      Top             =   1200
      Width           =   2775
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
      Width           =   1935
   End
   Begin VB.Label lblRemoval3 
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
      TabIndex        =   10
      Top             =   840
      Width           =   1695
   End
   Begin VB.Label lblRemoval2 
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
      Left            =   8640
      TabIndex        =   9
      Top             =   840
      Width           =   2775
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
      Width           =   1935
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
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      BorderStyle     =   0  'Transparent
      Height          =   3735
      Left            =   6240
      Top             =   480
      Width           =   7335
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
'Name
Dim YourName As String
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
Dim AfterDiscount As Single
'Tax
Dim Tax As Single
'Total Estimate
Dim TotalEstimate As Single

Private Sub cboGrinding_Click()

    'Grinding
    NumOfStumps = cboGrinding.Text
    TotalExtraInches = 0
    
    For s = 1 To NumOfStumps
        Diameter = InputBox("Diameter of Tree Stump?", "Diameter?", 1)
        
        If Diameter > 10 Then
        
            ExtraInches = Diameter - 10
            TotalExtraInches = TotalExtraInches + ExtraInches
            
        End If
    Next s
    
End Sub

Private Sub cmdCalculate_Click()
    
    If txtRHours.Text = "" Then
        lblRHours.ForeColor = &HFF&
    Else
        lblRHours.ForeColor = &H80000012
    End If
    If txtTHours.Text = "" Then
        lblTHours.ForeColor = &HFF&
    Else
        lblTHours.ForeColor = &H80000012
    End If
    If cboGrinding.Text = "" Then
        lblGrind.ForeColor = &HFF&
    Else
        lblGrind.ForeColor = &H80000012
    End If
        
    If txtRHours.Text = "" Or txtTHours.Text = "" Or cboGrinding.Text = "" Then
        MsgBox "You need to fill out the forms.", vbCritical, "Please fill out the forms."
    Else
        If txtName.Text = "*Please Enter Name*" Or txtName.Text = "" Then
            'Name Required Message
            txtName.ForeColor = &HFF&
            txtName.Text = "*Please Enter Name*"
            MsgBox "You need to fill out a name.", vbCritical, "Please enter your Name."
        Else
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
            If Subtotal > 1000 Then
                AfterDiscount = Subtotal - (Subtotal * 0.1)
                Subtotal = AfterDiscount
                lblDiscount1.Caption = "After 10% Discount:  "
                lblDiscount2.Caption = Format(Subtotal, "Currency")
            Else
                lblDiscount1.Caption = "After 10% Discount:  "
                lblDiscount2.Caption = Format("No Discount", "General")
            End If
            
            'Tax(5.5%)
            Tax = (Subtotal * 0.055)
            lblTax1.Caption = "Tax (5.5%):  "
            lblTax2.Caption = Format(Tax, "Currency")
            
            'Total Estimate
            TotalEstimate = Subtotal + Tax
            YourName = txtName.Text
            lblTotalEstimate1.Caption = "Total Estimate for " & "'" & YourName & "'" & ":  "
            lblTotalEstimate2.Caption = Format(TotalEstimate, "Currency")
        End If
    End If
    
End Sub

Private Sub Form_Load()

    'Load cboGrinding
    For s = 1 To 10
        cboGrinding.AddItem s
    Next s
    
End Sub

Private Sub txtName_Click()

    If txtName.Text = "*Please Enter Name*" Or txtName.Text = "" Then
        txtName.Text = ""
        txtName.ForeColor = &H0&
    Else
        txtName.Text = ""
        txtName.ForeColor = &H0&
    End If
    
End Sub

Private Sub txtRHours_Click()

    txtRHours.Text = ""
    
End Sub

Private Sub txtTHours_Click()

    txtTHours.Text = ""
    
End Sub
