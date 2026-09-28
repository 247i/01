Rem :myDosFunc    - here starts the function with label name same as batch file name.
:LaunchPA
Rem cd %cd% -- Makes the current directory from which the batchfile is executed as working directory
cd %~dp0
Rem cd %~dp0 -- Makes the current directory of the batch file as working directory
cd "..\%~1"
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set Arch=x86 || set Arch=x64
rem echo %Arch%
tasklist /FI "IMAGENAME eq %~1.exe" | find /i "%~1.exe"
Rem find the application in the tasklist 
IF ERRORLEVEL 1 start %~1.exe
Rem if not fount launch the application. 
Rem echo.  here the myDosFunc function is executing a group of commands
Rem echo.  it could do a lot of things
Rem echo. Got Param#1 %~1
Rem echo. Got Param#2 %~2
Rem goto:eof
goto:eof