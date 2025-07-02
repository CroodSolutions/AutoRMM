' This is an install script for AnyDesk RMM, using VBS.
' See Readme.md file for instructions.  
Option Explicit

Dim url, savePath, http, stream, shell, tempFolder, logPath

' URL of the AnyDesk MSI
url = "(Paste Install URL here)"

Set shell = CreateObject("WScript.Shell")
tempFolder = shell.ExpandEnvironmentStrings("%TEMP%")
savePath = tempFolder & "\AutoRMM.msi"
' Error log
logPath = tempFolder & "\install_log.txt"

' Download MSI
Set http = CreateObject("MSXML2.XMLHTTP")
http.Open "GET", url, False
http.Send

If http.Status = 200 Then
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 1
    stream.Open
    stream.Write http.ResponseBody
    stream.SaveToFile savePath, 2
    stream.Close
End If

' Try silent install with logging
Dim installCmd
installCmd = "msiexec /i """ & savePath & """ /qn /norestart /log """ & logPath & """"
shell.Run installCmd, 0, False

