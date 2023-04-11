VERSION 5.00
Begin VB.Form frmWinterScene 
   Caption         =   "Winter Scene"
   ClientHeight    =   9435
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   18765
   LinkTopic       =   "Form1"
   ScaleHeight     =   9419.301
   ScaleMode       =   0  'User
   ScaleWidth      =   19000
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdStart 
      Caption         =   "Click here!"
      Height          =   615
      Left            =   8640
      TabIndex        =   0
      Top             =   3960
      Width           =   1455
   End
End
Attribute VB_Name = "frmWinterScene"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdStart_Click()
    
    'get that button out of here
    cmdStart.Visible = False
    
    'Snow!!!
    For s = 7000 To 9000 Step 0.1
        Line (l, s)-(frmWinterScene.Width, s), RGB(255, 255, 255)
    Next
    
    For s = 7000 To 8000 Step 0.1
        Line (l, s)-(frmWinterScene.Width, s), RGB(240, 240, 240)
    Next
    
    For s = 7000 To 7700 Step 0.1
        Line (l, s)-(frmWinterScene.Width, s), RGB(230, 230, 230)
    Next
    
    For s = 7000 To 7100 Step 0.1
        Line (l, s)-(frmWinterScene.Width, s), RGB(180, 180, 180)
    Next
    
    For s = 7000 To 7000 Step 0.1
        Line (l, s)-(frmWinterScene.Width, s), RGB(0, 0, 0)
    Next
    
    'Tree Trunk
    For s = 6000 To 8200 Step 0.1
        Line (4000, s)-(5000, s), RGB(160, 100, 10)
    Next
    
    For s = 6000 To 8200 Step 0.1
        Line (4000, s)-(4300, s), RGB(120, 70, 0)
    Next
    
    For s = 6000 To 8200 Step 0.1
        Line (4000, s)-(4010, s), RGB(0, 0, 0)
    Next
    
    For s = 6000 To 8200 Step 0.1
        Line (4980, s)-(5000, s), RGB(0, 0, 0)
    Next
    
    'Tree Leaves
    
    For s = 6000 To 8200 Step 0.1
        Line (5000 + s / 2, 0)-(5000, s), RGB(0, 0, 0)
    Next
    
    
End Sub

