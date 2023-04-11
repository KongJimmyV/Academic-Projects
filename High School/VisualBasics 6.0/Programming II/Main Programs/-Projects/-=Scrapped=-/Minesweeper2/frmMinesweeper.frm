VERSION 5.00
Begin VB.Form frmMinesweeper 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Minesawerpper Sauce"
   ClientHeight    =   10455
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   11895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10455
   ScaleWidth      =   11895
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmrLoadImages 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   360
      Top             =   1680
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   360
      Top             =   1080
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   200
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   199
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   198
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   197
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   196
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   195
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   194
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   193
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   192
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   191
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   190
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   189
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   188
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   187
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   186
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   185
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   184
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   183
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   182
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   181
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   180
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   179
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   178
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   177
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   176
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   175
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   174
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   173
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   172
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   171
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   170
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   169
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   168
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   167
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   166
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   165
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   164
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   163
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   162
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   161
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   160
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   159
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   158
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   157
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   156
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   155
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   154
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   153
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   152
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   151
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   150
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   149
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   148
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   147
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   146
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   145
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   144
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   143
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   142
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   141
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   140
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   139
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   138
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   137
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   136
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   135
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   134
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   133
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   132
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   131
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   130
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   129
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   128
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   127
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   126
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   125
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   124
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   123
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   122
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   121
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   120
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   119
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   118
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   117
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   116
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   115
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   114
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   113
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   112
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   111
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   110
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   109
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   108
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   107
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   106
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   105
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   104
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   103
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   102
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   101
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   100
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   99
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   98
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   97
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   96
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   95
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   94
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   93
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   92
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   91
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   90
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   89
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   88
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   87
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   86
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   85
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   84
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   83
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   82
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   81
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   80
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   79
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   78
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   77
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   76
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   75
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   74
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   73
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   72
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   71
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   70
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   69
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   68
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   67
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   66
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   65
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   64
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   63
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   62
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   61
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   60
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   59
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   58
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   57
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   56
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   55
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   54
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   53
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   52
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   51
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   50
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   49
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   48
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   47
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   46
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   45
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   44
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   43
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   42
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   41
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   40
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   39
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   38
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   37
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   36
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   35
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   34
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   33
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   32
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   31
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   30
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   29
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   28
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   27
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   26
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   25
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   24
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   23
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   22
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   21
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   20
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   19
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   18
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   17
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   16
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   15
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   14
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   13
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   12
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   11
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   10
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   9
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   8
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   7
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   6
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   5
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   4
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   3
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   2
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   1
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Image imgCell 
      Height          =   375
      Index           =   0
      Left            =   360
      Stretch         =   -1  'True
      Top             =   360
      Width           =   375
   End
End
Attribute VB_Name = "frmMinesweeper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'i = ((-1 * (R * 10)) + 100) + ((C * 1) - 10)
'Option Explicit

Dim t As Integer
Dim Index As Integer

Private Sub Form_Load()
    
'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
'Load All Images

'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    
'Load Game
    'Call Init_Game
    XMaze = XTemp
    YMaze = YTemp
    Bomb = BTemp
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Button = vbLeftButton Then
        
        MsgBox "You", vbCritical, "Error"
        
    End If
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub imgCell_Click(Index As Integer)

    Dim IsBomb As Boolean
    
    'Check Cell For Bomb
    If imgCell(Index).Tag = "B" Then IsBomb = True
    If imgCell(Index).Tag <> "B" Then IsBomb = False
    
    
    'Is It A Bomb?
    If IsBomb = True Then
        MsgBox "u fool.", vbCritical, "Error"
    End If
    
    If IsBomb = False Then
        MsgBox "nice.", vbCritical, "What? Error"
    End If
    
End Sub

