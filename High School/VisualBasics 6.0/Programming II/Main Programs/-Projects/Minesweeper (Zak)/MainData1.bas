Attribute VB_Name = "MainData1"
Public XTemp As Integer
Public YTemp As Integer
Public BTemp As Integer
'Ga,
'Minesweeper Form
Public Maze(-2000 To 2000, -2000 To 2000) As Integer
Public XMaze As Integer
Public YMaze As Integer
Public NumBomb As Integer
'Public zones As Integer
Public Flags(0 To 2000) As Integer

Public C As Integer
Public R As Integer
Public C2 As Integer
Public R2 As Integer

Dim i As Integer

Public nCellsLeft As Integer

'Game Values
Public GameOn As Boolean
Public IsBomb As Boolean
Public zoneValue(-2000 To 2000, -2000 To 2000) As Integer
Public xcor As Integer
Public ycor As Integer

'These are Initial Points
Public IntFactor As Integer
Public DefaultCellSize As Integer

'other values
Public BombCountTemp As Integer
Public callAgain As Boolean
Public intx, inty As Integer
Public reveal(-2000 To 2000, -2000 To 2000) As Integer
Public zoneCount As Integer

Public TotalTime(0 To 10) As Integer
Public Sec(0 To 1) As Integer
Public Min(0 To 1) As Integer
Public Hr(0 To 1) As Integer
Public nFlags(0 To 2) As Integer

Public RowVar(0 To 5) As Single
Public ColVar(0 To 5) As Single
