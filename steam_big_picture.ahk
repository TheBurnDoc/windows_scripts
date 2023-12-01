#NoTrayIcon
#SingleInstance
    
Steam := "C:\Program Files (x86)\Steam\steam.exe"
LGTVCompanion := "C:\Program Files\LGTV Companion\LGTVcli.exe"
DisplaySwitch := "C:\WINDOWS\system32\DisplaySwitch.exe"

^#p:: ; Ctrl + Win + P
{
    ; Switch to TV 
    Run, %DisplaySwitch% /external,, Hide

    ; Setup TV
    Run, %LGTVCompanion% -setHdmi1,, Hide
    Run, %LGTVCompanion% -gameMode_hdmi1 on,, Hide
    Run, %LGTVCompanion% -uhdDeepColor_hdmi1 on,, Hide
    Run, %LGTVCompanion% -gameOptimization_hdmi1 on,, Hide
    Run, %LGTVCompanion% -freesyncOled_hdmi1 on,, Hide
    Run, %LGTVCompanion% -hdmiPcMode_hdmi1 on,, Hide

    ; Start Steam Big Picture Mode
    Sleep 1000 ; Wait for screen switch
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
