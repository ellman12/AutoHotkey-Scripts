switchBetweenWindows(exeName, exePath) {
	groupName := exeName
	exeName := "ahk_exe " . exeName . ".exe"

	if !WinExist(exeName)
		Run(exePath)
	else
	{
		GroupAdd(groupName, exeName)

		if WinActive(exeName)
			GroupActivate(groupName, "R")
		else
			WinActivate(exeName)
	}
}

;ahk_class is necessary because the taskbar, etc. are also part of explorer.exe
switchBetweenExplorerWins() {
	if !WinExist("ahk_class CabinetWClass")
        Run("explorer.exe")

    GroupAdd("explorerWins", "ahk_class CabinetWClass")
	GroupActivate("explorerWins", "R")
}

searchForSelection(browser, flags, url) {
    BlockInput("On")
    oldClipboard := A_Clipboard
    A_Clipboard :=
    Send("^c")
    BlockInput("Off")

    if (!ClipWait(0.05)) {
        Run(browser . " " . flags . " " . url)
        return
    }

    A_Clipboard := StrReplace(A_Clipboard, A_Space, "+")
    runURL := url . A_Clipboard
        Run(browser . " " . flags . " " . runUrl)
    A_Clipboard := oldClipboard
}
