@echo off
echo Installing DiscLovestory
echo.
echo.
echo.
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit)
rd /q /s "%programfiles%\DiscLovestory"
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /f
cls
echo Making programfiles directory for DiscLovestory
mkdir "%programfiles%\DiscLovestory"
xcopy "%~dp0..\scripts" "%programfiles%\DiscLovestory" /s
echo.
echo.

echo Downloading git_commit.log file to check versions and so you have something to read!
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& $env:programfiles\DiscLovestory\sys\update\update_list.ps1

echo.
echo.
echo Editing Regedit
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v DisplayName /t REG_SZ /d DiscLovestory /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v InstallLocation /t REG_SZ /d "%programfiles%\DiscLovestory"
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v UninstallString /t REG_SZ /d "%programfiles%\DiscLovestory\uninstall.bat"
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DiscLovestory /v Publisher /t REG_SZ /d "Glenn Mesel"
cls
echo.
echo.
echo.
choice /m "Do you wanna make a shortcut at the desktop?"
if %ERRORLEVEL%==1 goto b
if %ERRORLEVEL%==2 goto g
:b
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& $env:programfiles\DiscLovestory\sys\update\shortcut_remover.ps1
pause
call "%programfiles%\DiscLovestory\sys\update\shortcut_en.bat"
call "%programfiles%\DiscLovestory\sys\update\shortcut_no.bat"
pause
goto g
:g
cls
echo.
echo.
echo.
echo Do you wanna read the update log?
choice /m  "(PS: this is messy as it is the commit log from github, its better to open with notepad++)?"
if %ERRORLEVEL%==1 goto c
if %ERRORLEVEL%==2 goto d
:c
start notepad "%programfiles%\DiscLovestory\sys\update\git_commit.log"
:d
cls
echo Support this project with sharing as "sharing is caring", feel free to come with suggestions, really, i will think about it and come with ideas.
echo.
echo. Made by Glenn Mesel, Oppland County Council. Have a nice day, and i hope you enjoy this software/script.
timeout /t 40
