@echo off
@title Battleship by Kolto101
SETLOCAL EnableDelayedExpansion

REM By Kolto101 and Kolt Koding
REM Website: http://koltkoding.tk [Offline]
REM Email: kolto101@gmail.com

REM In association with Faragames.tk

REM Nothing wrong with a little Q&D... or a lot.

::To-Do::
REM Add Salvo Variant.
::End To-Do::

call :default_1
call :default_2
call :default_3

if /i exist "config.bat" call config.bat
color !bf!


if "!anintro!" == "On " if /i exist "animatedintro.bat" call animatedintro.bat


:menu
mode 80,30
cls
echo.
echo        __________         __    __  .__                .__    .__
echo        \______   \_____ _/  ³__/  ³_³  ³   ____   _____³  ³__ ³__³_____
echo         ³    ³  _/\__  \\   __\   __\  ³ _/ __ \ /  ___/  ³  \³  \____ \
echo         ³    ³   \ / __ \³  ³  ³  ³ ³  ³_\  ___/ \___ \³   Y  \  ³  ³_^> ^>
echo         ³______  /(____  /__³  ³__³ ³____/\___  ^>____  ^>___³  /__³   __/
echo                \/      \/                     \/     \/     \/   ³__³
echo.
echo.
echo         ÉÍÍÍÍÍÍÍÍÍÍÍÍ»
echo         º 1. Classic º                ^|__
echo         º 2. Salvo   º                ³\/             ÉÍÍÍÍÍÍÍÍÍÍÍ»
echo         º 3. Config  º                ---             ºBy Kolto101º
echo         º 4. About   º                / ^| [           ÈÍÍÍÍÍÍÍÍÍÍÍ¼
echo         º 5. Exit    º         ^^!      ^| ^|^|^|
echo         ÈÍÍÍÍÍÍÍÍÍÍÍÍ¼       _/^|     _/^|-++'
echo                          +  +--^|    ^|--^|--^|_ ^|-
echo  ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷  { /^|__^|  ^|/\__^|  ^|--- ^|^|^|__/  ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷
echo   ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷  +---------------___[}-_===_.'____ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷  /\ ÷ ÷
echo  ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ____`-' ^|^|___-{]_^| _[}-  ^|     ³_[___\==-- ÷ ÷ ÷ ÷ ÷ ÷ \/  __
echo   __..._____--==/___]_^|__^|_____________________________[___\==--____,------' .7
echo  ³                                                                  BB-1337 /
echo   \_________________________________________________________________________^| ÷
echo  ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷
echo   ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷
echo  ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷
echo   ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷
echo.
set /p choose=Choose a number: 
if "!choose!" == "1" goto difficulty
if "!choose!" == "2" (
echo.
echo Salvo variant hasn't been added yet. Please contact
echo kolto101@gmail.com for more details.
echo.
pause.
)
if "!choose!" == "3" goto config
if "!choose!" == "4" goto about
if "!choose!" == "5" exit
goto menu


:difficulty
mode 80,30
cls
echo.
echo  Select CPU difficulty:
echo.
echo.
echo  Mode      Hit-Average         Specs.
echo.
echo 1. Easy       ~17%%       [Random Targeting]
echo 2. Normal     ~25%%       [Keeps memory of ships hit]
echo 3. Hard       ~33%%       [Memory+Tactical-Targeting/Positioning]
echo.
echo b/Back
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "b" goto menu
if "!choose!" == "1" (set difficulty=Easy) && goto start
if "!choose!" == "2" (set difficulty=Normal) && goto start
if "!choose!" == "3" (set difficulty=Hard) && goto start
goto difficulty

:start
echo.
REM Note: I don't believe in fake loading screens. Tool.
echo Loading: Generating CPU ships...
set playerrandom=
for /l %%c in (1,1,144) do set cc.%%c=
set ranfor=c

:start2
for /l %%c in (1,1,144) do (
set a%%c=!water!
set pc.%%c=
)
for %%b in ( a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a24 a25 a36 a37 a48 a49 a60 a61 a72 a73 a84 a85 a96 a97 a108 a109 a120 a121 a132 a133 a134 a135 a136 a137 a138 a139 a140 a141 a142 a143 a144) do set %%b=!border!


set type=AircraftCarrier
set size=5
call :randomgen
set type=Battleship
set size=4
call :randomgen
set type=Submarine
set size=3
call :randomgen
set type=Cruiser
call :randomgen
set type=Destroyer
set size=2
call :randomgen
REM call :cpuscreen
REM pause
if "!playerrandom!" == "true" goto edit
mode 80,30
goto begin

:randomgen
set /a place=%RANDOM% %% 144 + 1
if not !place! GEQ 1 goto randomgen
set check=
set /a dir=%RANDOM% %% 2 + 1
if "!dir!" == "1" set dir=vert
if "!dir!" == "2" set dir=horiz

REM echo Size: !size!
REM echo Dir:  !dir!

if "!dir!" == "vert" (
if "!size!" == "5" set /a place-=22
if "!size!" == "3" set /a place-=12
if "!size!" == "4" set /a place-=12
if "!size!" == "2" set /a place-=12
)
if "!dir!" == "horiz" (
if "!size!" == "5" set /a place-=2
if "!size!" == "3" set /a place-=1
if "!size!" == "4" set /a place-=1
if "!size!" == "2" set /a place-=1
)
set initplace=!place!
set sizecount=0

:checkloop
set badspot=

set /a sizecount+=1
if not "!a%place%!" == "!water!" goto randomgen

if /i "!playerrandom!" == "true" call :tactical_positioning

if /i "!difficulty!" == "Hard" call :tactical_positioning
if /i "!badspot!" == "true" goto randomgen

if "!dir!" == "vert" set /a place+=12
if "!dir!" == "horiz" set /a place+=1
if not "!sizecount!" == "!size!" goto checkloop


set /a place=!initplace!
for /l %%p in (1,1,!size!) do (
set a!place!=!%type%_marker!
set !ranfor!c.!place!=!type!
if "!dir!" == "vert" set /a place+=12
if "!dir!" == "horiz" set /a place+=1
)
exit /b

:tactical_positioning
REM border?

set /a checkplace1=!place!-12
if /i not "!a%checkplace1%!" == "!border!" if /i not "!a%checkplace1%!" == "!water!" set badspot=true
set /a checkplace2=!place!+12
if /i not "!a%checkplace2%!" == "!border!" if /i not "!a%checkplace2%!" == "!water!" set badspot=true
set /a checkplace3=!place!-1
if /i not "!a%checkplace3%!" == "!border!" if /i not "!a%checkplace3%!" == "!water!" set badspot=true
set /a checkplace4=!place!+1
if /i not "!a%checkplace4%!" == "!border!" if /i not "!a%checkplace4%!" == "!water!" set badspot=true

exit /b

:cpuscreen
echo.
echo.    !a1!!a2!!a3!!a4!!a5!!a6!!a7!!a8!!a9!!a10!!a11!!a12!
echo.    !a13!!a14!!a15!!a16!!a17!!a18!!a19!!a20!!a21!!a22!!a23!!a24!
echo.    !a25!!a26!!a27!!a28!!a29!!a30!!a31!!a32!!a33!!a34!!a35!!a36!
echo.    !a37!!a38!!a39!!a40!!a41!!a42!!a43!!a44!!a45!!a46!!a47!!a48!
echo.    !a49!!a50!!a51!!a52!!a53!!a54!!a55!!a56!!a57!!a58!!a59!!a60!
echo.    !a61!!a62!!a63!!a64!!a65!!a66!!a67!!a68!!a69!!a70!!a71!!a72!
echo.    !a73!!a74!!a75!!a76!!a77!!a78!!a79!!a80!!a81!!a82!!a83!!a84!
echo.    !a85!!a86!!a87!!a88!!a89!!a90!!a91!!a92!!a93!!a94!!a95!!a96!
echo.    !a97!!a98!!a99!!a100!!a101!!a102!!a103!!a104!!a105!!a106!!a107!!a108!
echo.    !a109!!a110!!a111!!a112!!a113!!a114!!a115!!a116!!a117!!a118!!a119!!a120!
echo.    !a121!!a122!!a123!!a124!!a125!!a126!!a127!!a128!!a129!!a130!!a131!!a132!
echo.    !a133!!a134!!a135!!a136!!a137!!a138!!a139!!a140!!a141!!a142!!a143!!a144!
echo.
exit /b

:placescreen
echo      ABCDEFGHIJ
echo.    !q1!!q2!!q3!!q4!!q5!!q6!!q7!!q8!!q9!!q10!!q11!!q12!
echo.   1!q13!!q14!!q15!!q16!!q17!!q18!!q19!!q20!!q21!!q22!!q23!!q24!
echo.   2!q25!!q26!!q27!!q28!!q29!!q30!!q31!!q32!!q33!!q34!!q35!!q36!	Placing: !type!
echo.   3!q37!!q38!!q39!!q40!!q41!!q42!!q43!!q44!!q45!!q46!!q47!!q48!
echo.   4!q49!!q50!!q51!!q52!!q53!!q54!!q55!!q56!!q57!!q58!!q59!!q60!
echo.   5!q61!!q62!!q63!!q64!!q65!!q66!!q67!!q68!!q69!!q70!!q71!!q72!
echo.   6!q73!!q74!!q75!!q76!!q77!!q78!!q79!!q80!!q81!!q82!!q83!!q84!
echo.   7!q85!!q86!!q87!!q88!!q89!!q90!!q91!!q92!!q93!!q94!!q95!!q96!
echo.   8!q97!!q98!!q99!!q100!!q101!!q102!!q103!!q104!!q105!!q106!!q107!!q108!
echo.   9!q109!!q110!!q111!!q112!!q113!!q114!!q115!!q116!!q117!!q118!!q119!!q120!
echo.  10!q121!!q122!!q123!!q124!!q125!!q126!!q127!!q128!!q129!!q130!!q131!!q132!
echo.    !q133!!q134!!q135!!q136!!q137!!q138!!q139!!q140!!q141!!q142!!q143!!q144!
exit /b

:begin
cls
echo.
echo Captain, enemy ships have been spotted^^!
if /i "!sounds!" == "On " SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\alarm.wav
echo.
pause

:setup
if "!flicker!" == "Off" (set f=colous 0 0 1,1) ELSE set f=cls
for /l %%c in (1,1,144) do set q%%c=!water!
for %%b in ( q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q24 q25 q36 q37 q48 q49 q60 q61 q72 q73 q84 q85 q96 q97 q108 q109 q120 q121 q132 q133 q134 q135 q136 q137 q138 q139 q140 q141 q142 q143 q144) do set %%b=!border!
set a_placed=
set b_placed=
set s_placed=
set c_placed=
set d_placed=
set type=AircraftCarrier
set size=5
set dir=vert
set place1=14
set place2=26
set place3=38
set place4=50
set place5=62
for /l %%s in (1,1,5) do set presym%%s=!water!

for /l %%v in (1,1,!size!) do set q!place%%v!=!%type%_marker!

cls
:edit
if "!playerrandom!" == "true" (
set type=!pretype!
set size=!presize!
for /l %%v in (1,1,!size!) do set place%%v=
for /l %%y in (1,1,144) do set q%%y=!a%%y!
set place1=1
set place2=13
set place3=25
set place4=37
set place5=49
for /l %%s in (1,1,!size!) do call set presym%%s=%%q!place%%s!%%
)
set playerrandom=
)
!f!
echo.
echo Deploy your fleet, Captain^^!
echo.
call :placescreen
echo.
echo.
echo  WASD/Move       p/Place Ship   r/Rotate Ship   b/Begin
echo  c/Change Ship   f/Wipe Fleet   l/Auto-Deploy   q/Quit
echo.
choice /c:wasdprclbfq /n

if ERRORLEVEL 11 goto menu

if ERRORLEVEL 10 goto setup

if ERRORLEVEL 9 goto proceed

if ERRORLEVEL 8 (
set playerrandom=true
set ranfor=p
set a_placed=[Placed]
set b_placed=[Placed]
set s_placed=[Placed]
set c_placed=[Placed]
set d_placed=[Placed]
set pretype=!type!
set presize=!size!
for /l %%p in (1,1,!size!) do set preplace%%p=!place%%p!
goto start2
)

if ERRORLEVEL 7 goto changeship

if ERRORLEVEL 6 (
REM Rotate
set rotate=true
if "!dir!" == "vert" set sign=-
if "!dir!" == "horiz" set sign=+
set /a incr=!size!-1
set /a incr*=12
set /a incr=!incr!-!size!+1
call :checkmove
set rotate=
if "!check!" == "failed" goto edit
::Start rotate
for /l %%a in (1,1,144) do if "!pc.%%a!" == "!type!" (
set pc.%%a=
set q%%a=!water!
)
for /l %%p in (1,1,!size!) do set q!place%%p!=!presym%%p!
set init=!place1!
for /l %%i in (2,1,!size!) do (
if "!dir!" == "vert" set /a init+=1
if "!dir!" == "horiz" set /a init+=12
set place%%i=!init!
)
for /l %%c in (1,1,!size!) do call set presym%%c=%%q!place%%c!%%
for /l %%v in (1,1,!size!) do set q!place%%v!=!%type%_marker!
if /i "!dir!" == "vert" (set dir=horiz) ELSE set dir=vert
)

if ERRORLEVEL 5 goto placecheck

if ERRORLEVEL 4 (
REM D
set sign=+
set incr=1
goto checkmove
)

if ERRORLEVEL 3 (
REM S
set sign=+
set incr=12
goto checkmove
)


if ERRORLEVEL 2 (
REM A
set sign=-
set incr=1
goto checkmove
)

if ERRORLEVEL 1 (
REM W
set sign=-
set incr=12
goto checkmove
)

goto edit

:checkmove
set check=
set !type:~0,1!_placed=
set /a check1=!place1!!sign!!incr!
set /a check2=!place%size%!!sign!!incr!
if not "!rotate!" == "true" if !check1! LSS 1 goto edit
if !check2! GTR 144 set check=failed
if "!rotate!" == "true" exit /b
if "!check!" == "failed" goto edit

for /l %%a in (1,1,144) do if "!pc.%%a!" == "!type!" (
set pc.%%a=
set q%%a=!water!
)

for /l %%p in (1,1,!size!) do set q!place%%p!=!presym%%p!
for /l %%i in (1,1,!size!) do set /a place%%i!sign!=!incr!
for /l %%c in (1,1,!size!) do call set presym%%c=%%q!place%%c!%%
for /l %%v in (1,1,!size!) do set q!place%%v!=!%type%_marker!
goto edit

:placecheck
for /l %%c in (1,1,!size!) do if not "!presym%%c!" == "!water!" (
echo.
echo You cannot place your ship here^^!
echo.
pause
cls
goto edit
)
for /l %%p in (1,1,!size!) do set pc.!place%%p!=!type!
for /l %%p in (1,1,!size!) do set q!place%%p!=!%type%_marker!
for /l %%c in (1,1,!size!) do call set presym%%c=%%q!place%%c!%%
set !type:~0,1!_placed=[Placed]

:proceed
if not "!a_placed!" == "" (
if not "!b_placed!" == "" (
if not "!s_placed!" == "" (
if not "!c_placed!" == "" (
if not "!d_placed!" == "" (
for /l %%p in (1,1,!size!) do set presym%%p=!water!
:proceedask
cls
echo.
echo.
call :placescreen
echo.
echo Your fleet has been deployed to the assigned positions.
echo Proceed?
echo.
set /p choose=[y/n]: 
cls
if /i "!choose!" == "y" goto gamestart
if /i "!choose!" == "n" goto edit

goto proceed
)))))
goto changeship


:changeship
cls
echo.
echo Change ship.
echo.
echo 1. Aircraft Carrier     [5 Spaces]  !a_placed!
echo 2. Battleship           [4 Spaces]  !b_placed!
echo 3. Submarine            [3 Spaces]  !s_placed!
echo 4. Cruiser              [3 Spaces]  !c_placed!
echo 5. Destroyer            [2 Spaces]  !d_placed!
echo.
echo b/Back   c/Continue
echo.
set /p choose=Choose a number: 
cls
if /i "!choose!" == "b" goto edit
if /i "!choose!" == "c" goto proceed
if not "!choose!" == "1" if not "!choose!" == "2" if not "!choose!" == "3" if not "!choose!" == "4" if not "!choose!" == "5" goto changeship


for /l %%p in (1,1,!size!) do set q!place%%p!=!presym%%p!
if "!choose!" == "1" (
set size=5
set type=AircraftCarrier
for /l %%a in (1,1,144) do if "!pc.%%a!" == "AircraftCarrier" (
set pc.%%a=
set q%%a=!water!
)
)
if "!choose!" == "2" (
set size=4
set type=Battleship
for /l %%a in (1,1,144) do if "!pc.%%a!" == "Battleship" (
set pc.%%a=
set q%%a=!water!
)
)
if "!choose!" == "3" (
set size=3
set type=Submarine
for /l %%a in (1,1,144) do if "!pc.%%a!" == "Submarine" (
set pc.%%a=
set q%%a=!water!
)
)
if "!choose!" == "4" (
set size=3
set type=Cruiser
for /l %%a in (1,1,144) do if "!pc.%%a!" == "Cruiser" (
set pc.%%a=
set q%%a=!water!
)
)
if "!choose!" == "5" (
set size=2
set type=Destroyer
for /l %%a in (1,1,144) do if "!pc.%%a!" == "Destroyer" (
set pc.%%a=
set q%%a=!water!
)
)
set presym1=!q14!
set presym2=!q26!
set presym3=!q38!
set presym4=!q50!
set presym5=!q62!
set dir=vert
set place1=14
set place2=26
set place3=38
set place4=50
set place5=62
for /l %%v in (1,1,!size!) do set q!place%%v!=!%type%_marker!
set !type:~0,1!_placed=
set smarttarget=
goto edit






:gamestart
if /i "!firstTurn!" == "Player" set turn=player
if /i "!firstTurn!" == "CPU   " set turn=CPU
if /i "!firstTurn!" == "Random" (
set /a ran=%RANDOM% %% 2 + 1
if "!ran!" == "1" set turn=player
if "!ran!" == "2" set turn=CPU
)

for /l %%c in (1,1,144) do set c%%c=!water!
for /l %%p in (1,1,144) do set p%%p=!q%%p!
for %%b in ( c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c24 c25 c36 c37 c48 c49 c60 c61 c72 c73 c84 c85 c96 c97 c108 c109 c120 c121 c132 c133 c134 c135 c136 c137 c138 c139 c140 c141 c142 c143 c144) do set %%b=!border!
set curpos=14
set c14=!cursor!
set presym=!water!
for /l %%s in (1,1,5) do set memoryshot%%s=
for /l %%t in (1,1,5) do set set memorytype%%t=
set memory=
set lastshot=

for %%p in (p c) do (
for %%c in (accuracy shots ammo) do set %%p_%%c=0
)

for %%a in (p c) do set %%a_AircraftCarrier=5
for %%b in (p c) do set %%b_Battleship=4
for %%s in (p c) do set %%s_Submarine=3
for %%c in (p c) do set %%c_Cruiser=3
for %%d in (p c) do set %%d_Destroyer=2
for %%f in (p c) do set %%f_ships=5
cls
mode 50,30

REM Spaces in the "echo." lines are needed to help clear the screen.

:game
!f!
set check=
if /i "!turn!" == "CPU" (set z=) Else set z=
echo.
echo.
call :gamescr
echo.
echo.
REM set turn=CPU
if /i "!turn!" == "cpu" echo  Awaiting enemy fire... [Thinking]              
if /i "!turn!" == "cpu" goto cpu
echo   WASD/Move   F/Fire   o/Options                   
echo.                                           
choice /c:wasdfoc /n

if ERRORLEVEL 7 (CLS) && goto game

if ERRORLEVEL 6 goto options

if ERRORLEVEL 5 goto hitcheck

if ERRORLEVEL 4 (
REM D
set sign=+
set incr=1
goto movecheck
)

if ERRORLEVEL 3 (
REM S
set sign=+
set incr=12
goto movecheck
)


if ERRORLEVEL 2 (
REM A
set sign=-
set incr=1
goto movecheck
)

if ERRORLEVEL 1 (
REM W
set sign=-
set incr=12
goto movecheck
)

goto game

:movecheck
set /a reqpos=!curpos!!sign!!incr!
if !reqpos! GTR 144 goto game
if !reqpos! LSS 1 goto game

set c!curpos!=!presym!
set /a curpos=!curpos!!sign!!incr!
set presym=!c%curpos%!
set c!curpos!=!cursor!
goto game


:hitcheck
if not "!presym!" == "!water!" (
echo.
if "!presym!" == "!border!" echo You cannot target there^^!                 
if "!presym!" == "!hit!" echo You have already hit that target^^!                 
if "!presym!" == "!miss!" echo Nothing there but open waters...                 
echo.
pause
cls
goto game
)

set /a p_shots+=1

if "!ani!" == "On " (set aniTarget=!curpos!) && call :gamescr_ani

if "!cc.%curpos%!" == "" (
set c!curpos!=!miss!
set presym=!miss!
set turn=CPU
goto game
)


if /i not "!extrashot!" == "On " set turn=CPU
echo.
set c!curpos!=!hit!
set presym=!hit!
set /a p_accuracy+=1
set /a c_!cc.%curpos%!-=1
call set num=%%c_!cc.%curpos%!%%
if "!num!" == "0" (
set /a c_ships-=1
echo You sunk the enemy's !cc.%curpos%!^^!                 
if "!sounds!" == "On " (SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\sink.wav) ELSE pause>nul
) ELSE (
echo You hit a ship^^!                 
echo.
set /a ran=!random! %% 5+1
if "!sounds!" == "On " (SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\explosion!ran!.wav) ELSE pause>nul
)
cls
if "!c_ships!" == "0" goto win
goto game


:options
cls
echo.
echo 1. Continue
echo 2. Restart
echo 3. Themes
echo 4. Sounds: !sounds!
echo 5. Animations: !ani!
echo 6. Quit
echo.
set /p choose=Choose a number: 
cls
if /i "!choose!" == "b" goto game
if "!choose!" == "1" goto game
if "!choose!" == "2" goto start
if "!choose!" == "3" call :themes
if "!choose!" == "4" (
if /i "!sounds!" == "Off" (set sounds=On ) ELSE set sounds=Off
)
if "!choose!" == "5" (
if /i "!ani!" == "Off" (set ani=On ) ELSE set ani=Off
)
if "!choose!" == "6" goto menu
goto options


:cpu
if /i not "!difficulty!" == "Easy" if /i "!memory!" == "true" goto memory
set memships=
set /a tar=%random% %% 144 + 1

if "!p%tar%!" == "!border!" goto cpu
if "!p%tar%!" == "!hit!" goto cpu
if "!p%tar%!" == "!miss!" goto cpu

if /i not "!difficulty!" == "Hard" goto easytar


REM ==========================Smart-Targeting==========================

REM Function:
REM This block of code let's the CPU determine what is a reasonable target.
REM Meaning, if there is an empty space completely surrounded by misses, then
REM it will not fire there because there isn't a ship that small. Example:
REM if the player's Aircraft Carrier is still in play, it will look for a
REM sequence of 5 empty spots that it hasn't yet targeted. Smart, eh?

if not "!p_Destroyer!" == "0" set min=1
if not "!p_Cruiser!" == "0" set min=2
if not "!p_Submarine!" == "0" set min=2
if not "!p_Battleship!" == "0" set min=3
if not "!p_Aircraftcarrier!" == "0" set min=4
set inittarget=!tar!
for /l %%c in (1,1,4) do set check%%c=

:smarttar
set inittarget=!tar!
set /a ran=%random% %% 4+1
REM 1-Up 2-Left 3-Down 4-Right

set check_dir1=Up
set check_dir2=Left
set check_dir3=Down
set check_dir4=Right

if not "!ran!" == "3" if not "!ran!" == "4" set tarsign=-
if not "!ran!" == "1" if not "!ran!" == "2" set tarsign=+
if not "!ran!" == "1" if not "!ran!" == "3" set tarincr=1
if not "!ran!" == "2" if not "!ran!" == "4" set tarincr=12

if /i "!check%ran%!" == "failed" goto smarttar
set mincount=0


:minloop
set /a mincount+=1
set /a inittarget=!inittarget!!tarsign!!tarincr!

REM if not "!p%inittarget%!" == "!water!" if not "!p%inittarget%!" == "!marker!" set check!ran!=failed
REM if not "!p%inittarget%!" == "!water!" if "!pc.%inittarget%!" == "" set check!ran!=failed

REM Dual if statements should allow for potential ships.

if not "!p%inittarget%!" == "!water!" if "!pc.%inittarget%!" == "" set check!ran!=failed
if "!p%inittarget%!" == "!hit!" set check!ran!=failed
if "!p%inittarget%!" == "!miss!" set check!ran!=failed
if "!p%inittarget%!" == "!border!" set check!ran!=failed

REM All checks must fail (every direction is bad) in order to re-target.
if /i "!check1!" == "failed" if /i "!check2!" == "failed" if /i "!check3!" == "failed" if /i "!check4!" == "failed" goto cpu
if /i "!check%ran%!" == "failed" goto smarttar
if not "!mincount!" == "!min!" goto minloop

set smarttarget=true


REM ========================End Smart-Targeting========================

:easytar

set /a c_shots+=1

if "!ani!" == "On " (set aniTarget=!tar!) && call :gamescr_ani

REM CPU misses
if "!pc.%tar%!" == "" (
set p!tar!=!miss!
set turn=player
goto game
)

REM CPU hits
set p!tar!=!hit!
set /a c_accuracy+=1
set /a p_!pc.%tar%!-=1
call set num=%%p_!pc.%tar%!%%
echo.                                           
echo Your !pc.%tar%! has been hit^^!                 
set /a ran=!random! %% 5+1
if "!sounds!" == "On " (SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\explosion!ran!.wav) ELSE pause>nul
cls

if "!num!" == "0" (
set /a p_ships-=1
)


if "!p_ships!" == "0" goto lose
set memory=true
set memorytype1=!pc.%tar%!
set memoryshot1=!tar!
set memships=1
set focus=1
if /i not "!extrashot!" == "On " set turn=player
goto game


REM Precondition: CPU has already hit a ship.
:memory
if "!memorytype%focus%!" == "" (
set /a focus+=1
if "!focus!" == "6" set memory=
if "!focus!" == "6" goto cpu
goto memory
)

if /i "!smarttarget!" == "true" (
set /a target=!memoryshot%focus%!!tarsign!!tarincr!
set smarttarget=
goto nols
)

if "!lastshot!" == "" (
set /a ran=%random% %% 2+1
if "!ran!" == "1" set tarsign=-
if "!ran!" == "2" set tarsign=+
set /a ran=%random% %% 2+1
if "!ran!" == "1" set tarincr=1
if "!ran!" == "2" set tarincr=12
set /a target=!memoryshot%focus%!!tarsign!!tarincr!
)

if "!lastshot!" == "" (
if not "!p%target%!" == "!water!" (

if not "!p%target%!" == "!hit!" if not "!p%target%!" == "!miss!" if not "!p%target%!" == "!border!" goto didHit
goto memory
))
:didHit

if "!lastshot!" == "missed" goto reversedir
if "!lastshot!" == "" goto nols

set /a nexttar=!lastshot!!tarsign!!tarincr!
if "!p%nexttar%!" == "!water!" goto lsout

if not "!pc.%nexttar%!" == "" if not "!p%nexttar%!" == "!hit!" if not "!p%nexttar%!" == "!miss!" goto lsout

:reversedir
if "!tarsign!" == "+" (set tarsign=-) ELSE set tarsign=+
set /a nexttar=!memoryshot%focus%!!tarsign!!tarincr!


REM If next target is not water, or if sym is not a ship
if not "!p%nexttar%!" == "!hit!" if not "!p%nexttar%!" == "!miss!" if not "!p%nexttar%!" == "!border!" goto lsout
set lastshot=
goto memory



:lsout
if not "!lastshot!" == "" set target=!nexttar!
:nols

if "!ani!" == "On " (set aniTarget=!target!) && call :gamescr_ani

set /a c_shots+=1
if "!pc.%target%!" == "" (
set p!target!=!miss!
set turn=player
set lastshot=missed
goto game
)

set lastshot=!target!
set p!target!=!hit!

set /a c_accuracy+=1
set /a p_!pc.%target%!-=1
call set num=%%p_!pc.%target%!%%

REM New ship
if /i not "!pc.%target%!" == "!memorytype1!" if /i not "!pc.%target%!" == "!memorytype2!" if /i not "!pc.%target%!" == "!memorytype3!" if /i not "!pc.%target%!" == "!memorytype4!" if /i not "!pc.%target%!" == "!memorytype5!" (
set /a memships+=1
set memoryshot!memships!=!target!
set memorytype!memships!=!pc.%target%!
)

REM Destroyed ship
if "!num!" == "0" (
for /l %%c in (1,1,5) do if "!pc.%target%!" == "!memorytype%%c!" (
set memoryshot%%c=
set memorytype%%c=
)
echo.                                                
echo The enemy has sunk your !pc.%target%!^^!                 
if "!sounds!" == "On " (SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\sink.wav) ELSE pause>nul

set /a p_ships-=1
set lastshot=
) Else (
echo.                                           
echo Your !pc.%target%! has been hit^^!                 
set /a ran=!random! %% 5+1
if "!sounds!" == "On " (SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\explosion!ran!.wav) ELSE pause>nul

)

cls
if "!p_ships!" == "0" goto lose
if /i not "!extrashot!" == "On " set turn=player
goto game



:gamescr
echo.
echo     ABCDEFGHIJ  	  ABCDEFGHIJ
echo.   !p1!!p2!!p3!!p4!!p5!!p6!!p7!!p8!!p9!!p10!!p11!!p12!         !c1!!c2!!c3!!c4!!c5!!c6!!c7!!c8!!c9!!c10!!c11!!c12!
echo.  1!p13!!p14!!p15!!p16!!p17!!p18!!p19!!p20!!p21!!p22!!p23!!p24!        1!c13!!c14!!c15!!c16!!c17!!c18!!c19!!c20!!c21!!c22!!c23!!c24!  Ships left:
echo.  2!p25!!p26!!p27!!p28!!p29!!p30!!p31!!p32!!p33!!p34!!p35!!p36!        2!c25!!c26!!c27!!c28!!c29!!c30!!c31!!c32!!c33!!c34!!c35!!c36!
echo.  3!p37!!p38!!p39!!p40!!p41!!p42!!p43!!p44!!p45!!p46!!p47!!p48!        3!c37!!c38!!c39!!c40!!c41!!c42!!c43!!c44!!c45!!c46!!c47!!c48!  Player: !p_ships!
echo.  4!p49!!p50!!p51!!p52!!p53!!p54!!p55!!p56!!p57!!p58!!p59!!p60!        4!c49!!c50!!c51!!c52!!c53!!c54!!c55!!c56!!c57!!c58!!c59!!c60!
echo.  5!p61!!p62!!p63!!p64!!p65!!p66!!p67!!p68!!p69!!p70!!p71!!p72!    !z!   5!c61!!c62!!c63!!c64!!c65!!c66!!c67!!c68!!c69!!c70!!c71!!c72!  CPU: !c_ships!
echo.  6!p73!!p74!!p75!!p76!!p77!!p78!!p79!!p80!!p81!!p82!!p83!!p84!        6!c73!!c74!!c75!!c76!!c77!!c78!!c79!!c80!!c81!!c82!!c83!!c84!
echo.  7!p85!!p86!!p87!!p88!!p89!!p90!!p91!!p92!!p93!!p94!!p95!!p96!        7!c85!!c86!!c87!!c88!!c89!!c90!!c91!!c92!!c93!!c94!!c95!!c96!
echo.  8!p97!!p98!!p99!!p100!!p101!!p102!!p103!!p104!!p105!!p106!!p107!!p108!        8!c97!!c98!!c99!!c100!!c101!!c102!!c103!!c104!!c105!!c106!!c107!!c108!
echo.  9!p109!!p110!!p111!!p112!!p113!!p114!!p115!!p116!!p117!!p118!!p119!!p120!        9!c109!!c110!!c111!!c112!!c113!!c114!!c115!!c116!!c117!!c118!!c119!!c120!
echo. 10!p121!!p122!!p123!!p124!!p125!!p126!!p127!!p128!!p129!!p130!!p131!!p132!       10!c121!!c122!!c123!!c124!!c125!!c126!!c127!!c128!!c129!!c130!!c131!!c132!
echo.   !p133!!p134!!p135!!p136!!p137!!p138!!p139!!p140!!p141!!p142!!p143!!p144!         !c133!!c134!!c135!!c136!!c137!!c138!!c139!!c140!!c141!!c142!!c143!!c144!
exit /b

:gamescr_ani

set endPos=!aniTarget!
set /a aniPos=(!aniTarget!%%12)-12
if /i "!turn!" == "CPU" (set aniscr=p) ELSE set aniscr=c

:aniloop
set /a aniPos+=12
set preanisym=!%aniscr%%aniPos%!
set !aniscr!!anipos!=!missile!

!f!
echo.
echo.
call :gamescr
echo.                                 
echo.                                 
if /i not "!turn!" == "CPU" echo.                                 
set !aniscr!!aniPos!=!preanisym!

if not "!aniPos!" == "!endPos!" goto aniloop
exit /b





REM :print_ship_health
REM for %%t in (AircraftCarrier Battleship Carrier Destroyer Submarine) do (
REM if !p_%%t! GTR 0 REM
REM )


:getAccuracy
for %%t in (p c) do set %%t_numer=!%%t_accuracy!
for %%t in (p c) do set %%t_denom=!%%t_shots!
for %%t in (p c) do (
set %%t_decimal=
for /l %%d in (1,1,4) do (
set /a %%t_accuracy*=10
set /a %%t_append=!%%t_accuracy!/!%%t_shots!
set %%t_decimal=!%%t_decimal!!%%t_append!
if "%%d" == "2" set %%t_decimal=!%%t_decimal!.
set %%t_subtract=!%%t_append!*!%%t_shots!
set /a %%t_accuracy-=!%%t_subtract!
))
exit /b

:win
call :getAccuracy

:win2
cls
echo.
echo.
call :gamescr
echo.
echo Captain, the enemy fleet has been wiped out^^!
echo.
echo Difficulty:    !difficulty!
echo Accuracy:      !p_numer! hits out of !p_denom! shots [!p_decimal! %%%]
echo.
echo CPU Accuracy:  !c_numer! hits out of !c_denom! shots [!c_decimal! %%%]
echo.
if /i "!sounds!" == "On " SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\win.wav
echo Play again?
echo.
set /p choose=[y/n]: 
if "!choose!" == "y" goto difficulty
if "!choose!" == "n" goto menu
goto win2


:lose
call :getAccuracy

REM Display CPU's ships.
set c!curpos!=!presym!
set varcount=0

:display_ships
REM I know this is the ugliest loop in existence, but it's the only
REM way it would work... some kind of bug.

set /a varcount+=1
set findType=
if "!cc.%varcount%!" == "" if not "!varcount!" == "132" goto display_ships
if "!c%varcount%!" == "!hit!" if not "!varcount!" == "132" goto display_ships
if "!varcount!" == "132" goto lose2
set findType=!cc.%varcount%!
set c!varcount!=!%findType%_marker!
if not "!varcount!" == "132" goto display_ships



:lose2
cls
echo.
echo.
call :gamescr
echo.
echo Sorry, Captain, but your fleet has been wiped out.
echo.
echo Difficulty:    !difficulty!
echo Accuracy:      !p_numer! hits out of !p_denom! shots [!p_decimal! %%%]
echo.
echo CPU Accuracy:  !c_numer! hits out of !c_denom! shots [!c_decimal! %%%]
echo.
if /i "!sounds!" == "On " SNDREC32 /PLAY /CLOSE /EMBEDDING .\SOUNDS\lose.wav
echo Try again?
echo.
set /p choose=[y/n]: 
if "!choose!" == "y" goto difficulty
if "!choose!" == "n" goto menu
goto lose2

REM ************************************End of Game************************************

:default_1
set hit=X
set miss=-
set water= 
set border=Û
set cursor=@
set missile=*

set AircraftCarrier_marker=a
set Battleship_marker=b
set Submarine_marker=s
set Cruiser_marker=c
set Destroyer_marker=d
exit /b

:default_2
set firstTurn=Random
set extrashot=Off
set ani=On 
set sounds=Off
set anintro=On 
set flicker=Off
exit /b

:default_3
set bf=07
exit /b

:save
if /i exist "config.bat" del config.bat
echo set hit=!hit!>>config.bat
echo set miss=!miss!>>config.bat
echo set water=!water!>>config.bat
echo set border=!border!>>config.bat
echo set cursor=!cursor!>>config.bat
echo set missile=!missile!>>config.bat

echo set AircraftCarrier_marker=!AircraftCarrier_marker!>>config.bat
echo set Battleship_marker=!Battleship_marker!>>config.bat
echo set Submarine_marker=!Submarine_marker!>>config.bat
echo set Cruiser_marker=!Cruiser_marker!>>config.bat
echo set Destroyer_marker=!Destroyer_marker!>>config.bat

echo set firstTurn=!firstTurn!>>config.bat
echo set extrashot=!extrashot!>>config.bat
echo set ani=!ani!>>config.bat
echo set sounds=!sounds!>>config.bat
echo set f=!f!>>config.bat
echo set anintro=!anintro!>>config.bat
echo set flicker=!flicker!>>config.bat
echo set bf=!bf!>>config.bat
exit /b



:about
title Batch Battleship by Kolto101
cls
echo.
echo                                  Release v1.0
echo.
echo.
echo           Batch Battleship                   Locked-on^^!      ³
echo                                                              ³
echo    Entirely coded and produced by                          _.³._
echo       Kolto101 and Kolt Koding                            /     \
echo                                                    ÄÄÄÄÄÄ³-Á-Ø-Á-³ÄÄÄÄÄÄ
echo   ASCII Battleship by Matthew Bace                        \_   _/
echo                                                             `³`
echo          Copyright (C) 2012                                  ³
echo                                                              ³      Fire^^!
echo.
echo  Release Notes:
echo.
echo  Tested and works on Windows: XP (with choice.COM), Vista, and 7
echo.
echo  Batch Battleship is based off of the Hasboro board game. This is a FREE
echo  re-creation, and the original Battleship board game is solely owned by
echo  Hasboro. Don't sue me. Enjoy^^!
echo.
echo  ** PLEASE report ANY bugs or crashes that may occur to: kolto101@gmail.com **
echo.             Visit http://www.koltkoding.tk/ for updates and more.
echo.
echo.
echo  b/Back   y/Kolto101's Youtube   f/FARA Games
echo.
REM u/Check for updates   
set /p choose=Choose a letter: 
if /i "!choose!" == "b" goto menu
if /i "!choose!" == "k" start http://www.koltkoding.tk/
if /i "!choose!" == "y" start http://www.youtube.com/user/kolto101/videos
if /i "!choose!" == "f" start http://www.faragames.tk/
REM if /i "!choose!" == "u" start http://www.koltkoding.tk/battleship/
goto about



:config
mode 80,30
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º       Configure       º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º                       º
echo  º 1. Customize          º
echo  º 2. Settings           º
echo  º 3. Themes             º
echo  º                       º
echo  º  Press b to go back   º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "b" goto menu
if "!choose!" == "1" goto customize
if "!choose!" == "2" goto settings
if "!choose!" == "3" call :themes
goto config


:customize
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º                Customize                º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º               º                         º
echo  º 1. Cursor: !cursor!  º 6. Aircraft Carrier: !AircraftCarrier_marker!  º
echo  º               º                         º
echo  º 2. Hit: !hit!     º 7. Battleship: !Battleship_marker!        º
echo  º               º                         º
echo  º 3. Miss: !miss!    º 8. Submarine: !Submarine_marker!         º
echo  º               º                         º
echo  º 4. Water: !water!   º 9. Cruiser: !Cruiser_marker!           º
echo  º               º                         º
echo  º 5. Border: !border!  º 10. Destroyer: !Destroyer_marker!        º
echo  º               º                         º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º                                         º
echo  º 11. Missile: !missile!                          º
echo  º                                         º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo b/Back   d/Default
echo.
set /p choose=Choose a number to change the current graphic: 
if /i "!choose!" == "b" goto config
if "!choose!" == "1" set tochange=cursor
if "!choose!" == "2" set tochange=hit
if "!choose!" == "3" set tochange=miss
if "!choose!" == "4" set tochange=water
if "!choose!" == "5" set tochange=border
if "!choose!" == "6" set tochange=AircraftCarrier_marker
if "!choose!" == "7" set tochange=Battleship_marker
if "!choose!" == "8" set tochange=Submarine_marker
if "!choose!" == "9" set tochange=Cruiser_marker
if "!choose!" == "10" set tochange=Destroyer_marker
if "!choose!" == "11" set tochange=missile

if !choose! GEQ 1 (
if !choose! LEQ 11 (
call :changegraphic
))

if /i "!choose!" == "d" call :default_1 && call :save
call :save
goto customize




:settings
mode 80,30
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º            Settings            º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º                                º
echo  º  1. First Turn         !firstTurn!  º
echo  º  2. Extra Shot         !extrashot!     º
echo  º  3. Animations         !ani!     º
echo  º  4. Sounds             !sounds!     º
echo  º  5. Animated Intro     !anintro!     º
echo  º  6. Flicker            !flicker!     º
REM echo  º   7. Automatic Updating   !autoupdate!  º
echo  º                                º
echo  º       b/Back   d/Default       º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "b" goto config
if /i "!choose!" == "d" call :default_2

if "!choose!" == "1" (
if /i "!firstTurn!" == "Player" (set firstTurn=CPU   ) ELSE (
if /i "!firstTurn!" == "CPU   " (set firstTurn=Random) ELSE (
if /i "!firstTurn!" == "Random" set firstTurn=Player
)))

if "!choose!" == "2" (
if "!extrashot!" == "Off" (set extrashot=On ) ELSE set extrashot=Off
)

if "!choose!" == "3" (
if "!ani!" == "Off" (set ani=On ) ELSE set ani=Off
)

if "!choose!" == "4" (
if "!sounds!" == "Off" (
set sounds=On 
echo.
echo If you have problems with the sound, right-click sndrec32
echo and run it as administrator ONCE. Then restart the game and
echo it should work. Contact kolto101@gmail.com for help.
echo.
pause
) ELSE set sounds=Off
)

if "!choose!" == "5" (
if "!anintro!" == "Off" (set anintro=On ) ELSE set anintro=Off
)

if "!choose!" == "6" (
if "!flicker!" == "Off" (
set flicker=On 
set f=cls
) ELSE (
set flicker=Off
set f=colous 0 0 1,1
))

REM if "!choose!" == "6" (
REM if "!autoupdate!" == "Off" (set autoupdate=On ) ELSE set autoupdate=Off
REM )

call :save
goto settings


:themes
set previousbf=!bf!
cls
echo.
echo                           0 = Black      8 = Gray
echo                           1 = Blue       9 = Light Blue
echo                           2 = Green      A = Light Green
echo                           3 = Aqua       B = Light Aqua
echo                           4 = Red        C = Light Red
echo                           5 = Purple     D = Light Purple
echo                           6 = Yellow     E = Light Yellow
echo                           7 = White      F = Bright White
echo.
echo                                   Default: 07
echo.
echo               Set the background color and the foreground color.
echo               The first letter/number is the background color,
echo               the second is the foreground. Do not use spaces.
echo.
echo                               Type "m" to go back.
echo.
set /p bf=Set Background/Foreground: 
if /i "!bf!" == "m" (
set bf=!previousbf!
exit /b
)
if !bf! LSS a if !bf! GTR 99 goto themes
if not "!bf:~2!"=="" (
echo The color code cannot be more than 2 characters long.
echo.
pause
goto themes
)
if !bf! GTR FF goto themes
if !bf! LSS 00 goto themes
color !bf!
call :save
goto themes



:changegraphic
cls
echo Currently editting: !tochange!
echo Enter a character below, or choose and extended character.
echo.
echo -b/Back   -s/Open extended characters
echo.
set /p symbol=Chracter: 
if /i "!symbol!" == "-b" exit /b
if "!symbol!" == "" goto changegraphic

if /i "!symbol!" == "-s" call :symbolstart
if /i "!symbol!" == "-s" goto changegraphic


set changecount=0

if "!symbol:~0,1!" == "!cursor!" set /a changecount+=1
if "!symbol:~0,1!" == "!hit!" set /a changecount+=1
if "!symbol:~0,1!" == "!miss!" set /a changecount+=1
if "!symbol:~0,1!" == "!water!" set /a changecount+=1
if "!symbol:~0,1!" == "!border!" set /a changecount+=1
if "!symbol:~0,1!" == "!AircraftCarrier_marker!" set /a changecount+=1
if "!symbol:~0,1!" == "!Battleship_marker!" set /a changecount+=1
if "!symbol:~0,1!" == "!Submarine_marker!" set /a changecount+=1
if "!symbol:~0,1!" == "!Cruiser_marker!" set /a changecount+=1
if "!symbol:~0,1!" == "!Destroyer_marker!" set /a changecount+=1

if /i not "!tochange!" == "missile" if not "!changecount!" == "0" (
echo.
echo This character is already in use^^!
echo.
pause
goto changegraphic
)
set !tochange!=!symbol:~0,1!
exit /b




:symbolstart
mode 80,50
cls
call :symbolecho
set symbolnum=
echo b/Back
echo.
set /p symbolnum=Enter the character number to output #
if /i "!symbolnum!" == "b" exit /b

if not !symbolnum! GTR 0 goto symbolstart
if !symbolnum! GTR 254 goto symbolstart
call :symbol
if !symbolnum! GEQ 32 (
if !symbolnum! LEQ 126 (
echo.
echo Characters 32-126 can be accessed via keyboard.
pause>nul
goto symbolstart
))
if "!symbol!" == "N/A" goto symbolstart
:symbolask
cls
echo.
echo Symbol: !symbol!
echo.
echo Would you like to use this symbol?
set /p choose=[y/n]: 
if /i "!choose!" == "n" goto symbolstart
if /i "!choose!" == "y" exit /b
goto symbolask

:symbol
set symbol=N/A
if "!symbolnum!" == "1" set symbol=
if "!symbolnum!" == "2" set symbol=
if "!symbolnum!" == "3" set symbol=
if "!symbolnum!" == "4" set symbol=
if "!symbolnum!" == "5" set symbol=
if "!symbolnum!" == "6" set symbol=
if "!symbolnum!" == "11" set symbol=
if "!symbolnum!" == "12" set symbol=
if "!symbolnum!" == "14" set symbol=
if "!symbolnum!" == "15" set symbol=
if "!symbolnum!" == "16" set symbol=
if "!symbolnum!" == "17" set symbol=
if "!symbolnum!" == "18" set symbol=
if "!symbolnum!" == "19" set symbol=
if "!symbolnum!" == "20" set symbol=
if "!symbolnum!" == "21" set symbol=
if "!symbolnum!" == "22" set symbol=
if "!symbolnum!" == "23" set symbol=
if "!symbolnum!" == "24" set symbol=
if "!symbolnum!" == "25" set symbol=
if "!symbolnum!" == "27" set symbol=
if "!symbolnum!" == "28" set symbol=
if "!symbolnum!" == "29" set symbol=
if "!symbolnum!" == "30" set symbol=
if "!symbolnum!" == "31" set symbol=
REM 32 - 126 are accessible via keyboard
if "!symbolnum!" == "127" set symbol=
if "!symbolnum!" == "128" set symbol=€
if "!symbolnum!" == "129" set symbol=
if "!symbolnum!" == "130" set symbol=‚
if "!symbolnum!" == "131" set symbol=ƒ
if "!symbolnum!" == "132" set symbol=„
if "!symbolnum!" == "133" set symbol=…
if "!symbolnum!" == "134" set symbol=†
if "!symbolnum!" == "135" set symbol=‡
if "!symbolnum!" == "136" set symbol=ˆ
if "!symbolnum!" == "137" set symbol=‰
if "!symbolnum!" == "138" set symbol=Š
if "!symbolnum!" == "139" set symbol=‹
if "!symbolnum!" == "140" set symbol=Œ
if "!symbolnum!" == "141" set symbol=
if "!symbolnum!" == "142" set symbol=
if "!symbolnum!" == "143" set symbol=
if "!symbolnum!" == "144" set symbol=
if "!symbolnum!" == "145" set symbol=‘
if "!symbolnum!" == "146" set symbol=’
if "!symbolnum!" == "147" set symbol=“
if "!symbolnum!" == "148" set symbol=”
if "!symbolnum!" == "149" set symbol=•
if "!symbolnum!" == "150" set symbol=–
if "!symbolnum!" == "151" set symbol=—
if "!symbolnum!" == "152" set symbol=˜
if "!symbolnum!" == "153" set symbol=™
if "!symbolnum!" == "154" set symbol=š
if "!symbolnum!" == "155" set symbol=›
if "!symbolnum!" == "156" set symbol=œ
if "!symbolnum!" == "157" set symbol=
if "!symbolnum!" == "158" set symbol=
if "!symbolnum!" == "159" set symbol=Ÿ
if "!symbolnum!" == "160" set symbol= 
if "!symbolnum!" == "161" set symbol=¡
if "!symbolnum!" == "162" set symbol=¢
if "!symbolnum!" == "163" set symbol=£
if "!symbolnum!" == "164" set symbol=¤
if "!symbolnum!" == "165" set symbol=¥
if "!symbolnum!" == "166" set symbol=¦
if "!symbolnum!" == "167" set symbol=§
if "!symbolnum!" == "168" set symbol=¨
if "!symbolnum!" == "169" set symbol=©
if "!symbolnum!" == "170" set symbol=ª
if "!symbolnum!" == "171" set symbol=«
if "!symbolnum!" == "172" set symbol=¬
if "!symbolnum!" == "173" set symbol=­
if "!symbolnum!" == "174" set symbol=®
if "!symbolnum!" == "175" set symbol=¯
if "!symbolnum!" == "176" set symbol=°
if "!symbolnum!" == "177" set symbol=±
if "!symbolnum!" == "178" set symbol=²
if "!symbolnum!" == "179" set symbol=³
if "!symbolnum!" == "180" set symbol=´
if "!symbolnum!" == "181" set symbol=µ
if "!symbolnum!" == "182" set symbol=¶
if "!symbolnum!" == "183" set symbol=·
if "!symbolnum!" == "184" set symbol=¸
if "!symbolnum!" == "185" set symbol=¹
if "!symbolnum!" == "186" set symbol=º
if "!symbolnum!" == "187" set symbol=»
if "!symbolnum!" == "188" set symbol=¼
if "!symbolnum!" == "189" set symbol=½
if "!symbolnum!" == "190" set symbol=¾
if "!symbolnum!" == "191" set symbol=¿
if "!symbolnum!" == "192" set symbol=À
if "!symbolnum!" == "193" set symbol=Á
if "!symbolnum!" == "194" set symbol=Â
if "!symbolnum!" == "195" set symbol=Ã
if "!symbolnum!" == "196" set symbol=Ä
if "!symbolnum!" == "197" set symbol=Å
if "!symbolnum!" == "198" set symbol=Æ
if "!symbolnum!" == "199" set symbol=Ç
if "!symbolnum!" == "200" set symbol=È
if "!symbolnum!" == "201" set symbol=É
if "!symbolnum!" == "202" set symbol=Ê
if "!symbolnum!" == "203" set symbol=Ë
if "!symbolnum!" == "204" set symbol=Ì
if "!symbolnum!" == "205" set symbol=Í
if "!symbolnum!" == "206" set symbol=Î
if "!symbolnum!" == "207" set symbol=Ï
if "!symbolnum!" == "208" set symbol=Ğ
if "!symbolnum!" == "209" set symbol=Ñ
if "!symbolnum!" == "210" set symbol=Ò
if "!symbolnum!" == "211" set symbol=Ó
if "!symbolnum!" == "212" set symbol=Ô
if "!symbolnum!" == "213" set symbol=Õ
if "!symbolnum!" == "214" set symbol=Ö
if "!symbolnum!" == "215" set symbol=×
if "!symbolnum!" == "216" set symbol=Ø
if "!symbolnum!" == "217" set symbol=Ù
if "!symbolnum!" == "218" set symbol=Ú
if "!symbolnum!" == "219" set symbol=Û
if "!symbolnum!" == "220" set symbol=Ü
if "!symbolnum!" == "221" set symbol=İ
if "!symbolnum!" == "222" set symbol=Ş
if "!symbolnum!" == "223" set symbol=ß
if "!symbolnum!" == "224" set symbol=à
if "!symbolnum!" == "225" set symbol=á
if "!symbolnum!" == "226" set symbol=â
if "!symbolnum!" == "227" set symbol=ã
if "!symbolnum!" == "228" set symbol=ä
if "!symbolnum!" == "229" set symbol=å
if "!symbolnum!" == "230" set symbol=æ
if "!symbolnum!" == "231" set symbol=ç
if "!symbolnum!" == "232" set symbol=è
if "!symbolnum!" == "233" set symbol=é
if "!symbolnum!" == "234" set symbol=ê
if "!symbolnum!" == "235" set symbol=ë
if "!symbolnum!" == "236" set symbol=ì
if "!symbolnum!" == "237" set symbol=í
if "!symbolnum!" == "238" set symbol=î
if "!symbolnum!" == "239" set symbol=ï
if "!symbolnum!" == "240" set symbol=ğ
if "!symbolnum!" == "241" set symbol=ñ
if "!symbolnum!" == "242" set symbol=ò
if "!symbolnum!" == "243" set symbol=ó
if "!symbolnum!" == "244" set symbol=ô
if "!symbolnum!" == "245" set symbol=õ
if "!symbolnum!" == "246" set symbol=ö
if "!symbolnum!" == "247" set symbol=÷
if "!symbolnum!" == "248" set symbol=ø
if "!symbolnum!" == "249" set symbol=ù
if "!symbolnum!" == "250" set symbol=ú
if "!symbolnum!" == "251" set symbol=û
if "!symbolnum!" == "252" set symbol=ü
if "!symbolnum!" == "253" set symbol=ı
if "!symbolnum!" == "254" set symbol=ş
exit /b

:symbolecho
echo.
echo      1:      2:      3:      4:      5:      6:      11:     12: 
echo.
echo      14:     15:     16:     17:     18:     19:     20:     21: 
echo.
echo      22:     23:     24:     25:     27:     28:     29:     30:    
echo.
echo      31: 
echo.
echo                 Characters 32-126 can be accessed via keyboard.
echo.
echo.
echo      127:    128: €   129:    130: ‚   131: ƒ   132: „   133: …   134: †
echo.
echo      135: ‡   136: ˆ   137: ‰   138: Š   139: ‹   140: Œ   141:    142: 
echo.
echo      143:    144:    145: ‘   146: ’   147: “   148: ”   149: •   150: –
echo.
echo      151: —   152: ˜   153: ™   154: š   155: ›   156: œ   157:    158: 
echo.
echo      159: Ÿ   160:     161: ¡   162: ¢   163: £   164: ¤   165: ¥   166: ¦
echo.
echo      167: §   168: ¨   169: ©   170: ª   171: «   172: ¬   173: ­   174: ®
echo.
echo      175: ¯   176: °   177: ±   178: ²   179: ³   180: ´   181: µ   182: ¶
echo.
echo      183: ·   184: ¸   185: ¹   186: º   187: »   188: ¼   189: ½   190: ¾
echo.
echo      191: ¿   192: À   193: Á   194: Â   195: Ã   196: Ä   197: Å   198: Æ
echo.
echo      199: Ç   200: È   201: É   202: Ê   203: Ë   204: Ì   205: Í   206: Î
echo.
echo      207: Ï   208: Ğ   209: Ñ   210: Ò   211: Ó   212: Ô   213: Õ   214: Ö
echo.
echo      215: ×   216: Ø   217: Ù   218: Ú   219: Û   220: Ü   221: İ   222: Ş
echo.
echo      223: ß   224: à   225: á   226: â   227: ã   228: ä   229: å   230: æ
echo.
echo      231: ç   232: è   233: é   234: ê   235: ë   236: ì   237: í   238: î
echo.
echo      239: ï   240: ğ   241: ñ   242: ò   243: ó   244: ô   245: õ   246: ö
echo.
echo      247: ÷   248: ø   249: ù   250: ú   251: û   252: ü   253: ı   254: ş
echo.
echo.
exit /b


