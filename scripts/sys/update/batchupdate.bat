cd %programfiles%\DiscLovestory\sys\update\
rename version.log oldversion.log
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& $env:programfiles\DiscLovestory\sys\update\foresteps.ps1
cd %programfiles%\DiscLovestory\sys\update\
count.exe git_commit.log parents>version.log
fc oldversion.log version.log
if %ERRORLEVEL% == 0 goto a
if %ERRORLEVEL% == 1 goto b
:a
echo updating
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& $env:programfiles\DiscLovestory\sys\update\update_list.
%temp%\Disclovestory\unzip\disclovestory-master\scripts\install.bat
pause


:b
echo no need for update, see ya later!
timeout /t 5
pause
