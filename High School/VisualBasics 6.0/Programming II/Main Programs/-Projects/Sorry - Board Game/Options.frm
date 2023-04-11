VERSION 5.00
Begin VB.Form Options 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Options"
   ClientHeight    =   6840
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4575
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6840
   ScaleWidth      =   4575
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraOptions 
      Height          =   6495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4335
      Begin VB.Frame fra2 
         Caption         =   "AI Options"
         Height          =   3255
         Left            =   120
         TabIndex        =   11
         Top             =   3120
         Width           =   4095
         Begin VB.CheckBox chkAI4 
            Caption         =   "Brutal"
            Height          =   255
            Index           =   3
            Left            =   3120
            TabIndex        =   31
            TabStop         =   0   'False
            Top             =   2640
            Width           =   855
         End
         Begin VB.CheckBox chkAI4 
            Caption         =   "Hard"
            Height          =   255
            Index           =   2
            Left            =   2160
            TabIndex        =   30
            TabStop         =   0   'False
            Top             =   2640
            Width           =   855
         End
         Begin VB.CheckBox chkAI4 
            Caption         =   "Normal"
            Height          =   255
            Index           =   1
            Left            =   3120
            TabIndex        =   29
            TabStop         =   0   'False
            Top             =   2400
            Width           =   855
         End
         Begin VB.CheckBox chkAI4 
            Caption         =   "Easy"
            Height          =   255
            Index           =   0
            Left            =   2160
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   2400
            Width           =   855
         End
         Begin VB.CheckBox chkAI3 
            Caption         =   "Brutal"
            Height          =   255
            Index           =   3
            Left            =   3120
            TabIndex        =   27
            TabStop         =   0   'False
            Top             =   1920
            Width           =   855
         End
         Begin VB.CheckBox chkAI3 
            Caption         =   "Hard"
            Height          =   255
            Index           =   2
            Left            =   2160
            TabIndex        =   26
            TabStop         =   0   'False
            Top             =   1920
            Width           =   855
         End
         Begin VB.CheckBox chkAI3 
            Caption         =   "Normal"
            Height          =   255
            Index           =   1
            Left            =   3120
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   1680
            Width           =   855
         End
         Begin VB.CheckBox chkAI3 
            Caption         =   "Easy"
            Height          =   255
            Index           =   0
            Left            =   2160
            TabIndex        =   24
            TabStop         =   0   'False
            Top             =   1680
            Width           =   855
         End
         Begin VB.CheckBox chkAI2 
            Caption         =   "Brutal"
            Height          =   255
            Index           =   3
            Left            =   3120
            TabIndex        =   21
            TabStop         =   0   'False
            Top             =   1200
            Width           =   855
         End
         Begin VB.CheckBox chkAI2 
            Caption         =   "Hard"
            Height          =   255
            Index           =   2
            Left            =   2160
            TabIndex        =   20
            TabStop         =   0   'False
            Top             =   1200
            Width           =   855
         End
         Begin VB.CheckBox chkAI2 
            Caption         =   "Normal"
            Height          =   255
            Index           =   1
            Left            =   3120
            TabIndex        =   19
            TabStop         =   0   'False
            Top             =   960
            Width           =   855
         End
         Begin VB.CheckBox chkAI2 
            Caption         =   "Easy"
            Height          =   255
            Index           =   0
            Left            =   2160
            TabIndex        =   18
            TabStop         =   0   'False
            Top             =   960
            Width           =   855
         End
         Begin VB.CheckBox chkAI1 
            Caption         =   "Brutal"
            Height          =   255
            Index           =   3
            Left            =   3120
            TabIndex        =   16
            TabStop         =   0   'False
            Top             =   480
            Width           =   855
         End
         Begin VB.CheckBox chkAI1 
            Caption         =   "Hard"
            Height          =   255
            Index           =   2
            Left            =   2160
            TabIndex        =   15
            TabStop         =   0   'False
            Top             =   480
            Width           =   855
         End
         Begin VB.CheckBox chkAI1 
            Caption         =   "Normal"
            Height          =   255
            Index           =   1
            Left            =   3120
            TabIndex        =   14
            TabStop         =   0   'False
            Top             =   240
            Width           =   855
         End
         Begin VB.CheckBox chkAI1 
            Caption         =   "Easy"
            Height          =   255
            Index           =   0
            Left            =   2160
            TabIndex        =   13
            TabStop         =   0   'False
            Top             =   240
            Width           =   855
         End
         Begin VB.Label lblAId 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Normal"
            Height          =   255
            Left            =   120
            TabIndex        =   35
            Top             =   2640
            Width           =   975
         End
         Begin VB.Label lblAIc 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Normal"
            Height          =   255
            Left            =   120
            TabIndex        =   34
            Top             =   1920
            Width           =   975
         End
         Begin VB.Label lblAIb 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Normal"
            Height          =   255
            Left            =   120
            TabIndex        =   33
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label lblAIa 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Normal"
            Height          =   255
            Left            =   120
            TabIndex        =   32
            Top             =   480
            Width           =   975
         End
         Begin VB.Label Label2 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "AI #4"
            Height          =   255
            Left            =   120
            TabIndex        =   23
            Top             =   2400
            Width           =   1935
         End
         Begin VB.Label Label1 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "AI #3"
            Height          =   255
            Left            =   120
            TabIndex        =   22
            Top             =   1680
            Width           =   1935
         End
         Begin VB.Label lblAI2 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "AI #2"
            Height          =   255
            Left            =   120
            TabIndex        =   17
            Top             =   960
            Width           =   1935
         End
         Begin VB.Label lblAI1 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "AI #1"
            Height          =   255
            Left            =   120
            TabIndex        =   12
            Top             =   240
            Width           =   1935
         End
      End
      Begin VB.Frame fra1 
         Caption         =   "Player Options"
         Height          =   3015
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   4095
         Begin VB.CheckBox chk2 
            Caption         =   "4"
            Height          =   255
            Index           =   3
            Left            =   3600
            TabIndex        =   10
            TabStop         =   0   'False
            Top             =   600
            Width           =   375
         End
         Begin VB.CheckBox chk2 
            Caption         =   "3"
            Height          =   255
            Index           =   2
            Left            =   3120
            TabIndex        =   9
            TabStop         =   0   'False
            Top             =   600
            Width           =   375
         End
         Begin VB.CheckBox chk2 
            Caption         =   "2"
            Height          =   255
            Index           =   1
            Left            =   2640
            TabIndex        =   8
            TabStop         =   0   'False
            Top             =   600
            Width           =   375
         End
         Begin VB.CheckBox chk2 
            Caption         =   "1"
            Height          =   255
            Index           =   0
            Left            =   2160
            TabIndex        =   7
            TabStop         =   0   'False
            Top             =   600
            Width           =   375
         End
         Begin VB.OptionButton opt1 
            Caption         =   "4"
            Height          =   255
            Index           =   2
            Left            =   3480
            TabIndex        =   5
            TabStop         =   0   'False
            Top             =   240
            Width           =   495
         End
         Begin VB.OptionButton opt1 
            Caption         =   "3"
            Height          =   255
            Index           =   1
            Left            =   2880
            TabIndex        =   4
            TabStop         =   0   'False
            Top             =   240
            Width           =   495
         End
         Begin VB.OptionButton opt1 
            Caption         =   "2"
            Height          =   255
            Index           =   0
            Left            =   2280
            TabIndex        =   3
            TabStop         =   0   'False
            Top             =   240
            Width           =   495
         End
         Begin VB.Label lbl2 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Computer:"
            Height          =   255
            Left            =   120
            TabIndex        =   6
            Top             =   600
            Width           =   1935
         End
         Begin VB.Label lbl1 
            BorderStyle     =   1  'Fixed Single
            Caption         =   "# of Players:"
            Height          =   255
            Left            =   120
            TabIndex        =   2
            Top             =   240
            Width           =   1935
         End
      End
   End
End
Attribute VB_Name = "Options"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkAI1_Click(Index As Integer)

    p = 1

AIDifficulty(p) = Index + 1

If AIDifficulty(p) = 1 Then lblAIa.Caption = "Easy"
If AIDifficulty(p) = 2 Then lblAIa.Caption = "Normal"
If AIDifficulty(p) = 3 Then lblAIa.Caption = "Hard"
If AIDifficulty(p) = 4 Then lblAIa.Caption = "Brutal"

For x = 0 To 3
    chkAI1(x).Value = 0
Next x

End Sub

Private Sub chkAI2_Click(Index As Integer)

    p = 2

AIDifficulty(p) = Index + 1

If AIDifficulty(p) = 1 Then lblAIb.Caption = "Easy"
If AIDifficulty(p) = 2 Then lblAIb.Caption = "Normal"
If AIDifficulty(p) = 3 Then lblAIb.Caption = "Hard"
If AIDifficulty(p) = 4 Then lblAIb.Caption = "Brutal"

For x = 0 To 3
    chkAI2(x).Value = 0
Next x

End Sub

Private Sub chkAI3_Click(Index As Integer)

    p = 3

AIDifficulty(p) = Index + 1

If AIDifficulty(p) = 1 Then lblAIc.Caption = "Easy"
If AIDifficulty(p) = 2 Then lblAIc.Caption = "Normal"
If AIDifficulty(p) = 3 Then lblAIc.Caption = "Hard"
If AIDifficulty(p) = 4 Then lblAIc.Caption = "Brutal"

For x = 0 To 3
    chkAI3(x).Value = 0
Next x

End Sub

Private Sub chkAI4_Click(Index As Integer)

    p = 4

AIDifficulty(p) = Index + 1

If AIDifficulty(p) = 1 Then lblAId.Caption = "Easy"
If AIDifficulty(p) = 2 Then lblAId.Caption = "Normal"
If AIDifficulty(p) = 3 Then lblAId.Caption = "Hard"
If AIDifficulty(p) = 4 Then lblAId.Caption = "Brutal"

For x = 0 To 3
    chkAI4(x).Value = 0
Next x

End Sub

Private Sub opt1_Click(Index As Integer)

    If Index = 0 Then
        chk2(0).Enabled = True
        chk2(1).Enabled = True
        chk2(2).Enabled = False
        chk2(3).Enabled = False
    End If
    
    If Index = 1 Then
        chk2(0).Enabled = True
        chk2(1).Enabled = True
        chk2(2).Enabled = True
        chk2(3).Enabled = False
    End If
    
    If Index = 2 Then
        chk2(0).Enabled = True
        chk2(1).Enabled = True
        chk2(2).Enabled = True
        chk2(3).Enabled = True
    End If
    
End Sub
