ConfigPath := A_ScriptDir . "/config.ini"

if (!FileExist(ConfigPath) || FileRead(ConfigPath) == "") {
	createDefaultConfigFile()
} else {
	readConfigFile()
}


readConfigFile() {
	global

	WorkComputer := readValue("Misc.", "WorkComputer", false)
}

createDefaultConfigFile() {
	global

	readConfigFile()
	FileAppend("", ConfigPath)

	writeValue(false, "Misc.", "WorkComputer")
}

readValue(section, key, default) {
	global

	return IniRead(ConfigPath, section, key, default)
}

writeValue(value, section, key) {
	global

	IniWrite(value, ConfigPath, section, key)
}

