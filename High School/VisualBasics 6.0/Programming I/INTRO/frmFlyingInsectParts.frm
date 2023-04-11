VERSION 5.00
Begin VB.Form frmFlyingInsectParts 
   Caption         =   "Flying Insect Parts"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.Image imgThorax 
      Height          =   495
      Left            =   2040
      ToolTipText     =   "This is the Thorax of a ""Flying Insect""."
      Top             =   1200
      Width           =   495
   End
   Begin VB.Image imgAbdomen 
      Height          =   855
      Left            =   2040
      ToolTipText     =   "This is the Abdomen of a ""Flying Insect""."
      Top             =   1680
      Width           =   495
   End
   Begin VB.Image imgAntenna 
      Height          =   375
      Left            =   2520
      ToolTipText     =   "This is the Antennae of a ""Flying Insect""."
      Top             =   720
      Width           =   375
   End
   Begin VB.Image imgHindWing 
      Height          =   495
      Left            =   1080
      ToolTipText     =   "This is the Hind Wing of a ""Flying Insect""."
      Top             =   1440
      Width           =   855
   End
   Begin VB.Image imgHead 
      Height          =   255
      Left            =   2040
      ToolTipText     =   "This is the Head of a ""Flying Insect"".  It Eyes are located here along with its Antenna."
      Top             =   960
      Width           =   470
   End
   Begin VB.Image imgForeWing 
      Height          =   855
      Left            =   360
      ToolTipText     =   "This is the Fore Wing of a ""Flying Insect"".  It allows the Insect to 'Fly'."
      Top             =   600
      Width           =   1335
   End
   Begin VB.Image imgFlyingInsect 
      Height          =   2850
      Left            =   120
      Picture         =   "frmFlyingInsectParts.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   4290
   End
End
Attribute VB_Name = "frmFlyingInsectParts"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
