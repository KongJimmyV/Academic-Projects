Attribute VB_Name = "AI5Module"

'General AI Vars
Public AIMap(-99 To 199, -99 To 199) As Integer
Public AICheck(0 To 3) As Integer
Public AIEval(-99 To 199, -99 To 199) As Integer
Public AICount As Integer
Public AIPattern As String

Public ShipLengthR As Integer
Public ShipLengthC As Integer
Public ShipLength As Integer

Public Max1 As Integer
Public Max2 As Integer

Public Min1 As Integer
Public Min2 As Integer

'Dynamic AI VARS/Evolution AI
Public MemoryMap(-99 To 199, -99 To 199)        As Integer

Public atkEGrid(-99 To 199, -99 To 199)            As Integer
Public atkERow                                     As Integer
Public atkECol                                     As Integer
Public atkEStoredValue(-99 To 199, -99 To 199)     As Integer

Public placeEGrid(-99 To 199, -99 To 199)            As Integer
Public placeERow                                     As Integer
Public placeECol                                     As Integer
Public placeEStoredValue(-99 To 199, -99 To 199)     As Integer
