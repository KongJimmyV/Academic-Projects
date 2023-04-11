VERSION 5.00
Begin VB.Form frmFavPaintings 
   Caption         =   "Favorite Paintings"
   ClientHeight    =   11535
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   22815
   LinkTopic       =   "Form2"
   ScaleHeight     =   11535
   ScaleWidth      =   22815
   StartUpPosition =   3  'Windows Default
   Begin VB.Image img6 
      Height          =   5295
      Left            =   15720
      Picture         =   "frmFavPaintings.frx":0000
      Stretch         =   -1  'True
      ToolTipText     =   "Vincent van Gogh, Vase with Fifteen Sunflowers, 1888-1889"
      Top             =   5640
      Width           =   7095
   End
   Begin VB.Image img5 
      Height          =   5295
      Left            =   7920
      Picture         =   "frmFavPaintings.frx":2731C
      Stretch         =   -1  'True
      ToolTipText     =   "Vincent van Gogh, Starry Night Over the Rhone, 1889"
      Top             =   5640
      Width           =   7815
   End
   Begin VB.Image img4 
      Height          =   5295
      Left            =   0
      Picture         =   "frmFavPaintings.frx":3C81B
      Stretch         =   -1  'True
      ToolTipText     =   "Vincent van Gogh, Starry Night, 1889"
      Top             =   5640
      Width           =   7935
   End
   Begin VB.Image img3 
      Height          =   5655
      Left            =   13800
      Picture         =   "frmFavPaintings.frx":56D38
      Stretch         =   -1  'True
      ToolTipText     =   "Vincent van Gogh, The Potatoe Eaters, 1883"
      Top             =   0
      Width           =   9015
   End
   Begin VB.Image img2 
      Height          =   5655
      Left            =   5880
      Picture         =   "frmFavPaintings.frx":6094F
      Stretch         =   -1  'True
      ToolTipText     =   "Vincent van Gogh, Four Cut Sunflowers, 1888-1889"
      Top             =   0
      Width           =   8055
   End
   Begin VB.Image img1 
      Height          =   5685
      Left            =   0
      Picture         =   "frmFavPaintings.frx":78136
      Stretch         =   -1  'True
      ToolTipText     =   "Vincent van Gogh, Cafe Terrace At Night, 1888"
      Top             =   0
      Width           =   5850
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuBack 
         Caption         =   "Go Back"
      End
      Begin VB.Menu mnuEnd 
         Caption         =   "End"
      End
   End
End
Attribute VB_Name = "frmFavPaintings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub

Private Sub mnuBack_Click()

    frmFavPaintings.Hide
    frmMainPage.Show
    
End Sub

Private Sub mnuEnd_Click()

    End
    
End Sub
