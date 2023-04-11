VERSION 5.00
Begin VB.Form frmDiceRollIntro 
   Caption         =   "Dice Roll"
   ClientHeight    =   7320
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   15015
   LinkTopic       =   "Form1"
   ScaleHeight     =   7320
   ScaleWidth      =   15015
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrD2 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   7560
      Top             =   4200
   End
   Begin VB.Timer tmrD1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   6840
      Top             =   4200
   End
   Begin VB.CommandButton cmdRoll 
      Caption         =   "Roll"
      Height          =   375
      Left            =   6960
      TabIndex        =   0
      Top             =   2040
      Width           =   855
   End
   Begin VB.Image imgD3 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Left            =   6720
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD4 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Left            =   8160
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD5 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Left            =   9600
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD2 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Image imgD1 
      BorderStyle     =   1  'Fixed Single
      Height          =   1335
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   1335
   End
End
Attribute VB_Name = "frmDiceRollIntro"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim D1 As Integer
Dim D2 As Integer
Dim D3 As Integer
Dim D4 As Integer
Dim D5 As Integer

Private Sub cmdRoll_Click()

    Cls
    
    Randomize
    
    'randomly select 1 to 6
    D1 = Int(Rnd * 6) + 1
    D2 = Int(Rnd * 6) + 1
    D3 = Int(Rnd * 6) + 1
    D4 = Int(Rnd * 6) + 1
    D5 = Int(Rnd * 6) + 1
    FontSize = 24
    Print D1 + D2 + D3 + D4 + D5
    
    'Load Matching Image
    imgD1.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D1 & ".jpg")
    imgD2.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D2 & ".jpg")
    imgD3.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D3 & ".jpg")
    imgD4.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D4 & ".jpg")
    imgD5.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D5 & ".jpg")
    
    tmrD1.Enabled = True
    tmrD2.Enabled = True
    
End Sub

Private Sub tmrD1_Timer()

    Cls
    
    Randomize
    
    'randomly select 1 to 6
    D1 = Int(Rnd * 6) + 1
    D2 = Int(Rnd * 6) + 1
    D3 = Int(Rnd * 6) + 1
    D4 = Int(Rnd * 6) + 1
    D5 = Int(Rnd * 6) + 1
    FontSize = 24
    Print D1 + D2 + D3 + D4 + D5
    
    'Load Matching Image
    imgD1.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D1 & ".jpg")
    imgD2.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D2 & ".jpg")
    imgD3.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D3 & ".jpg")
    imgD4.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D4 & ".jpg")
    imgD5.Picture = LoadPicture(App.Path & "\6-5-4 Dice Images\Dice" & D5 & ".jpg")
    
End Sub

Private Sub tmrD2_Timer()

    tmrD1.Enabled = False
    tmrD2.Enabled = False
    
End Sub

