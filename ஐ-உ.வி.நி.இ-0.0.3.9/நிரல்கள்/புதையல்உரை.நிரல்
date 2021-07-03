
; ------------ Casper Script --------------
Function CasperScript
${If} $Casper != "0"
${AndIf} $DistroName != "Windows to Go (Virtual Hard Disk)"
 Call புதைகருவிகளைப்பெறு
 
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
 Banner::show /set 76 "நிலைத்தன்மை கோப்பை உருவாக்குதல்."
 Banner::getWindow
 Pop $1  
 DetailPrint "நிலைத்தன்மை கோப்பை உருவாக்குதல்: முடிவடையும் வரை முன்னேற்றப் பட்டி நகராது. தயவுசெய்து பொருமையாயிறு..."
 Call தவமுன்னேற்றம்
 Banner::destroy
 DetailPrint "இப்போது ஒரு நிலைத்தன்மை கோப்பை உருவாக்குதல்" 
 DetailPrint "நிலைத்தன்மை கோப்பை வடிவமைத்தல்: முடிவடையும் வரை முன்னேற்றப் பட்டி நகராது. தயவுசெய்து பொருமையாயிறு..." 
 Sleep 3000 ; தரவுவரையறை.exe வெளியேற நேரம் கொடுங்கள்.
 DetailPrint "3 வினாடிகள் தூங்குகிறது..."
 nsExec::ExecToLog '"$PLUGINSDIR\mke2fs.exe" -L $CasperName $BDir\!\$JustISOName\$CasperName'
${EndIf}
FunctionEnd
