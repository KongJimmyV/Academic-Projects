VERSION 5.00
Begin VB.Form frmForNextIntro 
   Caption         =   "For Next Intro"
   ClientHeight    =   6615
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   15030
   LinkTopic       =   "Form1"
   ScaleHeight     =   6615
   ScaleWidth      =   15030
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuName 
      Caption         =   "Name 17 Times"
   End
   Begin VB.Menu mnuCubes 
      Caption         =   "Cubes"
   End
   Begin VB.Menu mnuDrawing 
      Caption         =   "Drawing"
      Begin VB.Menu mnuCircles 
         Caption         =   "1000 Circles"
      End
      Begin VB.Menu mnuMovingCircle 
         Caption         =   "Moving Circle"
      End
      Begin VB.Menu mnuUSFlag 
         Caption         =   "US Flag"
      End
   End
End
Attribute VB_Name = "frmForNextIntro"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub mnuCircles_Click()

    Randomize
    
    For c = 1 To 10
        Circle (Rnd * 5000, Rnd * 5000), 500, QBColor(Rnd * 15)
        
    Next c
        
End Sub

Private Sub mnuCubes_Click()

    For c = 1 To 100
        Print c; "^3"; c ^ 3
    Next c
    
End Sub

Private Sub mnuMovingCircle_Click()
    
    Randomize

For t = 1 To 5
    For h = 500 To 10000
        Circle (h, 1000), 250, QBColor(Rnd * 15)
    Next h
    
    For v = 1000 To 5000
        Circle (10000, v), 250, QBColor(Rnd * 15)
    Next v
    
    For h = 10000 To 500 Step -1
        Circle (h, 5000), 250, QBColor(Rnd * 15)
    Next h
    
    For h = 5000 To 1000 Step -1
        Circle (500, v), 250, QBColor(Rnd * 15)
    Next h
    
Next t

End Sub

Private Sub mnuName_Click()

    For n = 1 To 26
        Print "Jimmy Vang"
    Next n
    
End Sub

Private Sub mnuUSFlag_Click()

    For w = 1 To 10 * 500
        Line (l, w)-(19 * 500, w), vbWhite
    Next w
    
    'top red stripe
    For r = 1 To 385
        Line (l, r)-(19 * 500, r), vbRed
        Line (l, r + 770)-(19 * 500, r + 770), vbRed
        Line (l, r + 770 * 2)-(19 * 500, r + 770 * 2), vbRed
        Line (l, r + 770 * 3)-(19 * 500, r + 770 * 3), vbRed
        Line (l, r + 770 * 4)-(19 * 500, r + 770 * 4), vbRed
        Line (l, r + 770 * 5)-(19 * 500, r + 770 * 5), vbRed
        Line (l, r + 770 * 6)-(19 * 500, r + 770 * 6), vbRed
    Next r
    
    'blue rectangle
    For b = 1 To 385 * 7
        Line (l, b)-(19 * 500 * 2 / 5, b), vbBlue
    Next b
    
    'giant white star
    Call StarProcedure(19 * 500 * 1 / 5, 385 * 7 / 2, 1000, 255, 255, 255, 8, 8)
    
    
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


