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
