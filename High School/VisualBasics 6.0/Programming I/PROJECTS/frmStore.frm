VERSION 5.00
Begin VB.Form frmStore 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Store"
   ClientHeight    =   11865
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   21495
   LinkTopic       =   "Form1"
   ScaleHeight     =   11865
   ScaleWidth      =   21495
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraDebitCard 
      Caption         =   "Debit Card Payment"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   16560
      TabIndex        =   48
      Top             =   5880
      Visible         =   0   'False
      Width           =   3735
      Begin VB.TextBox txtDebitCardNumber 
         Height          =   375
         Left            =   120
         TabIndex        =   53
         Text            =   "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx"
         Top             =   840
         Width           =   3495
      End
      Begin VB.TextBox txtDebitCardName 
         Height          =   375
         Left            =   120
         TabIndex        =   52
         Text            =   "Enter Name"
         Top             =   1320
         Width           =   3495
      End
      Begin VB.TextBox txtDebitCardExpirationDate 
         Height          =   375
         Left            =   120
         TabIndex        =   51
         Text            =   "Expiration Date  (e.g. 4/2014)"
         Top             =   1800
         Width           =   3495
      End
      Begin VB.TextBox txtDebitCardType 
         Height          =   375
         Left            =   120
         TabIndex        =   50
         Text            =   "Debit Card Type"
         Top             =   360
         Width           =   3495
      End
      Begin VB.TextBox txtDebitCardCVV 
         Height          =   375
         Left            =   120
         TabIndex        =   49
         Text            =   "CVV code"
         Top             =   2280
         Width           =   3495
      End
      Begin VB.Image imgDebitCard 
         Height          =   4965
         Left            =   -360
         Picture         =   "frmStore.frx":0000
         Stretch         =   -1  'True
         Top             =   0
         Width           =   4800
      End
   End
   Begin VB.Frame fraCreditCard 
      Caption         =   "Credit Card Payment"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   16560
      TabIndex        =   40
      Top             =   5880
      Visible         =   0   'False
      Width           =   3735
      Begin VB.TextBox txtCreditCardCVV 
         Height          =   375
         Left            =   120
         TabIndex        =   45
         Text            =   "CVV code"
         Top             =   2280
         Width           =   3495
      End
      Begin VB.TextBox txtCreditCardType 
         Height          =   375
         Left            =   120
         TabIndex        =   44
         Text            =   "Credit Card Type"
         Top             =   360
         Width           =   3495
      End
      Begin VB.TextBox txtCreditCardExpirationDate 
         Height          =   375
         Left            =   120
         TabIndex        =   43
         Text            =   "Expiration Date  (e.g. 4/2014)"
         Top             =   1800
         Width           =   3495
      End
      Begin VB.TextBox txtCreditCardName 
         Height          =   375
         Left            =   120
         TabIndex        =   42
         Text            =   "Enter Name"
         Top             =   1320
         Width           =   3495
      End
      Begin VB.TextBox txtCreditCardNumber 
         Height          =   375
         Left            =   120
         TabIndex        =   41
         Text            =   "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx"
         Top             =   840
         Width           =   3495
      End
      Begin VB.Image imgCreditCard 
         Height          =   4965
         Index           =   0
         Left            =   -840
         Picture         =   "frmStore.frx":1A014
         Stretch         =   -1  'True
         Top             =   0
         Width           =   4800
      End
   End
   Begin VB.Frame fraPaymentType 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Payment Type"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   4335
      Left            =   16800
      TabIndex        =   4
      Top             =   1440
      Width           =   3375
      Begin VB.OptionButton optDebitCard 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Debit Card"
         Height          =   615
         Left            =   120
         TabIndex        =   39
         Top             =   2760
         Width           =   3135
      End
      Begin VB.OptionButton optPayPal 
         BackColor       =   &H00C0FFC0&
         Caption         =   "PayPal"
         Height          =   615
         Left            =   120
         TabIndex        =   38
         Top             =   3480
         Width           =   3135
      End
      Begin VB.OptionButton optCreditCard 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Credit Card"
         Height          =   615
         Left            =   120
         TabIndex        =   37
         Top             =   2040
         Width           =   3135
      End
      Begin VB.OptionButton optCheck 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Check"
         Height          =   615
         Left            =   120
         TabIndex        =   36
         Top             =   1320
         Width           =   3135
      End
      Begin VB.OptionButton optCash 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Cash"
         Height          =   615
         Left            =   120
         TabIndex        =   35
         Top             =   600
         Width           =   3135
      End
   End
   Begin VB.Frame fraSketchbooks 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Sketchbooks"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   4335
      Left            =   12960
      TabIndex        =   3
      Top             =   1440
      Width           =   3375
      Begin VB.CheckBox chkTapeBound 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Tape Bound ($5.99)"
         Height          =   495
         Left            =   120
         TabIndex        =   34
         Top             =   3240
         Width           =   3135
      End
      Begin VB.CheckBox chkSpiralBound 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Spiral Bound ($7.99)"
         Height          =   495
         Left            =   120
         TabIndex        =   33
         Top             =   1920
         Width           =   3135
      End
      Begin VB.CheckBox chkHardBound 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Hard Bound ($7.99)"
         Height          =   495
         Left            =   120
         TabIndex        =   32
         Top             =   600
         Width           =   3135
      End
   End
   Begin VB.Frame fraPaper 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Paper"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   4335
      Left            =   9120
      TabIndex        =   2
      Top             =   1440
      Width           =   3375
      Begin VB.CheckBox chkDrawing 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Drawing ($2.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   31
         Top             =   3840
         Width           =   3135
      End
      Begin VB.CheckBox chkWaterColor 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Watercolor ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   30
         Top             =   3360
         Width           =   3135
      End
      Begin VB.CheckBox chkSmooth 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Smooth ($2.99)"
         Height          =   255
         Left            =   120
         TabIndex        =   29
         Top             =   3000
         Width           =   3135
      End
      Begin VB.CheckBox chkMedium 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Medium ($3.49)"
         Height          =   375
         Left            =   120
         TabIndex        =   28
         Top             =   2520
         Width           =   3135
      End
      Begin VB.CheckBox chkRough 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Rough ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   27
         Top             =   2040
         Width           =   3135
      End
      Begin VB.CheckBox chkWove 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Wove ($2.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   26
         Top             =   1560
         Width           =   3135
      End
      Begin VB.CheckBox chkTextured 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Textured ($2.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   25
         Top             =   1080
         Width           =   3135
      End
      Begin VB.CheckBox chkLaid 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Laid ($2.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   24
         Top             =   600
         Width           =   3135
      End
   End
   Begin VB.Frame fraPaintBrushes 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Paint Brushes"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   4335
      Left            =   5280
      TabIndex        =   1
      Top             =   1440
      Width           =   3375
      Begin VB.CheckBox chkRiggerBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Rigger Brush ($14.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   23
         Top             =   3840
         Width           =   3135
      End
      Begin VB.CheckBox chkMopBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Mop Brush ($14.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   22
         Top             =   3360
         Width           =   3135
      End
      Begin VB.CheckBox chkAngleBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Angle Brush ($14.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   21
         Top             =   2880
         Width           =   3135
      End
      Begin VB.CheckBox chkFanBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Fan Brush ($14.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   20
         Top             =   2400
         Width           =   3135
      End
      Begin VB.CheckBox chkFilbertBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Filbert Brush ($14.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   19
         Top             =   1920
         Width           =   3135
      End
      Begin VB.CheckBox chkBrightBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Bright Brush ($14.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   18
         Top             =   1440
         Width           =   3135
      End
      Begin VB.CheckBox chkFlatBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Flat Brush ($14.99)"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1080
         Width           =   3135
      End
      Begin VB.CheckBox chkRoundBrush 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Round Brush ($14.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   16
         Top             =   600
         Width           =   3135
      End
   End
   Begin VB.Frame fraArtSupplies 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Art Supplies"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   4335
      Left            =   1440
      TabIndex        =   0
      Top             =   1440
      Width           =   3375
      Begin VB.CheckBox chkPencils 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Set of Pencils ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   15
         Top             =   3840
         Width           =   3135
      End
      Begin VB.CheckBox chkCharcoal 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Charcoal Set ($4.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   14
         Top             =   3480
         Width           =   3135
      End
      Begin VB.CheckBox chkMarkers 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Set of Markers ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   3120
         Width           =   3135
      End
      Begin VB.CheckBox chkInk 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Bottle of Ink w/Pen ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   2760
         Width           =   3135
      End
      Begin VB.CheckBox chkCrayons 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Set of Crayons ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   2400
         Width           =   3135
      End
      Begin VB.CheckBox chkColorPencils 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Set of Color Pencils ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   2040
         Width           =   3135
      End
      Begin VB.CheckBox chkSharpies 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Set of Sharpies ($2.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   9
         Top             =   1680
         Width           =   3135
      End
      Begin VB.CheckBox chkGlue 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Bottle of Glue ($1.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   1320
         Width           =   3135
      End
      Begin VB.CheckBox chkPaint 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Any Bucket of Paint ($3.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   960
         Width           =   3135
      End
      Begin VB.CheckBox chkPastels 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Set of Pastels ($4.99)"
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   600
         Width           =   3135
      End
   End
   Begin VB.Image imgTypePay 
      Height          =   1935
      Left            =   17400
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   2295
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Shipping Is Free!!!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   15600
      TabIndex        =   47
      Top             =   11040
      Width           =   2295
   End
   Begin VB.Image imgTapeBound 
      Height          =   1575
      Left            =   13800
      Stretch         =   -1  'True
      Top             =   7440
      Width           =   1695
   End
   Begin VB.Image imgSpiralBound 
      Height          =   1575
      Left            =   14640
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Image imgHardBound 
      Height          =   1575
      Left            =   12960
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Image imgDrawing 
      Height          =   615
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgWaterColor 
      Height          =   615
      Left            =   10800
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgSmooth 
      Height          =   615
      Left            =   9960
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgMedium 
      Height          =   615
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgRough 
      Height          =   615
      Left            =   11640
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgWove 
      Height          =   615
      Left            =   10800
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgTextured 
      Height          =   615
      Left            =   9960
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgLaid 
      Height          =   615
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgRiggerBrush 
      Height          =   615
      Left            =   7800
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgMopBrush 
      Height          =   615
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgAngleBrush 
      Height          =   615
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgFanBrush 
      Height          =   615
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgFilbertBrush 
      Height          =   615
      Left            =   7800
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgBrightBrush 
      Height          =   615
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgFlatBrush 
      Height          =   615
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgRoundBrush 
      Height          =   615
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgPencils 
      Height          =   615
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   855
   End
   Begin VB.Image imgCharcoal 
      Height          =   615
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   7080
      Width           =   855
   End
   Begin VB.Image imgMarkers 
      Height          =   615
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgInk 
      Height          =   615
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgCrayons 
      Height          =   615
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgColorPencils 
      Height          =   615
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgSharpies 
      Height          =   615
      Left            =   3960
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgGlue 
      Height          =   615
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgPaint 
      Height          =   615
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgPastels 
      Height          =   615
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Label lblCost 
      Caption         =   "$0.00"
      BeginProperty DataFormat 
         Type            =   1
         Format          =   """$""#,##0.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   2
      EndProperty
      BeginProperty Font 
         Name            =   "System"
         Size            =   29.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   735
      Left            =   18120
      TabIndex        =   46
      Top             =   10800
      Width           =   2295
   End
   Begin VB.Label lblASuS 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFC0&
      Caption         =   "Art Supplies Store"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000080FF&
      Height          =   1215
      Left            =   1440
      TabIndex        =   5
      Top             =   120
      Width           =   18855
   End
End
Attribute VB_Name = "frmStore"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim PastelsCost As Single
Dim PaintCost As Single
Dim GlueCost As Single
Dim SharpiesCost As Single
Dim ColorPencilsCost As Single
Dim CrayonsCost As Single
Dim InkwPenCost As Single
Dim MarkersCost As Single
Dim CharcoalCost As Single
Dim PencilsCost As Single
Dim RoundBrushCost As Single
Dim FlatBrushCost As Single
Dim BrightBrushCost As Single
Dim FilbertBrushCost As Single
Dim FanBrushCost As Single
Dim AngleBrushCost As Single
Dim MopBrushCost As Single
Dim RiggerBrushCost As Single
Dim LaidCost As Single
Dim TexturedCost As Single
Dim WoveCost As Single
Dim RoughCost As Single
Dim MediumCost As Single
Dim SmoothCost As Single
Dim WatercolorCost As Single
Dim DrawingCost As Single
Dim HardBoundCost As Single
Dim SpiralBoundCost As Single
Dim TapeBoundCost As Single
Dim ShippingCost As Single

Private Sub chkAngleBrush_Click()

If chkAngleBrush = 1 Then
    AngleBrushCost = 14.99
    imgAngleBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Angle Brush.jpg")
    Else
    AngleBrushCost = 0
    imgAngleBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkBrightBrush_Click()

If chkBrightBrush = 1 Then
    BrightBrushCost = 14.99
    imgBrightBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Bright Brush.jpg")
    Else
    BrightBrushCost = 0
    imgBrightBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCharcoal_Click()

If chkCharcoal = 1 Then
    CharcoalCost = 4.99
    imgCharcoal = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Charcoal.jpg")
    Else
    CharcoalCost = 0
    imgCharcoal = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkColorPencils_Click()

If chkColorPencils = 1 Then
    ColorPencilsCost = 3.99
    imgColorPencils = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Pencils.jpg")
    Else
    ColorPencilsCost = 0
    imgColorPencils = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCrayons_Click()

If chkCrayons = 1 Then
    CrayonsCost = 3.99
    imgCrayons = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Crayons.jpg")
    Else
    CrayonsCost = 0
    imgCrayons = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkDrawing_Click()

If chkDrawing = 1 Then
    DrawingCost = 2.99
    imgDrawing = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Drawing Paper.jpg")
    Else
    DrawingCost = 0
    imgDrawing = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkFanBrush_Click()

If chkFanBrush = 1 Then
    FanBrushCost = 14.99
    imgFanBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Fan Brush.jpg")
    Else
    FanBrushCost = 0
    imgFanBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkFilbertBrush_Click()

If chkFilbertBrush = 1 Then
    FilbertBrushCost = 14.99
    imgFilbertBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Filbert Brush.jpg")
    Else
    FilbertBrushCost = 0
    imgFilbertBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkFlatBrush_Click()

If chkFlatBrush = 1 Then
    FlatBrushCost = 14.99
    imgFlatBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Flat Brush.jpg")
    Else
    FlatBrushCost = 0
    imgFlatBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkGlue_Click()

If chkGlue = 1 Then
    GlueCost = 1.99
    imgGlue = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Glue.jpg")
    Else
    GlueCost = 0
    imgGlue = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkHardBound_Click()

If chkHardBound = 1 Then
    HardBoundCost = 7.99
    imgHardBound = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Hard Bound.jpg")
    Else
    HardBoundCost = 0
    imgHardBound = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkInk_Click()

If chkInk = 1 Then
    InkwPenCost = 3.99
    imgInk = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Ink.jpg")
    Else
    InkwPenCost = 0
    imgInk = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkLaid_Click()

If chkLaid = 1 Then
    LaidCost = 2.99
    imgLaid = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Laid Paper.jpg")
    Else
    LaidCost = 0
    imgLaid = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkMarkers_Click()

If chkMarkers = 1 Then
    MarkersCost = 3.99
    imgMarkers = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Markers.jpg")
    Else
    MarkersCost = 0
    imgMarkers = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkMedium_Click()

If chkMedium = 1 Then
    MediumCost = 3.49
    imgMedium = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Medium Paper.jpg")
    Else
    MediumCost = 0
    imgMedium = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkMopBrush_Click()

If chkMopBrush = 1 Then
    MopBrushCost = 14.99
    imgMopBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Mop Brush.jpg")
    Else
    MopBrushCost = 0
    imgMopBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkPaint_Click()

If chkPaint = 1 Then
    PaintCost = 3.99
    imgPaint = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Paint.jpg")
    Else
    PaintCost = 0
    imgPaint = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkPastels_Click()

If chkPastels = 1 Then
    PastelsCost = 4.99
    imgPastels = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Pastels.jpg")
    Else
    PastelsCost = 0
    imgPastels = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkPencils_Click()

If chkPencils = 1 Then
    PencilsCost = 3.99
    imgPencils = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Pencils.jpg")
    Else
    PencilsCost = 0
    imgPencils = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkRiggerBrush_Click()

If chkRiggerBrush = 1 Then
    RiggerBrushCost = 14.99
    imgRiggerBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Rigger Brush.jpg")
    Else
    RiggerBrushCost = 0
    imgRiggerBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkRough_Click()

If chkRough = 1 Then
    RoughCost = 3.99
    imgRough = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Rough Paper.jpg")
    Else
    RoughCost = 0
    imgRough = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkRoundBrush_Click()

If chkRoundBrush = 1 Then
    RoundBrushCost = 14.99
    imgRoundBrush = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Round Brush.jpg")
    Else
    RoundCost = 0
    imgRoundBrush = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkSharpies_Click()

If chkSharpies = 1 Then
    SharpiesCost = 2.99
    imgSharpies = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Sharpies.jpg")
    Else
    SharpiesCost = 0
    imgSharpies = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkSmooth_Click()

If chkSmooth = 1 Then
    SmoothCost = 2.99
    imgSmooth = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Smooth Paper.jpg")
    Else
    SmoothCost = 0
    imgSmooth = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkSpiralBound_Click()

If chkSpiralBound = 1 Then
    SpiralBoundCost = 7.99
    imgSpiralBound = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Spiral Bound.jpg")
    Else
    SpiralBoundCost = 0
    imgSpiralBound = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkTapeBound_Click()

If chkTapeBound = 1 Then
    TapeBoundCost = 5.99
    imgTapeBound = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Tape Bound.jpg")
    Else
    TapeBoundCost = 0
    imgTapeBound = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkTextured_Click()

If chkTextured = 1 Then
    TexturedCost = 2.99
    imgTextured = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Textured Paper.jpg")
    Else
    TexturedCost = 0
    imgTextured = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkWaterColor_Click()

If chkWaterColor = 1 Then
    WatercolorCost = 3.99
    imgWaterColor = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - WaterColor Paper.jpg")
    Else
    WatercolorCost = 0
    imgWaterColor = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkWove_Click()

If chkWove = 1 Then
    WoveCost = 2.99
    imgWove = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Wove Paper.jpg")
    Else
    WoveCost = 0
    imgWove = LoadPicture("")
    End If
    
    TotalCost = RiggerBrushCost + PastelsCost + PaintCost + GlueCost + SharpiesCost + ColorPencilsCost + CrayonsCost + InkwPenCost + MarkersCost + CharcoalCost + PencilsCost + RoundBrushCost + FlatBrushCost + BrightBrushCost + FilbertBrushCost + FanBrushCost + AngleBrushCost + MopBrushCost + LaidCost + TexturedCost + WoveCost + RoughCost + MediumCost + SmoothCost + WatercolorCost + DrawingCost + HardBoundCost + SpiralBoundCost + TapeBoundCost + ShippingCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub optCash_Click()

    fraCreditCard.Visible = False
    fraDebitCard.Visible = False
    imgTypePay = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Cash.jpg")

End Sub

Private Sub optCheck_Click()

    fraCreditCard.Visible = False
    fraDebitCard.Visible = False
    imgTypePay = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Check.jpg")

End Sub

Private Sub optCreditCard_Click()

    fraDebitCard.Visible = False
    fraCreditCard.Visible = True
    txtCreditCardType.Text = "Credit Card Type"
    txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx"
    txtCreditCardName.Text = "Enter Name"
    txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    txtCreditCardCVV.Text = "CVV code"

End Sub

Private Sub optDebitCard_Click()

    fraCreditCard.Visible = False
    fraDebitCard.Visible = True
    txtDebitCardType.Text = "Debit Card Type"
    txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx"
    txtDebitCardName.Text = "Enter Name"
    txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    txtDebitCardCVV.Text = "CVV code"
    imgDebitCard = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Debit Card.jpg")

End Sub

Private Sub optPayPal_Click()

    fraCreditCard.Visible = False
    fraDebitCard.Visible = False
    imgTypePay = LoadPicture("H:\Programming I\PICS\Store Project Pictures\STORE - Paypal.jpg")

End Sub

Private Sub txtCreditCardCVV_Click()

If txtCreditCardType.Text = "" Or txtCreditCardType.Text = "Credit Card Type" Then
    txtCreditCardType.Text = "Credit Card Type"
    Else
    
    End If

If txtCreditCardCVV = "" Or txtCreditCardCVV = "CVV code" Then
    txtCreditCardCVV.Text = ""
    Else
    
    End If
    
If txtCreditCardNumber.Text = "" Or txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtCreditCardName.Text = "" Or txtCreditCardName.Text = "Enter Name" Then
    txtCreditCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtCreditCardExpirationDate.Text = "" Or txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If

End Sub

Private Sub txtCreditCardExpirationDate_Click()

If txtCreditCardType.Text = "" Or txtCreditCardType.Text = "Credit Card Type" Then
    txtCreditCardType.Text = "Credit Card Type"
    Else
    
    End If

If txtCreditCardCVV = "" Or txtCreditCardCVV = "CVV code" Then
    txtCreditCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtCreditCardNumber.Text = "" Or txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtCreditCardName.Text = "" Or txtCreditCardName.Text = "Enter Name" Then
    txtCreditCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtCreditCardExpirationDate.Text = "" Or txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtCreditCardExpirationDate.Text = ""
    Else
    
    End If


End Sub

Private Sub txtCreditCardName_Click()

If txtCreditCardType.Text = "" Or txtCreditCardType.Text = "Credit Card Type" Then
    txtCreditCardType.Text = "Credit Card Type"
    Else
    
    End If

If txtCreditCardCVV = "" Or txtCreditCardCVV = "CVV code" Then
    txtCreditCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtCreditCardNumber.Text = "" Or txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtCreditCardName.Text = "" Or txtCreditCardName.Text = "Enter Name" Then
    txtCreditCardName.Text = ""
    Else
     
    End If
     
If txtCreditCardExpirationDate.Text = "" Or txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If
    
End Sub

Private Sub txtCreditCardNumber_Click()

If txtCreditCardType.Text = "" Or txtCreditCardType.Text = "Credit Card Type" Then
    txtCreditCardType.Text = "Credit Card Type"
    Else
    
    End If

If txtCreditCardCVV = "" Or txtCreditCardCVV = "CVV code" Then
    txtCreditCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtCreditCardNumber.Text = "" Or txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtCreditCardNumber.Text = ""
    Else
    
    End If
    
If txtCreditCardName.Text = "" Or txtCreditCardName.Text = "Enter Name" Then
    txtCreditCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtCreditCardExpirationDate.Text = "" Or txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If

End Sub

Private Sub txtCreditCardType_Click()

If txtCreditCardType.Text = "" Or txtCreditCardType.Text = "Credit Card Type" Then
    txtCreditCardType.Text = ""
    Else
    
    End If

If txtCreditCardCVV = "" Or txtCreditCardCVV = "CVV code" Then
    txtCreditCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtCreditCardNumber.Text = "" Or txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtCreditCardNumber.Text = "Enter Credit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtCreditCardName.Text = "" Or txtCreditCardName.Text = "Enter Name" Then
    txtCreditCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtCreditCardExpirationDate.Text = "" Or txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtCreditCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If

End Sub

Private Sub txtDebitCardCVV_Click()

If txtDebitCardType.Text = "" Or txtDebitCardType.Text = "Debit Card Type" Then
    txtDebitCardType.Text = "Debit Card Type"
    Else
    
    End If

If txtDebitCardCVV = "" Or txtDebitCardCVV = "CVV code" Then
    txtDebitCardCVV.Text = ""
    Else
    
    End If
    
If txtDebitCardNumber.Text = "" Or txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtDebitCardName.Text = "" Or txtDebitCardName.Text = "Enter Name" Then
    txtDebitCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtDebitCardExpirationDate.Text = "" Or txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If

End Sub

Private Sub txtDebitCardExpirationDate_Click()

If txtDebitCardType.Text = "" Or txtDebitCardType.Text = "Debit Card Type" Then
    txtDebitCardType.Text = "Debit Card Type"
    Else
    
    End If

If txtDebitCardCVV = "" Or txtDebitCardCVV = "CVV code" Then
    txtDebitCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtDebitCardNumber.Text = "" Or txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtDebitCardName.Text = "" Or txtDebitCardName.Text = "Enter Name" Then
    txtDebitCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtDebitCardExpirationDate.Text = "" Or txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtDebitCardExpirationDate.Text = ""
    Else
    
    End If

End Sub

Private Sub txtDebitCardName_Click()

If txtDebitCardType.Text = "" Or txtDebitCardType.Text = "Debit Card Type" Then
    txtDebitCardType.Text = "Debit Card Type"
    Else
    
    End If

If txtDebitCardCVV = "" Or txtDebitCardCVV = "CVV code" Then
    txtDebitCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtDebitCardNumber.Text = "" Or txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtDebitCardName.Text = "" Or txtDebitCardName.Text = "Enter Name" Then
    txtDebitCardName.Text = ""
    Else
     
    End If
     
If txtDebitCardExpirationDate.Text = "" Or txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If

End Sub

Private Sub txtDebitCardNumber_Click()

If txtDebitCardType.Text = "" Or txtDebitCardType.Text = "Debit Card Type" Then
    txtDebitCardType.Text = "Debit Card Type"
    Else
    
    End If

If txtDebitCardCVV = "" Or txtDebitCardCVV = "CVV code" Then
    txtDebitCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtDebitCardNumber.Text = "" Or txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtDebitCardNumber.Text = ""
    Else
    
    End If
    
If txtDebitCardName.Text = "" Or txtDebitCardName.Text = "Enter Name" Then
    txtDebitCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtDebitCardExpirationDate.Text = "" Or txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If

End Sub

Private Sub txtDebitCardType_Click()

If txtDebitCardType.Text = "" Or txtDebitCardType.Text = "Debit Card Type" Then
    txtDebitCardType.Text = ""
    Else
    
    End If

If txtDebitCardCVV = "" Or txtDebitCardCVV = "CVV code" Then
    txtDebitCardCVV.Text = "CVV code"
    Else
    
    End If
    
If txtDebitCardNumber.Text = "" Or txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx" Then
    txtDebitCardNumber.Text = "Enter Debit Card Number xxxx-xxxx-xxxx-xxxx"
    Else
    
    End If
    
If txtDebitCardName.Text = "" Or txtDebitCardName.Text = "Enter Name" Then
    txtDebitCardName.Text = "Enter Name"
    Else
     
    End If
     
If txtDebitCardExpirationDate.Text = "" Or txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)" Then
    txtDebitCardExpirationDate.Text = "Expiration Date  (e.g. 4/2014)"
    Else
    
    End If

End Sub
