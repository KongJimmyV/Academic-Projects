Attribute VB_Name = "MainModule"

Public MusicBGM As Integer

'*Terms
Public GameOn As Boolean
Public TurnPlayer As Boolean
Public TurnPlayer2 As Boolean
Public TurnAI As Boolean
Public Player1Placement As Boolean
Public Player2Placement As Boolean

Public HitContinue As Boolean

Public IndexGrid As Integer
Public XDefinition As Integer
Public YDefinition As Integer

Public ShipDefaultPos As Integer
Public PlaceShips As Boolean

Public Hit As Boolean
Public Miss As Boolean

Public NCount As Integer

Public Ships(0 To 5) As String
Public q As Integer

Public I As Integer
Public IArray(0 To 1000) As Integer
Public IndexStat(0 To 99) As String 'For Index
Public IndexStatRC(-104 To 113, -104 To 113) As String 'For Rows and Cols
Public IndexStat2(0 To 99) As String
Public IndexStatRC2(-104 To 113, -104 To 113) As String

Public ITemp As Integer
Public ITemp2 As Integer
Public IT As Integer
Public IT2 As Integer
Public I1 As Integer
Public I2 As Integer

Public t As Integer
Public s As Integer
Public l As Integer
Public n As Integer
Public m As Integer
Public p As Integer

Public Y As Long
Public X As Long

Public R As Integer
Public C As Integer
Public Rt As Integer
Public Ct As Integer

Public Rank As Integer
Public File As Integer
Public RankFile(-10 To 19, -10 To 19) As String

Public MoveNum(0 To 3) As Integer

Public num As Integer
Public num2 As Integer
Public num3 As Integer

Public RandNum As Integer
Public Rand As Integer
Public RandomIComp As Integer

Public P1WinCount As Integer
Public P1LoseCount As Integer
Public P2WinCount As Integer
Public P2LoseCount As Integer

Public AIWin(1 To 6) As Integer
Public AILose(1 To 6) As Integer

'AI Terms
Public AIFoundShip As Boolean
Public AIClick As Integer
Public AIDifficulty As Integer
Public AITarget(-10 To 19, -10 To 19) As Integer
Public AIDirection As Integer
Public DoRandom As Boolean
Public EvalCheck As Boolean
Public HitFound As Boolean
Public TimeCheck As Integer

Public HitFoundPatrolBoat As Boolean
Public HitFoundDestroyer As Boolean
Public HitFoundSubmarine As Boolean
Public HitFoundBattleship As Boolean
Public HitFoundCarrier As Boolean

Public rTemp As Integer
Public cTemp As Integer

'*Map
Public Grid(-104 To 113, -104 To 113) As Integer
Public Grid2(-104 To 113, -104 To 113) As Integer
Public Letters(0 To 9) As Integer
Public Numbers(0 To 9) As Integer
Public Row As Integer
Public Col As Integer
Public RowTemp As Integer
Public ColTemp As Integer

'*Ships ***'0 = P1 '1 = P2***
Public ShipNum As Integer
Public ShipsLeft As Integer

'Deadships
Public DeadCarrier(0 To 1) As Boolean
Public DeadBattleship(0 To 1) As Boolean
Public DeadSubmarine(0 To 1) As Boolean
Public DeadDestroyer(0 To 1) As Boolean
Public DeadPatrolBoat(0 To 1) As Boolean

'Ship Placement
Public PlacementVH As Integer
Public PlaceDirection(0 To 1) As Boolean
Public PlaceCarrier(0 To 1) As Boolean
Public PlaceBattleship(0 To 1) As Boolean
Public PlaceSubmarine(0 To 1) As Boolean
Public PlaceDestroyer(0 To 1) As Boolean
Public PlacePatrolBoat(0 To 1) As Boolean

'Ship Health
Public HealthCarrier(0 To 1) As Integer
Public HealthBattleship(0 To 1) As Integer
Public HealthSubmarine(0 To 1) As Integer
Public HealthDestroyer(0 To 1) As Integer
Public HealthPatrolBoat(0 To 1) As Integer

