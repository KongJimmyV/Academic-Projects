VERSION 5.00
Begin VB.Form frm2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "#2: Flag Draw"
   ClientHeight    =   7470
   ClientLeft      =   150
   ClientTop       =   480
   ClientWidth     =   12120
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   ScaleHeight     =   7470
   ScaleWidth      =   12120
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdChina 
      Caption         =   "China"
      Height          =   735
      Left            =   3120
      TabIndex        =   2
      Top             =   6480
      Width           =   1215
   End
   Begin VB.CommandButton cmdSeychelles 
      Caption         =   "Seychelles"
      Height          =   735
      Left            =   1680
      TabIndex        =   1
      Top             =   6480
      Width           =   1215
   End
   Begin VB.CommandButton cmdSingapore 
      Caption         =   "Singapore"
      Height          =   735
      Left            =   240
      TabIndex        =   0
      Top             =   6480
      Width           =   1215
   End
   Begin VB.Menu mnuBack 
      Caption         =   "Go Back"
   End
End
Attribute VB_Name = "frm2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdChina_Click()
Cls
    For h = 1 To 360 * 16
        Line (l, h)-(12000, h), RGB(255, 47, 47)
    Next h
    
    Call StarProcedure(1300, 1400, 600, 255, 255, 0, 5, 0)
    
    
    Call StarProcedure(2400, 500, 200, 255, 255, 0, 5, -15)
    Call StarProcedure(2800, 1100, 200, 255, 255, 0, 5, -45)
    Call StarProcedure(2800, 1700, 200, 255, 255, 0, 5, -70)
    Call StarProcedure(2400, 2300, 200, 255, 255, 0, 5, -155)
    
End Sub

Private Sub cmdSingapore_Click()
Cls
    For h = 1 To 360 * 16
        Line (l, h)-(12000, h), RGB(237, 47, 57)
    Next h
    
    For r = 1 To 166 * 8
        Circle (12000 / 2, h / 2), r, RGB(255, 255, 255)
    Next r
    
    For r = 1 To 150 * 8
        Circle (12000 / 2, h / 2), r, RGB(237, 47, 57)
    Next r
    
    Call StarProcedure(6000, 2200, 200, 255, 255, 255, 5, 0)

End Sub

Private Sub cmdSeychelles_Click()
Cls
    For x = 0 To 4000
        Line (0, 6000)-(x, 0), RGB(2, 2, 183)
    Next x
    
    For x = 4000 To 8000
        Line (0, 6000)-(x, 0), RGB(254, 251, 1)
    Next x
    
    For x = 8000 To 12000
        Line (0, 6000)-(x, 0), RGB(252, 2, 1)
    Next x
    
    For y = 0 To 2000
        Line (0, 6000)-(12000, y), RGB(252, 2, 1)
    Next y
    
    For y = 2000 To 4000
        Line (0, 6000)-(12000, y), RGB(255, 255, 255)
    Next y
    
    For y = 4000 To 6000
        Line (0, 6000)-(12000, y), RGB(1, 140, 1)
    Next y
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Sub StarProcedure(h As Integer, k As Integer, outRad As Integer, RColorNum As Integer, GColorNum As Integer, BColorNum As Integer, PNum As Integer, DRot As Integer)

    Dim pi As Single
        
    pi = 3.1416
    InnerRad = outRad * 0.382
    RRot = DRot / 180 * pi
        
    For n = 0 To (PNum - 1)
        Line (h, k)-(h + InnerRad * Cos(n * pi * 2 / PNum + pi / 2 + RRot), k + InnerRad * Sin(n * pi * 2 / PNum + pi / 2 + RRot)), RGB(RColorNum, GColorNum, BColorNum)
        Line (h, k)-(h + outRad * Cos(n * pi * 2 / PNum - pi / 2 - RRot), k + outRad * Sin(n * pi * 2 / PNum - pi / 2 - RRot)), RGB(RColorNum, GColorNum, BColorNum)
    Next n

    
    For j = 1 To InnerRad
        For f = 0 To (PNum - 1)
            Line (h + outRad * Cos(f * pi / (PNum / 2) - pi / 2 - RRot), k + outRad * Sin(f * pi / (PNum / 2) - pi / 2 - RRot))-(h + j * Cos(f * pi / (PNum / 2) - pi / 2 - RRot + pi / PNum), k + j * Sin(f * pi / (PNum / 2) - pi / 2 - RRot + pi / PNum)), RGB(RColorNum, GColorNum, BColorNum)
            Line (h + outRad * Cos(f * pi / (PNum / 2) - pi / 2 - RRot), k + outRad * Sin(f * pi / (PNum / 2) - pi / 2 - RRot))-(h + j * Cos(f * pi / (PNum / 2) - pi / 2 - RRot - pi / PNum), k + j * Sin(f * pi / (PNum / 2) - pi / 2 - RRot - pi / PNum)), RGB(RColorNum, GColorNum, BColorNum)
        Next f
    Next j

End Sub

Private Sub mnuBack_Click()

    frm2.Hide
    frm4Programs.Show
    
    Cls
    
End Sub
