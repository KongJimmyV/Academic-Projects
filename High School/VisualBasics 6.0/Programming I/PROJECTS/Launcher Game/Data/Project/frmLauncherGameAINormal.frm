VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form frmLauncherGameAINormal 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Launcher Game"
   ClientHeight    =   9495
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   13605
   Enabled         =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   Picture         =   "frmLauncherGameAINormal.frx":0000
   ScaleHeight     =   9495
   ScaleWidth      =   13605
   StartUpPosition =   1  'CenterOwner
   Visible         =   0   'False
   Begin VB.Timer tmrRemoveCount 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   7560
      Top             =   3480
   End
   Begin VB.Timer tmrGO 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   7200
      Top             =   3480
   End
   Begin VB.Timer tmr1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   6840
      Top             =   3480
   End
   Begin VB.Timer tmr2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   6480
      Top             =   3480
   End
   Begin VB.Timer tmr3 
      Interval        =   1000
      Left            =   6120
      Top             =   3480
   End
   Begin VB.Timer tmrAIMovementTimedL 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   4680
      Top             =   3600
   End
   Begin VB.Timer tmrAIMovementTimedR 
      Interval        =   1000
      Left            =   5040
      Top             =   3600
   End
   Begin VB.Timer tmrAI 
      Interval        =   12
      Left            =   4320
      Top             =   3600
   End
   Begin VB.Timer tmrLauncher2Death 
      Enabled         =   0   'False
      Interval        =   51
      Left            =   9720
      Top             =   4680
   End
   Begin VB.Timer tmrLauncher1Death 
      Enabled         =   0   'False
      Interval        =   51
      Left            =   2760
      Top             =   4440
   End
   Begin VB.Timer tmrDraw 
      Enabled         =   0   'False
      Interval        =   4100
      Left            =   6600
      Top             =   4440
   End
   Begin VB.Timer tmrWinner2 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   7080
      Top             =   4440
   End
   Begin VB.Timer tmrWinner1 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   6120
      Top             =   4440
   End
   Begin VB.Timer tmrPlayer1R 
      Enabled         =   0   'False
      Interval        =   12
      Left            =   8880
      Top             =   1320
   End
   Begin VB.Timer tmrAmmoPlayer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   6600
      Top             =   1560
   End
   Begin VB.Timer tmrPlayer1L 
      Enabled         =   0   'False
      Interval        =   12
      Left            =   4080
      Top             =   1320
   End
   Begin VB.Timer tmrAmmoPlayer2 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   6480
      Top             =   7320
   End
   Begin VB.Timer tmrPlayer2R 
      Enabled         =   0   'False
      Interval        =   12
      Left            =   8880
      Top             =   7800
   End
   Begin VB.Timer tmrPlayer2L 
      Enabled         =   0   'False
      Interval        =   12
      Left            =   3960
      Top             =   7800
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpLaser2 
      Height          =   735
      Left            =   0
      TabIndex        =   3
      Top             =   7320
      Visible         =   0   'False
      Width           =   3255
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   5741
      _cy             =   1296
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpLaser1 
      Height          =   735
      Left            =   0
      TabIndex        =   2
      Top             =   8040
      Visible         =   0   'False
      Width           =   3255
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   5741
      _cy             =   1296
   End
   Begin WMPLibCtl.WindowsMediaPlayer wmpExplosion 
      Height          =   735
      Left            =   0
      TabIndex        =   1
      Top             =   8760
      Visible         =   0   'False
      Width           =   3255
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   5741
      _cy             =   1296
   End
   Begin VB.Image imgLauncher1Death 
      Height          =   1455
      Left            =   2520
      Picture         =   "frmLauncherGameAINormal.frx":138FEC
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Image imgLauncher2Death 
      Height          =   1440
      Left            =   10080
      Picture         =   "frmLauncherGameAINormal.frx":141B50
      Stretch         =   -1  'True
      Top             =   3000
      Width           =   1170
   End
   Begin VB.Image imgLauncher1 
      Height          =   615
      Left            =   5000
      Picture         =   "frmLauncherGameAINormal.frx":14A6B4
      Stretch         =   -1  'True
      Top             =   360
      Width           =   615
   End
   Begin VB.Image imgLauncher2 
      Height          =   615
      Left            =   8000
      Picture         =   "frmLauncherGameAINormal.frx":14B896
      Stretch         =   -1  'True
      Top             =   8520
      Width           =   615
   End
   Begin VB.Image imgAmmoPlayer2 
      Height          =   495
      Left            =   8040
      Picture         =   "frmLauncherGameAINormal.frx":14C038
      Stretch         =   -1  'True
      Top             =   8040
      Width           =   495
   End
   Begin VB.Image imgAmmoPlayer1 
      Height          =   495
      Left            =   5040
      Picture         =   "frmLauncherGameAINormal.frx":14C7DA
      Stretch         =   -1  'True
      Top             =   960
      Width           =   495
   End
   Begin VB.Label lblCountdown 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "Mufferaw"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   6000
      TabIndex        =   0
      Top             =   3960
      Width           =   1575
   End
End
Attribute VB_Name = "frmLauncherGameAINormal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim PlayerOneLife As Single
Dim PlayerTwoLife As Single
Dim AmmoAmmount As Single
Dim randomvalue As Single
Dim upperbound As Single
Dim lowerbound As Single

Private Sub Form_Activate()

    imgAmmoPlayer1.Left = 0
    imgAmmoPlayer1.Top = 0
    imgAmmoPlayer1.Enabled = False
    imgAmmoPlayer1.Visible = False
    imgLauncher1Death.Left = 0
    imgLauncher1Death.Top = 0
    imgLauncher1Death.Enabled = False
    imgLauncher1Death.Visible = False
    imgLauncher1.Enabled = True
    imgLauncher1.Visible = True
    imgLauncher1.Left = 5000
    imgLauncher1.Top = 360

    imgAmmoPlayer2.Left = 0
    imgAmmoPlayer2.Top = 0
    imgAmmoPlayer2.Enabled = False
    imgAmmoPlayer2.Visible = False
    imgLauncher2Death.Left = 0
    imgLauncher2Death.Top = 0
    imgLauncher2Death.Enabled = False
    imgLauncher2Death.Visible = False
    imgLauncher2.Enabled = True
    imgLauncher2.Visible = True
    imgLauncher2.Left = 8000
    imgLauncher2.Top = 8520
    
    '//Start Countdown to battle!!!
    
    lblCountdown.Visible = True
    lblCountdown.Caption = "3"
    lblCountdown.ForeColor = vbRed
    tmr3.Enabled = True

End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

If tmrGO.Enabled = True Then
    If KeyCode = vbKeyRight And imgLauncher1.Enabled = True Then
        tmrPlayer1R.Enabled = True
        End If

    If KeyCode = vbKeyLeft And imgLauncher1.Enabled = True Then
        tmrPlayer1L.Enabled = True
        End If

    If KeyCode = vbKeyUp And tmrAmmoPlayer1.Enabled = False And imgLauncher1.Enabled = True Then
        If wmpLaser1.settings.mute = True Then
            wmpLaser1.settings.mute = False
        End If
        imgAmmoPlayer1.Enabled = True
        imgAmmoPlayer1.Visible = True
        imgAmmoPlayer1.Left = imgLauncher1.Left + 50
        imgAmmoPlayer1.Top = imgLauncher1.Top + 200
        tmrAmmoPlayer1.Enabled = True
        wmpLaser1.Controls.stop
        wmpLaser1.Controls.play
        End If

    If KeyCode = vbKeyD And imgLauncher2.Enabled = True And tmrAI.Enabled = False Then
        tmrPlayer2R.Enabled = True
        End If

    If KeyCode = vbKeyA And imgLauncher2.Enabled = True And tmrAI.Enabled = False Then
        tmrPlayer2L.Enabled = True
        End If

    If KeyCode = vbKeyW And tmrAmmoPlayer2.Enabled = False And imgLauncher2.Enabled = True And tmrAI.Enabled = False Then
        If wmpLaser2.settings.mute = True Then
            wmpLaser2.settings.mute = False
        End If
        imgAmmoPlayer2.Enabled = True
        imgAmmoPlayer2.Visible = True
        imgAmmoPlayer2.Left = imgLauncher2.Left + 50
        imgAmmoPlayer2.Top = imgLauncher2.Top - 200
        tmrAmmoPlayer2.Enabled = True
        wmpLaser2.Controls.stop
        wmpLaser2.Controls.play
        End If
End If

End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

If tmrGO.Enabled = True Then
    If KeyCode = vbKeyRight Then
        tmrPlayer1R.Enabled = False
        End If

    If KeyCode = vbKeyLeft Then
        tmrPlayer1L.Enabled = False
        End If

    If KeyCode = vbKeyD And tmrAI.Enabled = False Then
        tmrPlayer2R.Enabled = False
        End If

    If KeyCode = vbKeyA And tmrAI.Enabled = False Then
        tmrPlayer2L.Enabled = False
        End If
End If

End Sub

Private Sub Form_Load()

    wmpExplosion.settings.mute = True
    wmpLaser1.settings.mute = True
    wmpLaser2.settings.mute = True

    imgAmmoPlayer1.Left = 0
    imgAmmoPlayer1.Top = 0
    imgAmmoPlayer1.Enabled = False
    imgAmmoPlayer1.Visible = False
    imgLauncher1Death.Left = 0
    imgLauncher1Death.Top = 0
    imgLauncher1Death.Enabled = False
    imgLauncher1Death.Visible = False
    imgLauncher1.Enabled = True
    imgLauncher1.Visible = True
    imgLauncher1.Left = 5000
    imgLauncher1.Top = 360

    imgAmmoPlayer2.Left = 0
    imgAmmoPlayer2.Top = 0
    imgAmmoPlayer2.Enabled = False
    imgAmmoPlayer2.Visible = False
    imgLauncher2Death.Left = 0
    imgLauncher2Death.Top = 0
    imgLauncher2Death.Enabled = False
    imgLauncher2Death.Visible = False
    imgLauncher2.Enabled = True
    imgLauncher2.Visible = True
    imgLauncher2.Left = 8000
    imgLauncher2.Top = 8520


    'Dim file4() As Byte
    'file4 = LoadResData("102EXP", "CUSTOM")
    'Open "C:\" & "\Explosion - Fast Crackling Blast with Stereo Kick Back Explosion.mp3" For Binary As #4
    'Put #4, , file2
    'Close #4

    wmpExplosion.URL = "C:\" & "\Explosion - Fast Crackling Blast with Stereo Kick Back Explosion.mp3"
    wmpExplosion.settings.volume = 100
    
    'Dim file5() As Byte
    'file5 = LoadResData("103LAS", "CUSTOM")
    'Open "C:\" & "\Laser - Quick Noise 2.mp3" For Binary As #5
    'Put #5, , file3
    'Close #5

    wmpLaser1.URL = "C:\" & "\Laser - Quick Noise 2.mp3"
    wmpLaser1.settings.volume = 80
    
    wmpLaser2.URL = "C:\" & "\Laser - Quick Noise 2.mp3"
    wmpLaser2.settings.volume = 80
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

    End

End Sub

Private Sub tmr1_Timer()

    tmrGO.Enabled = True
    tmr1.Enabled = False
    lblCountdown.Caption = "GO!!!"
    lblCountdown.ForeColor = vbGreen
    
End Sub

Private Sub tmr2_Timer()

    tmr1.Enabled = True
    tmr2.Enabled = False
    lblCountdown.Caption = "1"
    lblCountdown.ForeColor = vbGreen
    
End Sub

Private Sub tmr3_Timer()

    tmr2.Enabled = True
    tmr3.Enabled = False
    lblCountdown.Caption = "2"
    lblCountdown.ForeColor = vbYellow
    
End Sub

Private Sub tmrAI_Timer()

    upperbound = 1000
    lowerbound = 1
    randomvalue = CInt(Int((upperbound - lowerbound + 800) * Rnd() + lowerbound))
    
If tmrGO.Enabled = True Then
    If imgLauncher2.Left > 13100 And imgLauncher1.Enabled = True And imgLauncher2.Enabled = True Then
        imgLauncher2.Left = -100
    End If
    
    If imgLauncher2.Left < -100 And imgLauncher1.Enabled = True And imgLauncher2.Enabled = True Then
        imgLauncher2.Left = 13100
    End If
    
    If ((imgAmmoPlayer1.Top > imgLauncher2.Top - 1100) And (imgAmmoPlayer1.Top < imgLauncher2.Top + 1100) And (imgAmmoPlayer1.Left > imgLauncher2.Left - 0) And (imgAmmoPlayer1.Left < imgLauncher2.Left + 2200)) And (imgLauncher2.Enabled = True) Then
        imgLauncher2.Left = imgLauncher2.Left - 100
    End If
    
    If ((imgAmmoPlayer1.Top > imgLauncher2.Top - 1100) And (imgAmmoPlayer1.Top < imgLauncher2.Top + 1100) And (imgAmmoPlayer1.Left > imgLauncher2.Left - 2200) And (imgAmmoPlayer1.Left < imgLauncher2.Left + 0)) And (imgLauncher2.Enabled = True) Then
        imgLauncher2.Left = imgLauncher2.Left + 100
    End If
    
    If imgLauncher1.Enabled = True And imgLauncher2.Enabled = True And tmrAmmoPlayer2.Enabled = False And imgLauncher2.Enabled = True Then
        If ((imgLauncher1.Left >= imgLauncher2.Left) And (imgLauncher1.Left <= imgLauncher2.Left + randomvalue)) Or ((imgLauncher1.Left <= imgLauncher2.Left) And (imgLauncher1.Left >= imgLauncher2.Left - randomvalue)) Then
            If wmpLaser2.settings.mute = True Then
                wmpLaser2.settings.mute = False
            End If
            imgAmmoPlayer2.Enabled = True
            imgAmmoPlayer2.Visible = True
            imgAmmoPlayer2.Left = imgLauncher2.Left + 50
            imgAmmoPlayer2.Top = imgLauncher2.Top + 200
            tmrAmmoPlayer2.Enabled = True
            wmpLaser2.Controls.stop
            wmpLaser2.Controls.play
        End If
    End If
    
    If imgLauncher2.Left < -100 And tmrAIMovementTimedR.Enabled = True And tmrAI.Enabled = True And imgLauncher2.Enabled = True Then
        imgLauncher2.Left = 13100
        Else
        If ((tmrAIMovementTimedR.Enabled = True And (imgAmmoPlayer1.Enabled = False Or (imgAmmoPlayer1.Top < imgLauncher2.Top - 1100) And (imgAmmoPlayer1.Left >= imgLauncher2.Left - 2200 Or imgAmmoPlayer1.Left <= imgLauncher2.Left + 2200)))) And imgLauncher1.Enabled = True And imgLauncher2.Enabled = True Then
            imgLauncher2.Left = imgLauncher2.Left - 100
            Else
        End If
    End If
  
    
    If imgLauncher2.Left > 13100 And tmrAIMovementTimedL.Enabled = True And tmrAI.Enabled = True And imgLauncher2.Enabled = True Then
        imgLauncher2.Left = -100
        Else
        If ((tmrAIMovementTimedL.Enabled = True And (imgAmmoPlayer1.Enabled = False Or (imgAmmoPlayer1.Top < imgLauncher2.Top - 2600) And (imgAmmoPlayer1.Left <= imgLauncher2.Left + 2200 Or imgAmmoPlayer1.Left >= imgLauncher2.Left - 2200)))) And imgLauncher1.Enabled = True And imgLauncher2.Enabled = True Then
            imgLauncher2.Left = imgLauncher2.Left + 100
            Else
        End If
    End If
End If

End Sub

Private Sub tmrAIMovementTimedL_Timer()

    randomvalue = CInt(Int((upperbound - lowerbound + 2000) * Rnd() + lowerbound))
    tmrAIMovementTimedL.Interval = randomvalue
    tmrAIMovementTimedR.Enabled = True
    tmrAIMovementTimedL.Enabled = False
    
End Sub

Private Sub tmrAIMovementTimedR_Timer()

    randomvalue = CInt(Int((upperbound - lowerbound + 1000) * Rnd() + lowerbound))
    tmrAIMovementTimedR.Interval = randomvalue
    tmrAIMovementTimedL.Enabled = True
    tmrAIMovementTimedR.Enabled = False
    
End Sub

Private Sub tmrAmmoPlayer1_Timer()

    imgAmmoPlayer1.Top = imgAmmoPlayer1.Top + 150 * 2

    If ((imgAmmoPlayer1.Top > imgLauncher2.Top - 400) And (imgAmmoPlayer1.Top < imgLauncher2.Top + 400) And (imgAmmoPlayer1.Left > imgLauncher2.Left - 400) And (imgAmmoPlayer1.Left < imgLauncher2.Left + 400)) Then
        If wmpExplosion.settings.mute = True Then
            wmpExplosion.settings.mute = False
        End If
        imgLauncher2.Enabled = False
        imgLauncher2.Visible = False
        tmrLauncher2Death.Enabled = True
        If imgLauncher2.Enabled = False Then
            wmpExplosion.Controls.stop
            wmpExplosion.Controls.play
        End If
        tmrWinner1.Enabled = True
        tmrDraw.Enabled = True
    End If

    If imgAmmoPlayer1.Top >= 9000 Then
        imgAmmoPlayer1.Visible = False
        imgAmmoPlayer1.Enabled = False
        tmrAmmoPlayer1.Enabled = False
        imgAmmoPlayer1.Left = 0
        imgAmmoPlayer1.Top = 0
    End If

End Sub

Private Sub tmrAmmoPlayer2_Timer()

    imgAmmoPlayer2.Top = imgAmmoPlayer2.Top - 150 * 2

    If ((imgAmmoPlayer2.Top > imgLauncher1.Top - 400) And (imgAmmoPlayer2.Top < imgLauncher1.Top + 400) And (imgAmmoPlayer2.Left > imgLauncher1.Left - 400) And (imgAmmoPlayer2.Left < imgLauncher1.Left + 400)) Then
        If wmpExplosion.settings.mute = True Then
            wmpExplosion.settings.mute = False
        End If
        imgLauncher1.Enabled = False
        imgLauncher1.Visible = False
        tmrLauncher1Death.Enabled = True
        If imgLauncher1.Enabled = False Then
            wmpExplosion.Controls.stop
            wmpExplosion.Controls.play
        End If
        tmrWinner2.Enabled = True
        tmrDraw.Enabled = True
    End If

    If imgAmmoPlayer2.Top <= -100 Then
        imgAmmoPlayer2.Visible = False
        imgAmmoPlayer2.Enabled = False
        tmrAmmoPlayer2.Enabled = False
        imgAmmoPlayer2.Left = 0
        imgAmmoPlayer2.Top = 0
    End If
    
End Sub

Private Sub tmrDraw_Timer()

    If (imgLauncher1.Enabled = False And imgLauncher2.Enabled = False) And (imgAmmoPlayer1.Enabled = False And imgAmmoPlayer2.Enabled = False) And (frmLauncherGameAINormal.Enabled = True) Then
        MsgBox ("DRAW!!!")
        tmrDraw.Enabled = False
        frmLauncherGameAINormal.Visible = False
        frmLauncherGameAINormal.Enabled = False
        frmMainMenu.Visible = True
        tmrGO.Enabled = False
        tmrPlayer1L.Enabled = False
        tmrPlayer1R.Enabled = False
        tmrPlayer2L.Enabled = False
        tmrPlayer1R.Enabled = False
        Else
        tmrDraw.Enabled = False
        End If

End Sub

Private Sub tmrGO_Timer()

    tmrRemoveCount.Enabled = True
    
End Sub

Private Sub tmrLauncher1Death_Timer()

    If imgLauncher1.Enabled = False Then
        imgLauncher1Death.Enabled = True
        imgLauncher1Death.Visible = True
        imgLauncher1Death.Top = imgLauncher1.Top - 200
        imgLauncher1Death.Left = imgLauncher1.Left - 200
    End If

End Sub

Private Sub tmrLauncher2Death_Timer()

    If imgLauncher2.Enabled = False Then
        imgLauncher2Death.Enabled = True
        imgLauncher2Death.Visible = True
        imgLauncher2Death.Top = imgLauncher2.Top - 200
        imgLauncher2Death.Left = imgLauncher2.Left - 200
    End If

End Sub

Private Sub tmrPlayer1L_Timer()

    If imgLauncher1.Left <= -100 Then
        imgLauncher1.Left = 13100
        Else
        imgLauncher1.Left = imgLauncher1.Left - 100
        End If
        
    If imgLauncher1.Enabled = False Then
        tmrPlayer1L.Enabled = False
    End If
    
End Sub

Private Sub tmrPlayer1R_Timer()

    If imgLauncher1.Left >= 13100 Then
        imgLauncher1.Left = -100
        Else
        imgLauncher1.Left = imgLauncher1.Left + 100
        End If
        
    If imgLauncher1.Enabled = False Then
        tmrPlayer1R.Enabled = False
    End If
    
End Sub

Private Sub tmrPlayer2L_Timer()

    If imgLauncher2.Left <= -100 And tmrAI.Enabled = False Then
        imgLauncher2.Left = 13100
        Else
        imgLauncher2.Left = imgLauncher2.Left - 100
        End If
        
    If imgLauncher2.Enabled = False Then
        tmrPlayer2L.Enabled = False
    End If
    
End Sub

Private Sub tmrPlayer2R_Timer()

    If imgLauncher2.Left >= 13100 And tmrAI.Enabled = False Then
        imgLauncher2.Left = -100
        Else
        imgLauncher2.Left = imgLauncher2.Left + 100
        End If
        
    If imgLauncher2.Enabled = False Then
        tmrPlayer2R.Enabled = False
    End If
    
End Sub


Private Sub tmrRemoveCount_Timer()

    lblCountdown.Visible = False
    tmrRemoveCount.Enabled = False
    
End Sub

Private Sub tmrWinner1_Timer()

    If imgLauncher1.Enabled = True And imgLauncher2.Enabled = False And (frmLauncherGameAINormal.Enabled = True) Then
        MsgBox ("PLAYER 1 WINS!!!")
        tmrWinner1.Enabled = False
        frmLauncherGameAINormal.Visible = False
        frmLauncherGameAINormal.Enabled = False
        frmMainMenu.Visible = True
        tmrGO.Enabled = False
        tmrPlayer1L.Enabled = False
        tmrPlayer1R.Enabled = False
        tmrPlayer2L.Enabled = False
        tmrPlayer1R.Enabled = False
        Else
        tmrWinner1.Enabled = False
        End If

End Sub

Private Sub tmrWinner2_Timer()

    If imgLauncher2.Enabled = True And imgLauncher1.Enabled = False And (frmLauncherGameAINormal.Enabled = True) Then
        MsgBox ("PLAYER 2 WINS!!!")
        tmrWinner2.Enabled = False
        frmLauncherGameAINormal.Visible = False
        frmLauncherGameAINormal.Enabled = False
        frmMainMenu.Visible = True
        tmrGO.Enabled = False
        tmrPlayer1L.Enabled = False
        tmrPlayer1R.Enabled = False
        tmrPlayer2L.Enabled = False
        tmrPlayer1R.Enabled = False
        Else
        tmrWinner2.Enabled = False
        End If

End Sub
