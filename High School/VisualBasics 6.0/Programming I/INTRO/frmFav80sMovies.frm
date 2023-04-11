VERSION 5.00
Begin VB.Form Fav80sMovies 
   BackColor       =   &H00000000&
   Caption         =   "Favorite 80's Movies"
   ClientHeight    =   6405
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7785
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   6405
   ScaleWidth      =   7785
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdGhostbusters 
      Caption         =   "Ghostbusters"
      Height          =   975
      Left            =   5520
      TabIndex        =   2
      Top             =   120
      Width           =   1575
   End
   Begin VB.CommandButton cmdBTTF 
      Caption         =   "Back To The Future"
      Height          =   975
      Left            =   3120
      TabIndex        =   1
      Top             =   120
      Width           =   1455
   End
   Begin VB.CommandButton cmdTerminator 
      Caption         =   "Terminator"
      Height          =   975
      Left            =   600
      TabIndex        =   0
      Top             =   120
      Width           =   1455
   End
   Begin VB.Label lblInfo 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Click on one of the Buttons"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1575
      Left            =   480
      TabIndex        =   3
      Top             =   1200
      Width           =   6615
   End
   Begin VB.Image imgPic 
      Height          =   3375
      Left            =   2280
      Stretch         =   -1  'True
      Top             =   2880
      Width           =   3015
   End
End
Attribute VB_Name = "Fav80sMovies"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBTTF_Click()

    lblInfo.Caption = "Back To The Future is a science fiction 1985 movie that starts out with a scientist, Dr. Emmett 'Doc' Brown, who is trying to invent the Time Machine.  There is a boy by the name Marty McFly of who helps him as his assistant from time to time.  This Movie is one of my all time favorites of the 80's."
    imgPic.Picture = LoadPicture("H:\Programming I\PICS\BackToTheFuture.jpg")

End Sub

Private Sub cmdGhostbusters_Click()

    lblInfo.Caption = "Ghostbusters is a 1984 supernatural comedy movie about 3 parapsychologists by the name of Peter Venkman, Raymond Stantz, and Egon Spengler who started a Ghost Catching Business in an old abandoned firehouse.  I remember watching this on the Televison.  It was amazing."
    imgPic.Picture = LoadPicture("H:\Programming I\PICS\KCGhostbusters Movie Poster.jpg")

End Sub

Private Sub cmdTerminator_Click()

    lblInfo.Caption = "The Terminator is a movie which starts out in the future which then everything is chaotic and horrible.  A machine in the future called the 'Terminator' is then sent back in time to find and terminate a person named John Connor.  I liked it for its suspense and action."
    imgPic.Picture = LoadPicture("H:\Programming I\PICS\Terminator-1984-Poster.jpg")
    
End Sub

Private Sub lblInfo1_Click()

End Sub
