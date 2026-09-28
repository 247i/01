@echo off
Rem Installed apps in computer

setlocal enableextensions disabledelayedexpansion
call Launch.bat getTTime Office
call :%Office%
endlocal
exit

:Working
:: do daily Office work
call Launch.bat SAp "C:\Program Files\Toolwiz Time Freeze 2017\" ToolwizTimeFreeze "-autorun"
goto :eof
:Leave
:: do Non Office work
call Launch.bat SAp "C:\Program Files (x86)\Daily Kural\" Kural
goto :eof





