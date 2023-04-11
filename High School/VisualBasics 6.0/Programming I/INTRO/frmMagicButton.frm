VERSION 5.00
Begin VB.Form frmMagicButton 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "THE MAGIC BUTTON WOW"
   ClientHeight    =   6030
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   9915
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6030
   ScaleWidth      =   9915
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdFreeMoney 
      Caption         =   "Click Here For Some Free Money :)"
      Height          =   735
      Left            =   4080
      TabIndex        =   0
      Top             =   2400
      Width           =   1575
   End
End
Attribute VB_Name = "frmMagicButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdFreeMoney_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    cmdFreeMoney.Left = Rnd * frmMagicButton.Width
    cmdFreeMoney.Top = Rnd * frmMagicButton.Height
    
End Sub
