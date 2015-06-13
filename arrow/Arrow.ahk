#SingleInstance force

i := 0
Menu, tray, icon, kb_red.ico, , 1
SetCapsLockState, AlwaysOff

Hotkey, I     , off
Hotkey, J     , off
Hotkey, K     , off
Hotkey, L     , off
Hotkey, O     , off
Hotkey, .     , off
Hotkey, H     , off
Hotkey, SC027 , off
Hotkey, U     , off
Hotkey, Y     , off

CapsLock &  I::Send {Up}
CapsLock &  J::Send {Left}
CapsLock &  K::Send {Down}
CapsLock &  L::Send {Right}
CapsLock &  O::Send {PgUp}
CapsLock &  .::Send {PgDn}
CapsLock &  H::Send {Home}
CapsLock &  SC027::Send {End}
CapsLock &  U::Send {Del}
CapsLock &  Y::Send {Ins}

			I::Send {Up}
			J::Send {Left}
			K::Send {Down}
			L::Send {Right}
			O::Send {PgUp}
			.::Send {PgDn}
			H::Send {Home}
			SC027::Send {End}
			U::Send {Del}
			Y::Send {Ins}

~CapsLock & F::
	i := mod((i + 1),  2)
	if (i == 1)
	{
		Menu, tray, icon, kb_green.ico, , 1

		Hotkey, I     , on
		Hotkey, J     , on
		Hotkey, K     , on
		Hotkey, L     , on
		Hotkey, O     , on
		Hotkey, .     , on
		Hotkey, H     , on
		Hotkey, SC027 , on
		Hotkey, U     , on
		Hotkey, Y     , on
	} else {
		Menu, tray, icon, kb_red.ico  , , 1
		
		Hotkey, I     , off
		Hotkey, J     , off
		Hotkey, K     , off
		Hotkey, L     , off
		Hotkey, O     , off
		Hotkey, .     , off
		Hotkey, H     , off
		Hotkey, SC027 , off
		Hotkey, U     , off
		Hotkey, Y     , off
	}
return