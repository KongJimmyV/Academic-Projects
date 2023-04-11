VERSION 5.00
Begin VB.Form frmBitMapIntro 
   Caption         =   "Bitmap World!!!  :)"
   ClientHeight    =   5655
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   9855
   LinkTopic       =   "Form1"
   ScaleHeight     =   5655
   ScaleWidth      =   9855
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   2
      Interval        =   30
      Left            =   2880
      Top             =   600
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   1
      Interval        =   30
      Left            =   2400
      Top             =   600
   End
   Begin VB.Timer tmrAmmo 
      Enabled         =   0   'False
      Index           =   0
      Interval        =   30
      Left            =   1920
      Top             =   600
   End
   Begin VB.Timer tmrAIfollow 
      Interval        =   1
      Left            =   6240
      Top             =   4680
   End
   Begin VB.Timer tmrEnemyUp 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   6240
      Top             =   2880
   End
   Begin VB.Timer tmrEnemyDown 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   6240
      Top             =   4080
   End
   Begin VB.Timer tmrEnemyLeft 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   5640
      Top             =   3480
   End
   Begin VB.Timer tmrEnemyRight 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   6840
      Top             =   3480
   End
   Begin VB.Timer tmrRight 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   3480
      Top             =   2280
   End
   Begin VB.Timer tmrLeft 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2280
      Top             =   2280
   End
   Begin VB.Timer tmrDown 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2880
      Top             =   2880
   End
   Begin VB.Timer tmrUp 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2880
      Top             =   1680
   End
   Begin VB.Image imgAmmo 
      Height          =   480
      Index           =   2
      Left            =   2880
      Picture         =   "frmBitMap.frx":0000
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Height          =   480
      Index           =   1
      Left            =   2520
      Picture         =   "frmBitMap.frx":08CA
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgAmmo 
      Height          =   480
      Index           =   0
      Left            =   2160
      Picture         =   "frmBitMap.frx":1194
      Stretch         =   -1  'True
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgTarget1 
      Height          =   495
      Index           =   4
      Left            =   3480
      Picture         =   "frmBitMap.frx":1A5E
      Stretch         =   -1  'True
      Top             =   3960
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image imgTarget1 
      Height          =   495
      Index           =   3
      Left            =   3120
      Picture         =   "frmBitMap.frx":2328
      Stretch         =   -1  'True
      Top             =   3960
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image imgTarget1 
      Height          =   495
      Index           =   2
      Left            =   2760
      Picture         =   "frmBitMap.frx":2BF2
      Stretch         =   -1  'True
      Top             =   3960
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image imgTarget1 
      Height          =   495
      Index           =   1
      Left            =   2400
      Picture         =   "frmBitMap.frx":34BC
      Stretch         =   -1  'True
      Top             =   3960
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image imgTarget1 
      Height          =   495
      Index           =   0
      Left            =   2040
      Picture         =   "frmBitMap.frx":3D86
      Stretch         =   -1  'True
      Top             =   3960
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Image imgEnemy 
      Height          =   480
      Left            =   6240
      Picture         =   "frmBitMap.frx":4650
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   480
   End
   Begin VB.Image imgMario 
      Height          =   480
      Left            =   2880
      Picture         =   "frmBitMap.frx":4F1A
      Stretch         =   -1  'True
      Top             =   2160
      Width           =   480
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1500
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1499
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1498
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1497
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1496
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1495
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1494
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1493
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1492
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1491
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1490
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1489
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1488
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1487
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1486
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1485
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1484
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1483
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1482
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1481
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1480
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1479
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1478
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1477
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1476
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1475
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1474
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1473
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1472
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1471
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1470
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1469
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1468
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1467
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1466
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1465
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1464
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1463
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1462
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1461
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1460
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1459
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1458
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1457
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1456
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1455
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1454
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1453
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1452
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1451
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1450
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1449
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1448
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1447
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1446
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1445
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1444
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1443
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1442
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1441
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1440
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1439
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1438
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1437
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1436
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1435
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1434
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1433
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1432
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1431
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1430
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1429
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1428
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1427
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1426
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1425
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1424
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1423
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1422
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1421
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1420
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1419
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1418
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1417
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1416
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1415
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1414
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1413
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1412
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1411
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1410
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1409
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1408
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1407
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1406
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1405
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1404
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1403
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1402
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1401
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1400
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1399
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1398
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1397
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1396
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1395
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1394
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1393
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1392
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1391
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1390
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1389
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1388
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1387
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1386
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1385
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1384
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1383
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1382
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1381
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1380
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1379
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1378
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1377
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1376
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1375
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1374
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1373
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1372
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1371
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1370
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1369
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1368
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1367
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1366
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1365
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1364
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1363
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1362
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1361
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1360
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1359
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1358
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1357
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1356
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1355
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1354
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1353
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1352
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1351
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1350
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1349
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1348
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1347
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1346
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1345
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1344
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1343
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1342
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1341
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1340
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1339
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1338
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1337
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1336
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1335
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1334
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1333
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1332
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1331
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1330
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1329
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1328
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1327
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1326
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1325
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1324
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1323
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1322
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1321
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1320
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1319
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1318
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1317
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1316
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1315
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1314
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1313
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1312
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1311
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1310
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1309
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1308
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1307
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1306
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1305
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1304
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1303
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1302
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1301
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1300
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1299
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1298
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1297
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1296
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1295
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1294
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1293
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1292
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1291
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1290
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1289
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1288
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1287
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1286
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1285
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1284
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1283
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1282
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1281
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1280
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1279
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1278
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1277
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1276
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1275
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1274
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1273
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1272
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1271
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1270
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1269
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1268
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1267
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1266
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1265
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1264
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1263
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1262
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1261
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1260
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1259
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1258
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1257
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1256
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1255
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1254
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1253
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1252
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1251
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1250
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1249
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1248
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1247
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1246
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1245
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1244
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1243
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1242
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1241
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1240
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1239
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1238
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1237
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1236
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1235
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1234
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1233
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1232
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1231
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1230
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1229
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1228
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1227
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1226
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1225
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1224
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1223
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1222
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1221
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1220
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1219
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1218
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1217
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1216
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1215
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1214
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1213
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1212
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1211
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1210
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1209
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1208
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1207
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1206
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1205
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1204
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1203
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1202
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1201
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1200
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1199
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1198
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1197
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1196
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1195
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1194
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1193
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1192
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1191
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1190
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1189
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1188
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1187
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1186
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1185
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1184
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1183
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1182
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1181
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1180
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1179
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1178
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1177
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1176
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1175
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1174
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1173
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1172
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1171
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1170
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1169
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1168
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1167
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1166
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1165
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1164
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1163
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1162
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1161
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1160
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1159
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1158
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1157
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1156
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1155
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1154
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1153
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1152
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1151
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1150
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1149
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1148
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1147
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1146
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1145
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1144
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1143
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1142
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1141
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1140
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1139
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1138
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1137
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1136
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1135
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1134
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1133
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1132
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1131
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1130
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1129
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1128
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1127
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1126
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1125
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1124
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1123
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1122
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1121
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1120
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1119
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1118
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1117
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1116
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1115
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1114
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1113
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1112
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1111
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1110
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1109
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1108
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1107
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1106
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1105
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1104
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1103
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1102
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1101
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1100
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1099
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1098
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1097
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1096
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1095
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1094
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1093
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1092
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1091
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1090
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1089
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1088
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1087
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1086
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1085
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1084
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1083
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1082
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1081
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1080
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1079
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1078
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1077
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1076
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1075
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1074
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1073
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1072
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1071
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1070
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1069
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1068
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1067
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1066
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1065
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1064
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1063
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1062
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1061
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1060
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1059
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1058
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1057
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1056
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1055
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1054
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1053
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1052
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1051
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1050
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1049
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1048
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1047
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1046
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1045
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1044
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1043
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1042
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1041
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1040
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1039
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1038
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1037
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1036
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1035
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1034
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1033
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1032
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1031
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1030
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1029
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1028
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1027
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1026
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1025
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1024
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1023
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1022
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1021
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1020
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1019
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1018
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1017
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1016
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1015
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1014
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1013
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1012
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1011
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1010
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1009
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1008
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1007
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1006
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1005
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1004
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1003
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1002
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1001
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1000
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   999
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   998
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   997
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   996
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   995
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   994
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   993
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   992
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   991
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   990
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   989
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   988
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   987
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   986
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   985
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   984
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   983
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   982
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   981
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   980
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   979
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   978
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   977
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   976
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   975
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   974
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   973
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   972
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   971
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   970
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   969
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   968
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   967
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   966
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   965
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   964
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   963
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   962
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   961
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   960
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   959
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   958
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   957
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   956
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   955
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   954
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   953
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   952
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   951
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   950
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   949
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   948
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   947
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   946
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   945
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   944
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   943
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   942
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   941
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   940
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   939
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   938
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   937
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   936
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   935
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   934
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   933
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   932
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   931
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   930
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   929
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   928
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   927
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   926
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   925
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   924
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   923
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   922
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   921
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   920
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   919
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   918
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   917
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   916
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   915
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   914
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   913
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   912
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   911
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   910
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   909
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   908
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   907
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   906
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   905
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   904
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   903
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   902
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   901
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   900
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   899
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   898
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   897
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   896
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   895
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   894
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   893
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   892
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   891
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   890
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   889
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   888
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   887
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   886
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   885
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   884
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   883
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   882
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   881
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   880
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   879
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   878
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   877
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   876
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   875
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   874
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   873
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   872
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   871
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   870
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   869
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   868
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   867
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   866
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   865
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   864
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   863
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   862
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   861
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   860
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   859
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   858
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   857
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   856
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   855
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   854
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   853
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   852
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   851
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   850
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   849
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   848
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   847
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   846
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   845
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   844
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   843
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   842
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   841
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   840
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   839
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   838
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   837
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   836
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   835
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   834
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   833
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   832
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   831
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   830
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   829
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   828
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   827
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   826
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   825
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   824
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   823
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   822
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   821
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   820
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   819
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   818
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   817
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   816
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   815
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   814
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   813
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   812
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   811
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   810
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   809
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   808
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   807
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   806
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   805
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   804
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   803
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   802
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   801
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   800
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   799
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   798
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   797
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   796
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   795
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   794
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   793
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   792
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   791
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   790
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   789
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   788
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   787
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   786
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   785
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   784
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   783
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   782
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   781
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   780
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   779
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   778
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   777
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   776
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   775
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   774
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   773
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   772
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   771
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   770
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   769
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   768
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   767
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   766
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   765
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   764
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   763
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   762
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   761
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   760
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   759
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   758
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   757
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   756
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   755
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   754
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   753
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   752
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   751
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   750
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   749
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   748
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   747
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   746
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   745
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   744
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   743
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   742
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   741
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   740
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   739
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   738
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   737
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   736
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   735
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   734
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   733
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   732
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   731
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   730
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   729
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   728
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   727
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   726
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   725
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   724
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   723
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   722
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   721
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   720
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   719
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   718
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   717
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   716
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   715
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   714
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   713
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   712
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   711
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   710
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   709
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   708
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   707
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   706
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   705
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   704
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   703
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   702
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   701
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   700
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   699
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   698
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   697
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   696
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   695
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   694
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   693
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   692
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   691
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   690
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   689
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   688
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   687
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   686
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   685
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   684
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   683
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   682
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   681
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   680
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   679
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   678
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   677
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   676
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   675
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   674
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   673
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   672
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   671
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   670
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   669
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   668
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   667
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   666
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   665
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   664
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   663
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   662
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   661
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   660
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   659
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   658
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   657
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   656
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   655
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   654
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   653
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   652
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   651
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   650
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   649
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   648
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   647
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   646
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   645
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   644
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   643
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   642
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   641
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   640
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   639
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   638
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   637
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   636
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   635
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   634
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   633
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   632
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   631
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   630
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   629
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   628
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   627
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   626
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   625
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   624
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   623
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   622
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   621
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   620
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   619
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   618
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   617
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   616
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   615
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   614
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   613
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   612
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   611
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   610
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   609
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   608
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   607
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   606
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   605
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   604
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   603
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   602
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   601
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   600
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   599
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   598
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   597
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   596
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   595
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   594
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   593
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   592
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   591
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   590
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   589
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   588
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   587
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   586
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   585
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   584
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   583
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   582
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   581
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   580
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   579
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   578
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   577
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   576
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   575
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   574
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   573
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   572
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   571
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   570
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   569
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   568
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   567
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   566
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   565
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   564
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   563
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   562
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   561
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   560
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   559
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   558
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   557
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   556
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   555
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   554
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   553
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   552
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   551
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   550
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   549
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   548
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   547
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   546
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   545
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   544
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   543
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   542
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   541
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   540
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   539
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   538
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   537
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   536
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   535
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   534
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   533
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   532
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   531
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   530
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   529
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   528
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   527
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   526
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   525
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   524
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   523
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   522
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   521
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   520
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   519
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   518
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   517
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   516
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   515
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   514
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   513
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   512
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   511
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   510
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   509
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   508
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   507
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   506
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   505
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   504
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   503
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   0
      Left            =   360
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   502
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   501
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   500
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   499
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   498
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   497
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   496
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   495
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   494
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   493
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   492
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   491
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   490
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   489
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   488
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   487
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   486
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   485
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   484
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   483
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   482
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   481
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   480
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   479
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   478
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   477
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   476
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   475
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   474
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   473
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   472
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   471
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   470
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   469
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   468
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   467
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   466
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   465
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   464
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   463
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   462
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   461
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   460
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   459
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   458
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   457
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   456
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   455
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   454
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   453
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   452
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   451
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   450
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   449
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   448
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   447
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   446
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   445
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   444
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   443
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   442
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   441
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   440
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   439
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   438
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   437
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   436
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   435
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   434
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   433
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   432
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   431
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   430
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   429
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   428
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   427
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   426
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   425
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   424
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   423
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   422
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   421
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   420
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   419
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   418
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   417
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   416
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   415
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   414
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   413
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   412
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   411
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   410
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   409
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   408
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   407
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   406
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   405
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   404
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   403
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   402
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   401
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   400
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   399
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   398
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   397
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   396
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   395
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   394
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   393
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   392
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   391
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   390
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   389
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   388
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   387
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   386
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   385
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   384
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   383
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   382
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   381
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   380
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   379
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   378
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   377
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   376
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   375
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   374
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   373
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   372
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   371
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   370
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   369
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   368
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   367
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   366
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   365
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   364
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   363
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   362
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   361
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   360
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   359
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   358
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   357
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   356
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   355
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   354
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   353
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   352
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   351
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   350
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   349
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   348
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   347
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   346
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   345
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   344
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   343
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   342
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   341
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   340
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   339
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   338
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   337
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   336
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   335
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   334
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   333
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   332
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   331
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   330
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   329
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   328
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   327
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   326
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   325
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   324
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   323
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   322
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   321
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   320
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   319
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   318
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   317
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   316
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   315
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   314
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   313
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   312
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   311
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   310
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   309
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   308
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   307
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   306
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   305
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   304
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   303
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   302
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   301
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   300
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   299
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   298
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   297
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   296
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   295
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   294
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   293
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   292
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   291
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   290
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   289
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   288
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   287
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   286
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   285
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   284
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   283
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   282
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   281
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   280
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   279
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   278
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   277
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   276
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   275
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   274
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   273
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   272
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   271
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   270
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   269
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   268
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   267
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   266
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   265
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   264
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   263
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   262
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   261
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   260
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   259
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   258
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   257
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   256
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   255
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   254
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   253
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   252
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   251
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   250
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   249
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   248
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   247
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   246
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   245
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   244
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   243
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   242
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   241
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   240
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   239
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   238
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   237
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   236
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   235
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   234
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   233
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   232
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   231
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   230
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   229
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   228
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   227
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   226
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   225
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   224
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   223
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   222
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   221
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   220
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   219
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   218
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   217
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   216
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   215
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   214
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   213
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   212
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   211
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   210
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   209
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   208
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   207
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   206
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   205
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   204
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   203
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   202
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   201
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   200
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   199
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   198
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   197
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   196
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   195
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   194
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   193
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   192
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   191
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   190
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   189
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   188
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   187
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   186
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   185
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   184
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   183
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   182
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   181
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   180
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   179
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   178
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   177
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   176
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   175
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   174
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   173
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   172
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   171
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   170
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   169
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   168
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   167
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   166
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   165
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   164
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   163
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   162
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   161
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   160
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   159
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   158
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   157
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   156
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   155
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   154
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   153
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   152
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   151
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   150
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   149
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   148
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   147
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   146
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   145
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   144
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   143
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   142
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   141
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   140
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   139
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   138
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   137
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   136
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   135
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   134
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   133
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   132
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   131
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   130
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   129
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   128
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   127
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   126
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   125
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   124
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   123
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   122
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   121
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   120
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   119
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   118
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   117
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   116
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   115
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   114
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   113
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   112
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   111
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   110
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   109
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   108
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   107
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   106
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   105
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   104
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   103
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   102
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   101
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   100
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   99
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   98
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   97
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   96
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   95
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   94
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   93
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   92
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   91
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   90
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   89
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   88
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   87
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   86
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   85
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   84
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   83
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   82
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   81
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   80
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   79
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   78
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   77
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   76
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   75
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   74
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   73
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   72
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   71
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   70
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   69
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   68
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   67
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   66
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   65
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   64
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   63
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   62
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   61
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   60
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   59
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   58
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   57
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   56
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   55
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   54
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   53
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   52
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   51
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   50
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   49
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   48
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   47
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   46
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   45
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   44
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   43
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   42
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   41
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   40
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   39
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   38
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   37
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   36
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   35
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   34
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   33
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   32
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   31
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   30
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   29
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   28
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   27
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   26
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   25
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   24
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   23
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   22
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   21
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   20
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   19
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   18
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   17
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   16
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   15
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   14
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   13
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   12
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   11
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   10
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   9
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   8
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   7
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   6
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   5
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   4
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   3
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   2
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Shape shpBrick 
      BorderColor     =   &H000080FF&
      FillColor       =   &H00000040&
      FillStyle       =   0  'Solid
      Height          =   255
      Index           =   1
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
   End
   Begin VB.Menu mnuShowGrid 
      Caption         =   "Show Grid"
   End
End
Attribute VB_Name = "frmBitMapIntro"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim BitMap(1 To 60, 1 To 80) As Integer
Dim Map(1 To 60, 1 To 80) As Integer
Dim BrickCount As Integer
Dim TCount As Integer
Dim ACount As Integer
Dim Direction As Integer
Dim Row(1 To 10) As Integer
Dim Col(1 To 10) As Integer
Dim AmmoArray(0 To 2) As Integer
Dim A As Integer
Dim WZCount As Integer

Dim EnemyRow(1 To 10) As Integer
Dim EnemyCol(1 To 10) As Integer
Dim SFactor As Integer



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
        Case vbKeyUp:
            tmrUp.Enabled = True
            Direction = 8
        Case vbKeyDown:
            tmrDown.Enabled = True
            Direction = 2
        Case vbKeyLeft:
            tmrLeft.Enabled = True
            Direction = 4
        Case vbKeyRight:
            tmrRight.Enabled = True
            Direction = 6
        Case vbKeySpace:
            AmmoArray(A) = Direction
            imgAmmo(A).Visible = True
            imgAmmo(A).Enabled = True
            tmrAmmo(A).Enabled = True
            '//align ammo to Ship
            imgAmmo(A).Left = imgMario.Left
            imgAmmo(A).Top = imgMario.Top
            'ammo direction correction
            A = A + 1
            If A >= 3 Then A = 0
    End Select
    
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
        Case vbKeyUp:
            tmrUp.Enabled = False
        Case vbKeyDown:
            tmrDown.Enabled = False
        Case vbKeyLeft:
            tmrLeft.Enabled = False
        Case vbKeyRight:
            tmrRight.Enabled = False
    End Select
    
End Sub

Private Sub Form_Load()

    frmBitMapIntro.WindowState = 0
    
    'set size factor
    SFactor = 200
    
    'set ammo size
    For z = 0 To 2
        imgAmmo(z).Width = SFactor
        imgAmmo(z).Height = SFactor
    Next z
    
    'set form size
    frmBitMapIntro.Width = SFactor * 82
    frmBitMapIntro.Height = SFactor * 65
    
    'set Mario's size
    imgMario.Width = SFactor
    imgMario.Height = SFactor
    
    'set Mario's position
    Row(1) = 2
    Col(1) = 2
    imgMario.Left = SFactor * (Col(1) - 1)
    imgMario.Top = SFactor * (Row(1) - 1)
    
    'set Enemy size
    imgEnemy.Width = SFactor
    imgEnemy.Height = SFactor
    
    'set Enemy's position
    EnemyRow(1) = 20
    EnemyCol(1) = 20
    imgEnemy.Left = SFactor * (EnemyCol(1) - 1)
    imgEnemy.Top = SFactor * (EnemyRow(1) - 1)
    
    'load the bitmap
    Dim MyChar As String
    Dim C As Integer
    
    'open notepad file
    Open App.Path & "\Bitmap.txt" For Input As #2
    
    'load bitmap array and place bricks
    Do While C < (60 * 80)
        MyChar = Input(1, #2)
        If MyChar = "0" _
        Or MyChar = "1" _
        Or MyChar = "2" _
        Or MyChar = "3" _
        Or MyChar = "4" Then
            BitMap(C \ 80 + 1, C Mod 80 + 1) = Asc(MyChar) - 48
            'brick laying
            If MyChar = "1" Then
                shpBrick(BrickCount).Width = SFactor
                shpBrick(BrickCount).Height = SFactor
                shpBrick(BrickCount).Visible = True
                shpBrick(BrickCount).Left = SFactor * (C Mod 80 + 1 - 1)
                shpBrick(BrickCount).Top = SFactor * (C \ 80 + 1 - 1)
                BrickCount = BrickCount + 1
            End If
            
            'target placement
            If MyChar = "4" Then
                imgTarget1(TCount).Width = SFactor
                imgTarget1(TCount).Height = SFactor
                imgTarget1(TCount).Visible = True
                imgTarget1(TCount).Left = SFactor * (C Mod 80 + 1 - 1)
                imgTarget1(TCount).Top = SFactor * (C \ 80 + 1 - 1)
                TCount = TCount + 1
            End If
            
        Else
            C = C - 1
        End If
        
        C = C + 1
    Loop
    
End Sub

Private Sub mnuShowGrid_Click()

    Cls
    Font.Size = 8
    For R = 1 To 60
        For C = 1 To 80
            Print BitMap(R, C);
            If R = Row(1) And C = Col(1) - 1 Then
                Font.Bold = True
            Else
                Font.Bold = False
            End If
            
        Next C
        Print:
    Next R
    
End Sub

Private Sub tmrAIfollow_Timer()

    'follow up
    If imgEnemy.Top > imgMario.Top Then
        tmrEnemyUp.Enabled = True
        Else
        tmrEnemyUp.Enabled = False
    End If
    
    'follow down
    If imgEnemy.Top < imgMario.Top Then
        tmrEnemyDown.Enabled = True
        Else
        tmrEnemyDown.Enabled = False
    End If
    
    'follow left
    If imgEnemy.Left > imgMario.Left Then
        tmrEnemyLeft.Enabled = True
        Else
        tmrEnemyLeft.Enabled = False
    End If
    
    'follow right
    If imgEnemy.Left < imgMario.Left Then
        tmrEnemyRight.Enabled = True
        Else
        tmrEnemyRight.Enabled = False
    End If
    
End Sub

Private Sub tmrAmmo_Timer(A As Integer)
    
    Select Case AmmoArray(A)
        Case 8:
            imgAmmo(A).Top = imgAmmo(A).Top - SFactor
        Case 2:
            imgAmmo(A).Top = imgAmmo(A).Top + SFactor
        Case 4:
            imgAmmo(A).Left = imgAmmo(A).Left - SFactor
        Case 6:
            imgAmmo(A).Left = imgAmmo(A).Left + SFactor
    End Select
    
    For V = 0 To 2
    If imgAmmo(A).Left >= imgTarget1(V).Left And (imgTarget1(V).Enabled = True Or imgTarget1(V).Visible = True) Then
        If imgAmmo(A).Left + imgAmmo(A).Width <= imgTarget1(V).Left + imgTarget1(V).Width Then
            If imgAmmo(A).Top >= imgTarget1(V).Top Then
                If imgAmmo(A).Top + imgAmmo(A).Height <= imgTarget1(V).Top + imgTarget1(V).Height Then
                    imgTarget1(V).Visible = False
                    imgTarget1(V).Enabled = False
                    tmrAmmo(A).Enabled = False
                    imgAmmo(A).Enabled = False
                    imgAmmo(A).Visible = False
                End If
            End If
        End If
    End If
    Next V
    
    'teleport
    If BitMap(Row(1), Col(1) - 1) = 4 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
End Sub

Private Sub tmrDown_Timer()

    Randomize
    Direction = 2
    
    If BitMap(Row(1) + 1, Col(1)) = 0 Then
    imgMario.Top = imgMario.Top + SFactor
    Row(1) = Row(1) + 1
    End If
    
    'portal to new world
    If BitMap(Row(1), Col(1)) = 2 Then
        tmrRight.Enabled = False
        frmBitMapIntro.Hide
        Load frmBitMapIntro3
        frmBitMapIntro3.Show
    End If
    
    'warp zone
    If BitMap(Row(1), Col(1)) = 5 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
    'teleport
    If BitMap(Row(1) + 1, Col(1)) = 3 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
End Sub

Private Sub tmrEnemyDown_Timer()

    Randomize
    If BitMap(EnemyRow(1) + 1, EnemyCol(1)) = 0 Then
    imgEnemy.Top = imgEnemy.Top + SFactor
    EnemyRow(1) = EnemyRow(1) + 1
    End If
    
    'teleport
    If BitMap(EnemyRow(1) + 1, EnemyCol(1)) = 3 Then
        EnemyRow(1) = Int(0 + (Rnd * 60))
        EnemyCol(1) = Int(0 + (Rnd * 80))
        imgEnemy.Left = SFactor * (EnemyCol(1) - 1)
        imgEnemy.Top = SFactor * (EnemyRow(1) - 1)
    End If
    
End Sub

Private Sub tmrEnemyLeft_Timer()

    Randomize
    If BitMap(EnemyRow(1), EnemyCol(1) - 1) = 0 Then
    imgEnemy.Left = imgEnemy.Left - SFactor
    EnemyCol(1) = EnemyCol(1) - 1
    End If
    
    'teleport
    If BitMap(EnemyRow(1), EnemyCol(1) - 1) = 3 Then
        EnemyRow(1) = Int(0 + (Rnd * 60))
        EnemyCol(1) = Int(0 + (Rnd * 80))
        imgEnemy.Left = SFactor * (EnemyCol(1) - 1)
        imgEnemy.Top = SFactor * (EnemyRow(1) - 1)
    End If
    
End Sub

Private Sub tmrEnemyRight_Timer()

    Randomize
    If BitMap(EnemyRow(1), EnemyCol(1) + 1) = 0 Then
    imgEnemy.Left = imgEnemy.Left + SFactor
    EnemyCol(1) = EnemyCol(1) + 1
    End If
    
    'teleport
    If BitMap(EnemyRow(1), EnemyCol(1) + 1) = 3 Then
        EnemyRow(1) = Int(0 + (Rnd * 60))
        EnemyCol(1) = Int(0 + (Rnd * 80))
        imgEnemy.Left = SFactor * (EnemyCol(1) - 1)
        imgEnemy.Top = SFactor * (EnemyRow(1) - 1)
    End If
    
End Sub

Private Sub tmrEnemyUp_Timer()

    Randomize
    If BitMap(EnemyRow(1) - 1, EnemyCol(1)) = 0 Then
    imgEnemy.Top = imgEnemy.Top - SFactor
    EnemyRow(1) = EnemyRow(1) - 1
    End If
    
    'teleport
    If BitMap(EnemyRow(1) - 1, EnemyCol(1)) = 3 Then
        EnemyRow(1) = Int(0 + (Rnd * 60))
        EnemyCol(1) = Int(0 + (Rnd * 80))
        imgEnemy.Left = SFactor * (EnemyCol(1) - 1)
        imgEnemy.Top = SFactor * (EnemyRow(1) - 1)
    End If
    
End Sub

Private Sub tmrLeft_Timer()

    Randomize
    Direction = 4
    
    If BitMap(Row(1), Col(1) - 1) = 0 Then
    imgMario.Left = imgMario.Left - SFactor
    Col(1) = Col(1) - 1
    End If
    
    'portal to new world
    If BitMap(Row(1), Col(1)) = 2 Then
        tmrRight.Enabled = False
        frmBitMapIntro.Hide
        Load frmBitMapIntro3
        frmBitMapIntro3.Show
    End If
    
    'warp zone
    If BitMap(Row(1), Col(1)) = 5 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
    'teleport
    If BitMap(Row(1), Col(1) - 1) = 3 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
End Sub

Private Sub tmrRight_Timer()

    Randomize
    Direction = 6
    
    If BitMap(Row(1), Col(1) + 1) = 0 Then
    imgMario.Left = imgMario.Left + SFactor
    Col(1) = Col(1) + 1
    End If
    
    'portal to new world
    If BitMap(Row(1), Col(1)) = 2 Then
        tmrRight.Enabled = False
        frmBitMapIntro.Hide
        Load frmBitMapIntro3
        frmBitMapIntro3.Show
    End If
    
    'warp zone
    If BitMap(Row(1), Col(1)) = 5 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
    'teleport
    If BitMap(Row(1), Col(1) + 1) = 3 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
End Sub

Private Sub tmrUp_Timer()

    Randomize
    Direction = 8
    
    If BitMap(Row(1) - 1, Col(1)) = 0 _
    Or BitMap(Row(1) - 1, Col(1)) = 2 _
    Or BitMap(Row(1) - 1, Col(1)) = 3 Then
    imgMario.Top = imgMario.Top - SFactor
    Row(1) = Row(1) - 1
    End If
    
    'portal to new world
    If BitMap(Row(1), Col(1)) = 2 Then
        tmrRight.Enabled = False
        frmBitMapIntro.Hide
        Load frmBitMapIntro3
        frmBitMapIntro3.Show
    End If
    
    'warp zone
    If BitMap(Row(1), Col(1)) = 5 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
    'teleport
    If BitMap(Row(1) - 1, Col(1)) = 3 Then
        Row(1) = Int(0 + (Rnd * 60))
        Col(1) = Int(0 + (Rnd * 80))
        imgMario.Left = SFactor * (Col(1) - 1)
        imgMario.Top = SFactor * (Row(1) - 1)
    End If
    
End Sub
