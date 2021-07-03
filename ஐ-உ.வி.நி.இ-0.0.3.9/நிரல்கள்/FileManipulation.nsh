
; -------- Configuration and Text File Manipulation Stuff! --------

Function WriteToFile ; <- WriteToFile Function originally written by Afrow UK http://nsis.sourceforge.net/Simple_write_text_to_file, and modified to populate *.cfg file with the distro user installed!
 Exch $R0 ;file to write to
 Exch
 Exch $1 ;text to write
 FileOpen $R0 '$BDir\!\menu\$DistroPath' a 
 FileSeek $R0 0 END
 FileWrite $R0 '$\r$\n$1' ; was $\r$\n$1$\r$\n
 FileClose $R0
 Pop $1
 Pop $R0
FunctionEnd

!macro WriteToFile String File
 Push "${String}"
 Push "${File}"
 Call WriteToFile
 ${LineFind} "$BDir\!\menu\$DistroPath" "$BDir\!\menu\$DistroPath" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
!macroend  
!define WriteToFile "!insertmacro WriteToFile"

Function WriteToSysFile ; Write entry to syslinux.cfg
 Exch $R0 ;file to write to
 Exch
 Exch $1 ;text to write
 FileOpen $R0 '$BDir\EFI\BOOT\grub.cfg' a 
 FileSeek $R0 0 END
 FileWrite $R0 '$\r$\n$1$\r$\n'
 FileClose $R0
 Pop $1
 Pop $R0
FunctionEnd
!macro WriteToSysFile String File
  Push "${String}"
  Push "${File}"
  Call WriteToSysFile
!macroend  
!define WriteToSysFile "!insertmacro WriteToSysFile"

Function InstalledList ; Creates a list of installed distros in the ! folder on the USB drive (So we can uninstall the distros later)
 ${IfNot} ${FileExists} "$BDir\!\$JustISOName\*.*" ; If the installation directory exists user must be reinstalling the same distro, so we won't add a removal entry. 
   Exch $R0 ;file to write to
   Exch
   Exch $1 ;text to write
   ${If} ${FileExists} "$BDir\!\Installed.txt" 
    FileOpen $R0 '$BDir\!\Installed.txt' a 
    FileSeek $R0 0 END
	FileWrite $R0 '$\r$\n$1' ; add subsequent entry on a new line
   ${Else}
    FileOpen $R0 '$BDir\!\Installed.txt' a 
    FileSeek $R0 0 END
    FileWrite $R0 '$1'  ; add first entry without a new line
   ${EndIf}
    FileClose $R0
    Pop $1
    Pop $R0
 ${EndIf}
FunctionEnd
!macro InstalledList String File
  Push "${String}"
  Push "${File}"
  Call InstalledList
!macroend  
!define InstalledList "!insertmacro InstalledList"

Function RemovalList ; Lists the distros installed on the select drive.
 ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution from the list to remove from $DestDisk"  
 ${If} ${FileExists} "$BDir\!\Installed.txt" ; Are there distributions on the select drive? 
 ClearErrors
 FileOpen $0 $BDir\!\Installed.txt r
  loop:
   FileRead $0 $1
    IfErrors done
    StrCpy $DistroName $1
	${ஒழுங்கமை} "$DistroName" "$DistroName" ; Remove spaces, newlines, and carriage return
    ${NSD_CB_AddString} $Distro "$DistroName" ; Add DistroName to the listbox of removable distros ; was ${NSD_LB_AddString} $Distro "$DistroName" ; Enable for DropBox
   Goto loop
  done:  
 FileClose $0
 ${Else}
     ;Call SetISOFileName
 ${EndIf}
FunctionEnd

!include "TextFunc.nsh" ; TextFunc.nsh required for the following DeleteInstall function
Function DeleteInstall  ; Deletes Select Entry from Installed.txt          
	StrLen $0 "$DistroName"
	StrCpy $1 "$R9" $0
	StrCmp $1 "$DistroName" 0 End
	StrCpy $R9 ""
	End:
	Push $0
FunctionEnd

Function DeleteEmptyLine ; Deletes empty lines    
	StrLen $0 "$\r$\n"
	StrCpy $1 "$R9" $0
	StrCmp $1 "$\r$\n" 0 End
	StrCpy $R9 ""
	End:
	Push $0
FunctionEnd

!define StrRep "!insertmacro StrRep"
 
!macro StrRep ResultVar String SubString RepString
  Push "${String}"
  Push "${SubString}"
  Push "${RepString}"
  Call StrRep
  Pop "${ResultVar}"
!macroend
 
Function StrRep ;http://nsis.sourceforge.net/mediawiki/index.php?title=StrRep&direction=next&oldid=4565
/*After this point:
  ------------------------------------------
  $R0 = RepString (input)
  $R1 = SubString (input)
  $R2 = String (input)
  $R3 = RepStrLen (temp)
  $R4 = SubStrLen (temp)
  $R5 = StrLen (temp)
  $R6 = StartCharPos (temp)
  $R7 = TempStrL (temp)
  $R8 = TempStrR (temp)*/
 
  ;Get input from user
  Exch $R0
  Exch
  Exch $R1
  Exch
  Exch 2
  Exch $R2
  Push $R3
  Push $R4
  Push $R5
  Push $R6
  Push $R7
  Push $R8
 
  ;Return "String" if "SubString" is ""
  ${IfThen} $R1 == "" ${|} Goto Done ${|}
 
  ;Get "RepString", "String" and "SubString" length
  StrLen $R3 $R0
  StrLen $R4 $R1
  StrLen $R5 $R2
  ;Start "StartCharPos" counter
  StrCpy $R6 0
 
  ;Loop until "SubString" is found or "String" reaches its end
  ${Do}
    ;Remove everything before and after the searched part ("TempStrL")
    StrCpy $R7 $R2 $R4 $R6
 
    ;Compare "TempStrL" with "SubString"
    ${If} $R7 == $R1
      ;Split "String" to replace the string wanted
      StrCpy $R7 $R2 $R6 ;TempStrL
 
      ;Calc: "StartCharPos" + "SubStrLen" = EndCharPos
      IntOp $R8 $R6 + $R4
 
      StrCpy $R8 $R2 "" $R8 ;TempStrR
 
      ;Insert the new string between the two separated parts of "String"
      StrCpy $R2 $R7$R0$R8
      ;Now calculate the new "StrLen" and "StartCharPos"
      StrLen $R5 $R2
      IntOp $R6 $R6 + $R3
      ${Continue}
    ${EndIf}
 
    ;If not "SubString", this could be "String" end
    ${IfThen} $R6 >= $R5 ${|} ${ExitDo} ${|}
    ;If not, continue the loop
    IntOp $R6 $R6 + 1
  ${Loop}
 
  Done:
 
  ;Return output to user
  StrCpy $R0 $R2
 
/*After this point:
  ------------------------------------------
  $R0 = ResultVar (output)*/
 
  Pop $R8
  Pop $R7
  Pop $R6
  Pop $R5
  Pop $R4
  Pop $R3
  Pop $R2
  Pop $R1
  Exch $R0
FunctionEnd

