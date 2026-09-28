@ECHO OFF
SETLOCAL EnableExtensions DisableDelayedExpansion

if "%~1"=="" goto :eof
if not exist "%~1"  goto :eof

set "_auxiliaryScript=%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
set "_lnkFile=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\%~n1.lnk"

> "%_auxiliaryScript%" (
  echo Set oLnk = WScript.CreateObject^("WScript.Shell"^).CreateShortcut^("%_lnkFile%"^)
  echo oLnk.TargetPath = "%~1"
  echo oLnk.Save
)
cscript //nologo "%_auxiliaryScript%"
del "%_auxiliaryScript%"