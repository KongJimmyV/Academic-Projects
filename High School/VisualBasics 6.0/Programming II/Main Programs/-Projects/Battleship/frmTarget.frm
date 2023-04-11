VERSION 5.00
Begin VB.Form frmTarget 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   1230
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1395
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   ScaleHeight     =   1230
   ScaleWidth      =   1395
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
End
Attribute VB_Name = "frmTarget"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SetWindowRgn Lib "user32" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function CreateEllipticRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Private Const RGN_DIFF = 4

Private Sub Form_Load()
Const INCH As Integer = 1440 '1440
Dim pix_wid As Long
Dim pix_hgt As Long
Dim rgn1 As Long
Dim rgn2 As Long
Dim rgn3 As Long

    Me.Width = 0.5 * INCH
    Me.Height = 0.5 * INCH

    pix_wid = Me.ScaleX(Me.Width, vbTwips, vbPixels)
    pix_hgt = Me.ScaleY(Me.Height, vbTwips, vbPixels)
    rgn1 = CreateEllipticRgn(0, 0, pix_wid, pix_hgt)
    rgn2 = CreateEllipticRgn( _
        pix_wid \ 2 - 5, pix_hgt \ 2 - 5, _
        pix_wid \ 2 + 5, pix_hgt \ 2 + 5)

    rgn3 = CreateEllipticRgn(0, 0, 10, 10)
    CombineRgn rgn3, rgn1, rgn2, RGN_DIFF
    DeleteObject rgn1
    DeleteObject rgn2

    SetWindowRgn Me.hwnd, rgn3, True
    DeleteObject rgn3
End Sub


