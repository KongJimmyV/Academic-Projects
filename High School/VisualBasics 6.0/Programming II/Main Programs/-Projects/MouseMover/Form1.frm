VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   870
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3135
   LinkTopic       =   "Form1"
   ScaleHeight     =   870
   ScaleWidth      =   3135
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdMove 
      Caption         =   "Move"
      Height          =   375
      Left            =   1440
      TabIndex        =   5
      Top             =   240
      Width           =   735
   End
   Begin VB.CommandButton cmdClick 
      Caption         =   "Click"
      Height          =   375
      Left            =   2280
      TabIndex        =   4
      Top             =   240
      Width           =   735
   End
   Begin VB.TextBox txtY 
      Height          =   285
      Left            =   600
      TabIndex        =   3
      Text            =   "1440"
      Top             =   480
      Width           =   615
   End
   Begin VB.TextBox txtX 
      Height          =   285
      Left            =   600
      TabIndex        =   1
      Text            =   "1440"
      Top             =   120
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "Y"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   255
   End
   Begin VB.Label Label1 
      Caption         =   "X"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)

Private Const MOUSEEVENTF_MOVE = &H1          ' mouse move
Private Const MOUSEEVENTF_LEFTDOWN = &H2      ' left button down
Private Const MOUSEEVENTF_LEFTUP = &H4        ' left button up
Private Const MOUSEEVENTF_RIGHTDOWN = &H8     ' right button down
Private Const MOUSEEVENTF_RIGHTUP = &H10      ' right button up
Private Const MOUSEEVENTF_MIDDLEDOWN = &H20   ' middle button down
Private Const MOUSEEVENTF_MIDDLEUP = &H40     ' middle button up
Private Const MOUSEEVENTF_WHEEL = &H800       ' wheel button rolled
Private Const MOUSEEVENTF_ABSOLUTE = &H8000   ' absolute move
Private Sub cmdClick_Click()
Dim X As Long
Dim Y As Long
Dim mouse_x As Long
Dim mouse_y As Long

    ' Get the coordinates.
    X = CLng(txtX.Text)
    Y = CLng(txtY.Text)

    ' Position the target form.
    frmTarget.Left = X - frmTarget.Width / 2
    frmTarget.Top = Y - frmTarget.Height / 2

    ' mouse_event moves in a coordinate system where
    ' (0, 0) is in the upper left corner and
    ' (65535,65535) is in the lower right corner.

    ' Convert the coordinates.
    mouse_x = CLng(X * 65535 / Screen.Width)
    mouse_y = CLng(Y * 65535 / Screen.Height)

    ' Click at that position.
    mouse_event _
        MOUSEEVENTF_ABSOLUTE Or _
        MOUSEEVENTF_MOVE Or _
        MOUSEEVENTF_LEFTDOWN Or _
        MOUSEEVENTF_LEFTUP, _
        mouse_x, mouse_y, 0, 0
End Sub

Private Sub cmdMove_Click()
Dim X As Long
Dim Y As Long
Dim mouse_x As Long
Dim mouse_y As Long

    ' Get the coordinates.
    X = CLng(txtX.Text)
    Y = CLng(txtY.Text)

    ' Position the target form.
    frmTarget.Left = X - frmTarget.Width / 2
    frmTarget.Top = Y - frmTarget.Height / 2

    ' mouse_event moves in a coordinate system where
    ' (0, 0) is in the upper left corner and
    ' (65535,65535) is in the lower right corner.

    ' Convert the coordinates.
    mouse_x = CLng(X * 65535 / Screen.Width)
    mouse_y = CLng(Y * 65535 / Screen.Height)

    ' Position the mouse.
    mouse_event _
        MOUSEEVENTF_ABSOLUTE + _
        MOUSEEVENTF_MOVE, _
        mouse_x, mouse_y, 0, 0
End Sub

' Display the targeting form.
Private Sub Form_Load()
    frmTarget.Show , Me
End Sub


' Unload the target form, too.
Private Sub Form_Unload(Cancel As Integer)
    Unload frmTarget
End Sub
