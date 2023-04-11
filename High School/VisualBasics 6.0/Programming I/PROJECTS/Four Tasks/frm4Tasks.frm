VERSION 5.00
Begin VB.Form frm4Tasks 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "4Tasks"
   ClientHeight    =   6855
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   7950
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6855
   ScaleWidth      =   7950
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdGallons 
      Caption         =   "Find Gallons"
      Height          =   615
      Left            =   6120
      TabIndex        =   22
      Top             =   4680
      Width           =   1215
   End
   Begin VB.TextBox txtCoverage 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   6000
      MultiLine       =   -1  'True
      TabIndex        =   21
      Text            =   "frm4Tasks.frx":0000
      Top             =   3720
      Width           =   1455
   End
   Begin VB.TextBox txtRWidthGal 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   6000
      MultiLine       =   -1  'True
      TabIndex        =   20
      Text            =   "frm4Tasks.frx":0009
      Top             =   2760
      Width           =   1455
   End
   Begin VB.TextBox txtRHeightGal 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   6000
      MultiLine       =   -1  'True
      TabIndex        =   19
      Text            =   "frm4Tasks.frx":000F
      Top             =   1800
      Width           =   1455
   End
   Begin VB.TextBox txtRLengthGal 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   6000
      MultiLine       =   -1  'True
      TabIndex        =   18
      Text            =   "frm4Tasks.frx":0016
      Top             =   840
      Width           =   1455
   End
   Begin VB.CommandButton cmdFindSalary 
      Caption         =   "Find Salary"
      Height          =   615
      Left            =   4320
      TabIndex        =   15
      Top             =   3720
      Width           =   1215
   End
   Begin VB.TextBox txtSalesMade 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   4200
      MultiLine       =   -1  'True
      TabIndex        =   13
      Text            =   "frm4Tasks.frx":001D
      Top             =   2760
      Width           =   1455
   End
   Begin VB.TextBox txtSPercentage 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   4200
      MultiLine       =   -1  'True
      TabIndex        =   12
      Text            =   "frm4Tasks.frx":0028
      Top             =   1800
      Width           =   1455
   End
   Begin VB.TextBox txtBasePay 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   4200
      MultiLine       =   -1  'True
      TabIndex        =   11
      Text            =   "frm4Tasks.frx":0039
      Top             =   840
      Width           =   1455
   End
   Begin VB.CommandButton cmdFindCost 
      Caption         =   "Find Cost"
      Height          =   615
      Left            =   2520
      TabIndex        =   7
      Top             =   3720
      Width           =   1215
   End
   Begin VB.TextBox txtCarpetCost 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2400
      MultiLine       =   -1  'True
      TabIndex        =   6
      Text            =   "frm4Tasks.frx":0042
      Top             =   2760
      Width           =   1455
   End
   Begin VB.TextBox txtRWidth 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2400
      TabIndex        =   5
      Text            =   $"frm4Tasks.frx":0052
      Top             =   1800
      Width           =   1455
   End
   Begin VB.TextBox txtRLength 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2400
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "frm4Tasks.frx":005D
      Top             =   840
      Width           =   1455
   End
   Begin VB.CommandButton cmdArea 
      Caption         =   "Find Area"
      Height          =   615
      Left            =   720
      TabIndex        =   2
      Top             =   2880
      Width           =   1215
   End
   Begin VB.TextBox txtLeg2 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   600
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "frm4Tasks.frx":0064
      Top             =   1800
      Width           =   1455
   End
   Begin VB.TextBox txtLeg1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   600
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "frm4Tasks.frx":0069
      Top             =   840
      Width           =   1455
   End
   Begin VB.Label lblGallons 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   5880
      TabIndex        =   23
      Top             =   5520
      Width           =   1695
   End
   Begin VB.Label lblGallonsTitle 
      Alignment       =   2  'Center
      Caption         =   "Gallons of Paint Required"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5880
      TabIndex        =   17
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label lblSalary 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   4080
      TabIndex        =   16
      Top             =   4560
      Width           =   1695
   End
   Begin VB.Label lblSalaryOfSalesperson 
      Alignment       =   2  'Center
      Caption         =   "Salary Of Salesperson"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4080
      TabIndex        =   14
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label lblCostOfCarpeting 
      Alignment       =   2  'Center
      Caption         =   "Cost Of Carpeting"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2280
      TabIndex        =   10
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label lblAreaOfTriangle 
      Alignment       =   2  'Center
      Caption         =   "Area of Triangle"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   480
      TabIndex        =   9
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label lblCost 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   2280
      TabIndex        =   8
      Top             =   4560
      Width           =   1695
   End
   Begin VB.Label lblArea 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   480
      TabIndex        =   3
      Top             =   3720
      Width           =   1695
   End
End
Attribute VB_Name = "frm4Tasks"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdArea_Click()

    Dim Leg1 As Single
    Dim Leg2 As Single
    Dim Area As Single
    
    'define
    
If (txtLeg1.Text = "" Or txtLeg1.Text = "Leg1") Or (txtLeg2.Text = "" Or txtLeg2.Text = "Leg2") Then
    MsgBox ("You need to put in values for 'Leg1' and 'Leg2' before clicking the Button.")
    Else
    
    'error check
    
    Leg1 = txtLeg1.Text
    Leg2 = txtLeg2.Text
    
    'input
    
    Area = 1 / 2 * Leg1 * Leg2
    
    'calculate
    
    lblArea.Caption = Area
    
    'output

    End If
    
End Sub

Private Sub cmdFindCost_Click()

    Dim fWidth As Single
    Dim fLength As Single
    Dim PricePerYard As Single
    Dim Cost As Single
    
    'define
    
If (txtRLength.Text = "" Or txtRLength.Text = "Length") Or (txtRWidth.Text = "" Or txtRWidth.Text = "Width") Or (txtCarpetCost.Text = "" Or txtCarpetCost.Text = "Width") Then
    MsgBox ("You need to put in values for 'Length', 'Width', and 'Price Per Yard' before clicking the Button.")
    Else
    
    'error check
    
    fLength = txtRLength.Text
    fWidth = txtRWidth.Text
    PricePerYard = txtCarpetCost.Text
    
    'input
    
    Cost = (fLength * fWidth) / 9 * PricePerYard
    
    'calculate
    
    lblCost.Caption = Cost
    lblCost.Caption = Format(Cost, "Currency")
    
    'output
    
    End If

End Sub

Private Sub cmdFindSalary_Click()

    Dim Salary As Single
    Dim BasePay As Single
    Dim SPercentage As Single
    Dim SalesMade As Single
    
    'define
    
    If (txtBasePay.Text = "" Or txtBasePay.Text = "Base Pay") Or (txtSPercentage.Text = "" Or txtSPercentage.Text = "Sales Percent") Or (txtSalesMade.Text = "" Or txtSalesMade = "Sales Made") Then
    MsgBox ("You need to put in values for 'Base Pay', 'Sales Percent', and 'Sales Made' before clicking the Button.")
    Else
    
    'error check
    
    BasePay = txtBasePay.Text
    SPercentage = txtSPercentage.Text
    SalesMade = txtSalesMade.Text
    
    'input
    
    Salary = BasePay + SPercentage * SalesMade
    
    'calculate
    
    lblSalary.Caption = Salary
    lblSalary.Caption = Format(Salary, "Currency")
    
    'output
    
    End If

End Sub

Private Sub cmdGallons_Click()

    Dim RLength As Single
    Dim RHeight As Single
    Dim RWidth As Single
    Dim Coverage As Single
    
    'define
    
    If (txtRLengthGal.Text = "" Or txtRLengthGal.Text = "Length") Or (txtRHeightGal.Text = "" Or txtRHeightGal.Text = "Height") Or (txtRWidthGal = "" Or txtRWidthGal = "Width") Or (txtCoverage.Text = "" Or txtCoverage.Text = "Coverage") Then
    MsgBox ("You need to put in values for 'Length', 'Height', 'Width', and 'Coverage' before clicking the Button.")
    Else
    
    'error check
    
    RLength = txtRLengthGal.Text
    RHeight = txtRHeightGal.Text
    RWidth = txtRWidthGal.Text
    Coverage = txtCoverage.Text
    
    'input
    
    Gallons = (2 * RLength * RHeight + 2 * RWidth * RHeight) / Coverage
    
    'calculate
    
    lblGallons = Gallons
    
    'output

    End If

End Sub

Private Sub Form_Load()

    txtLeg1.Text = "Leg1"
    txtLeg2.Text = "Leg2"
    txtRLength.Text = "Length"
    txtRWidth.Text = "Width"
    txtCarpetCost.Text = "Cost Per Yard"
    txtBasePay.Text = "Base Pay"
    txtSPercentage.Text = "Sales Percent"
    txtSalesMade.Text = "Sales Made"
    txtRLengthGal.Text = "Length"
    txtRHeightGal.Text = "Height"
    txtRWidthGal.Text = "Width"
    txtCoverage.Text = "Coverage"

End Sub

Private Sub txtBasePay_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = ""
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
        
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtCarpetCost_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = ""
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
        
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtCoverage_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
            
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = ""
        
        End If

End Sub

Private Sub txtLeg1_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = ""
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
        
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtLeg2_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = ""
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
        
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtRHeightGal_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
            
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = ""
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtRLength_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = ""
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
            
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtRLengthGal_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
            
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = ""
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtRWidth_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = ""
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
            
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtRWidthGal_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
            
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = ""
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

    Private Sub txtSalesMade_Click()
    
    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
        
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
        
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
    
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = ""
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = "Sales Percent"
        
        End If
            
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub

Private Sub txtSPercentage_Click()

    If txtLeg2.Text = "" = True Or txtLeg2.Text = "Leg2" = True Then
        txtLeg2.Text = "Leg2"
    
        End If
    
    If txtLeg1.Text = "" = True Or txtLeg1.Text = "Leg1" = True Then
        txtLeg1.Text = "Leg1"
    
        End If
    
    If txtCarpetCost.Text = "" = True Or txtCarpetCost.Text = "Cost Per Yard" = True Then
        txtCarpetCost.Text = "Cost Per Yard"
        
        End If
    
    If txtRLength.Text = "" = True Or txtRLength.Text = "Length" = True Then
        txtRLength.Text = "Length"
        
        End If
    
    If txtRWidth.Text = "" = True Or txtRWidth.Text = "Width" = True Then
        txtRWidth.Text = "Width"
        
        End If
        
    If txtBasePay.Text = "" = True Or txtBasePay = "Base Pay" = True Then
        txtBasePay = "Base Pay"
        
        End If
        
    If txtSalesMade.Text = "" = True Or txtSalesMade = "Sales Made" = True Then
        txtSalesMade = "Sales Made"
        
        End If
        
    If txtSPercentage.Text = "" = True Or txtSPercentage.Text = "Sales Percent" = True Then
        txtSPercentage.Text = ""
        
        End If
        
    If txtRLengthGal.Text = "" = True Or txtRLengthGal.Text = "Length" = True Then
        txtRLengthGal.Text = "Length"
        
        End If
        
    If txtRHeightGal.Text = "" = True Or txtRHeightGal.Text = "Height" = True Then
        txtRHeightGal.Text = "Height"
        
        End If
        
    If txtRWidthGal.Text = "" = True Or txtRWidthGal.Text = "Width" = True Then
        txtRWidthGal.Text = "Width"
        
        End If
        
    If txtCoverage.Text = "" = True Or txtCoverage.Text = "Coverage" = True Then
        txtCoverage.Text = "Coverage"
        
        End If

End Sub
