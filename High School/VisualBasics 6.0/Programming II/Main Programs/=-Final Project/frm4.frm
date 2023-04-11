VERSION 5.00
Begin VB.Form frm4 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "#4: Value Storage/Process"
   ClientHeight    =   4455
   ClientLeft      =   13110
   ClientTop       =   8580
   ClientWidth     =   7095
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   7095
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmd2 
      Caption         =   "Clear"
      Height          =   735
      Left            =   5760
      TabIndex        =   4
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton cmd1 
      Caption         =   "Quick Process"
      Height          =   735
      Left            =   240
      TabIndex        =   0
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton cmdFindAve 
      Caption         =   "Find 'Average'"
      Height          =   495
      Left            =   4320
      TabIndex        =   3
      Top             =   3720
      Width           =   1095
   End
   Begin VB.TextBox txtFindAverage 
      Height          =   2655
      Left            =   5280
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   720
      Width           =   1575
   End
   Begin VB.TextBox txtFindLarge 
      Height          =   2655
      Left            =   3480
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   720
      Width           =   1575
   End
   Begin VB.TextBox txtValues 
      Height          =   2655
      Left            =   240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      TabStop         =   0   'False
      Text            =   "frm4.frx":0000
      Top             =   720
      Width           =   3015
   End
   Begin VB.CommandButton cmdGen 
      Caption         =   "Generate Values"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   3720
      Width           =   1095
   End
   Begin VB.CommandButton cmdFindLg 
      Caption         =   "Find 'Largest Value'"
      Height          =   495
      Left            =   3000
      TabIndex        =   2
      Top             =   3720
      Width           =   1095
   End
   Begin VB.Label lbl3 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Average of Values"
      Height          =   495
      Left            =   5280
      TabIndex        =   10
      Top             =   120
      Width           =   1575
   End
   Begin VB.Label lbl2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Largest Value"
      Height          =   495
      Left            =   3480
      TabIndex        =   9
      Top             =   120
      Width           =   1575
   End
   Begin VB.Label lbl1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "List of Values"
      Height          =   495
      Left            =   240
      TabIndex        =   8
      Top             =   120
      Width           =   3015
   End
   Begin VB.Menu mnuBack 
      Caption         =   "Go Back"
   End
   Begin VB.Menu mnuOrd 
      Caption         =   "print order"
      Visible         =   0   'False
   End
End
Attribute VB_Name = "frm4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim D(1 To 5000) As Long
Dim DAverage As Long
Dim Hold(1 To 5000) As Long
Dim OrdArray(0 To 5000) As Long
Dim DArray(1 To 5000) As Long
Dim ValueCount As Long
Dim Temp As Single

Dim NumValues As Integer
Dim upperbound As Long
Dim lowerbound As Long

Dim C As Long
Dim x As Long
Dim i As Long
Dim r As Long

Private Sub cmd1_Click()

    cmdGen_Click
    cmdFindLg_Click
    cmdFindAve_Click
    
End Sub

Private Sub cmd2_Click()

    'clear whole program
    For r = 1 To NumValues
        D(r) = 0
        OrdArray(r) = 0
    Next r
    
    txtValues.Text = "***Generate Some Values.***"
    txtFindLarge.Text = ""
    txtFindAverage.Text = ""
    
End Sub

Private Sub cmdFindAve_Click()

Randomize
    
    'ValueCount = 0
    txtFindAverage.Text = ""
    
    For x = 1 To NumValues
        DArray(x) = D(x)    'put Value in array
        OrdArray(x) = DArray(x)
    Next x
    
    For r = 1 To NumValues
        Do
            Swapped = False
            For i = 2 To NumValues
                ' if this pair is out of order */
                If OrdArray(i - 1) > OrdArray(i) Then
                ' swap them and remember something changed */
                Temp = OrdArray(i - 1)
                OrdArray(i - 1) = OrdArray(i)
                OrdArray(i) = Temp
                Swapped = True
                End If
            Next i
        Loop Until Not (Swapped)
        
    Next r
    
    For C = 1 To NumValues Step 1
        txtFindAverage.Text = txtFindAverage.Text & "+  " & OrdArray(C) & vbCrLf
    Next C
    
    txtFindAverage.Text = txtFindAverage.Text & "  " & vbCrLf
    txtFindAverage.Text = txtFindAverage.Text & "/  " & "7" & vbCrLf
    
    'find average sum
    DAverage = (D(1) + D(2) + D(3) + D(4) + D(5) + D(6) + D(7)) / 7
    txtFindAverage.Text = txtFindAverage.Text & "------------------------------------------------------" & vbCrLf & "=  " & DAverage & vbCrLf
        
End Sub

Private Sub cmdFindLg_Click()

Randomize
    
    For x = 1 To NumValues
        DArray(x) = D(x)    'put Value in array
        OrdArray(x) = DArray(x)
    Next x
    
    ValueCount = 0
    txtFindLarge.Text = ""
    
    'put values in order
    Do
        Swapped = False
        For i = 2 To NumValues
            ' if this pair is out of order */
            If OrdArray(i - 1) > OrdArray(i) Then
            ' swap them and remember something changed */
            Temp = OrdArray(i - 1)
            OrdArray(i - 1) = OrdArray(i)
            OrdArray(i) = Temp
            Swapped = True
            End If
        Next i
    Loop Until Not (Swapped)
    
    ValueCount = ValueCount + 1
    txtFindLarge.Text = txtFindLarge.Text & "Lg" & ":  " & vbTab & OrdArray(NumValues) & vbCrLf
    
End Sub

Private Sub cmdGen_Click()

Randomize
    
    ValueCount = 0
    txtValues.Text = ""
    
    For r = 1 To NumValues
        Randomize
        'randomly select Values from 0 to 99
        D(r) = CInt(Int((upperbound - lowerbound + 1) * Rnd() + lowerbound))
        
        ValueCount = ValueCount + 1
        txtValues.Text = txtValues.Text & "# " & ValueCount & ":  " & vbTab & D(r) & vbCrLf
    Next r
    
    'update darray and ordarray
    For x = 1 To NumValues
        DArray(x) = D(x)    'put die value in array
        OrdArray(x) = DArray(x)
    Next x
    
End Sub

Private Sub Form_Load()

    NumValues = 7
    upperbound = 999
    lowerbound = 0
    
    
    'cmdGen.Enabled = False
    'cmdFindLg.Enabled = False
    'cmdFindAve.Enabled = False
    cmd1.Visible = True
    cmd2.Visible = True
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
    
End Sub

Private Sub mnuBack_Click()

    frm4.Hide
    frm4Programs.Show
    
    'reset whole program
    For r = 1 To NumValues
        D(r) = 0
        OrdArray(r) = 0
    Next r
    
    txtValues.Text = "***Generate Some Values.***"
    txtFindLarge.Text = ""
    txtFindAverage.Text = ""
    
End Sub

Private Sub mnuOrd_Click()

    For C = 1 To NumValues Step 1
        Print OrdArray(C)
    Next C
    
End Sub
