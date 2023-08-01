#NoTrayIcon
    
Steam := "C:\Program Files (x86)\Steam\Steam.exe"
DisplaySwitch := "C:\WINDOWS\system32\DisplaySwitch.exe"

^#g:: ; Ctrl + Win + G
{
    ; Switch to TV 
    RunWait, %DisplaySwitch% /external,, Hide
    Sleep 1000 ; Let switch occur

    ; Start Steam Big Picture Mode
    Process, Exist, Steam.exe
    if ErrorLevel
        Run, steam://open/bigpicture
    else
        Run, %Steam% -bigpicture
    WinWait, Steam Big Picture Mode

    ; Move mouse cursor out of view
    WinGetPos, X, Y, W, H, A
    DllCall("SetCursorPos", "int", W, "int", H)

    ; Switch back to desktop display
    WinWaitClose ; Wait for BPM to close
    RunWait, %DisplaySwitch% /internal,, Hide
}
