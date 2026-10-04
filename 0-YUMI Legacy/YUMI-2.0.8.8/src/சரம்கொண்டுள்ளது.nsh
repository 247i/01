/*
 * This file is part of YUMI
 *
 * YUMI is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * any later version.
 *
 * YUMI is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with YUMI.  If not, see <http://www.gnu.org/licenses/>.
 */

; சரம்கொண்டுள்ளது Written by kenglish_hi http://nsis.sourceforge.net/சரம்கொண்டுள்ளது
; Adapted from StrReplace written by dandaman32
; Modified to check for * Wildcard in variable ISOFileName for YUMI and UUI
; This function does a case sensitive searches for an occurrence of a substring in a string. 
; It returns the substring if it is found. 
; Otherwise it returns null(""). 
Var /Global STR_HAYSTACK
Var /Global STR_NEEDLE
Var /Global STR_CONTAINS_VAR_1
Var /Global STR_CONTAINS_VAR_2
Var /Global STR_CONTAINS_VAR_3
Var /Global STR_CONTAINS_VAR_4
Var /Global STR_RETURN_VAR
Var /Global WILD
 
Function சரம்கொண்டுள்ளது
  Exch $STR_NEEDLE
  Exch 1
  Exch $STR_HAYSTACK
  ; Uncomment to debug
  ;MessageBox MB_OK 'STR_NEEDLE = $STR_NEEDLE STR_HAYSTACK = $STR_HAYSTACK '
    StrCpy $STR_RETURN_VAR ""
    StrCpy $STR_CONTAINS_VAR_1 -1
    StrLen $STR_CONTAINS_VAR_2 $STR_NEEDLE
    StrLen $STR_CONTAINS_VAR_4 $STR_HAYSTACK
    loop:
      IntOp $STR_CONTAINS_VAR_1 $STR_CONTAINS_VAR_1 + 1
      StrCpy $STR_CONTAINS_VAR_3 $STR_HAYSTACK $STR_CONTAINS_VAR_2 $STR_CONTAINS_VAR_1
      StrCmp $STR_CONTAINS_VAR_3 $STR_NEEDLE found
      StrCmp $STR_CONTAINS_VAR_1 $STR_CONTAINS_VAR_4 done
      Goto loop
    found:
      StrCpy $STR_RETURN_VAR $STR_NEEDLE
      Goto done
    done:
   Pop $STR_NEEDLE ;Prevent "invalid opcode" errors and keep the
   Exch $STR_RETURN_VAR 
FunctionEnd

!macro _சரம்கொண்டுள்ளதுகட்டமைப்பாளர் OUT NEEDLE HAYSTACK
  Push "${HAYSTACK}"
  Push "${NEEDLE}"
  Call சரம்கொண்டுள்ளது
  Pop "${OUT}"
!macroend
 
!define சரம்கொண்டுள்ளது '!insertmacro "_சரம்கொண்டுள்ளதுகட்டமைப்பாளர்"' 