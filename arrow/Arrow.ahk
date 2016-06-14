#SingleInstance force

Stack := Object()

Menu, tray, icon, kb_green.ico, , 1
SetCapsLockState, AlwaysOff

Hotkey, I     , off
Hotkey, J     , off
Hotkey, K     , off
Hotkey, L     , off
Hotkey, H     , off
Hotkey, SC027 , off

Hotkey, U     , off
Hotkey, O     , off

Hotkey, Y     , off

CapsLock &  I::Send {Up}
CapsLock &  J::Send {Left}
CapsLock &  K::Send {Down}
CapsLock &  L::Send {Right}
CapsLock &  H::Send {Home}
CapsLock &  SC027::Send {End}

CapsLock &  U::Send ^{Left}
CapsLock &  O::Send ^{Right}

CapsLock &  Y::Send {Del}

~CapsLock & t::
	MouseGetPos,,, WindowID
	WinGetTitle, WindowName, ahk_id %WindowID%

	IfWinExist, ahk_id %WindowID% %WindowName%
	{
		WinHide
		Stack.Insert(WindowID)
	}
return

~CapsLock & r::
	if (Stack.MaxIndex() > 0 )
	{
		WinID := Stack[Stack.MaxIndex()]
		Stack.Remove(Stack.MaxIndex())
		WinShow, ahk_id %WinID%
	} else {
		MsgBox, No hidden windows in stack
	}
return
