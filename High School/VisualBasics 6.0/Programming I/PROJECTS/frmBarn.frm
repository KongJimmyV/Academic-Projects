VERSION 5.00
Begin VB.Form frmBarn 
   BackColor       =   &H00000000&
   Caption         =   "Barn"
   ClientHeight    =   9615
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   18255
   FillColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   9615
   ScaleWidth      =   18255
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdResetOrder 
      Caption         =   "Reset Order"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   8520
      TabIndex        =   36
      Top             =   8160
      Width           =   1335
   End
   Begin VB.Frame fraSides 
      BackColor       =   &H00000000&
      Caption         =   "Sides"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   3495
      Left            =   7680
      TabIndex        =   29
      Top             =   1200
      Width           =   3015
      Begin VB.CheckBox chkMexicanRice 
         BackColor       =   &H00000000&
         Caption         =   "Mexican Rice ($1.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   35
         Top             =   3000
         Width           =   2775
      End
      Begin VB.CheckBox chkChipsPDG 
         BackColor       =   &H00000000&
         Caption         =   "Chips n' Pico de Gallo ($2.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   34
         Top             =   2520
         Width           =   2775
      End
      Begin VB.CheckBox chkCheesyFP 
         BackColor       =   &H00000000&
         Caption         =   "Cheesy Fiesta Potatoes ($2.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   33
         Top             =   2040
         Width           =   2775
      End
      Begin VB.CheckBox chkCaramelAppleE 
         BackColor       =   &H00000000&
         Caption         =   "Caramel Apple Empanada ($1.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   32
         Top             =   1560
         Width           =   2775
      End
      Begin VB.CheckBox chkCinnamonT 
         BackColor       =   &H00000000&
         Caption         =   "Cinnamon Twist ($1.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   31
         Top             =   1080
         Width           =   2775
      End
      Begin VB.CheckBox chkNachos 
         BackColor       =   &H00000000&
         Caption         =   "Nachos ($1.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   30
         Top             =   600
         Width           =   2775
      End
   End
   Begin VB.Frame fraDrinks 
      BackColor       =   &H00000000&
      Caption         =   "Drinks"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   3495
      Left            =   14640
      TabIndex        =   21
      Top             =   1200
      Width           =   3015
      Begin VB.CheckBox chkFruitJuice 
         BackColor       =   &H00000000&
         Caption         =   "Fruit Juice ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   27
         Top             =   3000
         Width           =   2775
      End
      Begin VB.CheckBox chkLemonade 
         BackColor       =   &H00000000&
         Caption         =   "Lemonade ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   26
         Top             =   2520
         Width           =   2775
      End
      Begin VB.CheckBox chkCocaCola 
         BackColor       =   &H00000000&
         Caption         =   "Coca Cola ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   25
         Top             =   2040
         Width           =   2775
      End
      Begin VB.CheckBox chkSprite 
         BackColor       =   &H00000000&
         Caption         =   "Sprite ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   24
         Top             =   1560
         Width           =   2775
      End
      Begin VB.CheckBox chkPepsi 
         BackColor       =   &H00000000&
         Caption         =   "Pepsi ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   23
         Top             =   1080
         Width           =   2775
      End
      Begin VB.CheckBox chkWater 
         BackColor       =   &H00000000&
         Caption         =   "Water ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   22
         Top             =   600
         Width           =   2775
      End
   End
   Begin VB.Frame fraDesserts 
      BackColor       =   &H00000000&
      Caption         =   "Desserts"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   3495
      Left            =   11160
      TabIndex        =   15
      Top             =   1200
      Width           =   3015
      Begin VB.CheckBox chkCakeS 
         BackColor       =   &H00000000&
         Caption         =   "Cake Slice ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   20
         Top             =   3000
         Width           =   2775
      End
      Begin VB.CheckBox chkCookie 
         BackColor       =   &H00000000&
         Caption         =   "Cookie ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   19
         Top             =   2400
         Width           =   2775
      End
      Begin VB.CheckBox chkJello 
         BackColor       =   &H00000000&
         Caption         =   "Jello ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   18
         Top             =   1800
         Width           =   2775
      End
      Begin VB.CheckBox chkBrownie 
         BackColor       =   &H00000000&
         Caption         =   "Brownie ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   17
         Top             =   1200
         Width           =   2775
      End
      Begin VB.CheckBox chkIceCream 
         BackColor       =   &H00000000&
         Caption         =   "Ice Cream ($0.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   16
         Top             =   600
         Width           =   2775
      End
   End
   Begin VB.Frame fraToppings 
      BackColor       =   &H00000000&
      Caption         =   "Toppings"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   3495
      Left            =   3960
      TabIndex        =   8
      Top             =   1200
      Width           =   3255
      Begin VB.CheckBox chkChTomatoes 
         BackColor       =   &H00000000&
         Caption         =   "Chopped Tomatoes"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   14
         Top             =   3000
         Width           =   3015
      End
      Begin VB.CheckBox chkChicken 
         BackColor       =   &H00000000&
         Caption         =   "Chicken"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   1080
         Width           =   3015
      End
      Begin VB.CheckBox chkTSauce 
         BackColor       =   &H00000000&
         Caption         =   "Taco Sauce"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   2040
         Width           =   3015
      End
      Begin VB.CheckBox chkBeans 
         BackColor       =   &H00000000&
         Caption         =   "Beans"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   1560
         Width           =   3015
      End
      Begin VB.CheckBox chkCheese 
         BackColor       =   &H00000000&
         Caption         =   "Cheese"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   2520
         Width           =   3015
      End
      Begin VB.CheckBox chkBeef 
         BackColor       =   &H00000000&
         Caption         =   "Beef"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   9
         Top             =   600
         Width           =   3015
      End
   End
   Begin VB.Frame fraType 
      BackColor       =   &H00000000&
      Caption         =   "Types"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   3495
      Left            =   480
      TabIndex        =   1
      Top             =   1200
      Width           =   3015
      Begin VB.OptionButton optFishTaco 
         BackColor       =   &H00000000&
         Caption         =   "Fish Taco ($3.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   3000
         Width           =   2775
      End
      Begin VB.OptionButton optGrilledTaco 
         BackColor       =   &H00000000&
         Caption         =   "Grilled Taco ($3.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   2520
         Width           =   2775
      End
      Begin VB.OptionButton optBurrito 
         BackColor       =   &H00000000&
         Caption         =   "Burrito ($4.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   2040
         Width           =   2775
      End
      Begin VB.OptionButton optTortillas 
         BackColor       =   &H00000000&
         Caption         =   "Tortillas ($4.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   1560
         Width           =   2775
      End
      Begin VB.OptionButton optHardS 
         BackColor       =   &H00000000&
         Caption         =   "Hard Shell ($3.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   1080
         Width           =   2775
      End
      Begin VB.OptionButton optSoftS 
         BackColor       =   &H00000000&
         Caption         =   "Soft Shell ($3.99)"
         ForeColor       =   &H000000FF&
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   600
         Width           =   2775
      End
   End
   Begin VB.Image imgChipsPDG 
      Height          =   975
      Left            =   7920
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Image imgMexicanRice 
      Height          =   975
      Left            =   9240
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Image imgCaramelAppleE 
      Height          =   975
      Left            =   7920
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgCheesyFP 
      Height          =   975
      Left            =   9240
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgNachos 
      Height          =   975
      Left            =   7920
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgCinnamonT 
      Height          =   975
      Left            =   9240
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Label lblCostAmount 
      BackColor       =   &H00000000&
      Caption         =   "$0.00"
      BeginProperty Font 
         Name            =   "System"
         Size            =   29.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   855
      Left            =   14760
      TabIndex        =   28
      Top             =   8280
      Width           =   2775
   End
   Begin VB.Image imgFruitJuice 
      Height          =   975
      Left            =   16200
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Image imgLemonade 
      Height          =   975
      Left            =   14760
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Image imgCocaCola 
      Height          =   975
      Left            =   16200
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgSprite 
      Height          =   975
      Left            =   14760
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgPepsi 
      Height          =   975
      Left            =   16200
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgWater 
      Height          =   975
      Left            =   14760
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgCakeS 
      Height          =   975
      Left            =   12120
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Image imgCookie 
      Height          =   975
      Left            =   12840
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgJello 
      Height          =   975
      Left            =   11400
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgBrownie 
      Height          =   975
      Left            =   12840
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgIceCream 
      Height          =   975
      Left            =   11400
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgTSauce 
      Height          =   975
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgBeans 
      Height          =   975
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Image imgChTomatoes 
      Height          =   975
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Image imgChicken 
      Height          =   975
      Left            =   5640
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgBeef 
      Height          =   975
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   1215
   End
   Begin VB.Image imgCheese 
      Height          =   975
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Image imgTacoType 
      Height          =   2895
      Left            =   480
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   3015
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "Jim's Taco Barn"
      BeginProperty Font 
         Name            =   "Vivaldi"
         Size            =   36
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   735
      Left            =   480
      TabIndex        =   0
      Top             =   240
      Width           =   16935
   End
End
Attribute VB_Name = "frmBarn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim IceCreamCost As Single
Dim BrownieCost As Single
Dim JelloCost As Single
Dim CookieCost As Single
Dim CakeSliceCost As Single
Dim NachoCost As Single
Dim CinnamonTwistCost As Single
Dim CaramelAppleEmpanadaCost As Single
Dim CheesyFiestaPotatoesCost As Single
Dim ChipsNPicoDeGalloCost As Single
Dim MexicanRiceCost As Single
Dim WaterCost As Single
Dim PepsiCost As Single
Dim SpriteCost As Single
Dim CocaColaCost As Single
Dim LemonadeCost As Single
Dim FruitJuiceCost As Single
Dim TotalCost As Single
Dim TypeCost As Single


Private Sub chkBeans_Click()

 If chkBeans.Value = 1 Then
        imgBeans = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Beans.jpg")
    Else
        imgBeans = LoadPicture("")
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkBeef_Click()

 If chkBeef.Value = 1 Then
        imgBeef = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Beef.jpg")
    Else
        imgBeef = LoadPicture("")
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkBrownie_Click()

 If chkBrownie.Value = 1 Then
        BrownieCost = 0.99
        imgBrownie = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Brownie.jpg")
    Else
        imgBrownie = LoadPicture("")
        BrownieCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCakeS_Click()

 If chkCakeS.Value = 1 Then
        CakeSliceCost = 0.99
        imgCakeS = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Cake Slice.jpg")
    Else
        imgCakeS = LoadPicture("")
        CakeSliceCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCaramelAppleE_Click()

 If chkCaramelAppleE.Value = 1 Then
        CaramelAppleEmpanadaCost = 1.99
        imgCaramelAppleE = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Caramel Apple Empanada.jpg")
    Else
        imgCaramelAppleE = LoadPicture("")
        CaramelAppleEmpanadaCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCheese_Click()

 If chkCheese.Value = 1 Then
        imgCheese = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Cheese.jpg")
    Else
        imgCheese = LoadPicture("")
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCheesyFP_Click()

 If chkCheesyFP.Value = 1 Then
        CheesyFiestaPotatoesCost = 1.99
        imgCheesyFP = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Cheesy Fiesta Potatoes.jpg")
    Else
        imgCheesyFP = LoadPicture("")
        CheesyFiestaPotatoesCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkChicken_Click()

 If chkChicken.Value = 1 Then
        imgChicken = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Chicken2.jpg")
    Else
        imgChicken = LoadPicture("")
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkChipsPDG_Click()

 If chkChipsPDG.Value = 1 Then
        ChipsNPicoDeGalloCost = 0.99
        imgChipsPDG = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Chips n' Pico de Gallo.jpg")
    Else
        imgChipsPDG = LoadPicture("")
        ChipsNPicoDeGalloCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkChTomatoes_Click()

 If chkChTomatoes.Value = 1 Then
        imgChTomatoes = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Chopped Tomatoes.jpg")
    Else
        imgChTomatoes = LoadPicture("")
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCinnamonT_Click()

 If chkCinnamonT.Value = 1 Then
        CinnamonTwistCost = 1.99
        imgCinnamonT = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Cinnamon Twists.jpg")
    Else
        imgCinnamonT = LoadPicture("")
        CinnamonTwistCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCocaCola_Click()

 If chkCocaCola.Value = 1 Then
        CocaColaCost = 0.99
        imgCocaCola = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Coca Cola.jpg")
    Else
        imgCocaCola = LoadPicture("")
        CocaColaCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkCookie_Click()

 If chkCookie.Value = 1 Then
        CookieCost = 0.99
        imgCookie = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Cookie.jpg")
    Else
        imgCookie = LoadPicture("")
        CookieCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkFruitJuice_Click()

 If chkFruitJuice.Value = 1 Then
        FruitJuiceCost = 0.99
        imgFruitJuice = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Fruit Juice.jpg")
    Else
        imgFruitJuice = LoadPicture("")
        FruitJuiceCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkIceCream_Click()

 If chkIceCream.Value = 1 Then
        IceCreamCost = 0.99
        imgIceCream = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Ice Cream.jpg")
    Else
        imgIceCream = LoadPicture("")
        IceCreamCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkJello_Click()

 If chkJello.Value = 1 Then
        JelloCost = 0.99
        imgJello = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Jello.jpg")
    Else
        imgJello = LoadPicture("")
        JelloCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkLemonade_Click()

 If chkLemonade.Value = 1 Then
        LemonadeCost = 0.99
        imgLemonade = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Lemonade.jpg")
    Else
        imgLemonade = LoadPicture("")
        LemonadeCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkMexicanRice_Click()

 If chkMexicanRice.Value = 1 Then
        MexicanRiceCost = 1.99
        imgMexicanRice = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Mexican Rice.jpg")
    Else
        imgMexicanRice = LoadPicture("")
        MexicanRiceCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkNachos_Click()

 If chkNachos.Value = 1 Then
        NachoCost = 1.99
        imgNachos = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Nachos.jpg")
    Else
        imgNachos = LoadPicture("")
        NachoCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkPepsi_Click()

 If chkPepsi.Value = 1 Then
        PepsiCost = 0.99
        imgPepsi = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Pepsi.jpg")
    Else
        imgPepsi = LoadPicture("")
        PepsiCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkSprite_Click()

 If chkSprite.Value = 1 Then
        SpriteCost = 0.99
        imgSprite = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Sprite.jpg")
    Else
        imgSprite = LoadPicture("")
        SpriteCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkTSauce_Click()

 If chkTSauce.Value = 1 Then
        imgTSauce = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Taco Sauce.jpg")
    Else
        imgTSauce = LoadPicture("")
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub chkWater_Click()

 If chkWater.Value = 1 Then
        WaterCost = 0.99
        imgWater = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Water.jpg")
    Else
        imgWater = LoadPicture("")
        WaterCost = 0
    End If
    
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")

End Sub

Private Sub cmdResetOrder_Click()
    
    IceCreamCost = 0
    BrownieCost = 0
    JelloCost = 0
    CookieCost = 0
    CakeSliceCost = 0
    NachoCost = 0
    CinnamonTwistCost = 0
    CaramelAppleEmpanadaCost = 0
    CheesyFiestaPotatoesCost = 0
    ChipsNPicoDeGalloCost = 0
    MexicanRiceCost = 0
    WaterCost = 0
    PepsiCost = 0
    SpriteCost = 0
    CocaColaCost = 0
    LemonadeCost = 0
    FruitJuiceCost = 0
    TotalCost = 0
    TypeCost = 0

    optSoftS.Value = False
    optHardS.Value = False
    optTortillas.Value = False
    optBurrito.Value = False
    optGrilledTaco.Value = False
    optFishTaco.Value = False
    
    chkBeef.Value = 0
    chkChicken.Value = 0
    chkBeans.Value = 0
    chkTSauce.Value = 0
    chkCheese.Value = 0
    chkChTomatoes.Value = 0
    chkNachos.Value = 0
    chkCinnamonT.Value = 0
    chkCaramelAppleE.Value = 0
    chkCheesyFP.Value = 0
    chkChipsPDG.Value = 0
    chkMexicanRice.Value = 0
    chkIceCream.Value = 0
    chkBrownie.Value = 0
    chkJello.Value = 0
    chkCookie.Value = 0
    chkCakeS.Value = 0
    chkWater.Value = 0
    chkPepsi.Value = 0
    chkSprite.Value = 0
    chkCocaCola.Value = 0
    chkLemonade.Value = 0
    chkFruitJuice.Value = 0
    
    lblCostAmount.Caption = 0
    lblCostAmount.Caption = Format(TotalCost, "Currency")
    
    imgTacoType.Picture = LoadPicture("")
    imgBeef.Picture = LoadPicture("")
    imgChicken.Picture = LoadPicture("")
    imgBeans.Picture = LoadPicture("")
    imgTSauce.Picture = LoadPicture("")
    imgCheese.Picture = LoadPicture("")
    imgChTomatoes.Picture = LoadPicture("")
    imgNachos.Picture = LoadPicture("")
    imgCinnamonT.Picture = LoadPicture("")
    imgCaramelAppleE.Picture = LoadPicture("")
    imgCheesyFP.Picture = LoadPicture("")
    imgChipsPDG.Picture = LoadPicture("")
    imgMexicanRice.Picture = LoadPicture("")
    imgIceCream.Picture = LoadPicture("")
    imgBrownie.Picture = LoadPicture("")
    imgJello.Picture = LoadPicture("")
    imgCookie.Picture = LoadPicture("")
    imgCakeS.Picture = LoadPicture("")
    imgWater.Picture = LoadPicture("")
    imgPepsi.Picture = LoadPicture("")
    imgSprite.Picture = LoadPicture("")
    imgCocaCola.Picture = LoadPicture("")
    imgLemonade.Picture = LoadPicture("")
    imgFruitJuice.Picture = LoadPicture("")
    
End Sub

Private Sub optGrilledTaco_Click()
    
    imgTacoType = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Grilled Taco.jpg")
    TypeCost = 3.99
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")
    
End Sub

Private Sub optBurrito_Click()
    
    imgTacoType = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Burrito Taco.jpg")
    TypeCost = 4.99
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")
    
End Sub

Private Sub optFishTaco_Click()
    
    imgTacoType = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Fish Taco.jpg")
    TypeCost = 3.99
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")
    
End Sub

Private Sub optHardS_Click()
    
    imgTacoType = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - HARDSHELL TACO.jpg")
    TypeCost = 3.99
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")
    
End Sub

Private Sub optSoftS_Click()

    imgTacoType = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - SOFTSHELL TACO.jpg")
    TypeCost = 3.99
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")
    
End Sub

Private Sub optTortillas_Click()
        
    imgTacoType = LoadPicture("H:\Programming I\PICS\FoodBarn Pictures\FOODBARN - Tortilla Taco.jpg")
    TypeCost = 4.99
    TotalCost = TypeCost + IceCreamCost + BrownieCost + JelloCost + CookieCost + CakeSliceCost + NachoCost + CinnamonTwistCost + CaramelAppleEmpanadaCost + CheesyFiestaPotatoesCost + ChipsNPicoDeGalloCost + MexicanRiceCost + WaterCost + PepsiCost + SpriteCost + CocaColaCost + LemonadeCost + FruitJuiceCost
    lblCostAmount.Caption = Format(TotalCost, "Currency")
    
End Sub
