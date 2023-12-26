#NoEnv
#Warn
#SingleInstance force
#Persistent
SetWorkingDir %A_ScriptDir%

; ===== Version Information ==================================================================================================
compiledGitTag := "v0.0.0"

; ===== Grab .ini Data, Create if does not exist ==================================================================================================
IniFileName := "Settings_PresenceMonitor.ini"
IniSection := "Settings"
IniKey := "filePath"

; Check if the .ini file exists
if !FileExist(IniFileName)
{
    defaultPath := "C:\\Path\\To\\Default\\File.txt"  ; Replace with your default file path
    IniWrite, %defaultPath%, %IniFileName%, %IniSection%, %IniKey%
    vfilePath := defaultPath
}
else
{
    ; If the file exists, read the filePath setting
    IniRead, vfilePath, %IniFileName%, %IniSection%, %IniKey%
    if (ErrorLevel == 1 || vfilePath = "")  ; ErrorLevel 1 indicates the section/name is not found.
    {
        defaultPath := "C:\\Path\\To\\Default\\File.txt"  ; Replace with your default file path
        IniWrite, %defaultPath%, %IniFileName%, %IniSection%, %IniKey%
        vfilePath := defaultPath
    }
}

; ========================================================= MS Teams Monitoring ==============================================

; Function to read availability from the file
ReadAvailability(filePath) {
    FileRead, fileContent, %filePath%
    pattern := """availability"":""([^""]+)"""
    if (RegExMatch(fileContent, pattern, found))
        return found1
    else
        return "Error: Pattern not found"
}

; Main script
prevStatus := ""
SetTimer, CheckFile, 1000  ; Check every 1000 milliseconds (1 second)

CheckFile:
    currentStatus := ReadAvailability(vfilePath)
    if (currentStatus != prevStatus && currentStatus != "Error: Pattern not found") {
        prevStatus := currentStatus
		jumpTo := currentStatus
		TakeAction()
    }
return

; ========================================================= Director ==============================================

; Action Director
TakeAction()
{
    global jumpTo
	global currentStatus
	
	if !IsLabel(jumpTo){
	MsgBox, , Automatic Troubleshooting - %jumpTo%, Your Unhandled Microsoft Teams Status: %currentStatus%
	}
	
	else {
	Gosub, %jumpTo%
	}
}
	
; ========================================================= Actions ==============================================

Busy:
MsgBox, % "You are Busy. "
return

Available:
MsgBox, % "You are Available. "
return

Away:
MsgBox, % "You are Away. "
return

DoNotDisturb:
MsgBox, % "You are in Do Not Disturb mode. "
return

BeRightBack:
MsgBox, % "You are marked Be Right Back. "
return

Offline:
MsgBox, % "You are Offline. "
return
