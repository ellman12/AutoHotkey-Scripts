;Default behavior of macro buttons on Scimitar Pro and K95.
;If desired, any or all of these hotkeys can be overriden by wrapping them in an #if.

;----------------------------------------MOUSE ACTIONS---------------------------------------
;G1: Horizontal scroll
F13 & WheelUp::Send("{WheelLeft}")
F13 & WheelDown::Send("{WheelRight}")

;G2: Ctrl + Tab. Some programs let this work like Alt + Tab.
F14::Send("^{Tab}")

;G3: Faster vertical scrolling
F15 & WheelUp::Send("{WheelUp 8}")
F15 & WheelDown::Send("{WheelDown 8}")

;Makes the mouse move faster while G3 and the Right Mouse Button are held down.
F15 & RButton::
{
	DllCall("SystemParametersInfo", "Int", 113, "Int", 0, "UInt", 17, "Int", 1)
	KeyWait("RButton")
	DllCall("SystemParametersInfo", "Int", 113, "Int", 0, "UInt", 10, "Int", 1)
}

;G4: New tab
F16::Send("^t")

;G5: Tab to the right
F17::Send("^{PgDn}")

;G6: Forward in history
F18::Send("!{Right}")

;G7: Close tab
F19::Send("^{w}")

;G8: Tab to the left
F20::Send("^{PgUp}")

;G9: Backwards in history
F21::Send("!{Left}")

;G10: Alt + Tab
F22::Send("!{Tab}")

;G11: Minimize the current active window
F23::WinMinimize("A")

;G12: Restore previously closed tab
+F23::Send("^+{t}")

;TODO: These seriously need a use.
^!F23::return

^+F23::return

;----------------------------------------KEYBOARD ACTIONS---------------------------------------
;G1
^F13::Run("firefox.exe -private-window")

;G2
^F14::searchForSelection("firefox.exe", "", "https://www.google.com/search?&q=")

;G3
^F15::searchForSelection("firefox.exe", "-private-window", "https://www.google.com/search?q=")

;G4
^F16::Run("chrome.exe -incognito")

;G5
^F17::searchForSelection("chrome.exe", "", "https://www.google.com/search?q=")

;G6
^F18::searchForSelection("chrome.exe", "--incognito", "https://www.google.com/search?q=")

;G7: MS To Do
^F19::switchBetweenWindows("ApplicationFrameHost", "C:/Users/" . A_UserName . "/Shortcuts/Microsoft To Do.lnk")

;G8
^F20::return

;G9
^F21::return

;G10
^F22::return

;G11: Close tab
^F23::Send("^w")

;G12: New tab
!F23::Send("^t")

;G13: Close Virtual Desktop
!F13::Send("^#{F4}")

;G14: New VD
!F14::Send("^#d")

;G15
!F15::WinMinimize("A")

;G16: MusicBee
!F16::switchBetweenWindows("MusicBee", "C:/Program Files (x86)/MusicBee/MusicBee.exe")

;G17: Previous VD
!F17::Send("^#{Left}")

;G18: Next VD
!F18::Send("^#{Right}")

;M1, M2, and M3: Copy, cut, and paste
+F24::Send("^c")
+F21::Send("^x")
+F22::Send("^v")

