Attribute VB_Name = "AIEvaluation"





' AI EVALUATIONS

Private Sub AIEvaluationVeryEasy()
    
    Randomize
    
    I = Int(0 + (Rnd * 100))
    
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                AIFoundShip = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                AIFoundShip = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                AIFoundShip = False
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
End Sub


Private Sub AIEvaluationEasy()

A:
Randomize

    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    For R = 0 To 9
        For C = 0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
                    
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 100 To -5 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    
    I = Int(0 + (Rnd * 100))
    
E:
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
B:
End Sub

Private Sub AIEvaluationNormal()
    
    Randomize
    
    'I = Int(0 + (Rnd * 100))
    'Col = (I Mod 10)
    'Row = 10 - (I \ 10 + 1)
    
    Dim ShipType(1 To 5) As String
    Dim RowHitTemp As Integer
    Dim ColHitTemp As Integer
    
    ShipType(1) = HitFoundPatrolBoat
    ShipType(2) = HitFoundDestroyer
    ShipType(3) = HitFoundSubmarine
    ShipType(4) = HitFoundBattleship
    ShipType(5) = HitFoundCarrier
    
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If AIMap(R, C) = 100 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    If HitFound = True Then
    For R = 9 To 0 Step -1
        For C = 0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
            
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 300 To -5 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    End If
    I = Int(0 + (Rnd * 100))
    
E:
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                'HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                'HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluationHard()
    
    Randomize
    
    'I = Int(0 + (Rnd * 100))
    'Col = (I Mod 10)
    'Row = 10 - (I \ 10 + 1)
    
    Dim ShipType(1 To 5) As String
    Dim RowHitTemp As Integer
    Dim ColHitTemp As Integer
    
    ShipType(1) = HitFoundPatrolBoat
    ShipType(2) = HitFoundDestroyer
    ShipType(3) = HitFoundSubmarine
    ShipType(4) = HitFoundBattleship
    ShipType(5) = HitFoundCarrier
    
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If AIMap(R, C) = 100 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    If HitFound = True Then
    For R = 9 To 0 Step -1
        For C = 0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
            
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 400 To 1 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    End If
    
    'If no hit or probabilities, do random pick, with conditions
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                'HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                'HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluationVeryHard()
    
    Randomize
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    Dim hitRow As Integer
    Dim hitCol As Integer
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    
    If HitFound = True Then
    For R = 9 To -0 Step -1
        For C = -0 To 9
            
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
            
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    End If
    
    'AIProbabillity ShipLength Test
    Max1 = 9
    Min1 = 0
    
    For R = Min1 To Max1
        For C = Min1 To Max1
                
                s = 0
                
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 1
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 1
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 1
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 1
                    End If
                End If
                
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 1
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 1
                    End If
                End If
                
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                    End If
                End If
                    
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 1
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 1
                    End If
                End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 1
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 1
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 1
                    End If
                End If
                
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -5
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    
    For p = 450 To 1 Step -1
        For AICount = 0 To 3000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
    
    'I = Int(0 + (Rnd * 100))
        
    'If no hit or probabilities, do random pick, with conditions
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluationUnfair()
    
    Randomize
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    
    If HitFound = True Then
    
    Max1 = 9
    Min1 = 0
    For R = Min1 To Max1
        For C = Min1 To Max1
            
            'C = (IT Mod 10)
            'R = 10 - (IT \ 10 + 1)
            
            'IndexGrid = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                'IArray(0) = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 100
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 100
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 100
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 100
                    End If
                    
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 100
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 100
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 100
                    End If
                    
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
                
            End If
        Next C
    Next R
    
    End If
    
'{
If 1 = 1 Then
If HitFound = False Then
    'AIProbabillity ShipLength Test
    Max1 = 10
    Min1 = -1
    
    For R = Min1 To Max1
        For C = Min1 To Max1
                
                s = 0
                
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) _
            And DeadBattleship(s) = True Then
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = 0 + 40
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 20
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 10
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = 0 + 40
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 20
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 10
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) Then
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 20
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 10
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 20
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 10
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True Then
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                    End If
                End If
             End If
             
             If DeadPatrolBoat(s) = True Then
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 20
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 20
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                    End If
                End If
            End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 0, C + 1) = 0 + 10
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 1, C + 0) = 0 + 10
                    End If
                End If
                
            'Subtractor Factor
                If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                        And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (R + 0 <= Max1) And (C + 0 <= Max1) Then
                            
                            AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) - 5
                        
                End If
                
        Next C
    Next R
End If

    For R = 0 To 9
        For C = 0 To 9
            If HitFound = False Or 1 = 0 Then
                If Grid(R, C) = 7 Then
                    'HitFound = True
                    'AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) - 2
                    'AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) - 2
                    'AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) - 2
                    'AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) - 2
                    If DeadPatrolBoat(s) = False Then
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 1
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 1
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 1
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 1
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    Else
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 4
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 4
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 4
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 4
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    End If
                End If
            End If
                If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                    'HitFound = True
                    AIMap(R, C) = -500
                End If
                If Grid(R, C) = 6 Then
                    'HitFound = True
                    AIMap(R, C) = 0
                End If
                If Grid(R, C) = 7 Then
                    'HitFound = True
                    AIMap(R, C) = 0
                End If
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -500
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
        Next C
    Next R
    'Get highest values
    
    For p = 1050 To -101 Step -1
        For AICount = 0 To 1000
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
End If
'}

    'I = Int(0 + (Rnd * 100))
        
    'If no hit or probabilities, do random pick, with conditions
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIEvaluation7()
    
    Randomize
    
    Dim AIFound As Boolean
    Dim AIEval As Boolean
    Dim LastHit As Integer
    Dim PreviousHit As Integer
    
    'IT = Int(0 + (Rnd * 100))
    'C = (IT Mod 10)
    'R = 10 - (IT \ 10 + 1)
    
    'AI Eval
    
    For R = 0 To 9
    For C = 0 To 9
        Dim shotRow As Integer
        Dim shotCol As Integer
        If Grid(R, C) = 6 Then
            HitFound = True
        End If
    Next C
    Next R
    
    'AIProbabillityReset
    For n = -99 To 199
        For m = -99 To 199
            AIMap(n, m) = 0
        Next m
    Next n
    
    'AIProbabillity
    
    If HitFound = True Then
    
    Max1 = 9
    Min1 = 0
    For R = Min1 To Max1
        For C = Min1 To Max1
            
            'C = (IT Mod 10)
            'R = 10 - (IT \ 10 + 1)
                
            'IndexGrid = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                'IArray(0) = ((-1 * (R * XDefinition)) + (XDefinition * YDefinition)) + ((C * 1) - XDefinition)
                
                'Main Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" Then
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 150
                        AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) + 150
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 150
                        AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) + 150
                    End If
                    
                'Horizontal Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C + 1) = "Hit" Then
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 170
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 0, C - 1) = "Hit" Then
                        AIMap(R + 0, C - 2) = AIMap(R + 0, C - 2) + 170
                    End If
                    
                'Vertical Hit Scores
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R + 1, C + 0) = "Hit" Then
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 170
                    End If
                    
                    If IndexStatRC(R + 0, C + 0) = "Hit" _
                    And IndexStatRC(R - 1, C + 0) = "Hit" Then
                        AIMap(R - 2, C + 0) = AIMap(R - 2, C + 0) + 170
                    End If
                    
            If Grid(R, C) = 0 _
            Or Grid(R, C) = 1 _
            Or Grid(R, C) = 2 _
            Or Grid(R, C) = 3 _
            Or Grid(R, C) = 4 _
            Or Grid(R, C) = 5 Then
                'HitFound = True
                'AIMap(R, C) = 50
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
                
            End If
        Next C
    Next R
    
    End If
    
'{
If 1 = 1 Then
If HitFound = False Then
    'AIProbabillity ShipLength Test
    Max1 = 9 + 5
    Min1 = 0 - 5
    
    For R = Min1 To Max1
        For C = Min1 To Max1
                
                s = 0
                
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) _
            And DeadBattleship(s) = True Then
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = 0 + 20
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 10
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 5
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = 0 + 20
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 10
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) Then
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 5
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True Then
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
             End If
             
             If DeadPatrolBoat(s) = True Then
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
            End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 0, C + 1) = 0 + 10
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = 0 + 10
                        AIMap(R + 1, C + 0) = 0 + 10
                    End If
                End If
                
            'Subtractor Factor
                If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                        And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (R + 0 <= Max1) And (C + 0 <= Max1) Then
                            
                            AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) - 5
                        
                End If
                
        Next C
    Next R
    
Else
    
    s = 0
    
    'AIProbabillity ShipLength Test
    
    Ct = (ITemp2 Mod 10)
    Rt = 10 - (ITemp2 \ 10 + 1)
        
        If DeadPatrolBoat(s) = False Then Max1 = Rt + 2: Min1 = Rt - 1
        If DeadDestroyer(s) = False Then Max1 = Rt + 3: Min1 = Rt - 2
        If DeadSubmarine(s) = False Then Max1 = Rt + 3: Min1 = Rt - 2
        If DeadBattleship(s) = False Then Max1 = Rt + 4: Min1 = Rt - 3
        If DeadCarrier(s) = False Then Max1 = Rt + 5: Min1 = Rt - 4
        
        If DeadPatrolBoat(s) = False Then Max2 = Ct + 2: Min2 = Ct - 1
        If DeadDestroyer(s) = False Then Max2 = Ct + 3: Min2 = Ct - 2
        If DeadSubmarine(s) = False Then Max2 = Ct + 3: Min2 = Ct - 2
        If DeadBattleship(s) = False Then Max2 = Ct + 4: Min2 = Ct - 3
        If DeadCarrier(s) = False Then Max2 = Ct + 5: Min2 = Ct - 4
        
    If Max1 > 9 Then Max1 = 9
    If Max2 > 9 Then Max2 = 9
    
    If Min1 < 0 Then Min1 = 0
    If Min2 < 0 Then Min2 = 0
    For R = Min1 To Max1
        For C = Min2 To Max2
                
                s = 0
                
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) _
            And DeadBattleship(s) = True Or 1 = 1 Then
            'HCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) _
                    And (Grid(R + 0, C + 4) <> 7 And Grid(R + 0, C + 4) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (Grid(R + 0, C + 4) <> -1 And Grid(R + 0, C + 4) <> -2) _
                    And (C + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 20
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 10
                        AIMap(R + 0, C + 4) = AIMap(R + 0, C + 4) + 5
                    End If
                End If
            'VCarrier
                If DeadCarrier(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) _
                    And (Grid(R + 4, C + 0) <> 7 And Grid(R + 4, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (Grid(R + 4, C + 0) <> -1 And Grid(R + 4, C + 0) <> -2) _
                    And (R + 4 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 20
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 10
                        AIMap(R + 4, C + 0) = AIMap(R + 4, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True _
            And (DeadDestroyer(s) = True _
            Or DeadSubmarine(s) = True) Or 1 = 1 Then
            'HBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) _
                    And (Grid(R + 0, C + 3) <> 7 And Grid(R + 0, C + 3) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (Grid(R + 0, C + 3) <> -1 And Grid(R + 0, C + 3) <> -2) _
                    And (C + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 10
                        AIMap(R + 0, C + 3) = AIMap(R + 0, C + 3) + 5
                    End If
                End If
            'VBattleship
                If DeadBattleship(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) _
                    And (Grid(R + 3, C + 0) <> 7 And Grid(R + 3, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (Grid(R + 3, C + 0) <> -1 And Grid(R + 3, C + 0) <> -2) _
                    And (R + 3 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 10
                        AIMap(R + 3, C + 0) = AIMap(R + 3, C + 0) + 5
                    End If
                End If
            End If
            
            If DeadPatrolBoat(s) = True Or 1 = 1 Then
            'HSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VSubmarine
                If DeadSubmarine(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
             End If
             
             If DeadPatrolBoat(s) = True Or 1 = 1 Then
            'HDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) _
                    And (Grid(R + 0, C + 2) <> 7 And Grid(R + 0, C + 2) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (Grid(R + 0, C + 2) <> -1 And Grid(R + 0, C + 2) <> -2) _
                    And (C + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                        AIMap(R + 0, C + 2) = AIMap(R + 0, C + 2) + 5
                    End If
                End If
            'VDestroyer
                If DeadDestroyer(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) _
                    And (Grid(R + 2, C + 0) <> 7 And Grid(R + 2, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (Grid(R + 2, C + 0) <> -1 And Grid(R + 2, C + 0) <> -2) _
                    And (R + 2 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 5
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                        AIMap(R + 2, C + 0) = AIMap(R + 2, C + 0) + 5
                    End If
                End If
            End If
                    
            'HPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 1) <> 7 And Grid(R + 0, C + 1) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 0, C + 1) <> -1 And Grid(R + 0, C + 1) <> -2) _
                    And (C + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) + 10
                    End If
                End If
            'VPatrolBoat
                If DeadPatrolBoat(s) = False Then
                    If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 1, C + 0) <> 7 And Grid(R + 1, C + 0) <> 7) And _
                    (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) _
                    And (Grid(R + 1, C + 0) <> -1 And Grid(R + 1, C + 0) <> -2) _
                    And (R + 1 <= Max1) Then
                        AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) + 10
                        AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) + 10
                    End If
                End If
                
            'Subtractor Factor
                If (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                    And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (Grid(R + 0, C + 0) <> 7 And Grid(R + 0, C + 0) <> 7) _
                        And (Grid(R + 0, C + 0) <> -1 And Grid(R + 0, C + 0) <> -2) And _
                        (R + 0 <= Max1) And (C + 0 <= Max1) Then
                            
                            AIMap(R + 0, C + 0) = AIMap(R + 0, C + 0) - 5
                        
                End If
                
        Next C
    Next R
    
End If

    For R = 0 To 9
        For C = 0 To 9
            If HitFound = False Or 1 = 0 Then
                If Grid(R, C) = 7 Then
                    'HitFound = True
                    'AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) - 2
                    'AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) - 2
                    'AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) - 2
                    'AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) - 2
                    If DeadPatrolBoat(s) = False Then
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 2
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 2
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 2
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 2
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    Else
                        If Grid(R + 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R + 1, C + 1) = AIMap(R + 1, C + 1) + 4
                            AIMap(R + 2, C + 2) = AIMap(R + 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C + 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C + 1 - (1)) = -1 Then
                            AIMap(R - 1, C + 1) = AIMap(R - 1, C + 1) + 4
                            AIMap(R - 2, C + 2) = AIMap(R - 2, C + 2) + 1
                        End If
                        If Grid(R - 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R - 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R - 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R - 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R - 1, C - 1) = AIMap(R - 1, C - 1) + 4
                            AIMap(R - 2, C - 2) = AIMap(R - 2, C - 2) + 1
                        End If
                        If Grid(R + 1 - (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = 7 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = 7 _
                        Or Grid(R + 1 - (1), C - 1 - (1)) = -1 _
                        Or Grid(R + 1 - (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 + (1)) = -1 _
                        Or Grid(R + 1 + (1), C - 1 - (1)) = -1 Then
                            AIMap(R + 1, C - 1) = AIMap(R + 1, C - 1) + 4
                            AIMap(R + 2, C - 2) = AIMap(R + 2, C - 2) + 1
                        End If
                    End If
                End If
            End If
            
        Next C
    Next R
    
    For R = 0 To 9
        For C = 0 To 9
            
            'Memory Factor ADDED
            '''AIMap(R, C) = MemoryMap(R, C) + AIMap(R, C)
             
            
            If Grid(R, C) = -1 Or Grid(R, C) = -2 Then
                'HitFound = True
                AIMap(R, C) = -500
            End If
            If Grid(R, C) = 6 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            If Grid(R, C) = 7 Then
                'HitFound = True
                AIMap(R, C) = 0
            End If
            
            If HitFound = False Then
            If Grid(R + 0, C + 0) = 7 Then AIMap(R + 1, C + 0) = AIMap(R + 1, C + 0) - 1
            If Grid(R - 0, C + 0) = 7 Then AIMap(R - 1, C + 0) = AIMap(R - 1, C + 0) - 1
            If Grid(R + 0, C + 0) = 7 Then AIMap(R + 0, C + 1) = AIMap(R + 0, C + 1) - 1
            If Grid(R + 0, C - 0) = 7 Then AIMap(R + 0, C - 1) = AIMap(R + 0, C - 1) - 1
            End If
            
            If (Grid(R + 1, C + 0) = 7 Or Grid(R + 1, C + 0) = -1) And _
            (Grid(R - 1, C + 0) = 7 Or Grid(R - 1, C + 0) = -1) And _
            (Grid(R + 0, C + 1) = 7 Or Grid(R + 0, C + 1) = -1) And _
            (Grid(R + 0, C - 1) = 7 Or Grid(R + 0, C - 1) = -1) Then
                AIMap(R, C) = 0
            End If
            
        Next C
    Next R
    'Get highest values
    
    For p = 1050 To -101 Step -1
        For AICount = 0 To 1000
            Randomize
            IT = Int(0 + (Rnd * 100))
            C = (IT Mod 10)
            R = 10 - (IT \ 10 + 1)
            If AIMap(R, C) = p Then
                I = IT
                GoTo E:
            End If
        Next AICount
    Next p
End If
'}

    'I = Int(0 + (Rnd * 100))
        
    'If no hit or probabilities, do random pick, with conditions, patterns
    s = 0
    
    If RandNum = 0 Then
ProcessA:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 0, 2, 4, 6, 8, 11, 13, 15, 17, 19, 20, 22, 24, 26, 28, 31, 33, 35, 37, 39, 40, 42, 44, 46, 48, 51, 53, 55, 57, 59, 60, 62, 64, 66, 68, 71, 73, 75, 77, 79, 80, 82, 84, 86, 88, 91, 93, 95, 97, 99
                GoTo E:
            Case Else
                GoTo ProcessA:
        End Select
    End If
    
    If RandNum = 1 Then
ProcessB:
        I = Int(0 + (Rnd * 100))
        Select Case I
            Case 1, 3, 5, 7, 9, 10, 12, 14, 16, 18, 21, 23, 25, 27, 29, 30, 32, 34, 36, 38, 41, 43, 45, 47, 49, 50, 52, 54, 56, 58, 61, 63, 65, 67, 69, 70, 72, 74, 76, 78, 81, 83, 85, 87, 89, 90, 92, 94, 96, 98, 100
                GoTo E:
            Case Else
                GoTo ProcessB:
        End Select
    End If
E:
    Col = (I Mod 10)
    Row = 10 - (I \ 10 + 1)
    
    If HitFound = False Then ITemp2 = I
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
            s = 0
            'Hit Carrier?
            If Grid(Row, Col) = 1 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Carrier")
                HealthCarrier(s) = HealthCarrier(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Battleship?
            If Grid(Row, Col) = 2 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Battleship")
                HealthBattleship(s) = HealthBattleship(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Submarine?
            If Grid(Row, Col) = 3 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Submarine")
                HealthSubmarine(s) = HealthSubmarine(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Destroyer?
            If Grid(Row, Col) = 4 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Destroyer")
                HealthDestroyer(s) = HealthDestroyer(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Hit Patrol Boat?
            If Grid(Row, Col) = 5 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGHit.gif")
                'MsgBox ("Hit, Patrol Boat")
                HealthPatrolBoat(s) = HealthPatrolBoat(s) - 1
                Grid(Row, Col) = 6
                HitFound = True
                GoTo D:
            End If
            'Miss?
            If Grid(Row, Col) = 0 Then
                imgWater(I).Picture = LoadPicture(App.Path & "\Images\FGMiss.gif")
                'MsgBox ("You missed.")
                'Next Player's Turn
                'change labels
                lbl1.Caption = "Player 1's Turn"
                'lbl2.Caption = "Battle!"
                TurnPlayer = True
                TurnPlayer2 = False
                TurnAI = False
                tmrAIAttack.Enabled = False
                Grid(Row, Col) = 7
                HitFound = False
                GoTo C:
            End If
            'Already Hit?
            If Grid(Row, Col) = 6 Then
                'MsgBox ("Already Clicked/Hit Here.")
                HitFound = True
                GoTo C:
            End If
            'Already Missed?
            If Grid(Row, Col) = 7 Then
                'MsgBox ("Already Clicked/Missed Here.")
                GoTo C:
            End If
            'Dead Ship?
            If Grid(Row, Col) = -1 Then
                'MsgBox ("Already Clicked/Hit Here.")
                GoTo C:
            End If
D:
    Call ShotShip
        If HitContinue = False Then
            'Next Player's Turn
            'change labels
            lbl1.Caption = "Player 1's Turn"
            'lbl2.Caption = "Battle!"
            TurnPlayer = True
            TurnPlayer2 = False
            TurnAI = False
            tmrAIAttack.Enabled = False
        End If
C:
        'store temp
        ColTemp = Col
        RowTemp = Row
        ITemp = I
        If TurnPlayer = True Then
            'show move
            Rank = R
            File = C
            txtMoved2.Text = txtMoved2.Text & ": 'P2' :: " & RankFile(Rank, File) & " :: :" & vbCrLf
        End If
        'Check Other
        Call CheckShips
        Call CheckTurn
        Call CheckForVictory
        End If
    End If
    
End Sub

Private Sub AIAttack()
    
    If PlaceShips = False And GameOn = True Then
        If TurnAI = True Then
        Randomize
        
        If AIDifficulty = 1 Then Call AIEvaluationVeryEasy
        If AIDifficulty = 2 Then Call AIEvaluationEasy
        If AIDifficulty = 3 Then Call AIEvaluationNormal
        If AIDifficulty = 4 Then Call AIEvaluationHard
        If AIDifficulty = 5 Then Call AIEvaluationVeryHard
        If AIDifficulty = 6 Then Call AIEvaluationUnfair
        If AIDifficulty = 7 Then Call AIEvaluation7
        End If
    End If
    
End Sub


