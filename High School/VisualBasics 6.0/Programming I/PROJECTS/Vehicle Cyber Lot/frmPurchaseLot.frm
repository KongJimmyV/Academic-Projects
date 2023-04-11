VERSION 5.00
Begin VB.Form frmPurchase 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Purchase Car"
   ClientHeight    =   7215
   ClientLeft      =   -15
   ClientTop       =   270
   ClientWidth     =   13095
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7215
   ScaleWidth      =   13095
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPurchase 
      Caption         =   "Purchase Car"
      Height          =   615
      Left            =   2760
      TabIndex        =   15
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton cmdHome 
      Caption         =   "Home"
      Height          =   615
      Left            =   240
      TabIndex        =   14
      Top             =   6000
      Width           =   1215
   End
   Begin VB.TextBox txtPayment 
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
      ForeColor       =   &H00FF0000&
      Height          =   735
      Left            =   3600
      Locked          =   -1  'True
      TabIndex        =   9
      Top             =   3720
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.CommandButton cmdPayment 
      Caption         =   "Find out the monthly payment"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   480
      TabIndex        =   8
      Top             =   3480
      Width           =   2535
   End
   Begin VB.ComboBox cboTerm 
      Height          =   315
      Left            =   480
      TabIndex        =   7
      Top             =   2400
      Width           =   2655
   End
   Begin VB.TextBox txtDP 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   495
      Left            =   3600
      TabIndex        =   5
      Top             =   2280
      Width           =   2055
   End
   Begin VB.TextBox txtCost 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   420
      Left            =   3600
      TabIndex        =   1
      Top             =   600
      Width           =   1935
   End
   Begin VB.ComboBox cboCars 
      Height          =   315
      Left            =   480
      TabIndex        =   0
      Top             =   600
      Width           =   2655
   End
   Begin VB.Label lblPreview 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Vehicle"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   495
      Left            =   6240
      TabIndex        =   13
      Top             =   120
      Width           =   6615
   End
   Begin VB.Image imgCars 
      Height          =   5895
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   720
      Width           =   6855
   End
   Begin VB.Label lblRequiredFields 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "* Required Fields"
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
      Height          =   255
      Left            =   1320
      TabIndex        =   12
      Top             =   5160
      Width           =   3615
   End
   Begin VB.Label lblReq2 
      BackColor       =   &H00000000&
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   2280
      Width           =   255
   End
   Begin VB.Label lblReq1 
      BackColor       =   &H00000000&
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   720
      Width           =   255
   End
   Begin VB.Label lblTerm 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Term of loan"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   1920
      Width           =   2895
   End
   Begin VB.Label lblDP 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Down Payment"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   375
      Left            =   3360
      TabIndex        =   4
      Top             =   1920
      Width           =   2535
   End
   Begin VB.Label lblListPrice 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "List Price"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   375
      Left            =   3600
      TabIndex        =   3
      Top             =   240
      Width           =   1935
   End
   Begin VB.Label lblSelectCar 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Select A Car "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   375
      Left            =   480
      TabIndex        =   2
      Top             =   240
      Width           =   2535
   End
End
Attribute VB_Name = "frmPurchase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ListPrice As Single
Dim DownPayment As Single
Dim LoanAmount As Single
Dim Months As Integer
Dim Rate As Single
Dim MonthlyPayment As Single


Private Sub cboCars_Click()

    If cboCars.Text = "2013 Nissan ALTIMA 3.5 SL" Then
        ListPrice = 30080
        imgCars = LoadPicture("H:\Programming I\PICS\Vehicle Cyber Lot Pictures\VehicleCyberLot - 2013 ALTIMA 3.5 SL.jpg")
    End If
    
    If cboCars.Text = "F12berlinetta" Then
        ListPrice = 471263
        imgCars = LoadPicture("H:\Programming I\PICS\Vehicle Cyber Lot Pictures\VehicleCyberLot - F12berlinetta.jpg")
    End If
    
    If cboCars.Text = "2013 Honda Accord CoupeEX- Automatic Coupe" Then
        ListPrice = 28860
        imgCars = LoadPicture("H:\Programming I\PICS\Vehicle Cyber Lot Pictures\VehicleCyberLot - 2013 HondaAccord CoupeEX- Automatic Coupe")
    End If
    
    If cboCars.Text = "1976 Pacer" Then
        ListPrice = 3295
        imgCars = LoadPicture("")
    End If


    txtCost.Text = Format(ListPrice, "currency")
    

End Sub

Private Sub cmdHome_Click()

    frmPurchase.Visible = False
    frmHome.Visible = True
    
End Sub

Private Sub cmdPayment_Click()

If txtDP.Text = "" Then
    txtDP.Text = "0"
    txtDP.Text = Format(0, "Currency")
    Else
    
    End If

    DownPayment = txtDP.Text
    
If cboTerm.Text = "" Then
    cboTerm.Text = 12
    Months = cboTerm.Text
    Else
    Months = cboTerm.Text
    End If

    'determine loan amount
    LoanAmount = ListPrice - DownPayment
    
    'determine rate
    If Months = 12 Then
        Rate = 0.05
    End If
    
    If Months = 24 Then
        Rate = 0.06
    End If

    If Months = 36 Then
        Rate = 0.075
    End If
    
    If Months = 48 Then
        Rate = 0.09
    End If

    If Months = 60 Then
        Rate = 0.1
    End If

    'determine/display monthly payment
    MonthlyPayment = (LoanAmount * (1 + Rate / 12) ^ Months) / Months
    txtPayment.Visible = True
    txtPayment.Text = Format(MonthlyPayment, "Currency")

End Sub

Private Sub cmdPurchase_Click()

If cboTerm.Text = "" Or cboCars.Text = "" Then
    MsgBox ("Please Fill out the 'Required Fields' before Purchasing.")
    Else
    frmPurchase.Visible = False
    frmEnd.Visible = True
    End If
    
End Sub

Private Sub Form_Load()

    cboCars.AddItem "2013 Nissan ALTIMA 3.5 SL"
    cboCars.AddItem "F12berlinetta"
    cboCars.AddItem "2013 Honda Accord CoupeEX- Automatic Coupe"
    cboCars.AddItem "1976 Pacer"
    

    cboTerm.AddItem 12
    cboTerm.AddItem 24
    cboTerm.AddItem 36
    cboTerm.AddItem 48
    cboTerm.AddItem 60
    

    txtDP.Text = Format(0, "currency")

End Sub

Private Sub txtDP_Click()

    txtDP.Text = ""
    
End Sub
