VERSION 5.00
Begin VB.Form frmClubParts 
   Caption         =   "Golf Club Parts"
   ClientHeight    =   3510
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   5400
   LinkTopic       =   "Form1"
   ScaleHeight     =   3510
   ScaleWidth      =   5400
   StartUpPosition =   3  'Windows Default
   Begin VB.Image imgShaft 
      Height          =   1095
      Left            =   1080
      ToolTipText     =   "This is the Shaft of a golf club.  It is usally made out of metal or wood."
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgHosel 
      Height          =   255
      Left            =   840
      ToolTipText     =   "This is the Hozel"
      Top             =   2280
      Width           =   375
   End
   Begin VB.Image imgHead 
      Height          =   375
      Left            =   600
      ToolTipText     =   "This is the Club head of a Golf Club"
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgGrip 
      Height          =   735
      Left            =   2280
      ToolTipText     =   "This is the 'Grip'... where you hold on to the club."
      Top             =   600
      Width           =   735
   End
   Begin VB.Image imgClub 
      Height          =   3255
      Left            =   120
      Picture         =   "frmGolfParts.frx":0000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   3135
   End
End
Attribute VB_Name = "frmClubParts"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
