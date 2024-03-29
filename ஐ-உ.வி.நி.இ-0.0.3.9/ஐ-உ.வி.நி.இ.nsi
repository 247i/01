﻿!define பெயர் "ஐ-உ.வி.நி.இ"
!define பதிப்பு "0.0.3.9"
;!execute '..\பொது-இருமங்கள்\அகர.bat' ; zip if required.
;!execute '"$%WINDIR%\notepad.exe" /P "${NSISDIR}\COPYING"' ; Enable this to debug previous line.
; பொதுவாக பயன்படுத்தும் நிரல்கள்
!include ..\பொது-துணைநிரல்கள்\தலைப்பு.நிரல்
!include ..\பொது-துணைநிரல்கள்\மாறிகள்.நிரல்
!include ..\பொது-துணைநிரல்கள்\பக்கங்கள்.நிரல்
!include  ..\பொது-துணைநிரல்கள்\இணைப்பு.நிரல்
!include ..\பொது-துணைநிரல்கள்\பதிவிறக்கஇணைப்பு.நிரல்
!include ..\பொது-துணைநிரல்கள்\தகவல்.நிரல்
!include WinVer.nsh
;!include TextFunc.nsh
!include ..\பொது-துணைநிரல்கள்\ஒருங்குறிஉரை.நிரல்
!include ..\பொது-துணைநிரல்கள்\கோப்பில்மாற்று.நிரல்
!include ..\பொது-துணைநிரல்கள்\வட்டுபொதுஉரை-மாறிலி.நிரல்
!include நிரல்கள்\DiskVoodoo.nsh ;துவக்கதட்டுஉரை.நிரல்
!include ..\பொது-துணைநிரல்கள்\ஒழுங்கமை.நிரல்
!include நிரல்கள்\FileManipulation.nsh ; Text File Manipulation - கோப்புதிருத்தி.நிரல் 
!include நிரல்கள்\FileNames.nsh ; Macro for FileNames
!include நிரல்கள்\விநியோகபட்டியல்.நிரல் ; List of Distributions
!include ..\பொது-துணைநிரல்கள்\சரம்கொண்டுள்ளது.நிரல் ; Let's check if a * wildcard exists
!include ..\பொது-துணைநிரல்கள்\தவமுன்னேற்றம்.நிரல் ; நிலைத்தன்மை கோப்பை உருவாக்குதல் முன்னேற்றம்
!include "நிரல்கள்\புதையல்உரை.நிரல்" ; For creation of Persistent Casper-rw files
!include ..\பொது-துணைநிரல்கள்\புதைகருவிகளைப்பெறு.நிரல்

Function தேர்வுகள்பக்கம்
  StrCpy $R8 2
 !insertmacro MUI_HEADER_TEXT $(SelectDist_Title) $(SelectDist_Subtitle) 
  nsDialogs::Create 1018
  Pop $Dialog 

 ${If} $RepeatInstall == "YES"   
 ${NSD_SetText} $DestDriveTxt "$DestDrive"

; To Install or Uninstall? That is the question!  
  ${NSD_CreateCheckBox} 60% 0 44% 15 "View or Remove Installed Distros?"
  Pop $Uninstaller
  ${NSD_OnClick} $Uninstaller Uninstall  

 ; Distro Selection Starts
  ${NSD_CreateLabel} 0 50 50% 15 $(Distro_Text) 
  Pop $LinuxDistroSelection   

  ${NSD_CreateDroplist} 0 70 55% 95 "" ; was  ${NSD_CreateListBox} ; Enable For DropBox
  Pop $Distro
  ${NSD_OnChange} $Distro OnSelectDistro
  ${NSD_CB_SelectString} $Distro $DistroName ; Was ${NSD_LB_SelectString} $Distro $DistroName  ; Enable For DropBox 
  
; Force Show All ISO Option
  ${NSD_CreateCheckBox} 80% 100 20% 15 "Show All?"
  Pop $ForceShowAll
  ${NSD_OnClick} $ForceShowAll ShowAllISOs   

; ISO Download Option
  ${NSD_CreateCheckBox} 60% 60 40% 15 "Download the ISO (Optional)."
  Pop $DownloadISO
  ${NSD_OnClick} $DownloadISO இதைபதிவிறக்கு  
  
; Clickable Link to Distribution Homepage  
  ${NSD_CreateLink} 60% 80 40% 15 "Visit the $OfficialName HomePage"
  Pop $DistroLink
  ${NSD_OnClick} $DistroLink லினக்சுதளசொடுக்த்தில்    

; ISO Selection Starts  
  ${NSD_CreateLabel} 0 100 100% 15 $(IsoPage_Text)
  Pop $LabelISOSelection
  ${NSD_CreateText} 0 120 78% 20 "Browse to and select the $FileFormat"
  Pop $ISOFileTxt 
  ${NSD_CreateBrowseButton} 85% 120 60 20 "Browse"
  Pop $ISOSelection 
  ${NSD_OnClick} $ISOSelection ISOBrowse   
  
; Casper-RW Selection Starts
  ${NSD_CreateLabel} 0 150 75% 15 $(Casper_Text)
  Pop $CasperSelection  

  ${NSD_CreateLabel} 52% 178 25% 25 ""
  Pop $SlideSpot  

  nsDialogs::CreateControl "msctls_trackbar32" "0x50010000|0x00000018" "" 0 174 50% 25 ""
  Pop $CasperSlider

  SendMessage $CasperSlider ${TBM_SETRANGEMIN} 1 0 ; Min Range Value 0
  SendMessage $CasperSlider ${TBM_SETRANGEMAX} 1 $RemainingSpace ; Max Range Value $RemainingSpace
  ${NSD_OnNotify} $CasperSlider புதையல்நிலைமாற்றிஅறிவிப்பதில்    

; Drive Pre-Selection  
  ${NSD_CreateLabel} 0 0 58% 15 "" ; was 58%
  Pop $LabelDrivePage 
  ${NSD_SetText} $LabelDrivePage "Step 1: I Summoned $DestDisk as your USB Device"  
; Droplist for Drive Selection  
  ${NSD_CreateDropList} 0 20 55% 15 "" 
  Pop $DestDriveTxt 
 
  ${GetDrives} "FDD+HDD" DrivesList ; displaying all media detected as Local Drive or USB Drive 
  
  ${NSD_CB_SelectString} $DestDriveTxt "$DestDrive"
  StrCpy $JustDrive $DestDrive 3
  StrCpy $BDir $DestDrive 2 ;was -1 
  StrCpy $DestDisk $DestDrive 2 ;was -1
  SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new drive may have been chosen ; Enable for DropBox
  StrCpy $Checker "Yes"  
  Call InstallorRemove
  Call SetSpace
  Call CheckSpace
  Call FormatIt 
  Call EnableNext 
  ${NSD_OnChange} $DestDriveTxt OnSelectDrive 

; Add Home Link
  ${NSD_CreateLink} 0 215 16% 15 "Home Page"
  Pop $Link
  ${NSD_OnClick} $LINK என்தளசொடுக்த்தில்    
  
; Add Help Link
  ${NSD_CreateLink} 16% 215 9% 15 "FAQ"
  Pop $Link1
  ${NSD_OnClick} $LINK1 அகேகேதளசொடுக்த்தில் 
  
; Add Giveback Link
  ${NSD_CreateLink} 25% 215 30% 15 "Recommended Flash Drives"
  Pop $Link2
  ${NSD_OnClick} $LINK2 என்உதொபேதளசொடுக்த்தில்   
 
; Disable Next Button until a selection is made for all 
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0 
; Remove Back Button
  GetDlgItem $6 $HWNDPARENT 3
  ShowWindow $6 0 
; Hide or disable steps until we state to display them 
  EnableWindow $LabelISOSelection 0
  EnableWindow $ISOFileTxt 0
  ShowWindow $ISOSelection 0
  EnableWindow $DownloadISO 0
  ShowWindow $DistroLink 0
  StrCpy $JustISOName "NULL" ; Set to NULL until something is selected
  nsDialogs::Show  
  
 ${Else}
  
; To Install or Uninstall? That is the question!  
  ${NSD_CreateCheckBox} 60% 0 44% 15 "View or Remove Installed Distros?"
  Pop $Uninstaller
  ${NSD_OnClick} $Uninstaller Uninstall  
  
; Drive Selection Starts  
  ${NSD_CreateLabel} 0 0 58% 15 ""    
  Pop $LabelDrivePage
  ${NSD_SetText} $LabelDrivePage "Step 1: Select the Drive Letter of your USB Device."    
  
; Droplist for Drive Selection
  ${NSD_CreateDropList} 0 20 55% 15 "" 
  Pop $DestDriveTxt
  Call ListAllDrives
  ${NSD_OnChange} $DestDriveTxt OnSelectDrive
 
 ${If} ${AtLeastWin8} ; checkpoint to test if is => Windows 8 to support Diskpart on removable disks.  
; Format Drive Option
  ${NSD_CreateCheckBox} 60% 23 100% 15 "Wipe (Disk $DiskNum) and Fat32 Format $DestDisk"
  Pop $Format
  ${NSD_OnClick} $Format FormatIt  
 ${EndIf}  
 
; Distro Selection Starts
  ${NSD_CreateLabel} 0 50 50% 15 $(Distro_Text) 
  Pop $LinuxDistroSelection   

  ${NSD_CreateDropList} 0 70 55% 95 "" ; was ${NSD_CreateListBox} ; Enable for Dropbox
  Pop $Distro
  ${NSD_OnChange} $Distro OnSelectDistro
  ${NSD_CB_SelectString} $Distro $DistroName ; Was ${NSD_LB_SelectString} $Distro $DistroName  ; Enable For DropBox
  
; Force Show All ISO Option
  ${NSD_CreateCheckBox} 80% 100 20% 15 "Show All?"
  Pop $ForceShowAll
  ${NSD_OnClick} $ForceShowAll ShowAllISOs    

; ISO Download Option
  ${NSD_CreateCheckBox} 60% 60 40% 15 "Download the ISO (Optional)."
  Pop $DownloadISO
  ${NSD_OnClick} $DownloadISO இதைபதிவிறக்கு  
  
; Clickable Link to Distribution Homepage  
  ${NSD_CreateLink} 60% 80 40% 15 "Visit the $OfficialName HomePage"
  Pop $DistroLink
  ${NSD_OnClick} $DistroLink லினக்சுதளசொடுக்த்தில்    

; ISO Selection Starts  
  ${NSD_CreateLabel} 0 100 100% 15 $(IsoPage_Text)
  Pop $LabelISOSelection
  ${NSD_CreateText} 0 120 78% 20 "Browse to and select the $FileFormat"
  Pop $ISOFileTxt 
  ${NSD_CreateBrowseButton} 85% 120 60 20 "Browse"
  Pop $ISOSelection 
  ${NSD_OnClick} $ISOSelection ISOBrowse

; Casper-RW Selection Starts
  ${NSD_CreateLabel} 0 150 75% 15 $(Casper_Text)
  Pop $CasperSelection 

  ${NSD_CreateLabel} 52% 178 25% 25 ""
  Pop $SlideSpot  

  nsDialogs::CreateControl "msctls_trackbar32" "0x50010000|0x00000018" "" 0 174 50% 25 ""
  Pop $CasperSlider

  SendMessage $CasperSlider ${TBM_SETRANGEMIN} 1 0 ; Min Range Value 0
  SendMessage $CasperSlider ${TBM_SETRANGEMAX} 1 $RemainingSpace ; Max Range Value $RemainingSpace
  ${NSD_OnNotify} $CasperSlider புதையல்நிலைமாற்றிஅறிவிப்பதில்    

; Add Home Link
  ${NSD_CreateLink} 0 215 16% 15 "Home Page"
  Pop $Link
  ${NSD_OnClick} $LINK என்தளசொடுக்த்தில்    
  
; Add Help Link
  ${NSD_CreateLink} 16% 215 9% 15 "FAQ"
  Pop $Link1
  ${NSD_OnClick} $LINK1 அகேகேதளசொடுக்த்தில் 
  
; Add Giveback Link
  ${NSD_CreateLink} 25% 215 30% 15 "Recommended Flash Drives"
  Pop $Link2
  ${NSD_OnClick} $LINK2 என்உதொபேதளசொடுக்த்தில் 

;; Add a custom donate button
;   ${NSD_CreateBitmap} 80% 125 20% 50 "PayPal Donation"
;   Var /Global Donate
;   Var /Global DonateHandle  
;   Pop $Donate
;   ${NSD_SetImage} $Donate $PLUGINSDIR\paypal.bmp $DonateHandle 
;  GetFunctionAddress $DonateHandle OnClickDonate
;  nsDialogs::OnClick $Donate $DonateHandle  
  
; Disable Next Button until a selection is made for all 
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0 
; Remove Back Button
  GetDlgItem $6 $HWNDPARENT 3
  ShowWindow $6 0 
; Hide or disable steps until we state to display them 
  EnableWindow $LabelISOSelection 0
  EnableWindow $ISOFileTxt 0
  ShowWindow $ISOSelection 0
  EnableWindow $LinuxDistroSelection 0
  EnableWindow $Distro 0
  EnableWindow $DownloadISO 0
  ShowWindow $DistroLink 0
  ShowWindow $CasperSelection 0 
  ShowWindow $CasperSlider 0 
  ShowWindow $SlideSpot 0  
  ShowWindow $Format 0
  ShowWindow $ForceShowAll 0
  ShowWindow $Uninstaller 0
  nsDialogs::Show 
 ${EndIf}
FunctionEnd

Function ListAllDrives ; Set to Display All Drives
  SendMessage $DestDriveTxt ${CB_RESETCONTENT} 0 0 
  ${GetDrives} "FDD+HDD" DrivesList
FunctionEnd

Function EnableNext ; Enable Install Button
  #${If} $Blocksize >= 4 
  ${If} $Removal != "Yes"
  ShowWindow $Format 1 
  ${Else}
  ShowWindow $Format 0
  ${EndIf}
  ${If} $Removal != "Yes"    
   ${AndIf} $ISOFileName != ""
    ${AndIf} $ISOFile != ""
     ${AndIf} $DestDrive != "" 
	  ${AndIf} $ISOTest != ""
  StrCpy $InUnStall "Add"	
   StrCpy $InUnStalling "Adding"	
    StrCpy $InUnStalled "Added"	
  StrCpy $OnFrom "to"
  StrCpy $InUnName "$JustISOName"  
  GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
   SendMessage $6 ${WM_SETTEXT} 0 "STR:Create"
    EnableWindow $6 1 ; Enable "Install" control button

  ${ElseIf} $Removal == "Yes"
   ${AndIf} $ISOFileName != ""
     ${AndIf} $DestDrive != "" 
	  ${AndIf} $ISOTest != ""
  StrCpy $InUnStall "Remove"	
   StrCpy $InUnStalling "Removing"	
    StrCpy $InUnStalled "Removed"	  
  StrCpy $OnFrom "from"	
  StrCpy $InUnName "$DistroName"
  GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
   SendMessage $6 ${WM_SETTEXT} 0 "STR:Remove"
    EnableWindow $6 1 ; Enable "Install" control button
  ${EndIf}
  
; Test if ISO has been Selected. If not, disable Install Button
  ${If} $ISOTest == ""
  GetDlgItem $6 $HWNDPARENT 1
  EnableWindow $6 0 ; Disable "Install" if ISO not set 
  ${EndIf}
  
; Show Steps in progression
  ${If} $DestDrive != ""  
  EnableWindow $LinuxDistroSelection 1
  EnableWindow $Distro 1
  ${EndIf}  
  
  ${If} $ISOFileName != "" 
  ${AndIf} $Removal != "Yes"
  EnableWindow $LabelISOSelection 1 
  EnableWindow $ISOFileTxt 1  
  ShowWindow $ISOSelection 1
  
  ${AndIf} $Removal == "Yes"
  EnableWindow $LabelISOSelection 0  
  EnableWindow $ISOFileTxt 0 
  ShowWindow $ISOSelection 0
  ${EndIf}  
  
; Disable Window if ISO was downloaded
  ${If} $TheISO == "$EXEDIR\$ISOFileName"
  ${AndIf} $ISOTest != ""  
  EnableWindow $ISOSelection 0
  SetCtlColors $ISOFileTxt 009900 FFFFFF  
  ${EndIf}

; If using Casper Persistence...  
  ${If} $Persistence == "casper" ; If can use Casper Persistence... 
  ${AndIf} $TheISO != ""
  ${AndIf} $BDir != "" 
  ShowWindow $CasperSelection 1
  ShowWindow $CasperSlider 1
  ShowWindow $SlideSpot 1
  ;${NSD_SetText} $Format "Format $JustDrive Drive (Erases Content)"  
	
; Else If not using Casper Persistence...  
  ${ElseIf} $Persistence != "casper" ; Eventually change to "NULL"
  ${OrIf} $Removal == "Yes"  
  ShowWindow $CasperSelection 0
  ShowWindow $CasperSlider 0 
  ShowWindow $SlideSpot 0
  ;${NSD_SetText} $Format "Format $JustDrive Drive (Erases Content)" 
  ${EndIf}    
FunctionEnd

; On Selection of Linux Distro
Function OnSelectDistro
  Pop $Distro
  
  ${If} $Removal == "Yes"
   ShowWindow $ForceShowAll 0
  ${Else}
   ShowWindow $ForceShowAll 1
  ${EndIf}
  
  ${NSD_GetText} $Distro $DistroName ; Was ${NSD_LB_GetSelection} $Distro $DistroName 
  StrCpy $DistroName "$DistroName"   
  StrCpy $Checker "No" 
  ${If} $Removal == "Yes"
  StrCpy $ISOFileName "$DistroName" 
  StrCpy $ISOTest "$DistroName"  
  ${Else} 
  Call SetISOFileName
  StrCpy $ISOFileName "$ISOFileName" 
  StrCpy $SomeFileExt "$ISOFileName" "" -3 ; Grabs the last 3 characters of the file name... zip or iso?
  StrCpy $FileFormat "$SomeFileExt" ; Set file type to look for zip, tar, iso etc...
  ${NSD_SetText} $LabelISOSelection "Step 3: Browse and Select your $ISOFileName"
  ${NSD_SetText} $ISOFileTxt "Browse to your $ISOFileName  -->"
  SetCtlColors $ISOFileTxt FF0000 FFFFFF  
  StrCpy $ISOTest "" ; Set to null until a new ISO selection is made
  ${EndIf}
  
; Redraw Home page Links as necessary
  ${NSD_SetText} $DistroLink "Visit the $OfficialName Home Page" 
  ShowWindow $DistroLink 0
  ${If} $OfficialName == ""
   ${OrIf} $Removal == "Yes"
  ShowWindow $DistroLink 0
  ${Else}
  ShowWindow $DistroLink 1
  ${EndIf}    
  
; Autodetect ISO's in same folder and select if they exist  
 ${If} ${FileExists} "$EXEDIR\$ISOFileName"
 ${AndIf} $Removal != "Yes"
 ${சரம்கொண்டுள்ளது} $WILD "*" "$ISOFileName" ; Check for Wildcard and force Browse if * exists.
 ${AndIf} $WILD != "*"  
  StrCpy $TheISO "$EXEDIR\$ISOFileName"
  StrCpy $ISOFile "$TheISO"  
  ${GetFileName} "$TheISO" $JustISO
  ${GetBaseName} "$JustISO" $JustISOName
 ${StrRep} '$JustISOName' '$JustISOName' ' ' '-'  
  ${GetParent} "$TheISO" $JustISOPath  
  EnableWindow $DownloadISO 0
  ${NSD_SetText} $DownloadISO "We Found and Selected the $SomeFileExt."    
  EnableWindow $ISOSelection 0 
  SetCtlColors $ISOFileTxt 009900 FFFFFF  
  ${NSD_SetText} $ISOFileTxt $ISOFile 
  ${NSD_SetText} $LabelISOSelection "Step 3 DONE: $ISOFileName Found and Selected!"  
  StrCpy $ISOTest "$TheISO" ; Populate ISOTest so we can enable Next    
  Call EnableNext  
  
 ${ElseIf} ${FileExists} "$EXEDIR\$ISOFileName"
 ${AndIf} $Removal != "Yes"
 ${AndIf} $WILD == "*" 
  EnableWindow $DownloadISO 1
  EnableWindow $ISOSelection 1
  ${NSD_Uncheck} $DownloadISO  
  ${NSD_SetText} $DownloadISO "Download Link"       
  SetCtlColors $ISOFileTxt FF9B00 FFFFFF  
  ${NSD_SetText} $ISOFileTxt "Browse to and select the $ISOFileName" 
  ${NSD_SetText} $LabelISOSelection "Step 3 PENDING: Browse to your $ISOFileName"    
  Call EnableNext  
  
 ${Else}
  Call EnableNext
  EnableWindow $DownloadISO 1
  EnableWindow $ISOSelection 1
  ${NSD_Uncheck} $DownloadISO  
  ${NSD_SetText} $DownloadISO "Download Link"   
 ${EndIf}  
 
 ${If} $DownLink == "NONE"
  ${OrIf} $Removal == "Yes"
  ShowWindow $DownloadISO 0
 ${Else}
  ShowWindow $DownloadISO 1
 ${EndIf}
  
FunctionEnd 

; On Selection of ISO File
Function ISOBrowse
 ${If} $ShowingAll == "Yes"
  StrCpy $ISOFileName "*.iso" 
 ${ElseIf} $ShowingAll != "Yes"
  Call SetISOFileName
 ${EndIf}
 
 nsDialogs::SelectFileDialog open "" $(IsoFile)
 Pop $TheISO  
 ${NSD_SetText} $ISOFileTxt $TheISO
 SetCtlColors $ISOFileTxt 009900 FFFFFF
 EnableWindow $DownloadISO 0
 ${NSD_SetText} $DownloadISO "Local $SomeFileExt Selected." 
 StrCpy $ISOTest "$TheISO" ; Populate ISOTest so we can enable Next 
 StrCpy $ISOFile "$TheISO" 
 ${GetFileName} "$TheISO" $JustISO
  ${StrRep} '$JustISO' '$JustISO' ' ' '-'
 ${GetBaseName} "$JustISO" $JustISOName
 ${StrRep} '$JustISOName' '$JustISOName' ' ' '-'
 ${GetParent} "$TheISO" $JustISOPath
 StrCpy $LocalSelection "Yes"
  Call உதநிஅளவைஅமை
  Call SetSpace
  Call CheckSpace
  Call HaveSpacePre
 ${If} $JustISOName == "" 
 StrCpy $JustISOName "NULL" ; Set to NULL until something is selected
 ${EndIf}
 
 ${If} ${FileExists} "$BDir\!\$JustISOName\*.*"
 ${AndIf} $JustISOName != ""
 ${AndIf} $FormatMe != "Yes"
 MessageBox MB_OK "$JustISOName is already on $DestDisk$\r$\nPlease Remove it first!"
 ${Else}
 ${EndIf}
 Call EnableNext
 ; Uncomment for Testing --> MessageBox MB_ICONQUESTION|MB_OK 'Removal: "$Removal"  ISOFileName: "$ISOFileName" ISOFile "$ISOFile" BDir: "$BDir" DestDisk: "$DestDisk" DestDrive: "$DestDrive" ISOTest: "$ISOTest"'
 FunctionEnd

Function InstallorRemove ; Populate DistroName based on Install/Removal option
  ${If} $Removal == "Yes" 
  Call RemovalList
  ${Else}
   ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution to put on $DestDisk" 
  Call SetISOFileName
  ${EndIf}
FunctionEnd  

; On Selection of Uninstaller Option
Function Uninstall
  ${NSD_GetState} $Uninstaller $Removal
  ${If} $Removal == ${BST_CHECKED}
  ShowWindow $Format 0
    ShowWindow $LabelISOSelection 0 
	Call அனைத்தும்அழி	
    EnableWindow $ISOFileTxt 0
	ShowWindow $ISOFileTxt 0
	ShowWindow $ISOSelection 0
    ShowWindow $ForceShowAll 0	
    ShowWindow $CasperSelection 0
    ShowWindow $CasperSlider 0 
    ShowWindow $SlideSpot 0	
	StrCpy $Persistence "NULL" 
	
  ${NSD_Check} $Uninstaller 
  StrCpy $Removal "Yes"
  ShowWindow $DistroLink 0
  ShowWindow $DownloadISO 0
   GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
	SendMessage $6 ${WM_SETTEXT} 0 "STR:Remove"
	EnableWindow $6 0 ; Disable "Install" control button
  ${NSD_SetText} $Uninstaller "You're in Uninstaller Mode!"
   ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution to remove from $DestDisk"  
    SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new option may have been chosen ; Enable for DropBox
     StrCpy $Checker "Yes"   
	 Call RemovalList

  ${ElseIf} $Removal == ${BST_UNCHECKED}
   ShowWindow $Format 1  
    ShowWindow $LabelISOSelection 1 
    ShowWindow $ISOFileTxt 1
	ShowWindow $ISOSelection 0
	Call அனைத்தும்அழி
    ${NSD_SetText} $LabelISOSelection "Step 3: Select your $ISOFileName"
	${NSD_SetText} $ISOFileTxt "Disabled until step 2 is complete"
     GetDlgItem $6 $HWNDPARENT 1 ; Get "Install" control handle
	  SendMessage $6 ${WM_SETTEXT} 0 "STR:Create"
	  EnableWindow $6 0 ; Disable "Install" control button
  ${NSD_Uncheck} $Uninstaller  
  StrCpy $Removal "No"  
  ${NSD_SetText} $Uninstaller "View or Remove Installed Distros?" 
   ${NSD_SetText} $LinuxDistroSelection "Step 2: Select a Distribution to put on $DestDisk" 
     SendMessage $Distro ${CB_RESETCONTENT} 0 0  ; Clear all distro entries because a new option may have been chosen ; Enable for DropBox
     StrCpy $Checker "Yes"         
     Call SetISOFileName
  ${EndIf}  
FunctionEnd

; On Selection of USB Drive
Function OnSelectDrive
  Pop $DestDriveTxt
  ${NSD_GetText} $DestDriveTxt $Letters
  StrCpy $DestDrive "$Letters"
  StrCpy $JustDrive $DestDrive 3  
  StrCpy $BDir $DestDrive 2 ;was -1 
  StrCpy $DestDisk $DestDrive 2 ;was -1

  Call இயற்பியக்கி
  Call கோமுவகைபெறு
   ${If} $FSType == "exFAT"
   ${OrIf} $FSType == "NTFS"
   MessageBox MB_ICONSTOP|MB_OK "This version of I UEFI won't work on a $FSType formatted partition. You can choose to format $JustDrive as Fat32."
  ${EndIf}

  ${If} ${FileExists} "$BDir\!\legacy-yumi"
  MessageBox MB_ICONSTOP|MB_OK "($DestDisk) contains a I Legacy installation. You'll have to reformat to use UEFI I."
  ${EndIf} 
 
  SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new drive may have been chosen ; Enable for DropBox
  StrCpy $Checker "Yes" 
  Call InstallorRemove
  Call SetSpace
  Call CheckSpace
  Call FormatIt  
  Call EnableNext
 
  ${NSD_SetText} $LabelDrivePage "Step 1: You Selected $DestDisk (Disk $DiskNum) as your USB Device"   
FunctionEnd

Function GetDiskVolumeName
;Pop $1 ; get parameter
System::Alloc 1024 ; Allocate string body
Pop $0 ; Get the allocated string's address

!define GetVolumeInformation "Kernel32::GetVolumeInformation(t,t,i,*i,*i,*i,t,i) i"
System::Call '${GetVolumeInformation}("$9",.r0,1024,,,,,1024)' ;

;Push $0 ; Push result
${If} $0 != ""
 StrCpy $VolName "$0"
${Else}
 StrCpy $VolName ""
${EndIf}
FunctionEnd ; GetDiskVolumeName

Function DiskSpace
${DriveSpace} "$9" "/D=T /S=G" $1 ; used to find total space of each drive
${If} $1 > "0"
 StrCpy $Capacity "$1GB"
${Else}
 StrCpy $Capacity ""
${EndIf}
FunctionEnd

Function DrivesList
 StrCpy $JustDrive $9
 Call இயற்பியக்கி
 Call GetDiskVolumeName
 Call DiskSpace
 Call கோமுவகைபெறு
;Prevent System Drive from being selected
 StrCpy $7 $WINDIR 3
 ${If} $9 != "$7" 
  ${AndIf} $DiskNum != "0" ; Prevent (Disk 0) - it's most likely the booted system from being displayed.
  ${AndIf} $Capacity >= "1" ; Prevent capacity lower than 1GB from being displayed.
  SendMessage $DestDriveTxt ${CB_ADDSTRING} 0 "STR:$9 (Disk $DiskNum) $VolName $Capacity $FSType" ;$8
 ${EndIf}
 Push 1 ; must push something - see GetDrives documentation
FunctionEnd

Function FormatYes ; If Format is checked, do something
  ${If} $FormatMe == "Yes"
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "I is ready to Wipe (Disk $DiskNum) and Fat32 format ($DestDisk).$\r$\nAll partitions and existing data on (Disk $DiskNum) will be deleted.$\r$\n$\r$\nClick YES if you've confirmed that both the drive letter and disk number are correct, or NO to Exit!" IDYES formatit
 Quit 
formatit:  
  !insertmacro கோப்பில்மாற்று "DISKNUM" "$DiskNum" "all" "all" "$PLUGINSDIR\diskpartwipe1.txt"  
  !insertmacro கோப்பில்மாற்று "DSK" "$DestDisk" "all" "all" "$PLUGINSDIR\diskpartwipe2.txt" 
  !insertmacro கோப்பில்மாற்று "DISKNUM" "$DiskNum" "all" "all" "$PLUGINSDIR\diskpartwipe2.txt"      
   
; Wipes the Entire Disk and reformats it with one Fat32 Partition  
   ;(Checkpoint oninit If Windows 8 or greater) test if is greater than Win XP (Vista or later OS?). XP doesn't support Diskpart on removable disks. 
   nsExec::ExecToLog '"DiskPart" /S $PLUGINSDIR\diskpartwipe1.txt' 
   Sleep 3000
   nsExec::ExecToLog '"DiskPart" /S $PLUGINSDIR\diskpartwipe2.txt' 
   
   ;Call Lock_Only ; Just get a lock on the Volume     
   Sleep 4000
   DetailPrint "Formatting $DestDisk as Fat32. This may take a while, please be patient..."
   nsExec::ExecToLog '"cmd" /c "echo y|$PLUGINSDIR\fat32format $DestDisk"' ;/Q /y      
   ;Call UnLockVol ; Unlock to allow Access   
   
  ${EndIf} 
FunctionEnd
Function FormatIt ; Set Format Option
  ${NSD_GetState} $Format $FormatMe
  ${If} $FormatMe == ${BST_CHECKED}
  ${NSD_Check} $Format
    StrCpy $FormatMe "Yes"
  ${NSD_SetText} $Format "Wipe (Disk $DiskNum) and Fat32 Format $DestDisk"
    SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new format option may have been chosen ; Enable for DropBox
	ShowWindow $Uninstaller 0 ; Disable Uninstaller option because we will be formatting the drive.
    StrCpy $Checker "Yes"	
  
  ${ElseIf} $FormatMe == ${BST_UNCHECKED}
  ${NSD_Uncheck} $Format 
  ${NSD_SetText} $Format "Wipe (Disk $DiskNum) and Fat32 Format $DestDisk"  
    SendMessage $Distro ${CB_RESETCONTENT} 0 0 ; Clear all distro entries because a new format option may have been chosen ; Enable for DropBox
    ShowWindow $Uninstaller 1 ; Re-enable Uninstaller option.
	StrCpy $Checker "Yes" 
	Call SetSpace
  ${EndIf}  
    Call InstallorRemove
FunctionEnd

Function ShowAllISOs ; Set Show All ISOs Option
  ${NSD_GetState} $ForceShowAll $ShowingAll
  ${If} $ShowingAll == ${BST_CHECKED}
  ${NSD_Check} $ForceShowAll
  StrCpy $ShowingAll "Yes"
  ${NSD_SetText} $ForceShowAll "All Shown"
    SendMessage $ISOSelection ${CB_RESETCONTENT} 0 0 
 
  ${ElseIf} $ShowingAll == ${BST_UNCHECKED}
  ${NSD_Uncheck} $ForceShowAll
  ${NSD_SetText} $ForceShowAll "Show All?"  
    SendMessage $ISOSelection ${CB_RESETCONTENT} 0 0 
  ${EndIf}  
FunctionEnd

Function CheckSpace ; Check total available space so we can set block size
  Call TotalSpace
  ${If} $1 <= 511
  StrCpy $BlockSize 1
  ${ElseIf} $1 >= 512
  ${AndIf} $1 <= 8191
  StrCpy $BlockSize 4
  ${ElseIf} $1 >= 8192 
  ${AndIf} $1 <= 16383
  StrCpy $BlockSize 8
  ${ElseIf} $1 >= 16384
  ${AndIf} $1 <= 32767
  StrCpy $BlockSize 16
  ${ElseIf} $1 > 32768
  StrCpy $BlockSize 32
  ${EndIf}
 ; MessageBox MB_ICONSTOP|MB_OK "$0 Drive is $1 MB in size, blocksize = $BlockSize KB."  
FunctionEnd

Function TotalSpace
${DriveSpace} "$JustDrive" "/D=T /S=M" $1 ; used to find total space of select disk
 StrCpy $Capacity "$1"
FunctionEnd

Function FreeDiskSpace
${If} $FormatMe == "Yes"
${DriveSpace} "$JustDrive" "/D=T /S=M" $1
${Else}
${DriveSpace} "$JustDrive" "/D=F /S=M" $1
${EndIf}
FunctionEnd

Function SetSpace ; Set space available for persistence
  ;StrCpy $0 '$0'
  Call FreeDiskSpace
  IntOp $MaxPersist 4090 + $CasperSize ; Space required for distro and 4GB max persistent file
 ${If} $1 > $MaxPersist ; Check if more space is available than we need for distro + 4GB persistent file
  StrCpy $RemainingSpace 4090 ; Set maximum possible value to 4090 MB (any larger wont work on fat32 Filesystem)
 ${Else}
  StrCpy $RemainingSpace "$1"
  IntOp $RemainingSpace $RemainingSpace - $SizeOfCasper ; Remaining space minus distro size
 ${EndIf}
  IntOp $RemainingSpace $RemainingSpace - 1 ; Subtract 1MB so that we don't error for not having enough space
  SendMessage $CasperSlider ${TBM_SETRANGEMAX} 1 $RemainingSpace ; Re-Setting Max Value
FunctionEnd

Function HaveSpacePre ; Check space required
 ${If} $FormatMe != "Yes" 
  Call புதையல்அளவு
  Call FreeDiskSpace
  System::Int64Op $1 > $SizeOfCasper ; Compare the space available > space required
  Pop $3 ; Get the result ...
  IntCmp $3 1 okay ; ... and compare it
  MessageBox MB_ICONSTOP|MB_OK "Oops: There is not enough disk space! $1 MB Free, $SizeOfCasper MB Needed on $JustDrive Drive."
 ${EndIf}
  okay: ; Proceed to execute...
FunctionEnd

Function HaveSpace ; Check space required
 ${If} $FormatMe != "Yes"
  Call புதையல்அளவு
  Call FreeDiskSpace
  System::Int64Op $1 > $SizeOfCasper ; Compare the space available > space required
  Pop $3 ; Get the result ...
  IntCmp $3 1 okay ; ... and compare it
  MessageBox MB_ICONSTOP|MB_OK "Not enough free space remains. Quitting I!"
  quit ; Close the program if the disk space was too small...
  okay: ; Proceed to execute...
  ;MessageBox MB_OK "ISO + Persistence will use $SizeOfCasper MB of the $1 MB Free disk space on $JustDrive Drive."  
  ;quit ; enable for testing message above
 ${EndIf}
FunctionEnd

!macro DeleteMenuEntry file start stop
Push "${FILE}" ; File to search in
Push "${START}$\r$\n" ; text to start deleting from 
Push "${STOP}$\r$\n" ; text to stop at
Call DeleteMenuEntry
!macroend
!define DeleteMenuEntry "!insertmacro DeleteMenuEntry"

; DeleteMenuEntry function based on http://nsis.sourceforge.net/Delete_lines_from_one_line_to_another_line_inclusive.
Function DeleteMenuEntry
 Exch $1 ;end string
 Exch
 Exch $2 ;begin string
 Exch 2
 Exch $3 ;file
 Exch 2
 Push $R0
 Push $R1
 Push $R2
 Push $R3
  GetTempFileName $R2
  FileOpen $R1 $R2 w
  FileOpen $R0 $3 r
  ClearErrors
  FileRead $R0 $R3
  IfErrors Done
  StrCmp $R3 $2 +3
  FileWrite $R1 $R3
  Goto -5
  ClearErrors
  FileRead $R0 $R3
  IfErrors Done
  StrCmp $R3 $1 +4 -3 
  FileRead $R0 $R3
  IfErrors Done
  FileWrite $R1 $R3
  ClearErrors
  Goto -4
Done:
   FileClose $R0
   FileClose $R1
   SetDetailsPrint none
   Delete $3
   Rename $R2 $3
   SetDetailsPrint both
 Pop $R3
 Pop $R2
 Pop $R1
 Pop $R0
 Pop $3
 Pop $2
 Pop $1
FunctionEnd

; Custom Distros Installer - Uninstaller Include
!include "நிரல்கள்\InstallDistro.nsh" ; ##################################### ADD NEW DISTRO ########################################
!include "நிரல்கள்\RemoveDistro.nsh" ; ##################################### ADD NEW DISTRO ########################################

Function DoSyslinux ; Install Syslinux on USB ; Now it's just grub2

  ${IfNot} ${FileExists} "$BDir\boot\grub\grub.exe" ; checking for grub.exe - we didn't include this until version 0.0.3.3
  ${AndIf} $DiskNum != "0"
  ;${AndIfNot} ${FileExists} "$BDir\!\menu\boot_functions.cfg" ; same here
  CreateDirectory $BDir\!\menu ; recursively create the directory structure if it doesn't exist
  CreateDirectory $BDir\!\ISOS ; create the ! ISOS folder
  CopyFiles "$PLUGINSDIR\boot_functions.cfg" "$BDir\!\menu\boot_functions.cfg" 
  DetailPrint "Proceeding to copy GRUB2 EFI files..."
  ExecWait '"$PLUGINSDIR\7zG.exe" x "$PLUGINSDIR\EFIGRUBX64.7z" -o"$BDir" -y' ; use newer grub2 for partnew etc
  
   ${IfNot} ${FileExists} "$BDir\boot\grub\grub.cfg" 
    CopyFiles "$PLUGINSDIR\switchgrub.cfg" "$BDir\boot\grub\grub.cfg" 
   ${EndIf}
   ${IfNot} ${FileExists} "$BDir\EFI\BOOT\grub.cfg" 
    CopyFiles "$PLUGINSDIR\grub.cfg" "$BDir\EFI\BOOT\grub.cfg" 
   ${EndIf}
   
   ${IfNot} ${FileExists} $BDir\EFI\BOOT\BOOTX64.EFI 
   ;Copy GRUB2 EFI files 
    DetailPrint "Proceeding to copy GRUB2 EFI files..."
    ExecWait '"$PLUGINSDIR\7zG.exe" x "$PLUGINSDIR\EFIGRUBX64.7z" -o"$BDir" -y' 
   ${EndIf}  
  
  ExecWait '"$PLUGINSDIR\7zG.exe" x "$PLUGINSDIR\GRUBINST.7z" -o"$PLUGINSDIR" -y' 
  ;MessageBox MB_YESNO|MB_ICONEXCLAMATION "I will now install a Grub2 MBR on (Disk $DiskNum) drive letter $BDir. Checking to make sure this is correct before proceeding!" IDYES okay
  ;Quit
  ;okay:
  nsExec::ExecToLog '"$PLUGINSDIR\grub-install.exe" --force --no-floppy --removable --target=i386-pc --boot-directory="$BDir\boot" //./PHYSICALDRIVE"$DiskNum"' 
  DetailPrint "Creating Label TA on $DestDisk"
  nsExec::ExecToLog '"cmd" /c "LABEL $DestDiskTA"'
  ${Else}
  DetailPrint "I already exists on $DestDisk ... proceeding. "
  ${EndIf}
  
  ${If} ${FileExists} $BDir\!\I-Copying.txt    
  ${AndIf} ${FileExists} $BDir\!\license.txt  
  ${AndIf} ${FileExists} $BDir\!\menu\memdisk
  DetailPrint "A Previous I ! Installation was detected."
  ; Call AddDir
  ${Else}
; Create and Copy files to your destination
  DetailPrint "Adding required files to the $BDir\! directory..." 
  CopyFiles "$PLUGINSDIR\I-Copying.txt" "$BDir\!\I-Copying.txt"  
  CopyFiles "$PLUGINSDIR\license.txt" "$BDir\!\license.txt"   
  
; Copy these files to !\menu
  DetailPrint "Adding required files to the $BDir\!\menu directory..." 
  ;CopyFiles "$PLUGINSDIR\syslinux.cfg" "$BDir\!\menu\syslinux.cfg"  
  CopyFiles "$PLUGINSDIR\memdisk" "$BDir\!\menu\memdisk"      
  ${EndIf}  

 
FunctionEnd

; ---- Let's Do This Stuff ----
Section  ; This is the only section that exists
; Get just the name of the ISO file 
Push "$ISOFile"
Push 1
Call பெயரைமட்டும்பெறு
Pop $NameThatISO

 ${If} $DiskNum == "0" 
  MessageBox MB_ICONEXCLAMATION|MB_OK "I will not attempt to install on (Disk $DiskNum). Did you select a drive?"
  Quit
 ${EndIf}

 ${If} ${FileExists} "$BDir\windows\system32" ; additional safeguard to help protect from mishap. 
  MessageBox MB_ICONSTOP|MB_OK "ABORTING! ($DestDisk) contains a WINDOWS/SYSTEM32 Directory."
  Quit
 ${EndIf}
 
 Call கோமுவகைபெறு
 ${If} $FSType == "exFAT"
  ${OrIf} $FSType == "NTFS"
   ${AndIf} $FormatMe != "Yes" 
   MessageBox MB_ICONSTOP|MB_OK "UEFI won't natively work on $FSType formatted partitions. I will now Exit!" 
   Quit
 ${EndIf} 
 
;checkpoint:
 ${If} $FormatMe == "Yes" 
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "WARNING: To prevent any loss of data, you must backup your data from all partitions tied to (Disk $DiskNum) before proceeding!$\r$\n$\r$\n${பெயர்} is Ready to perform the following actions:$\r$\n$\r$\n1. Completely Wipe and create a single partition on (Disk $DiskNum). Fat32 Format ($DestDisk) - All Data will be Irrecoverably Deleted!$\r$\n$\r$\n2. Create an MBR on ($DestDisk) - Existing MBR will be Overwritten!$\r$\n$\r$\n3. Create TA Label on ($DestDisk) - Existing Label will be Overwritten!$\r$\n$\r$\n4. Install ($DistroName) on ($DestDisk)$\r$\n$\r$\nAre you positive Drive ($DestDisk) on (Disk $DiskNum) is your USB Device?$\r$\nDouble Check with Windows diskmgmt.msc to make sure!$\r$\n$\r$\nClick YES to perform these actions or NO to Go Back!" IDYES proceed
 Quit
 ${ElseIf} $FormatMe != "Yes" 
 ${AndIfNot} ${FileExists} $BDir\boot\grub\grub.exe
 MessageBox MB_YESNO|MB_ICONEXCLAMATION "${பெயர்} is Ready to perform the following actions:$\r$\n$\r$\n1. Create an MBR on (Drive $DiskNum) $DestDisk - Existing MBR will be Overwritten!$\r$\n$\r$\n2. Create TA Label on $DestDisk (Drive $DiskNum) - Existing Label will be Overwritten!$\r$\n$\r$\n3. Install ($DistroName) on (Disk $DiskNum) $DestDisk$\r$\n$\r$\nAre you absolutely positive Drive $DestDisk on (Disk $DiskNum) is your USB Device?$\r$\nDouble Check with Windows diskmgmt.msc to make sure!$\r$\n$\r$\nClick YES to perform these actions on (Disk $DiskNum) $DestDisk or NO to Go Back!" IDYES proceed
 Quit
 ${EndIf}

proceed: 
 ${IfThen} $Removal == "Yes" ${|} Goto removeonly ${|}
 Call HaveSpace ; Got enough Space? Lets Check!
 Call FormatYes ; Format the Drive?
 Call DoSyslinux ; Run Syslinux on the Drive to make it bootable
 Call உள்உதநிகண்டறியப்பட்டது
 
; Copy the config file if it doesn't exist and create the entry in syslinux.cfg 
 ${IfNot} ${FileExists} "$BDir\!\menu\$DistroPath" 
 CopyFiles "$PLUGINSDIR\$DistroPath" "$BDir\!\menu\$DistroPath"
 Call Config2Write
 ${EndIf} 
 
removeonly:
 ${If} $Removal != "Yes"
 !insertmacro Install_Distros ; Install those distros
 ${ElseIf} $Removal == "Yes"
  Call கட்டமைப்புநீக்க
 !insertmacro Uninstall_Distros ; Remove those distros
 ${EndIf}
 
SectionEnd

Function கட்டமைப்புநீக்க ; Find and Set Removal Configuration file
  ${If} ${FileExists} "$BDir\!\$DistroName\I\linux.cfg"
  StrCpy $DistroPath "linux.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$DistroName\I\anon.cfg"
  StrCpy $DistroPath "anon.cfg"  
  ${ElseIf} ${FileExists} "$BDir\!\$DistroName\I\system.cfg"
  StrCpy $DistroPath "system.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$DistroName\I\antivirus.cfg"
  StrCpy $DistroPath "antivirus.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$DistroName\I\netbook.cfg"
  StrCpy $DistroPath "netbook.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$DistroName\I\other.cfg"
  StrCpy $DistroPath "other.cfg"
  ${ElseIf} ${FileExists} "$BDir\!\$DistroName\I\unlisted.cfg"
  StrCpy $DistroPath "unlisted.cfg"  
;  ${ElseIf} ${FileExists} "$BDir\!\$DistroName\I\menu.lst"
;  StrCpy $DistroPath "menu.lst"
  ${EndIf}
  ; MessageBox MB_OK "$DistroPath"
FunctionEnd

Function Config2Write
 ${If} $DistroPath == "linux.cfg"
  ${WriteToSysFile} "menuentry $\">Linux Distributions$\"{configfile /!/menu/linux.cfg}" $R0 
 ${ElseIf} $DistroPath == "anon.cfg"
  ${WriteToSysFile} "menuentry $\">Anonymous Browsers$\"{configfile /!/menu/anon.cfg}" $R0  
 ${ElseIf} $DistroPath == "system.cfg"
  ${WriteToSysFile} "menuentry $\">System Tools$\"{configfile /!/menu/system.cfg}" $R0
 ${ElseIf} $DistroPath == "antivirus.cfg"
  ${WriteToSysFile} "menuentry $\">Antivirus Tools$\"{configfile /!/menu/antivirus.cfg}" $R0 
 ${ElseIf} $DistroPath == "netbook.cfg"
  ${WriteToSysFile} "menuentry $\">Netbook Distributions$\"{configfile /!/menu/netbook.cfg}" $R0 
 ${ElseIf} $DistroPath == "other.cfg"
  ${WriteToSysFile} "menuentry $\">Other OS and Tools$\"{configfile /!/menu/other.cfg}" $R0 
 ${ElseIf} $DistroPath == "unlisted.cfg"
  ${WriteToSysFile} "menuentry $\">Unlisted ISOs$\"{configfile /!/menu/unlisted.cfg}" $R0  
; ${ElseIf} $DistroPath == "menu.lst"
;  ${WriteToSysFile} "label GRUB Bootable ISOs$\r$\nmenu label GRUB Bootable ISOs and Windows XP/7/8 ->$\r$\nMENU INDENT 1$\r$\nKERNEL /!/grub.exe$\r$\nAPPEND --config-file=/!/menu/menu.lst" $R0 
 ${EndIf} 
FunctionEnd

Function வெளியேறாதே
MessageBox MB_YESNO "$DestDisk இயக்ககத்தில் இப்போது மேலும் உதநிகள் / விநியோகங்களை சேர்க்க விரும்புகிறீர்களா?" IDYES noskip
StrCmp $R8 3 0 End ;Compare $R8 variable with current page #
StrCpy $R9 1 ; Goes to finish page
Call உறவுபக்கத்திற்குச்செல்
Abort
noskip:
StrCpy $DestDrive "$DestDrive" ; Retain previously selected Drive Letter
StrCpy $RepeatInstall "YES" ; Set Repeat Install Option to YES
StrCpy $ISOTest "" ; Reset
StrCpy $ISOFile "" ; Reset
StrCpy $Removal "" ; Reset
StrCpy $Persistence "NULL" ; Reset
StrCpy $NameThatISO "" ; Reset NameThatISO உதநி Name
StrCpy $DistroPath "" ; Clear Path to create
StrCpy $DistroName "" ; Clear Distro Name
StrCpy $ISOFileName "" ; Clear உதநி Selection
StrCpy $FileFormat "" ; Clear File Format
StrCpy $DownloadMe 0 ; Ensure Uncheck of Download Option
StrCpy $LocalSelection "" ; Reset Local Selection
StrCpy $ShowingAll ""
StrCpy $FormatMe "" ; Reset Format Option
StrCmp $R8 4 0 End ;Compare $R8 variable with current page #
StrCpy $R9 -3 ; Goes back to selections page
Call உறவுபக்கத்திற்குச்செல் ; change pages
Abort
End:
FunctionEnd

; --- Stuff to do at startup of script ---
Function .onInit
StrCpy $TASupport "YES"
StrCpy $R9 0 ; உரிமை உரை தவிர், பக்கம் 0க்கு செல்
;StrCpy $InstallButton ""
 StrCpy $FileFormat "ISO"
 userInfo::getAccountType
 Pop $Auth
 strCmp $Auth "Admin" done
 Messagebox MB_OK|MB_ICONINFORMATION "Currently you're trying to run this program as: $Auth$\r$\n$\r$\nYou must run this program with administrative rights...$\r$\n$\r$\nRight click the file and select Run As Administrator or Run As (and select an administrative account)!"
 Abort
 done:
 SetShellVarContext all
 InitPluginsDir   
  CreateDirectory "$PLUGINSDIR\new7z\"
  File /oname=$PLUGINSDIR\switchgrub.cfg "உரைகள்\switchgrub.cfg"  
  File /oname=$PLUGINSDIR\grub.cfg "உரைகள்\grub.cfg"  
  File /oname=$PLUGINSDIR\boot_functions.cfg "உரைகள்\boot_functions.cfg"  
  File /oname=$PLUGINSDIR\grubslug.cfg "உரைகள்\grubslug.cfg"   
  File /oname=$PLUGINSDIR\antivirus.cfg "உரைகள்\antivirus.cfg" 
  File /oname=$PLUGINSDIR\system.cfg "உரைகள்\system.cfg" 
  File /oname=$PLUGINSDIR\netbook.cfg "உரைகள்\netbook.cfg"
  File /oname=$PLUGINSDIR\anon.cfg "உரைகள்\anon.cfg" 
  File /oname=$PLUGINSDIR\linux.cfg "உரைகள்\linux.cfg" 
  File /oname=$PLUGINSDIR\unlisted.cfg "உரைகள்\unlisted.cfg" 
  File /oname=$PLUGINSDIR\liveusb "உரைகள்\liveusb"   
  File /oname=$PLUGINSDIR\7zG.exe "..\பொது-இருமங்கள்\7ஃ0\7zG.exe"
  File /oname=$PLUGINSDIR\7z.dll "..\பொது-இருமங்கள்\7ஃ0\7z.dll"  
  File /oname=$PLUGINSDIR\new7z\7zG.exe "..\பொது-இருமங்கள்\7ஃ1\7zG.exe"
  File /oname=$PLUGINSDIR\new7z\7z.dll "..\பொது-இருமங்கள்\7ஃ1\7z.dll"  
  File /oname=$PLUGINSDIR\உரிமை.உரை "..\அகர\பகவன்\உரிமை.உரை"
  File /oname=$PLUGINSDIR\memdisk "..\பொது-இருமங்கள்\நினைவட்டு"  
  File /oname=$PLUGINSDIR\EFIGRUBX64.7z "EFIGRUB\EFIGRUBX64.7z"   
  File /oname=$PLUGINSDIR\GRUBINST.7z "EFIGRUB\GRUBINST.7z" 
  File /oname=$PLUGINSDIR\fat32format.exe "..\பொது-இருமங்கள்\கோஒஅ32வடிவம்.exe"     
  File /oname=$PLUGINSDIR\diskpartwipe1.txt "உரைகள்\diskpartwipe1.txt"  
  File /oname=$PLUGINSDIR\diskpartwipe2.txt "உரைகள்\diskpartwipe2.txt"    
FunctionEnd

!include ..\பொது-துணைநிரல்கள்\புதையல்நிலை.நிரல்
!include ..\பொது-துணைநிரல்கள்\ஆரம்பசீவ_கண்டுபிடி.நிரல்
!include ..\பொது-துணைநிரல்கள்\லினக்சுஉட்கரு_கண்டுபிடி.நிரல்
!include ..\பொது-துணைநிரல்கள்\கோமுவகைபெறு.நிரல்
