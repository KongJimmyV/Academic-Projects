VERSION 5.00
Begin VB.Form frmFeed 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "NOOOOOO SAVE US"
   ClientHeight    =   6870
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   10620
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6870
   ScaleWidth      =   10620
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrFood 
      Interval        =   1000
      Left            =   2520
      Top             =   5760
   End
   Begin VB.Image imgFood1 
      DragIcon        =   "frmFeed.frx":0000
      DragMode        =   1  'Automatic
      Height          =   480
      Left            =   6120
      Picture         =   "frmFeed.frx":08CA
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   480
   End
   Begin VB.Image imgEater 
      Height          =   1480
      Left            =   600
      Picture         =   "frmFeed.frx":1194
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   1480
   End
   Begin VB.Label lblFood 
      Caption         =   "SANDWICHS!!!!!!"
      Height          =   615
      Left            =   840
      TabIndex        =   0
      Top             =   1200
      Width           =   1575
   End
End
Attribute VB_Name = "frmFeed"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub imgEater_DragDrop(Source As Control, X As Single, Y As Single)

    imgEater.Width = imgEater.Width * 1.2
    imgEater.Height = imgEater.Height * 1.2
    
    tmrFood.Interval = tmrFood.Interval - 50
    
End Sub

Private Sub tmrFood_Timer()

    imgFood1.Left = Rnd * frmFeed.Width
    imgFood1.Top = Rnd * frmFeed.Height
   
End Sub
