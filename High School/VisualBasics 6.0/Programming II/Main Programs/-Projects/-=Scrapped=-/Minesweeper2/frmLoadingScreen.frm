VERSION 5.00
Begin VB.Form frmLoadingScreen 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Loading Screen"
   ClientHeight    =   6750
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   10800
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MousePointer    =   11  'Hourglass
   ScaleHeight     =   6750
   ScaleWidth      =   10800
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   3600
      Top             =   5280
   End
   Begin VB.Timer tmrSet2StartGame 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1440
      Top             =   6000
   End
   Begin VB.Timer tmrSet1Init 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   960
      Top             =   6000
   End
   Begin VB.Timer tmrLoading 
      Interval        =   1000
      Left            =   240
      Top             =   960
   End
   Begin VB.Label lbl 
      Alignment       =   2  'Center
      Caption         =   "12345ABCDE"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   960
      TabIndex        =   1
      Top             =   3720
      Width           =   8775
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblLoading 
      Alignment       =   2  'Center
      Caption         =   "Loading..."
      BeginProperty Font 
         Name            =   "Segoe Marker"
         Size            =   72
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   1080
      MousePointer    =   11  'Hourglass
      TabIndex        =   0
      Top             =   840
      Width           =   8655
   End
End
Attribute VB_Name = "frmLoadingScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim NCount As Integer
Dim LCount As Integer
Dim t As Integer

Private Sub Form_Load()

    XMaze = XTemp
    YMaze = YTemp
    Bomb = BTemp
    
    lbl.Caption = "Loading Images"
    tmrLoading.Enabled = True
    tmrSet1Init.Enabled = True
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub tmrLoading_Timer()

    If NCount Mod 3 = 0 Then
    lblLoading.Caption = "Loading..."
    End If
    
    If NCount Mod 3 = 1 Then
    lblLoading.Caption = "Loading.."
    End If
    
    If NCount Mod 3 = 2 Then
    lblLoading.Caption = "Loading."
    End If
    
    If NCount >= 3 Then NCount = 0
    NCount = NCount + 1
    
End Sub

Private Sub tmrSet1Init_Timer()

    If LCount = 0 Then LCount = 1
    
    'Step 1: Load Images
    If LCount = 1 Then
        'Next Lbl
        lbl.Caption = "Loading Images"
        'Load Pictures/Images
        For t = 0 To 200
            frmMinesweeper.imgCell(t).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
        Next t
        LCount = 2
        
    End If
    
    'Step 2: Put Images In Order
    If LCount = 2 Then
        'Next Lbl
        lbl.Caption = "Setting Images"
        'Set Images
        
        LCount = 3
        
    End If
    
    'Step 3: Place Mines
    If LCount = 3 Then
        'Next Lbl
        lbl.Caption = "Placing Mines"
        'Place Mines
        
        LCount = 4
        
    End If
    
    'Step 4: Start Game
    If LCount = 4 Then
        'Next Lbl
        tmrLoading.Enabled = False
        lblLoading.Caption = "Good Luck"
        lbl.Caption = "Done"
        'Start Game
        tmrSet1Init.Enabled = False
        tmrSet2StartGame.Enabled = True
        
        LCount = 0
        
    End If
    
End Sub

Private Sub tmrSet2StartGame_Timer()
    
    frmLoadingScreen.Hide
    frmMinesweeper.Visible = True
    
End Sub
