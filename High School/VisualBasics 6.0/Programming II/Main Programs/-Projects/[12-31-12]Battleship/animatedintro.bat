@echo off
Setlocal EnableDelayedExpansion
mode 80,30

if not defined f set f=colous 0 0 1,1

:anitest
set water1=÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ 
set water2= ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷
set water3= ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷ ÷
set watercount=0

set line1=                                      ^|__
set line2=                                      ³\/
set line3=                                      ---                                
set line4=                                      / ^| [                           
set line5=                               ^^!      ^| ^|^|^|                             
set line6=                             _/^|     _/^|-++'                
set line7=                         +  +--^|    ^|--^|--^|_ ^|-
set line8= !water1:~0,19!  { /^|__^|  ^|/\__^|  ^|--- ^|^|^|__/ !water1!!water1:~1!
set line9= !water2:~0,18!  +---------------___[}-_===_.'____ !water2:~0,17!/\ !water2!
set line10= !water1:~0,15! ____`-' ^|^|___-{]_^| _[}-  ^|     ³_[___\==--!water1:~0,11!  \/  __ !water1!
set line11=  __..._____--==/___]_^|__^|_____________________________[___\==--____,------' .7!water2!
set line12= ³                                                                  BB-1337 /!water1!
set line13=  \_________________________________________________________________________^|!water2!
set aninum=77
call :ani1

set line1=                                                                                     __________         __    __  .__                .__    .__          
set line2=                                                                                     \______   \_____ _/  ³__/  ³_³  ³   ____   _____³  ³__ ³__³_____          
set line3=                                                                                      ³    ³  _/\__  \\   __\   __\  ³ _/ __ \ /  ___/  ³  \³  \____ \          
set line4=                                                                                      ³    ³   \ / __ \³  ³  ³  ³ ³  ³_\  ___/ \___ \³   Y  \  ³  ³_^> ^>          
set line5=                                                                                      ³______  /(____  /__³  ³__³ ³____/\___  ^>____  ^>___³  /__³   __/          
set line6=                                                                                             \/      \/                     \/     \/     \/   ³__³          
set aninum=4
call :ani2
ping localhost -n 2 >nul
exit /b

:print_water_ani

set /a watercount+=1
echo  !water1!
echo  !water2!
echo  !water1!
echo  !water2!

REM Shift waters
if "!watercount!" == "5" (
set water2=!water1!
set water1=!water3!
set water3=!water2!
set line8= !water1:~0,19!  { /^|__^|  ^|/\__^|  ^|--- ^|^|^|__/ !water1:~0,77!!water1:~1!
set line9= !water2:~0,18!  +---------------___[}-_===_.'____ !water2:~0,17!/\ !water2!
set line10= !water1:~0,15! ____`-' ^|^|___-{]_^| _[}-  ^|     ³_[___\==--!water1:~0,11!  \/  __ !water1!
set line11=  __..._____--==/___]_^|__^|_____________________________[___\==--____,------' .7!water2!
set line12= ³                                                                  BB-1337 /!water1!
set line13=  \_________________________________________________________________________^|!water2!

set watercount=0
)
exit /b

:ani1
!f!
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
for /l %%p in (1,1,13) do echo. !line%%p:~%aninum%,78!

call :print_water_ani
echo.
set /a aninum-=1

REM ping localhost -n 1 >nul
REM pause>nul

if not "!aninum!" == "0" goto ani1
exit /b

:ani2
!f!
echo.
for /l %%p in (1,1,6) do echo. !line%%p:~%aninum%,78!

echo.
echo.
echo.
echo                                       ^|__
echo                                       ³\/
echo                                       ---                                
echo                                       / ^| [                           
echo                                ^^!      ^| ^|^|^|                             
echo                              _/^|     _/^|-++'                
echo                          +  +--^|    ^|--^|--^|_ ^|-
for /l %%p in (8,1,13) do echo !line%%p:~0,79!
call :print_water_ani
REM ping localhost -n 1 >nul
REM pause>nul

set /a aninum+=1
if not "!aninum!" == "80" goto ani2
exit /b