; -------- Configuration and Text File Manipulation Stuff! --------

Function InstalledList ; Creates a list of installed distros in the multiboot folder on the USB drive (So we can uninstall the distros later)
 ${IfNot} ${FileExists} "$BootDir\multiboot\$JustISOName\*.*" ; If the installation directory exists user must be reinstalling the same distro, so we won't add a removal entry. 
   Exch $R0 ;file to write to
   Exch
   Exch $1 ;text to write
   ${If} ${FileExists} "$BootDir\multiboot\Installed.txt" 
    FileOpen $R0 '$BootDir\multiboot\Installed.txt' a 
    FileSeek $R0 0 END
	FileWrite $R0 '$\r$\n$1' ; add subsequent entry on a new line
   ${Else}
    FileOpen $R0 '$BootDir\multiboot\Installed.txt' a 
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
 ${If} ${FileExists} "$BootDir\multiboot\Installed.txt" ; Are there distributions on the select drive? 
 ClearErrors
 FileOpen $0 $BootDir\multiboot\Installed.txt r
  loop:
   FileRead $0 $1
    IfErrors done
    StrCpy $DistroName $1
	${Trim} "$DistroName" "$DistroName" ; Remove spaces, newlines, and carriage return
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
