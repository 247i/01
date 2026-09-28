@echo off
Rem Installed apps in computer
setlocal enableextensions disabledelayedexpansion
call Launch.bat getTTime Office
call :%Office%
endlocal
exit

:Working
:: do daily Office work
call Launch.bat SAp "C:\Program Files (x86)\Cisco Systems\Cisco IP Communicator\" "communicatork9"
call Launch.bat SAp "C:\Program Files (x86)\Microsoft Office\root\Office16" OUTLOOK 
call Launch.bat SAp "C:\Program Files (x86)\Microsoft Office\root\Office16" lync "/fromrunkey"
call Launch.bat SAp "C:\Users\INThiruA\AppData\Local\Microsoft\OneDrive\" OneDrive "/background"
call Launch.bat SAp "C:\Program Files (x86)\Common Files\Pulse Secure\JamUI" Pulse "-tray"
call Launch.bat SAp "C:\Users\INThiruA\AppData\Local\Microsoft\Teams\" Update --processStart "Teams.exe" --process-start-args "--system-initiated"
call Launch.bat SAp "C:\Program Files\Perforce\" p4v
goto :eof
:Leave
:: do Non Office work
call Launch.bat SAp "C:\Program Files (x86)\AirDroid\" AirDroid
call Launch.bat SAp "C:\Program Files (x86)\Dropbox\Client\" "Dropbox"
call Launch.bat SAp "C:\Program Files\Google\Drive" "googledrivesync"
call Launch.bat SAp "C:\ProgramData\MEGAsync\" MEGAsync
call Launch.bat SAp "C:\Program Files\Microvirt\MEmu\" Memu MEmu
goto :eof