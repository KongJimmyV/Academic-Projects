VERSION 5.00
Begin VB.Form frmSnakeAnimation 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Snake"
   ClientHeight    =   10890
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   19155
   LinkTopic       =   "Form1"
   ScaleHeight     =   10890
   ScaleWidth      =   19155
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrSnakeR 
      Interval        =   10
      Left            =   960
      Top             =   3480
   End
   Begin VB.Image imgSnake 
      Height          =   2355
      Left            =   1320
      Picture         =   "frmSnakeAnimation.frx":0000
      Stretch         =   -1  'True
      Top             =   840
      Width           =   4080
   End
End
Attribute VB_Name = "frmSnakeAnimation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim SCount As Integer

Private Sub tmrSnakeR_Timer()

    SCount = SCount + 1
    
    'exhange snake pics
    If SCount Mod 4 = 1 Then
        imgSnake.Picture = LoadPicture("H:\Programming I\PICS\Snake Pic\Snake1R.jpg")
    End If
    
    If SCount Mod 4 = 2 Then
        imgSnake.Picture = LoadPicture("H:\Programming I\PICS\Snake Pic\Snake2R.jpg")
    End If
    
    If SCount Mod 4 = 3 Then
        imgSnake.Picture = LoadPicture("H:\Programming I\PICS\Snake Pic\Snake3R.jpg")
    End If
    
    If SCount Mod 4 = 0 Then
        imgSnake.Picture = LoadPicture("H:\Programming I\PICS\Snake Pic\Snake2R.jpg")
    End If
    
    'move snake to the right
    imgSnake.Left = imgSnake.Left + 400
    
    'screen wrap right
    If imgSnake.Left > frmSnakeAnimation.Width Then
        imgSnake.Left = 0 - imgSnake.Width
    End If
    
End Sub
