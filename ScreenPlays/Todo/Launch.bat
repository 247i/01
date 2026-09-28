call :%~1 "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
goto :eof
Rem cd %cd%

:PAp
cd %~dp0
cd "..\%~1"
tasklist /FI "IMAGENAME eq %~1.exe" | find /i "%~1.exe"
IF ERRORLEVEL 1 start /min %~1.exe %~2 "%~3" "%~4" "%~5" "%~6" "%~7" "%~8"
goto :eof

:XPA
cd %~dp0
cd "..\%~2"
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set Arch=x86 || set Arch=x64
tasklist /FI "IMAGENAME eq %~2-%Arch%%~1.exe" | find /i "%~2-%Arch%%~1.exe"
IF ERRORLEVEL 1 start /min %~2-%Arch%%~1.exe %~3 "%~4" "%~5" "%~6" "%~7" "%~8"
goto :eof

:SAp
cd %~dp0
cd "%~1"
tasklist /FI "IMAGENAME eq %~2.exe" | find /i "%~2.exe"
IF ERRORLEVEL 1 start /min %~2.exe "%~3" "%~4" "%~5" "%~6" "%~7" "%~8"
goto :eof

:getTTime returnVar [TTime]
setlocal enableextensions disabledelayedexpansion
call :getTime now
if "%~2"=="" ( set "Office=Working" ) else ( set "Office=%~2" )
if "%now%" lss "09:00:00,00" ( set "Office=Leave" )
if "%now%" geq "18:00:00,00" ( set "Office=Leave" )
if "%DOW%" == "Sun" ( set "Office=Leave" )
if "%DOW%" == "Sat" ( set "Office=Leave" )
endlocal & if not "%~1"=="" set "%~1=%Office%" & exit /b

:: getTime
::    This routine returns the current (or passed as argument) time
::    in the form hh:mm:ss,cc in 24h format, with two digits in each
::    of the segments, 0 prefixed where needed.
:getTime returnVar [time]
set DOW=%DATE:~0,3% 
set year=%date:~10,4%
set month=%date:~4,2%
set day=%date:~7,2%
setlocal enableextensions disabledelayedexpansion
    :: Retrieve parameters if present. Else take current time
    if "%~2"=="" ( set "t=%time%" ) else ( set "t=%~2" )
    :: Test if time contains "correct" (usual) data. Else try something else
    echo(%t%|findstr /i /r /x /c:"[0-9:,.apm -]*" >nul || ( 
        set "t="
        for /f "tokens=2" %%a in ('2^>nul robocopy "|" . /njh') do (
            if not defined t set "t=%%a,00"
        )
        rem If we do not have a valid time string, leave
        if not defined t exit /b
    )
    :: Check if 24h time adjust is needed
    if not "%t:pm=%"=="%t%" (set "p=12" ) else (set "p=0")
    :: Separate the elements of the time string
    for /f "tokens=1-5 delims=:.,-PpAaMm " %%a in ("%t%") do (
        set "h=%%a" & set "m=00%%b" & set "s=00%%c" & set "c=00%%d" 
    )
:: Adjust the hour part of the time string
set /a "h=100%h%+%p%"
:: Clean up and return the new time string
endlocal & if not "%~1"=="" set "%~1=%h:~-2%:%m:~-2%:%s:~-2%,%c:~-2%" & exit /b

Rem :myDosFunc    - here starts the function with label name same as batch file name.
Rem cd %cd% -- Makes the current directory from which the batchfile is executed as working directory
Rem cd %~dp0 -- Makes the current directory of the batch file as working directory
Rem %~1 %~2 etc to access the parameters or arguments to the call
Rem find the application in the tasklist and if it is not fount launch the application. 
Rem goto:eof end of the function 
Rem Registry query to get the know that system architecture