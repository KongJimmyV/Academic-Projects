Attribute VB_Name = "MainModule"

'*Constants
Public Const GMsingleSHOT = 0           'const
Public Const GMhitSHOT = 1              'const
Public Const GMmultiSHOT = 2            'const
Public Const GMshipmultiSHOT = 3        'const

'*Misc
Public MusicBGM                     As Integer      'Not Sure Yet

Public str1(0 To 5)                 As String       'temp string

'*MiscTerms
Public Gamemode             As Integer      'Selects Gamemode
Public GamemodeNum          As Integer      'temp variable

Public GameOn               As Boolean      'isGameOn?
Public TurnPlayer           As Boolean      'Player1's turn?
Public TurnPlayer2          As Boolean      'Player2's turn?
Public TurnAI               As Boolean      'isAI's turn?
Public Player1Placement     As Boolean      'isPlayer1 placing?
Public Player2Placement     As Boolean      'isPlayer2 placing?

Public HitContinue          As Boolean      'Not Used

Public IndexGrid            As Integer      'variable
Public XDefinition          As Integer      'x length of board
Public YDefinition          As Integer      'y length of board

Public ShipDefaultPos       As Integer      'Default ship position
Public PlaceShips           As Boolean      'canPlace Ships?

Public Hit                  As Boolean      'bool
Public Miss                 As Boolean      'bool

Public NCount               As Integer      'variable

Public Ships(0 To 5)                                As String       'string
Public q                                            As Integer      'variable

Public I                                            As Integer      'variable
Public IArray(0 To 1000)                            As Integer      'temp variable
Public IndexStat(0 To 99)                           As String       'store string For Index P1
Public IndexStatRC(-104 To 113, -104 To 113)        As String       'store string For Rows and Cols P1
Public IndexStat2(0 To 99)                          As String       'store string For Index P2
Public IndexStatRC2(-104 To 113, -104 To 113)       As String       'store string For Rows and Cols P2

Public ITemp        As Integer      'variable
Public ITemp2       As Integer      'variable
Public IT           As Integer      'variable
Public IT2          As Integer      'variable
Public I1           As Integer      'variable
Public I2           As Integer      'variable

Public t            As Integer      'variable
Public s            As Integer      'variable
Public l            As Integer      'variable
Public n            As Integer      'variable
Public m            As Integer      'variable
Public p            As Integer      'variable
Public f            As Integer      'variable

Public Y               As Long      'long
Public X               As Long      'long

Public R            As Integer      'variable
Public C            As Integer      'variable
Public Rt           As Integer      'variable
Public Ct           As Integer      'variable

Public Rank                             As Integer      'variable
Public File                             As Integer      'variable
Public RankFile(-10 To 19, -10 To 19)   As String       'string

Public MoveNum(0 To 3)                  As Integer      'variable

Public strMove(0 To 10000, 0 To 1)      As String       'Store moves as string
Public intMove(0 To 10000, 0 To 1)      As Integer      'Store moves as integers
Public f1                               As Integer      'variable
Public f2                               As Integer      'variable

Public num                  As Integer                  'variable
Public num2                 As Integer                  'variable
Public num3                 As Integer                  'variable

Public RandNum                          As Integer      'variable
Public Rand                             As Integer      'variable
Public RandomIComp                      As Integer      'variable

Public P1WinCount                       As Integer      'variable
Public P1LoseCount                      As Integer      'variable
Public P2WinCount                       As Integer      'variable
Public P2LoseCount                      As Integer      'variable

Public AIWin(1 To 6)                    As Integer      'variable
Public AILose(1 To 6)                   As Integer      'variable

'AI Terms
Public AIFoundShip                      As Boolean      'Not Used
Public AIClick                          As Integer      'Not Sure Yet
Public AIDifficulty                     As Integer      'AI's Difficulty
Public AITarget(-10 To 19, -10 To 19)   As Integer      'Not Used
Public AIDirection                      As Integer      'Not Used
Public DoRandom                         As Boolean      'Not Sure Yet
Public EvalCheck                        As Boolean      'Not Used
Public HitFound                         As Boolean      'Did AI find player's Ship?
Public TimeCheck                        As Integer      'Not Used

Public HitFoundPatrolBoat               As Boolean      'bool
Public HitFoundDestroyer                As Boolean      'bool
Public HitFoundSubmarine                As Boolean      'bool
Public HitFoundBattleship               As Boolean      'bool
Public HitFoundCarrier                  As Boolean      'bool

Public rTemp                            As Integer      'variable
Public cTemp                            As Integer      'variable

'*Map/Grid
Public Grid(-104 To 113, -104 To 113)   As Integer      'variable
Public Grid2(-104 To 113, -104 To 113)  As Integer      'variable
Public Letters(0 To 9)                  As Integer      'variable
Public Numbers(0 To 9)                  As Integer      'variable
Public Row                              As Integer      'variable
Public Col                              As Integer      'variable
Public RowTemp                          As Integer      'variable
Public ColTemp                          As Integer      'variable

'*Ships ***'0 = P1 '1 = P2***
Public ShipNum                          As Integer      'variable
Public ShipsLeft                        As Integer      'Num of Ships left to place

Public NumOfShotsLeft(0 To 1)           As Integer      'Number of Shots left
Public NumOfShipsLeft(0 To 1)           As Integer      'Number of Current Ships left

'*Deadships
Public DeadCarrier(0 To 1)              As Boolean      'isCarrier Dead?
Public DeadBattleship(0 To 1)           As Boolean      'isBattleship Dead?
Public DeadSubmarine(0 To 1)            As Boolean      'isSubmarine Dead?
Public DeadDestroyer(0 To 1)            As Boolean      'isDestroyer Dead?
Public DeadPatrolBoat(0 To 1)           As Boolean      'isPatrolBoat Dead?

'*Ship Placement
Public PlacementVH                      As Integer      'Not Sure
Public PlaceDirection(0 To 1)           As Boolean      'isPlacing Ship Direction?
Public PlaceCarrier(0 To 1)             As Boolean      'isPlacing Carrier?
Public PlaceBattleship(0 To 1)          As Boolean      'isPlacing Battleship?
Public PlaceSubmarine(0 To 1)           As Boolean      'isPlacing Submarine?
Public PlaceDestroyer(0 To 1)           As Boolean      'isPlacing Destroyer?
Public PlacePatrolBoat(0 To 1)          As Boolean      'isPlacing PatrolBoat?

'*Ship Health
Public HealthCarrier(0 To 1)            As Integer      'Carrier Health
Public HealthBattleship(0 To 1)         As Integer      'Battleship Health
Public HealthSubmarine(0 To 1)          As Integer      'Submarine Health
Public HealthDestroyer(0 To 1)          As Integer      'Destroyer Health
Public HealthPatrolBoat(0 To 1)         As Integer      'PatrolBoat Health

