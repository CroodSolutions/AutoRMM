; AHK v2 
; This is an Action1 agent installer using AutoHotKey.
; Precondition to this testing is to setup a valid Action1 tenant and copy an install URL.  
; Replace the portion that says "(Paste Install URL here)" with an actual valid download link to Action1 (remove parenthesis also).  
; Save as AHK script and run with AutoHotKey as administrator. 
; For easy testing, a bat script is also provided to run the AHK script as administrator, with AutoHotKey64 assuming they are all in the same working directory.  
; If using this in a red teaming engagement, remove the MsgBox  and debug portions of the script.  

installerName := "action1_agent(My_Organization).msi"
downloadUrl   := "(Paste Install URL here)"
downloadPath  := A_ScriptDir "\" installerName

ConsoleOutput("Downloading Action1 agent installer...")
if !DownloadFile(downloadUrl, downloadPath)
{
    MsgBox("Download failed. File not found at: " downloadPath, "Error", 16)
    ExitApp(1)
}

Sleep(3000)

ConsoleOutput("Installing Action1 agent silently...")
exitCode := RunWait('msiexec /i "' downloadPath '" /qn /norestart', , "Hide")

if (exitCode = 0)
{
    MsgBox("Action1 agent installed successfully.", "Success", 64)
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
