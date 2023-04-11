VERSION 5.00
Begin VB.Form frmVehicle2 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   8895
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   14895
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   8895
   ScaleWidth      =   14895
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdBack 
      Caption         =   "Back"
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   8160
      Width           =   1095
   End
   Begin VB.Label lblPrice 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "$471,263"
      BeginProperty Font 
         Name            =   "Tempus Sans ITC"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   615
      Left            =   9720
      TabIndex        =   3
      Top             =   960
      Width           =   2055
   End
   Begin VB.Image imgCar 
      Height          =   4335
      Left            =   4320
      Picture         =   "frmVehicle2.frx":0000
      Stretch         =   -1  'True
      Top             =   1560
      Width           =   6255
   End
   Begin VB.Label lblSpecs2 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"frmVehicle2.frx":AFB0
      Height          =   2655
      Left            =   3360
      TabIndex        =   2
      Top             =   6000
      Width           =   8175
   End
   Begin VB.Label lblSpecs1 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Specs"
      BeginProperty Font 
         Name            =   "Tempus Sans ITC"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   1335
      Left            =   5280
      TabIndex        =   1
      Top             =   120
      Width           =   4335
   End
End
Attribute VB_Name = "frmVehicle2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()

    frmVehicle2.Visible = False
    frmHome.Visible = True
    
End Sub
