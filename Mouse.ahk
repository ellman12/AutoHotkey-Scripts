;G1: Horizontal scroll
F13 & WheelUp::Send("{WheelLeft}")
F13 & WheelDown::Send("{WheelRight}")

;G2: Ctrl Tab
F14::Send("^{Tab}")

;G3: Faster vertical scrolling
F15 & WheelUp::Send("{WheelUp 8}")
F15 & WheelDown::Send("{WheelDown 8}")

;A way to make the mouse move faster while G3 and the Right Mouse Button are held down. Useful for moving around the screen/between monitors quickly.
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

;TODO: these need a use
^!F23::return

^+F23::return

