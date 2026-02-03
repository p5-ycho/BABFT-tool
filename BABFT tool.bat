@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
title BABFT tool by p5ycho
for /f %%a in ('echo prompt $E ^| cmd') do set "esc=%%a"
:start
cls
color 9
echo.
echo ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║  ███████████    █████████   ███████████  ███████████ ███████████     █████                      ████  ║
echo ║ ▒▒███▒▒▒▒▒███  ███▒▒▒▒▒███ ▒▒███▒▒▒▒▒███▒▒███▒▒▒▒▒▒█▒█▒▒▒███▒▒▒█    ▒▒███                      ▒▒███  ║
echo ║  ▒███    ▒███ ▒███    ▒███  ▒███    ▒███ ▒███   █ ▒ ▒   ▒███  ▒     ███████    ██████   ██████  ▒███  ║
echo ║  ▒██████████  ▒███████████  ▒██████████  ▒███████       ▒███       ▒▒▒███▒    ███▒▒███ ███▒▒███ ▒███  ║
echo ║  ▒███▒▒▒▒▒███ ▒███▒▒▒▒▒███  ▒███▒▒▒▒▒███ ▒███▒▒▒█       ▒███         ▒███    ▒███ ▒███▒███ ▒███ ▒███  ║
echo ║  ▒███    ▒███ ▒███    ▒███  ▒███    ▒███ ▒███  ▒        ▒███         ▒███ ███▒███ ▒███▒███ ▒███ ▒███  ║
echo ║  ███████████  █████   █████ ███████████  █████          █████        ▒▒█████ ▒▒██████ ▒▒██████  █████ ║
echo ║ ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒          ▒▒▒▒▒          ▒▒▒▒▒   ▒▒▒▒▒▒   ▒▒▒▒▒▒  ▒▒▒▒▒  ║
echo ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.  
echo ╔══════════════════════════╗
echo ║1 = Circle Maker          ║
echo ╠══════════════════════════╣
echo ║2 = Cone Maker            ║
echo ╠══════════════════════════╣
echo ║3 = Ball Maker            ║
echo ╠══════════════════════════╣
echo ║4 = Tutorial              ║
echo ╠══════════════════════════╝
set /p op="╚⇒ "
if "%op%"=="1" goto circle
if "%op%"=="2" goto cone
if "%op%"=="3" goto ball
if "%op%"=="4" goto tut

:ball
cls
echo ╔════════════════════════════╦═════════════════════════════╗
echo ║ TOP VIEW                   ║ FRONT VIEW                  ║
echo ║                            ║                             ║
echo ║         ██████████         ║                             ║
echo ║       ██          ██       ║                             ║
echo ║     ██              ██     ║                             ║
echo ║   ██                  ██   ║                             ║
echo ║  █                      █  ║  ←-------diameter-------→   ║
echo ║  █←-------diamete------→█  ║  :░░▒▒▓▓██████████▓▓▒▒░░:   ║
echo ║  █        (width)       █  ║          ↑height↑           ║
echo ║   ██                  ██   ║                             ║
echo ║     ██              ██     ║                             ║
echo ║       ██          ██       ║                             ║
echo ║         ██████████         ║                             ║
echo ║                            ║                             ║
echo ║                            ║                             ║
echo ╚════════════════════════════╩═════════════════════════════╝
echo.
echo ╔══════════════╦═══════════════════════════════
set /p diam="║Enter Diameter╠⇒ "
echo ╠══════════════╩═════════════════╦═════════════
set /p smooth="║Enter Smoothness (24 recomended)╠⇒ "
echo ╚════════════════════════════════╩═════════════
echo %esc%[31mcalculateing can take a few second please wait!%esc%[0m
:: Calculate the Rotation Angle (360 / Smoothness)
for /f "delims=" %%a in ('powershell -command "[math]::Round(360 / %smooth%, 2)"') do set angle=%%a

:: Calculate the Scale [Diameter * tan(pi / Smoothness)]
:: We use [Math]::PI / Smoothness because PowerShell math uses Radians
for /f "delims=" %%b in ('powershell -command "$scale = [math]::Tan([math]::PI / %smooth%) * %diam%; [math]::Round($scale, 2)"') do set scale=%%b
color 9
cls
echo ╔════════════════════════════╦═════════════════════════════╗
echo ║ TOP VIEW                   ║ FRONT VIEW                  ║
echo ║                            ║                             ║
echo ║         ██████████         ║                             ║
echo ║       ██          ██       ║                             ║
echo ║     ██              ██     ║                             ║
echo ║   ██                  ██   ║                             ║
echo ║  █                      █  ║  ←-------diameter-------→   ║
echo ║  █←-------diamete------→█  ║  :░░▒▒▓▓██████████▓▓▒▒░░:   ║
echo ║  █        (width)       █  ║          ↑height↑           ║
echo ║   ██                  ██   ║                             ║
echo ║     ██              ██     ║                             ║
echo ║       ██          ██       ║                             ║
echo ║         ██████████         ║                             ║
echo ║                            ║                             ║
echo ║                            ║                             ║
echo ╚════════════════════════════╩═════════════════════════════╝
echo.
echo ╔══════════════════════════════════════════════
echo ║RESULTS:
echo ╠═════════════════════════╦════════════════════
echo ║Your Block Scale x and Y ╠⇒ %scale%  
echo ║Your Rotation Angle      ╠⇒ %angle%
echo ╚═════════════════════════╩════════════════════
echo %esc%[90mpress a key to go back%esc%[0m
pause > nul
goto start

:circle
cls
echo ╔════════════════════════════╦═════════════════════════════╗
echo ║ TOP VIEW                   ║ FRONT VIEW                  ║
echo ║                            ║                             ║
echo ║         ██████████         ║                             ║
echo ║       ██          ██       ║                             ║
echo ║     ██              ██     ║                             ║
echo ║   ██                  ██   ║                             ║
echo ║  █                      █  ║  ←-------diameter-------→   ║
echo ║  █←-------diamete------→█  ║  :░░▒▒▓▓██████████▓▓▒▒░░:   ║
echo ║  █        (width)       █  ║          ↑height↑           ║
echo ║   ██                  ██   ║                             ║
echo ║     ██              ██     ║                             ║
echo ║       ██          ██       ║                             ║
echo ║         ██████████         ║                             ║
echo ║                            ║                             ║
echo ║                            ║                             ║
echo ╚════════════════════════════╩═════════════════════════════╝
echo.
echo ╔══════════════╦═══════════════════════════════
set /p diam="║Enter Diameter╠⇒ "
echo ╠══════════════╩═════════════════╦═════════════
set /p smooth="║Enter Smoothness (24 recomended)╠⇒ "
echo ╚════════════════════════════════╩═════════════
echo %esc%[31mcalculateing can take a few second please wait!%esc%[0m

:: Calculate the Rotation Angle (360 / Smoothness)
for /f "delims=" %%a in ('powershell -command "[math]::Round(360 / %smooth%, 2)"') do set angle=%%a

:: Calculate the Scale [Diameter * tan(pi / Smoothness)]
:: We use [Math]::PI / Smoothness because PowerShell math uses Radians
for /f "delims=" %%b in ('powershell -command "$scale = [math]::Tan([math]::PI / %smooth%) * %diam%; [math]::Round($scale, 2)"') do set scale=%%b
color 9
cls
echo ╔════════════════════════════╦═════════════════════════════╗
echo ║ TOP VIEW                   ║ FRONT VIEW                  ║
echo ║                            ║                             ║
echo ║         ██████████         ║                             ║
echo ║       ██          ██       ║                             ║
echo ║     ██              ██     ║                             ║
echo ║   ██                  ██   ║                             ║
echo ║  █                      █  ║  ←-------diameter-------→   ║
echo ║  █←-------diamete------→█  ║  :░░▒▒▓▓██████████▓▓▒▒░░:   ║
echo ║  █        (width)       █  ║          ↑height↑           ║
echo ║   ██                  ██   ║                             ║
echo ║     ██              ██     ║                             ║
echo ║       ██          ██       ║                             ║
echo ║         ██████████         ║                             ║
echo ║                            ║                             ║
echo ║                            ║                             ║
echo ╚════════════════════════════╩═════════════════════════════╝
echo.
echo ╔══════════════════════════════════════════════
echo ║RESULTS:
echo ╠═══════════════════╦══════════════════════════
echo ║Your Block Scale x ╠⇒ %scale%  
echo ║Your Rotation Angle╠⇒ %angle%
echo ╚═══════════════════╩══════════════════════════
echo %esc%[90mpress a key to go back%esc%[0m
pause > nul
goto start

:cone
cls
color 9 
echo ╔══════════════════════════╦═══════════════════════════╦═══════════════════════════╗
echo ║ SIDE VIEW                ║ TOP VIEW                  ║ FRONT VIEW                ║
echo ║              █           ║                           ║                           ║
echo ║      angle  ██           ║         ██████████        ║             █             ║
echo ║         ↳  █ █           ║       ██          ██      ║small angle █I█ small angle║
echo ║           █  █           ║     ██              ██    ║        ↳  █ I █  ↲        ║
echo ║          █   █           ║   ██                  ██  ║          █  I  █          ║
echo ║         █    █           ║  █                      █ ║         █   I   █         ║
echo ║        █     █ ←opposite ║  █←------diameter------→█ ║        █    I    █        ║
echo ║       █      █  (height) ║  █        (width)       █ ║       █     I     █       ║
echo ║      █       █           ║   ██                  ██  ║      █      I      █      ║
echo ║     █        █           ║     ██              ██    ║     █     ↱ I       █     ║
echo ║    █         █           ║       ██          ██      ║    █  angle I        █    ║
echo ║   ████████████           ║         ██████████        ║   █████████████████████   ║
echo ║   ↑Hdiameter↑            ║                           ║      ↑block scale↑        ║
echo ║     (width)              ║                           ║         (width)           ║
echo ╚══════════════════════════╩═══════════════════════════╩═══════════════════════════╝
echo.
echo ╔══════════════╦═══════════════════════════════
set /p h="║Enter Opposite╠⇒ "
echo ╠══════════════╬═══════════════════════════════
set /p diam="║Enter Diameter╠⇒ "
echo ╠══════════════╩═════════════════╦═════════════
set /p smooth="║Enter Smoothness (35 recomended)╠⇒ "
echo ╚════════════════════════════════╩═════════════
echo.
echo %esc%[31mcalculateing can take a few second please wait!%esc%[0m

set divident=%diam%
set divisor=2
for /F "usebackq delims=" %%a IN (`powershell -Command "%divident% / %divisor%"` ) DO SET rdiam=%%a


:: Use PowerShell to calculate the Arctan in degrees and ROUND to 2 decimals
for /f "delims=" %%a in ('powershell -command "[math]::Round([Math]::Atan2(%h%, %rdiam%) * (180 / [Math]::PI), 2)"') do set angle2=%%a

:: Calculate the Rotation Angle (360 / Smoothness)
for /f "delims=" %%a in ('powershell -command "[math]::Round(360 / %smooth%, 2)"') do set angle=%%a

:: Calculate the Scale [Diameter * tan(pi / Smoothness)]
:: We use [Math]::PI / Smoothness because PowerShell math uses Radians
for /f "delims=" %%b in ('powershell -command "$scale = [math]::Tan([math]::PI / %smooth%) * %diam%; [math]::Round($scale, 2)"') do set scale=%%b

:: We divide width by 2 to get the base of the right triangle
:: Calculate arctan(height / (width/2)) and ROUND to 2 decimals
for /f "delims=" %%a in ('powershell -command "$base = %scale% / 2; $val = [Math]::Atan2(%h%, $base) * (180 / [Math]::PI); [math]::Round($val, 2)"') do set angle3=%%a

cls
color 9
echo ╔══════════════════════════╦═══════════════════════════╦═══════════════════════════╗
echo ║ SIDE VIEW                ║ TOP VIEW                  ║ FRONT VIEW                ║
echo ║              █           ║                           ║                           ║
echo ║      %esc%[37;42mangle%esc%[0m%esc%[94m  ██           ║         ██████████        ║             █             ║
echo ║         %esc%[37;42m↳%esc%[0m%esc%[94m  █ █           ║       ██          ██      ║%esc%[37;45msmall angle%esc%[0m%esc%[94m █I█ %esc%[37;45msmall angle%esc%[0m%esc%[94m║
echo ║           █  █           ║     ██              ██    ║        %esc%[37;45m↳%esc%[0m%esc%[94m  █ I █  %esc%[37;45m↲%esc%[0m%esc%[94m        ║
echo ║          █   █           ║   ██                  ██  ║          █  I  █          ║
echo ║         █    █           ║  █   %esc%[37;43m(rotation angle)%esc%[0m%esc%[94m   █ ║         █   I   █         ║
echo ║        █     █ ←opposite ║  █←------diameter------→█ ║        █    I    █        ║
echo ║       █      █  (height) ║  █       (width)        █ ║       █     I     █       ║
echo ║      █       █           ║   ██                  ██  ║      █      I      █      ║
echo ║     █        █           ║     ██              ██    ║     █     ↱ I       █     ║
echo ║    █         █           ║       ██          ██      ║    █  angle I        █    ║
echo ║   ████████████           ║         ██████████        ║   █████████████████████   ║
echo ║   ↑Hdiameter↑            ║                           ║       %esc%[37;41m↑block scale↑%esc%[0m%esc%[94m       ║
echo ║     (width)              ║                           ║         (width)           ║
echo ╚══════════════════════════╩═══════════════════════════╩═══════════════════════════╝
echo.
echo ╔═══════════════════════════════════════════
echo ║RESULTS:
echo ╠═══════════════════╦═══════════════════════
echo ║%esc%[37;41mYour Block Scale x%esc%[0m%esc%[94m ╠⇒ %scale%
echo ║%esc%[0m%esc%[37;42mYour Angle%esc%[0m%esc%[94m         ╠⇒ %angle2% 
echo ║%esc%[0m%esc%[37;45mYour Small Angle%esc%[0m%esc%[94m   ╠⇒ %angle3% 
echo ║%esc%[0m%esc%[37;43mYour Rotation Angle%esc%[0m%esc%[94m╠⇒ %angle% 
echo ╠═══════════════════╩═══════════════════════
echo ║height = %h%   diameter = %diam%
echo ║Hdiameter = %rdiam%
echo ╚═══════════════════════════════════════════
echo %esc%[90mpress a key to go back%esc%[0m
pause > nul
goto start

:tut
cls
color 9
echo.
echo ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║  ███████████    █████████   ███████████  ███████████ ███████████     █████                      ████  ║
echo ║ ▒▒███▒▒▒▒▒███  ███▒▒▒▒▒███ ▒▒███▒▒▒▒▒███▒▒███▒▒▒▒▒▒█▒█▒▒▒███▒▒▒█    ▒▒███                      ▒▒███  ║
echo ║  ▒███    ▒███ ▒███    ▒███  ▒███    ▒███ ▒███   █ ▒ ▒   ▒███  ▒     ███████    ██████   ██████  ▒███  ║
echo ║  ▒██████████  ▒███████████  ▒██████████  ▒███████       ▒███       ▒▒▒███▒    ███▒▒███ ███▒▒███ ▒███  ║
echo ║  ▒███▒▒▒▒▒███ ▒███▒▒▒▒▒███  ▒███▒▒▒▒▒███ ▒███▒▒▒█       ▒███         ▒███    ▒███ ▒███▒███ ▒███ ▒███  ║
echo ║  ▒███    ▒███ ▒███    ▒███  ▒███    ▒███ ▒███  ▒        ▒███         ▒███ ███▒███ ▒███▒███ ▒███ ▒███  ║
echo ║  ███████████  █████   █████ ███████████  █████          █████        ▒▒█████ ▒▒██████ ▒▒██████  █████ ║
echo ║ ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒          ▒▒▒▒▒          ▒▒▒▒▒   ▒▒▒▒▒▒   ▒▒▒▒▒▒  ▒▒▒▒▒  ║
echo ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.  
echo ╔══════════════════════════╗
echo ║1 = Tutorial Circle       ║
echo ╠══════════════════════════╣
echo ║2 = Tutorial Cone         ║
echo ╠══════════════════════════╣
echo ║3 = Tutorial Ball         ║
echo ╠══════════════════════════╣
echo ║4 = Go Back               ║
echo ╠══════════════════════════╝
set /p op="╚⇒ "
if "%op%"=="1" goto tutcircle
if "%op%"=="2" goto tutcone
if "%op%"=="3" goto tutball
if "%op%"=="4" goto start

:tutcircle
start https://youtu.be/4bkvewtGKm0
goto tut
:tutcone
start https://www.youtube.com/watch?v=Shk-w1SD3A0
goto tut
:tutball
start https://youtu.be/4laUq0TBAns?si=z9kIYmmcA0gjg2P4
goto tut
