
Option Explicit

Dim downloadUrl, exeName, scriptFolder, exePath
Dim fso, shell, psCommand, result

' URL of the installer
downloadUrl = "(Paste Install URL here)"

Set fso   = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' Determine where this script is running
scriptFolder = fso.GetParentFolderName(WScript.ScriptFullName)

' Extract the filename from the URL
exeName = Mid(downloadUrl, InStrRev(downloadUrl, "/") + 1)
exePath = scriptFolder & "\" & exeName

' Download the EXE
WScript.Echo "Downloading " & exeName & "..."
psCommand = "powershell -Command ""Invoke-WebRequest -Uri '" & downloadUrl & "' -OutFile '" & exePath & "' -UseBasicParsing"""
result = shell.Run(psCommand, 0, True)
If result <> 0 Then
    WScript.Echo "ERROR: Download command failed (exit code " & result & ")."
    WScript.Quit 1
End If

' Verify the file exists and is non-empty
If Not fso.FileExists(exePath) Or fso.GetFile(exePath).Size = 0 Then
    WScript.Echo "ERROR: Download failed or file is empty."
    WScript.Quit 1
End If

WScript.Echo "Download complete. Launching " & exeName & "..."

' Run the EXE
shell.Run """" & exePath & """", 1, False

WScript.Quit 0
