@echo off
cd %~dp0
call Launch.bat getTTime Office 
echo %office%
call :%Office%
exit

:Working
:: do daily Office work
goto :eof
:Leave
:: do Non Office work
call Launch.bat PAp "FirefoxPortable"
call Launch.bat PAp sPortable
call Launch.bat PAp ThunderbirdPortable
goto :eof