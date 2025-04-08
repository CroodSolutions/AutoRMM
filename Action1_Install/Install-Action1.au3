; This is a very basic Action1 agent installer using an AutoIT compiled executable.
; Replace the portion that says "(Paste Install URL here)" with an actual valid download link to Action1 (remove parenthesis also).  
; Run this as an AutoIT compiled executable, with admin rights.
; If using this in a red teaming engagement, remove the MsgBox portions of the script.  

Local $installerName = "action1_agent(My_Organization).msi"
Local $downloadUrl = "(Paste Install URL here)"
Local $downloadPath = @ScriptDir & "\" & $installerName

ConsoleWrite("Downloading Action1 agent installer..." & @CRLF)
InetGet($downloadUrl, $downloadPath, 1)

If Not FileExists($downloadPath) Then
    MsgBox(16, "Error", "Download failed. File not found at: " & $downloadPath)
    Exit 1
EndIf

ConsoleWrite("Installing Action1 agent silently..." & @CRLF)
Local $exitCode = RunWait('msiexec /i "' & $downloadPath & '" /qn /norestart', "", @SW_HIDE)

If $exitCode = 0 Then
    MsgBox(64, "Success", "Action1 agent installed successfully.")
ElseIf $exitCode = 3010 Then
    MsgBox(48, "Installed (Reboot Required)", "Agent installed successfully. Reboot is required to complete installation.")
Else
    MsgBox(16, "Install Failed", "Installation failed with exit code: " & $exitCode)
EndIf
