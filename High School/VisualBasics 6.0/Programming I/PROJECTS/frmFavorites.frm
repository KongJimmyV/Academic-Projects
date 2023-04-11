VERSION 5.00
Begin VB.Form frmFavorites 
   BackColor       =   &H00000000&
   Caption         =   "Favorites"
   ClientHeight    =   6645
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9900
   ForeColor       =   &H00000000&
   LinkTopic       =   "Form1"
   ScaleHeight     =   6645
   ScaleWidth      =   9900
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrEnd 
      Enabled         =   0   'False
      Interval        =   2
      Left            =   960
      Top             =   5880
   End
   Begin VB.CommandButton cmdWirelessMouse 
      Caption         =   "Wireless Mouse"
      Height          =   855
      Left            =   3840
      TabIndex        =   16
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CommandButton cmdSummer 
      Caption         =   "Summer"
      Height          =   855
      Left            =   2160
      TabIndex        =   15
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CommandButton cmdStarcraft 
      Caption         =   "Starcraft"
      Height          =   855
      Left            =   480
      TabIndex        =   14
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End"
      Height          =   495
      Left            =   240
      TabIndex        =   12
      Top             =   5880
      Width           =   735
   End
   Begin VB.CommandButton cmdSierra 
      Caption         =   "Sierra Mist"
      Height          =   855
      Left            =   3840
      TabIndex        =   11
      Top             =   3600
      Width           =   1455
   End
   Begin VB.CommandButton cmdPS3C 
      Caption         =   "PS3 Controller"
      Height          =   855
      Left            =   2160
      TabIndex        =   10
      Top             =   3600
      Width           =   1455
   End
   Begin VB.CommandButton cmdPokemon 
      Caption         =   "Pokemon B/W"
      Height          =   855
      Left            =   480
      TabIndex        =   9
      Top             =   3600
      Width           =   1455
   End
   Begin VB.CommandButton cmdPencil 
      Caption         =   "Ticonderoga"
      Height          =   855
      Left            =   3840
      TabIndex        =   8
      Top             =   2520
      Width           =   1455
   End
   Begin VB.CommandButton cmdNSMBW 
      Caption         =   "New Super Mario Bros. Wii"
      Height          =   855
      Left            =   2160
      TabIndex        =   7
      Top             =   2520
      Width           =   1455
   End
   Begin VB.CommandButton cmdJKRowling 
      Caption         =   "J.K. Rowling"
      Height          =   855
      Left            =   480
      TabIndex        =   6
      Top             =   2520
      Width           =   1455
   End
   Begin VB.CommandButton cmdFerrari 
      Caption         =   "Ferrari"
      Height          =   855
      Left            =   3840
      TabIndex        =   5
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdDrawing 
      Caption         =   "Drawing"
      Height          =   855
      Left            =   2160
      TabIndex        =   4
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdPC 
      Caption         =   "PC"
      Height          =   855
      Left            =   480
      TabIndex        =   3
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdCometBird 
      Caption         =   "CometBird"
      Height          =   855
      Left            =   3840
      TabIndex        =   2
      Top             =   360
      Width           =   1455
   End
   Begin VB.CommandButton cmdAvast7 
      Caption         =   "Avast 7"
      Height          =   855
      Left            =   2160
      TabIndex        =   1
      Top             =   360
      Width           =   1455
   End
   Begin VB.CommandButton cmdAW 
      BackColor       =   &H80000016&
      Caption         =   "A/W Root Beer"
      Height          =   855
      Left            =   480
      TabIndex        =   0
      Top             =   360
      Width           =   1455
   End
   Begin VB.Label lblPICS 
      Alignment       =   2  'Center
      Caption         =   "Click a Button To Get Started."
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2655
      Left            =   5640
      TabIndex        =   13
      Top             =   3240
      Width           =   3735
   End
   Begin VB.Image imgPICS 
      Height          =   2895
      Left            =   5640
      Picture         =   "frmFavorites.frx":0000
      Stretch         =   -1  'True
      Top             =   360
      Width           =   3735
   End
End
Attribute VB_Name = "frmFavorites"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdAvast7_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - Avast-Free-Antivirus-7-1.jpg")
    lblPICS.Caption = "Avast is one of my favorites because its an excellent free antivirus and works just as good as the other antiviruses out there."

End Sub

Private Sub cmdAW_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - A&W Root Beer.jpg")
    lblPICS.Caption = "A/W is one of my favorite Drinks because of the taste and how you can make a root beer float out of it with ice cream."

End Sub

Private Sub cmdCometBird_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - CometBird.jpg")
    lblPICS.Caption = "This is one of the best browsers that I've used.  It's my favorite because it works fast and can do most of the tasks other browsers can't do or don't have for me."
    
End Sub

Private Sub cmdDrawing_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - Drawing.jpg")
    lblPICS.Caption = "One of my best and favorite things to do.  I draw during my freetime and learn while doing it.  I started doing this during my Sophomore Year at Central High School.  I got inspired by my Art Teacher, Ms Aschenbrener."

End Sub

Private Sub cmdEnd_Click()

    MsgBox ("Good bye.")
    
    tmrEnd.Enabled = True

End Sub

Private Sub cmdFerrari_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - Ferrari.jpg")
    lblPICS.Caption = "I like this car ever since I've seen it in games, tv shows, and because of how fast it goes.  I don't remember when but it became one of my favorite types of race cars.  I don't know why but it just looks awesome."

End Sub

Private Sub cmdJKRowling_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - JK-Rowling_1002500c.jpg")
    lblPICS.Caption = "J.K. Rowling is one of my favorite authors, especially for the Harry Potter series.  This started when my Sister showed me some books she was reading and got me reading them immediately."

End Sub

Private Sub cmdNSMBW_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - new-super-mario-bros-wii-walkthrough.jpg")
    lblPICS.Caption = "I love this game for its characters and its gameplay.  It's my favorite because its fun playing and challenging along with the original things in it.  I liked it when I first got to play it and when people suggested it was a good game."

End Sub

Private Sub cmdPC_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - desktop-pc.jpg")
    lblPICS.Caption = "PC's are my most favorite because they can be upgraded, changed, and they can do many things such as, gaming, drawing, writing, watching videos, and reading.  I started liking PCs when my Brother first showed me how to use one.  What got me going was the intresting and entertaining things you could do on the PC."
    
End Sub

Private Sub cmdPencil_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - PencilTiconderoga.jpg")
    lblPICS.Caption = "These brand of pencils are my favorite because they are the best drawing pencils.  I use these Pencils mainly for Drawing.  They're smooth and shade nicely along the paper I draw on.  I only use these Pencils for other things only when it is nessecery."

End Sub

Private Sub cmdPokemon_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - Pokemon B-W.jpg")
    lblPICS.Caption = "This awesome game became my favorite because of the variety of things you can do in it.  I mainly like it for the Storyline.  I started liking Pokemon because my Sister played it too.  She'd let me play when I asked her.  Pokemon is awesome!"

End Sub

Private Sub cmdPS3C_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - PS3 Controller.jpg")
    lblPICS.Caption = "The PS3 Controller is one of my favorite controllers because of it's design and confort when holding it.  I also like the button layout, its easy to understand and use."

End Sub

Private Sub cmdSierra_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - Sierra Mist.jpg")
    lblPICS.Caption = "Sierra Mist Natural is my second favorite soda.  It tastes good and refreshing, and its healthier than most soda that I've seen."

End Sub

Private Sub cmdStarcraft_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - StarCraft_box_art.jpg")
    lblPICS.Caption = "Starcraft is one of my original favorite games.  I loved the gameplay and the story.  I liked it mainly for the online play and local play.  The custom games were the best since they were creative or just simply fun."

End Sub

Private Sub cmdSummer_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - Summer Season 2012.jpg")
    lblPICS.Caption = "Summer is my favorite season because it has the warmth, brightness, and not to mention theres no school during most of the summer.  Don't get me wrong, I like school a lot but a break is always something nice to have.  Althogh the summer brings some bad things, its better than being cold and freezing days and nights."

End Sub

Private Sub cmdWirelessMouse_Click()

    imgPICS = LoadPicture("H:\Programming I\PICS\FAVPIC - wireless-mouse-m215-24y6-640.jpg")
    lblPICS.Caption = "My favorite type of mouses are the Wireless Mouses made by Logitech.  I like these mouses because they work and because they are confortable to hold.  A Wireless Mouse by definition is: A mouse with no cord that transmits infrared or radio signals (RF) to a base station receiver."

End Sub

Private Sub tmrEnd_Timer()

    imgPICS.Width = imgPICS.Width * 0.9
    imgPICS.Height = imgPICS.Height * 0.9
    
    If imgPICS.Width < 20 Then
        tmrEnd.Enabled = False
        End
    End If
    
End Sub
