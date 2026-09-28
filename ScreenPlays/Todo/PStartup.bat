@echo off
cd %~dp0
setlocal enableextensions disabledelayedexpansion
call Launch.bat getTTime Office
call :%Office%
endlocal
exit

:Working
:: do daily Office work
call Launch.bat PAp "ArthaPortable"
call Launch.bat PAp "WorkravePortable"
call Launch.bat PAp "ZoomItPortable"
goto :eof
:Leave
:: do Non Office work
call Launch.bat PAp "AIMPPortable"
call Launch.bat PAp "AzhagiPlus"
call Launch.bat PAp "DittoPortable"
call Launch.bat XPA "" "Everything" "-startup"
call Launch.bat XPA "Signed" "StrokesPlus" ""
call Launch.bat PAp "TyperTaskPortable"
goto :eof
