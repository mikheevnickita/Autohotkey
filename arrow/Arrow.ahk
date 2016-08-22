#SingleInstance force

Stack := Object()

Menu, tray, icon, kb_green.ico, , 1
SetCapsLockState, AlwaysOff

CapsLock & I::Send {Up}
CapsLock & J::Send {Left}
CapsLock & K::Send {Down}
CapsLock & L::Send {Right}
CapsLock & H::Send {Home}
CapsLock & SC027::Send {End}

CapsLock & U::Send ^{Left}
CapsLock & O::Send ^{Right}

CapsLock & Y::Send ^{Del}


~CapsLock & a::
MouseGetPos,,, WindowID
WinGet, ExStyle, ExStyle, ahk_id %WindowID%
WinGetTitle, WindowName, ahk_id %WindowID%

IfWinExist, ahk_id %WindowID% %WindowName%
{
	if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
	{
		Winset, AlwaysOnTop, off, ahk_id %currentWindow%
		SplashImage,, x0 y0 b fs12, OFF always on top.
		Sleep, 1500
		SplashImage, Off
	}
	else
	{
		WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
		SplashImage,,x0 y0 b fs12, ON always on top.
		Sleep, 1500
		SplashImage, Off
	}
}
return

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