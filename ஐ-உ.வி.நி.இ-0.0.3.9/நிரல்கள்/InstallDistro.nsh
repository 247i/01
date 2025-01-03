﻿; ------------ Install Distros Macro -------------- 
Function FindConfig ; Set config path and file
  ${If} ${FileExists} "$BDir\!\$JustISOName\liberte\boot\syslinux\syslinux.cfg" ; Liberte
  StrCpy $ConfigPath "liberte/boot/syslinux"
  StrCpy $CopyPath "liberte\boot\syslinux"
  StrCpy $ConfigFile "syslinux.cfg"    
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\i386\loader\isolinux.cfg" ; OpenSuse based 32bit
  StrCpy $ConfigPath "boot/i386/loader"
  StrCpy $CopyPath "boot\i386\loader"
  StrCpy $ConfigFile "isolinux.cfg" 
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\x86_64\loader\isolinux.cfg" ; OpenSuse based 64bit
  StrCpy $ConfigPath "boot/x86_64/loader"
  StrCpy $CopyPath "boot\x86_64\loader"
  StrCpy $ConfigFile "isolinux.cfg"   
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\syslinux\syslinux.cfg"    
  StrCpy $ConfigPath "syslinux"
  StrCpy $CopyPath "syslinux"
  StrCpy $ConfigFile "syslinux.cfg"  
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\isolinux\isolinux.cfg" 
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "isolinux.cfg" 
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\isolinux\syslinux.cfg"  ; AVG
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "syslinux.cfg"   
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\isolinux\txt.cfg"  ; Probably Ubuntu based
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "txt.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\isolinux\text.cfg"   ; Probably Ubuntu based
  StrCpy $ConfigPath "isolinux"
  StrCpy $CopyPath "isolinux"
  StrCpy $ConfigFile "text.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\syslinux\txt.cfg"   
  StrCpy $ConfigPath "syslinux"
  StrCpy $CopyPath "syslinux"
  StrCpy $ConfigFile "txt.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\syslinux\text.cfg"   
  StrCpy $ConfigPath "syslinux"
  StrCpy $CopyPath "syslinux"
  StrCpy $ConfigFile "text.cfg"  
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\system\isolinux\isolinux.cfg"  ; AOSS
  StrCpy $ConfigPath "system/isolinux"
  StrCpy $CopyPath "system\isolinux"
  StrCpy $ConfigFile "isolinux.cfg"    
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\isolinux.cfg"  ; Probably Puppy based 
  StrCpy $ConfigPath ""
  StrCpy $CopyPath ""
  StrCpy $ConfigFile "isolinux.cfg"  
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\syslinux.cfg" 
  StrCpy $ConfigPath ""
  StrCpy $CopyPath ""
  StrCpy $ConfigFile "syslinux.cfg"    
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\slax\boot\syslinux.cfg"  ; Slax based 
  StrCpy $ConfigPath "slax/boot"
  StrCpy $CopyPath "slax\boot"
  StrCpy $ConfigFile "syslinux.cfg"    

  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\syslinux\syslinux.cfg"     
  StrCpy $ConfigPath "boot/syslinux"
  StrCpy $CopyPath "boot\syslinux"
  StrCpy $ConfigFile "syslinux.cfg"   
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\isolinux\isolinux.cfg"
  StrCpy $ConfigPath "boot/isolinux"
  StrCpy $CopyPath "boot\isolinux"
  StrCpy $ConfigFile "isolinux.cfg" 
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\isolinux\syslinux.cfg"     
  StrCpy $ConfigPath "boot/isolinux"
  StrCpy $CopyPath "boot\isolinux"
  StrCpy $ConfigFile "syslinux.cfg"    
  ${Else} 
   StrCpy $ConfigFile "NULL"
  ${EndIf}   
  ;MessageBox MB_OK "$ConfigPath/$ConfigFile"   
FunctionEnd

!insertmacro Locate

Function FindGrubConfig ; Set Grub config path and file
  ${If} ${FileExists} "$BDir\!\$JustISOName\liberte\boot\grub\grub.cfg" ; Liberte
  StrCpy $GrubConfigPath "liberte/boot/grub"
  StrCpy $GrubCopyPath "liberte\boot\grub"
  StrCpy $GrubConfigFile "grub.cfg"   
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\efi\boot\grub.cfg" ; Fedora...
  StrCpy $GrubConfigPath "efi/boot"
  StrCpy $GrubCopyPath "efi\boot"
  StrCpy $GrubConfigFile "grub.cfg"     
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\grub\grub.cfg" ; Ubuntu...
  StrCpy $GrubConfigPath "boot/grub"
  StrCpy $GrubCopyPath "boot\grub"
  StrCpy $GrubConfigFile "grub.cfg"   
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\grub\grub*.cfg" ; System Rescue CD...
  ${Locate} "$BDir\!\$JustISOName\boot\grub" "/L=F /M=*.cfg" "FoundGrubFile" ; Could eventually replace this whole section using locate.
  StrCpy $GrubConfigPath "boot/grub"
  StrCpy $GrubCopyPath "boot\grub"
  StrCpy $GrubConfigFile "grubsys.cfg"   
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\grub\loopback.cfg" ; Ubuntu...
  StrCpy $GrubConfigPath "boot/grub"
  StrCpy $GrubCopyPath "boot\grub"
  StrCpy $GrubConfigFile "loopback.cfg"     
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\efi\boot\grub\grub.cfg" ; TinyCore, newer Tails
  StrCpy $GrubConfigPath "efi/boot/grub"
  StrCpy $GrubCopyPath "efi\boot\grub"
  StrCpy $GrubConfigFile "grub.cfg"   
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\grub\sparky.cfg" ; Sparky...
  StrCpy $GrubConfigPath "boot/grub"
  StrCpy $GrubCopyPath "boot\grub"
  StrCpy $GrubConfigFile "sparky.cfg" 
 #${ElseIf} ${FileExists} "$BDir\!\$JustISOName\grub.cfg" ; Slacko...
 # StrCpy $GrubConfigPath ""
 # StrCpy $GrubCopyPath ""
 # StrCpy $GrubConfigFile "grub.cfg" 
  ${Else} 
  StrCpy $GrubConfigFile "NULL"  
  ${EndIf}   
  ;MessageBox MB_OK "$GrubConfigPath/$GrubConfigFile"   
FunctionEnd

Function FoundGrubFile
  CopyFiles "$R9" "$BDir\!\$JustISOName\boot\grub\grubsys.cfg"
  StrCpy $0 StopLocate
  Push $0
FunctionEnd

Function WriteStuff
 ; Now done before this function is called (see line 122) CreateDirectory "$BDir\!\$JustISOName\ஐ\" ; Create the ஐ Directory.. so we can copy the following config file to it.
 CopyFiles "$PLUGINSDIR\$DistroPath" "$BDir\!\$JustISOName\I\$DistroPath" ; Copy the $DistroPath file to $JustISOName\ஐ folder for the distro (so we know where to remove entry) 
 DetailPrint "$DistroName ($JustISOName) and its menu entry were added!"
 	
FunctionEnd

!macro Install_Distros 

; Initiate Plugins Directory for potential use
  SetShellVarContext all
  InitPluginsDir

; If distro is already installed, delete the entry, so we don't make a mess.
 ${If} ${FileExists} "$BDir\!\$JustISOName\*.*"
 ${DeleteMenuEntry} "$BDir\!\menu\$DistroPath" "#start $DistroName" "#end $DistroName" ; Remove entry from config file... I.E. linux.cfg, system.cfg, etc
 ${EndIf}
 
; Write $JustISOName to Installed.txt 
 ${InstalledList} "$JustISOName" $R0 ; Write the ISO name to the Installed List "Installed.txt" file (so we can keep track of installs for removal)
 ${LineFind} "$BDir\!\Installed.txt" "$BDir\!\Installed.txt" "1:-1" "DeleteEmptyLine" ; Remove any left over empty lines
 CopyFiles "$BDir\!\Installed.txt" "$BDir\!\BackupInstalled.txt" ; Make a backup of installed for safety
 
; Create the Directory for this ISOs files
 CreateDirectory "$BDir\!\$JustISOName\I\" ; Create the ஐ Directory.. so we can eventually copy the config file (see line 90) to it.

; Kaspersky Rescue Disk - Gentoo
 ${If} $DistroName == "Kaspersky Rescue Disk (Antivirus Scanner)" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y'   
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nif cpuid -l; then set krn=$\"k-x86_64$\"; else set krn=$\"k-x86$\"; fi$\r$\nsearch -s root -f /!/$JustISOName/boot/grub/$${krn}$\r$\nlinux /!/$JustISOName/boot/grub/$${krn} net.ifnames=0 lang=en dostartx subdir=/!/$JustISOName/data$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd /!/$JustISOName/boot/grub/initrd.xz$\r$\n}$\r$\n#end $JustISOName" $R0  

 ; Acronis True Image 
 ${ElseIf} $DistroName == "Acronis True Image"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to ISO Directory
 ;ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -ir!*.dat -o"$BDir\!\$JustISOName\" -y' 
  ;${If} ${FileExists} "$BDir\!\$JustISOName\ramdisk_merged64.dat" 
  ;Rename "$BDir\!\$JustISOName\ramdisk_merged64.dat" "$BDir\!\$JustISOName\ramdisk64.dat"  
  ;${EndIf}
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset isofile=$\"/!/$JustISOName/$JustISO$\"$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/dat10.dat quiet force_modules=usbhid quiet$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/dat11.dat (loop)/dat12.dat$\r$\n}$\r$\n#end $JustISOName" $R0 
 ;;ALT BIOS? ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset isofile=$\"/!/$JustISOName/$JustISO$\"$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/dat6.dat quiet force_modules=usbhid quiet$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/dat7.dat (loop)/dat8.dat$\r$\n}$\r$\n#end $JustISOName" $R0 

; Calculate Linux Desktop
 ${ElseIf} $DistroName == "Calculate Linux Desktop"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" 
 ;ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -ir!*nitrd -ir!*mlinuz -o"$BDir\!\$JustISOName\" -y'    
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile=$\"/!/$JustISOName/$JustISO$\"$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/boot/vmlinuz root=live:LABEL=TA init=/linuxrc rd.live.squashimg=livecd.squashfs looptype=squashfs nodevfs iso-scan/filename=/!/$JustISOName/$JustISO findiso=$$isofile isoboot=$$isofile$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/initrd$\r$\n}$\r$\n#end $JustISOName" $R0 
 
; CentOS
 ${ElseIf} $DistroName == "CentOS Minimal"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile='/!/$JustISOName/$JustISO'$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/isolinux/vmlinuz noeject inst.stage2=hd:LABEL=TA:/$$isofile$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/isolinux/initrd.img$\r$\n}$\r$\n#end $JustISOName" $R0 
 
; Linux Kid X
 ${ElseIf} $DistroName == "Linux Kid X" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile='/!/$JustISOName/$JustISO'$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/boot/vmlinuz from=$$isofile$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/initrd.gz$\r$\n}$\r$\n#end $JustISOName" $R0 
 
; KNOPPIX - Wont work on Fat32- filesize too big, revisit after fat32/ntfs partition functional
 ;${ElseIf} $DistroName == "KNOPPIX" 
 ;CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO"
 ;${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile='/!/$JustISOName/$JustISO'$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/boot/isolinux/linux  ;bootfrom=$$isofile acpi=off keyboard=us language-us$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/isolinux/minirt.gz$\r$\n}$\r$\n#end $JustISOName" $R0 
 
; Bitdefender Rescue CD
 ${ElseIf} $DistroName == "Bitdefender Rescue CD"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isopath=$\"/!/$JustISOName/$JustISO$\"$\r$\nloopback loop $$isopath$\r$\nset root=(loop)$\r$\nlinux (loop)/boot/kernel.x86_64-efi root=/dev/ram0 real_root=/dev/loop0 looptype=squashfs cdroot loop=/rescue/livecd.squashfs cdroot_marker=/rescue/livecd.squashfs initrd udev cdroot scandelay=5 lang=en isoboot=$$isopath$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/initfs.x86_64-efi$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; Dr.Web Live CD
 ${ElseIf} $DistroName == "Dr.Web LiveDisk"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y'  
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nlinux /!/$JustISOName/casper/vmlinuz boot=casper cdrom-detect/try-usb=true noprompt live-media-path=/!/$JustISOName/casper union=aufs console=tty1 ignore_uuid$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd /!/$JustISOName/casper/initrd.lz$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; Antix (New Method) 
 ${ElseIf} $DistroName == "AntiX" 
  ${OrIf} $DistroName == "MX Linux" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/$JustISO$\r$\nlinux (loop)/antiX/vmlinuz load=all bootlabel=TA fromiso=/!/$JustISOName/$JustISO nomodeset nouveau.modeset=0$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/antiX/initrd.gz$\r$\n}$\r$\n#end $JustISOName" $R0  

; AOSS (New Method) 
 ${ElseIf} $DistroName == "AOSS (Malware Scanner)" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/$JustISO$\r$\nlinux (loop)/system/stage1 root=/dev/ram0 rw rdinit=/linuxrc video=vesa:ywrap,mtrr vga=0x303 loglevel=0 boot=cdrom fromiso=/!/$JustISOName/$JustISO$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/system/stage2$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; DBAN (New Method) 
 ${ElseIf} $DistroName == "DBAN (Hard Drive Nuker)" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/$JustISO$\r$\nlinux (loop)/dban.bzi nuke=$\"dwipe$\" fromiso=/!/$JustISOName/$JustISO$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; Fedora (New Method) 
 ${ElseIf} $DistroName == "Fedora" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 
 FindFirst $0 $1 "$BDir\!\$JustISOName\isolinux\initrd*"
 Call ஆரம்பசீவ_கண்டுபிடி
 FindFirst $0 $1 "$BDir\!\$JustISOName\isolinux\vmlinuz*"
 Call லினக்சுஉட்கரு_கண்டுபிடி
 ;${StrRep} '$ISONameDotLess' '$JustISOName' '-x86_64-' '-'
 ${StrRep} '$ISONameDotLess' '$JustISOName' '.' '-'
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/$JustISO$\r$\nlinux (loop)/isolinux/$Vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO rootfstype=auto root=live:CDLABEL=$ISONameDotLess ro rd.live.image$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/isolinux/$Initrd$\r$\n}$\r$\n#end $JustISOName" $R0  
 !insertmacro கோப்பில்மாற்று "CDLABEL=Fedora-Live-Workstation" "CDLABEL=Fedora-Live-WS" "all" "all" "$BDir\!\menu\linux.cfg"   
 !insertmacro கோப்பில்மாற்று "CDLABEL=Fedora-Workstation-Live" "CDLABEL=Fedora-WS-Live" "all" "all" "$BDir\!\menu\linux.cfg" 
 !insertmacro கோப்பில்மாற்று "CDLABEL=Fedora-WS-Live-x86_64" "CDLABEL=Fedora-WS-Live" "all" "all" "$BDir\!\menu\linux.cfg" 
 
; Linpus Lite (New Method) 
 ${ElseIf} $DistroName == "Linpus Lite" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/$JustISO$\r$\nlinux (loop)/isolinux/vmlinuz0 iso-scan/filename=/!/$JustISOName/$JustISO rootfstype=auto root=live:LABEL=$JustISOName ro rd.live.image$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/isolinux/initrd0.img$\r$\n}$\r$\n#end $JustISOName" $R0  

; GRML 
 ${ElseIf} $DistroName == "GRML (system rescue)" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y' 
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${If} ${FileExists} "$BDir\!\$JustISOName\boot\grml64full\vmlinuz"
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/grml64full/vmlinuz boot=live live-media-path=/!/$JustISOName/live/grml64-full/ verbose noeject noprompt" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\grml64full\initrd.img"
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/grml64full/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}

; Liberte
 ${ElseIf} $DistroName == "Liberte (Anonymous Browsing)" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y' 
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${If} ${FileExists} "$BDir\!\$JustISOName\liberte\boot\kernel-x86.zi"
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/liberte/boot/kernel-x86.zi loop=/!/$JustISOName/liberte/boot/root-x86.sfs" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\liberte\boot\initrd-x86.xz"
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/liberte/boot/initrd-x86.xz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}
  
; Linux Mint (New Method) 
 ${ElseIf} $DistroName == "Linux Mint"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd.* -ir!*mlinuz -o"$BDir\!\$JustISOName\" -y'  
 Rename "$BDir\!\casper\$JustISOName\initrd.gz" "$BDir\!\$JustISOName\casper\initrd.lz"  
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\vmlinuz"
  ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"  
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/casper/vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO isofrom=/dev/disk/by-label/TA/!/$JustISOName/$JustISO file=/cdrom/preseed/linuxmint.seed boot=casper noprompt floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
  ${AndIf} ${FileExists} "$BDir\!\$JustISOName\casper\initrd.lz"
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/casper/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz"
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"  
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/live/vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO isofrom=/dev/disk/by-label/TA/!/$JustISOName/$JustISO file=/cdrom/preseed/linuxmint.seed boot=live noprompt floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\live\initrd.lz"
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}
 
 ; Linux Mint (New Method) 
 ${ElseIf} $DistroName == "Linux Mint Debian"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd.* -ir!*mlinuz -o"$BDir\!\$JustISOName\" -y'  
 Rename "$BDir\!\casper\$JustISOName\initrd.gz" "$BDir\!\$JustISOName\casper\initrd.lz"  
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\vmlinuz"
  ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"  
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/casper/vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO isofrom=/dev/disk/by-label/TA/!/$JustISOName/$JustISO file=/cdrom/preseed/linuxmint.seed boot=casper noprompt floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
  ${AndIf} ${FileExists} "$BDir\!\$JustISOName\casper\initrd.lz"
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/casper/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz"
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"  
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/live/vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO isofrom=/dev/disk/by-label/TA/!/$JustISOName/$JustISO file=/cdrom/preseed/linuxmint.seed boot=live noprompt floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\live\initrd.lz"
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}
 
 ; Recatux
 ${ElseIf} $DistroName == "Rescatux" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\niso_path='/!/$JustISOName/$JustISO'$\r$\nexport iso_path$\r$\nsearch --set=root --file $$iso_path$\r$\nloopback loop $$iso_path$\r$\nroot=(loop)$\r$\nconfigfile /boot/grub/loopback.cfg$\r$\nloopback --delete loop$\r$\n}$\r$\n#end $JustISOName" $R0 
 
; Debian Live Based (New Method) 
 ${ElseIf} $DistroName == "Debian Live"
  ${OrIf} $DistroName == "Raspberry Pi Desktop"
  ${OrIf} $DistroName == "Deepin"
  ${OrIf} $DistroName == "Academix"
  ${OrIf} $DistroName == "LinuxCNC"

 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 
 FindFirst $0 $1 "$BDir\!\$JustISOName\live\initrd*" 
 Call ஆரம்பசீவ_கண்டுபிடி
 FindFirst $0 $1 "$BDir\!\$JustISOName\live\*mlinu*"
 Call லினக்சுஉட்கரு_கண்டுபிடி
 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   

 ${If} ${FileExists} "$BDir\!\$JustISOName\live\$Initrd"  ; likely 86_64
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/live/$Vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO boot=live noprompt components config findiso=/!/$JustISOName/$JustISO" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/$Initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
 ${EndIf}
 
; Clonezilla (New Method) - Debian Based - TORAM
  ${ElseIf} $DistroName == "Clonezilla (Backup + Clone Tool)"
  CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
  CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
  ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 
  FindFirst $0 $1 "$BDir\!\$JustISOName\live\initrd*" 
  Call ஆரம்பசீவ_கண்டுபிடி
  FindFirst $0 $1 "$BDir\!\$JustISOName\live\*mlinu*"
  Call லினக்சுஉட்கரு_கண்டுபிடி
 
  ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
  !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   

  ${If} ${FileExists} "$BDir\!\$JustISOName\live\$Initrd"  ; likely 86_64
  ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
  !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/live/$Vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO boot=live noprompt components config toram=live,syslinux,EFI,boot,.disk,utils findiso=/!/$JustISOName/$JustISO" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/$Initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
  ${EndIf}
  
; Solus
 ${ElseIf} $DistroName == "Solus"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile='/!/$JustISOName/$JustISO'$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/boot/kernel iso-scan/filename=/!/$JustISOName/$JustISO root=live:CDLABEL=SolusLiveBudgie ro rd.luks=0 rd.md=0 rd.live.overlay.overlayfs=1 quiet splash$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/initrd.img$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; Demon Linux 
 ${ElseIf} $DistroName == "Demon Linux (Penetration Testing)"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 
 FindFirst $0 $1 "$BDir\!\$JustISOName\initrd*" 
 Call ஆரம்பசீவ_கண்டுபிடி
 FindFirst $0 $1 "$BDir\!\$JustISOName\vmlinuz*"
 Call லினக்சுஉட்கரு_கண்டுபிடி
 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   

 ${If} ${FileExists} "$BDir\!\$JustISOName\$Initrd"  ; likely 86_64
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/$Vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO boot=live noprompt components config findiso=/!/$JustISOName/$JustISO" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/$Initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
 ${EndIf}
 
; Open Mandriva
 ${ElseIf} $DistroName == "OpenMandriva"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 
 FindFirst $0 $1 "$BDir\!\$JustISOName\*initrd*" 
 Call ஆரம்பசீவ_கண்டுபிடி
 FindFirst $0 $1 "$BDir\!\$JustISOName\*mlinu*"
 Call லினக்சுஉட்கரு_கண்டுபிடி
 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   

 ${If} ${FileExists} "$BDir\!\$JustISOName\$Initrd"  ; likely 86_64
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/$Vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO findiso=/!/$JustISOName/$JustISO root=live:LABEL=OpenMandrivaLx_4.0 rd.live.image toram" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/$Initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
 ${EndIf}
 
; Alpine Linux
 ${ElseIf} $DistroName == "Alpine Linux"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -ir!*nitr* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 
 FindFirst $0 $1 "$BDir\!\$JustISOName\*initr*" 
 Call ஆரம்பசீவ_கண்டுபிடி
 FindFirst $0 $1 "$BDir\!\$JustISOName\*mlinu*"
 Call லினக்சுஉட்கரு_கண்டுபிடி
 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   

 ${If} ${FileExists} "$BDir\!\$JustISOName\$Initrd"  ; likely 86_64
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/$Vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO findiso=/!/$JustISOName/$JustISO modules=loop,squashfs,sd-mod,usb-storage nomodeset" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/$Initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
 ${EndIf}  
 
; Clear Linux
 ${ElseIf} $DistroName == "Clear Linux"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'  
 
 FindFirst $0 $1 "$BDir\!\$JustISOName\*initrd*" 
 Call ஆரம்பசீவ_கண்டுபிடி
 FindFirst $0 $1 "$BDir\!\$JustISOName\*mlinu*"
 Call லினக்சுஉட்கரு_கண்டுபிடி
 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0    
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   

 ${If} ${FileExists} "$BDir\!\$JustISOName\$Initrd"  ; likely 86_64
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/$Vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO findiso=/!/$JustISOName/$JustISO" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/$Initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
 ${EndIf} 

; WIFISLAX (New Method) 
 ${ElseIf} $DistroName == "Wifislax (Wireless Penetration Testing)" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/$JustISO$\r$\nlinux (loop)/boot/vmlinuz from=/!/$JustISOName/$JustISO autoexec=telinit~4$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/initrd.xz$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; RIPLinux (New Method) 
 ${ElseIf} $DistroName == "Rip Linux (Recovery Distro) - BIOS ONLY" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory 
 ${WriteToFile} "#start $JustISOName$\r$\nif [ $${grub_platform} == $\"pc$\" ]; then$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile=$\"/!/$JustISOName/$JustISO$\"$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\nlinux16 /!/menu/memdisk iso raw$\r$\ninitrd16 $$isofile$\r$\n}; fi$\r$\n#end $JustISOName" $R0  
 
; Finnix 
 ${ElseIf} $DistroName == "Finnix x86/64- BIOS ONLY" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory 
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName - 32bit$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile=$\"/!/$JustISOName/$JustISO$\"$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/boot/x86/linux findiso=$$isofile vga=791 nomodeset quiet$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/x86/initrd.xz$\r$\n}$\r$\nmenuentry $\"$JustISOName - 64bit$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile=$\"/!/$JustISOName/$JustISO$\"$\r$\nloopback loop $$isofile$\r$\nlinux (loop)/boot/x86/linux64 findiso=$$isofile vga=791 nomodeset quiet$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/boot/x86/initrd.xz$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; Trinity Rescue Kit (New Method) 
 ${ElseIf} $DistroName == "Trinity Rescue Kit - BIOS ONLY" 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y'  
   ${If} ${FileExists} "$BDir\!\$JustISOName\kernel.trk"       
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.trk"  
   ${WriteToFile} "#start $JustISOName$\r$\nif [ $${grub_platform} == $\"pc$\" ]; then$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nlinux /!/$JustISOName/kernel.trk from=/!/$JustISOName vollabel=TA ramdisk_size=65536 root=/dev/ram0 splash=verbose pci=conf1 trkmenu$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd /!/$JustISOName/initrd.trk$\r$\n}; fi$\r$\n#end $JustISOName" $R0  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\trk3\trkramfs" 
   CopyFiles "$BDir\!\$JustISOName\trk3\*.*" "$BDir\trk3\" ; Move trk3 to root, so we can boot!
   RMDir /R "$BDir\!\$JustISOName\trk3"
   ${EndIf}    
 
; Ubuntu (New Method) 
 ${ElseIf} $DistroName == "Ubuntu"
  ${OrIf} $DistroName == "Ubuntu Budgie" 
  ${OrIf} $DistroName == "Ubuntu Gnome"
  ${OrIf} $DistroName == "Ubuntu Server"   
  ${OrIf} $DistroName == "Ubuntu Studio" 
  ${OrIf} $DistroName == "Xubuntu"
  ${OrIf} $DistroName == "Kubuntu"
  ${OrIf} $DistroName == "Tuxtrans"  
  ${OrIf} $DistroName == "Lubuntu"
  ${OrIf} $DistroName == "LinuxFX"  
  ${OrIf} $DistroName == "Edubuntu" 
  ${OrIf} $DistroName == "Cub Linux"
  ${OrIf} $DistroName == "Emmabuntus"  
  ${OrIf} $DistroName == "Q4OS"
  ${OrIf} $DistroName == "Rescuezilla"  
  ${OrIf} $DistroName == "KDE Neon"  
  ${OrIf} $DistroName == "Feren OS"   
  ${OrIf} $DistroName == "EasyPeasy (NetBook Distro)"  
  ${OrIf} $DistroName == "Kodachi (Anonymous Browsing)"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!*nitrd* -ir!*mlinu* -o"$BDir\!\$JustISOName\" -y'    
 CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg" 
 !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0 
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\vmlinuz.efi" 
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"  
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/casper/vmlinuz.efi iso-scan/filename=/!/$JustISOName/$JustISO boot=casper noprompt noeject fsck.mode=skip floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${EndIf}
  
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\vmlinuz"
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/casper/vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO boot=casper noprompt noeject fsck.mode=skip floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${EndIf}
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz" 
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "linux /SLUG" "loopback loop /!/$JustISOName/$JustISO$\r$\nlinux /!/$JustISOName/live/vmlinuz iso-scan/filename=/!/$JustISOName/$JustISO boot=live noprompt noeject fsck.mode=skip components config findiso=/!/$JustISOName/$JustISO" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${EndIf}
 
 ; add method for initrd
 ${If} ${FileExists} "$BDir\!\$JustISOName\live\initrd"
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\initrd" 
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"   
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/casper/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 ; end method for initrd
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\live\initrd.gz"
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO" 
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\initrd.gz" 
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"   
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/casper/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\initrd.lz" 
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"   
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/casper/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\live\initrd.lz" 
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"   
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\live\initrd.img" ; For Distros such as Emmabuntus
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"   
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/live/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\initrd.img"
 ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$JustISO"   
 !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd (loop)/casper/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 
 ${If} $DistroName == "Ubuntu"  
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "ubuntu.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Cub Linux"  
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "ubuntu.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Ubuntu Gnome"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "ubuntu-gnome.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Ubuntu Studio"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "ubuntustudio.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Xubuntu"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "xubuntu.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Kubuntu"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "kubuntu.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Lubuntu"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "lubuntu.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Edubuntu"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "edubuntu.seed" "all" "all" "$BDir\!\menu\linux.cfg"  
 ${ElseIf} $DistroName == "Ubuntu Budgie"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "ubuntu-budgie.seed" "all" "all" "$BDir\!\menu\linux.cfg"
 ${ElseIf} $DistroName == "Feren OS"
 !insertmacro கோப்பில்மாற்று "SOMETHING.seed" "lubuntu.seed" "all" "all" "$BDir\!\menu\linux.cfg"
 ${EndIf}  
  
; OpenSUSE
 ${ElseIf} $DistroName == "OpenSUSE"
  ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y'  
  ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nlinux /!/$JustISOName/boot/x86_64/loader/linux rd.live.image rd.live.overlay.persistent rd.live.overlay.cowfs=ext4 root=live:CDLABEL=TA live_dir=/!/$JustISOName/LiveOS$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd /!/$JustISOName/boot/x86_64/loader/initrd$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; FreeDOS (Balder img) 
 ${ElseIf} $DistroName == "FreeDOS (Balder img)"
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO"
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nlinux16 /!/menu/memdisk$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd16 /!/$JustISOName/$JustISO$\r$\n}$\r$\n#end $JustISOName" $R0  
 
 ; XPUD (New Method) 
 ${ElseIf} $DistroName == "xPUD (Netbook Distro)" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/$JustISO$\r$\nlinux (loop)/boot/bzImage noisapnp lang=en kmap=us fromiso=/!/$JustISOName/$JustISO$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\ninitrd (loop)/opt/core$\r$\n}$\r$\n#end $JustISOName" $R0  
 
; Memtest86+ (Memory Testing Tool)
 ${ElseIf} $DistroName == "Memtest86+ (Memory Testing Tool) BIOS ONLY"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y'  
 ${WriteToFile} "#start $JustISOName$\r$\nif [ $${grub_platform} == $\"pc$\" ]; then$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nlinux16 /!/$JustISOName/$JustISOName$\r$\n}$\r$\nfi$\r$\n#end $JustISOName" $R0

; Windows 10
 ${ElseIf} $DistroName == "Windows 10 Installer"
 CreateDirectory "$EXEDIR\TEMPI" ; Create the TEMPI directory
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -xr!install.wim -xr!bootx64.efi -o"$BDir\" -y' 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!install.wim -o"$EXEDIR\TEMPI" -y' 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!bootx64.efi -aou -o"$BDir\" -y'  
 ReadEnvStr $R0 COMSPEC ; grab commandline
 nsExec::Exec "$R0 /C Rename $BDir\EFI\BOOT\bootx64_1.efi win10.efi" ; rename efi file
 DetailPrint "Now splitting install.wim. Please be patient as this will take some time..."
 NsExec::ExecToLog "cmd /C Dism /Split-Image /ImageFile:$EXEDIR\TEMPI\sources\install.wim /SWMFile:$BDir\sources\install.swm /FileSize:3800"
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\nif [ $${grub_platform} == $\"pc$\" ]; then ntldr /bootmgr; fi$\r$\nif [ $${grub_platform} == $\"efi$\" ]; then chainloader /EFI/BOOT/win10.efi; fi$\r$\n}$\r$\n#end $JustISOName" $R0
 RMDir /R "$EXEDIR\TEMPI"
 
 ; Windows Vista/7/8
 ${ElseIf} $DistroName == "Windows Vista/7/8 Installer"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -o"$BDir\" -y -x![BOOT]*' 
 ${WriteToFile} "#start $JustISOName$\r$\ntitle Install $JustISOName$\r$\nchainloader /bootmgr$\r$\n#end $JustISOName" $R0  

; Windows XP
/*  ${ElseIf} $DistroName == "Windows XP Installer" 
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" ; Copy the ISO to Directory
 ${WriteToFile} "#start $JustISOName$\r$\ntitle Begin Install of Windows XP from $JustISO (Stage 1)$\r$\nfind --set-root /!/$JustISOName/$JustISO$\r$\nmap (hd0) (hd1)$\r$\nmap (hd1) (hd0)$\r$\nmap --mem /!/$JustISOName/firadisk.img (fd0)$\r$\nmap --mem /!/$JustISOName/firadisk.img (fd1)$\r$\nmap --mem /!/$JustISOName/$JustISO (0xff)$\r$\nmap --hook$\r$\nchainloader (0xff)/I386/SETUPLDR.BIN$\r$\n$\r$\ntitle Continue Windows XP Install from $JustISO (Stage 2)$\r$\nfind --set-root /!/$JustISOName/$JustISO$\r$\nmap (hd0) (hd1)$\r$\nmap (hd1) (hd0)$\r$\nmap --mem /!/$JustISOName/$JustISO (0xff)$\r$\nmap --hook$\r$\nchainloader (hd0)+1$\r$\n$\r$\ntitle Boot Windows XP - If fails, reboot with USB removed (Stage 3)$\r$\nmap (hd1) (hd0)$\r$\nmap (hd0) (hd1)$\r$\nroot (hd1,0)$\r$\nfind --set-root /ntldr$\r$\nchainloader /ntldr$\r$\n#end $JustISOName" $R0  
 File /oname=$PLUGINSDIR\firadisk.img "firadisk.img"  
 CopyFiles "$PLUGINSDIR\firadisk.img" "$BDir\!\$JustISOName\firadisk.img"    */
 
; Try Unlisted ISOs 
 ${ElseIf} $DistroName == "Try Unlisted ISO" 
 CopyFiles $ISOFile "$BDir\!\ISOS\$JustISO" ; Copy the ISO to the ! ISOS Directory 
 
 
; Hiren's BootCD PE
 ${ElseIf} $DistroName == "Hiren's BootCD PE"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -xr!bootx64.efi -o"$BDir\" -y' 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -ir!bootx64.efi -aou -o"$BDir\" -y'  
 ReadEnvStr $R0 COMSPEC ; grab commandline
 nsExec::Exec "$R0 /C Rename $BDir\EFI\BOOT\bootx64_1.efi HBCDPE.efi" ; rename efi file  
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\nif [ $${grub_platform} == $\"pc$\" ]; then ntldr /bootmgr; fi$\r$\nif [ $${grub_platform} == $\"efi$\" ]; then chainloader /EFI/BOOT/HBCDPE.efi; fi$\r$\n}$\r$\n#end $JustISOName" $R0
 
; RemixOS  
 ${ElseIf} $DistroName == "RemixOS"
 CreateDirectory "$EXEDIR\TEMPI" ; Create the TEMPI directory
 ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -o"$EXEDIR\TEMPI" -y' 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$EXEDIR\TEMPI\Remix_OS*.iso" -o"$BDir\!\$JustISOName\" -y'  
 RMDir /R "$EXEDIR\TEMPI"
 Call FindGrubConfig
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/$GrubConfigPath/$GrubConfigFile$\r$\n}$\r$\n#end $JustISOName" $R0   
  !insertmacro கோப்பில்மாற்று "linuxefi /kernel" "linux /!/$JustISOName/kernel" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
  !insertmacro கோப்பில்மாற்று "initrdefi /initrd.img" "initrd /!/$JustISOName/initrd.img" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"
  !insertmacro கோப்பில்மாற்று "--set=root /kernel" "--set=root /!/$JustISOName/kernel" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "quiet DATA= USB_DATA_PARTITION=1" "CREATE_DATA_IMG=1" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
  
; Pop!_OS  
 ${ElseIf} $DistroName == "POP!_OS"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -o"$BDir\!\$JustISOName\" -y'    
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/boot/grub/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0   
 !insertmacro கோப்பில்மாற்று "linux /casper_pop-os" "linux /!/$JustISOName/casper_pop-os" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"  
 !insertmacro கோப்பில்மாற்று "initrd /casper_pop-os" "initrd /!/$JustISOName/casper_pop-os" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg" 
 !insertmacro கோப்பில்மாற்று "=/casper_pop-os" "=/!/$JustISOName/casper_pop-os" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg" 
 !insertmacro கோப்பில்மாற்று "loadfont /boot" "loadfont /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg" 
 !insertmacro கோப்பில்மாற்று "theme=/boot" "theme=/!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg" 
 
; Memtest86 
 ${ElseIf} $DistroName == "Memtest86 (Memory Testing Tool)"  
 ;CreateDirectory "$EXEDIR\TEMPI" ; Create the TEMPI directory
 ;ExecWait '"$PLUGINSDIR\7zG.exe" e "$ISOFile" -o"$EXEDIR\TEMPI" -y' 
  ExecWait '"$PLUGINSDIR\new7z\7zG.exe" e "$ISOFile" -ir!memtest86-usb.img -o"$BDir\!\$JustISOName\" -y' 
  ;CopyFiles $EXEDIR\TEMPI\memtest86-usb.img "$BDir\!\$JustISOName\" 
  ExecWait '"$PLUGINSDIR\new7z\7zG.exe" x "$BDir\!\$JustISOName\memtest86-usb.img" -o"$BDir\!\$JustISOName\" -y'
  ExecWait '"$PLUGINSDIR\new7z\7zG.exe" x "$BDir\!\$JustISOName\EFI System Partition.img" -o"$BDir\!\$JustISOName\" -y'
 ;RMDir /R "$EXEDIR\TEMPI" 
 ${WriteToFile} "#start $JustISOName$\r$\nif [ $${grub_platform} == $\"efi$\" ]; then$\r$\nmenuentry $\"$JustISOName X64$\" {$\r$\nset gfxpayload=keep$\r$\nloopback loop /!/$JustISOName/memtest86-usb.img$\r$\nchainloader /!/$JustISOName/EFI/BOOT/BOOTX64.efi$\r$\n}$\r$\n$\r$\nmenuentry $\"$JustISOName IA32$\" {$\r$\nloopback loop /!/$JustISOName/memtest86-usb.img$\r$\nchainloader /!/$JustISOName/EFI/BOOT/BOOTIA32.efi$\r$\n}$\r$\nfi$\r$\n#end $JustISOName" $R0 
 
; Slacko Puppy/BionicPup
 ${ElseIf} $DistroName == "Slacko Puppy"
  ${OrIf} $DistroName == "BionicPup"
    ${OrIf} $DistroName == "puppy Linux"
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y'  
 # Call FindGrubConfig
 ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0   
  !insertmacro கோப்பில்மாற்று "linux /vmlinuz" "linux /!/$JustISOName/vmlinuz psubdir=/!/$JustISOName psubok=TRUE" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "initrd /initrd" "initrd /!/$JustISOName/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
 
; Ultimate Boot CD and Hirens Boot CD
 ${ElseIf} $DistroName == "Ultimate Boot CD (Diagnostics Tools) - BIOS ONLY"  
 ${OrIf} $DistroName == "Hiren's Boot CD - BIOS ONLY" 
 ${OrIf} $DistroName == "Falcon 4 Boot CD - BIOS ONLY"  
 CopyFiles $ISOFile "$BDir\!\$JustISOName\$JustISO" 
 ${WriteToFile} "#start $JustISOName$\r$\nif [ $${grub_platform} == $\"pc$\" ]; then$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nset isofile=$\"/!/$JustISOName/$JustISO$\"$\r$\necho $\"Loading - This may take several seconds...$\"$\r$\nlinux16 /!/menu/memdisk iso raw$\r$\ninitrd16 $$isofile$\r$\n}; fi$\r$\n#end $JustISOName" $R0  

 ${Else} ; Start Catch All Install Methods 
 ExecWait '"$PLUGINSDIR\7zG.exe" x "$ISOFile" -x![BOOT] -o"$BDir\!\$JustISOName\" -y'  
 Call FindConfig
 Call FindGrubConfig
 ${If} $GrubConfigFile != "NULL" ; If native Grub config file does exist... 
    ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=auto$\r$\nconfigfile /!/$JustISOName/$GrubConfigPath/$GrubConfigFile$\r$\n}$\r$\n#end $JustISOName" $R0   
 ${ElseIf} $GrubConfigFile == "NULL" ; If Grub config file does not exist... 
 ${AndIfNot} ${FileExists} "$BDir\!\$JustISOName\grub.cfg"  
    CopyFiles "$PLUGINSDIR\grubslug.cfg" "$BDir\!\$JustISOName\grub.cfg"
    ${WriteToFile} "#start $JustISOName$\r$\nmenuentry $\"$JustISOName$\" {$\r$\nset gfxpayload=keep$\r$\nconfigfile /!/$JustISOName/grub.cfg$\r$\n}$\r$\n#end $JustISOName" $R0 
    !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${EndIf}

; Ubuntu derived
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\vmlinuz.efi" 
  ${AndIf} $GrubConfigFile == "NULL" ; If Grub config file does not exist... 
  !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/casper/vmlinuz.efi boot=casper noprompt live-media-path=/!/$JustISOName/casper floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${EndIf}
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\vmlinuz"
  ${AndIf} $GrubConfigFile == "NULL" ; If Grub config file does not exist...  
  !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/casper/vmlinuz boot=casper noprompt live-media-path=/!/$JustISOName/casper floppy.allowed_drive_mask=0 ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
 ${EndIf}
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\initrd.lz"  
  ${AndIf} $GrubConfigFile == "NULL" ; If Grub config file does not exist...  
  !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/casper/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\initrd.gz"  
  ${AndIf} $GrubConfigFile == "NULL" ; If Grub config file does not exist...  
  !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/casper/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}  
  
; For RemixOS - Android derived
 ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\android-x86.png" 
  !insertmacro கோப்பில்மாற்று "linuxefi /kernel" "linux /!/$JustISOName/kernel" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
  !insertmacro கோப்பில்மாற்று "initrdefi /initrd.img" "initrd /!/$JustISOName/initrd.img" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"
  !insertmacro கோப்பில்மாற்று "--set=root /kernel" "--set=root /!/$JustISOName/kernel" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"
 ${EndIf}

; More Catch All Methods for Vmlinuz, Initrd, Livedir

; Vmlinuz check
 ${If} ${FileExists} "$BDir\!\$JustISOName\boot\vmlinu*"  
  ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist...  
  !insertmacro கோப்பில்மாற்று "linux /boot" "linux /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
 ${EndIf} 
 
; Init check
 ${If} ${FileExists} "$BDir\!\$JustISOName\boot\initr*"  
  ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist...  
  !insertmacro கோப்பில்மாற்று "initrd /boot" "initrd /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
 ${EndIf}  
 
 ; Live media path check
 ${If} ${FileExists} "$BDir\!\$JustISOName\live\*.*"  
  ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist...  
  !insertmacro கோப்பில்மாற்று "boot=live" "boot=NULL" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
  !insertmacro கோப்பில்மாற்று "boot=NULL" "boot=live live-media-path=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
 ${EndIf}  
 
 ; Casper path check
 ${If} ${FileExists} "$BDir\!\$JustISOName\casper\*.*"  
  ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist...   
   !insertmacro கோப்பில்மாற்று "boot=casper" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid boot=NULL live-media-path=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
  !insertmacro கோப்பில்மாற்று "boot=NULL" "boot=casper" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
 ${EndIf}
 
 
; Mageia / Manjaro
  ${If} ${FileExists} "$BDir\!\$JustISOName\boot\grub\kernels.cfg"  
  ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist...  
  !insertmacro கோப்பில்மாற்று " /boot" " /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "$\"/boot/" "$\"/!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று " /boot" " /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\boot\grub\kernels.cfg" 
  !insertmacro கோப்பில்மாற்று "misobasedir=manjaro" "misobasedir=/!/$JustISOName/manjaro" "all" "all" "$BDir\!\$JustISOName\boot\grub\kernels.cfg"
  !insertmacro கோப்பில்மாற்று "misolabel=MJ" "misolabel=TA NULL-" "all" "all" "$BDir\!\$JustISOName\boot\grub\kernels.cfg"
  !insertmacro கோப்பில்மாற்று "misolabel=M1" "misolabel=TA NULL-" "all" "all" "$BDir\!\$JustISOName\boot\grub\kernels.cfg"
  !insertmacro கோப்பில்மாற்று "misolabel=MANJ" "misolabel=TA NULL-" "all" "all" "$BDir\!\$JustISOName\boot\grub\kernels.cfg"  
  !insertmacro கோப்பில்மாற்று "$\"/boot/" "$\"/!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\boot\grub\kernels.cfg"
  !insertmacro கோப்பில்மாற்று " /boot/" " /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\boot\grub\loopback.cfg"
  !insertmacro கோப்பில்மாற்று "grub_theme=/boot" "grub_theme=/!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\boot\grub\variable.cfg"  
 ${EndIf} 

 ${If} ${FileExists} "$BDir\!\$JustISOName\boot\cdrom\init*"  
  ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist...  
  !insertmacro கோப்பில்மாற்று "initrd /boot" "initrd /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
 ${EndIf}  
 
; NetRunner
 ${If} ${FileExists} "$BDir\!\$JustISOName\netrunner\boot\x86_64\netrunner"  
  !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/netrunner/boot/x86_64/netrunner misobasedir=/!/$JustISOName/netrunner misolabel=TA nouveau.modeset=1 i915.modeset=1 radeon.modeset=1 logo.nologo overlay=free showopts" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 ${If} ${FileExists} "$BDir\!\$JustISOName\netrunner\boot\x86_64\netrunner.img"  
  !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/netrunner/boot/x86_64/netrunner.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}  
 
; PCLinuxOS
 ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\vmlinuz"  
   ${AndIf} $GrubConfigFile == "NULL" ; If native Grub config file does not exist... 
  !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/isolinux/vmlinuz fromusb livecd=/!/$JustISOName/livecd root=/dev/rd/3 keyb=us" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf} 
 ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\initrd.gz"
   ${AndIf} $GrubConfigFile == "NULL" ; If native Grub config file does not exist...  
  !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/isolinux/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
 ${EndIf}  
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\vmlinuz"  
   ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist... 
  !insertmacro கோப்பில்மாற்று "linux /isolinux/vmlinuz" "linux /!/$JustISOName/isolinux/vmlinuz fromusb livecd=/!/$JustISOName/livecd root=/dev/rd/3 keyb=us" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
 ${EndIf} 
 ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\initrd.gz"
  ${AndIf} $GrubConfigFile != "NULL" ; If native Grub config file does exist...  
  !insertmacro கோப்பில்மாற்று "initrd /isolinux/initrd.gz" "initrd /!/$JustISOName/isolinux/initrd.gz" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
  ${AndIf} ${FileExists} "$BDir\!\$JustISOName\EFI\BOOT\grub.cfg"
  !insertmacro கோப்பில்மாற்று "theme=($$root)/EFI/BOOT/" "theme=($$root)/!/$JustISOName/EFI/BOOT/" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
 ${EndIf}    
 
; Partition Wizard 
 ${If} ${FileExists} "$BDir\!\$JustISOName\BOOT\BZIMAGE3"
 ${AndIf} $GrubConfigFile != "NULL" 
 !insertmacro கோப்பில்மாற்று "linuxefi /boot/bzImage3" "linux /!/$JustISOName/boot/bzImage3" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
 !insertmacro கோப்பில்மாற்று "initrdefi /boot/tinycore.gz" "initrd /!/$JustISOName/boot/tinycore.gz" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
 ${EndIf}
 
; Alt For derivatives like Dr.Web Livedisk
  ${If} ${FileExists} "$BDir\!\$JustISOName\syslinux\txt.cfg" ; Rename the following for syslinux txt.cfg
  !insertmacro கோப்பில்மாற்று "file=/cdrom/preseed/" "file=/cdrom/!/$JustISOName/preseed/" "all" "all" "$BDir\!\$JustISOName\syslinux\txt.cfg"  
  !insertmacro கோப்பில்மாற்று "initrd=/casper/" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/!/$JustISOName/casper/ initrd=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\syslinux\txt.cfg"  
  !insertmacro கோப்பில்மாற்று "kernel /casper/" "kernel /!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\syslinux\txt.cfg"  
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\syslinux\text.cfg" ; Rename the following for syslinux text.cfg
  !insertmacro கோப்பில்மாற்று "file=/cdrom/preseed/" "file=/cdrom/!/$JustISOName/preseed/" "all" "all" "$BDir\!\$JustISOName\syslinux\text.cfg"  
  !insertmacro கோப்பில்மாற்று "initrd=/casper/" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/!/$JustISOName/casper/ initrd=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\syslinux\text.cfg"  
  !insertmacro கோப்பில்மாற்று "kernel /casper/" "kernel /!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\syslinux\text.cfg"  
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\syslinux\syslinux.cfg" ; Rename the following for syslinux.cfg
  !insertmacro கோப்பில்மாற்று "file=/cdrom/preseed/" "file=/cdrom/!/$JustISOName/preseed/" "all" "all" "$BDir\!\$JustISOName\syslinux\syslinux.cfg"  
  !insertmacro கோப்பில்மாற்று "initrd=/casper/" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/!/$JustISOName/casper/ initrd=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\syslinux\syslinux.cfg"  
  !insertmacro கோப்பில்மாற்று "kernel /casper/" "kernel /!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\syslinux\syslinux.cfg"  
  ${EndIf}
   
  ${If} ${FileExists} "$BDir\!\$JustISOName\boot\grub\loopback.cfg" ; Rename the following for grub loopback.cfg
  !insertmacro கோப்பில்மாற்று "file=/cdrom/preseed/" "file=/cdrom/!/$JustISOName/preseed/" "all" "all" "$BDir\!\$JustISOName\boot\grub\loopback.cfg"  
  !insertmacro கோப்பில்மாற்று "/casper/vmlinuz" "/!/$JustISOName/casper/vmlinuz" "all" "all" "$BDir\!\$JustISOName\boot\grub\loopback.cfg"  
  !insertmacro கோப்பில்மாற்று "/casper/initrd" "/!/$JustISOName/casper/initrd" "all" "all" "$BDir\!\$JustISOName\boot\grub\loopback.cfg" 
  !insertmacro கோப்பில்மாற்று "boot=casper" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid boot=NULL live-media-path=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\boot\grub\loopback.cfg"  
  !insertmacro கோப்பில்மாற்று "boot=NULL" "boot=casper" "all" "all" "$BDir\!\$JustISOName\boot\grub\loopback.cfg"  
  ${EndIf}
  ${If} ${FileExists} "$BDir\!\$JustISOName\boot\grub\grub.cfg" ; Rename the following for grub.cfg
  !insertmacro கோப்பில்மாற்று "file=/cdrom/preseed/" "file=/cdrom/!/$JustISOName/preseed/" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "/casper/vmlinuz" "/!/$JustISOName/casper/vmlinuz" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "/casper/initrd" "/!/$JustISOName/casper/initrd" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"   
  !insertmacro கோப்பில்மாற்று "boot=casper" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid boot=NULL live-media-path=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "boot=NULL" "boot=casper" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "=/boot/grub/" "=/!/$JustISOName/boot/grub/" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"  ; Rescuezilla
  ${EndIf}    
  
; SolydX
  ${If} ${FileExists} "$BDir\!\$JustISOName\solydxk\filesystem.squashfs" 
  !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/solydxk/vmlinuz live-media-path=/!/$JustISOName/solydxk boot=live config ignore_uuid" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/solydxk/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
  ${EndIf} 

; Sparky Linux, Subgraph, Clonezilla, etc
  ${If} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz" 
  ${AndIf} $GrubConfigFile != "NULL" 
  !insertmacro கோப்பில்மாற்று "/live/vmlinuz" "VMLSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "VMLSLUG" " /!/$JustISOName/live/vmlinuz" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "live-media-path=/live" "live-media-path=/!/$JustISOName/live cdrom-detect/try-usb=true" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
  !insertmacro கோப்பில்மாற்று "boot=live" "BOOTSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "BOOTSLUG" "boot=live noprompt live-media-path=/!/$JustISOName/live cdrom-detect/try-usb=true" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
  ${EndIf} 
  ${If} ${FileExists} "$BDir\!\$JustISOName\live\initrd.img" 
  ${AndIf} $GrubConfigFile != "NULL" 
  !insertmacro கோப்பில்மாற்று "/live/initrd.img" "INITSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
  !insertmacro கோப்பில்மாற்று "INITSLUG" " /!/$JustISOName/live/initrd.img" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"     
  ${EndIf}  
  
; For Desinfect Distro 
  ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\os.cfg" ; Rename the following for isolinux os.cfg
  !insertmacro கோப்பில்மாற்று "file=/cdrom/preseed/" "file=/cdrom/!/$JustISOName/preseed/" "all" "all" "$BDir\!\$JustISOName\isolinux\os.cfg"  
  !insertmacro கோப்பில்மாற்று "initrd=/casper/" "cdrom-detect/try-usb=true noprompt floppy.allowed_drive_mask=0 ignore_uuid live-media-path=/!/$JustISOName/casper/ initrd=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\isolinux\os.cfg"  
  !insertmacro கோப்பில்மாற்று "kernel /casper/" "kernel /!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\isolinux\os.cfg"    
  !insertmacro கோப்பில்மாற்று "BOOT_IMAGE=/casper/" "BOOT_IMAGE=/!/$JustISOName/casper/" "all" "all" "$BDir\!\$JustISOName\isolinux\os.cfg"    
  ${EndIf} 
   
; For Fedora Based and derivatives
  ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\LiveOS\livecd-iso-to-disk"  ; Probably Fedora based
   !insertmacro கோப்பில்மாற்று "root=live:CDLABEL=" "root=live:LABEL=TA live_dir=/!/$JustISOName/LiveOS NULL=" "all" "all" "$BDir\!\$JustISOName\isolinux\isolinux.cfg"   
   !insertmacro கோப்பில்மாற்று "root=live:LABEL=Fedora" "root=live:LABEL=TA live_dir=/!/$JustISOName/LiveOS NULL=" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "isolinux/vmlin" "!/$JustISOName/isolinux/vmlin" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "isolinux/init" "!/$JustISOName/isolinux/init" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "linuxefi" "linux" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "initrdefi" "initrd" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
   ${AndIf} $GrubConfigFile == "NULL" ;It's likely not natively Grub supported... let's do this differently
    !insertmacro கோப்பில்மாற்று "menuentry $\"BOOT$\"" "menuentry $\"$JustISOName$\"" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
    !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/isolinux/vmlinuz0 live_dir=/!/$JustISOName/LiveOS initrd=initrd0.img root=live:LABEL=TA live_dir=/!/$JustISOName/LiveOS rootfstype=auto ro rd.live.image rhgb rd.luks=0 rd.md=0 rd.dm=0" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
    !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/isolinux/initrd0.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
  ${EndIf}   
  
; Offline NT and others 
   ${If} ${FileExists} "$BDir\!\$JustISOName\initrd.cgz" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\scsi.cgz"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\vmlinuz" 
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/vmlinuz rw loglevel=1" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.cgz /!/$JustISOName/scsi.cgz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf}   

; For Puppy Based and derivatives
  ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\help2.msg"  ; Probably Puppy based 
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/vmlinuz psubdir=/!/$JustISOName psubok=TRUE" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.gz"   
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
   ${EndIf}    
   
/* ; For Slacko Puppy Based and derivatives
  ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\slacko.png"  ; Probably Slacko based
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\help\help.msg"  ; Probably Puppy based 
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/vmlinuz psubdir=/!/$JustISOName psubok=TRUE" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.gz"   
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
   ${EndIf}    */
   
; Fatdog64  
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\help\help.msg"  ; Probably Puppy based 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\fatdog.png"  ; Fatdog64
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/vmlinuz rootfstype=ramfs waitdev=5" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.gz" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf} 
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\help\help.msg"  ; Probably Puppy based 
   ${AndIfNot} ${FileExists} "$BDir\!\$JustISOName\fatdog.png"  ; Fatdog64
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/vmlinuz psubdir=/!/$JustISOName psubok=TRUE" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.gz"    
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf}   
   
; Dpup
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\help.msg"  ; Probably Puppy based 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\dpup*"  ; Dpup
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/vmlinuz psubdir=/!/$JustISOName psubok=TRUE" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.gz" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf}    
  
; AntivirusLiveCD, Comodo
  ${If} ${FileExists} "$BDir\!\$JustISOName\boot\bzImage"  
  ${AndIf} $GrubConfigFile != "NULL"  
  !insertmacro கோப்பில்மாற்று "kernel /boot/bzImage" "kernel /!/$JustISOName/boot/bzImage" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile" 
  ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\boot\bzImage"  
  ${AndIf} $GrubConfigFile == "NULL"    
  !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/bzImage" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
  ${EndIf}   
  
  ${If} ${FileExists} "$BDir\!\$JustISOName\boot\bzImage"   
  ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\initrd*" 
  ${AndIf} $GrubConfigFile != "NULL"    
  ${OrIf} ${FileExists} "$BDir\!\$JustISOName\boot\rootfs*"  
  !insertmacro கோப்பில்மாற்று "append initrd=/boot" "append initrd=/!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"  
  ${EndIf} 
  
  ${If} ${FileExists} "$BDir\!\$JustISOName\boot\*.jpg" ; Fix background Image Paths
  ${OrIf} ${FileExists} "$BDir\!\$JustISOName\boot\*.png"   
  !insertmacro கோப்பில்மாற்று "MENU BACKGROUND /boot" "MENU BACKGROUND /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"   
  ${EndIf} 
  
; AOSS
   ${If} ${FileExists} "$BDir\!\$JustISOName\system\stage1"  
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/system/stage1 root=/dev/ram0 rw rdinit=/linuxrc video=vesa:ywrap,mtrr vga=0x303 loglevel=0 boot=usb" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/system/stage2" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
   ;!insertmacro கோப்பில்மாற்று "boot=cdrom" "boot=usb" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"    
   ${EndIf} 
   
; AVG Rescue CD   
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\initrd.lzm"     
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/isolinux/initrd.lzm" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
   ${EndIf}  
   
; TinyCore, + REVISIT WifiWay, + REVISIT Dr.Web
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\vmlinuz"  
   ${AndIf} $GrubConfigFile == "NULL"   
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/vmlinuz loglevel=3 cde waitusb=5" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\initrd"
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/initrd" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${OrIf} ${FileExists} "$BDir\!\$JustISOName\boot\initrd.gz"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${OrIf} ${FileExists} "$BDir\!\$JustISOName\boot\initrd.lz"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/initrd.lz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf}
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\vmlinuz64"  
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/vmlinuz64 loglevel=3 cde waitusb=5" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
   ${ElseIf} $GrubConfigFile != "NULL"    
   !insertmacro கோப்பில்மாற்று "/boot/vmlinuz64" "KERNSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"       
   !insertmacro கோப்பில்மாற்று "KERNSLUG" "/!/$JustISOName/boot/vmlinuz64" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"       
   ${EndIf} 

   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\corepure64.gz" ; TinyCore specific
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/corepure64.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${ElseIf} $GrubConfigFile != "NULL" 
   !insertmacro கோப்பில்மாற்று "/boot/corepure64.gz" "INITSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"     
   !insertmacro கோப்பில்மாற்று "INITSLUG" "/!/$JustISOName/boot/corepure64.gz" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"     
   ${EndIf}   
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\core.gz" ; TinyCore specific
   ${AndIf} $GrubConfigFile == "NULL"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/core.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "INITRD /SLUG" "INITRD /!/$JustISOName/boot/core.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
   ${EndIf}
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\tinycore.gz" ; Partition Wizard, TinyCore specific
   ${AndIf} $GrubConfigFile == "NULL"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/tinycore.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "INITRD /SLUG" "INITRD /!/$JustISOName/boot/tinycore.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
   ${EndIf}    
   
; F-Secure Rescue CD
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\isolinux\fsecure\linux"  
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/isolinux/fsecure/linux noprompt knoppix_dir=/!/$JustISOName/KNOPPIX" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/isolinux/fsecure/minirt.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}   

; GData
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\linux17" 
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/linux17 boot=live live-media-path=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\initrd17.xz"
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/initrd17.xz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf} 
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\linux6" 
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/linux6 boot=live live-media-path=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\initrd6.xz"
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/initrd6.xz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}    

; Liberte
   ${If} ${FileExists} "$BDir\!\$JustISOName\liberte\boot\syslinux\syslinux.cfg"  
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/liberte/boot/kernel-x86.zi loop=/!/$JustISOName/liberte/boot/root-x86.sfs" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/liberte/boot/initrd-x86.xz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}    

; Panda Safe CD 
   ${If} $DistroName == "Panda SafeCD" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz"     
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/live/vmlinuz noprompt boot=live config union=aufs live-media-path=/!/$JustISOName/live noacpi acpi=off" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/live/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf} 
   
   ${If} $DistroName == "Panda SafeCD" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz1"     
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/live/vmlinuz1 noprompt boot=live config union=aufs live-media-path=/!/$JustISOName/live noacpi acpi=off" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/live/initrd1.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}    
   
; Ghost 4 Linux
   ${If} ${FileExists} "$BDir\!\$JustISOName\bz3x12.59"     
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/bz3x12.59 root=/dev/ram0 noapic noacpi pnpbios=off acpi=off pci=noacpi nosmp" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\ramdisk.lzma"          
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/ramdisk.lzma" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}    
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\BZ4X14.134"     
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/BZ4X14.134 root=/dev/ram0 noapic noacpi pnpbios=off acpi=off pci=noacpi nosmp" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\ramdisk.lzma"          
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/ramdisk.lzma" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}    
   
; TAILS 
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\tails.cfg"  ; Tails Specific
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/live/vmlinuz live-media-path=/!/$JustISOName/live boot=live config apparmor=1 security=apparmor nopersistence noprompt timezone=Etc/UTC block.events_dfl_poll_msecs=1000 noautologin module=Tails" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/live/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
   ${ElseIf} $GrubConfigFile != "NULL"  
   !insertmacro கோப்பில்மாற்று "syslinux_configfile /efi" "syslinux_configfile /!/$JustISOName/efi" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\efi\boot\live64.cfg"
   !insertmacro கோப்பில்மாற்று "kernel /live" "kernel /!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\efi\boot\live64.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd=/live" "live-media-path=/!/$JustISOName/live initrd=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\efi\boot\live64.cfg"
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\efi\boot\live.cfg"
   !insertmacro கோப்பில்மாற்று "kernel /live" "kernel /!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\efi\boot\live.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd=/live" "live-media-path=/!/$JustISOName/live initrd=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\efi\boot\live.cfg"
   ${EndIf}  
   
; AEOMI Backupper 
   ${If} $DistroName == "AEOMI Backupper"       
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/bzImage quiet root=/dev/ram0 rw" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}    

; Matriux and extracted Live
   ${If} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\live\initrd.img"    
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/live/vmlinuz boot=live config live-media-path=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/live/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf} 
   
; Ping
   ${If} ${FileExists} "$BDir\!\$JustISOName\kernel" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.gz"    
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/kernel devfs=nomount pxe ramdisk_size=60000 load_ramdisk=1 init=/linuxrc prompt_ramdisk=0 root=/dev/ram0 rw noapic nolapic lba combined_mode=libata ide0=noprobe nomce pci=nomsi irqpoll" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}   
   
; Webconverger
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\live.cfg"  
   ${AndIf} $GrubConfigFile == "NULL"     
   ;!insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/live/vmlinuz noprompt boot=live live-media-path=/!/$JustISOName/live skipconfig components=gitfs" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/live/vmlinuz noprompt boot=live live-media-path=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\grub.cfg"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/live/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}   
   
; Archlinux
   ${If} ${FileExists} "$BDir\!\$JustISOName\arch\boot\syslinux\archiso.cfg" 
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/arch/boot/x86_64/vmlinuz archisolabel=TA CONFIG /!/$JustISOName/arch archisobasedir=/!/$JustISOName/arch" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/arch/boot/x86_64/archiso.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
   ${EndIf}  
   
; Archbang
   ${If} ${FileExists} "$BDir\!\$JustISOName\arch\boot\syslinux\syslinux.cfg" 
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/arch/boot/x86_64/vmlinuz archisolabel=TA CONFIG /!/$JustISOName/arch archisobasedir=/!/$JustISOName/arch cow_spacesize=8G copytoram=y" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/arch/boot/x86_64/archiso.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
   ${EndIf}     

; Manjaro i686
   ${If} ${FileExists} "$BDir\!\$JustISOName\manjaro\boot\i686\manjaro" 
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/manjaro/boot/i686/manjaro misolabel=TA misobasedir=/!/$JustISOName/manjaro" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\manjaro\boot\i686\manjaroiso"  
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/manjaro/boot/i686/manjaroiso misolabel=TA misobasedir=/!/$JustISOName/manjaro" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf}   
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\manjaro\boot\i686\manjaro.img"  
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/manjaro/boot/i686/manjaro.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}   
   
; Manjaro x86_64
   ${If} ${FileExists} "$BDir\!\$JustISOName\manjaro\boot\x86_64\manjaro"  
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/manjaro/boot/x86_64/manjaro misolabel=TA misobasedir=/!/$JustISOName/manjaro" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
   ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\manjaro\boot\x86_64\manjaroiso"  
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/manjaro/boot/x86_64/manjaroiso misolabel=TA misobasedir=/!/$JustISOName/manjaro" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf}      
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\manjaro\boot\x86_64\manjaro.img"    
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/manjaro/boot/x86_64/manjaro.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}   
 
   ${If} ${FileExists} "$BDir\!\$JustISOName\.miso"     
   CopyFiles "$BDir\!\$JustISOName\.miso" "$BDir"
   ${EndIf}     

; Slax
   ${If} ${FileExists} "$BDir\!\$JustISOName\slax\boot\syslinux.cfg"  
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/slax/boot/vmlinuz from=/!/$JustISOName/slax changes=/!/$JustISOName/slax load_ramdisk=1 prompt_ramdisk=0 rw printk.time=0 slax.flags=perch,xmode" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/slax/boot/initrfs.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf}   
   
; Porteus
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\syslinux\porteus.cfg"  
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/syslinux/vmlinuz from=/!/$JustISOName" "all" "all" "$BDir\!\$JustISOName\grub.cfg" ;eventually use changes=/!/$JustISOName/changes.dat
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/syslinux/initrd.xz" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}
   
; Rescutux   
   ${If} ${FileExists} "$BDir\!\$JustISOName\live\vmlinuz1"     
   ${AndIf} $GrubConfigFile != "NULL"    
   !insertmacro கோப்பில்மாற்று "/live/vmlinuz1" "VMLSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
   !insertmacro கோப்பில்மாற்று "VMLSLUG" "/!/$JustISOName/live/vmlinuz1 live-media-path=/!/$JustISOName/live" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\live\initrd1.img" 
   !insertmacro கோப்பில்மாற்று "/live/initrd1.img" "INITSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
   !insertmacro கோப்பில்மாற்று "INITSLUG" "/!/$JustISOName/live/initrd1.img" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
   ${EndIf}   
   
; RIPLinux 
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\kernel32"     
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/kernel32 from=/!/$JustISOName root=/dev/ram0 rw" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\rootfs.cgz"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/rootfs.cgz$\r$\n}$\r$\n#MENUSLUG" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\kernel64"      
   !insertmacro கோப்பில்மாற்று "#MENUSLUG" "menuentry '64bit - $JustISOName' {$\r$\nlinux /!/$JustISOName/boot/kernel64 from=/!/$JustISOName root=/dev/ram0 rw$\r$\ninitrd /!/$JustISOName/boot/rootfs.cgz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
   !insertmacro கோப்பில்மாற்று "set timeout=0" "set timeout=20" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
   !insertmacro கோப்பில்மாற்று "set TIMEOUT_STYLE=hidden" "#set TIMEOUT_STYLE=hidden" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf}
   
/* ; Trinity Rescue Kit 
   ${If} ${FileExists} "$BDir\!\$JustISOName\kernel.trk"     
   ${AndIf} $GrubConfigFile == "NULL"    
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/kernel.trk from=/!/$JustISOName vollabel=TA ramdisk_size=65536 root=/dev/ram0 splash=verbose pci=conf1 trkmenu" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\initrd.trk"  
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.trk$\r$\n}$\r$\n#MENUSLUG" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\trk3\trkramfs" 
   CopyFiles "$BDir\!\$JustISOName\trk3\*.*" "$BDir\trk3\" ; Move trk3 to root, so we can boot!
   RMDir /R "$BDir\!\$JustISOName\trk3"
   ${EndIf}    */
  
; Knoppix 
   ${If} ${FileExists} "$BDir\!\$JustISOName\KNOPPIX\KNOPPIX" 
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/isolinux/linux knoppix_dir=/!/$JustISOName/KNOPPIX noprompt mem=800M" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/isolinux/minirt.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf}  
   
; DSL   
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\isolinux\linux24"   
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/isolinux/linux24 noprompt ramdisk_size=100000 init=/etc/init lang=us apm=power-off nomce noapic BOOT_IMAGE=knoppix" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}  

   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\isolinux\minirt24.gz"  
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/isolinux/minirt24.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf}      
   
; Mandriva/CentOS
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\isolinux.cfg"
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\LiveOS\*.*"   
   ${If} $GrubConfigFile == "NULL" 
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/isolinux/vmlinuz0 root=live:LABEL=TA live_dir=/!/$JustISOName/LiveOS" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/isolinux/initrd0.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"    
   ${ElseIf} $GrubConfigFile != "NULL" 
   !insertmacro கோப்பில்மாற்று "root=live:LABEL=Cent" "root=live:LABEL=TA live_dir=/!/$JustISOName/LiveOS NULL=" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "isolinux/vmlin" "!/$JustISOName/isolinux/vmlin" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "isolinux/init" "!/$JustISOName/isolinux/init" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"      
   !insertmacro கோப்பில்மாற்று "set default=$\"1$\"" "set default=$\"0$\"" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"      
   !insertmacro கோப்பில்மாற்று "linuxefi" "linux" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "initrdefi" "initrd" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   ${EndIf} 
   ${EndIf}
   
; CentOS Installer
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\isolinux.cfg"
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\LiveOS\*.*"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\images\pxeboot\*.*"
   ${AndIf} $GrubConfigFile != "NULL" 
   !insertmacro கோப்பில்மாற்று "images/pxeboot/vmlin" "!/$JustISOName/isolinux/vmlin" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   !insertmacro கோப்பில்மாற்று "images/pxeboot/init" "!/$JustISOName/isolinux/init" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"         
   !insertmacro கோப்பில்மாற்று "inst.stage2=hd:LABEL=Cent" "inst.stage2=hd:LABEL=TA root=live:LABEL=TA live_dir=/!/$JustISOName/LiveOS NULL=" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
   ${EndIf}  

; Mageia
   ${If} ${FileExists} "$BDir\!\$JustISOName\isolinux\isolinux.cfg"
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\loopbacks\distrib-lzma.sqfs"   
   !insertmacro கோப்பில்மாற்று "root=mgalive:LABEL=Mageia" "root=mgalive:LABEL=TA NULL=Mageia" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
   ${EndIf}        
   
; SlitaZ
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\bzImage"
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\*slitaz" 
   ${AndIfNot} ${FileExists} "$BDir\!\$JustISOName\boot\isolinux\ophcrack.cfg"
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/bzImage root=/dev/null rw autologin" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}    
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\rootfs4.gz" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\rootfs3.gz"  
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\rootfs2.gz" 
   ${AndIf} ${FileExists} "$BDir\!\$JustISOName\boot\rootfs1.gz"   
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/rootfs4.gz /!/$JustISOName/boot/rootfs3.gz /!/$JustISOName/boot/rootfs2.gz /!/$JustISOName/boot/rootfs1.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf}  
   
; Ophcrack
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\isolinux\ophcrack.cfg"
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/boot/bzImage root=/dev/null rw lang=en_US kmap=us autologin" "all" "all" "$BDir\!\$JustISOName\grub.cfg" 
   ${EndIf}  
   
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\rootfs.gz" 
   ${AndIf} $GrubConfigFile == "NULL"     
   !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/boot/rootfs.gz" "all" "all" "$BDir\!\$JustISOName\grub.cfg"  
   ${EndIf}    

   ${If} ${FileExists} "$BDir\!\$JustISOName\bzImage"     
    ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$CopyPath\live.cfg" 
   ${AndIf} $GrubConfigFile == "NULL"  	
    !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/bzImage root=/dev/ram0 rw" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
    !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf} 
   ${If} ${FileExists} "$BDir\!\$JustISOName\bzImage"     
    ${AndIf} ${FileExists} "$BDir\!\$JustISOName\$CopyPath\isolinux.cfg"  
   ${AndIf} $GrubConfigFile == "NULL"  	
    !insertmacro கோப்பில்மாற்று "linux /SLUG" "linux /!/$JustISOName/bzImage root=/dev/ram0 rw" "all" "all" "$BDir\!\$JustISOName\grub.cfg"
    !insertmacro கோப்பில்மாற்று "initrd /SLUG" "initrd /!/$JustISOName/initrd.img" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf} 
 
; ESET SysRescue Live
   ${If} ${FileExists} "$BDir\!\$JustISOName\eset-favicon.ico" 
   !insertmacro கோப்பில்மாற்று "live-media=/dev/disk/by-label/eSysRescueLiveCD" " " "all" "all" "$BDir\!\$JustISOName\$CopyPath\txt.cfg"   
   !insertmacro கோப்பில்மாற்று "/dev/disk/by-label/eSysRescueLiveCD" "/dev/disk/by-label/TA" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"   
   ${EndIf}  

; RIP Linux
   ${If} ${FileExists} "$BDir\!\$JustISOName\BOOT\DOC\RIPLINUX.TXT" 
   !insertmacro கோப்பில்மாற்று "F1 /boot" "F1 /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"
   !insertmacro கோப்பில்மாற்று "F2 /boot" "F1 /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"
   !insertmacro கோப்பில்மாற்று "F3 /boot" "F1 /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"
   !insertmacro கோப்பில்மாற்று "KERNEL /boot" "KERNEL /!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"
   !insertmacro கோப்பில்மாற்று "initrd=/boot" "initrd=/!/$JustISOName/boot" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"     
   ${EndIf}  
  
 ${EndIf} 
; End Catch All Install Methods
  
; Start Distro Specific 

; Parted Magic
 ${If} $DistroName == "Parted Magic (Partition Tools)" 
  !insertmacro கோப்பில்மாற்று "/EFI/boot/grub.cfg" "/!/$JustISOName/EFI/boot/grub.cfg" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"  
  !insertmacro கோப்பில்மாற்று "/pmagic/fu.img" "/!/$JustISOName/pmagic/fu.img" "all" "all" "$BDir\!\$JustISOName\EFI\boot\grub.cfg" 
  !insertmacro கோப்பில்மாற்று "/pmagic/m32.img" "/!/$JustISOName/pmagic/m32.img" "all" "all" "$BDir\!\$JustISOName\EFI\boot\grub.cfg"   
  !insertmacro கோப்பில்மாற்று "/pmagic/m64.img" "/!/$JustISOName/pmagic/m64.img" "all" "all" "$BDir\!\$JustISOName\EFI\boot\grub.cfg"    
  !insertmacro கோப்பில்மாற்று "/pmagic/bzIma" "/!/$JustISOName/pmagic/bzIma" "all" "all" "$BDir\!\$JustISOName\EFI\boot\grub.cfg" 
  !insertmacro கோப்பில்மாற்று "/pmagic/initrd.img" "/!/$JustISOName/pmagic/initrd.img" "all" "all" "$BDir\!\$JustISOName\EFI\boot\grub.cfg" 
  !insertmacro கோப்பில்மாற்று "/EFI/boot/" "/!/$JustISOName/EFI/boot/" "all" "all" "$BDir\!\$JustISOName\EFI\boot\grub.cfg"
  !insertmacro கோப்பில்மாற்று "vga=normal" "directory=/!/$JustISOName" "all" "all" "$BDir\!\$JustISOName\EFI\boot\grub.cfg"
  
  !insertmacro கோப்பில்மாற்று "/pmagic/fu.img" "/!/$JustISOName/pmagic/fu.img" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg" 
  !insertmacro கோப்பில்மாற்று "/pmagic/m32.img" "/!/$JustISOName/pmagic/m32.img" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"   
  !insertmacro கோப்பில்மாற்று "/pmagic/m64.img" "/!/$JustISOName/pmagic/m64.img" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"    
  !insertmacro கோப்பில்மாற்று "/pmagic/bzIma" "/!/$JustISOName/pmagic/bzIma" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg" 
  !insertmacro கோப்பில்மாற்று "/pmagic/initrd.img" "/!/$JustISOName/pmagic/initrd.img" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg" 
  !insertmacro கோப்பில்மாற்று "/EFI/boot/" "/!/$JustISOName/EFI/boot/" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"
  !insertmacro கோப்பில்மாற்று "vga=normal" "directory=/!/$JustISOName" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"

; System Rescue CD
 ${ElseIf} $DistroName == "System Rescue CD" 
  !insertmacro கோப்பில்மாற்று "/isolinux/rescue64" "/!/$JustISOName/isolinux/SLUGrescue subdir=!/$JustISOName" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
  !insertmacro கோப்பில்மாற்று "SLUGrescue" "rescue64" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"
  !insertmacro கோப்பில்மாற்று "/isolinux/altker64" "/!/$JustISOName/isolinux/SLUGaltker subdir=!/$JustISOName" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"    
  !insertmacro கோப்பில்மாற்று "SLUGaltker" "altker64" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"     
  !insertmacro கோப்பில்மாற்று "/isolinux/initram.igz" "/!/$JustISOName/isolinux/initramSLUG" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "initramSLUG" "initram.igz" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"  
  
  !insertmacro கோப்பில்மாற்று "/sysresccd/boot/" "/!/$JustISOName/SLUGGER/boot/" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "SLUGGER" "sysresccd" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "archisolabel=SYSRCD" "archisolabel=TA NULL=" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile" 
  !insertmacro கோப்பில்மாற்று "archisolabel=RESC" "archisolabel=TA NULL=" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"   
  !insertmacro கோப்பில்மாற்று "archisobasedir=sys" "archisobasedir=/!/$JustISOName/sysresccd NULL=" "all" "all" "$BDir\!\$JustISOName\$GrubCopyPath\$GrubConfigFile"
  
; Xiaopan 
  ${ElseIf} $DistroName == "Xiaopan (Penetration Testing)"   
  CopyFiles "$BDir\!\$JustISOName\cde\*.*" "$BDir\cde\" ;(quick hack until a cde bootcode/cheatcode is made upstream from tinyCore)
  CopyFiles "$BDir\!\$JustISOName\mydata.tgz" "$BDir\mydata.tgz"
  !insertmacro கோப்பில்மாற்று "MENU BACKGROUND /boot/isolinux/splash.jpg" "MENU BACKGROUND /!/$JustISOName/boot/isolinux/splash.jpg" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"
  !insertmacro கோப்பில்மாற்று "MENU BACKGROUND /boot/isolinux/splash.jpg" "MENU BACKGROUND /!/$JustISOName/boot/isolinux/splash.jpg" "all" "all" "$BDir\!\$JustISOName\$CopyPath\$ConfigFile"
  
; Ophcrack
 ${ElseIf} ${FileExists} "$BDir\!\$JustISOName\$CopyPath\ophcrack.cfg"  
  CopyFiles "$BDir\!\$JustISOName\tables\*.*" "$BDir\tables\"
  RMDir /R "$BDir\!\$JustISOName\tables"  
 ${EndIf} 
 
; OpenSuse/BlehOS  
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\i386\loader\isolinux.cfg"       
   !insertmacro கோப்பில்மாற்று "ui gfxboot" "#ui NULL gfxboot" "all" "all" "$BDir\!\$JustISOName\boot\i386\loader\isolinux.cfg"     
  ${EndIf}   
  
; For OpenSuSe like compilations!
 ${If} ${FileExists} "$BDir\!\$JustISOName\boot\grub\mbrid" 
  StrCpy $ConfigFile == "syslinux.cfg" ; Make sure it isn't NULL  
  StrCpy $SUSEDIR "$JustISOName" 
  Call MBRID  
 ${EndIf}   

; Enable Casper  
  ${If} $Persistence == "casper" ; Casper
  ${AndIf} $Casper != "0" ; Casper Slider (Size) was not Null
  ; Add Boot Code Persistent
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\grub\loopback.cfg" ; Rename the following for grub loopback.cfg
   !insertmacro கோப்பில்மாற்று "cdrom-detect/try-usb=true noprompt" "cdrom-detect/try-usb=true persistent persistent-path=/!/$JustISOName noprompt" "all" "all" "$BDir\!\$JustISOName\boot\grub\loopback.cfg"  
   ${EndIf}
   ${If} ${FileExists} "$BDir\!\$JustISOName\boot\grub\grub.cfg" ; Rename the following for grub.cfg
   !insertmacro கோப்பில்மாற்று "cdrom-detect/try-usb=true noprompt" "cdrom-detect/try-usb=true persistent persistent-path=/!/$JustISOName noprompt" "all" "all" "$BDir\!\$JustISOName\boot\grub\grub.cfg"   
   ${EndIf} 
   ${If} ${FileExists} "$BDir\!\$JustISOName\grub.cfg" ; Rename the following for grub.cfg ubuntu based
   !insertmacro கோப்பில்மாற்று "boot=casper noprompt" "boot=casper persistent persistent-path=/!/$JustISOName noprompt" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf}   
   ${If} ${FileExists} "$BDir\!\$JustISOName\grub.cfg" ; Rename the following for grub.cfg debian based
   !insertmacro கோப்பில்மாற்று "boot=live noprompt" "boot=live persistent persistent-path=/!/$JustISOName noprompt" "all" "all" "$BDir\!\$JustISOName\grub.cfg"   
   ${EndIf}    
; Create Casper-rw file
   Call CasperScript  
  ${EndIf}
 
Call WriteStuff

!macroend