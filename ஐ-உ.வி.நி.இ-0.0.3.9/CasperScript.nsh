
; ------------ Casper Script --------------
/* Function CasperScript
${If} $Casper != "0"
 Call GetCaspTools
  ${If} $DistroName == "Debian Live"
  nsExec::ExecToLog '"$PLUGINSDIR\dd.exe" if=/dev/zero of=$BDir\!\$JustISOName\persistence bs=1M count=$Casper --progress'
  nsExec::ExecToLog '"$PLUGINSDIR\mke2fs.exe" -L live-rw $BDir\!\$JustISOName\persistence'	; was using -b 1024
  ${Else}
  nsExec::ExecToLog '"$PLUGINSDIR\dd.exe" if=/dev/zero of=$BDir\!\$JustISOName\writable bs=1M count=$Casper --progress'
  nsExec::ExecToLog '"$PLUGINSDIR\mke2fs.exe" -L casper-rw $BDir\!\$JustISOName\writable'	; was using -b 1024
  ${EndIf}
${EndIf}
FunctionEnd */


Function CasperScript
${If} $Casper != "0"
${AndIf} $DistroName != "Windows to Go (Virtual Hard Disk)"
 Call GetCaspTools
 
    ${If} $DistroName == "Ubuntu"
		 ${சரம்கொண்டுள்ளது} $0 "buntu-19" "$JustISO"   
		 ${சரம்கொண்டுள்ளது} $1 "buntu-18" "$JustISO"
		 ${சரம்கொண்டுள்ளது} $2 "buntu-17" "$JustISO" 
		 ${சரம்கொண்டுள்ளது} $3 "buntu-16" "$JustISO" 		
		 
		 ${If} $0 != "buntu-19" 
		 ${AndIf} $1 != "buntu-18"  
		 ${AndIf} $2 != "buntu-17"  
		 ${AndIf} $3 != "buntu-16" 	 
		  StrCpy $CasperName "writable"
         ${Else}
		  StrCpy $CasperName "casper-rw" 
		 ${EndIf}
		 
    ${ElseIf} $DistroName == "Linux Mint"
		 ${சரம்கொண்டுள்ளது} $0 "mint-19" "$JustISO"   
		 ${சரம்கொண்டுள்ளது} $1 "mint-18" "$JustISO"
		 ${சரம்கொண்டுள்ளது} $2 "mint-17" "$JustISO" 
		 ${சரம்கொண்டுள்ளது} $3 "mint-16" "$JustISO" 		
		 
		 ${If} $0 != "mint-19" 
		 ${AndIf} $1 != "mint-18"  
		 ${AndIf} $2 != "mint-17"  
		 ${AndIf} $3 != "mint-16" 	 
		  StrCpy $CasperName "writable" 
         ${Else}
		  StrCpy $CasperName "casper-rw" 
		 ${EndIf}
		 
    ${ElseIf} $DistroName == "Debian Live"
    ${OrIf} $DistroName == "Raspberry Pi Desktop"
          StrCpy $CasperName "persistence"		 
	${Else}
	StrCpy $CasperName "writable" ; default to newer persistence label
   ${EndIf}  
    ;MessageBox MB_OK "$CasperName"  
 Sleep 1000
 DetailPrint "Sleeping for 1 second..."
 ExpandEnvStrings $COMSPEC "%COMSPEC%"
 ExecShell "" '"$COMSPEC"' '/C if 1==1 "$PLUGINSDIR\dd.exe" if=/dev/zero of=$BDir\!\$JustISOName\$CasperName bs=1M count=$Casper --progress 2>$PLUGINSDIR\ddlog.txt' SW_HIDE
 Banner::show /set 76 "Creating a $CasperName file."
 Banner::getWindow
 Pop $1  
 DetailPrint "Creating a $CasperName file. Progress will not move until finished..."
 Call ddProgress
 Banner::destroy
 
 DetailPrint "Now Formatting $CasperName" 
 DetailPrint "Formatting the $CasperName file: The progress bar will not move until finished. Please be patient..." 
 
 Sleep 3000 ; Give the dd.exe time to exit.
 DetailPrint "Sleeping for 3 seconds..."
 nsExec::ExecToLog '"$PLUGINSDIR\mke2fs.exe" -L $CasperName $BDir\!\$JustISOName\$CasperName'
${EndIf}
FunctionEnd


/*   ${If} $DistroName == "Debian Live"
  StrCpy $CasperName "persistence"
  ${ElseIf} $DistroName == "Raspberry Pi Desktop"
  StrCpy $CasperName "persistence"
  ${Else}
  StrCpy $CasperName "writable"
  ${EndIf} 
  
 SetShellVarContext all
 InitPluginsDir
 ExpandEnvStrings $COMSPEC "%COMSPEC%"
 ExecShell "" '"$COMSPEC"' '/C if 1==1 "$PLUGINSDIR\dd.exe" if=/dev/zero of=$PLUGINSDIR\$CasperName bs=1M count=$Casper --progress 2>$PLUGINSDIR\ddlog.txt' SW_HIDE
 Banner::show /set 76 "Creating a Persistent File."
 Banner::getWindow
 Pop $1  
 DetailPrint "Creating a persistent file. Progress will not move until finished..."
 Call ddProgress
 Banner::destroy
 
  ${If} $DistroName == "Raspberry Pi Desktop"
   nsExec::ExecToLog '"$PLUGINSDIR\mke2fs.exe" -L Persistence $PLUGINSDIR\$CasperName'
  ${Else}
   nsExec::ExecToLog '"$PLUGINSDIR\mke2fs.exe" -L $CasperName $PLUGINSDIR\$CasperName'
  ${EndIf} 
 CopyFiles $PLUGINSDIR\$CasperName "$BDir\!\$JustISOName\$CasperName" ; Copy casper-rw to USB
 Delete "$PLUGINSDIR\$CasperName"
${EndIf}
FunctionEnd */

Function CasperSize
 IntOp $SizeOfCasper $SizeOfCasper + $Casper
FunctionEnd

Function GetCaspTools
SetShellVarContext all
InitPluginsDir
File /oname=$PLUGINSDIR\dd.exe "..\பொது-இருமங்கள்\தரவுவரையறை.exe"
File /oname=$PLUGINSDIR\mke2fs.exe "..\பொது-இருமங்கள்\நீட்2கோமுவடிவஉரு.exe"
FunctionEnd