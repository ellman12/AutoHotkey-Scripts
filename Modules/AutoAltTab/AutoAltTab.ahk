^!1::
{
	global
	window1 := WinGetID("A")
}

^!2::
{
	global
	window2 := WinGetID("A")
}

!a::
{
	global

	if (WorkComputer) {
		if (WinExist("ahk_exe code.exe")) {
			window1 := WinGetID("ahk_exe code.exe")
		}
		else if (WinExist("ahk_exe webstorm64.exe")) {
			window1 := WinGetID("ahk_exe webstorm64.exe")
		}

		window2 := WinGetID("ahk_exe chrome.exe")
	}

	if (window1 == "" || !WinExist("ahk_id" window1)) {
		MsgBox("Window 1 does not exist")
		return
	}

	if (window2 == "" || !WinExist("ahk_id" window2)) {
		MsgBox("Window 2 does not exist")
		return
	}

	if (window1 == window2) {
		MsgBox("Window 1 and 2 are the same ID")
		return
	}

	AATEnabled := !AATEnabled

	if (AATEnabled) {
		ToolTip("AAT On")
		SetTimer(AutoAltTabLoop)
	} else {
		ToolTip()
		SetTimer(AutoAltTabLoop, 0)
	}
}
return

AutoAltTabLoop() {
    if (!AATEnabled)
        return

    WinActivate("ahk_id " . window1)
    Sleep(getRandomDelay())

    if (!AATEnabled)
        return

    WinActivate("ahk_id " . window2)
    Sleep(getRandomDelay())

    if (!AATEnabled)
        return

    Send("!{Tab}")
    Sleep(getRandomDelay())

    if (!AATEnabled)
        return

    Send("!{Tab}")
    Sleep(getRandomDelay())
}

getRandomDelay() {
	global

    randomDelay := Random(-AAT_DELAY_RANDOMNESS, AAT_DELAY_RANDOMNESS)
    delay := AAT_DELAY + randomDelay
    return Abs(delay)
}
