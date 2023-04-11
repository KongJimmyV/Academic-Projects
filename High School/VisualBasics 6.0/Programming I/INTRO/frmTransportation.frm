VERSION 5.00
Begin VB.Form frmTransportation 
   BackColor       =   &H00E0E0E0&
   Caption         =   "Modes of Transportation"
   ClientHeight    =   5415
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10215
   LinkTopic       =   "Form1"
   ScaleHeight     =   5415
   ScaleWidth      =   10215
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrEnd 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   8760
      Top             =   120
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9240
      TabIndex        =   3
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton cmdCar 
      Caption         =   "Hybrid Car"
      Height          =   735
      Left            =   3840
      TabIndex        =   2
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton cmdAirplane 
      Caption         =   "Cargo Airplane"
      Height          =   735
      Left            =   2040
      TabIndex        =   1
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton cmdTrain 
      Caption         =   "Speed Train"
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1455
   End
   Begin VB.Image imgTransportations 
      BorderStyle     =   1  'Fixed Single
      Height          =   4215
      Left            =   120
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   5055
   End
End
Attribute VB_Name = "frmTransportation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAirplane_Click()

    imgTransportations.Picture = LoadPicture("H:\Programming I\PICS\PICTRANS airplane[1].jpg")

End Sub

Private Sub cmdCar_Click()

    imgTransportations.Picture = LoadPicture("H:\Programming I\PICS\PICTRANS 2007-hybrid-car-pictures-3.jpg")

End Sub

Private Sub cmdEnd_Click()

    MsgBox ("Good bye... see you again soon!!!")
    
    tmrEnd.Enabled = True
    
End Sub

Private Sub cmdTrain_Click()

    imgTransportations.Picture = LoadPicture("H:\Programming I\PICS\PICTRANS speeding-train-lg.jpg")
    
End Sub

Private Sub tmrEnd_Timer()

    imgTransportations.Width = imgTransportations.Width * 0.9
    imgTransportations.Height = imgTransportations.Height * 0.9
    
    If imgTransportations.Width < 20 Then
        tmrEnd.Enabled = False
        End
    End If
    
    
End Sub
