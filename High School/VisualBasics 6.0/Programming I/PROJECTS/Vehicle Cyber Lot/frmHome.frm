VERSION 5.00
Begin VB.Form frmHome 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Cyber Lot Home Page"
   ClientHeight    =   7215
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   10455
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7215
   ScaleWidth      =   10455
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCar4 
      Caption         =   "View Car"
      Height          =   735
      Left            =   9000
      TabIndex        =   6
      Top             =   1440
      Width           =   1335
   End
   Begin VB.CommandButton cmdCar3 
      Caption         =   "View Car"
      Height          =   735
      Left            =   6120
      TabIndex        =   5
      Top             =   1440
      Width           =   1335
   End
   Begin VB.CommandButton cmdCar2 
      Caption         =   "View Car"
      Height          =   735
      Left            =   3120
      TabIndex        =   4
      Top             =   1440
      Width           =   1335
   End
   Begin VB.CommandButton cmdCar1 
      Caption         =   "View Car"
      Height          =   735
      Left            =   240
      TabIndex        =   3
      Top             =   1440
      Width           =   1335
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "Exit"
      Height          =   735
      Left            =   6000
      TabIndex        =   1
      Top             =   6240
      Width           =   1335
   End
   Begin VB.CommandButton cmdPurchase 
      Caption         =   "Purchase a Car"
      Height          =   735
      Left            =   2880
      TabIndex        =   0
      Top             =   6240
      Width           =   1455
   End
   Begin VB.Label lblCar4 
      BackColor       =   &H00000000&
      Caption         =   "Label4"
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   8400
      TabIndex        =   10
      Top             =   2280
      Width           =   1815
   End
   Begin VB.Label lblCar3 
      BackColor       =   &H00000000&
      Caption         =   "2013 Honda Accord CoupeEX- Automatic Coupe"
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   5640
      TabIndex        =   9
      Top             =   2280
      Width           =   1815
   End
   Begin VB.Label lblCar2 
      BackColor       =   &H00000000&
      Caption         =   "Ferrari F12berlinetta"
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   3120
      TabIndex        =   8
      Top             =   2280
      Width           =   1815
   End
   Begin VB.Label lblCar1 
      BackColor       =   &H00000000&
      Caption         =   "2013 Nissan ALTIMA 3.5 SL"
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   240
      TabIndex        =   7
      Top             =   2280
      Width           =   1815
   End
   Begin VB.Label lblWelcome 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Welcome to the Cyber Lot!"
      BeginProperty Font 
         Name            =   "Tempus Sans ITC"
         Size            =   39.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFC0&
      Height          =   1095
      Left            =   360
      TabIndex        =   2
      Top             =   120
      Width           =   9735
   End
End
Attribute VB_Name = "frmHome"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCar1_Click()

    frmHome.Visible = False
    frmVehicle1.Visible = True

End Sub

Private Sub cmdCar2_Click()

    frmHome.Visible = False
    frmVehicle2.Visible = True

End Sub

Private Sub cmdCar3_Click()

    frmHome.Visible = False
    frmVehicle3.Visible = True

End Sub

Private Sub cmdCar4_Click()

    frmHome.Visible = False
    frmVehicle4.Visible = True

End Sub

Private Sub cmdEnd_Click()

    frmHome.Visible = False
    frmEnd.Visible = True

End Sub

Private Sub cmdPurchase_Click()

    frmHome.Visible = False
    frmPurchase.Visible = True

End Sub
