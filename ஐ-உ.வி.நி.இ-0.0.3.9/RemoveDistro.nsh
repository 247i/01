
; ------------ Uninstall Distros Macro -------------- 

!macro Uninstall_Distros  
; New Methods catch-all
 ${If} $DistroName != ""  
  ${DeleteMenuEntry} "$BDir\multiboot\menu\$DistroPath" "#start $DistroName" "#end $DistroName" ; Remove entry from config file... I.E. linux.cfg, system.cfg, etc
  ${DeleteMenuEntry} "$BDir\EFI\BOOT\grub.cfg" "#start $DistroName" "#end $DistroName" ; Remove entry from grub config file.
  ${LineFind} "$BDir\multiboot\Installed.txt" "$BDir\multiboot\Installed.txt" "1:-1" "DeleteInstall" ; Remove the Installed entry
  ${LineFind} "$BDir\multiboot\Installed.txt" "$BDir\multiboot\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
  ${LineFind} "$BDir\multiboot\menu\$DistroPath" "$BDir\multiboot\menu\$DistroPath" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
  CopyFiles "$BDir\multiboot\Installed.txt" "$BDir\multiboot\BackupInstalled.txt" ; Make a backup of installed for safety
  RMDir /R "$BDir\multiboot\$DistroName"  
   ${AndIf} ${FileExists} "$BDir\multiboot\ISOS\$DistroName.iso"   
   Delete "$BDir\multiboot\ISOS\$DistroName.iso" 
 ${EndIf}
 DetailPrint "$DistroName and its menu entry were Removed!" 
!macroend