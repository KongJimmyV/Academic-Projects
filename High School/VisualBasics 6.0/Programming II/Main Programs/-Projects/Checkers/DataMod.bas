Attribute VB_Name = "DataMod"
'Variables
Public cVar1                            As Integer
Public cVar2                            As Integer
Public t                                As Integer
Public i                                As Integer
Public i1                               As Integer
Public i2                               As Integer
Public Index                            As Integer
Public Index2                           As Integer

'Size
Public cDefaultSize                     As Integer

'Game
Public GameOn                           As Boolean
Public Turn                             As Integer  '1 Is A(Red), 2 Is B(Yellow)

'Values
Public zoneValues(-5 To 14, -5 To 14)   As Integer

'Grid Array
Public Grid(-5 To 14, -5 To 14)         As Integer
Public GridMove(-5 To 14, -5 To 14)     As Integer
Public C                                As Integer
Public R                                As Integer
Public PosC                             As Integer
Public PosR                             As Integer
Public XMaze                            As Integer
Public YMaze                            As Integer

'A is Red
Public AKingTrue(0 To 11)               As Integer
Public APieces(0 To 11)                 As Integer
Public ALost(0 To 11)                   As Boolean
Public AMove(0 To 11)                   As Boolean

'B is White
Public BKingTrue(0 To 11)               As Integer
Public BPieces(0 To 11)                 As Integer
Public BLost(0 To 11)                   As Boolean
Public BMove(0 To 11)                   As Boolean

'Time
Public Sec(0 To 1)                      As Integer
Public Min(0 To 1)                      As Integer
Public Hr(0 To 1)                       As Integer
