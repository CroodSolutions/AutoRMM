; AHK v2 
; This is a MeshCentral agent installer using AutoHotKey.
; Precondition to this testing is to setup a valid MeshCentral server and copy the download URL.  
; Replace the portion that says "(Replace with your MeshCentral server URL)" with an actual valid download link to your MeshCentral server 

installerName := "meshagent.exe"
downloadUrl   := "(Replace with your MeshCentral server URL)"
downloadPath  := A_ScriptDir "\" installerName
serverUrl     := "(Paste MeshCentral Server URL here)"
deviceGroup   := "(Optional group name)"

ConsoleOutput("Downloading MeshCentral agent installer...")
if !DownloadFile(downloadUrl, downloadPath)
{
    MsgBox("Download failed. File not found at: " downloadPath, "Error", 16)
    ExitApp(1)
}

Sleep(3000)

ConsoleOutput("Running MeshCentral agent...")
; Use run parameter to execute the agent
exitCode := RunWait('"' downloadPath '" run', , "Hide")

if (exitCode = 0)
{
    MsgBox("MeshCentral agent installed successfully.", "Success", 64)
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