Attribute VB_Name = "AIPlacement"


'AI PLACEMENT MAIN

Private Sub AIPlacement()
    
A:

Select Case AIDifficulty
    Case 1
        Call AIPlacementVeryEasy
    Case 2
        Call AIPlacementEasy
    Case 3
        Call AIPlacementNormal
    Case 4
        Call AIPlacementHard
    Case 5
        Call AIPlacementVeryHard
    Case 6
        Call AIPlacementUnfair
    Case 7
        Call AIPlacement7
    Case Else
        MsgBox "AI Difficulty Incorrect.", vbCritical, Error, 0, 0
        End
End Select
    
    'Print I, ITemp; RandomIComp
    '*AI's Turn
        If TurnAI = True Then
            ShipNum = 1
            s = 1
            
            '*Place Carrier
            If PlaceCarrier(s) = True Then
            
                'show coordinate
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 4 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 _
                    And Grid2(RowTemp + 3, ColTemp) = 0 _
                    And Grid2(RowTemp + 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 4
                            Grid2(RowTemp + X, ColTemp) = 1
                            imgWater2(ITemp - 10 * X).Tag = "Carrier"
                        Next X
                        imgCarrierV(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgCarrierV(ShipNum).Height
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        Grid2(Row, Col) = 0
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 4 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 _
                    And Grid2(RowTemp - 3, ColTemp) = 0 _
                    And Grid2(RowTemp - 4, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 4
                            Grid2(RowTemp - X, ColTemp) = 1
                            imgWater2(ITemp + 10 * X).Tag = "Carrier"
                        Next X
                        imgCarrierV(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 4 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 _
                    And Grid2(RowTemp, ColTemp + 3) = 0 _
                    And Grid2(RowTemp, ColTemp + 4) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 4
                            Grid2(RowTemp, ColTemp + X) = 1
                            imgWater2(ITemp + X).Tag = "Carrier"
                        Next X
                        imgCarrierH(ShipNum).Left = imgWater2(ITemp).Left
                        imgCarrierH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 4 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 _
                    And Grid2(RowTemp, ColTemp - 3) = 0 _
                    And Grid2(RowTemp, ColTemp - 4) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 4
                            Grid2(RowTemp, ColTemp - X) = 1
                            imgWater2(ITemp - X).Tag = "Carrier"
                        Next X
                        imgCarrierH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgCarrierH(ShipNum).Width
                        imgCarrierH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceCarrier(s) = False
                        'time to place BATTLESHIP
                        PlaceBattleship(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Battleship'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Carrier'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Carrier'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Battleship
            If PlaceBattleship(s) = True Then
            
                'show coordinate
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 3 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 _
                    And Grid2(RowTemp + 3, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 3
                            Grid2(RowTemp + X, ColTemp) = 2
                            imgWater2(ITemp - 10 * X).Tag = "Battleship"
                        Next X
                        imgBattleshipV(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgBattleshipV(ShipNum).Height
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 3 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 _
                    And Grid2(RowTemp - 3, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 3
                            Grid2(RowTemp - X, ColTemp) = 2
                            imgWater2(ITemp + 10 * X).Tag = "Battleship"
                        Next X
                        imgBattleshipV(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 3 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 _
                    And Grid2(RowTemp, ColTemp + 3) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 3
                            Grid2(RowTemp, ColTemp + X) = 2
                            imgWater2(ITemp + X).Tag = "Battleship"
                        Next X
                        imgBattleshipH(ShipNum).Left = imgWater2(ITemp).Left
                        imgBattleshipH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "You can't place your Battleship because it is collided with another ship."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 3 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 _
                    And Grid2(RowTemp, ColTemp - 3) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 3
                            Grid2(RowTemp, ColTemp - X) = 2
                            imgWater2(ITemp - X).Tag = "Battleship"
                        Next X
                        imgBattleshipH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgBattleshipH(ShipNum).Width
                        imgBattleshipH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceBattleship(s) = False
                        'time to place SUBMARINE
                        PlaceSubmarine(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Submarine'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Battleship'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Battleship'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Submarine
            If PlaceSubmarine(s) = True Then
            
                'show coordinate
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp + X, ColTemp) = 3
                            imgWater2(ITemp - 10 * X).Tag = "Submarine"
                        Next X
                        imgSubmarineV(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgSubmarineV(ShipNum).Height
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp - X, ColTemp) = 3
                            imgWater2(ITemp + 10 * X).Tag = "Submarine"
                        Next X
                        imgSubmarineV(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp + X) = 3
                            imgWater2(ITemp + X).Tag = "Submarine"
                        Next X
                        imgSubmarineH(ShipNum).Left = imgWater2(ITemp).Left
                        imgSubmarineH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp - X) = 3
                            imgWater2(ITemp - X).Tag = "Submarine"
                        Next X
                        imgSubmarineH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgSubmarineH(ShipNum).Width
                        imgSubmarineH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceSubmarine(s) = False
                        'time to place DESTROYER
                        PlaceDestroyer(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Destroyer'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Submarine'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Submarine'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Destroyer
            If PlaceDestroyer(s) = True Then
            
                'show coordinate
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 _
                    And Grid2(RowTemp + 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp + X, ColTemp) = 4
                            imgWater2(ITemp - 10 * X).Tag = "Destroyer"
                        Next X
                        imgDestroyerV(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgDestroyerV(ShipNum).Height
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 _
                    And Grid2(RowTemp - 2, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp - X, ColTemp) = 4
                            imgWater2(ITemp + 10 * X).Tag = "Destroyer"
                        Next X
                        imgDestroyerV(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerV(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 2 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 _
                    And Grid2(RowTemp, ColTemp + 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp + X) = 4
                            imgWater2(ITemp + X).Tag = "Destroyer"
                        Next X
                        imgDestroyerH(ShipNum).Left = imgWater2(ITemp).Left
                        imgDestroyerH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 2 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 _
                    And Grid2(RowTemp, ColTemp - 2) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 2
                            Grid2(RowTemp, ColTemp - X) = 4
                            imgWater2(ITemp - X).Tag = "Destroyer"
                        Next X
                        imgDestroyerH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgDestroyerH(ShipNum).Width
                        imgDestroyerH(ShipNum).Top = imgWater2(ITemp).Top
                        PlaceDestroyer(s) = False
                        'time to place PATROL BOAT
                        PlacePatrolBoat(s) = True
                        PlaceDirection(s) = False
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Destroyer'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Destroyer'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
            '*Place Patrol Boat
            If PlacePatrolBoat(s) = True Then
            
                'show coordinate
                'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Smoke.gif")
                'change label
                lbl2.Caption = "Pick The 'Direction'."
                
                If Grid2(Row, Col) = 0 Then 'Invalid Placement Check
                'pick the 'Direction'
                If PlaceDirection(s) = True Then
                    'up
                    If Row > RowTemp Then
                    If RowTemp + 1 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp + 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp + X, ColTemp) = 5
                            imgWater2(ITemp - 10 * X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top + imgWater2(ITemp).Height - imgPatrolV(ShipNum).Height
                        PlacePatrolBoat(s) = False
                        'time to start game
                        tmrAIPlacement.Enabled = False
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnPlayer2 = False
                        TurnAI = False
                        lbl1.Caption = "Player 1's Turn"
                        lbl2.Caption = "Battle!"
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'down
                    If Row < RowTemp Then
                    If RowTemp - 1 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp - 1, ColTemp) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp - X, ColTemp) = 5
                            imgWater2(ITemp + 10 * X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolV(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolV(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        tmrAIPlacement.Enabled = False
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnPlayer2 = False
                        TurnAI = False
                        lbl1.Caption = "Player 1's Turn"
                        lbl2.Caption = "Battle!"
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'right
                    If Col > ColTemp Then
                    If ColTemp + 1 <= 9 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp + 1) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp, ColTemp + X) = 5
                            imgWater2(ITemp + X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolH(ShipNum).Left = imgWater2(ITemp).Left
                        imgPatrolH(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        tmrAIPlacement.Enabled = False
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnPlayer2 = False
                        TurnAI = False
                        lbl1.Caption = "Player 1's Turn"
                        lbl2.Caption = "Battle!"
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                    'left
                    If Col < ColTemp Then
                    If ColTemp - 1 >= 0 Then 'Inside Grid2 Validation
                    If Grid2(RowTemp, ColTemp) = 0 _
                    And Grid2(RowTemp, ColTemp - 1) = 0 Then 'Invalid Placement Check
                        'Label Grid2; 1 = Carrier, 2 = Battleship, 3 = Submarine, 4 = Destroyer, 5 = Patrol Boat
                        For X = 0 To 1
                            Grid2(RowTemp, ColTemp - X) = 5
                            imgWater2(ITemp - X).Tag = "PatrolBoat"
                        Next X
                        imgPatrolH(ShipNum).Left = imgWater2(ITemp).Left + imgWater2(ITemp).Width - imgPatrolH(ShipNum).Width
                        imgPatrolH(ShipNum).Top = imgWater2(ITemp).Top
                        PlacePatrolBoat(s) = False
                        'time to start game
                        tmrAIPlacement.Enabled = False
                        GameOn = True
                        PlaceShips = False
                        PlaceDirection(s) = False
                        s = 0
                        PlaceCarrier(s) = True
                        TurnPlayer = True
                        TurnPlayer2 = False
                        TurnAI = False
                        lbl1.Caption = "Player 1's Turn"
                        lbl2.Caption = "Battle!"
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        GoTo B:
                    Else
                        lbl2.Caption = "Error."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    Else
                        lbl2.Caption = "I Can't Let You Do That Sir."
                        PlaceDirection(s) = False
                        'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                        lbl2.Caption = "Place Your 'Patrol Boat'."
                        GoTo B:
                    End If
                    End If
                End If
                Else
                    lbl2.Caption = "Error."
                    PlaceDirection(s) = False
                    'imgWater2(I).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    'imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
                    lbl2.Caption = "Place Your 'Patrol Boat'."
                    GoTo B:
                End If
                
                PlaceDirection(s) = True
                'Temporary Storage of Last Row, Col, I
                ColTemp = Col
                RowTemp = Row
                ITemp = I
            End If
            '***+++
        End If
        
B:
    Call CheckTurn
    
End Sub





' AI PLACEMENTS

Private Sub AIPlacementVeryEasy()

    Randomize
    
    If PlaceDirection(1) = False Then
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    End If
End Sub

Private Sub AIPlacementEasy()

    Randomize
    
    If PlaceDirection(1) = False Then
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
    End If
End Sub

Private Sub AIPlacementNormal()

    Randomize
    
    If PlaceDirection(1) = False Then
    AICount = 0
A1:
    AICount = AICount + 1
    If AICount = 10000 Then MsgBox "Error A1": End
        I = Int(0 + (Rnd * 100))
        
        C = (I Mod 10)
        R = 10 - (I \ 10 + 1)
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
    AICount = 0
A2:
    AICount = AICount + 1
    If AICount = 10000 Then MsgBox "Error A2": End
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
End Sub

Private Sub AIPlacementHard()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
End Sub

Private Sub AIPlacementVeryHard()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
End Sub

Private Sub AIPlacementUnfair()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        C = Col
        R = Row
        
    'Check if next to Ship
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
    
End Sub

Private Sub AIPlacement7()

    Randomize
    
    If PlaceDirection(1) = False Then
A1:
        I = Int(0 + (Rnd * 100))
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
        C = Col
        R = Row
        
    'Check if next to Ship
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                GoTo A1:
            Case Else
        End Select
        
    Else
A2:
        RandomIComp = Int(1 + (Rnd * 1000))
        If RandomIComp <= 250 And RandomIComp > 0 Then
            I = ITemp + 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 250 And RandomIComp <= 500 Then
            I = ITemp - 1
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 500 And RandomIComp <= 750 Then
            I = ITemp + 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        If RandomIComp > 750 And RandomIComp <= 1000 Then
            I = ITemp - 10
            'Print I
            If I >= 100 Or I < 0 Then
            'Print "Index Error"
            'PlaceDirection(1) = False
            imgWater2(ITemp).Picture = LoadPicture(App.Path & "\Images\Grid2.gif")
            GoTo A2:
            End If
        End If
        
        Col = (I Mod 10)
        Row = 10 - (I \ 10 + 1)
        
    'Check If Next to ships
        
        C = Col
        R = Row
        
        Select Case Grid2(R + 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R - 1, C + 0)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C + 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        Select Case Grid2(R + 0, C - 1)
            Case 1 To 5
                PlaceDirection(1) = False
                GoTo A1:
            Case Else
        End Select
        
    End If
    
End Sub




