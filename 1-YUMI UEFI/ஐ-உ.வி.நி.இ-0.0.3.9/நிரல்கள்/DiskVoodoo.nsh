
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
 Rename "$BDir\!\$SUSEDIR\boot\grub\mbrid" "$BDir\!\$SUSEDIR\boot\grub\old-mbrid"
 ${Write2mbrid} "$OnlyVal" $R0
FunctionEnd

 Function இயற்பியக்கி
 StrCpy $1 "$JustDrive"
 Push $1
 Call வன்வட்டுஎண்  
 StrCpy $DiskNum $0
 FunctionEnd

; WriteToFile Function originally written by Afrow UK http://nsis.sourceforge.net/Simple_write_text_to_file, modified to populate .cfg file with what the user chose!
Function Write2mbrid
 Exch $R0 ;file to write to
 Exch
 Exch $1 ;text to write
 FileOpen $R0 '$BDir\!\$SUSEDIR\boot\grub\mbrid' a  ;FileOpen $R0 '$BDir\!\menu\$DistroPath' a 
 FileSeek $R0 0 END
 FileWrite $R0 '$1'
 FileClose $R0
 Pop $1
 Pop $R0
FunctionEnd

; Get hard disk number from drive letter
; provided as a parameter to this function.
; The hard disk number is returned in $0.
Function வன்வட்டுஎண்
  ; Save registers
  Exch $1
  Push $2
  Push $3
  Push $4
  Push $5
  Push $6
  Push $7
  ; Get volume name associated with drive letter
  System::Call "kernel32::GetVolumeNameForVolumeMountPoint(t r1, t r3r3, i ${MAXLEN_VOLUME_GUID}) i.r2"
  ${If} $2 != 0
     ; Get handle of volume
     StrCpy $3 $3 -1
     System::Call "kernel32::CreateFile(t r3, \\
       i ${GENERIC_READ}|${GENERIC_WRITE}, \\
       i ${FILE_SHARE_READ}|${FILE_SHARE_WRITE}, \\
       i 0, i ${OPEN_EXISTING}, i 0, i 0) i.r2"
     ${If} $2 != ${INVALID_HANDLE_VALUE}
        ; Allocate output buffer
        System::Alloc ${EXTENTS_BUFFER_SIZE}
        Pop $4
        IntOp $5 0 + 0
        ; Send IOCTL_VOLUME_GET_VOLUME_DISK_EXTENTS command
        System::Call "kernel32::DeviceIoControl(i r2, \\
            i ${IOCTL_VOLUME_GET_VOLUME_DISK_EXTENTS}, \\
            i 0, i 0, \\
            i r4, i ${EXTENTS_BUFFER_SIZE}, \\
            *i r5r5, i 0) i.r3"
        ${If} $3 != 0
           ; Extract HDD number
           System::Call "*$4(i .r5, i, i .r0)"
           ${If} $5 == 0
               StrCpy $0 "Error: Invalid DISK_EXTENT data"
           ${EndIf}
        ${Else}
           StrCpy $0 "Error: DeviceIoControl failed"
        ${EndIf}
        System::Free $4
        System::Call "kernel32::CloseHandle(i r2) i.r3"
     ${Else}
        StrCpy $0 "Error: CreateFile failed for $3"
     ${EndIf}
  ${Else}
    StrCpy $0 "Error: GetVolumeNameForVolumeMountPoint failed for $1"
  ${EndIf}
  ; Restore registers
  Pop $7
  Pop $6
  Pop $5
  Pop $4
  Pop $3
  Pop $2
  Pop $1
FunctionEnd
