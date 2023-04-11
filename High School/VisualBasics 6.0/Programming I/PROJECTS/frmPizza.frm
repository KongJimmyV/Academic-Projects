VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   Caption         =   "Form1"
   ClientHeight    =   9270
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7695
   LinkTopic       =   "Form1"
   ScaleHeight     =   9270
   ScaleWidth      =   7695
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraToppings 
      BackColor       =   &H00000000&
      Caption         =   "Toppings"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   2895
      Left            =   3840
      TabIndex        =   1
      Top             =   1560
      Width           =   2895
      Begin VB.CheckBox chkPepperoni 
         BackColor       =   &H00000000&
         Caption         =   "Pepperoni ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   2160
         Width           =   2655
      End
      Begin VB.CheckBox chkOlives 
         BackColor       =   &H00000000&
         Caption         =   "Olives ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   1680
         Width           =   2655
      End
      Begin VB.CheckBox chkMeat 
         BackColor       =   &H00000000&
         Caption         =   "Meat ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   1200
         Width           =   2655
      End
      Begin VB.CheckBox chkCheese 
         BackColor       =   &H00000000&
         Caption         =   "Cheese ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   720
         Width           =   2655
      End
   End
   Begin VB.Frame fraSize 
      BackColor       =   &H00000000&
      Caption         =   "Size"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   2895
      Left            =   840
      TabIndex        =   0
      Top             =   1560
      Width           =   2775
      Begin VB.OptionButton optLarge 
         BackColor       =   &H00000000&
         Caption         =   "Large (14.99$)"
         ForeColor       =   &H000000FF&
         Height          =   615
         Left            =   120
         TabIndex        =   4
         Top             =   2040
         Width           =   2535
      End
      Begin VB.OptionButton optMedium 
         BackColor       =   &H00000000&
         Caption         =   "Medium (9.99$)"
         ForeColor       =   &H000000FF&
         Height          =   615
         Left            =   120
         TabIndex        =   3
         Top             =   1320
         Width           =   2535
      End
      Begin VB.OptionButton optSmall 
         BackColor       =   &H00000000&
         Caption         =   "Small (4.99$)"
         ForeColor       =   &H000000FF&
         Height          =   615
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Width           =   2535
      End
   End
   Begin VB.Label lblTitlePizza 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "PIZZA"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   33.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1095
      Left            =   600
      TabIndex        =   10
      Top             =   360
      Width           =   6375
   End
   Begin VB.Image imgPizza 
      Height          =   2715
      Left            =   840
      Picture         =   "frmPizza.frx":0000
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   2715
   End
   Begin VB.Label lblCost 
      BackColor       =   &H00000000&
      Caption         =   "$0.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   495
      Left            =   4680
      TabIndex        =   9
      Top             =   7440
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim SizeCost As Single
Dim CheeseCost As Single
Dim MeatCost As Single
Dim PepperoniCost As Single
Dim OlivesCost As Single
Dim TotalCost As Single

Private Sub chkCheese_Click()

    If chkCheese.Value = 1 Then
        CheeseCost = 0.99
    Else
        CheeseCost = 0
    End If
    
    TotalCost = SizeCost + CheeseCost + MeatCost + PepperoniCost + OlivesCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkMeat_Click()

    If chkMeat.Value = 1 Then
        MeatCost = 0.99
    Else
        MeatCost = 0
    End If
    
    TotalCost = SizeCost + CheeseCost + MeatCost + PepperoniCost + OlivesCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkOlives_Click()

    If chkOlives.Value = 1 Then
        OlivesCost = 0.99
    Else
        OlivesCost = 0
    End If
    
    TotalCost = SizeCost + CheeseCost + MeatCost + PepperoniCost + OlivesCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkPepperoni_Click()

    If chkPepperoni.Value = 1 Then
        PepperoniCost = 0.99
    Else
        PepperoniCost = 0
    End If
    
    TotalCost = SizeCost + CheeseCost + MeatCost + PepperoniCost + OlivesCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub optLarge_Click()

    imgPizza.Height = 3200
    imgPizza.Width = 3200
    SizeCost = 14.99
    TotalCost = SizeCost + CheeseCost + MeatCost + PepperoniCost + OlivesCost
    lblCost.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub optMedium_Click()

    imgPizza.Height = 2500
    imgPizza.Width = 2500
    SizeCost = 9.99
    TotalCost = SizeCost + CheeseCost + MeatCost + PepperoniCost + OlivesCost
    lblCost.Caption = Format(TotalCost, "Currency")
    
End Sub

Private Sub optSmall_Click()

    imgPizza.Height = 2000
    imgPizza.Width = 2000
    SizeCost = 4.99
    TotalCost = SizeCost + CheeseCost + MeatCost + PepperoniCost + OlivesCost
    lblCost.Caption = Format(TotalCost, "Currency")
    
End Sub
