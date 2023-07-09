#NoTrayIcon
    
Steam := "C:\Program Files (x86)\Steam\Steam.exe"
MonitorSwitcher := "C:\ProgramData\chocolatey\bin\MonitorSwitcher.exe"

^!g:: ; Ctrl + XBox Guide
{
    ; Save current monitor configuration
    RunWait, %MonitorSwitcher% -save:%A_ScriptDir%\modes\.tmp.xml,, Hide

    ; Switch to TV only
    RunWait, %MonitorSwitcher% -load:%A_ScriptDir%\modes\tv-only.xml,, Hide
    Sleep 1000 ; Let switch occur

    ; Start Steam Big Picture Mode
    Process, Exist, Steam.exe
    if ErrorLevel
        Run, steam://open/bigpicture
    else
        Run, %Steam% -bigpi
    cture
    WinWait, Steam Big Picture Mode

    ; Move mouse cursor out of view
    WinGetPos, X, Y, W, H, A
    DllCall("SetCursorPos", "int", W, "int", H)

    ; Switch back to desktop display
    WinWaitClose ; Wait for BPM to close
    RunWait, %MonitorSwitcher% -load:%A_ScriptDir%\modes\.tmp.xml,, Hide
    FileDelete, %A_ScriptDir%\modes\.tmp.xml
}
