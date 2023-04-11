VERSION 5.00
Begin VB.Form frmMinesweeper 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Minesweeper"
   ClientHeight    =   10455
   ClientLeft      =   45
   ClientTop       =   675
   ClientWidth     =   11085
   Icon            =   "frmMinesweeper.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   10455
   ScaleWidth      =   11085
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdAI 
      Caption         =   "AI"
      Height          =   255
      Left            =   960
      TabIndex        =   2
      Top             =   120
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Timer AITimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   360
      Top             =   2280
   End
   Begin VB.Timer tmrLoadImages 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   360
      Top             =   1680
   End
   Begin VB.Timer tmr1Time 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   360
      Top             =   1080
   End
   Begin VB.Label lbl2Flags 
      Alignment       =   1  'Right Justify
      BorderStyle     =   1  'Fixed Single
      Caption         =   "999"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5760
      TabIndex        =   1
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lbl1Time 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "00:00:00"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4200
      TabIndex        =   0
      Top             =   120
      Width           =   735
   End
   Begin VB.Shape shpBox2 
      BackColor       =   &H00FFFFFF&
      BorderColor     =   &H80000010&
      BorderWidth     =   3
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   1560
      Shape           =   4  'Rounded Rectangle
      Top             =   10080
      Width           =   8055
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1600
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1599
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1598
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1597
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1596
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1595
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1594
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1593
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1592
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1591
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1590
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1589
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1588
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1587
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1586
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1585
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1584
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1583
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1582
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1581
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1580
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1579
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1578
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1577
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1576
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1575
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1574
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1573
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1572
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1571
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1570
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1569
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1568
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1567
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1566
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1565
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1564
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1563
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1562
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1561
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1560
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1559
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1558
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1557
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1556
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1555
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1554
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1553
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1552
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1551
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1550
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1549
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1548
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1547
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1546
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1545
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1544
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1543
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1542
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1541
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1540
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1539
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1538
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1537
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1536
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1535
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1534
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1533
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1532
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1531
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1530
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1529
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1528
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1527
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1526
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1525
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1524
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1523
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1522
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1521
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1520
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1519
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1518
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1517
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1516
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1515
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1514
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1513
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1512
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1511
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1510
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1509
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1508
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1507
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1506
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1505
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1504
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1503
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1502
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1501
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1500
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1499
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1498
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1497
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1496
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1495
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1494
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1493
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1492
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1491
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1490
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1489
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1488
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1487
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1486
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1485
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1484
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1483
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1482
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1481
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1480
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1479
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1478
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1477
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1476
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1475
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1474
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1473
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1472
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1471
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1470
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1469
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1468
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1467
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1466
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1465
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1464
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1463
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1462
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1461
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1460
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1459
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1458
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1457
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1456
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1455
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1454
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1453
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1452
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1451
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1450
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1449
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1448
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1447
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1446
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1445
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1444
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1443
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1442
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1441
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1440
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1439
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1438
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1437
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1436
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1435
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1434
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1433
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1432
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1431
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1430
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1429
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1428
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1427
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1426
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1425
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1424
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1423
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1422
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1421
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1420
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1419
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1418
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1417
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1416
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1415
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1414
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1413
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1412
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1411
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1410
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1409
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1408
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1407
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1406
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1405
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1404
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1403
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1402
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1401
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1400
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1399
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1398
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1397
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1396
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1395
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1394
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1393
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1392
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1391
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1390
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1389
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1388
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1387
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1386
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1385
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1384
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1383
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1382
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1381
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1380
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1379
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1378
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1377
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1376
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1375
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1374
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1373
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1372
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1371
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1370
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1369
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1368
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1367
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1366
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1365
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1364
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1363
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1362
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1361
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1360
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1359
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1358
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1357
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1356
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1355
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1354
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1353
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1352
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1351
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1350
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1349
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1348
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1347
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1346
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1345
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1344
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1343
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1342
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1341
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1340
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1339
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1338
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1337
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1336
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1335
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1334
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1333
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1332
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1331
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1330
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1329
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1328
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1327
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1326
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1325
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1324
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1323
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1322
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1321
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1320
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1319
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1318
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1317
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1316
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1315
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1314
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1313
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1312
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1311
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1310
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1309
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1308
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1307
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1306
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1305
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1304
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1303
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1302
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1301
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1300
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1299
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1298
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1297
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1296
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1295
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1294
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1293
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1292
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1291
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1290
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1289
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1288
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1287
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1286
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1285
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1284
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1283
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1282
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1281
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1280
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1279
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1278
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1277
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1276
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1275
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1274
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1273
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1272
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1271
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1270
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1269
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1268
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1267
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1266
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1265
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1264
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1263
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1262
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1261
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1260
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1259
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1258
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1257
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1256
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1255
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1254
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1253
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1252
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1251
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1250
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1249
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1248
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1247
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1246
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1245
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1244
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1243
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1242
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1241
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1240
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1239
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1238
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1237
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1236
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1235
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1234
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1233
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1232
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1231
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1230
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1229
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1228
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1227
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1226
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1225
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1224
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1223
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1222
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1221
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1220
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1219
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1218
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1217
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1216
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1215
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1214
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1213
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1212
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1211
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1210
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1209
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1208
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1207
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1206
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1205
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1204
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1203
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1202
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1201
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1200
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1199
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1198
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1197
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1196
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1195
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1194
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1193
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1192
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1191
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1190
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1189
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1188
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1187
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1186
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1185
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1184
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1183
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1182
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1181
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1180
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1179
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1178
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1177
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1176
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1175
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1174
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1173
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1172
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1171
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1170
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1169
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1168
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1167
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1166
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1165
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1164
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1163
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1162
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1161
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1160
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1159
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1158
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1157
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1156
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1155
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1154
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1153
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1152
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1151
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1150
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1149
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1148
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1147
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1146
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1145
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1144
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1143
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1142
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1141
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1140
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1139
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1138
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1137
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1136
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1135
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1134
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1133
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1132
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1131
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1130
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1129
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1128
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1127
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1126
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1125
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1124
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1123
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1122
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1121
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1120
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1119
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1118
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1117
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1116
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1115
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1114
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1113
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1112
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1111
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1110
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1109
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1108
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1107
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1106
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1105
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1104
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1103
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1102
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1101
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1100
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1099
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1098
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1097
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1096
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1095
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1094
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1093
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1092
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1091
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1090
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1089
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1088
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1087
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1086
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1085
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1084
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1083
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1082
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1081
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1080
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1079
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1078
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1077
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1076
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1075
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1074
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1073
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1072
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1071
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1070
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1069
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1068
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1067
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1066
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1065
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1064
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1063
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1062
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1061
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1060
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1059
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1058
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1057
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1056
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1055
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1054
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1053
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1052
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1051
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1050
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1049
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1048
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1047
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1046
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1045
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1044
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1043
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1042
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1041
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1040
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1039
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1038
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1037
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1036
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1035
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1034
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1033
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1032
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1031
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1030
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1029
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1028
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1027
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1026
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1025
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1024
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1023
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1022
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1021
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1020
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1019
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1018
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1017
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1016
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1015
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1014
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1013
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1012
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1011
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1010
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1009
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1008
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1007
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1006
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1005
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1004
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1003
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1002
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgFace 
      Height          =   375
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   0
      Width           =   375
   End
   Begin VB.Shape shpBox 
      BackColor       =   &H00FFFFFF&
      BorderColor     =   &H80000010&
      BorderWidth     =   3
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   495
      Left            =   1560
      Shape           =   4  'Rounded Rectangle
      Top             =   0
      Width           =   8055
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1001
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1000
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   999
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   998
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   997
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   996
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   995
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   994
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   993
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   992
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   991
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   990
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   989
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   988
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   987
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   986
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   985
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   984
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   983
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   982
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   981
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   980
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   979
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   978
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   977
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   976
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   975
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   974
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   973
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   972
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   971
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   970
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   969
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   968
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   967
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   966
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   965
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   964
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   963
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   962
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   961
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   960
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   959
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   958
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   957
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   956
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   955
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   954
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   953
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   952
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   951
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   950
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   949
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   948
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   947
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   946
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   945
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   944
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   943
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   942
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   941
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   940
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   939
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   938
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   937
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   936
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   935
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   934
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   933
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   932
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   931
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   930
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   929
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   928
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   927
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   926
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   925
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   924
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   923
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   922
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   921
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   920
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   919
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   918
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   917
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   916
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   915
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   914
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   913
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   912
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   911
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   910
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   909
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   908
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   907
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   906
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   905
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   904
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   903
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   902
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   901
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   900
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   899
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   898
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   897
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   896
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   895
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   894
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   893
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   892
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   891
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   890
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   889
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   888
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   887
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   886
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   885
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   884
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   883
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   882
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   881
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   880
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   879
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   878
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   877
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   876
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   875
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   874
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   873
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   872
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   871
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   870
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   869
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   868
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   867
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   866
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   865
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   864
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   863
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   862
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   861
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   860
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   859
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   858
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   857
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   856
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   855
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   854
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   853
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   852
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   851
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   850
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   849
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   848
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   847
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   846
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   845
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   844
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   843
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   842
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   841
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   840
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   839
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   838
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   837
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   836
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   835
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   834
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   833
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   832
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   831
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   830
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   829
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   828
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   827
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   826
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   825
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   824
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   823
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   822
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   821
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   820
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   819
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   818
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   817
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   816
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   815
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   814
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   813
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   812
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   811
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   810
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   809
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   808
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   807
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   806
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   805
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   804
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   803
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   802
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   801
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   800
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   799
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   798
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   797
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   796
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   795
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   794
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   793
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   792
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   791
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   790
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   789
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   788
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   787
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   786
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   785
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   784
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   783
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   782
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   781
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   780
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   779
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   778
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   777
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   776
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   775
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   774
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   773
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   772
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   771
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   770
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   769
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   768
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   767
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   766
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   765
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   764
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   763
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   762
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   761
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   760
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   759
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   758
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   757
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   756
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   755
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   754
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   753
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   752
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   751
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   750
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   749
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   748
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   747
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   746
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   745
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   744
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   743
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   742
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   741
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   740
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   739
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   738
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   737
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   736
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   735
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   734
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   733
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   732
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   731
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   730
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   729
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   728
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   727
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   726
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   725
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   724
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   723
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   722
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   721
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   720
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   719
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   718
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   717
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   716
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   715
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   714
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   713
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   712
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   711
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   710
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   709
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   708
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   707
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   706
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   705
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   704
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   703
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   702
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   701
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   700
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   699
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   698
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   697
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   696
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   695
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   694
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   693
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   692
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   691
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   690
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   689
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   688
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   687
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   686
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   685
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   684
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   683
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   682
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   681
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   680
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   679
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   678
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   677
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   676
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   675
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   674
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   673
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   672
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   671
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   670
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   669
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   668
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   667
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   666
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   665
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   664
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   663
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   662
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   661
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   660
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   659
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   658
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   657
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   656
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   655
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   654
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   653
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   652
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   651
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   650
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   649
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   648
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   647
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   646
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   645
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   644
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   643
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   642
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   641
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   640
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   639
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   638
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   637
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   636
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   635
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   634
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   633
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   632
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   631
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   630
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   629
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   628
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   627
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   626
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   625
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   624
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   623
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   622
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   621
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   620
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   619
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   618
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   617
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   616
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   615
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   614
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   613
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   612
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   611
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   610
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   609
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   608
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   607
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   606
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   605
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   604
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   603
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   602
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   601
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   600
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   599
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   598
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   597
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   596
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   595
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   594
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   593
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   592
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   591
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   590
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   589
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   588
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   587
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   586
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   585
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   584
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   583
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   582
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   581
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   580
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   579
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   578
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   577
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   576
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   575
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   574
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   573
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   572
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   571
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   570
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   569
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   568
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   567
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   566
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   565
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   564
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   563
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   562
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   561
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   560
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   559
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   558
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   557
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   556
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   555
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   554
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   553
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   552
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   551
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   550
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   549
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   548
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   547
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   546
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   545
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   544
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   543
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   542
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   541
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   540
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   539
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   538
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   537
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   536
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   535
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   534
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   533
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   532
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   531
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   530
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   529
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   528
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   527
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   526
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   525
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   524
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   523
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   522
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   521
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   520
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   519
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   518
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   517
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   516
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   515
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   514
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   513
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   512
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   511
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   510
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   509
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   508
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   507
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   506
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   505
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   504
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   503
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   502
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   501
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   500
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   499
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   498
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   497
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   496
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   495
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   494
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   493
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   492
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   491
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   490
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   489
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   488
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   487
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   486
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   485
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   484
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   483
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   482
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   481
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   480
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   479
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   478
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   477
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   476
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   475
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   474
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   473
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   472
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   471
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   470
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   469
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   468
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   467
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   466
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   465
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   464
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   463
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   462
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   461
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   460
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   459
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   458
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   457
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   456
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   455
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   454
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   453
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   452
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   451
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   450
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   449
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   448
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   447
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   446
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   445
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   444
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   443
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   442
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   441
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   440
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   439
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   438
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   437
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   436
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   435
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   434
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   433
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   432
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   431
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   430
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   429
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   428
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   427
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   426
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   425
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   424
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   423
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   422
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   421
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   420
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   419
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   418
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   417
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   416
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   415
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   414
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   413
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   412
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   411
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   410
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   409
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   408
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   407
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   406
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   405
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   404
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   403
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   402
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   401
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   400
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   399
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   398
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   397
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   396
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   395
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   394
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   393
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   392
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   391
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   390
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   389
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   388
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   387
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   386
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   385
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   384
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   383
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   382
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   381
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   380
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   379
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   378
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   377
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   376
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   375
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   374
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   373
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   372
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   371
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   370
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   369
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   368
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   367
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   366
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   365
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   364
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   363
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   362
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   361
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   360
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   359
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   358
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   357
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   356
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   355
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   354
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   353
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   352
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   351
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   350
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   349
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   348
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   347
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   346
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   345
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   344
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   343
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   342
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   341
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   340
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   339
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   338
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   337
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   336
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   335
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   334
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   333
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   332
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   331
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   330
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   329
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   328
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   327
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   326
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   325
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   324
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   323
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   322
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   321
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   320
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   319
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   318
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   317
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   316
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   315
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   314
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   313
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   312
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   311
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   310
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   309
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   308
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   307
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   306
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   305
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   304
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   303
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   302
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   301
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   300
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   299
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   298
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   297
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   296
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   295
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   294
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   293
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   292
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   291
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   290
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   289
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   288
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   287
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   286
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   285
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   284
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   283
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   282
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   281
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   280
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   279
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   278
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   277
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   276
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   275
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   274
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   273
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   272
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   271
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   270
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   269
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   268
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   267
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   266
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   265
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   264
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   263
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   262
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   261
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   260
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   259
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   258
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   257
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   256
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   255
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   254
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   253
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   252
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   251
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   250
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   249
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   248
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   247
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   246
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   245
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   244
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   243
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   242
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   241
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   240
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   239
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   238
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   237
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   236
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   235
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   234
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   233
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   232
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   231
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   230
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   229
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   228
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   227
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   226
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   225
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   224
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   223
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   222
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   221
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   220
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   219
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   218
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   217
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   216
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   215
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   214
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   213
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   212
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   211
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   210
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   209
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   208
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   207
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   206
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   205
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   204
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   203
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   202
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   201
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   200
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   199
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   198
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   197
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   196
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   195
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   194
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   193
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   192
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   191
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   190
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   189
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   188
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   187
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   186
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   185
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   184
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   183
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   182
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   181
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   180
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   179
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   178
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   177
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   176
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   175
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   174
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   173
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   172
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   171
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   170
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   169
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   168
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   167
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   166
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   165
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   164
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   163
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   162
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   161
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   160
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   159
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   158
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   157
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   156
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   155
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   154
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   153
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   152
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   151
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   150
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   149
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   148
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   147
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   146
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   145
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   144
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   143
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   142
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   141
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   140
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   139
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   138
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   137
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   136
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   135
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   134
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   133
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   132
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   131
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   130
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   129
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   128
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   127
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   126
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   125
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   124
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   123
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   122
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   121
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   120
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   119
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   118
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   117
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   116
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   115
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   114
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   113
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   112
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   111
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   110
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   109
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   108
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   107
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   106
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   105
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   104
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   103
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   102
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   101
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   100
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   99
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   98
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   97
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   96
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   95
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   94
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   93
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   92
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   91
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   90
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   89
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   88
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   87
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   86
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   85
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   84
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   83
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   82
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   81
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   80
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   79
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   78
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   77
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   76
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   75
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   74
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   73
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   72
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   71
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   70
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   69
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   68
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   67
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   66
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   65
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   64
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   63
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   62
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   61
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   60
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   59
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   58
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   57
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   56
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   55
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   54
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   53
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   52
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   51
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   50
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   49
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   48
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   47
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   46
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   45
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   44
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   43
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   42
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   41
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   40
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   39
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   38
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   37
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   36
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   35
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   34
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   33
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   32
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   31
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   30
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   29
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   28
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   27
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   26
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   25
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   24
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   23
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   22
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   21
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   20
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   19
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   18
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   17
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   16
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   15
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   14
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   13
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   12
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   11
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   10
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   9
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   8
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   7
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   6
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   5
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   4
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   3
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   2
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   1
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Image imgCell 
      Height          =   255
      Index           =   0
      Left            =   240
      Stretch         =   -1  'True
      Top             =   240
      Width           =   255
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnu1AI 
         Caption         =   "AI"
         Begin VB.Menu mnu1AIOn 
            Caption         =   "AI On"
         End
         Begin VB.Menu mnu1AIOff 
            Caption         =   "AI Off"
         End
      End
      Begin VB.Menu mnuMainMenu 
         Caption         =   "Back to Menu"
      End
      Begin VB.Menu mnu1Exit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuCls 
      Caption         =   "Cls"
      Visible         =   0   'False
   End
   Begin VB.Menu mnuPrint 
      Caption         =   "n"
      Visible         =   0   'False
   End
   Begin VB.Menu mnuGrid 
      Caption         =   "Grid"
      Visible         =   0   'False
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "Options"
   End
End
Attribute VB_Name = "frmMinesweeper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'i = ((-1 * (R * 10)) + 100) + ((C * 1) - 10)

Dim t As Integer
Dim Index As Integer

Private Sub AITimer_Timer()

Randomize

XDefinition = XMaze
YDefinition = YMaze

If GameOn = True Then

    'Reset
    For R = 0 - 1 To 0 + YMaze
    For C = 0 - 1 To 0 + XMaze
        AIValue(R, C) = 0
        AITarget(R, C) = 0
    Next C
    Next R
    'AIRandomPickFirst = False
    If AIRandomPickFirst = True Then
        AIRandomPickFirst = False
        AIIndex = Int(0 + Rnd * ((XMaze * YMaze)))
        imgCell_Click AIIndex
        imgCell_MouseUp AIIndex, vbLeftButton, 0, 0, 0
    End If
    
    For t = 0 To -1 + (XMaze * YMaze)
        C = (t Mod XMaze)
        R = YMaze - (t \ XMaze + 1)
        If Maze(R, C) = 0 Or Maze(R, C) = 1 Or Maze(R, C) = 2 Or Maze(R, C) = -5 Or Maze(R, C) = -25 _
        Or (Maze(R, C) = -5001 Or Maze(R, C) = -5001 _
        Or Maze(R, C) = -5002 Or Maze(R, C) = -5002 _
        Or Maze(R, C) = -5003 Or Maze(R, C) = -5003 _
        Or Maze(R, C) = -5004 Or Maze(R, C) = -5004 _
        Or Maze(R, C) = -5005 Or Maze(R, C) = -5005 _
        Or Maze(R, C) = -5006 Or Maze(R, C) = -5006 _
        Or Maze(R, C) = -5007 Or Maze(R, C) = -5007 _
        Or Maze(R, C) = -5008 Or Maze(R, C) = -5008) _
        Or (Maze(R, C) = -126 _
        Or Maze(R, C) = -127 _
        Or Maze(R, C) = -128 _
        Or Maze(R, C) = -129 _
        Or Maze(R, C) = -130 _
        Or Maze(R, C) = -131 _
        Or Maze(R, C) = -132 _
        Or Maze(R, C) = -133) Then
            For N1 = -1 To 1
            For N2 = -1 To 1
                If N1 = 0 And N2 = 0 Then N1 = N1 + 1
                
                C = (t Mod XMaze)
                R = YMaze - (t \ XMaze + 1)
                AIIndex = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                
                If AIIndex < 0 Then AIIndex = 0
                If AIIndex > -1 + (XMaze * YMaze) Then AIIndex = -1 + (XMaze * YMaze)
                
                For zoneCount = 1 To 8
                    If zoneValue(R, C) = zoneCount Then
                        AIValue(R + N1, C + N2) = AIValue(R + N1, C + N2) - 1
                    End If
                    If zoneValue(R, C) = -zoneCount Then
                        AIValue(R + N1, C + N2) = AIValue(R + N1, C + N2) - 1
                    End If
                Next zoneCount
                
                C = (t Mod XMaze)
                R = YMaze - (t \ XMaze + 1)
                AIIndex = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                
                If imgCell(AIIndex).Tag = "cEmpty" And Maze(R, C) = 0 And Maze(R + N1, C + N2) = 1 _
                Or (Maze(R + N1, C + N2) = -5001 Or Maze(R + N1, C + N2) = -5001 _
                Or Maze(R + N1, C + N2) = -5002 Or Maze(R + N1, C + N2) = -5002 _
                Or Maze(R + N1, C + N2) = -5003 Or Maze(R + N1, C + N2) = -5003 _
                Or Maze(R + N1, C + N2) = -5004 Or Maze(R + N1, C + N2) = -5004 _
                Or Maze(R + N1, C + N2) = -5005 Or Maze(R + N1, C + N2) = -5005 _
                Or Maze(R + N1, C + N2) = -5006 Or Maze(R + N1, C + N2) = -5006 _
                Or Maze(R + N1, C + N2) = -5007 Or Maze(R + N1, C + N2) = -5007 _
                Or Maze(R + N1, C + N2) = -5008 Or Maze(R + N1, C + N2) = -5008) _
                Or (Maze(R + N1, C + N2) = -126 _
                Or Maze(R + N1, C + N2) = -127 _
                Or Maze(R + N1, C + N2) = -128 _
                Or Maze(R + N1, C + N2) = -129 _
                Or Maze(R + N1, C + N2) = -130 _
                Or Maze(R + N1, C + N2) = -131 _
                Or Maze(R + N1, C + N2) = -132 _
                Or Maze(R + N1, C + N2) = -133) Then
                    AIValue(R + N1, C + N2) = AIValue(R + N1, C + N2) - 10
                End If
                
            Next N2
            Next N1
            C = (t Mod XMaze)
            R = YMaze - (t \ XMaze + 1)
            If Maze(R, C) = 2 Or Maze(R, C) = 2 Or Maze(R, C) = -25 Or Maze(R, C) = -25 _
            Or (Maze(R, C) = 5001 Or Maze(R, C) = -5001 _
            Or Maze(R, C) = 5002 Or Maze(R, C) = -5002 _
            Or Maze(R, C) = 5003 Or Maze(R, C) = -5003 _
            Or Maze(R, C) = 5004 Or Maze(R, C) = -5004 _
            Or Maze(R, C) = 5005 Or Maze(R, C) = -5005 _
            Or Maze(R, C) = 5006 Or Maze(R, C) = -5006 _
            Or Maze(R, C) = 5007 Or Maze(R, C) = -5007 _
            Or Maze(R, C) = 5008 Or Maze(R, C) = -5008) _
            Or (Maze(R, C) = -126 _
            Or Maze(R, C) = -127 _
            Or Maze(R, C) = -128 _
            Or Maze(R, C) = -129 _
            Or Maze(R, C) = -130 _
            Or Maze(R, C) = -131 _
            Or Maze(R, C) = -132 _
            Or Maze(R, C) = -133) Then
                AIValue(R, C) = AIValue(R, C) + 10
            End If
        'If Maze(R + -1, C + -1) = 2 Or Maze(R + -1, C + -1) = 1 Then
        '    AIValue(R + -1, C + -1) = AIValue(R + -1, C + -1) + 1
        'End If
        'If Maze(R + 0, C + -1) = 2 Or Maze(R + 0, C + -1) = 1 Then
        '    AIValue(R + 0, C + -1) = AIValue(R + 0, C + -1) + 1
        'End If
        'If Maze(R + 1, C + -1) = 2 Or Maze(R + 1, C + -1) = 1 Then
        '    AIValue(R + 1, C + -1) = AIValue(R + 1, C + -1) + 1
        'End If
        ''''''''''''''''''''''''''''''''''''''''''''''//
        'If Maze(R + -1, C + 0) = 2 Or Maze(R + -1, C + 0) = 1 Then
        '    AIValue(R + -1, C + 0) = AIValue(R + -1, C + 0) + 1
        'End If
        ''If Maze(R + 0, C + 0) = 2 Or Maze(R + 0, C + 0) = 1 Then
        ''    AIValue(R + 0, C + 0) = AIValue(R + 0, C + 0) + 1
        ''End If
        'If Maze(R + 1, C + 0) = 2 Or Maze(R + 1, C + 0) = 1 Then
        '    AIValue(R + 1, C + 0) = AIValue(R + 1, C + 0) + 1
        'End If
        ''''''''''''''''''''''''''''''''''''''''''''''//
        'If Maze(R + -1, C + 1) = 2 Or Maze(R + -1, C + 1) = 1 Then
        '    AIValue(R + -1, C + 1) = AIValue(R + -1, C + 1) + 1
        'End If
        'If Maze(R + 0, C + 1) = 2 Or Maze(R + 0, C + 1) = 1 Then
        '    AIValue(R + 0, C + 1) = AIValue(R + 0, C + 1) + 1
        'End If
        'If Maze(R + 1, C + 1) = 2 Or Maze(R + 1, C + 1) = 1 Then
        '    AIValue(R + 1, C + 1) = AIValue(R + 1, C + 1) + 1
        'End If
        End If
    Next t
    
    'Print the AIValues
    'Cls
    'For R = YMaze - 1 To 0 Step -1
    '    For C = 0 To XMaze - 1
    '        Print AIValue(R, C);
    '    Next C
    '    Print:
    'Next R
    
CheckU:
    
    u = Int(0 + Rnd * ((XMaze * YMaze)))
    'u = u + 1
    If u > (XMaze * YMaze) Or u < 0 Then u = 0
    C = (u Mod XMaze)
    R = YMaze - (u \ XMaze + 1)
    
    If Maze(R, C) = 0 Then GoTo CheckU:
    
    'Print Rand1
    VAR2 = 10
    
    'cmdAI.Caption = u
    
    C = (u Mod XMaze)
    R = YMaze - (u \ XMaze + 1)
    
    For cAI = R To -1 + (XMaze)
        If cAI > -1 + (XMaze) Then cAI = -1 + (XMaze)
        If cAI < 0 Then cAI = 0
        If AIValue(R, cAI) <= 0 Then
            AIIndex = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((cAI * 1) - XDefinition)
            If imgCell(AIIndex).Tag = "cFlag" Then
                imgCell_MouseUp AIIndex, vbRightButton, 0, 0, 0
                imgCell_MouseUp AIIndex, vbLeftButton, 0, 0, 0
            Else
                imgCell_MouseUp AIIndex, vbLeftButton, 0, 0, 0
            End If
        End If
        For VAR1 = 0 To VAR2
        If AIValue(R, cAI) = VAR1 Then
            AIIndex = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((cAI * 1) - XDefinition)
            If (imgCell(AIIndex).Tag = "" Or imgCell(AIIndex).Tag = "cBomb") And imgCell(AIIndex) <> "cFlag" Then
                imgCell_MouseUp AIIndex, vbRightButton, 0, 0, 0
                'imgCell_MouseUp AIIndex, vbLeftButton, 0, 0, 0
                VAR1 = VAR2
            Else
                'imgCell_MouseUp AIIndex, vbRightButton, 0, 0, 0
                'imgCell_MouseUp AIIndex, vbLeftButton, 0, 0, 0
                'VAR1 = VAR2
            End If
        End If
        Next VAR1
    Next cAI
    'End If
    
Else

    'Reset
    For R = 0 To -1 + YMaze
    For C = 0 To -1 + XMaze
        AIValue(R, C) = 0
        AITarget(R, C) = 0
    Next C
    Next R
    
    For t = 0 To -1 + (XMaze * YMaze)
        Indexu2(t) = True
    Next t
    
    AIRandomPickFirst = True
    imgFace_Click
    
End If
    
End Sub

Private Sub cmdAI_Click()

    If AITimer.Enabled = True Then
    AIDifficulty = 3
    mnu1AIOff.Checked = True
    mnu1AIOn.Checked = False
    
    For t = 0 To -1 + (XMaze * YMaze)
        Indexu2(t) = True
    Next t
    
    AITimer.Enabled = False
    AIRandomPickFirst = True
    GoTo B:
    End If
    
    If AITimer.Enabled = False Then
    AIDifficulty = 3
    mnu1AIOff.Checked = False
    mnu1AIOn.Checked = True
    
    For t = 0 To -1 + (XMaze * YMaze)
        Indexu2(t) = True
    Next t
    
    AIRandomPickFirst = True
    AITimer.Enabled = True
    GoTo B:
    End If
    
B:
End Sub

Private Sub Form_Load()
    
'Load Game
    mnu1AIOff.Checked = True
    XMaze = XTemp
    YMaze = YTemp
    NumBomb = BTemp
    nCellsLeft = (XMaze * YMaze) - NumBomb
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub imgCell_Click(Index As Integer)

Screen.MousePointer = vbHourglass

If GameOn = True Then
    If Button = vbLeftButton Then
        If Index > 0 And Index <= -1 + (XMaze * YMaze) Then
        C = (Index Mod XMaze)
        R = YMaze - (Index \ XMaze + 1)
        If Maze(R, C) = 1 Then
            Call revealBoard
A:
            'Call revealMore
            'If callAgain = True Then
            '    GoTo A:
            'End If
        End If
        End If
    End If
End If

Screen.MousePointer = vbDefault

End Sub

Private Sub imgCell_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

If GameOn = True Then
    If Button = vbLeftButton Then
        If Index > 0 And Index <= -1 + (XMaze * YMaze) Then
        If (imgCell(Index).Tag = "" Or imgCell(Index).Tag = "cBomb") And (Maze(R, C) <> -5 And Maze(R, C) <> -25) Then
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\CellClickedDown.bmp")
        End If
        End If
    End If
End If

End Sub

Private Sub imgCell_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

'Screen.MousePointer = vbHourglass

'Define C and R (Numerical Analysis)
C = (Index Mod XMaze)
R = YMaze - (Index \ XMaze + 1)

'Is GameOn True?
If GameOn = True Then
'Print Index

    If tmr1Time.Enabled = False Then tmr1Time.Enabled = True

'Left Click?
    If Button = vbLeftButton Then
    
'Check Space and Do Minesweeper****\\
        
        'revealBoard Procedure
'102:
'103:   /**
'104:    * Reveal the contents of the cell at position (x, y) on the board.  Returns
'105:    * the contents thus revealed, which may be an integer in the range 0..8
'106:    * indicating the number of neighbouring cells that contain a mine, or the
'107:    * special constant MINE indicating that the cell contains a mine.
'108:    */

    If Maze(R, C) = 1 Then
        Call revealBoard
    End If
'****\\
        
        'Check Cell For Bomb
        C = (Index Mod XMaze)
        R = YMaze - (Index \ XMaze + 1)
        'Print C, R
        If imgCell(Index).Tag = "cBomb" And Maze(R, C) = 2 Then
            IsBomb = True
            imgCell(Index).Tag = "cBHit"
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\MineBlow.bmp")
            Maze(R, C) = -1000
            GoTo D:
        End If
        
        If imgCell(Index).Tag = "" And Maze(R, C) = 1 Then
            IsBomb = False
            imgCell(Index).Tag = "cEmpty"
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
            Maze(R, C) = 0
            nCellsLeft = nCellsLeft - 1
            GoTo D:
        End If
        
        If imgCell(Index).Tag = "cEmpty" And Maze(R, C) = 1 Then
            IsBomb = False
            imgCell(Index).Tag = "cEmpty"
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
            Maze(R, C) = 0
            GoTo D:
        End If
        
        If imgCell(Index).Tag = "cFlag" And Maze(R, C) = -5 Then
            IsBomb = False
            imgCell(Index).Tag = "cFlag"
            Maze(R, C) = -5
            GoTo D:
        End If
        
        If imgCell(Index).Tag = "cFlag" And Maze(R, C) = -25 Then
            IsBomb = False
            imgCell(Index).Tag = "cFlag"
            Maze(R, C) = -25
            GoTo D:
        End If
        
        If imgCell(Index).Tag = "" And _
        (Maze(R, C) = 5001 _
        Or Maze(R, C) = 5002 _
        Or Maze(R, C) = 5003 _
        Or Maze(R, C) = 5004 _
        Or Maze(R, C) = 5005 _
        Or Maze(R, C) = 5006 _
        Or Maze(R, C) = 5007 _
        Or Maze(R, C) = 5008) Then
            IsBomb = False
            C = (Index Mod XMaze)
            R = YMaze - (Index \ XMaze + 1)
            
            For zoneCount = 1 To 8
                If zoneValue(R, C) = zoneCount Then
                    frmMinesweeper.imgCell(Index).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                    imgCell(Index).Tag = "cEmpty"
                    Maze(R, C) = -zoneCount + -5000
                    zoneValue(R, C) = -zoneCount
                End If
            Next zoneCount
            
            nCellsLeft = nCellsLeft - 1
            imgCell(Index).Tag = "cEmpty"
            GoTo D:
        End If
        
D:
        'Msg TEST
        If IsBomb = True Then
            Call revealMines
                If tmr1Time.Enabled = True Then tmr1Time.Enabled = False
            TotalTime(0) = (Sec(0) * 1) + (Min(0) * 10 * 60) + (Hr(0) * 600) + (Sec(1) * 10) + (Min(1) * 100 * 60) + (Hr(1) * 10 * 600)
            imgFace.Picture = LoadPicture(App.Path & "\Images\Face2.bmp")
                If AITimer.Enabled = True Then MsgBox "You Hit a Mine. " & Maze(R, C) & " Time: " & TotalTime(0) & " Seconds", vbCritical, "You Lost."
                AITimer.Enabled = False
                mnu1AIOn.Checked = False
                mnu1AIOff.Checked = True
            GameOn = False
            MineHit = True
        End If
        
        If IsBomb = False Then
            If Maze(R, C) = 0 Then
                'MsgBox "Nice." & Maze(R, C), vbExclamation, "What? Error"
            End If
            If Maze(R, C) = -5 _
            Or Maze(R, C) = -25 Then
                'MsgBox "Flag." & Maze(R, C), vbCritical, "What? Error"
            End If
        End If
        
        If nCellsLeft <= 0 And IsBomb = False Then
            Call revealMines
                If tmr1Time.Enabled = True Then tmr1Time.Enabled = False
            TotalTime(0) = (Sec(0) * 1) + (Min(0) * 10 * 60) + (Hr(0) * 600) + (Sec(1) * 10) + (Min(1) * 100 * 60) + (Hr(1) * 10 * 600)
            imgFace.Picture = LoadPicture(App.Path & "\Images\Face3.bmp")
                If AITimer.Enabled = True Then MsgBox "You sweeped the whole area without hitting a mine! " & Maze(R, C) & " Time: " & TotalTime(0) & " Seconds", vbExclamation, "You Won!"
                AITimer.Enabled = False
                mnu1AIOn.Checked = False
                mnu1AIOff.Checked = True
            GameOn = False
        End If
        
        'Change Image
    End If


'Right Click?
    If Button = vbRightButton Then
        'Print "Right"
        C = (Index Mod XMaze)
        R = YMaze - (Index \ XMaze + 1)
        If Maze(R, C) = 1 Then
            Maze(R, C) = -5
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\Flag.bmp")
            imgCell(Index).Tag = "cFlag"
            nFlags(0) = nFlags(0) - 1
            frmMinesweeper.lbl2Flags.Caption = nFlags(0)
            GoTo B:
        End If
        If Maze(R, C) = -5 Then
            Maze(R, C) = 1
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
            imgCell(Index).Tag = ""
            nFlags(0) = nFlags(0) + 1
            frmMinesweeper.lbl2Flags.Caption = nFlags(0)
            GoTo B:
        End If
        
        If (Maze(R, C) = 5001 _
        Or Maze(R, C) = 5002 _
        Or Maze(R, C) = 5003 _
        Or Maze(R, C) = 5004 _
        Or Maze(R, C) = 5005 _
        Or Maze(R, C) = 5006 _
        Or Maze(R, C) = 5007 _
        Or Maze(R, C) = 5008) Then
            C = (Index Mod XMaze)
            R = YMaze - (Index \ XMaze + 1)
            For zoneCount = 5001 To 5008
                If Maze(R, C) = zoneCount Then
                    'frmMinesweeper.imgCell(Index).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                    imgCell(Index).Picture = LoadPicture(App.Path & "\Images\Flag.bmp")
                    Maze(R, C) = -125 + (5000 - zoneCount)
                    'MsgBox "Flag." & Maze(R, C), vbCritical, "What? Error"
                End If
            Next zoneCount
            imgCell(Index).Tag = "cFlag"
            nFlags(0) = nFlags(0) - 1
            frmMinesweeper.lbl2Flags.Caption = nFlags(0)
            GoTo B:
        End If
        
        If (Maze(R, C) = -126 _
        Or Maze(R, C) = -127 _
        Or Maze(R, C) = -128 _
        Or Maze(R, C) = -129 _
        Or Maze(R, C) = -130 _
        Or Maze(R, C) = -131 _
        Or Maze(R, C) = -132 _
        Or Maze(R, C) = -133) Then
            C = (Index Mod XMaze)
            R = YMaze - (Index \ XMaze + 1)
            
            For zoneCount = -126 To -133 Step -1
                If Maze(R, C) = zoneCount Then
                    'frmMinesweeper.imgCell(Index).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                    imgCell(Index).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
                    Maze(R, C) = -125 + (-zoneCount + 5000)
                    'MsgBox "Flag." & Maze(R, C), vbCritical, "What? Error"
                End If
            Next zoneCount
            imgCell(Index).Tag = ""
            nFlags(0) = nFlags(0) + 1
            frmMinesweeper.lbl2Flags.Caption = nFlags(0)
            GoTo B:
        End If
        If Maze(R, C) = 2 Then
            Maze(R, C) = -25
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\Flag.bmp")
            nFlags(0) = nFlags(0) - 1
            frmMinesweeper.lbl2Flags.Caption = nFlags(0)
            GoTo B:
        End If
        If Maze(R, C) = -25 Then
            Maze(R, C) = 2
            imgCell(Index).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
            nFlags(0) = nFlags(0) + 1
            frmMinesweeper.lbl2Flags.Caption = nFlags(0)
            GoTo B:
        End If
        
    End If
    
End If

B:

'Screen.MousePointer = vbDefault

End Sub

Private Sub imgFace_Click()

    Randomize
    
'Reset Board

    Screen.MousePointer = vbHourglass
    
    'For R = 0 - 1 To XMaze + 1
    '    For C = 0 - 1 To YMaze + 1
    '        Maze(R, C) = -30000
    '    Next C
    'Next R
    
    frmMinesweeper.tmr1Time.Enabled = False
    IsBomb = False
    
    'Step 1: Load Images
    With frmMinesweeper
        .imgFace.Picture = LoadPicture(App.Path & "\Images\Face1.bmp")
        For t = 0 To -1 + (XMaze * YMaze)
            .imgCell(t).Visible = False
            .imgCell(t).Enabled = False
            .imgCell(t).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
        Next t
    End With
    
    'Step 2: Array Images
    For i = 0 To -1 + (XMaze * YMaze)
        With frmMinesweeper
            'C = (i Mod XMaze)
            'R = YMaze - (i \ XMaze + 1)
            Maze(YMaze - (i \ XMaze + 1), i Mod XMaze + 1) = 1
            'Maze(R, C) = 1
            .imgCell(i).Tag = ""
            .imgCell(i).Visible = True
            .imgCell(i).Enabled = True
            .imgCell(i).Left = IntFactor + .imgCell(0).Width * (i Mod XMaze)   ' * (i Mod YMaze + 1 - 1)
            .imgCell(i).Top = IntFactor + .imgCell(0).Height * (i \ XMaze) + (.shpBox.Height + .shpBox.BorderWidth * 6) ' * (i \ XMaze + 1 - 1)
        End With
    Next i
    
    'Step 3: Set Form/Other Size
    With frmMinesweeper
        .Width = IntFactor + (.imgCell(0).Width * (XMaze)) + IntFactor + 95
        .Height = IntFactor + (.imgCell(0).Height * (YMaze)) + IntFactor + 725 + .shpBox.Height + .shpBox2.Height
        
        .shpBox.Left = 0
        .shpBox.Top = 0
        .shpBox.Width = IntFactor + (.imgCell(0).Width * (XMaze)) + IntFactor + 10
        
        .shpBox2.Left = 0
        .shpBox2.Top = .ScaleHeight - .shpBox2.Height
        .shpBox2.Width = IntFactor + (.imgCell(0).Width * (XMaze)) + IntFactor + 10
        
        .imgFace.Left = (.shpBox.Width / 2) - .imgFace.Width / 2
        .imgFace.Top = (.shpBox.Height / 2) - .imgFace.Height / 2
        
        .lbl1Time.Left = IntFactor - (IntFactor / 2)
        .lbl1Time.Top = .ScaleHeight - (.shpBox2.Height / 2) - .lbl1Time.Height / 2
        
        .lbl2Flags.Left = (.shpBox.Width) - .lbl2Flags.Width - IntFactor + (IntFactor / 2)
        .lbl2Flags.Top = .ScaleHeight - (.shpBox2.Height / 2) - .lbl2Flags.Height / 2
        
        .cmdAI.Left = .ScaleWidth - (.shpBox2.Width / 2) - .cmdAI.Width / 2
        .cmdAI.Top = .ScaleHeight - (.shpBox2.Height / 2) - .cmdAI.Height / 2
    End With
    
    'Step 4: Set Bombs
    With frmMinesweeper
    
    BombCountTemp = BTemp
A:

        i = Int(Rnd * (0 + (XMaze * YMaze)))
        
        'Check If Bomb
        If .imgCell(i).Tag <> "cBomb" Then
            .imgCell(i).Tag = "cBomb"
            BombCountTemp = BombCountTemp - 1
        Else
            GoTo A:
        End If
        
        If BombCountTemp > 0 Then
            GoTo A:
        End If
        
    End With
    
    'Step 5: Set Grid System
    With frmMinesweeper
        
        For i = 0 To -1 + (XMaze * YMaze)
            C = (i Mod XMaze)
            R = YMaze - (i \ XMaze + 1)
            If .imgCell(i).Tag = "" Then
                Maze(R, C) = 1
            End If
            If .imgCell(i).Tag = "cBomb" Then
                Maze(R, C) = 2
                .imgCell(i).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
            End If
        Next i
        
    End With
    
    'Step 6: Cells Left Variable
    nCellsLeft = (XMaze * YMaze) - NumBomb
    
    'Step 7: Reset Zone Values
    With frmMinesweeper
        For i = 0 To -1 + (XMaze * YMaze)
            C = (i Mod XMaze)
            R = YMaze - (i \ XMaze + 1)
            zoneValue(R, C) = 0
        Next i
    End With
    
    'Step 8: Set Zone Values
    
    '****//
    For i = 0 To -1 + (XMaze * YMaze)
    C = (i Mod XMaze)
    R = YMaze - (i \ XMaze + 1)
    
    'zoneValue(R, C) = 0
    
    If Maze(R, C) = 1 Then
    If Maze(R + -1, C + -1) = 2 Or Maze(R + -1, C + -1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 0, C + -1) = 2 Or Maze(R + 0, C + -1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 1, C + -1) = 2 Or Maze(R + 1, C + -1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    ''''''''''''''''''''''''''''''''''''''''''''''//
    If Maze(R + -1, C + 0) = 2 Or Maze(R + -1, C + 0) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    'If Maze(R + 0, C + 0) = 2 Or Maze(R + 0, C + 0) = -25 Then
    '    zoneValue(R, C) = zoneValue(R, C) + 1
    'End If
    If Maze(R + 1, C + 0) = 2 Or Maze(R + 1, C + 0) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    ''''''''''''''''''''''''''''''''''''''''''''''//
    If Maze(R + -1, C + 1) = 2 Or Maze(R + -1, C + 1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 0, C + 1) = 2 Or Maze(R + 0, C + 1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    If Maze(R + 1, C + 1) = 2 Or Maze(R + 1, C + 1) = -25 Then
        zoneValue(R, C) = zoneValue(R, C) + 1
    End If
    End If
    '****//
    For zoneCount = 1 To 8
        If zoneValue(R, C) = zoneCount Then
            Maze(R, C) = zoneCount + 5000
        End If
    Next zoneCount
    
    Next i
    
    'Step X: Start Game
        Sec(0) = 0
        Sec(1) = 0
        Min(0) = 0
        Min(1) = 0
        Hr(0) = 0
        Hr(1) = 0
    frmMinesweeper.lbl1Time.Caption = Hr(1) & Hr(0) & ":" & Min(1) & Min(0) & ":" & Sec(1) & Sec(0)
    nFlags(0) = BTemp
    frmMinesweeper.lbl2Flags.Caption = nFlags(0)
    GameOn = True
    Screen.MousePointer = vbDefault
    
End Sub

Private Sub mnu1AIOff_Click()

    AIDifficulty = 3
    mnu1AIOff.Checked = True
    mnu1AIOn.Checked = False
    
    For t = 0 To -1 + (XMaze * YMaze)
        Indexu2(t) = True
    Next t
    
    AITimer.Enabled = False
    AIRandomPickFirst = True
    
End Sub

Private Sub mnu1AIOn_Click()

    AIDifficulty = 3
    mnu1AIOff.Checked = False
    mnu1AIOn.Checked = True
    
    For t = 0 To -1 + (XMaze * YMaze)
        Indexu2(t) = True
    Next t
    
    AIRandomPickFirst = True
    AITimer.Enabled = True
    
End Sub

Private Sub mnu1Exit_Click()
    End
End Sub

Private Sub mnuCls_Click()
    Cls
End Sub

Private Sub mnuGrid_Click()
    For R = YMaze To 0 - 1 Step -1
        For C = 0 - 1 To XMaze
            Print AIValue(R, C);
        Next C
        Print:
    Next R
End Sub

Private Sub mnuMainMenu_Click()

Screen.MousePointer = vbHourglass
    With frmMinesweeper
        .AITimer.Enabled = False
        .mnu1AIOff.Checked = True
        .mnu1AIOn.Checked = False
        .imgFace.Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
        For t = -1 + (XMaze * YMaze) To 0 Step -1
            If .imgCell(t).Visible = True Or .imgCell(t).Enabled = True Then
                .imgCell(t).Height = DefaultCellSize
                .imgCell(t).Width = DefaultCellSize
                .imgCell(t).Visible = False
                .imgCell(t).Enabled = False
                .imgCell(t).Picture = LoadPicture(App.Path & "\Images\Cell.bmp")
                .imgCell(t).Left = 0
                .imgCell(t).Top = 0
            End If
        Next t
    End With
Screen.MousePointer = vbDefault

    frmLoadingScreen.Hide
    frmMinesweeper.Hide
    frmMainMenu.Show
    
End Sub

Private Sub revealBoardX()
C2 = C
R2 = R
XDefinition = XMaze
YDefinition = YMaze

xcor = C2 + 1
ycor = R2 + 1

Select Case Maze(ycor, xcor)
    Case 1
        Maze(xcor, ycor) = 0
End Select

End Sub

Private Sub revealBoard()

'*****>>>  Horizontal/Vertical Method  <<<*****'
'Screen.MousePointer = vbHourglass

C2 = C
R2 = R
XDefinition = XMaze
YDefinition = YMaze
'************revealLeft************
    'RowVar(0) = R
    'ColVar(0) = xcor
    For xcor = C To 0 Step -1
        'If normCell?
        If Maze(R, xcor) = 1 Then
            'Print "xcor" xcor
            Maze(R, xcor) = 0
            i = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
            imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
            imgCell(i).Tag = "cEmpty"
            nCellsLeft = nCellsLeft - 1
        End If
        
        'If non-normCell?
        If (Maze(R, xcor) = 5001 Or Maze(R, xcor) = -5001 _
        Or Maze(R, xcor) = 5002 Or Maze(R, xcor) = -5002 _
        Or Maze(R, xcor) = 5003 Or Maze(R, xcor) = -5003 _
        Or Maze(R, xcor) = 5004 Or Maze(R, xcor) = -5004 _
        Or Maze(R, xcor) = 5005 Or Maze(R, xcor) = -5005 _
        Or Maze(R, xcor) = 5006 Or Maze(R, xcor) = -5006 _
        Or Maze(R, xcor) = 5007 Or Maze(R, xcor) = -5007 _
        Or Maze(R, xcor) = 5008 Or Maze(R, xcor) = -5008) Then
            'Print "xcor" xcor
             i = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
            For zoneCount = 1 To 8
                If zoneValue(R, xcor) = zoneCount And imgCell(i).Tag = "" Then
                    frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                    nCellsLeft = nCellsLeft - 1
                    zoneValue(R, xcor) = -zoneCount
                    Maze(R, xcor) = -zoneCount + -5000
                End If
            Next zoneCount
            imgCell(i).Tag = "cEmpty"
            xcor = 0
            GoTo aEnd:
        End If
        
        'If Bomb?
        If Maze(R, xcor) = 2 Then
            xcor = 0
            GoTo aEnd:
        End If
        
    '>><<revealDown
        For ycor = R2 To 0 Step -1
        C2 = xcor
            'If normCell?
            If Maze(ycor, C2) = 1 Then
                'Print "ycor" ycor
                Maze(ycor, C2) = 0
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(ycor, C2) = 5001 Or Maze(ycor, C2) = -5001 _
            Or Maze(ycor, C2) = 5002 Or Maze(ycor, C2) = -5002 _
            Or Maze(ycor, C2) = 5003 Or Maze(ycor, C2) = -5003 _
            Or Maze(ycor, C2) = 5004 Or Maze(ycor, C2) = -5004 _
            Or Maze(ycor, C2) = 5005 Or Maze(ycor, C2) = -5005 _
            Or Maze(ycor, C2) = 5006 Or Maze(ycor, C2) = -5006 _
            Or Maze(ycor, C2) = 5007 Or Maze(ycor, C2) = -5007 _
            Or Maze(ycor, C2) = 5008 Or Maze(ycor, C2) = -5008) Then
                'Print "ycor" ycor
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(ycor, C2) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(ycor, C2) = -zoneCount
                        Maze(ycor, C2) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                ycor = 0
            End If
            
            'If Bomb?
            If Maze(ycor, C2) = 2 Then
                ycor = 0
            End If
            
        Next ycor
        
    '>><<revealUp
        For ycor = R2 To -1 + YDefinition Step 1
        C2 = xcor
            'If normCell?
            If Maze(ycor, C2) = 1 Then
                'Print "ycor" ycor
                Maze(ycor, C2) = 0
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(ycor, C2) = 5001 Or Maze(ycor, C2) = -5001 _
            Or Maze(ycor, C2) = 5002 Or Maze(ycor, C2) = -5002 _
            Or Maze(ycor, C2) = 5003 Or Maze(ycor, C2) = -5003 _
            Or Maze(ycor, C2) = 5004 Or Maze(ycor, C2) = -5004 _
            Or Maze(ycor, C2) = 5005 Or Maze(ycor, C2) = -5005 _
            Or Maze(ycor, C2) = 5006 Or Maze(ycor, C2) = -5006 _
            Or Maze(ycor, C2) = 5007 Or Maze(ycor, C2) = -5007 _
            Or Maze(ycor, C2) = 5008 Or Maze(ycor, C2) = -5008) Then
                'Print "ycor" ycor
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(ycor, C2) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(ycor, C2) = -zoneCount
                        Maze(ycor, C2) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                ycor = -1 + YDefinition
            End If
            
            'If Bomb?
            If Maze(ycor, C2) = 2 Then
                ycor = -1 + YDefinition
            End If
            
        Next ycor
        
aEnd:
    Next xcor
    
C2 = C
R2 = R

'************revealRight************
    For xcor = C To -1 + XDefinition Step 1
        'If normCell?
        If Maze(R, xcor) = 1 Then
            'Print "xcor" xcor
            Maze(R, xcor) = 0
            i = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
            imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
            imgCell(i).Tag = "cEmpty"
            nCellsLeft = nCellsLeft - 1
        End If
        
        'If non-normCell?
        If (Maze(R, xcor) = 5001 Or Maze(R, xcor) = -5001 _
        Or Maze(R, xcor) = 5002 Or Maze(R, xcor) = -5002 _
        Or Maze(R, xcor) = 5003 Or Maze(R, xcor) = -5003 _
        Or Maze(R, xcor) = 5004 Or Maze(R, xcor) = -5004 _
        Or Maze(R, xcor) = 5005 Or Maze(R, xcor) = -5005 _
        Or Maze(R, xcor) = 5006 Or Maze(R, xcor) = -5006 _
        Or Maze(R, xcor) = 5007 Or Maze(R, xcor) = -5007 _
        Or Maze(R, xcor) = 5008 Or Maze(R, xcor) = -5008) Then
            'Print "xcor" xcor
            i = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
            For zoneCount = 1 To 8
                If zoneValue(R, xcor) = zoneCount And imgCell(i).Tag = "" Then
                    frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                    nCellsLeft = nCellsLeft - 1
                    zoneValue(R, xcor) = -zoneCount
                    Maze(R, xcor) = -zoneCount + -5000
                End If
            Next zoneCount
            imgCell(i).Tag = "cEmpty"
            xcor = -1 + XDefinition
            GoTo bEnd:
        End If
        
        'If Bomb?
        If Maze(R, xcor) = 2 Then
            xcor = -1 + XDefinition
            GoTo bEnd:
        End If
        
    '>><<revealDown
        For ycor = R2 To 0 Step -1
        C2 = xcor
            'If normCell?
            If Maze(ycor, C2) = 1 Then
                'Print "ycor" ycor
                Maze(ycor, C2) = 0
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(ycor, C2) = 5001 Or Maze(ycor, C2) = -5001 _
            Or Maze(ycor, C2) = 5002 Or Maze(ycor, C2) = -5002 _
            Or Maze(ycor, C2) = 5003 Or Maze(ycor, C2) = -5003 _
            Or Maze(ycor, C2) = 5004 Or Maze(ycor, C2) = -5004 _
            Or Maze(ycor, C2) = 5005 Or Maze(ycor, C2) = -5005 _
            Or Maze(ycor, C2) = 5006 Or Maze(ycor, C2) = -5006 _
            Or Maze(ycor, C2) = 5007 Or Maze(ycor, C2) = -5007 _
            Or Maze(ycor, C2) = 5008 Or Maze(ycor, C2) = -5008) Then
                'Print "ycor" ycor
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(ycor, C2) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(ycor, C2) = -zoneCount
                        Maze(ycor, C2) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                ycor = 0
            End If
            
            'If Bomb?
            If Maze(ycor, C2) = 2 Then
                ycor = 0
            End If
            
        Next ycor
        
    '>><<revealUp
        For ycor = R2 To -1 + YDefinition Step 1
        C2 = xcor
            'If normCell?
            If Maze(ycor, C2) = 1 Then
                'Print "ycor" ycor
                Maze(ycor, C2) = 0
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(ycor, C2) = 5001 Or Maze(ycor, C2) = -5001 _
            Or Maze(ycor, C2) = 5002 Or Maze(ycor, C2) = -5002 _
            Or Maze(ycor, C2) = 5003 Or Maze(ycor, C2) = -5003 _
            Or Maze(ycor, C2) = 5004 Or Maze(ycor, C2) = -5004 _
            Or Maze(ycor, C2) = 5005 Or Maze(ycor, C2) = -5005 _
            Or Maze(ycor, C2) = 5006 Or Maze(ycor, C2) = -5006 _
            Or Maze(ycor, C2) = 5007 Or Maze(ycor, C2) = -5007 _
            Or Maze(ycor, C2) = 5008 Or Maze(ycor, C2) = -5008) Then
                'Print "ycor" ycor
                i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C2 * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(ycor, C2) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(ycor, C2) = -zoneCount
                        Maze(ycor, C2) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                ycor = -1 + YDefinition
            End If
            
            'If Bomb?
            If Maze(ycor, C2) = 2 Then
                ycor = -1 + YDefinition
            End If
            
        Next ycor
        
bEnd:
    Next xcor
    
C2 = C
R2 = R

'************revealDown************
    For ycor = R To 0 Step -1
        'If normCell?
        If Maze(ycor, C) = 1 Then
            'Print "ycor" ycor
            Maze(ycor, C) = 0
            i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
            imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
            imgCell(i).Tag = "cEmpty"
            nCellsLeft = nCellsLeft - 1
        End If
        
        'If non-normCell?
        If (Maze(ycor, C) = 5001 Or Maze(ycor, C) = -5001 _
        Or Maze(ycor, C) = 5002 Or Maze(ycor, C) = -5002 _
        Or Maze(ycor, C) = 5003 Or Maze(ycor, C) = -5003 _
        Or Maze(ycor, C) = 5004 Or Maze(ycor, C) = -5004 _
        Or Maze(ycor, C) = 5005 Or Maze(ycor, C) = -5005 _
        Or Maze(ycor, C) = 5006 Or Maze(ycor, C) = -5006 _
        Or Maze(ycor, C) = 5007 Or Maze(ycor, C) = -5007 _
        Or Maze(ycor, C) = 5008 Or Maze(ycor, C) = -5008) Then
            'Print "ycor" ycor
            i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
            For zoneCount = 1 To 8
                If zoneValue(ycor, C) = zoneCount And imgCell(i).Tag = "" Then
                    frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                    nCellsLeft = nCellsLeft - 1
                    zoneValue(ycor, C) = -zoneCount
                    Maze(ycor, C) = -zoneCount + -5000
                End If
            Next zoneCount
            imgCell(i).Tag = "cEmpty"
            ycor = 0
            GoTo cEnd:
        End If
        
        'If Bomb?
        If Maze(ycor, C) = 2 Then
            ycor = 0
            GoTo cEnd:
        End If
        
    '>><<revealLeft
        For xcor = C2 To 0 Step -1
        R2 = ycor
            'If normCell?
            If Maze(R2, xcor) = 1 Then
                'Print "xcor" xcor
                Maze(R2, xcor) = 0
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(R2, xcor) = 5001 Or Maze(R2, xcor) = -5001 _
            Or Maze(R2, xcor) = 5002 Or Maze(R2, xcor) = -5002 _
            Or Maze(R2, xcor) = 5003 Or Maze(R2, xcor) = -5003 _
            Or Maze(R2, xcor) = 5004 Or Maze(R2, xcor) = -5004 _
            Or Maze(R2, xcor) = 5005 Or Maze(R2, xcor) = -5005 _
            Or Maze(R2, xcor) = 5006 Or Maze(R2, xcor) = -5006 _
            Or Maze(R2, xcor) = 5007 Or Maze(R2, xcor) = -5007 _
            Or Maze(R2, xcor) = 5008 Or Maze(R2, xcor) = -5008) Then
                'Print "xcor" xcor
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(R2, xcor) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(R2, xcor) = -zoneCount
                        Maze(R2, xcor) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                xcor = 0
            End If
            
            'If Bomb?
            If Maze(R2, xcor) = 2 Then
                xcor = 0
            End If
        Next xcor
        
    '>><<revealRight
        For xcor = C2 To -1 + XDefinition Step 1
        R2 = ycor
            'If normCell?
            If Maze(R2, xcor) = 1 Then
                'Print "xcor" xcor
                Maze(R2, xcor) = 0
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(R2, xcor) = 5001 Or Maze(R2, xcor) = -5001 _
            Or Maze(R2, xcor) = 5002 Or Maze(R2, xcor) = -5002 _
            Or Maze(R2, xcor) = 5003 Or Maze(R2, xcor) = -5003 _
            Or Maze(R2, xcor) = 5004 Or Maze(R2, xcor) = -5004 _
            Or Maze(R2, xcor) = 5005 Or Maze(R2, xcor) = -5005 _
            Or Maze(R2, xcor) = 5006 Or Maze(R2, xcor) = -5006 _
            Or Maze(R2, xcor) = 5007 Or Maze(R2, xcor) = -5007 _
            Or Maze(R2, xcor) = 5008 Or Maze(R2, xcor) = -5008) Then
                'Print "xcor" xcor
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(R2, xcor) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(R2, xcor) = -zoneCount
                        Maze(R2, xcor) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                xcor = -1 + XDefinition
            End If
            
            'If Bomb?
            If Maze(R2, xcor) = 2 Then
                xcor = -1 + XDefinition
            End If
        Next xcor
        
cEnd:
    Next ycor
    
C2 = C
R2 = R

'************revealUp************
    For ycor = R To -1 + YDefinition Step 1
        'If normCell?
        If Maze(ycor, C) = 1 Then
            'Print "ycor" ycor
            Maze(ycor, C) = 0
            i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
            imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
            imgCell(i).Tag = "cEmpty"
            nCellsLeft = nCellsLeft - 1
        End If
        
        'If non-normCell?
        If (Maze(ycor, C) = 5001 Or Maze(ycor, C) = -5001 _
        Or Maze(ycor, C) = 5002 Or Maze(ycor, C) = -5002 _
        Or Maze(ycor, C) = 5003 Or Maze(ycor, C) = -5003 _
        Or Maze(ycor, C) = 5004 Or Maze(ycor, C) = -5004 _
        Or Maze(ycor, C) = 5005 Or Maze(ycor, C) = -5005 _
        Or Maze(ycor, C) = 5006 Or Maze(ycor, C) = -5006 _
        Or Maze(ycor, C) = 5007 Or Maze(ycor, C) = -5007 _
        Or Maze(ycor, C) = 5008 Or Maze(ycor, C) = -5008) Then
            'Print "ycor" ycor
            i = ((-1 * (ycor * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
            For zoneCount = 1 To 8
                If zoneValue(ycor, C) = zoneCount And imgCell(i).Tag = "" Then
                    frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                    nCellsLeft = nCellsLeft - 1
                    zoneValue(ycor, C) = -zoneCount
                    Maze(ycor, C) = -zoneCount + -5000
                End If
            Next zoneCount
            imgCell(i).Tag = "cEmpty"
            ycor = -1 + YDefinition
            GoTo dEnd:
        End If
        
        'If Bomb?
        If Maze(ycor, C) = 2 Then
            ycor = -1 + YDefinition
            GoTo dEnd:
        End If
        
    '>><<revealLeft
        For xcor = C2 To 0 Step -1
        R2 = ycor
            'If normCell?
            If Maze(R2, xcor) = 1 Then
                'Print "xcor" xcor
                Maze(R2, xcor) = 0
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(R2, xcor) = 5001 Or Maze(R2, xcor) = -5001 _
            Or Maze(R2, xcor) = 5002 Or Maze(R2, xcor) = -5002 _
            Or Maze(R2, xcor) = 5003 Or Maze(R2, xcor) = -5003 _
            Or Maze(R2, xcor) = 5004 Or Maze(R2, xcor) = -5004 _
            Or Maze(R2, xcor) = 5005 Or Maze(R2, xcor) = -5005 _
            Or Maze(R2, xcor) = 5006 Or Maze(R2, xcor) = -5006 _
            Or Maze(R2, xcor) = 5007 Or Maze(R2, xcor) = -5007 _
            Or Maze(R2, xcor) = 5008 Or Maze(R2, xcor) = -5008) Then
                'Print "xcor" xcor
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(R2, xcor) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(R2, xcor) = -zoneCount
                        Maze(R2, xcor) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                xcor = 0
            End If
            
            'If Bomb?
            If Maze(R2, xcor) = 2 Then
                xcor = 0
            End If
        Next xcor
        
    '>><<revealRight
        For xcor = C2 To -1 + XDefinition Step 1
        R2 = ycor
            'If normCell?
            If Maze(R2, xcor) = 1 Then
                'Print "xcor" xcor
                Maze(R2, xcor) = 0
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                imgCell(i).Picture = LoadPicture(App.Path & "\Images\CellClicked.bmp")
                imgCell(i).Tag = "cEmpty"
                nCellsLeft = nCellsLeft - 1
            End If
            
            'If non-normCell?
            If (Maze(R2, xcor) = 5001 Or Maze(R2, xcor) = -5001 _
            Or Maze(R2, xcor) = 5002 Or Maze(R2, xcor) = -5002 _
            Or Maze(R2, xcor) = 5003 Or Maze(R2, xcor) = -5003 _
            Or Maze(R2, xcor) = 5004 Or Maze(R2, xcor) = -5004 _
            Or Maze(R2, xcor) = 5005 Or Maze(R2, xcor) = -5005 _
            Or Maze(R2, xcor) = 5006 Or Maze(R2, xcor) = -5006 _
            Or Maze(R2, xcor) = 5007 Or Maze(R2, xcor) = -5007 _
            Or Maze(R2, xcor) = 5008 Or Maze(R2, xcor) = -5008) Then
                'Print "xcor" xcor
                i = ((-1 * (R2 * XDefinition)) + (XDefinition * YDefinition)) + ((xcor * 1) - XDefinition)
                For zoneCount = 1 To 8
                    If zoneValue(R2, xcor) = zoneCount And imgCell(i).Tag = "" Then
                        frmMinesweeper.imgCell(i).Picture = LoadPicture(App.Path & "\Images\" & zoneCount & ".bmp")
                        nCellsLeft = nCellsLeft - 1
                        zoneValue(R2, xcor) = -zoneCount
                        Maze(R2, xcor) = -zoneCount + -5000
                    End If
                Next zoneCount
                imgCell(i).Tag = "cEmpty"
                xcor = -1 + XDefinition
            End If
            
            'If Bomb?
            If Maze(R2, xcor) = 2 Then
                xcor = -1 + XDefinition
            End If
        Next xcor
        
dEnd:
    Next ycor
    
B:
    callAgain = False
    
'Screen.MousePointer = vbDefault

End Sub

Private Sub revealMore()

'Screen.MousePointer = vbHourglass

    'wip
    XDefinition = XMaze
    YDefinition = YMaze
    
    C2 = C
    R2 = R
    'Print "Reveal"
    
gUp:
    TempNum1 = 1
    TempNum2 = 0
    'Go Up
    If Maze(R2 + TempNum1, C2 + TempNum2) = 1 Or Maze(R2 + TempNum1, C2 + TempNum2) = 0 _
    Or (Maze(R2 + TempNum1, C2 + TempNum2) = 5001 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5001 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5002 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5002 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5003 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5003 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5004 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5004 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5005 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5005 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5006 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5006 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5007 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5007 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5008 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5008) Then
        t = ((-1 * ((R2 + TempNum1) * XDefinition)) + (XDefinition * YDefinition)) + (((C2 + TempNum2) * 1) - XDefinition)
        imgCell_MouseUp t, vbLeftButton, 0, 0, 0
        
        C2 = C2 + 1
        R2 = R2 + 0
        
        If (Maze(R2 + TempNum1, C2 + TempNum2) = 5001 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5001 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5002 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5002 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5003 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5003 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5004 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5004 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5005 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5005 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5006 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5006 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5007 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5007 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5008 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5008) Then
            t = ((-1 * ((R2 + TempNum1) * XDefinition)) + (XDefinition * YDefinition)) + (((C2 + TempNum2) * 1) - XDefinition)
            imgCell_MouseUp t, vbLeftButton, 0, 0, 0
        End If
        
        If C > XDefinition - 1 Then
            C = C - 1
        End If
        If C < 0 Then
            C = C + 1
        End If
        If R > YDefinition - 1 Then
            R = R - 1
        End If
        If R < 0 Then
            R = R + 1
        End If
        
        If C2 > XDefinition - 1 Then
            C2 = C2 - 1
            GoTo gRight:
        End If
        If C2 < 0 Then
            C2 = C2 + 1
            GoTo gRight:
        End If
        If R2 > YDefinition - 1 Then
            R2 = R2 - 1
            GoTo gRight:
        End If
        If R2 < 0 Then
            R2 = R2 + 1
            GoTo gRight:
        End If
        
        callAgain = True
        GoTo B:
    End If
    
gRight:
    TempNum1 = 0
    TempNum2 = 1
    'Go Right
    If Maze(R2 + TempNum1, C2 + TempNum2) = 1 Or Maze(R2 + TempNum1, C2 + TempNum2) = 0 _
    Or (Maze(R2 + TempNum1, C2 + TempNum2) = 5001 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5001 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5002 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5002 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5003 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5003 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5004 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5004 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5005 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5005 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5006 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5006 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5007 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5007 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5008 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5008) Then
        t = ((-1 * ((R2 + TempNum1) * XDefinition)) + (XDefinition * YDefinition)) + (((C2 + TempNum2) * 1) - XDefinition)
        imgCell_MouseUp t, vbLeftButton, 0, 0, 0
        
        C2 = C2 + 1
        R2 = R2 + 0
        
        If (Maze(R2 + TempNum1, C2 + TempNum2) = 5001 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5001 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5002 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5002 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5003 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5003 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5004 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5004 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5005 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5005 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5006 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5006 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5007 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5007 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5008 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5008) Then
            t = ((-1 * ((R2 + TempNum1) * XDefinition)) + (XDefinition * YDefinition)) + (((C2 + TempNum2) * 1) - XDefinition)
            imgCell_MouseUp t, vbLeftButton, 0, 0, 0
        End If
        
        If C > XDefinition - 1 Then
            C = C - 1
        End If
        If C < 0 Then
            C = C + 1
        End If
        If R > YDefinition - 1 Then
            R = R - 1
        End If
        If R < 0 Then
            R = R + 1
        End If
        
        If C2 > XDefinition - 1 Then
            C2 = C2 - 1
            GoTo gDown:
        End If
        If C2 < 0 Then
            C2 = C2 + 1
            GoTo gDown:
        End If
        If R2 > YDefinition - 1 Then
            R2 = R2 - 1
            GoTo gDown:
        End If
        If R2 < 0 Then
            R2 = R2 + 1
            GoTo gDown:
        End If
        
        callAgain = True
        GoTo B:
    End If
    
gDown:
    TempNum1 = -1
    TempNum2 = 0
    'Go Down
    If Maze(R2 + TempNum1, C2 + TempNum2) = 1 Or Maze(R2 + TempNum1, C2 + TempNum2) = 0 _
    Or (Maze(R2 + TempNum1, C2 + TempNum2) = 5001 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5001 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5002 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5002 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5003 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5003 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5004 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5004 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5005 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5005 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5006 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5006 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5007 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5007 _
    Or Maze(R2 + TempNum1, C2 + TempNum2) = 5008 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5008) Then
        t = ((-1 * ((R2 + TempNum1) * XDefinition)) + (XDefinition * YDefinition)) + (((C2 + TempNum2) * 1) - XDefinition)
        imgCell_MouseUp t, vbLeftButton, 0, 0, 0
        
        C2 = C2 + 0
        R2 = R2 + -1
        
        If (Maze(R2 + TempNum1, C2 + TempNum2) = 5001 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5001 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5002 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5002 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5003 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5003 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5004 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5004 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5005 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5005 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5006 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5006 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5007 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5007 _
        Or Maze(R2 + TempNum1, C2 + TempNum2) = 5008 Or Maze(R2 + TempNum1, C2 + TempNum2) = -5008) Then
            t = ((-1 * ((R2 + TempNum1) * XDefinition)) + (XDefinition * YDefinition)) + (((C2 + TempNum2) * 1) - XDefinition)
            imgCell_MouseUp t, vbLeftButton, 0, 0, 0
        End If
        
        If C > XDefinition - 1 Then
            C = C - 1
        End If
        If C < 0 Then
            C = C + 1
        End If
        If R > YDefinition - 1 Then
            R = R - 1
        End If
        If R < 0 Then
            R = R + 1
        End If
        
        If C2 > XDefinition - 1 Then
            C2 = C2 - 1
            GoTo gLeft:
        End If
        If C2 < 0 Then
            C2 = C2 + 1
            GoTo gLeft:
        End If
        If R2 > YDefinition - 1 Then
            R2 = R2 - 1
            GoTo gLeft:
        End If
        If R2 < 0 Then
            R2 = R2 + 1
            GoTo gLeft:
        End If
        
        callAgain = True
        GoTo B:
    End If
    
gLeft:

C:
    callAgain = False
B:
    
'Screen.MousePointer = vbDefault

End Sub

Private Sub revealMines()

Screen.MousePointer = vbHourglass

    For t = 0 To -1 + (XMaze * YMaze)
    C = (t Mod XMaze)
    R = YMaze - (t \ XMaze + 1)
    
        If imgCell(t).Tag = "cBomb" Then
            imgCell(t).Picture = LoadPicture(App.Path & "\Images\Mine.bmp")
        End If
        
        If imgCell(t).Tag = "cBomb" _
        And (Maze(R, C) = -5 _
        Or Maze(R, C) = -25 _
        Or Maze(R, C) = -126 _
        Or Maze(R, C) = -127 _
        Or Maze(R, C) = -128 _
        Or Maze(R, C) = -129 _
        Or Maze(R, C) = -130 _
        Or Maze(R, C) = -131 _
        Or Maze(R, C) = -132 _
        Or Maze(R, C) = -133) Then
            imgCell(t).Picture = LoadPicture(App.Path & "\Images\MineFlag.bmp")
        End If
        
        If imgCell(t).Tag = "cFlag" _
        And (Maze(R, C) = -5 _
        Or Maze(R, C) = -126 _
        Or Maze(R, C) = -127 _
        Or Maze(R, C) = -128 _
        Or Maze(R, C) = -129 _
        Or Maze(R, C) = -130 _
        Or Maze(R, C) = -131 _
        Or Maze(R, C) = -132 _
        Or Maze(R, C) = -133) Then
            imgCell(t).Picture = LoadPicture(App.Path & "\Images\NotMine.bmp")
        End If
    Next t
    
Screen.MousePointer = vbDefault

End Sub

Private Sub mnuOptions_Click()
    
    frmOptions.Show
    
    With frmOptions
        .txtCLength = XMaze
        .txtCHeight = YMaze
        .txtCMines = NumBomb
    End With
    
End Sub

Private Sub mnuPrint_Click()
Print nCellsLeft
End Sub

Private Sub tmr1Time_Timer()
    
    Sec(0) = Sec(0) + 1
    
    If Sec(0) > 9 Then
        Sec(0) = 0
        Sec(1) = Sec(1) + 1
    End If
    If Sec(1) > 5 Then
        Sec(1) = 0
        Min(0) = Min(0) + 1
    End If
    If Min(0) > 9 Then
        Min(0) = 0
        Min(1) = Min(1) + 1
    End If
    If Min(1) > 5 Then
        Min(1) = 0
        Hr(0) = Hr(0) + 1
    End If
    If Hr(0) > 9 Then
        Hr(0) = 0
        Hr(1) = Hr(1) + 1
    End If
    If Hr(1) > 9 Then
        Sec(0) = 0
        Sec(1) = 0
        Min(0) = 0
        Min(1) = 0
        Hr(0) = 0
        Hr(1) = 0
    End If
    
    'Display Time on 'lbl1Time'
    lbl1Time.Caption = Hr(1) & Hr(0) & ":" & Min(1) & Min(0) & ":" & Sec(1) & Sec(0)
    
End Sub
