;Remapping the NumPad to be more useful.

NumPadIns::Send("^#{Left}")
NumPadDel::Send("^#{Right}")

NumpadEnter::WinMinimize("A")

NumPadEnd::switchBetweenWindows("firefox", "C:/Program Files/Mozilla Firefox/firefox.exe")

NumPadDown::switchBetweenCodeWindows()

NumPadPgDn::switchBetweenWindows("WindowsTerminal", "C:/Users/" . A_UserName . "/Shortcuts/Terminal.lnk")

NumPadLeft::Send("^{PgUp}")

NumPadClear::switchBetweenExplorerWins()

NumPadRight::Send("^{PgDn}")

NumPadHome::switchBetweenWindows("chrome", "C:/Program Files/Google/Chrome/Application/chrome.exe")

NumPadUp::switchToMessengerApp()

NumPadPgUp::switchBetweenWindows("nvim", "nvim.exe")

NumPadAdd::Send("^t")
NumPadSub::Send("^w")
NumPadMult::Send("^n")
NumPadDiv::Send("!{F4}")


