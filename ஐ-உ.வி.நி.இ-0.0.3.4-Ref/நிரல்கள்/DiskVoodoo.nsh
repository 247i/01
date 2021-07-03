; ------------- DriveStuff -------------
!macro Write2mbrid String File
 Push "${String}"
 Push "${File}"
 Call Write2mbrid
!macroend  
!define Write2mbrid "!insertmacro Write2mbrid"

Function "MBRID" ; Let's Get the MBRID for OpenSUSE
 Call இயற்பியக்கி ; Get the Hard Disk Number from the Drive Letter
 nsexec::exectostack "wmic /NAMESPACE:\\root\CIMV2 path Win32_DiskDrive where name='\\\\.\\PHYSICALDRIVE$0' get Signature /VALUE" ; Use WMIC to get the PhysicalDrive Signature
 pop $0
 pop $1 ; Signature is stored here

 StrCpy $OnlyVal "$1" "" 16 ; = Get the Decimal Value only, remove preceeding Signature=
 IntFmt $OnlyVal "0x%08X" $OnlyVal ; Convert the value from Decimal to Hexadecimal - was 0x%X - fixed using 0x%08X for 10 character
 ${StrFilter} "$OnlyVal" "-" "" "" $OnlyVal ; Convert the Hexadecimal value to lower case
 Rename "$BootDir\multiboot\$SUSEDIR\boot\grub\mbrid" "$BootDir\multiboot\$SUSEDIR\boot\grub\old-mbrid"
 ${Write2mbrid} "$OnlyVal" $R0
FunctionEnd

; WriteToFile Function originally written by Afrow UK http://nsis.sourceforge.net/Simple_write_text_to_file, modified to populate .cfg file with what the user chose!
Function Write2mbrid
 Exch $R0 ;file to write to
 Exch
 Exch $1 ;text to write
 FileOpen $R0 '$BootDir\multiboot\$SUSEDIR\boot\grub\mbrid' a  ;FileOpen $R0 '$BootDir\multiboot\menu\$Config2Use' a 
 FileSeek $R0 0 END
 FileWrite $R0 '$1'
 FileClose $R0
 Pop $1
 Pop $R0
FunctionEnd
