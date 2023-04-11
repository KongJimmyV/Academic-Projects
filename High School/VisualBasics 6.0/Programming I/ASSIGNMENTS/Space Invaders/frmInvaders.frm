VERSION 5.00
Begin VB.Form frmInvaders 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Space Invaders"
   ClientHeight    =   9615
   ClientLeft      =   150
   ClientTop       =   780
   ClientWidth     =   14655
   FillColor       =   &H00FFFFFF&
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   9615
   ScaleWidth      =   14655
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrAIDodgePhase 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   7800
      Top             =   7680
   End
   Begin VB.Timer tmrAIControl 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   7440
      Top             =   7680
   End
   Begin VB.Timer tmrGameOn 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   3480
      Top             =   8760
   End
   Begin VB.Timer tmrGameChecker 
      Interval        =   50
      Left            =   2640
      Top             =   8760
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   11
      Interval        =   25
      Left            =   9120
      Top             =   6720
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   10
      Interval        =   25
      Left            =   9120
      Top             =   6120
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   9
      Interval        =   25
      Left            =   9120
      Top             =   5520
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   8
      Interval        =   25
      Left            =   8160
      Top             =   6720
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   7
      Interval        =   25
      Left            =   8160
      Top             =   6120
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   6
      Interval        =   25
      Left            =   8160
      Top             =   5520
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   5
      Interval        =   25
      Left            =   7200
      Top             =   6720
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   4
      Interval        =   25
      Left            =   7200
      Top             =   6120
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   3
      Interval        =   25
      Left            =   7200
      Top             =   5520
   End
   Begin VB.Timer tmrAShoot 
      Index           =   29
      Interval        =   50
      Left            =   4320
      Top             =   7800
   End
   Begin VB.Timer tmrAShoot 
      Index           =   28
      Interval        =   50
      Left            =   4320
      Top             =   7320
   End
   Begin VB.Timer tmrAShoot 
      Index           =   27
      Interval        =   50
      Left            =   4320
      Top             =   6840
   End
   Begin VB.Timer tmrAShoot 
      Index           =   26
      Interval        =   50
      Left            =   4320
      Top             =   6360
   End
   Begin VB.Timer tmrAShoot 
      Index           =   25
      Interval        =   50
      Left            =   4320
      Top             =   5880
   End
   Begin VB.Timer tmrAShoot 
      Index           =   24
      Interval        =   50
      Left            =   4320
      Top             =   5400
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   15
      Interval        =   200
      Left            =   10680
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   15
      Interval        =   200
      Left            =   11040
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   14
      Interval        =   200
      Left            =   9600
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   14
      Interval        =   200
      Left            =   9960
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   13
      Interval        =   200
      Left            =   8520
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   13
      Interval        =   200
      Left            =   8880
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   12
      Interval        =   200
      Left            =   7440
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   12
      Interval        =   200
      Left            =   7800
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   11
      Interval        =   200
      Left            =   6360
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   11
      Interval        =   200
      Left            =   6720
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   10
      Interval        =   200
      Left            =   5280
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   10
      Interval        =   200
      Left            =   5640
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   9
      Interval        =   200
      Left            =   4200
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   9
      Interval        =   200
      Left            =   4560
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   8
      Interval        =   200
      Left            =   3120
      Top             =   1680
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   8
      Interval        =   200
      Left            =   3480
      Top             =   1680
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   0
      Interval        =   200
      Left            =   3120
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   7
      Interval        =   200
      Left            =   11040
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   6
      Interval        =   200
      Left            =   9960
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   5
      Interval        =   200
      Left            =   8880
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   4
      Interval        =   200
      Left            =   7800
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   3
      Interval        =   200
      Left            =   6720
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   2
      Interval        =   200
      Left            =   5640
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   1
      Interval        =   200
      Left            =   4560
      Top             =   960
   End
   Begin VB.Timer tmrAlienR 
      Enabled         =   0   'False
      Index           =   0
      Interval        =   200
      Left            =   3480
      Top             =   960
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   7
      Interval        =   200
      Left            =   10680
      Top             =   960
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   6
      Interval        =   200
      Left            =   9600
      Top             =   960
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   5
      Interval        =   200
      Left            =   8520
      Top             =   960
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   4
      Interval        =   200
      Left            =   7440
      Top             =   960
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   3
      Interval        =   200
      Left            =   6360
      Top             =   960
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   2
      Interval        =   200
      Left            =   5280
      Top             =   960
   End
   Begin VB.Timer tmrAlienL 
      Enabled         =   0   'False
      Index           =   1
      Interval        =   200
      Left            =   4200
      Top             =   960
   End
   Begin VB.Timer tmrAShoot 
      Index           =   23
      Interval        =   50
      Left            =   2520
      Top             =   7800
   End
   Begin VB.Timer tmrAShoot 
      Index           =   22
      Interval        =   50
      Left            =   2520
      Top             =   7320
   End
   Begin VB.Timer tmrAShoot 
      Index           =   21
      Interval        =   50
      Left            =   2520
      Top             =   6840
   End
   Begin VB.Timer tmrAShoot 
      Index           =   20
      Interval        =   50
      Left            =   2520
      Top             =   6360
   End
   Begin VB.Timer tmrAShoot 
      Index           =   19
      Interval        =   50
      Left            =   2520
      Top             =   5880
   End
   Begin VB.Timer tmrAShoot 
      Index           =   18
      Interval        =   50
      Left            =   2520
      Top             =   5400
   End
   Begin VB.Timer tmrAShoot 
      Index           =   17
      Interval        =   50
      Left            =   3480
      Top             =   7800
   End
   Begin VB.Timer tmrAShoot 
      Index           =   16
      Interval        =   50
      Left            =   3480
      Top             =   7320
   End
   Begin VB.Timer tmrAShoot 
      Index           =   15
      Interval        =   50
      Left            =   3480
      Top             =   6840
   End
   Begin VB.Timer tmrAShoot 
      Index           =   14
      Interval        =   50
      Left            =   3480
      Top             =   6360
   End
   Begin VB.Timer tmrAShoot 
      Index           =   13
      Interval        =   50
      Left            =   3480
      Top             =   5880
   End
   Begin VB.Timer tmrAShoot 
      Index           =   12
      Interval        =   50
      Left            =   3480
      Top             =   5400
   End
   Begin VB.Timer tmrAShoot 
      Index           =   11
      Interval        =   50
      Left            =   1680
      Top             =   5400
   End
   Begin VB.Timer tmrAShoot 
      Index           =   10
      Interval        =   50
      Left            =   1680
      Top             =   5880
   End
   Begin VB.Timer tmrAShoot 
      Index           =   9
      Interval        =   50
      Left            =   1680
      Top             =   6360
   End
   Begin VB.Timer tmrAShoot 
      Index           =   8
      Interval        =   50
      Left            =   1680
      Top             =   6840
   End
   Begin VB.Timer tmrAShoot 
      Index           =   7
      Interval        =   50
      Left            =   1680
      Top             =   7320
   End
   Begin VB.Timer tmrAShoot 
      Index           =   6
      Interval        =   50
      Left            =   1680
      Top             =   7800
   End
   Begin VB.Timer tmrAShoot 
      Index           =   5
      Interval        =   50
      Left            =   720
      Top             =   5400
   End
   Begin VB.Timer tmrAShoot 
      Index           =   4
      Interval        =   50
      Left            =   720
      Top             =   5880
   End
   Begin VB.Timer tmrAShoot 
      Index           =   3
      Interval        =   50
      Left            =   720
      Top             =   6360
   End
   Begin VB.Timer tmrAShoot 
      Index           =   2
      Interval        =   50
      Left            =   720
      Top             =   6840
   End
   Begin VB.Timer tmrAShoot 
      Index           =   1
      Interval        =   50
      Left            =   720
      Top             =   7320
   End
   Begin VB.Timer tmrAShootTimer 
      Interval        =   500
      Left            =   720
      Top             =   8280
   End
   Begin VB.Timer tmrAShoot 
      Index           =   0
      Interval        =   50
      Left            =   720
      Top             =   7800
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   2
      Interval        =   25
      Left            =   6360
      Top             =   5520
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   1
      Interval        =   25
      Left            =   6360
      Top             =   6120
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   0
      Interval        =   25
      Left            =   6360
      Top             =   6720
   End
   Begin VB.Timer tmrSR 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   9480
      Top             =   7920
   End
   Begin VB.Timer tmrSL 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   5640
      Top             =   7920
   End
   Begin VB.Label lblHitCount 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Hit: 0"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   10560
      TabIndex        =   1
      Top             =   9120
      Width           =   2055
   End
   Begin VB.Image imgShip 
      Height          =   735
      Left            =   7320
      Picture         =   "frmInvaders.frx":0000
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   735
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   15
      Left            =   10800
      Picture         =   "frmInvaders.frx":0822
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   14
      Left            =   9720
      Picture         =   "frmInvaders.frx":10EC
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   13
      Left            =   8640
      Picture         =   "frmInvaders.frx":19B6
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   12
      Left            =   7560
      Picture         =   "frmInvaders.frx":2280
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   11
      Left            =   6480
      Picture         =   "frmInvaders.frx":2B4A
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   10
      Left            =   5400
      Picture         =   "frmInvaders.frx":3414
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   9
      Left            =   4320
      Picture         =   "frmInvaders.frx":3CDE
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   8
      Left            =   3240
      Picture         =   "frmInvaders.frx":45A8
      Stretch         =   -1  'True
      Top             =   860
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   7
      Left            =   10800
      Picture         =   "frmInvaders.frx":4E72
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   6
      Left            =   9720
      Picture         =   "frmInvaders.frx":573C
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   5
      Left            =   8640
      Picture         =   "frmInvaders.frx":6006
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   4
      Left            =   7560
      Picture         =   "frmInvaders.frx":68D0
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   3
      Left            =   6480
      Picture         =   "frmInvaders.frx":719A
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   2
      Left            =   5400
      Picture         =   "frmInvaders.frx":7A64
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   1
      Left            =   4320
      Picture         =   "frmInvaders.frx":832E
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAlien 
      Height          =   615
      Index           =   0
      Left            =   3240
      Picture         =   "frmInvaders.frx":8BF8
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   11
      Left            =   9720
      Picture         =   "frmInvaders.frx":94C2
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   10
      Left            =   9720
      Picture         =   "frmInvaders.frx":996C
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   9
      Left            =   9720
      Picture         =   "frmInvaders.frx":9E16
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   8
      Left            =   8760
      Picture         =   "frmInvaders.frx":A2C0
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   7
      Left            =   8760
      Picture         =   "frmInvaders.frx":A76A
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   6
      Left            =   8760
      Picture         =   "frmInvaders.frx":AC14
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   5
      Left            =   7800
      Picture         =   "frmInvaders.frx":B0BE
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   4
      Left            =   7800
      Picture         =   "frmInvaders.frx":B568
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   3
      Left            =   7800
      Picture         =   "frmInvaders.frx":BA12
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   29
      Left            =   4920
      Picture         =   "frmInvaders.frx":BEBC
      Stretch         =   -1  'True
      Top             =   7920
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   28
      Left            =   4920
      Picture         =   "frmInvaders.frx":BF1C
      Stretch         =   -1  'True
      Top             =   7440
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   27
      Left            =   4920
      Picture         =   "frmInvaders.frx":BF7C
      Stretch         =   -1  'True
      Top             =   6960
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   26
      Left            =   4920
      Picture         =   "frmInvaders.frx":BFDC
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   25
      Left            =   4920
      Picture         =   "frmInvaders.frx":C03C
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   24
      Left            =   4920
      Picture         =   "frmInvaders.frx":C09C
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   23
      Left            =   3120
      Picture         =   "frmInvaders.frx":C0FC
      Stretch         =   -1  'True
      Top             =   7920
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   22
      Left            =   3120
      Picture         =   "frmInvaders.frx":C15C
      Stretch         =   -1  'True
      Top             =   7440
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   21
      Left            =   3120
      Picture         =   "frmInvaders.frx":C1BC
      Stretch         =   -1  'True
      Top             =   6960
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   20
      Left            =   3120
      Picture         =   "frmInvaders.frx":C21C
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   19
      Left            =   3120
      Picture         =   "frmInvaders.frx":C27C
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   18
      Left            =   3120
      Picture         =   "frmInvaders.frx":C2DC
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   17
      Left            =   4080
      Picture         =   "frmInvaders.frx":C33C
      Stretch         =   -1  'True
      Top             =   7920
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   16
      Left            =   4080
      Picture         =   "frmInvaders.frx":C39C
      Stretch         =   -1  'True
      Top             =   7440
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   15
      Left            =   4080
      Picture         =   "frmInvaders.frx":C3FC
      Stretch         =   -1  'True
      Top             =   6960
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   14
      Left            =   4080
      Picture         =   "frmInvaders.frx":C45C
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   13
      Left            =   4080
      Picture         =   "frmInvaders.frx":C4BC
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   12
      Left            =   4080
      Picture         =   "frmInvaders.frx":C51C
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   135
   End
   Begin VB.Label lblACount 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Shot: 0"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   12600
      TabIndex        =   0
      Top             =   9120
      Width           =   2055
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   11
      Left            =   2280
      Picture         =   "frmInvaders.frx":C57C
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   10
      Left            =   2280
      Picture         =   "frmInvaders.frx":C5DC
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   9
      Left            =   2280
      Picture         =   "frmInvaders.frx":C63C
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   8
      Left            =   2280
      Picture         =   "frmInvaders.frx":C69C
      Stretch         =   -1  'True
      Top             =   6960
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   7
      Left            =   2280
      Picture         =   "frmInvaders.frx":C6FC
      Stretch         =   -1  'True
      Top             =   7440
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   6
      Left            =   2280
      Picture         =   "frmInvaders.frx":C75C
      Stretch         =   -1  'True
      Top             =   7920
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   5
      Left            =   1320
      Picture         =   "frmInvaders.frx":C7BC
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   2
      Left            =   6960
      Picture         =   "frmInvaders.frx":C81C
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   1
      Left            =   6960
      Picture         =   "frmInvaders.frx":CCC6
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   135
   End
   Begin VB.Image imgAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   0
      Left            =   6960
      Picture         =   "frmInvaders.frx":D170
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   4
      Left            =   1320
      Picture         =   "frmInvaders.frx":D61A
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   3
      Left            =   1320
      Picture         =   "frmInvaders.frx":D67A
      Stretch         =   -1  'True
      Top             =   6480
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   2
      Left            =   1320
      Picture         =   "frmInvaders.frx":D6DA
      Stretch         =   -1  'True
      Top             =   6960
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   1
      Left            =   1320
      Picture         =   "frmInvaders.frx":D73A
      Stretch         =   -1  'True
      Top             =   7440
      Width           =   135
   End
   Begin VB.Image imgAlienAmmo 
      Enabled         =   0   'False
      Height          =   255
      Index           =   0
      Left            =   1320
      Picture         =   "frmInvaders.frx":D79A
      Stretch         =   -1  'True
      Top             =   7920
      Width           =   135
   End
   Begin VB.Menu mnu0File 
      Caption         =   "File"
      Begin VB.Menu mnu0Exit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnu1Options 
      Caption         =   "Options"
      Begin VB.Menu mnu1InvaderOpt 
         Caption         =   "Invaders"
         Begin VB.Menu mnu1ResetInvSpeed 
            Caption         =   "Reset Invader Speed"
         End
         Begin VB.Menu mnu1InvaderSpeed 
            Caption         =   "Set Invader Speed"
         End
         Begin VB.Menu mnu1ResetInvSize 
            Caption         =   "Reset Invader Size"
         End
         Begin VB.Menu mnu1InvaderSize 
            Caption         =   "Set Invader Size"
         End
      End
      Begin VB.Menu mnu1ShipOpt 
         Caption         =   "Ship"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu mnu5Game 
      Caption         =   "Game"
      Begin VB.Menu mnu5Start 
         Caption         =   "Start Game"
      End
      Begin VB.Menu mnu5Stop 
         Caption         =   "Stop Game"
      End
      Begin VB.Menu mnu5Pause 
         Caption         =   "Pause Game"
      End
   End
   Begin VB.Menu mnu4Cheats 
      Caption         =   "Cheats"
      Begin VB.Menu mnu3Boost 
         Caption         =   "Boost"
         Begin VB.Menu mnu3Normal 
            Caption         =   "Normal"
         End
         Begin VB.Menu mnu3Turbo 
            Caption         =   "Turbo"
         End
      End
      Begin VB.Menu mnu4Win 
         Caption         =   "Win"
      End
      Begin VB.Menu mnu4Lose 
         Caption         =   "Lose"
      End
   End
   Begin VB.Menu mnu2Reset 
      Caption         =   "Reset"
   End
End
Attribute VB_Name = "frmInvaders"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Ammo int
Dim A As Integer
'Ship var int
Dim S As Integer
'''LIV == Amount of Ship lives left
Dim LIV As Integer

'Alien ship relations int
Dim AB As Integer
'Alien ship int
Dim V As Integer
'''SIL == Amount of Invaders Left'''
Dim SIL As Integer

'Variable Shift int
Dim C As Integer

'Alien Timer int
Dim T As Integer

'randomize hit and shift var and int
Dim VariableShift As Integer
Dim upperbound As Integer
Dim lowerbound As Integer
Dim randomvalue As Integer

'''This var and int Defines Yes and No'''
Dim YN As Integer

'other variables
Dim CountF1 As Integer
Dim CountF2 As Integer
Dim LR As Integer
Dim InvaderSize As Integer
'''
Dim ACount As Integer
Dim HitCount As Integer
Dim ABoost As Integer
Dim ALBoost As Integer
Dim Boost As Integer
Dim IntDir As Integer



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    'move to the right
    If KeyCode = vbKeyRight Then
        tmrSR.Enabled = True
    End If
        
    'move to the left
    If KeyCode = vbKeyLeft Then
        tmrSL.Enabled = True
    End If
    
    If tmrGameOn.Enabled = True Then
    ''''
        'Shoot Ammo
        If SIL > 0 And LIV > 0 Then
            If KeyCode = vbKeySpace And imgAmmo(A).Enabled = False And imgAmmo(A).Top <= (imgShip.Height + imgShip.Top) Then
                ACount = ACount + 1
                lblACount.Caption = "Shot: " & ACount
                
                imgAmmo(A).Enabled = True
                imgAmmo(A).Visible = True
                '//align ammo to Ship
                imgAmmo(A).Left = imgShip.Left + imgShip.Width - (imgShip.Width / 2) - 90
                imgAmmo(A).Top = imgShip.Top
                tmrAmmo(A).Enabled = True
                A = A + 1
                    If A >= 12 Then
                        A = 0
                    End If
            End If
        End If
    ''''
    End If
    
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

    'stop right
    If KeyCode = vbKeyRight Then
        tmrSR.Enabled = False
    End If
    
    'stop left
    If KeyCode = vbKeyLeft Then
        tmrSL.Enabled = False
    End If
    
End Sub

Private Sub Form_Load()

    Randomize
    
    VariableShift = 0
    Boost = 50
    ALBoost = 150
    SIL = 16
    LIV = 1
    InvaderSize = 615
    mnu3Normal.Checked = True
    
    AIHeightDodgeRange = 400
    AISideDodgeRange = 300
    
    tmrGameOn.Enabled = False
    mnu5Start.Enabled = True
    mnu5Stop.Enabled = False
    mnu5Pause.Enabled = False
    mnu5Stop.Checked = True
    
    A = 0
    AB = 0
    V = 0
    
    imgShip.Top = 8400
    imgShip.Left = 7320
    imgShip.Enabled = True
    imgShip.Visible = True
    
    For A = 0 To 11
        imgAmmo(A).Enabled = False
        imgAmmo(A).Visible = False
        imgAmmo(A).Top = 0
        imgAmmo(A).Left = 0
    Next A
    
    For AB = 0 To 29
        imgAlienAmmo(AB).Enabled = False
        imgAlienAmmo(AB).Visible = False
        imgAlienAmmo(AB).Top = 0
        imgAlienAmmo(AB).Left = 0
    Next AB
    
    upperbound = 1000
    lowerbound = 0
    
    LR = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
    
    For AB = 0 To 15
        If LR < 500 Then
            tmrAlienL(AB).Enabled = True
            tmrAlienL(AB).Interval = 200
        Else
            tmrAlienR(AB).Enabled = True
            tmrAlienR(AB).Interval = 200
        End If
    Next AB
    
    A = 0
    AB = 0
    
End Sub

Private Sub mnu0Exit_Click()

    'Exit Program
    End
    
End Sub

Private Sub mnu1InvaderSize_Click()

    InvaderSize = InputBox("Set Size.  'Default is 615'", "Invader Size?", InvaderSize)
    
    For AB = 0 To 15
        imgAlien(AB).Height = InvaderSize
        imgAlien(AB).Width = InvaderSize
    Next AB
    AB = 0
    
End Sub

Private Sub mnu1InvaderSpeed_Click()

    ALBoost = InputBox("Set Speed.  'Default is 150'", "Invader Speed?", ALBoost)
    
End Sub

Private Sub mnu1ResetInvSize_Click()

    For AB = 0 To 15
        imgAlien(AB).Height = 615
        imgAlien(AB).Width = 615
    Next AB
    AB = 0
    
End Sub

Private Sub mnu1ResetInvSpeed_Click()

    ALBoost = 150
    
End Sub

Private Sub mnu2Reset_Click()

    Randomize
    
    VariableShift = 0
    Boost = 50
    SIL = 16
    LIV = 1
    mnu3Normal.Checked = True
    
    A = 0
    AB = 0
    V = 0
    
    imgShip.Top = 8400
    imgShip.Left = 7320
    imgShip.Enabled = True
    imgShip.Visible = True
    
    '''
    
    For A = 0 To 11
        imgAmmo(A).Enabled = False
        imgAmmo(A).Visible = False
        imgAmmo(A).Top = 0
        imgAmmo(A).Left = 0
    Next A
    For AB = 0 To 29
        imgAlienAmmo(AB).Enabled = False
        imgAlienAmmo(AB).Visible = False
        imgAlienAmmo(AB).Top = 0
        imgAlienAmmo(AB).Left = 0
    Next AB
    
    '''
    
    upperbound = 1000
    lowerbound = 0
    
    LR = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
    
    '''
    'reset timers
    For AB = 0 To 15
        tmrAlienL(AB).Enabled = False
        tmrAlienR(AB).Enabled = False
    Next AB
    
    For AB = 0 To 15
        If LR < 500 Then
            tmrAlienL(AB).Enabled = True
            tmrAlienL(AB).Interval = 200
        Else
            tmrAlienR(AB).Enabled = True
            tmrAlienR(AB).Interval = 200
        End If
    Next AB
    
    A = 0
    AB = 0
    
    '''
    
    For AB = 0 To 7
        
        'Global First Row
        imgAlien(AB).Top = 360
        imgAlien(AB).Enabled = True
        imgAlien(AB).Visible = True
        
        If AB = 0 Then
            imgAlien(AB).Left = 3240
        End If
        If AB = 1 Then
            imgAlien(AB).Left = imgAlien(0).Left + 1080
        End If
        If AB = 2 Then
            imgAlien(AB).Left = imgAlien(1).Left + 1080
        End If
        If AB = 3 Then
            imgAlien(AB).Left = imgAlien(2).Left + 1080
        End If
        If AB = 4 Then
            imgAlien(AB).Left = imgAlien(3).Left + 1080
        End If
        If AB = 5 Then
            imgAlien(AB).Left = imgAlien(4).Left + 1080
        End If
        If AB = 6 Then
            imgAlien(AB).Left = imgAlien(5).Left + 1080
        End If
        If AB = 7 Then
            imgAlien(AB).Left = imgAlien(6).Left + 1080
        End If
    Next AB
    
    For AB = 8 To 15
    
        'Global Second Row
        imgAlien(AB).Top = 860
        imgAlien(AB).Enabled = True
        imgAlien(AB).Visible = True
        
        If AB = 8 Then
            imgAlien(AB).Left = 3240
        End If
        If AB = 9 Then
            imgAlien(AB).Left = imgAlien(8).Left + 1080
        End If
        If AB = 10 Then
            imgAlien(AB).Left = imgAlien(9).Left + 1080
        End If
        If AB = 11 Then
            imgAlien(AB).Left = imgAlien(10).Left + 1080
        End If
        If AB = 12 Then
            imgAlien(AB).Left = imgAlien(11).Left + 1080
        End If
        If AB = 13 Then
            imgAlien(AB).Left = imgAlien(12).Left + 1080
        End If
        If AB = 14 Then
            imgAlien(AB).Left = imgAlien(13).Left + 1080
        End If
        If AB = 15 Then
            imgAlien(AB).Left = imgAlien(14).Left + 1080
        End If
    Next AB
    
    'Reset 'AB' so it doesn't bug out
    AB = 0
    
End Sub

Private Sub mnu3Normal_Click()

    Boost = 50
    mnu3Normal.Checked = True
    mnu3Turbo.Checked = False
    tmrSL.Interval = Boost
    tmrSR.Interval = Boost
    
End Sub

Private Sub mnu3Turbo_Click()

    Boost = 20
    mnu3Normal.Checked = False
    mnu3Turbo.Checked = True
    tmrSL.Interval = Boost
    tmrSR.Interval = Boost
    
End Sub

Private Sub mnu4Lose_Click()
LIV = 0
End Sub

Private Sub mnu4Win_Click()
SIL = 0
End Sub

Private Sub mnu5Pause_Click()

    'Pause Game
    tmrGameOn.Enabled = False
    mnu5Start.Enabled = True
    mnu5Stop.Enabled = True
    mnu5Pause.Enabled = False
    
    mnu5Start.Checked = False
    mnu5Stop.Checked = False
    mnu5Pause.Checked = True
    
End Sub

Private Sub mnu5Start_Click()

    'Start Game
    tmrGameOn.Enabled = True
    mnu5Start.Enabled = False
    mnu5Stop.Enabled = True
    mnu5Pause.Enabled = True
    
    mnu5Start.Checked = True
    mnu5Stop.Checked = False
    mnu5Pause.Checked = False
    
End Sub

Private Sub mnu5Stop_Click()

    'Stop Game
    tmrGameOn.Enabled = False
    mnu5Start.Enabled = True
    mnu5Stop.Enabled = False
    mnu5Pause.Enabled = False
    
    mnu5Start.Checked = False
    mnu5Stop.Checked = True
    mnu5Pause.Checked = False
    
    Call Reset
    
End Sub

Private Sub tmrAIControl_Timer()

    '''Dodging AI'''
    
    'Dodging to the Left
    If imgAlienAmmo(V).Top > imgShip.Top - AIHeightDodgeRange And (imgAlienAmmo(V).Left > imgShip.Left - AISideDodgeRange And imgAlienAmmo(V).Left < imgShip.Left) Then
        tmrSL.Enabled = True
    Else
        tmrSL.Enabled = False
    End If
    
    'Dodging to the Left
    If imgAlienAmmo(V).Top > imgShip.Top - AIHeightDodgeRange And (imgAlienAmmo(V).Left < imgShip.Left + AISideDodgeRange And imgAlienAmmo(V).Left > imgShip.Left) Then
        tmrSR.Enabled = True
    Else
        tmrSR.Enabled = False
    End If
    
End Sub

Private Sub tmrAlienL_Timer(AB As Integer)

If tmrGameOn.Enabled = True Then
''''
    If imgAlien(AB).Left >= 400 Then
        imgAlien(AB).Left = imgAlien(AB).Left - ALBoost
        
    Else
        imgAlien(AB).Top = imgAlien(AB).Top + 1000
        tmrAlienL(AB).Enabled = False
        'turn on right timer
        tmrAlienR(AB).Enabled = True
        
        If tmrAlienR(AB).Interval >= 50 Or tmrAlienL(AB).Interval >= 50 Then
            tmrAlienR(AB).Interval = tmrAlienR(AB).Interval - 20
            tmrAlienL(AB).Interval = tmrAlienR(AB).Interval - 20
        End If
        
    End If
    
    'If the Invaders come to close to the bottom You Lose
    If LIV > 0 Then
        If imgAlien(AB).Top >= imgShip.Top - 200 And (imgAlien(AB).Enabled = True Or imgAlien(AB).Visible = True) Then
                tmrGameOn.Enabled = False
                Msg = MsgBox("You've lost...  Start Over?", 4, "Game Over...")
                Call Reset
                If Msg = vbNo Then
                    Call Reset
                    tmrGameOn.Enabled = False
                    '''
                    mnu5Start.Enabled = True
                    mnu5Stop.Enabled = False
                    mnu5Pause.Enabled = False
                    '''
                    mnu5Start.Checked = False
                    mnu5Stop.Checked = True
                    mnu5Pause.Checked = False
                End If
                If Msg = vbYes Then
                    Call Reset
                    tmrGameOn.Enabled = True
                    '''
                    mnu5Start.Enabled = False
                    mnu5Stop.Enabled = True
                    mnu5Pause.Enabled = True
                    '''
                    mnu5Start.Checked = True
                    mnu5Stop.Checked = False
                    mnu5Pause.Checked = False
                End If
        End If
    End If
''''
End If

End Sub

Private Sub tmrAlienR_Timer(AB As Integer)

If tmrGameOn.Enabled = True Then
''''
    If imgAlien(AB).Left <= frmInvaders.Width - 1200 Then
        imgAlien(AB).Left = imgAlien(AB).Left + ALBoost
        
    Else
        imgAlien(AB).Top = imgAlien(AB).Top + 1000
        tmrAlienL(AB).Enabled = True
        'turn on left timer
        tmrAlienR(AB).Enabled = False
        
        If tmrAlienR(AB).Interval >= 50 Or tmrAlienL(AB).Interval >= 50 Then
            tmrAlienR(AB).Interval = tmrAlienR(AB).Interval - 20
            tmrAlienL(AB).Interval = tmrAlienR(AB).Interval - 20
        End If
        
    End If
    
    'If the Invaders come to close to the bottom You Lose
    If LIV > 0 Then
        If imgAlien(AB).Top >= imgShip.Top - 200 And (imgAlien(AB).Enabled = True Or imgAlien(AB).Visible = True) Then
                tmrGameOn.Enabled = False
                Msg = MsgBox("You've lost...  Start Over?", 4, "Game Over...")
                Call Reset
                If Msg = vbNo Then
                    Call Reset
                    tmrGameOn.Enabled = False
                    '''
                    mnu5Start.Enabled = True
                    mnu5Stop.Enabled = False
                    mnu5Pause.Enabled = False
                    '''
                    mnu5Start.Checked = False
                    mnu5Stop.Checked = True
                    mnu5Pause.Checked = False
                End If
                If Msg = vbYes Then
                    Call Reset
                    tmrGameOn.Enabled = True
                    '''
                    mnu5Start.Enabled = False
                    mnu5Stop.Enabled = True
                    mnu5Pause.Enabled = True
                    '''
                    mnu5Start.Checked = True
                    mnu5Stop.Checked = False
                    mnu5Pause.Checked = False
                End If
        End If
    End If
''''
End If

End Sub

Private Sub Reset()

    'Reset Procedure
    Randomize
    
    VariableShift = 0
    Boost = 50
    SIL = 16
    LIV = 1
    mnu3Normal.Checked = True
    
    A = 0
    AB = 0
    V = 0
    
    imgShip.Top = 8400
    imgShip.Left = 7320
    imgShip.Enabled = True
    imgShip.Visible = True
    
    '''
    
    For A = 0 To 11
        imgAmmo(A).Enabled = False
        imgAmmo(A).Visible = False
        imgAmmo(A).Top = 0
        imgAmmo(A).Left = 0
    Next A
    For AB = 0 To 29
        imgAlienAmmo(AB).Enabled = False
        imgAlienAmmo(AB).Visible = False
        imgAlienAmmo(AB).Top = 0
        imgAlienAmmo(AB).Left = 0
    Next AB
    
    '''
    
    upperbound = 1000
    lowerbound = 0
    
    LR = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
    
    '''
    'reset timers
    For AB = 0 To 15
        tmrAlienL(AB).Enabled = False
        tmrAlienR(AB).Enabled = False
    Next AB
    
    For AB = 0 To 15
        If LR < 500 Then
            tmrAlienL(AB).Enabled = True
            tmrAlienL(AB).Interval = 200
        Else
            tmrAlienR(AB).Enabled = True
            tmrAlienR(AB).Interval = 200
        End If
    Next AB
    
    A = 0
    AB = 0
    
    '''
    
    For AB = 0 To 7
        
        'Global First Row
        imgAlien(AB).Top = 360
        imgAlien(AB).Enabled = True
        imgAlien(AB).Visible = True
        
        If AB = 0 Then
            imgAlien(AB).Left = 3240
        End If
        If AB = 1 Then
            imgAlien(AB).Left = imgAlien(0).Left + 1080
        End If
        If AB = 2 Then
            imgAlien(AB).Left = imgAlien(1).Left + 1080
        End If
        If AB = 3 Then
            imgAlien(AB).Left = imgAlien(2).Left + 1080
        End If
        If AB = 4 Then
            imgAlien(AB).Left = imgAlien(3).Left + 1080
        End If
        If AB = 5 Then
            imgAlien(AB).Left = imgAlien(4).Left + 1080
        End If
        If AB = 6 Then
            imgAlien(AB).Left = imgAlien(5).Left + 1080
        End If
        If AB = 7 Then
            imgAlien(AB).Left = imgAlien(6).Left + 1080
        End If
    Next AB
    
    For AB = 8 To 15
    
        'Global Second Row
        imgAlien(AB).Top = 860
        imgAlien(AB).Enabled = True
        imgAlien(AB).Visible = True
        
        If AB = 8 Then
            imgAlien(AB).Left = 3240
        End If
        If AB = 9 Then
            imgAlien(AB).Left = imgAlien(8).Left + 1080
        End If
        If AB = 10 Then
            imgAlien(AB).Left = imgAlien(9).Left + 1080
        End If
        If AB = 11 Then
            imgAlien(AB).Left = imgAlien(10).Left + 1080
        End If
        If AB = 12 Then
            imgAlien(AB).Left = imgAlien(11).Left + 1080
        End If
        If AB = 13 Then
            imgAlien(AB).Left = imgAlien(12).Left + 1080
        End If
        If AB = 14 Then
            imgAlien(AB).Left = imgAlien(13).Left + 1080
        End If
        If AB = 15 Then
            imgAlien(AB).Left = imgAlien(14).Left + 1080
        End If
    Next AB
    
    'Reset 'AB' so it doesn't bug out
    AB = 0
    
End Sub

Private Sub tmrAmmo_Timer(A As Integer)

If tmrGameOn.Enabled = True Then
''''
    If imgAmmo(A).Top <= -100 Then
        tmrAmmo(A).Enabled = False
        imgAmmo(A).Enabled = False
        imgAmmo(A).Visible = False
    Else
        imgAmmo(A).Top = imgAmmo(A).Top - 100
    End If
    
    ''''Checking Each Ship For A Hit''''
    
    V = 0
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 1
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 2
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 3
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 4
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 5
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 6
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 7
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 8
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 9
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 10
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 11
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 12
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 13
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 14
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
    
    V = 15
    'Check for a hit
    If imgAmmo(A).Left >= imgAlien(V).Left And (imgAlien(V).Enabled = True Or imgAlien(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgAlien(V).Left + imgAlien(V).Width Then
            If imgAmmo(A).Top >= imgAlien(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgAlien(V).Top + imgAlien(V).Height Then
                    imgAlien(V).Visible = False
                    imgAlien(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                    SIL = SIL - 1
                    'HitCount
                    HitCount = HitCount + 1
                    lblHitCount.Caption = "Hit: " & HitCount
                End If
            End If
        End If
    End If
''''
End If

End Sub

Private Sub tmrAShoot_Timer(AB As Integer)

If tmrGameOn.Enabled = True Then
''''
    If imgAlienAmmo(AB).Top >= frmInvaders.Height - 1100 Then
        tmrAShoot(AB).Enabled = False
        imgAlienAmmo(AB).Enabled = False
        imgAlienAmmo(AB).Visible = False
        imgAlienAmmo(AB).Top = 0
        imgAlienAmmo(AB).Left = 0
    Else
        imgAlienAmmo(AB).Top = imgAlienAmmo(AB).Top + 300
    End If
    
    CountF2 = CountF2 + 1
    
    If CountF2 Mod 4 = 1 Then
        imgAlienAmmo(AB).Picture = LoadPicture(App.Path & "\Invader Images\Flash.ico")
    End If
    
    If CountF2 Mod 4 = 2 Then
        imgAlienAmmo(AB).Picture = LoadPicture(App.Path & "\Invader Images\GreenAmmo.gif")
    End If
    
    If CountF2 Mod 4 = 3 Then
        imgAlienAmmo(AB).Picture = LoadPicture(App.Path & "\Invader Images\RedAmmo.gif")
    End If
    
    If CountF2 Mod 4 = 0 Then
        imgAlienAmmo(AB).Picture = LoadPicture(App.Path & "\Invader Images\RedAmmo.gif")
    End If
    
        If CountF2 >= 4 Then
            CountF2 = 0
        End If
        
    '''Hit Detection for AAmmo
    'Check for a hit
    If imgAlienAmmo(AB).Left >= imgShip.Left And (imgShip.Enabled = True Or imgShip.Visible = True) Then
        If imgAlienAmmo(AB).Left + imgAlienAmmo(AB).Width <= imgShip.Left + imgShip.Width Then
            If imgAlienAmmo(AB).Top >= imgShip.Top Then
                If imgAlienAmmo(AB).Top + imgAlienAmmo(AB).Height <= imgShip.Top + imgShip.Height Then
                    imgShip.Visible = False
                    imgShip.Enabled = False
                    tmrAShoot(AB).Enabled = False
                    imgAlienAmmo(AB).Enabled = False
                    imgAlienAmmo(AB).Visible = False
                    imgAlienAmmo(AB).Top = 0
                    imgAlienAmmo(AB).Left = 0
                    'removes one life from ship
                    LIV = LIV - 1
                End If
            End If
        End If
    End If
''''
End If

End Sub

Private Sub tmrAShootTimer_Timer()

If tmrGameOn.Enabled = True Then
''''
    Randomize
    
    C = C + 1
    If C >= 30 Then
        C = 0
    End If
    
    C = VariableShift
    
    If SIL > 0 And LIV > 0 Then
        If imgAlienAmmo(C).Enabled = False Then
            If (imgAlien(AB).Enabled = True Or imgAlien(AB).Visible = True) Then
                imgAlienAmmo(C).Enabled = True
                imgAlienAmmo(C).Visible = True
                '//align ammo to Alien Ship
                imgAlienAmmo(C).Left = imgAlien(AB).Left + imgAlien(AB).Width - (imgAlien(AB).Width / 2) - 90
                imgAlienAmmo(C).Top = imgAlien(AB).Top + 200
                tmrAShoot(C).Enabled = True
            End If
            
                    AB = AB + 1
                    If AB >= SIL Then
                        AB = 0
                    End If
        End If
    End If
        
    upperbound = 24
    lowerbound = 0
    
    VariableShift = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
    
    upperbound = 16
    lowerbound = 0
    
    AB = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
    
    upperbound = 250
    lowerbound = 1
    
    randomvalue = CInt(Int((upperbound - lowerbound + 0) * Rnd() + lowerbound))
    
        tmrAShootTimer.Interval = randomvalue
''''
End If

End Sub

Private Sub tmrGameChecker_Timer()

If tmrGameOn.Enabled = True Then
''''
    'If every invader is gone then You Win
        If SIL <= 0 Then
            tmrGameOn.Enabled = False
            Msg = MsgBox("You've won!  Play Again?", 4, "You Win!!!")
            Call Reset
            If Msg = vbNo Then
                Call Reset
                tmrGameOn.Enabled = False
                '''
                mnu5Start.Enabled = True
                mnu5Stop.Enabled = False
                mnu5Pause.Enabled = False
                '''
                mnu5Start.Checked = False
                mnu5Stop.Checked = True
                mnu5Pause.Checked = False
            End If
            If Msg = vbYes Then
                Call Reset
                tmrGameOn.Enabled = True
                '''
                mnu5Start.Enabled = False
                mnu5Stop.Enabled = True
                mnu5Pause.Enabled = True
                '''
                mnu5Start.Checked = True
                mnu5Stop.Checked = False
                mnu5Pause.Checked = False
            End If
        End If
    
    'If you lose all your lives then You Lose
        If LIV <= 0 Then
            tmrGameOn.Enabled = False
            Msg = MsgBox("You've lost...  Try Again?", 4, "You Lost...")
            Call Reset
            If Msg = vbNo Then
                Call Reset
                tmrGameOn.Enabled = False
                '''
                mnu5Start.Enabled = True
                mnu5Stop.Enabled = False
                mnu5Pause.Enabled = False
                '''
                mnu5Start.Checked = False
                mnu5Stop.Checked = True
                mnu5Pause.Checked = False
            End If
            If Msg = vbYes Then
                Call Reset
                tmrGameOn.Enabled = True
                '''
                mnu5Start.Enabled = False
                mnu5Stop.Enabled = True
                mnu5Pause.Enabled = True
                '''
                mnu5Start.Checked = True
                mnu5Stop.Checked = False
                mnu5Pause.Checked = False
            End If
        End If
''''
End If

End Sub

Private Sub tmrGameOn_Timer()

    'Game Checker
    
End Sub

Private Sub tmrSL_Timer()

If tmrGameOn.Enabled = True Then
''''
    If SIL > 0 And LIV > 0 Then
        If imgShip.Left >= 100 Then
            imgShip.Left = imgShip.Left - 100
        End If
    End If
''''
End If

End Sub

Private Sub tmrSR_Timer()

If tmrGameOn.Enabled = True Then
''''
    If SIL > 0 And LIV > 0 Then
        If imgShip.Left <= frmInvaders.ScaleWidth - 800 Then
            imgShip.Left = imgShip.Left + 100
        End If
    End If
''''
End If

End Sub
