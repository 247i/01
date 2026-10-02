
; ------------ Uninstall Distros Macro -------------- 

!macro Uninstall_Distros  
; New Methods catch-all
 ${If} $DistroName != ""  
  ${DeleteMenuEntry} "$BDir\!\menu\$DistroPath" "#start $DistroName" "#end $DistroName" ; Remove entry from config file... I.E. linux.cfg, system.cfg, etc
  ${DeleteMenuEntry} "$BDir\EFI\BOOT\grub.cfg" "#start $DistroName" "#end $DistroName" ; Remove entry from grub config file.
  ${LineFind} "$BDir\!\Installed.txt" "$BDir\!\Installed.txt" "1:-1" "DeleteInstall" ; Remove the Installed entry
  ${LineFind} "$BDir\!\Installed.txt" "$BDir\!\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
  ${LineFind} "$BDir\!\menu\$DistroPath" "$BDir\!\menu\$DistroPath" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
  CopyFiles "$BDir\!\Installed.txt" "$BDir\!\BackupInstalled.txt" ; Make a backup of installed for safety
  RMDir /R "$BDir\!\$DistroName"  
   ${AndIf} ${FileExists} "$BDir\!\ISOS\$DistroName.iso"   
   Delete "$BDir\!\ISOS\$DistroName.iso" 
 ${EndIf}
 DetailPrint "$DistroName and its menu entry were Removed!" 
!macroend