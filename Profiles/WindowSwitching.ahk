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

switchBetweenCodeWindows() {
	group := "codeWindows"
	GroupAdd(group, "ahk_exe rider64.exe")
	GroupAdd(group, "ahk_exe webstorm64.exe")
	GroupAdd(group, "ahk_exe Neovim.exe")
	GroupAdd(group, "Neovim")
	GroupActivate(group, "R")
}

;ahk_class is necessary because the taskbar, etc. are also part of explorer.exe
switchBetweenExplorerWins() {
	if !WinExist("ahk_class CabinetWClass")
        Run("explorer.exe")

    GroupAdd("explorerWins", "ahk_class CabinetWClass")
	GroupActivate("explorerWins", "R")
}

switchToMessengerApp() {
	if (WorkComputer) {
		WinShow("ahk_exe Teams.exe")
		switchBetweenWindows("teams", "C:/Users/" . A_UserName . "/AppData/Local/Microsoft/Teams/Update.exe")
	} else {
		WinShow("ahk_exe Discord.exe")
		switchBetweenWindows("discord", "C:/Users/" . A_UserName . "/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Discord Inc/Discord.lnk")
	}
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
