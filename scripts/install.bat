@echo off
echo Installing DiscLovestory
echo.
echo.
echo.
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit)
rd /q /s "%programfiles%\DiscLovestory"
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /f
cls
echo Installing DiscLovestory
mkdir "%programfiles%\DiscLovestory"
xcopy "%~dp0..\scripts" "%programfiles%\DiscLovestory" /s
echo.
echo.
xcopy "%~dp0\disclovestory\scripts\sys\shortcuts\formatandcopy - en_us.bat - Snarvei" "%USERPROFILE%\Desktop\"
xcopy "%~dp0\disclovestory\scripts\sys\shortcuts\" "%USERPROFILE%\Desktop\"
echo.
echo.

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v DisplayName /t REG_SZ /d DiscLovestory /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v InstallLocation /t REG_SZ /d "%programfiles%\DiscLovestory"
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v UninstallString /t REG_SZ /d "%programfiles%\DiscLovestory\uninstall.bat"
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v Publisher /t REG_SZ /d "Glenn Mesel"
choice /m "Do you wanna make a shortcut at the desktop (not working yet)?"
if %ERRORLEVEL%==1 goto g
if %ERRORLEVEL%==2 goto g
REM ^need change when update is done^
:b
REM mklink "%programfiles%/DiscLovestory/formatandcopy – en_us.bat" "%USERPROFILE%/Desktop/formatandcopy – en_us"
REM mklink "%programfiles%/DiscLovestory/formatandcopy – no_nb.bat" "%USERPROFILE%/Desktop/formatandcopy – no_nb"

REM This is for a later version:

:g
choice /m "Do you wanna read the update log?"
if %ERRORLEVEL%==1 goto c
if %ERRORLEVEL%==2 goto d
:c
type "%programfiles%\DiscLovestory\sys\updates\git_commit.log"
pause
:d
cls
echo Support this project with sharing as "sharing is caring", feel free to come with suggestions, really, i will think about it and come with ideas.
echo.
echo. Made by Glenn Mesel, Oppland County Council. Have a nice day, and i hope you enjoy this software/script.
timeout /t 40
