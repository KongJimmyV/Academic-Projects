VERSION 5.00
Begin VB.Form frmIndividuals 
   BackColor       =   &H00000000&
   Caption         =   "Individuals"
   ClientHeight    =   8055
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   14895
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   8055
   ScaleWidth      =   14895
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstIndividuals 
      Height          =   4155
      ItemData        =   "frmIndividuals.frx":0000
      Left            =   720
      List            =   "frmIndividuals.frx":0007
      TabIndex        =   0
      Top             =   2400
      Width           =   5535
   End
   Begin VB.Image imgLogo 
      Height          =   1575
      Left            =   1080
      Picture         =   "frmIndividuals.frx":002A
      Stretch         =   -1  'True
      Top             =   480
      Width           =   4695
   End
   Begin VB.Image imgInfo 
      Height          =   5295
      Left            =   8520
      Stretch         =   -1  'True
      Top             =   240
      Width           =   4455
   End
   Begin VB.Label lblInfo 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "INFO: Pick one of the Individuals to see information about each one."
      Height          =   1815
      Left            =   7560
      TabIndex        =   1
      Top             =   6000
      Width           =   6375
   End
End
Attribute VB_Name = "frmIndividuals"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

    lstIndividuals.AddItem ("Rick Harrison")
    lstIndividuals.AddItem ("Austin 'Chumlee' Russell")
    lstIndividuals.AddItem ("Corey Harrison")
    
End Sub

Private Sub lstIndividuals_Click()

    Select Case lstIndividuals.Text
    '/////////////////////////////////////////////////////////////////////////////////////////////////////////
    
        Case "Pick one of the Individuals: "
            lblInfo.Caption = "INFO: Pick one of the Individuals to see information about each one."
            imgInfo.Picture = LoadPicture("")
        Case "Rick Harrison"
            lblInfo.Caption = "INFO: Richard Kevin Harrison is a Las Vegas businessman and reality television personality, best known as the co-owner of the World Famous Gold and Silver Pawn Shop, as featured on the History series Pawn Stars.  Harrison is co-owner of the pawn shop with his father Richard Benjamin Harrison, which they founded in 1988 when Harrison Jr. was 23.  Harrison dropped out of high school in order to ''pursue his career selling $2000 fake Gucci bags''."
            imgInfo.Picture = LoadPicture("H:\Programming I\PICS\prjIndividuals Images\Individual - Rick-Harrison.jpg")
        Case "Austin 'Chumlee' Russell"
            lblInfo.Caption = "INFO: Austin Chumlee Russell is an American reality television star with a net worth of $600 thousand and a salary per episode $25,000.  Austin Chumlee Russell acquired that net worth as a cast member of the History Channel reality show Pawn Stars. He works behind the counter of the pawnshop and has a special interest in pinball machines.  The show follows the goings-on at the Las Vegas based 24-hour Gold & Silver Pawn Shop.  Austin famously was able to talk a local Maserati shop into selling him a $100,000 car for only $85,000 proving his skills as a haggler.  Chumlee got the job because he is Corey Harrison’s childhood best friend."
            imgInfo.Picture = LoadPicture("H:\Programming I\PICS\prjIndividuals Images\Individual - Austin-Chumlee-Russell-Net-Worth.jpg")
        Case "Corey Harrison"
            lblInfo.Caption = "INFO: Corey Harrison began working at the pawnshop at the age of 9.  Expertly trained in the art of appraisal, Corey not only has the brains to spot a cheat but the brawn to back it up.  He is not afraid to throw his muscle around, especially when it comes to protecting his family.  He also handles everything when it comes to hiring and firing employees and managing eBay clients.  Oftentimes treated like a slave, Rick believes that Corey needs to earn his keep.  Without a real stake in the business, Corey is hoping that all of his hard work pays off."
            imgInfo.Picture = LoadPicture("H:\Programming I\PICS\prjIndividuals Images\Individual - Corey-Harrison.jpg")
            
    '/////////////////////////////////////////////////////////////////////////////////////////////////////////
    End Select
    
End Sub
