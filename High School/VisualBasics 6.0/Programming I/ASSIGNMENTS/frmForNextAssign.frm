VERSION 5.00
Begin VB.Form frmForNextAssign 
   Caption         =   "Form1"
   ClientHeight    =   11775
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   18735
   LinkTopic       =   "Form1"
   ScaleHeight     =   11775
   ScaleWidth      =   18735
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuTo52 
      Caption         =   "1 to 52 by Intervals of 3"
   End
   Begin VB.Menu mnuAnnulus 
      Caption         =   "Annulus"
   End
   Begin VB.Menu mnuFlags 
      Caption         =   "Flags"
      Begin VB.Menu mnuSeychelles 
         Caption         =   "Flag of Seychelles"
      End
      Begin VB.Menu mneSingapore 
         Caption         =   "Civil Ensign Flag of Singapore"
      End
   End
   Begin VB.Menu mnuCircles 
      Caption         =   "Circles!!!"
   End
End
Attribute VB_Name = "frmForNextAssign"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub mneSingapore_Click()

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

Private Sub mnuAnnulus_Click()

    Randomize
    
    Dim RandomX As Single
    Dim RandomY As Single
    RandomX = Rnd
    RandomY = Rnd

    For r = 1 To 1000 Step 0.1
        Circle (RandomX * 4000 + 2000, RandomY * 4000 + 2000), r, RGB(Rnd * 255, Rn * 255, Rnd * 255)
    Next r
    
    For r = 1 To 500
        Circle (RandomX * 4000 + 2000, RandomY * 4000 + 2000), r, vbWhite
    Next r
    
    
End Sub

Private Sub mnuCircles_Click()

    Randomize
    
    For n = 1 To 10000 Step 1
        Circle ((Rnd * 8000) + 0, (Rnd * 8000) + 0), 500, QBColor(Rnd * 15)
    Next n
    
End Sub

Private Sub mnuSeychelles_Click()

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

Private Sub mnuTo52_Click()

    For n = 1 To 52 Step 3
        Print n
    Next n
    
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


