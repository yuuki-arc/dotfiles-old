﻿
;ref. https://www.snip2code.com/Snippet/55975/------------------AutoHotKey------

#UseHook
;頻繁にスクリプトを変える場合に便利
vk1Csc079 & 0::Reload   ;このスクリプトをリロードして適用
vk1Csc079 & 8::Edit   ;このスクリプトを編集

vk1Csc079 & h::Send,{Blind}{Left}   ;←
vk1Csc079 & l::Send,{Blind}{Right}    ;→
vk1Csc079 & k::Send,{Blind}{Up}     ;↑
vk1Csc079 & j::Send,{Blind}{Down}   ;↓
vk1Csc079 & o::Send,{Blind}{Tab}    ;Tab
vk1Csc079 & u::Send,{Blind}+{Tab}   ;Shift Tab

vk1Csc079 & g::
  GetKeyState, state, Shift
  if state = U
    Send,{Ctrl}{Home}    ;上の行頭へ
  else if state = D
    Send,{Ctrl}{End}     ;下の行末へ
return

sc073::_

<^Tab::AltTab
>^Tab::AltTab
<^Tab::AltTab

!Tab::Send {LCtrl down}{Tab}{LCtrl up}
+!Tab::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}

;<!Tab::
;  GetKeyState, state, Ctrl
;  if state = U
;    Send,{Ctrl}{Tab}
;  else if state = D
;    Send,{Ctrl}{Tab}
;     return

;>+<^Tab::ShiftAltTab

#IF WinActive("ahk_class TMobaXtermForm")

!c::Send {LCtrl down}{Ins}{LCtrl up}
!v::Send {Shift down}{Ins}{Shift up}
 
#IF

#UseHook off

;;LCtrl & Tab::
;;  If GetKeyState("+", "P")
;;    Send, ShiftAltTab
;;  Else
;;    Send, AltTab
;;  Return

;;LCtrl & Tab::AltTab
;;LCtrl & {Shift Tab}::ShiftAltTab
;LCtrl & q::Send +!{F4}

