VERSION 5.00
Begin VB.Form frmBattleshipAX5 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "AI5"
   ClientHeight    =   9000
   ClientLeft      =   45
   ClientTop       =   675
   ClientWidth     =   11055
   Icon            =   "frmBattleshipAX5.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   600
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   737
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraP2 
      Caption         =   "P2 (Computer)"
      Height          =   3495
      Left            =   6960
      TabIndex        =   13
      Top             =   5280
      Width           =   3615
      Begin VB.Label lblP2f 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   14
         Top             =   1680
         Width           =   855
      End
      Begin VB.Label lblP2f 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Patrol Boat HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   15
         Top             =   1680
         Width           =   2295
      End
      Begin VB.Label lblP2e 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   16
         Top             =   1440
         Width           =   855
      End
      Begin VB.Label lblP2e 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Submarine HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   17
         Top             =   1440
         Width           =   2295
      End
      Begin VB.Label lblP2d 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   18
         Top             =   1200
         Width           =   855
      End
      Begin VB.Label lblP2d 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Destroyer HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   19
         Top             =   1200
         Width           =   2295
      End
      Begin VB.Label lblP2c 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   20
         Top             =   960
         Width           =   855
      End
      Begin VB.Label lblP2c 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Battleship HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   21
         Top             =   960
         Width           =   2295
      End
      Begin VB.Label lblP2b 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   22
         Top             =   720
         Width           =   855
      End
      Begin VB.Label lblP2b 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Carrier HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   23
         Top             =   720
         Width           =   2295
      End
      Begin VB.Label lblP2a 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "HP"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   2520
         TabIndex        =   25
         Top             =   360
         Width           =   855
      End
      Begin VB.Label lblP2a 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Ships"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   24
         Top             =   360
         Width           =   2295
      End
   End
   Begin VB.Frame fraP1 
      Caption         =   "P1 (You)"
      Height          =   3495
      Left            =   480
      TabIndex        =   1
      Top             =   5280
      Width           =   3615
      Begin VB.Label lblP1f 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   12
         Top             =   1680
         Width           =   855
      End
      Begin VB.Label lblP1f 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Patrol Boat HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   11
         Top             =   1680
         Width           =   2295
      End
      Begin VB.Label lblP1e 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   10
         Top             =   1440
         Width           =   855
      End
      Begin VB.Label lblP1e 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Submarine HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   9
         Top             =   1440
         Width           =   2295
      End
      Begin VB.Label lblP1d 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   8
         Top             =   1200
         Width           =   855
      End
      Begin VB.Label lblP1d 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Destroyer HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   7
         Top             =   1200
         Width           =   2295
      End
      Begin VB.Label lblP1c 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   6
         Top             =   960
         Width           =   855
      End
      Begin VB.Label lblP1c 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Battleship HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   960
         Width           =   2295
      End
      Begin VB.Label lblP1b 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "100%"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   4
         Top             =   720
         Width           =   855
      End
      Begin VB.Label lblP1b 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Carrier HP:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   2295
      End
      Begin VB.Label lblP1a 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "HP"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   1
         Left            =   2520
         TabIndex        =   26
         Top             =   360
         Width           =   855
      End
      Begin VB.Label lblP1a 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Ships"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   2
         Top             =   360
         Width           =   2295
      End
   End
   Begin VB.Label lbl3 
      Caption         =   "Idle"
      ForeColor       =   &H8000000D&
      Height          =   375
      Left            =   6960
      TabIndex        =   28
      Top             =   360
      Width           =   3615
   End
   Begin VB.Label lbl2 
      Caption         =   "Idle"
      ForeColor       =   &H8000000D&
      Height          =   375
      Left            =   480
      TabIndex        =   27
      Top             =   360
      Width           =   3615
   End
   Begin VB.Image imgCarrierH 
      Height          =   375
      Index           =   1
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   1815
   End
   Begin VB.Image imgBattleshipH 
      Height          =   375
      Index           =   1
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   1455
   End
   Begin VB.Image imgDestroyerH 
      Height          =   375
      Index           =   1
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   1095
   End
   Begin VB.Image imgSubmarineH 
      Height          =   375
      Index           =   1
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   1095
   End
   Begin VB.Image imgPatrolBoatH 
      Height          =   375
      Index           =   1
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   735
   End
   Begin VB.Image imgPatrolBoatH 
      Height          =   375
      Index           =   0
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   735
   End
   Begin VB.Image imgSubmarineH 
      Height          =   375
      Index           =   0
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   1095
   End
   Begin VB.Image imgDestroyerH 
      Height          =   375
      Index           =   0
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   1095
   End
   Begin VB.Image imgBattleshipH 
      Height          =   375
      Index           =   0
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   1455
   End
   Begin VB.Image imgCarrierH 
      Height          =   375
      Index           =   0
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   1815
   End
   Begin VB.Label lbl1 
      Alignment       =   2  'Center
      Caption         =   "Battleship"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4440
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   199
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   198
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   197
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   196
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   195
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   194
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   193
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   192
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   191
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   190
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   189
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   188
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   187
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   186
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   185
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   184
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   183
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   182
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   181
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   180
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   179
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   178
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   177
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   176
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   175
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   174
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   173
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   172
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   171
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   170
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   169
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   168
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   167
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   166
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   165
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   164
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   163
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   162
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   161
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   160
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   159
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   158
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   157
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   156
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   155
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   154
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   153
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   152
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   151
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   150
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   149
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   148
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   147
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   146
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   145
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   144
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   143
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   142
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   141
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   140
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   139
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   138
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   137
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   136
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   135
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   134
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   133
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   132
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   131
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   130
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   129
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   128
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   127
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   126
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   125
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   124
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   123
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   122
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   121
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   120
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   119
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   118
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   117
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   116
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   115
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   114
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   113
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   112
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   111
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   110
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   109
      Left            =   10200
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   108
      Left            =   9840
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   107
      Left            =   9480
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   106
      Left            =   9120
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   105
      Left            =   8760
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   104
      Left            =   8400
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   103
      Left            =   8040
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   102
      Left            =   7680
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   101
      Left            =   7320
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   100
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   99
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   98
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   97
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   96
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   95
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   94
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   93
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   92
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   91
      Left            =   840
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   90
      Left            =   480
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   89
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   88
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   87
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   86
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   85
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   84
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   83
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   82
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   81
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   80
      Left            =   480
      Stretch         =   -1  'True
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   79
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   78
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   77
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   76
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   75
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   74
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   73
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   72
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   71
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   70
      Left            =   480
      Stretch         =   -1  'True
      Top             =   3600
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   69
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   68
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   67
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   66
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   65
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   64
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   63
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   62
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   61
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   60
      Left            =   480
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   59
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   58
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   57
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   56
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   55
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   54
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   53
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   52
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   51
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   50
      Left            =   480
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   49
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   48
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   47
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   46
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   45
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   44
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   43
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   42
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   41
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   40
      Left            =   480
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   39
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   38
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   37
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   36
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   35
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   34
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   33
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   32
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   31
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   30
      Left            =   480
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   29
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   28
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   27
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   26
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   25
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   24
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   23
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   22
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   21
      Left            =   840
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   20
      Left            =   480
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   19
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   18
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   17
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   16
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   15
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   14
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   13
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   12
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   11
      Left            =   840
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   10
      Left            =   480
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   9
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   8
      Left            =   3360
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   7
      Left            =   3000
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   6
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   5
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   4
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   3
      Left            =   1560
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   2
      Left            =   1200
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   1
      Left            =   840
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgCellA 
      Height          =   375
      Index           =   0
      Left            =   480
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   375
   End
   Begin VB.Image imgBG 
      Height          =   3855
      Index           =   0
      Left            =   360
      Stretch         =   -1  'True
      Top             =   960
      Width           =   3855
   End
   Begin VB.Image imgBG 
      Height          =   3855
      Index           =   1
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   960
      Width           =   3855
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuStart 
      Caption         =   "Start"
   End
End
Attribute VB_Name = "frmBattleshipAX5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Game
Dim GameOn                  As Boolean
Dim Turn                    As Integer

Dim Hit                     As Integer
Dim Miss                    As Integer

Dim AI                      As Boolean

'Var
Dim s                       As Integer

'Grid Var
Dim Grid(-4 To 13, -4 To 13)            As Single
Dim Row                                 As Integer
Dim Col                                 As Integer
Dim Index                               As Integer

'Memory Store
Dim R(0 To 4)                           As Byte
Dim C(0 To 4)                           As Byte
Dim i(0 To 4)                           As Byte

'Display Board
Dim P1WinCount                          As Integer
Dim P1LoseCount                         As Integer
Dim P2WinCount                          As Integer
Dim P2LoseCount                         As Integer

'###Ships###  '0' = P1, '1' = P2
Dim ShipNum                             As Integer
Dim ShipWidth(0 To 4)                   As Integer
Dim ShipLength(0 To 4)                  As Integer
    
    'Deadships
    Dim DeadCarrier(0 To 1)             As Boolean
    Dim DeadBattleship(0 To 1)          As Boolean
    Dim DeadSubmarine(0 To 1)           As Boolean
    Dim DeadDestroyer(0 To 1)           As Boolean
    Dim DeadPatrolBoat(0 To 1)          As Boolean
    
    'Ship Placement
    Dim ShipPlacement                   As Boolean
    Dim PlaceDirection(0 To 1)          As Boolean
    Dim PlaceCarrier(0 To 1)            As Boolean
    Dim PlaceBattleship(0 To 1)         As Boolean
    Dim PlaceSubmarine(0 To 1)          As Boolean
    Dim PlaceDestroyer(0 To 1)          As Boolean
    Dim PlacePatrolBoat(0 To 1)         As Boolean
    
    'Ship Health
    Dim HealthCarrier(0 To 1)           As Integer
    Dim HealthBattleship(0 To 1)        As Integer
    Dim HealthSubmarine(0 To 1)         As Integer
    Dim HealthDestroyer(0 To 1)         As Integer
    Dim HealthPatrolBoat(0 To 1)        As Integer



Private Sub Form_Load()

    'Decides How Program Loads.
    
    Randomize
    
    'Set ai difficulty
    AIDifficulty = 1
    
    'Init
    For t = 0 To 1
    imgPatrolBoatH(t).Picture = LoadPicture(App.Path & "\Images\HPatrol Boat.gif")
    imgDestroyerH(t).Picture = LoadPicture(App.Path & "\Images\HDestroyer.gif")
    imgSubmarineH(t).Picture = LoadPicture(App.Path & "\Images\HSubmarine.gif")
    imgBattleshipH(t).Picture = LoadPicture(App.Path & "\Images\HBattleship.gif")
    imgCarrierH(t).Picture = LoadPicture(App.Path & "\Images\HCarrier.gif")
    'imgPatrolBoatV(t).Picture = LoadPicture(App.Path & "\Images\VPatrol Boat.gif")
    'imgDestroyerV(t).Picture = LoadPicture(App.Path & "\Images\VDestroyer.gif")
    'imgSubmarineV(t).Picture = LoadPicture(App.Path & "\Images\VSubmarine.gif")
    'imgBattleshipV(t).Picture = LoadPicture(App.Path & "\Images\VBattleship.gif")
    'imgCarrierV(t).Picture = LoadPicture(App.Path & "\Images\VCarrier.gif")
    Next t
    For t = 0 To 199
        imgCellA(t).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
    Next t
    For t = 0 To 1
        imgBG(t).Picture = LoadPicture(App.Path & "\Images\BGWater.gif")
    Next t
    
    GameOn = True
    ShipPlacement = True
    Turn = 0
    
    'Store
    ShipWidth(0) = 25
    ShipWidth(1) = 25
    ShipWidth(2) = 25
    ShipWidth(3) = 25
    ShipWidth(4) = 25
    ShipLength(0) = 49
    ShipLength(1) = 73
    ShipLength(2) = 73
    ShipLength(3) = 97
    ShipLength(4) = 121
    
End Sub

Private Sub imgCarrierH_Click(Index As Integer)

For s = 0 To 1
PlaceDirection(s) = False
Next s

If Turn = 0 Then
    s = 0
    PlaceCarrier(s) = True
    Else
    s = 0
    PlaceCarrier(s) = False
End If

If Turn = 1 Then
    s = 1
    PlaceCarrier(s) = True
    Else
    s = 1
    PlaceCarrier(s) = False
End If

End Sub

Private Sub imgCellA_Click(Index As Integer)

If GameOn = True Then
    If ShipPlacement = True Then
    Call Placement(Index)
    End If
    
    If ShipPlacement = False Then
    Call Shot
    End If
    
End If

End Sub

Private Sub mnuExit_Click()

    End
    
End Sub

Private Sub mnuStart_Click()

    Call Form_Load
    
End Sub

Private Sub Placement(Index As Integer)

    'Contains Ship Placement Info
        
    Randomize
    
    Col = (Index Mod 10)
    Row = 10 - (Index \ 10 + 1)
    
    AIIndex = ((-1 * (YDefinition * XDefinition)) + (XDefinition * YDefinition)) + ((Index * 1) - XDefinition)
    
    '***************Placement of Ships***************'
    s = Turn
    ShipNum = Turn
    
    If Turn = 0 And (Index < 100 And Index >= 0) And PlaceCarrier(s) = True Then
        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Select.gif")
        If Grid(Row, Col) = 0 Then  'Invalid Placement Check
            'MsgBox ("hi")
            If PlaceDirection(s) = True Then
                    'up
                    If Row > R(0) Then
                    If R(0) + 4 <= 9 Then 'Inside Grid Validation
                    If Grid(R(0), C(0)) = 0 _
                    And Grid(R(0) + 1, C(0)) = 0 _
                    And Grid(R(0) + 2, C(0)) = 0 _
                    And Grid(R(0) + 3, C(0)) = 0 _
                    And Grid(R(0) + 4, C(0)) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(R(0) + x, C(0)) = 1
                        Next x
                        imgCarrierH(ShipNum).Picture = LoadPicture(App.Path & "\Images\VCarrier.gif")
                        imgCarrierH(ShipNum).Width = ShipWidth(4)
                        imgCarrierH(ShipNum).Height = ShipLength(4)
                        
                        imgCarrierH(ShipNum).Left = imgCellA(i(0)).Left
                        imgCarrierH(ShipNum).Top = imgCellA(i(0)).Top + imgCellA(i(0)).Height - imgCarrierH(ShipNum).Height
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceDirection(s) = False
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        PlaceDirection(s) = False
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        'MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is off the grid.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        Grid(Row, Col) = 0
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < R(0) Then
                    If R(0) - 4 >= 0 Then 'Inside Grid Validation
                    If Grid(R(0), C(0)) = 0 _
                    And Grid(R(0) - 1, C(0)) = 0 _
                    And Grid(R(0) - 2, C(0)) = 0 _
                    And Grid(R(0) - 3, C(0)) = 0 _
                    And Grid(R(0) - 4, C(0)) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(R(0) - x, C(0)) = 1
                        Next x
                        imgCarrierH(ShipNum).Picture = LoadPicture(App.Path & "\Images\VCarrier.gif")
                        imgCarrierH(ShipNum).Width = ShipWidth(4)
                        imgCarrierH(ShipNum).Height = ShipLength(4)
                        
                        imgCarrierH(ShipNum).Left = imgCellA(i(0)).Left
                        imgCarrierH(ShipNum).Top = imgCellA(i(0)).Top
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is off the grid.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > C(0) Then
                    If C(0) + 4 <= 9 Then 'Inside Grid Validation
                    If Grid(R(0), C(0)) = 0 _
                    And Grid(R(0), C(0) + 1) = 0 _
                    And Grid(R(0), C(0) + 2) = 0 _
                    And Grid(R(0), C(0) + 3) = 0 _
                    And Grid(R(0), C(0) + 4) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(R(0), C(0) + x) = 1
                        Next x
                        imgCarrierH(ShipNum).Picture = LoadPicture(App.Path & "\Images\HCarrier.gif")
                        imgCarrierH(ShipNum).Width = ShipLength(4)
                        imgCarrierH(ShipNum).Height = ShipWidth(4)
                        
                        imgCarrierH(ShipNum).Left = imgCellA(i(0)).Left
                        imgCarrierH(ShipNum).Top = imgCellA(i(0)).Top
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is collided with another ship.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        MsgBox ("You can't place your Carrier because it is off the grid.")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < C(0) Then
                    If C(0) - 4 >= 0 Then 'Inside Grid Validation
                    If Grid(R(0), C(0)) = 0 _
                    And Grid(R(0), C(0) - 1) = 0 _
                    And Grid(R(0), C(0) - 2) = 0 _
                    And Grid(R(0), C(0) - 3) = 0 _
                    And Grid(R(0), C(0) - 4) = 0 Then 'Invalid Placement Check
                        'Label Grid; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For x = 0 To 4
                            Grid(R(0), C(0) - x) = 1
                        Next x
                        imgCarrierH(ShipNum).Picture = LoadPicture(App.Path & "\Images\HCarrier.gif")
                        imgCarrierH(ShipNum).Width = ShipLength(4)
                        imgCarrierH(ShipNum).Height = ShipWidth(4)
                        
                        imgCarrierH(ShipNum).Left = imgCellA(i(0)).Left + imgCellA(i(0)).Width - imgCarrierH(ShipNum).Width
                        imgCarrierH(ShipNum).Top = imgCellA(i(0)).Top
                        imgCarrierH(ShipNum).Visible = True
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                        imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    GoTo B:
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    MsgBox ("You can't place your Carrier because it is collided with another ship.")
                    lbl2.Caption = "Place Your 'Carrier'."
                    GoTo B:
                End If
                Else
                    lbl2.Caption = "I Can't Let You Do That Sir."
                    PlaceDirection(s) = False
                    imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                    MsgBox ("You can't place your Carrier because it is off the grid.")
                    lbl2.Caption = "Place Your 'Carrier'."
                    GoTo B:
                End If
                End If
            End If
            Else
                lbl2.Caption = "Error."
                PlaceDirection(s) = False
                imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                imgCellA(i(0)).Picture = LoadPicture(App.Path & "\Images\Grid.gif")
                MsgBox ("You can't place your Carrier because it is collided with another ship.")
                lbl2.Caption = "Place Your 'Carrier'."
                GoTo B:
            End If
            
            
            PlaceDirection(s) = True
            'Temporary Storage of Last Row, Col, I
            C(0) = Col
            R(0) = Row
            i(0) = Index
            
        End If
        
    
    
    If Turn = 1 And (Index < 200 And Index >= 100) Then
        imgCellA(Index).Picture = LoadPicture(App.Path & "\Images\Select.gif")
    End If
    
B:
End Sub

Private Sub Shot()

    'Shot
    
End Sub

