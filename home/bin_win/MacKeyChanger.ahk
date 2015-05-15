
;ref. https://www.snip2code.com/Snippet/55975/------------------AutoHotKey------

#UseHook
;------------------------------------------------------
;変換キーを使っていろいろ
;------------------------------------------------------
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

;------------------------------------------------------
;汎用（Macっぽく使いたいキー操作）
;------------------------------------------------------
;Shiftを押さないでアンダースコア
sc073::_

;クイックメモ（AtomをAtok Padっぽく使う）
Ctrl::
  If (A_PriorHotkey = A_ThisHotKey && A_TimeSincePriorHotkey < 300)
  {
    Process,Exist,atom.exe
    if ErrorLevel<>0
      WinActivate,ahk_pid %ErrorLevel%
    else
      Run,%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Atom.lnk
  }
  KeyWait,Ctrl
  return

;タスク切り替え（KeySwapで置き換えた動作を戻すため）
Ctrl & Tab::
  GetKeyState, state, Shift
  if state = U
    Send,{Blind}{Alt down}{Tab}{Alt up}
  else if state = D
    Send,{Blind}{Shift down}{Alt down}{Tab}{Alt up}{Shift up}
  return

;<^Tab::AltTab
;>^Tab::AltTab

;アプリケーション内切り替え（KeySwapで置き換えた動作を戻すため）
!Tab::Send {LCtrl down}{Tab}{LCtrl up}
+!Tab::Send {Shift down}{LCtrl down}{Tab}{LCtrl up}{Shift up}

;------------------------------------------------------
;アプリケーション固有設定
;------------------------------------------------------
;MobaXterm / Mintty
#IF WinActive("ahk_class TMobaXtermForm") || WinActive("ahk_class mintty")

!c::Send {LCtrl down}{Ins}{LCtrl up}
!v::Send {Shift down}{Ins}{Shift up}

#UseHook off
