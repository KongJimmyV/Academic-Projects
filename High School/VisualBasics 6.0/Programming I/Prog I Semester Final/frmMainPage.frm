VERSION 5.00
Begin VB.Form frmMainPage 
   Caption         =   "Main Page"
   ClientHeight    =   6270
   ClientLeft      =   120
   ClientTop       =   750
   ClientWidth     =   9255
   ForeColor       =   &H00000000&
   LinkTopic       =   "Form1"
   ScaleHeight     =   6270
   ScaleWidth      =   9255
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdIcon 
      Caption         =   "Icon Mover"
      Height          =   1095
      Left            =   5880
      TabIndex        =   2
      Top             =   4560
      Width           =   1695
   End
   Begin VB.CommandButton cmdCBFlag 
      Caption         =   "Congo-Brazzaville Flag"
      Height          =   1095
      Left            =   3840
      TabIndex        =   1
      Top             =   4560
      Width           =   1695
   End
   Begin VB.CommandButton cmdFavPaintings 
      Caption         =   "Favorite Paintings"
      Height          =   1095
      Left            =   1800
      TabIndex        =   0
      Top             =   4560
      Width           =   1695
   End
   Begin VB.Label lblFInal 
      Alignment       =   2  'Center
      Caption         =   "Final Project Program"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   33.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1935
      Left            =   600
      TabIndex        =   3
      Top             =   840
      Width           =   8055
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuEnd 
         Caption         =   "End"
      End
   End
End
Attribute VB_Name = "frmMainPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCBFlag_Click()

    frmMainPage.Hide
    frmCBFlag.Show
    
End Sub

Private Sub cmdCD_Click()

    frmMainPage.Hide
    frmCDAccount.Show
    
End Sub

Private Sub cmdFavPaintings_Click()

    frmMainPage.Hide
    frmFavPaintings.Show
    
End Sub

Private Sub cmdIcon_Click()

    frmMainPage.Hide
    frmIconMover.Show
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End
    
End Sub

Private Sub mnuEnd_Click()

    End
    
End Sub
